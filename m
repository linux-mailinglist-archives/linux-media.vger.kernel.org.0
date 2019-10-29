Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C3FE8F54
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 19:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbfJ2ScF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 14:32:05 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42186 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfJ2ScE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 14:32:04 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TIOwfb171648;
        Tue, 29 Oct 2019 18:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=W5i8RaPuVxfk2wF9jP1qOXUbfa1KG3Gyj6D6MLp1DEs=;
 b=NjXdPhBDYKdqRh4Wu+tccs0Fs6vlwdxTeMtGEOX0HssoCew4FOYZNl5boTN+bpfkvgaw
 Ms5BwxZh/ABu+16yFvwO2JzCJA2MzXZ+BAlKbuKtuWGlZ5W6vUSZG28JbZqvTcbq7UPl
 RL4+BeXLYB6zBl4MEqGpfAmHy7flzJBtpKl2ecAarxa5fNlNdsM04eHMykTu/xAmAQ+A
 ZtkaVVKLeDK/T/A0WwcAU+61XwOJDBZxlS714UZvCd89pluAw6z6A/Nth8nlCYxdi94U
 2qXOie2NUdrkIqBtailmTlHCgnMkFu/h49Yuzw4R9RBbE6e4K9d4lfLMsPniYUGiTDvt vQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2vve3qb4ae-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 18:31:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TISme2036943;
        Tue, 29 Oct 2019 18:29:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2vxpfdh4tj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 18:29:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9TITq3g015039;
        Tue, 29 Oct 2019 18:29:52 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Oct 2019 11:29:51 -0700
Date:   Tue, 29 Oct 2019 21:29:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Cc:     "Andrew F. Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: Fix a warning message in dma_heap_buffer_destroy()
Message-ID: <20191029182943.GD17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290161
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290161
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first argument of WARN() is a condition so this will just print the
function name instead of the whole warning message.

Fixes: 7b87ea704fd9 ("dma-buf: heaps: Add heap helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma-buf/heaps/heap-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 750bef4e902d..a31684c0d5b2 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -52,7 +52,7 @@ static void *dma_heap_map_kernel(struct heap_helper_buffer *buffer)
 static void dma_heap_buffer_destroy(struct heap_helper_buffer *buffer)
 {
 	if (buffer->vmap_cnt > 0) {
-		WARN("%s: buffer still mapped in the kernel\n", __func__);
+		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
 		vunmap(buffer->vaddr);
 	}
 
-- 
2.20.1

