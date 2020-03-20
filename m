Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0961D18CAF0
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 10:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgCTJ4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 05:56:08 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:10454 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgCTJ4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 05:56:07 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200320095603epoutp0104c95631940fb61db5dfc77cc618c31a~9_pV-x4dy2432124321epoutp01Q
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 09:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200320095603epoutp0104c95631940fb61db5dfc77cc618c31a~9_pV-x4dy2432124321epoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584698163;
        bh=tPSY1YCVcWja2W6C6iUWJwwZl+TwyRGxsCe0oBF1IAw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Lp8AmiO+p1gfB0SNsun2rTcv4j3xhRv24rIXzPv2K+8K/I88S/kk9JM96SLKkgu+6
         6rkUjZC0hibhrupsr74qhEwiJwgTJwWnyBBmwFCtBP+JA5dUJyI5sJvULVCaY6Vz4a
         rTcDkpTQfZiUeUmg1aFCp2HV1tZrwftGqDZJN+Do=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20200320095603epcas2p1816e406265b3d44acbb845dfc1260750~9_pVxssiT2764027640epcas2p1M;
        Fri, 20 Mar 2020 09:56:03 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.189]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 48kK0d5BVrzMqYkf; Fri, 20 Mar
        2020 09:56:01 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        29.1F.04142.F23947E5; Fri, 20 Mar 2020 18:55:59 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200320095559epcas2p2732ccb391573ba99e2dd08d6c50a18f2~9_pRkNa9F2404124041epcas2p2C;
        Fri, 20 Mar 2020 09:55:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200320095559epsmtrp17b6a974798798d5601b652f1cdb2e0ac~9_pRi2XOM2370623706epsmtrp1H;
        Fri, 20 Mar 2020 09:55:59 +0000 (GMT)
X-AuditID: b6c32a46-3e1ff7000000102e-dc-5e74932f8d50
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C8.D8.04024.E23947E5; Fri, 20 Mar 2020 18:55:59 +0900 (KST)
Received: from KORDO036463 (unknown [12.36.155.134]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200320095558epsmtip1e26185effc3aae8068e81cc268b502a7~9_pRUumVw3263232632epsmtip1a;
        Fri, 20 Mar 2020 09:55:58 +0000 (GMT)
From:   =?ks_c_5601-1987?B?sei9wsO2?= <sc377.kim@samsung.com>
To:     <mchehab@kernel.org>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sc377.kim@samsung.com>
Subject: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Fri, 20 Mar 2020 18:55:58 +0900
Message-ID: <00c001d5fe9d$c19bee40$44d3cac0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdX+naBN45/Qp1YKQeqtNz/O47v16Q==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm25nHY3nya5q9rds60Y+M2bbcnJVhpDIoSigiolxHPWzWbu1s
        ZkUhXeYmlmZpuYyMLGrdl5pFdtGojJIgLCwzsAvlpZvUL2dtngn7977P+zzf+zy8H0VIykkp
        VWhxcHYLa2LICeLm9vlq+cKjjlxFZQ+jfXWnjtSWX2+K0p73j4i0NT2VKEOs8/s8pO5wow/p
        hv2zcoiNpqVGji3g7DLOkm8tKLQY0pmVa/Ur9GqNQilXpmlTGZmFNXPpTOaqHHl2oSm4jZEV
        sSZnEMpheZ5ZuGyp3ep0cDKjlXekM5ytwGRTKm3JPGvmnRZDcr7VvFipUKjUQeYWk/HA3xHS
        VhpTfN5TS5Sg9ugyFEMBToF7vjpxGZpASXALgmeeKkJofiO431UqEpq/CHyuNtG4pP9NLRIG
        rQjOdDwPS74hGH74OKoMURSJl4DnZUZIkIABAqO/xvYReBO0fhxAoToe58Dzsg9kqBbjeTB0
        7V10SErjNHjgzwrBNJ4MHbWfxIJUBQ2XTouEejbcGqojBD8yaHkhPJmAk6F61E0KnAQ46XGN
        WQN8mYTBIxfCmTOh09UVDhMP/U8aw7gUvlW4wvUO+NnXJBLEbgT7/vSQwmAReL+UopBRwHPh
        0duwuUngbg9ECzANbpdEYM+FS4GKsM9pcD/wVCRQdHD1q7QSzfFGpPRGpPRGpPRGpKlHYh9K
        5Gy82cDxKpsq8th+NPYTk7JbUEPnqjaEKcTE0idcfK4kii3id5rbEFAEk0DLDUGILmB37uLs
        Vr3daeL4NqQOHuEIIZ2Sbw3+a4tDr1SrNBpFmlqr1qi0zFTaP7F7kwQbWAe3jeNsnH1cJ6Ji
        pCWou1GS5Qys+fc6dWJe3t0bpwZWD/6gq15JNM+Oiz733F7ZNRqnH9m+DCdWF1/cW+O9ekjR
        +dq/exJ+sudcckqG/71488b69t4VVza7p2cZ4/YHZiZ9h7Pzl6+/ecU0a3jolLRQHtuMD/YW
        lze10NcrizZUKxf0jXQkxs/IOHZia8XgOkbMG1llEmHn2f8F0ZmgnwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsWy7bCSnK7+5JI4g99+Fpd3zWGz6NmwldVi
        2aY/TBbT7kxgdGDx2LSqk82jb8sqRo/Pm+QCmKO4bFJSczLLUov07RK4Mlq+/WEraOesWNY5
        k7mB8TB7FyMnh4SAicSr6zMZuxi5OIQEdjNKvDp9gqWLkQMoISnRcrgAokZY4n7LEVaImueM
        EjsOb2MEqWETsJbovOAAUiMiICHx999HdpAws0CcxL1zBiBhYQE/ielnOthAbBYBVYm362+D
        lfAKWEoc2OQKEuYVEJQ4OfMJC4jNDHRN4+FuKFteYvvbOcwQFyhI7Dj7mhFik57E1H8QI5kF
        RCRmd7YxT2AUnIVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5
        mxjBIa6luYPx8pL4Q4wCHIxKPLwz2orjhFgTy4orcw8xSnAwK4nw6qYDhXhTEiurUovy44tK
        c1KLDzFKc7AoifM+zTsWKSSQnliSmp2aWpBaBJNl4uCUamCc9n/bVfugZc18phry+ZwtVhvt
        799VD1Vckhh97kJcX5Vgj+ZM3ynOzo52qU//VAU/mnbc/trFMOmYV5bNSyrMOOYvEdWc9uth
        CzMLZ82cfVYBl73ffHSJ3XTp9ladZ4deH7da23nyQF/3ZIeQDZPMszO23lLasD3vSvX2hpSF
        75N6Yv/d7exTYinOSDTUYi4qTgQAOIi8NG0CAAA=
X-CMS-MailID: 20200320095559epcas2p2732ccb391573ba99e2dd08d6c50a18f2
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200320095559epcas2p2732ccb391573ba99e2dd08d6c50a18f2
References: <CGME20200320095559epcas2p2732ccb391573ba99e2dd08d6c50a18f2@epcas2p2.samsung.com>
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
[    7.535319] v4l2_mem2mem: disagrees about version of symbol
v4l2_event_pending
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

