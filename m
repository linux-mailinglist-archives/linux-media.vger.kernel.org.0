Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD01DC292
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 12:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390610AbfJRKSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 06:18:31 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:56099 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388560AbfJRKSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 06:18:31 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20191018101829epoutp04d8698de1fc410bf1a0dbd99781a9bd19~Otm9FniW50572805728epoutp04Z
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2019 10:18:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20191018101829epoutp04d8698de1fc410bf1a0dbd99781a9bd19~Otm9FniW50572805728epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571393909;
        bh=dSk8JPa5kW5kXgyEr7wIhif1EMT7yieZmQ48Y5Fzy1Q=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XsexphU4O6zt6jOwY2SLXN4xg9xlrSWnuZefjI2TgDS9bHfZ1VcQ38XYcV11CLK95
         T2FE8RjfoCwAicF5IQv7weSnvVuWTaKKOmpcWgDaNf9atuPvGzgCXBoJabZ9LJGrOC
         FtrScvsVgI3kaErMoqlaawwKFXuyGeaZF+1sxZ+A=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20191018101828epcas1p32367e10fecd2be8cbe95e49f235dc035~Otm8Z5ieo2286322863epcas1p3H;
        Fri, 18 Oct 2019 10:18:28 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.154]) by
        epsnrtp5.localdomain (Postfix) with ESMTP id 46vhnZ0rk2zMqYkW; Fri, 18 Oct
        2019 10:18:26 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        3A.BE.04144.27199AD5; Fri, 18 Oct 2019 19:18:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536~Otm5d5UrF2286322863epcas1p3C;
        Fri, 18 Oct 2019 10:18:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191018101825epsmtrp261d4a94f93dbce568dc78e92aa38b082~Otm5dMici2367223672epsmtrp2e;
        Fri, 18 Oct 2019 10:18:25 +0000 (GMT)
X-AuditID: b6c32a35-2c7ff70000001030-70-5da991727d46
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        46.94.04081.07199AD5; Fri, 18 Oct 2019 19:18:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191018101824epsmtip155e0cd0f1f8fdd9b72417a894fe2b01e~Otm5OSrx31057410574epsmtip1D;
        Fri, 18 Oct 2019 10:18:24 +0000 (GMT)
From:   Seung-Woo Kim <sw0312.kim@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Cc:     sw0312.kim@samsung.com
Subject: [PATCH] media: exynos4-is: Fix recursive locking in
 isp_video_release()
Date:   Fri, 18 Oct 2019 19:20:52 +0900
Message-Id: <1571394052-24446-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7bCmrm7RxJWxBnv+sFicP7+B3aJnw1ZW
        ixnn9zFZLNv0h8ni8Jt2IHfySzYHNo9NqzrZPPq2rGL0+LxJLoA5KtsmIzUxJbVIITUvOT8l
        My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB2ivkkJZYk4pUCggsbhYSd/Opii/
        tCRVISO/uMRWKbUgJafAskCvODG3uDQvXS85P9fK0MDAyBSoMCE7Y/P8z+wFv9krNkxfw9TA
        +J6ti5GDQ0LARGLCMpMuRi4OIYEdjBId8zayQjifGCUeLW4AcjiBnG+MEp9/eoLYIA3LVz1j
        hCjayyjRcPITC4TzhVHiyLbNjCBVbAI6EvuX/AYbJSLQyChx/dwEFpAEs4CUxLal69lAbGGB
        IIn7l86C2SwCqhI9L3+B2bwCbhI7ZnxkhFinILHg3ls2kEESAm9ZJb5+O84OkXCRaP6/mAnC
        FpZ4dXwLVFxK4vO7vWwQdrXE9gk/2SGaOxgletobWSASxhL7l05mAoUAs4CmxPpd+hBhRYmd
        v+cyQhzKJ/Huaw8rJJB4JTrahCBKVCR2Hp0EDTspiVkbgiHCHhLLTl9jgYRWrMSjO8/ZJjDK
        zkKYv4CRcRWjWGpBcW56arFhgSFyJG1iBCclLdMdjFPO+RxiFOBgVOLh3RGwIlaINbGsuDL3
        EKMEB7OSCG+w9cpYId6UxMqq1KL8+KLSnNTiQ4ymwMCbyCwlmpwPTJh5JfGGpkbGxsYWJoZm
        poaGSuK8jsuXxgoJpCeWpGanphakFsH0MXFwSjUwHhTd/Mp/+jon5RXq3G9MLB9/0un19/sh
        l3NM8OfnGHlOnmc/9u7gvDP7u3Z0kWv63JOCDzacTd6TwxaSfmSb0ZwHjZIvfI1+PalO8jVg
        sL9S+kQs/+W/1Q8rk3ed3Pc6aMu/mMWS4p6bAoOnPIzpV2j+p33LWD7+2jv7DVt73zCrL4mw
        3fItQomlOCPRUIu5qDgRAGoUPYRgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNJMWRmVeSWpSXmKPExsWy7bCSnG7hxJWxBpO4Lc6f38Bu0bNhK6vF
        jPP7mCyWbfrDZHH4TTuQO/klmwObx6ZVnWwefVtWMXp83iQXwBzFZZOSmpNZllqkb5fAlbF5
        /mf2gt/sFRumr2FqYHzP1sXIySEhYCKxfNUzRhBbSGA3o8S8YyoQcSmJud+2A8U5gGxhicOH
        i7sYuYBKPjFKbP83iQmkhk1AR2L/kt+sIAkRgXZGiV9bb7KDJJiBmrctXQ+2QFggQOJN52sw
        m0VAVaLn5S8wm1fATWLHjI+MEMsUJBbce8s2gZFnASPDKkbJ1ILi3PTcYsMCw7zUcr3ixNzi
        0rx0veT83E2M4CDR0tzBeHlJ/CFGAQ5GJR7eHQErYoVYE8uKK3MPMUpwMCuJ8AZbr4wV4k1J
        rKxKLcqPLyrNSS0+xCjNwaIkzvs071ikkEB6YklqdmpqQWoRTJaJg1OqgdH3c9zhY7sKfi49
        k7HlW8pHv4+PErRNgz4YS1fY8dUw/Hd/f8reQl1b66jzLWPXh2wvHjktPpzt7Pl6T+gsWdsd
        F6a5nG98ZLq9o8/i3rGvb52Zsq/uPGpSeVnAJ+tIWEZyyZr2R6GVG85mtVyNnpd7TyRwdmDS
        y6ANM6T9VXa803hS/dmBc4YSS3FGoqEWc1FxIgBZDc74DgIAAA==
X-CMS-MailID: 20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536
References: <CGME20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536@epcas1p3.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From isp_video_release(), &isp->video_lock is held and subsequent
vb2_fop_release() tries to lock vdev->lock which is same with the
previous one. Replace vb2_fop_release() with _vb2_fop_release() to
fix the recursive locking.

Fixes: 1380f5754cb0 ("[media] videobuf2: Add missing lock held on vb2_fop_release")
Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 378cc30..d2cbcdc 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -313,7 +313,7 @@ static int isp_video_release(struct file *file)
 		ivc->streaming = 0;
 	}
 
-	vb2_fop_release(file);
+	_vb2_fop_release(file, NULL);
 
 	if (v4l2_fh_is_singular_file(file)) {
 		fimc_pipeline_call(&ivc->ve, close);
-- 
1.7.4.1

