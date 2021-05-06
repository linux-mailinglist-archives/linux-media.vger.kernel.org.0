Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBD13755FE
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 16:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbhEFO6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 10:58:35 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35326 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbhEFO6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 10:58:35 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146EeG98026492;
        Thu, 6 May 2021 14:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9NwOQB/Et0NI01bmeVajBOtpbM8rx1n/lujh3iY+hRM=;
 b=fv4XoKqKWNaAS9Y9EMRylr4jDDTeoM4l5UlVL59Vq6DGcLnWPzqR1GXRAgYLviaqQos2
 k4l2luH0VmwzBZuVLXG9me1tZ3lx1xhDGYj+bL0KRSJmYsxz6SbD+snMS420whdp8COz
 63HOjlqWhqyI2UsPb6x4IaG52Qy4nqOkMT6Zyu++J1/QD8WK40rB2VhINuYfBvkv77jr
 GowpMPkiYOtLbTH1gSmCpIiynwS2xhpNNxfMcFqxt2PvrrQL21AOmBuZs4YkfHOOf2Lx
 LhOTfKRrmLvAnhGuLgjf7lmgMCDm0UJ0YgFoWHxDTD26D9CbC3dBTc8fk/6hOMb4YOBG TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 38bemjn96p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 14:57:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146EfKWl093503;
        Thu, 6 May 2021 14:57:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38bebvf2et-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 14:57:32 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 146EvVob184135;
        Thu, 6 May 2021 14:57:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38bebvf2e5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 14:57:31 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 146EvTAt004550;
        Thu, 6 May 2021 14:57:29 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 May 2021 14:57:28 +0000
Date:   Thu, 6 May 2021 17:57:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Uladzislau Rezki <urezki@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210506145722.GC1955@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
 <20210506142210.GA37570@pc638.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506142210.GA37570@pc638.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 1r7J5qZnCUGUwhTbfY8KSqVZi0gwtJS7
X-Proofpoint-GUID: 1r7J5qZnCUGUwhTbfY8KSqVZi0gwtJS7
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060107
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 04:22:10PM +0200, Uladzislau Rezki wrote:
> Seems like vmalloc() is called with zero size passed:
> 
> <snip>
> void *__vmalloc_node_range(unsigned long size, unsigned long align,
> 			unsigned long start, unsigned long end, gfp_t gfp_mask,
> 			pgprot_t prot, unsigned long vm_flags, int node,
> 			const void *caller)
> {
> 	struct vm_struct *area;
> 	void *addr;
> 	unsigned long real_size = size;
> 	unsigned long real_align = align;
> 	unsigned int shift = PAGE_SHIFT;
> 
> 2873	if (WARN_ON_ONCE(!size))
> 		return NULL;
> <snip>
> 
> from the dvb_dmx_init() driver:
> 
> <snip>
> int dvb_dmx_init(struct dvb_demux *dvbdemux)
> {
> 	int i;
> 	struct dmx_demux *dmx = &dvbdemux->dmx;
> 
> 	dvbdemux->cnt_storage = NULL;
> 	dvbdemux->users = 0;
> 1251	dvbdemux->filter = vmalloc(array_size(sizeof(struct dvb_demux_filter),
> <snip>					      dvbdemux->filternum));

Indeed.

It is a mystery because array_size() should never return less than
sizeof(struct dvb_demux_filter).  That's the whole point of the
array_size() function is that it returns ULONG_MAX if there is an
integer overflow.

regards,
dan carpenter



