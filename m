Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01725F8C00
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfKLJi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:38:57 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:41940 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfKLJi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:38:57 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20191112093854epoutp034c5fdd2a7ba5e3084921d3ee60b4212b~WYMikiVul2151021510epoutp03i
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 09:38:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20191112093854epoutp034c5fdd2a7ba5e3084921d3ee60b4212b~WYMikiVul2151021510epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1573551534;
        bh=X2O1h1TEexJVjYglTtzxC098ShK/7RIE4Px5ZPPv+Co=;
        h=From:To:Cc:Subject:Date:References:From;
        b=fzG3dTsUIjLU30Iyq0nWsMdXy4yU3SB/Wy1LwCVzhEIIb0NzEF5zyWSk7VXkhXP6u
         R4zayxs9O8P/LrX9NR/Ly4moTYV1PPefBTHQQHMROQSEW3lrm9JfQUOrHAwCvco8gz
         3xMceFge/wXsjZIG9hU3FgUlT6cnIFVYg6DQ212A=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191112093853epcas1p29d44f964c28671b1e9da7de087517809~WYMhuTSvk2042620426epcas1p2r;
        Tue, 12 Nov 2019 09:38:53 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 47C2kM11HQzMqYkn; Tue, 12 Nov
        2019 09:38:51 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        9E.AC.04085.BAD7ACD5; Tue, 12 Nov 2019 18:38:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20191112093850epcas1p31a1201fcc86997add355a7b5aeabf305~WYMepxctd2404024040epcas1p3A;
        Tue, 12 Nov 2019 09:38:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191112093850epsmtrp196297a1f82c99ac9eff0e0beee61edf8~WYMepKMeD1364713647epsmtrp1a;
        Tue, 12 Nov 2019 09:38:50 +0000 (GMT)
X-AuditID: b6c32a37-e19ff70000000ff5-32-5dca7dab957b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        70.3F.24756.AAD7ACD5; Tue, 12 Nov 2019 18:38:50 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191112093850epsmtip24423fef9bb06c287a4daa1804d30f153~WYMecECIc2176721767epsmtip23;
        Tue, 12 Nov 2019 09:38:50 +0000 (GMT)
From:   Seung-Woo Kim <sw0312.kim@samsung.com>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org
Cc:     sw0312.kim@samsung.com
Subject: [PATCH] dma-buf/sw-sync: Use unsigned type for value of
 sync_timeline
Date:   Tue, 12 Nov 2019 18:41:29 +0900
Message-Id: <1573551689-23531-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIKsWRmVeSWpSXmKPExsWy7bCmru7q2lOxBiua2C2ufH3PZrHzwS52
        iy9XHjJZXN41h82iZ8NWVotTdz+zW8yY/JLNgd3jzrU9bB73u48zedz+95jZY+ekvUwefVtW
        MXp83iQXwBaVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
        lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CyQK84Mbe4NC9dLzk/18rQ
        wMDIFKgwITtjUv8/poKlrBVTD0xiamBczNLFyMkhIWAi0X7lKpDNxSEksINR4sy6PewQzidG
        iZnPHrBBON8YJdavXMnUxcgB1rLxgSVEfC+jxPLlt1ghnC+MEktvPGYHmcsmoCOxf8lvsISI
        wAZGicYpzawgCWYBKYltS9ezgdjCAgES77ceYwaZyiKgKrFttilImFfATeLehkY2iPsUJBbc
        ewt2hYTABDaJWW3bWCESLhIbmm9BPSEs8er4FnYIW0riZX8blF0tsX3CT3aI5g5GiZ72RqgG
        Y4n9SyeDvcMsoCmxfpc+RFhRYufvuYwQd/JJvPvawwrxMa9ER5sQRImKxM6jk9ggwlISszYE
        Q4Q9JN7uWcAEYgsJxEosbW5nn8AoOwth/gJGxlWMYqkFxbnpqcWGBcbIkbSJEZy8tMx3MG44
        53OIUYCDUYmHlyHhZKwQa2JZcWXuIUYJDmYlEd4dFSdihXhTEiurUovy44tKc1KLDzGaAsNu
        IrOUaHI+MLHmlcQbmhoZGxtbmBiamRoaKonzOi5fGiskkJ5YkpqdmlqQWgTTx8TBKdXAOHPR
        tAexWbsuHVoz3df2hmBt9eQ3BnIxK/5M3br1y4xs3S+Hevltb9rdvBzkVvBH5fLrlsLWHb/m
        vbp074q+6l7NFqeZbfrbEteqySfbSzqftrlRrxMx70fuvibV7/rBt4vU4pTeb3ivZBgtK3Wt
        veV3voVCxB3W3vtKb9xKHhVJKG56HXdLW4mlOCPRUIu5qDgRAJ8BMqh0AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LZdlhJXndV7alYg96jEhZXvr5ns9j5YBe7
        xZcrD5ksLu+aw2bRs2Erq8Wpu5/ZLWZMfsnmwO5x59oeNo/73ceZPG7/e8zssXPSXiaPvi2r
        GD0+b5ILYIvisklJzcksSy3St0vgypjU/4+pYClrxdQDk5gaGBezdDFycEgImEhsfGDZxcjF
        ISSwm1Fi3pnrrF2MnEBxKYm537YzQtQISxw+XAxR84lR4uv8iUwgNWwCOhL7l/xmBUmICGxj
        lPgz/RwbSIIZqHnb0vVgtrCAn8SCFQtYQQaxCKhKbJttChLmFXCTuLehkQ1il4LEgntv2SYw
        8ixgZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcTFqaOxgvL4k/xCjAwajEw7si
        9mSsEGtiWXFl7iFGCQ5mJRHeHRUnYoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzPs07FikkkJ5Y
        kpqdmlqQWgSTZeLglGpgjLweOOlR89yWZvdD3q23HNWNn87dWc+2P7eQ9Z2u9S2ZSQ9M5K16
        DuRU3Y7VYWre/zIx48Lk4v9PpHISnwTdUfmhNdnBpi2tY7JG9IVWCTeR1U9T+mdwvFg0/5PX
        ydgl/G82qt6VM963+vabzWujJK6pfkmcl+jUPr/K2nOef0DgpljxBXI6SizFGYmGWsxFxYkA
        zGURpCICAAA=
X-CMS-MailID: 20191112093850epcas1p31a1201fcc86997add355a7b5aeabf305
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191112093850epcas1p31a1201fcc86997add355a7b5aeabf305
References: <CGME20191112093850epcas1p31a1201fcc86997add355a7b5aeabf305@epcas1p3.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value of sync_timeline is only incremented and all reference
usage of it is unsigned. Use unsigned type for value of
synctimeline.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/dma-buf/sync_debug.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52..ff07f0b 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -36,7 +36,7 @@ struct sync_timeline {
 
 	/* protected by lock */
 	u64			context;
-	int			value;
+	unsigned int		value;
 
 	struct rb_root		pt_tree;
 	struct list_head	pt_list;
-- 
1.7.4.1

