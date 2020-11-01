Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C262A1EAC
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 15:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgKAOnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 09:43:14 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:43546 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726599AbgKAOnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 09:43:12 -0500
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A1Ef8OK003998;
        Sun, 1 Nov 2020 14:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=OA1AyoIUxAdKprQIlZ9yrzznCb8iuBhc83hjN12ArsA=;
 b=mBdPD89YSLvkEUDnDJsj+qaGMRsztQ2rc9voUZLErQsV/6T9+PNh8ZGa3R2TtqjVTjVT
 stMB7T7x4y5BcOrx2SZiJIBalVZRs0gdEYCd2612RlzKR07iyN4kazjz91IMH2tnX1rP
 9uU1dF/PCEB+zcsG6w8+L3GuWx9UTLvd2/Aozg263Z42/8LxRwWV1WKxaNs8cPEnHL+Y
 aqXiXGUv8IquDpzKE1/iUStT3E7efcQ3Uzl5mSd/K7Uv2AG0rdhE9vZ6q8JxNBQudGUe
 SabI7Ige/atinoDTPARo7G5vZ8pIJPyn+0JnXdtidgr26gcCeXGawzj0PrOOu+mZBosX FA== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 34hh9wb76k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 01 Nov 2020 14:42:59 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id 79C7355;
        Sun,  1 Nov 2020 14:42:58 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net [10.33.237.8])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id 7B31947;
        Sun,  1 Nov 2020 14:42:57 +0000 (UTC)
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
Subject: [PATCH v3 2/3] drm/i915/display: Add function quirk_renderclear_reduced
Date:   Sun,  1 Nov 2020 07:42:43 -0700
Message-Id: <20201101144244.10086-3-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101144244.10086-1-rwright@hpe.com>
References: <20201101144244.10086-1-rwright@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-01_05:2020-10-30,2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 suspectscore=2 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011010120
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Wright <rwright@hpe.com>

Added function quirk_renderclear_reduced to set QUIRK_RENDERCLEAR_REDUCED
for designated platforms.  Applying QUIRK_RENDERCLEAR_REDUCED for
the HP Pavilion Mini 300-020 prevents a GPU hang.

Signed-off-by: Randy Wright <rwright@hpe.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 46beb155d835..630b984ba49c 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct drm_i915_private *i915)
 	drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n");
 }
 
+/*
+ * Force use of smaller batch size in gen7_renderclear.c
+ * Needed on (at least) HP Pavilion Mini 300-020 to avoid GPU hang.
+ */
+static void quirk_renderclear_reduced(struct drm_i915_private *i915)
+{
+	i915->quirks |= QUIRK_RENDERCLEAR_REDUCED;
+	drm_info(&i915->drm, "Applying Renderclear Reduced quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -141,6 +151,9 @@ static struct intel_quirk intel_quirks[] = {
 	/* HP Chromebook 14 (Celeron 2955U) */
 	{ 0x0a06, 0x103c, 0x21ed, quirk_backlight_present },
 
+	/* HP Mini 300-020 */
+	{ 0x0a06, 0x103c, 0x2b38, quirk_renderclear_reduced },
+
 	/* Dell Chromebook 11 */
 	{ 0x0a06, 0x1028, 0x0a35, quirk_backlight_present },
 
-- 
2.25.1

