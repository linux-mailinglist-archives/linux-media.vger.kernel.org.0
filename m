Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB918193B98
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 10:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCZJRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 05:17:39 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:15445 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbgCZJRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 05:17:39 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200326091736epoutp01d4a1961d1ec940a32052fbafb047cdc9~-z-e7HoAl3103931039epoutp01R
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 09:17:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200326091736epoutp01d4a1961d1ec940a32052fbafb047cdc9~-z-e7HoAl3103931039epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585214256;
        bh=onuYfqDYIOCuYPJgDNR7ttwIKwGYq/9ECZgsogSZ2n0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ckeM8v59cRn1tB2Kznx1rRKhO7g2SmZwqNfQi+iJ1KSgZc34l102E9YBNGNo5uL0x
         wvIZmQuiiGs85oMgX6ajZ16M1fTNeJwUHbXCTfCGa+ZRyz6fyJS2xOr+xv/nlGYDPg
         HXvFWUUYCj2YgoHFCd0O/usRQQsfjOYr30RCLryg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20200326091736epcas2p4512b097c588a20a997677fd7654d5681~-z-ej2Rv22126021260epcas2p4I;
        Thu, 26 Mar 2020 09:17:36 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.186]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 48nzsV2RNZzMqYkf; Thu, 26 Mar
        2020 09:17:34 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B5.17.04142.C237C7E5; Thu, 26 Mar 2020 18:17:32 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326091732epcas2p2be24b70dca0039b10b828e8b9102f6bf~-z-a2xUAt1413814138epcas2p2P;
        Thu, 26 Mar 2020 09:17:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326091732epsmtrp2d6626bb580590dbc1055f468101fa012~-z-a1sK_71240612406epsmtrp2c;
        Thu, 26 Mar 2020 09:17:32 +0000 (GMT)
X-AuditID: b6c32a46-3e1ff7000000102e-29-5e7c732ce5db
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BF.F7.04158.C237C7E5; Thu, 26 Mar 2020 18:17:32 +0900 (KST)
Received: from KEI.dsn.sec.samsung.com (unknown [12.36.155.227]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200326091732epsmtip2773add7b7a4f68e550b3e8f207f07426~-z-ar8gQM2849628496epsmtip2e;
        Thu, 26 Mar 2020 09:17:32 +0000 (GMT)
From:   Seungchul Kim <sc377.kim@samsung.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Seungchul Kim <sc377.kim@samsung.com>
Subject: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Thu, 26 Mar 2020 18:09:46 +0900
Message-Id: <1585213786-39068-1-git-send-email-sc377.kim@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7bCmma5OcU2cwdxZBhaXd81hs+jZsJXV
        YtmmP0wW0+5MYHRg8di0qpPNo2/LKkaPz5vkApijcmwyUhNTUosUUvOS81My89JtlbyD453j
        Tc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgLYpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yV
        UgtScgoMDQv0ihNzi0vz0vWS83OtDA0MjEyBKhNyMq51rWcraOKvWDhjA0sD42GeLkZODgkB
        E4mvjb/Yuxi5OIQEdjBK3L/xiRUkISTwiVHi2hxXiMQ3RokNN68xwXS8fHkdqmMvo8TsdeeY
        IDq+MkqcW58NYrMJaEtcXT2PGcQWEdCTeL75IguIzSyQJjH3RgtYvbBAgMSZrvtsIDaLgKrE
        xqO3GUFsXgFXiUWrXrJDLJOTuHmukxlkmYTAQ1aJA48/QCVcJA7/3cwMYQtLvDq+BSouJfH5
        3V42CLtc4sOjrUwQzR2MEk1f70AljCVmPWsH2sYBdJGmxPpd+iCmhICyxJFbUHfySXQc/ssO
        EeaV6GgTgmhUllj9tx9qq6TE/r8noGHiIXHs5WZoMMRKTG+bzjaBUXYWwvwFjIyrGMVSC4pz
        01OLjQqMkONoEyM4AWm57WBccs7nEKMAB6MSD+8Gy+o4IdbEsuLK3EOMEhzMSiK8TyNr4oR4
        UxIrq1KL8uOLSnNSiw8xmgIDbyKzlGhyPjA55pXEG5oamZkZWJpamJoZWSiJ827ivhkjJJCe
        WJKanZpakFoE08fEwSnVwLj2me2mY/GreN7MOlFz5MLnpvjOCVuCDi9Z29rCmHF5wnHf41Gx
        p1InKJ4s+Mbg6SL7awGL8Cm1yQ05iWV5M33TnQRkG9RZ7epV3Hbu2Vn1kd+7xE9upW4US+T9
        NzFc/84ZrX1bHB/JZuj2eUKaIsPZjZ+iay+q1Wbv4E53MdzVlvRr0eqHi5RYijMSDbWYi4oT
        ATtKgDxWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEJMWRmVeSWpSXmKPExsWy7bCSvK5OcU2cwf0nghaXd81hs+jZsJXV
        YtmmP0wW0+5MYHRg8di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDKuda1nK2jir1g4
        YwNLA+Nhni5GTg4JAROJly+vs3cxcnEICexmlPjR8RnI4QBKSEq0HC6AqBGWuN9yhBWi5jOj
        xPVZs9lAEmwC2hJXV89jBrFFBPQknm++yAJiMwtkSJzceowdxBYW8JOYfqYDrJ5FQFVi49Hb
        jCA2r4CrxKJVL9khFshJ3DzXyTyBkWcBI8MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95Pzc
        TYzgkNDS2sF44kT8IUYBDkYlHt4I8+o4IdbEsuLK3EOMEhzMSiK8TyNr4oR4UxIrq1KL8uOL
        SnNSiw8xSnOwKInzyucfixQSSE8sSc1OTS1ILYLJMnFwSjUwln15yOjsvCXo6SVJ5TOryx58
        s5YUFzc5mrQq/sayJCMGRt9Z4Xa3JDSywtYcvfvLxLBDpvKafoHns51iBmubq9ylF904uH3z
        pRlJORu3lvyVOf/lwtSHpQt9/301XJ1o+TXfTH+GXkDUiRUXrpnnHVW9td7tVJJeD2/9VT2d
        2ndmG5XPnr4rp8RSnJFoqMVcVJwIAFvxPeAFAgAA
X-CMS-MailID: 20200326091732epcas2p2be24b70dca0039b10b828e8b9102f6bf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200326091732epcas2p2be24b70dca0039b10b828e8b9102f6bf
References: <CGME20200326091732epcas2p2be24b70dca0039b10b828e8b9102f6bf@epcas2p2.samsung.com>
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
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-fh.h              | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index fbcc7a2..befafcd 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2800,13 +2800,11 @@ static struct mutex *v4l2_ioctl_get_lock(struct video_device *vdev,
 {
 	if (_IOC_NR(cmd) >= V4L2_IOCTLS)
 		return vdev->lock;
-#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
 	if (vfh && vfh->m2m_ctx &&
 	    (v4l2_ioctls[_IOC_NR(cmd)].flags & INFO_FL_QUEUE)) {
 		if (vfh->m2m_ctx->q_lock)
 			return vfh->m2m_ctx->q_lock;
 	}
-#endif
 	if (vdev->queue && vdev->queue->lock &&
 			(v4l2_ioctls[_IOC_NR(cmd)].flags & INFO_FL_QUEUE))
 		return vdev->queue->lock;
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

