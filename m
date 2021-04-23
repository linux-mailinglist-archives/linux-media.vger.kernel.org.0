Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894AC36916F
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 13:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhDWLpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 07:45:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34338 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhDWLpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 07:45:10 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13NBVEr5060773;
        Fri, 23 Apr 2021 11:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Qe97OX3EAUMhjDMxaqd10XLDg7AuaUKfgZcNYIo94OE=;
 b=UfIdXIuJA8WU8A5lCZsdbRv+Td1OuoWihKs8NhHMa+TduP5ekrQYEbLGc5qE+/Ayza+x
 ew7owXVnBYpBSpNfOxXkEyapzept3ZOnT9XCivvMVoSjp7Bmy3UaC4c/dTG0axTzTTHF
 TFI6PJzAuVHIwKv67X2+huOUp4ejBlFw/64UvIu7BGm0VCBz+2fULPoSlO0fv/vsYy4T
 730ebxbi4bmeFb7vzcF4GBfz/x+yJPONOyJ0BImZ5H0IMRkJGQMAiW7yG6F18hHms/J1
 0X6+GHhCr096QwvZfFnNn9CNWPW6Tz6u5c6t3g6NMEx8rO/1FBCjZHRJ783X0D5qETt4 Ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 37yveaqtqb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Apr 2021 11:44:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13NBfUNI183443;
        Fri, 23 Apr 2021 11:44:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 383cbf2tvt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Apr 2021 11:44:27 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13NBiQDe004294;
        Fri, 23 Apr 2021 11:44:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 383cbf2tvj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Apr 2021 11:44:26 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13NBiPxv005484;
        Fri, 23 Apr 2021 11:44:25 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 23 Apr 2021 04:44:24 -0700
Date:   Fri, 23 Apr 2021 14:44:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     p.zabel@pengutronix.de
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: coda: jpeg: add CODA960 JPEG encoder support
Message-ID: <YIKzER9cE+h0kI2l@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: IIzmkAnotGgmctqNPG3MLnVQudHqhwSx
X-Proofpoint-ORIG-GUID: IIzmkAnotGgmctqNPG3MLnVQudHqhwSx
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230074
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Philipp Zabel,

The patch 96f6f62c4656: "media: coda: jpeg: add CODA960 JPEG encoder
support" from Dec 12, 2019, leads to the following static checker
warning:

	drivers/media/platform/coda/coda-jpeg.c:621 coda9_jpeg_gen_enc_huff_tab()
	warn: check that incremented offset 'k' is capped

drivers/media/platform/coda/coda-jpeg.c
   582  static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
   583                                         int *ehufsi, int *ehufco)
   584  {
   585          int i, j, k, lastk, si, code, maxsymbol;
   586          const u8 *bits, *huffval;
   587          struct {
   588                  int size[256];
   589                  int code[256];
   590          } *huff;
   591          static const unsigned char *huff_tabs[4] = {
   592                  luma_dc, luma_ac, chroma_dc, chroma_ac,
   593          };
   594          int ret = -EINVAL;
   595  
   596          huff = kzalloc(sizeof(*huff), GFP_KERNEL);

huff->size[] is a 256 byte array of zero.

   597          if (!huff)
   598                  return -ENOMEM;
   599  
   600          bits = huff_tabs[tab_num];
   601          huffval = huff_tabs[tab_num] + 16;
   602  
   603          maxsymbol = tab_num & 1 ? 256 : 16;
   604  
   605          /* Figure C.1 - Generation of table of Huffman code sizes */
   606          k = 0;
   607          for (i = 1; i <= 16; i++) {
   608                  j = bits[i - 1];
   609                  if (k + j > maxsymbol)
   610                          goto out;
   611                  while (j--)
   612                          huff->size[k++] = i;
                                ^^^^^^^^^^^^^^^^^^^
We're filling potentially up to to maxsymbol (256) with i.

   613          }
   614          lastk = k;
   615  
   616          /* Figure C.2 - Generation of table of Huffman codes */
   617          k = 0;
   618          code = 0;
   619          si = huff->size[0];
   620          while (k < lastk) {
   621                  while (huff->size[k] == si) {
                               ^^^^^^^^^^^^^^^^^^^
I'm not sure I have understood this code, but I think maybe we do need
to if (k < lastk && huff->size[k] == si) {

   622                          huff->code[k++] = code;
   623                          code++;
   624                  }
   625                  if (code >= (1 << si))
   626                          goto out;
   627                  code <<= 1;
   628                  si++;
   629          }
   630  
   631          /* Figure C.3 - Ordering procedure for encoding procedure code tables */
   632          for (k = 0; k < lastk; k++) {
   633                  i = huffval[k];
   634                  if (i >= maxsymbol || ehufsi[i])
   635                          goto out;
   636                  ehufco[i] = huff->code[k];
   637                  ehufsi[i] = huff->size[k];
   638          }
   639  
   640          ret = 0;
   641  out:
   642          kfree(huff);
   643          return ret;
   644  }

regards,
dan carpenter
