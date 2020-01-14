Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182CD13A06C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 06:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgANFKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 00:10:21 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60254 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgANFKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 00:10:21 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E53u6M065284;
        Tue, 14 Jan 2020 05:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=t5sAJiY39rW/ek9JECHLXl/bJS25lwDROySS7gkpZgY=;
 b=oSvYhbOn4Jg9so5RP4iJt5RjBZb1oE3B06FCvAsf+zps8OPjS3ZjkWKOMbKW4e3tQrvi
 8HUEQvjXjIEMzzSH9Zc+Pjt9AKt/6pESaJXqaBRZ7D5F25/qicSg7CwCZosG14ozXLoT
 /8OEB64kxsG/dA+jqRc+ugx03MAnwZyK8eT5U3t/iTfTuesFhJlg3wz9fNIB0YyxyE4B
 roMVh0ecyjD5agfQe4h6MOvqBj5c7M2T4UEWZQKB1cz7+nDDb6qlKcR9lLKPfbu0Ivdc
 B9N/xn16AGPfmVxX5JkMNSm/8w8fV4CywTkS7KReUxZOLLxK2gqXBQZ1v8JoCtXbb6JV AA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2xf73tkfd7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 05:10:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E53Ubm165187;
        Tue, 14 Jan 2020 05:10:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2xh2tn2g1w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 05:10:15 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00E5AEL0016746;
        Tue, 14 Jan 2020 05:10:14 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 21:10:13 -0800
Date:   Tue, 14 Jan 2020 08:10:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrice Chotard <patrice.chotard@st.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: c8sectpfe: clean up some indenting
Message-ID: <20200114051005.njxf5d6s6ycyxhfi@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140044
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001140044
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "seg_num," line wasn't indented.  All the arguments can fit nicely
on two lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 5baada4f65e5..d1518a6770fa 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -1034,9 +1034,8 @@ static void load_imem_segment(struct c8sectpfei *fei, Elf32_Phdr *phdr,
 
 	dev_dbg(fei->dev,
 		"Loading IMEM segment %d 0x%08x\n\t (0x%x bytes) -> 0x%p (0x%x bytes)\n",
-seg_num,
-		phdr->p_paddr, phdr->p_filesz,
-		dest, phdr->p_memsz + phdr->p_memsz / 3);
+		seg_num, phdr->p_paddr, phdr->p_filesz, dest,
+		phdr->p_memsz + phdr->p_memsz / 3);
 
 	for (i = 0; i < phdr->p_filesz; i++) {
 
-- 
2.11.0

