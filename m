Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 852DC5847B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 16:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfF0Oat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 10:30:49 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35382 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfF0Oas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 10:30:48 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RESoaJ138944;
        Thu, 27 Jun 2019 14:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=KRamBT0XEV9Jnqz94DX15rU8301IM63F9RXZAZ6NFF4=;
 b=H3kkjFus5WWBkjF36q4i/k4RqTUDXPs5pSzbmb1dUYLnOzgMnI6MwKTeJFO018Hp6hPR
 uMsIO+ObDTZ6ibPf8o+/QG/p1kJyKzGDUgiWTd0luwUVXOQrp63nMPaH+EqLg33RCTAP
 J4G6PmTKVN1tjvOooWPSZxpoFQfOPPgRB1wgXXbxwMXozosJfBft3/VqTCq+/8P8cbwe
 UJrcf3X4bTy8sS3ubkbEsrk6UOWQnoUaWHNeyGC+XNvKyPnwJbQmbaeUpWD/aNxQdpQY
 jM7v/PGWRU1ptSEYdJcF08yaa9R4O/vfTMsYHNsK2kZAoDgarE/DbHQoFMvJeZ4dIvh5 CQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2t9c9q0pkv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 14:30:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5REU0F0057090;
        Thu, 27 Jun 2019 14:30:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2t99f5211a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 14:30:46 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5REUjwS021484;
        Thu, 27 Jun 2019 14:30:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 07:30:45 -0700
Date:   Thu, 27 Jun 2019 17:30:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-media@vger.kernel.org
Cc:     james.harper@ejbdigital.com.au
Subject: [bug report] [media] vmalloc_sg: make sure all pages in vmalloc area
 are really DMA-ready
Message-ID: <20190627143038.GA6394@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9301 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=984
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270168
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9301 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270169
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi linux-media devs, this is similar to one of HCH's patches that
hasn't been applied yet.

The patch 7b4eeed174b7: "[media] vmalloc_sg: make sure all pages in
vmalloc area are really DMA-ready" from Jun 12, 2014, leads to the
following static checker warning:

	drivers/media/v4l2-core/videobuf-dma-sg.c:236 videobuf_dma_init_kernel()
	error: 'addr' came from dma_alloc_coherent() so we can't do virt_to_phys()

drivers/media/v4l2-core/videobuf-dma-sg.c
   210  static int videobuf_dma_init_kernel(struct videobuf_dmabuf *dma, int direction,
   211                               int nr_pages)
   212  {
   213          int i;
   214  
   215          dprintk(1, "init kernel [%d pages]\n", nr_pages);
   216  
   217          dma->direction = direction;
   218          dma->vaddr_pages = kcalloc(nr_pages, sizeof(*dma->vaddr_pages),
   219                                     GFP_KERNEL);
   220          if (!dma->vaddr_pages)
   221                  return -ENOMEM;
   222  
   223          dma->dma_addr = kcalloc(nr_pages, sizeof(*dma->dma_addr), GFP_KERNEL);
   224          if (!dma->dma_addr) {
   225                  kfree(dma->vaddr_pages);
   226                  return -ENOMEM;
   227          }
   228          for (i = 0; i < nr_pages; i++) {
   229                  void *addr;
   230  
   231                  addr = dma_alloc_coherent(dma->dev, PAGE_SIZE,
                        ^^^^^^^^^^^^^^^^^^^^^^^^^

   232                                            &(dma->dma_addr[i]), GFP_KERNEL);
   233                  if (addr == NULL)
   234                          goto out_free_pages;
   235  
   236                  dma->vaddr_pages[i] = virt_to_page(addr);
                                              ^^^^^^^^^^^^^^^^^^
Apparently this isn't allowed.

   237          }
   238          dma->vaddr = vmap(dma->vaddr_pages, nr_pages, VM_MAP | VM_IOREMAP,
   239                            PAGE_KERNEL);
   240          if (NULL == dma->vaddr) {
   241                  dprintk(1, "vmalloc_32(%d pages) failed\n", nr_pages);
   242                  goto out_free_pages;
   243          }
   244  
   245          dprintk(1, "vmalloc is at addr %p, size=%d\n",
   246                  dma->vaddr, nr_pages << PAGE_SHIFT);
   247  
   248          memset(dma->vaddr, 0, nr_pages << PAGE_SHIFT);
   249          dma->nr_pages = nr_pages;
   250  
   251          return 0;
   252  out_free_pages:
   253          while (i > 0) {
   254                  void *addr;

regards,
dan carpenter
