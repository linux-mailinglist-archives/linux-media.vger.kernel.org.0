Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47AC318C541
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 03:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCTCZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 22:25:23 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:14764 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgCTCZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 22:25:23 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200320022520epoutp044815172f1a27213a5a653498399558c2~94fz_Fl580646206462epoutp04r
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 02:25:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200320022520epoutp044815172f1a27213a5a653498399558c2~94fz_Fl580646206462epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584671120;
        bh=HesHIhTOkXFLSniSRlUirXX+eZ+4Ng8C/JZymLphEl0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=pzjIE7miu36pQLcA2Ud2DZYu8t9ggOLCGHIDuW3rhWfoFlUvz9E4UdC3wS2MaWHtm
         jxINLTZ2/ZPzdCNpeZREe/OLCoWTyY4RqWHKzthaZG2IIG3DteQKmkTAZ1C8SL2Uwy
         DFQatOxjY152u4KfCHVoypJ9JN1UzglZ50UXIYw8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20200320022519epcas2p2007a9d6a02bc9586e6694093972434d2~94fzT5qDc3060430604epcas2p2w;
        Fri, 20 Mar 2020 02:25:19 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.185]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 48k70Q11ZZzMqYkf; Fri, 20 Mar
        2020 02:25:10 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        93.6D.04128.D69247E5; Fri, 20 Mar 2020 11:24:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20200320022445epcas2p40ea2f166aff45e67825b3e1a4e2308dd~94fTDfrLw0324703247epcas2p4e;
        Fri, 20 Mar 2020 02:24:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200320022445epsmtrp1acb1cc4a01c8b9005e8fdba2453e9a2c~94fTC5nAU0813708137epsmtrp17;
        Fri, 20 Mar 2020 02:24:45 +0000 (GMT)
X-AuditID: b6c32a45-f9bff70000001020-72-5e74296d5b9e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        60.64.04158.D69247E5; Fri, 20 Mar 2020 11:24:45 +0900 (KST)
Received: from KEI.dsn.sec.samsung.com (unknown [12.36.155.227]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200320022445epsmtip108039125cbfb3d4529d58879b1e1088f~94fS6_g1j2420024200epsmtip1N;
        Fri, 20 Mar 2020 02:24:45 +0000 (GMT)
From:   Seungchul Kim <sc377.kim@samsung.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Seungchul Kim <sc377.kim@samsung.com>
Subject: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Fri, 20 Mar 2020 11:16:43 +0900
Message-Id: <1584670603-19837-1-git-send-email-sc377.kim@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7bCmmW6uZkmcwfbHqhaXd81hs+jZsJXV
        YtmmP0wW0+5MYHRg8di0qpPNo2/LKkaPz5vkApijcmwyUhNTUosUUvOS81My89JtlbyD453j
        Tc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgLYpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yV
        UgtScgoMDQv0ihNzi0vz0vWS83OtDA0MjEyBKhNyMjqfz2QraOOsWNY5k7mB8TB7FyMnh4SA
        icSyiWfYuhi5OIQEdjBK/Ns5hQnC+cQo8erGTjaQKiGBb4wSCxf7wXS8m7ufGaJoL6PE2alb
        WCGcr4wSv09PYAKpYhPQlri6eh4ziC0ioCfxfPNFFhCbWSBNYu6NFrAaYYEAiTNd98E2sAio
        Snx4fZERxOYVcJVouHWCFWKbnMTNc51g2yQEHrJKPL3+kBki4SJxZ/V5KFtY4tXxLVAPSUm8
        7G+DssslPjzaygTR3MEo0fT1DhtEwlhi1rN2oG0cQBdpSqzfpQ9iSggoSxy5BXUnn0TH4b/s
        EGFeiY42IYhGZYnVf/uhtkpK7P97ggnC9pCYs2MjKySwYiVaHj5nncAoOwth/gJGxlWMYqkF
        xbnpqcVGBYbIkbSJEZyCtFx3MM4453OIUYCDUYmH16GlOE6INbGsuDL3EKMEB7OSCK9uOlCI
        NyWxsiq1KD++qDQntfgQoykw8CYyS4km5wPTY15JvKGpkZmZgaWphamZkYWSOO9m7psxQgLp
        iSWp2ampBalFMH1MHJxSDYwS/C+y48WN7zdWx7y4opuV9EA8MKNZOSP0HIffFxmTS8yfykOq
        PXpeCm7mXO+oKqq733vX29qrfw8bc/608grQKyiUftfM4W4RO+uYf1uK4gTddRNdlvU+NawI
        6HHb6zBRdiP7QrfFbxK+FGh8kF/RPk1jwwtWiUlTr3I41k9nXNzbEnKZV4mlOCPRUIu5qDgR
        ALcm1/pXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEJMWRmVeSWpSXmKPExsWy7bCSnG6uZkmcwaEzfBaXd81hs+jZsJXV
        YtmmP0wW0+5MYHRg8di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDI6n89kK2jjrFjW
        OZO5gfEwexcjJ4eEgInEu7n7mbsYuTiEBHYzSvyfeIKxi5EDKCEp0XK4AKJGWOJ+yxFWiJrP
        jBKLNrSBNbMJaEtcXT2PGcQWEdCTeL75IguIzSyQIXFy6zGwGmEBP4npZzrYQGwWAVWJD68v
        MoLYvAKuEg23TrBCLJCTuHmuk3kCI88CRoZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5
        mxjBIaGltYPxxIn4Q4wCHIxKPLwOLcVxQqyJZcWVuYcYJTiYlUR4ddOBQrwpiZVVqUX58UWl
        OanFhxilOViUxHnl849FCgmkJ5akZqemFqQWwWSZODilGhht1XonN33ny7Bpfaw4Z1lAn8qV
        pFMW2fP2nGaYlPxm8kKrmU9D7H37pBZyWpQsum4ZunRHysJ1jbOW3hPJvPbjSWnWtkL1+6rv
        Xnsd2Pb1XsOaK8f9pvNvTAjsjLcxPKMt5jJV6/1eti6WULt+K0//2C+y677G1/lseHS9o8PE
        lcFd1slVaJ0SS3FGoqEWc1FxIgBh+4dwBQIAAA==
X-CMS-MailID: 20200320022445epcas2p40ea2f166aff45e67825b3e1a4e2308dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200320022445epcas2p40ea2f166aff45e67825b3e1a4e2308dd
References: <CGME20200320022445epcas2p40ea2f166aff45e67825b3e1a4e2308dd@epcas2p4.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module,
it can make the mismatch of v4l2_fh sturct.

By the mismatch, the following error occurs.
===============================
[    7.533506] v4l2_mem2mem: disagrees about version of symbol video_devdata
[    7.533594] v4l2_mem2mem: Unknown symbol video_devdata (err -22)
[    7.535319] v4l2_mem2mem: disagrees about version of symbol v4l2_event_pending
[    7.542532] v4l2_mem2mem: Unknown symbol v4l2_event_pending (err -22)
===============================

So v4l2_fh struct is modified to does not have dependency
for CONFIG_V4L2_MEM2MEM_DEV.

Signed-off-by: Seungchul Kim <sc377.kim@samsung.com>
---
 include/media/v4l2-fh.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index 53b4dbb..b5b3e00 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -53,9 +53,7 @@ struct v4l2_fh {
 	unsigned int		navailable;
 	u32			sequence;
 
-#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
 	struct v4l2_m2m_ctx	*m2m_ctx;
-#endif
 };
 
 /**
-- 
2.7.4

