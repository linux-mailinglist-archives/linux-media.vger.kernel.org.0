Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500752A209E
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 18:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbgKARmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 12:42:10 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:31358 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727024AbgKARmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 12:42:09 -0500
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A1HbMp3016477;
        Sun, 1 Nov 2020 17:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=kx2Vnw7P3Ro6SqdUG6oTQ7t5SJMOmmqS0+YD+3z0xdo=;
 b=HRUmIoz80H8Q7VCpXeH01InoCdc92tYsAwU32engmfWnbdaxGz3MtvS3Ss1pl7Bz8LSx
 EGj71j9haVAS6ewqOwbBcRLmPG7pLTn8IGZE8O31EvY/bGPaxKzzp1gtmLHUOv72TOGb
 Bu+UQ/3kGTh55E9Ghj9KKlcAcvZpBQX6jGV1Ihw5vCwcvFYcoUSDot3FrK4DyvDv4o+X
 2JvomozIlUKDjcx1hLD0MOxTf/BYcA2+LkKRndnGd2SQaaPpkM6KYSNAPcgxQr5AEbQY
 O1UVXmSEyVQmVkcyI6u4jW3G2Wy9rxpCxQZP1cnLHKua82jpjM/CZ0kCI5R1GQFAxK5u ag== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
        by mx0b-002e3701.pphosted.com with ESMTP id 34h07grc2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 01 Nov 2020 17:41:54 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2354.austin.hpe.com (Postfix) with ESMTP id 52A47AE;
        Sun,  1 Nov 2020 17:41:53 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net [10.33.237.8])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 4A83336;
        Sun,  1 Nov 2020 17:41:52 +0000 (UTC)
From:   rwright@hpe.com
To:     jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        hdegoede@redhat.com, wambui.karugax@gmail.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        akeem.g.abodunrin@intel.com, prathap.kumar.valsan@intel.com,
        mika.kuoppala@linux.intel.com, rwright@hpe.com
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 3/3] drm/i915/gt: Force reduced batch size if new QUIRK_RENDERCLEAR_REDUCED is set.
Date:   Sun,  1 Nov 2020 10:41:32 -0700
Message-Id: <20201101174132.10513-4-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101174132.10513-1-rwright@hpe.com>
References: <20201101174132.10513-1-rwright@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-01_05:2020-10-30,2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=2 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=987 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011010145
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Wright <rwright@hpe.com>

In function batch_get_defaults, the smaller batch size
will be selected if QUIRK_RENDERCLEAR_REDUCED is set.

Signed-off-by: Randy Wright <rwright@hpe.com>
---
 drivers/gpu/drm/i915/gt/gen7_renderclear.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
index d93d85cd3027..e5265cdf696b 100644
--- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
+++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
@@ -49,7 +49,7 @@ struct batch_vals {
 static void
 batch_get_defaults(struct drm_i915_private *i915, struct batch_vals *bv)
 {
-	if (IS_HASWELL(i915)) {
+	if (IS_HASWELL(i915) && !(i915->quirks & QUIRK_RENDERCLEAR_REDUCED)) {
 		bv->max_primitives = 280;
 		bv->max_urb_entries = MAX_URB_ENTRIES;
 		bv->surface_height = 16 * 16;
-- 
2.25.1

