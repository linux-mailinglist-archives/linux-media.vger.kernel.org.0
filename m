Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A143236D5A2
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239209AbhD1KTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:19:33 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48417 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236343AbhD1KTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:19:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bhHFlUpapk1MGbhHLlO0d4; Wed, 28 Apr 2021 12:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619605127; bh=nt6/rlvoce2bs6rZFQsnraLSutdQvSgUSKhsY4/5Bbg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=RYfLCldyk0dyUbkt5wsHE1bB9H9IPRDyUlmfYgQc1cLBr1inEuHcCYFnvTSZDtzYg
         KTzZ7R3+E9odMSWxt3vV2yHqEwZ5ltjZvH400EsW9zi7rEM94fWuUZAHzPDVJ2F6OE
         9PYbIJWhq7SkHhTR2Ty2GI2ajB7bo6ST7ZfWqFwhlRU+DiKdEYgRi5s8w5GtR8aP3z
         y9habyr/7JVcsaXCVnf4LRY0ORQww14h7xhpkjrqqGxFcP1UfCHEL1ZLQkpsILGM7Z
         T4EFKPr72/xDnHIhb3DlzcZQYEqUi/PZLaOaFVDNvgEBenOfC6g1LjrIDneuhCPG1X
         fsq6wZ2Lntg6g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 5/5] vivid: add dynamic array test control
Date:   Wed, 28 Apr 2021 12:18:41 +0200
Message-Id: <20210428101841.696059-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
References: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfInoWTSa9uA8IlVB1DRd/QOYrlb8CaXXFV0IJDu/ZUEW0k7dMrVtQpew9UCaM40YoEtwOjSdVagoxoMWMIqMh9Qt4fDOC2SdSJcL0GjlGPsh+N1NsKqQ
 6B3BLZdfUDgfV5wnEem2TyGF85xH8Zn+MiXbk521UYA69Pl10WcbAmwPdJ3O2anWGDkZiCKzwOUoDgAOpA2JstTUZU+CLGUik++A1XqwY/8YxKbuRu1ipIK8
 7h1Typ1vh03I99oIfyOe9UKSOtYTdEvuftUWyix+paPBsxRLVGYC3Xji9cTDdjq+uCbjNsDVs5hX9SaLXRwYmP43IkRvPhDcjia+eV+VBZs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a dynamic array test control to help test support for this
feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8dc50fe22972..e9272eab1451 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -34,6 +34,7 @@
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.dims = { 1 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U32_DYN_ARRAY,
+	.name = "U32 Dynamic Array",
+	.type = V4L2_CTRL_TYPE_U32,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+	.def = 50,
+	.min = 10,
+	.max = 90,
+	.step = 1,
+	.dims = { 100 },
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U16_MATRIX,
@@ -1616,6 +1630,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
 
-- 
2.30.2

