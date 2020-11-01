Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DE62A1EAD
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 15:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKAOnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 09:43:14 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:9800 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726499AbgKAOnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 09:43:11 -0500
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A1EfRVL014563;
        Sun, 1 Nov 2020 14:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=XKYXzHc3s326T/Mq3Yl8HKAAp7g4arn3+L3mg5rGF5E=;
 b=nLUHBqPH4AjQP9JlgPU/qZ6d7AKfISv/vhS8v+LPRZXnM3b6H7U4XNjxwo+6SrTz4eRE
 xuTWzV6jqO7vcBYyL4jXWGC8dHnxet7puH7ZHQlSDMCApefPG85VQE3bH70bwtEpsaLZ
 LriMBvXiksOjNoaj09E1NKd6jRuPgZQUoBewrXlvAV9b+m2cUvspIlabWCRpzKMSACx2
 DLvIwsOZeBX+559jKDdbzd124G4SJmT++UchhnqK49orIr3yVH23DXXNMAfvTuuI2PKX
 nDeSc8SRhLrmDXoFE5ppZVKjqE0rFC5wVvyKJVfWNZBsyLXZLO93k4VLGsifO5+sgJs4 TA== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com with ESMTP id 34h069fhkr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 01 Nov 2020 14:42:55 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id D7DCB56;
        Sun,  1 Nov 2020 14:42:54 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net [10.33.237.8])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id C94D245;
        Sun,  1 Nov 2020 14:42:53 +0000 (UTC)
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
Subject: [PATCH v3 1/3] drm/i915: Introduce quirk QUIRK_RENDERCLEAR_REDUCED
Date:   Sun,  1 Nov 2020 07:42:42 -0700
Message-Id: <20201101144244.10086-2-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101144244.10086-1-rwright@hpe.com>
References: <20201101144244.10086-1-rwright@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-01_05:2020-10-30,2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=2 mlxlogscore=750 mlxscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011010120
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Wright <rwright@hpe.com>

Introduce quirk QUIRK_RENDERCLEAR_REDUCED, which will be used
to force a limited batch buffer size for clearing
residual contexts in gen7_renderclear.c.

Signed-off-by: Randy Wright <rwright@hpe.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e4f7f6518945..e8873462eb2c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -525,6 +525,7 @@ struct i915_psr {
 #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
 #define QUIRK_INCREASE_T12_DELAY (1<<6)
 #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
+#define QUIRK_RENDERCLEAR_REDUCED (1<<8)
 
 struct intel_fbdev;
 struct intel_fbc_work;
-- 
2.25.1

