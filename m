Return-Path: <linux-media+bounces-65930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y7waAN5bQmqM5QkAu9opvQ
	(envelope-from <linux-media+bounces-65930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:49:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974D6D9A37
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:49:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=j9MY6jtq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65930-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65930-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 633DD3024EA8
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D753FE650;
	Mon, 29 Jun 2026 11:48:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4C3FBEC6
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733728; cv=none; b=qiBvhJKII4G39p2KFiRvDCvSdriq6z1vCdU9W3xfth8tXpEapiaO1qpmXiVbdxSScx09Pv0+wwWcKQmppC1roARwbplG98Ys+Bv0XyyQPAqRNSkBLC37TLT2CKD9mBj8+ZZID+dCmlmMZlVIfDUOAHFrUvPzcGlomEXzmU4Tz50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733728; c=relaxed/simple;
	bh=XotRjB9/ztAHLwnVQrI7rQe9YmXjNdS9qbpDnIu4+EU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKwucAPh/rnB8W05InL5GjgNBOQwNCph0ZBEgw/Nb6vgmC/uq/Gw9zi6qSKj3V3ki6YVVGHdljOux0PKIMU6si5SCQR3wlzKYLCnhEZXh7ct8Vo131iAnmtttIbuu15S0IICjFnn0m+kjgdyRlbai+Kurd2dy+9Kt0R2lTm/+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j9MY6jtq; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso592282e87.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782733716; x=1783338516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I7MDz26jT2hRqXCOfyw3hD+iLjLMGLmVLpexi7UYUw=;
        b=j9MY6jtqgbvhry2Obb6FA3mv4gE6yxDcos99HPLFAfZjkenX/BxKBZ3QYkYOEC90HF
         eemU/XMtwA8fHm41GThxJnzYBo0aoOxSq9lroXL6TIRClko8juAnD2P/ZFjVOoIofIwB
         KzrXnx7dqnoHAKpnMvuqbveDsQTZebVqgXYtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733716; x=1783338516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+I7MDz26jT2hRqXCOfyw3hD+iLjLMGLmVLpexi7UYUw=;
        b=ba3Hzlvm4LntmvuUwDX+JIQPnyl+16+GAM1xfJllzvwcfPUeQ0D/Gw6tJVg3isq8YG
         WLZZ976dQHjESx39JWrego2yl0U9wmsw7jHtXafZLtoP2fcMU0vq108jrQaqqnroELHQ
         F4/JNbSYCzLvneZYShWWTi/r4Fc3/R/le2C52Se2RuqdYSVPO9MjOBqun320rM4GMGTl
         rziJvg82zM8QFm/Iuzodhj+t6EUhUJPjf1qs2OG3e2+SzGoCli+R7P6ce/GnXC0R93SV
         GJpIgzp59VF6dS1d93CME6OJm2AIPf45pVfyJtKPXGSlT3SmjXo46acnmnGNdtu4djH8
         rzBA==
X-Forwarded-Encrypted: i=1; AHgh+RoOS76NkbfgmVACxkkdjc6P5CwYe8IxvFto1bMJN1Ran0f3bbMdePI1Fse5rCE3hWShS5UdM4LUpGUyAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTuqQfFlkDc2nQB+jjpA0XBIn/t7vPt41r9DVOZDO9KIID6Dm
	sm3n78yVi+Ffww3tK2fkoT7hbS6W0p3pfj/50QxESeX+6n35IpJpPLTZSOcVod9EDL0xMbO21z7
	lQfIe2qnx
X-Gm-Gg: AfdE7cn1NzLpfN2CJBRTNPf9fYdIv0oIgjaH2M6uwH7vhCQwmMAsA7DHY1+rJ1/C1ly
	2vy4JzksYbmRkIe0Q7mB3HX9AzDX9rvIRB9Aeyp3uGMNImU8UioWqIl3eFLRize+CBNcLhayBqv
	r2dRrDYNXd49TIjGrIG9IBEv9eI0oR8WwBNNGEXc+1T3VASPielyJo77BSaZficWjVy6xk3N9uy
	vV9z6/CLWjfQIK0+dMNbTV/iwnPv2L/8FJkjW0xrvJOy1icZsRKHqvCxpCp4usUUiunK/qKYAyH
	2cluogjP7K1hwDoOhnYlNXOTK1sFo8QlFxNYLCkBtE5bHPvYZOyF8vkfjsfgL/Vn+UiTu1sraVr
	bn6Dm/iQ6VyXIVMFwtexUYMQe+cbnOOpH2/kEWT3hHHgoOlBRE1IGse7aC3AJ1+y1dQIq8Nce6V
	/zGNIxRI6lgZ85AwpMo69G6/JM88+FJm3DBSCnBJZJSp7kuPKPztbQeBjxfmVEMrfLa79d
X-Received: by 2002:a05:6512:3f25:b0:5ae:b880:d497 with SMTP id 2adb3069b0e04-5aeb880d63bmr1048372e87.60.1782733712543;
        Mon, 29 Jun 2026 04:48:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb0ee9edesm1745133e87.49.2026.06.29.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:48:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:48:29 +0000
Subject: [PATCH 2/2] media: atomisp: Demote all kernel-doc comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-atomisp-kerneldoc-simple-v1-2-8ae282b85c5c@chromium.org>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65930-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6974D6D9A37

Despite the fact that kernel-doc does not emit warning for these
comments, it is much more consistent if we keep the marker /**
exclusively for kernel-doc.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/i2c/ov2722.h         |   2 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   2 +-
 .../pci/hive_isp_css_include/host/mmu_public.h     |  30 +-
 drivers/staging/media/atomisp/pci/ia_css_3a.h      |  30 +-
 .../staging/media/atomisp/pci/ia_css_acc_types.h   | 222 +++++------
 drivers/staging/media/atomisp/pci/ia_css_buffer.h  |  39 +-
 drivers/staging/media/atomisp/pci/ia_css_dvs.h     |   6 +-
 drivers/staging/media/atomisp/pci/ia_css_env.h     |  58 ++-
 .../media/atomisp/pci/ia_css_event_public.h        | 111 +++---
 .../staging/media/atomisp/pci/ia_css_firmware.h    |   4 +-
 .../media/atomisp/pci/ia_css_frame_format.h        | 104 +++---
 .../media/atomisp/pci/ia_css_frame_public.h        | 118 +++---
 .../staging/media/atomisp/pci/ia_css_input_port.h  |  22 +-
 drivers/staging/media/atomisp/pci/ia_css_irq.h     |  88 ++---
 .../staging/media/atomisp/pci/ia_css_metadata.h    |  25 +-
 .../staging/media/atomisp/pci/ia_css_pipe_public.h | 184 ++++++----
 drivers/staging/media/atomisp/pci/ia_css_prbs.h    |  10 +-
 .../staging/media/atomisp/pci/ia_css_properties.h  |   7 +-
 .../media/atomisp/pci/ia_css_stream_public.h       | 179 +++++----
 drivers/staging/media/atomisp/pci/ia_css_timer.h   |  16 +-
 drivers/staging/media/atomisp/pci/ia_css_types.h   | 408 ++++++++++++---------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |   2 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h       |  33 +-
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h   |  38 +-
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h  |  56 ++-
 .../conversion_1.0/ia_css_conversion_types.h       |   8 +-
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h |  16 +-
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h   |   2 +-
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h   |   7 +-
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h |  99 +++--
 .../pci/isp/kernels/de/de_1.0/ia_css_de_types.h    |  31 +-
 .../pci/isp/kernels/de/de_2/ia_css_de2_types.h     |  29 +-
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h    |  38 +-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h       |   6 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   | 105 +++---
 .../isp/kernels/fc/fc_1.0/ia_css_formats_types.h   |  13 +-
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h |  35 +-
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h    |  49 ++-
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h     |  14 +-
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |   9 +-
 .../kernels/macc/macc1_5/ia_css_macc1_5_types.h    |  17 +-
 .../isp/kernels/macc/macc_1.0/ia_css_macc_types.h  |  16 +-
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h      |  36 +-
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h    |  81 ++--
 .../output/output_1.0/ia_css_output_types.h        |   4 +-
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h | 328 +++++++++++------
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h    | 102 +++---
 .../kernels/sdis/common/ia_css_sdis_common_types.h | 180 +++++----
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h  |  36 +-
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |  40 +-
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h |  44 ++-
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |  33 +-
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h |  43 ++-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h    |   2 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h    |   2 +-
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h    |  45 ++-
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h |  10 +-
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    |  30 +-
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h |  88 +++--
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h  | 153 +++++---
 .../pci/runtime/debug/interface/ia_css_debug.h     |  30 +-
 .../isp_param/interface/ia_css_isp_param_types.h   |   2 +-
 .../pci/runtime/spctrl/interface/ia_css_spctrl.h   |  15 +-
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |  12 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  18 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |  49 ++-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   4 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   4 +-
 drivers/staging/media/atomisp/pci/sh_css_params.h  |  10 +-
 70 files changed, 2219 insertions(+), 1472 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 7d5ea8801fe7..13ec88eb6e45 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -204,7 +204,7 @@ enum ov2722_tok_type {
 	OV2722_TOK_MASK = 0xfff0
 };
 
-/**
+/*
  * struct ov2722_reg - MI sensor  register format
  * @type: type of the register
  * @reg: 16-bit offset to register
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637ea30..9125bf2f6f18 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2991,7 +2991,7 @@ int atomisp_css_get_formats_config(struct atomisp_sub_device *asd,
 int atomisp_css_get_zoom_factor(struct atomisp_sub_device *asd,
 				unsigned int *zoom)
 {
-	struct ia_css_dz_config dz_config;  /** Digital Zoom */
+	struct ia_css_dz_config dz_config;  /* Digital Zoom */
 	struct ia_css_isp_config isp_config;
 	struct atomisp_device *isp = asd->isp;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be3f2..50cbcbaa5bd8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -174,7 +174,7 @@ struct atomisp_subdev_params {
 
 	bool dis_proj_data_valid;
 
-	struct ia_css_dz_config   dz_config;  /** Digital Zoom */
+	struct ia_css_dz_config   dz_config;	/* Digital Zoom */
 	struct ia_css_capture_config   capture_config;
 
 	struct ia_css_isp_config config;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index b321f4101193..9e9c9a854618 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,43 +11,43 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/**
+/*
  * mmu_set_page_table_base_index() - Set the page table base index of MMU[ID]
- * @ID:				MMU identifier
- * @base_index:			page table base index
+ * @ID:                         MMU identifier
+ * @base_index:                 page table base index
  *
  * Return: none, MMU[ID].page_table_base_index = base_index
  */
 void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index);
 
-/**
+/*
  * mmu_get_page_table_base_index() - Get the page table base index of MMU[ID]
- * @ID:				MMU identifier
+ * @ID:                         MMU identifier
  *
  * Return: MMU[ID].page_table_base_index
  */
 hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID);
 
-/**
+/*
  * mmu_invalidate_cache() - nvalidate the page table cache of MMU[ID]
- * @ID:				MMU identifier
+ * @ID:                         MMU identifier
  *
  * Return: none
  */
 void mmu_invalidate_cache(const mmu_ID_t ID);
 
-/**
+/*
  * mmu_invalidate_cache_all() - Invalidate the page table cache of all MMUs
  *
  * Return: none
  */
 void mmu_invalidate_cache_all(void);
 
-/**
+/*
  * mmu_reg_store() - Write to a control register of MMU[ID]
- * @ID:				MMU identifier
- * @reg:			register index
- * @value:			The data to be written
+ * @ID:                         MMU identifier
+ * @reg:                        register index
+ * @value:                      The data to be written
  *
  * Return: none, MMU[ID].ctrl[reg] = value
  */
@@ -58,10 +58,10 @@ static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, cons
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
 }
 
-/**
+/*
  * mmu_reg_load() - Read from a control register of MMU[ID]
- * @ID:				MMU identifier
- * @reg:			register index
+ * @ID:                         MMU identifier
+ * @reg:                        register index
  *
  * Return: MMU[ID].ctrl[reg]
  */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_3a.h b/drivers/staging/media/atomisp/pci/ia_css_3a.h
index 1a10f91a77d4..45eb059078e0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_3a.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_3a.h
@@ -43,13 +43,20 @@ struct ia_css_isp_3a_statistics {
 	struct {
 		ia_css_ptr rgby_tbl;
 	} data_hmem;
-	u32 exp_id;     /** exposure id, to match statistics to a frame,
-				  see ia_css_event_public.h for more detail. */
-	u32 isp_config_id;/** Unique ID to track which config was actually applied to a particular frame */
-	ia_css_ptr data_ptr; /** pointer to base of all data */
-	u32   size;     /** total size of all data */
+	/*
+	 * exposure id, to match statistics to a frame,
+	 * see ia_css_event_public.h for more detail.
+	 */
+	u32 exp_id;
+	/*
+	 * Unique ID to track which config was actually applied to a particular
+	 * frame
+	 */
+	u32 isp_config_id;
+	ia_css_ptr data_ptr;	/* pointer to base of all data */
+	u32   size;		/* total size of all data */
 	u32   dmem_size;
-	u32   vmem_size; /** both lo and hi have this size */
+	u32   vmem_size;	/* both lo and hi have this size */
 	u32   hmem_size;
 };
 
@@ -83,14 +90,17 @@ static_assert(sizeof(struct ia_css_isp_3a_statistics) == SIZE_OF_IA_CSS_ISP_3A_S
  * point into this one block of data.
  */
 struct ia_css_isp_3a_statistics_map {
-	void                    *data_ptr; /** Pointer to start of memory */
+	void                    *data_ptr; /* Pointer to start of memory */
 	struct ia_css_3a_output *dmem_stats;
 	u16                *vmem_stats_hi;
 	u16                *vmem_stats_lo;
 	struct ia_css_bh_table  *hmem_stats;
-	u32                 size; /** total size in bytes of data_ptr */
-	u32                 data_allocated; /** indicate whether data_ptr
-						    was allocated or not. */
+	u32                 size; /* total size in bytes of data_ptr */
+	/*
+	 * indicate whether data_ptr
+	 * was allocated or not.
+	 */
+	u32                 data_allocated;
 };
 
 /* @brief Copy and translate 3A statistics from an ISP buffer to a host buffer
diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index e13ca0d84847..ac984d8f8efe 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -36,10 +36,10 @@
 /* Type of acceleration.
  */
 enum ia_css_acc_type {
-	IA_CSS_ACC_NONE,	/** Normal binary */
-	IA_CSS_ACC_OUTPUT,	/** Accelerator stage on output frame */
-	IA_CSS_ACC_VIEWFINDER,	/** Accelerator stage on viewfinder frame */
-	IA_CSS_ACC_STANDALONE,	/** Stand-alone acceleration */
+	IA_CSS_ACC_NONE,	/* Normal binary */
+	IA_CSS_ACC_OUTPUT,	/* Accelerator stage on output frame */
+	IA_CSS_ACC_VIEWFINDER,	/* Accelerator stage on viewfinder frame */
+	IA_CSS_ACC_STANDALONE,	/* Stand-alone acceleration */
 };
 
 /* Cells types
@@ -54,10 +54,10 @@ enum ia_css_cell_type {
 /* Firmware types.
  */
 enum ia_css_fw_type {
-	ia_css_sp_firmware,		/** Firmware for the SP */
-	ia_css_isp_firmware,		/** Firmware for the ISP */
-	ia_css_bootloader_firmware,	/** Firmware for the BootLoader */
-	ia_css_acc_firmware		/** Firmware for accelrations */
+	ia_css_sp_firmware,		/* Firmware for the SP */
+	ia_css_isp_firmware,		/* Firmware for the ISP */
+	ia_css_bootloader_firmware,	/* Firmware for the BootLoader */
+	ia_css_acc_firmware		/* Firmware for accelrations */
 };
 
 struct ia_css_blob_descr;
@@ -69,30 +69,31 @@ struct ia_css_blob_descr;
  * For convenience, it contains dynamic data after loading.
  */
 struct ia_css_blob_info {
-	/** Static blob data */
-	u32 offset;		/** Blob offset in fw file */
-	struct ia_css_isp_param_memory_offsets
-		memory_offsets;  /** offset wrt hdr in bytes */
-	u32 prog_name_offset;  /** offset wrt hdr in bytes */
-	u32 size;			/** Size of blob */
-	u32 padding_size;	/** total accumulation of bytes added due to section alignment */
-	u32 icache_source;	/** Position of icache in blob */
-	u32 icache_size;	/** Size of icache section */
-	u32 icache_padding;/** bytes added due to icache section alignment */
-	u32 text_source;	/** Position of text in blob */
-	u32 text_size;		/** Size of text section */
-	u32 text_padding;	/** bytes added due to text section alignment */
-	u32 data_source;	/** Position of data in blob */
-	u32 data_target;	/** Start of data in SP dmem */
-	u32 data_size;		/** Size of text section */
-	u32 data_padding;	/** bytes added due to data section alignment */
-	u32 bss_target;	/** Start position of bss in SP dmem */
-	u32 bss_size;		/** Size of bss section */
-	/** Dynamic data filled by loader */
-	CSS_ALIGN(const void  *code,
-		  8);		/** Code section absolute pointer within fw, code = icache + text */
-	CSS_ALIGN(const void  *data,
-		  8);		/** Data section absolute pointer within fw, data = data + bss */
+	/* Static blob data */
+	u32 offset;		/* Blob offset in fw file */
+	/* offset wrt hdr in bytes */
+	struct ia_css_isp_param_memory_offsets memory_offsets;
+	u32 prog_name_offset;  /* offset wrt hdr in bytes */
+	u32 size;			/* Size of blob */
+	/* total accumulation of bytes added due to section alignment */
+	u32 padding_size;
+	u32 icache_source;	/* Position of icache in blob */
+	u32 icache_size;	/* Size of icache section */
+	u32 icache_padding;/* bytes added due to icache section alignment */
+	u32 text_source;	/* Position of text in blob */
+	u32 text_size;		/* Size of text section */
+	u32 text_padding;	/* bytes added due to text section alignment */
+	u32 data_source;	/* Position of data in blob */
+	u32 data_target;	/* Start of data in SP dmem */
+	u32 data_size;		/* Size of text section */
+	u32 data_padding;	/* bytes added due to data section alignment */
+	u32 bss_target;	/* Start position of bss in SP dmem */
+	u32 bss_size;		/* Size of bss section */
+	/* Dynamic data filled by loader */
+	/* Code section absolute pointer within fw, code = icache + text */
+	CSS_ALIGN(const void *code, 8);
+	/* Data section absolute pointer within fw, data = data + bss */
+	CSS_ALIGN(const void *data, 8);
 };
 
 struct ia_css_binary_input_info {
@@ -138,7 +139,7 @@ struct ia_css_binary_s3a_info {
 
 /* DPC related binary info */
 struct ia_css_binary_dpc_info {
-	u32		bnr_lite; /** bnr lite enable flag */
+	u32		bnr_lite;	/* bnr lite enable flag */
 };
 
 struct ia_css_binary_iterator_info {
@@ -197,7 +198,7 @@ struct ia_css_binary_block_info {
  * thereby making the SP code more binary independent.
  */
 struct ia_css_binary_info {
-	CSS_ALIGN(u32			id, 8); /* IA_CSS_BINARY_ID_* */
+	CSS_ALIGN(u32			id, 8);		/* IA_CSS_BINARY_ID_* */
 	struct ia_css_binary_pipeline_info	pipeline;
 	struct ia_css_binary_input_info		input;
 	struct ia_css_binary_output_info	output;
@@ -206,7 +207,8 @@ struct ia_css_binary_info {
 	struct ia_css_binary_dvs_info		dvs;
 	struct ia_css_binary_vf_dec_info	vf_dec;
 	struct ia_css_binary_s3a_info		s3a;
-	struct ia_css_binary_dpc_info		dpc_bnr; /** DPC related binary info */
+	/* DPC related binary info */
+	struct ia_css_binary_dpc_info		dpc_bnr;
 	struct ia_css_binary_iterator_info	iterator;
 	struct ia_css_binary_address_info	addresses;
 	struct ia_css_binary_uds_info		uds;
@@ -273,10 +275,10 @@ struct ia_css_binary_xinfo {
 
 	CSS_ALIGN(s32	     num_output_formats, 8);
 	enum ia_css_frame_format     output_formats[IA_CSS_FRAME_FORMAT_NUM];
-
-	CSS_ALIGN(s32	     num_vf_formats, 8); /** number of supported vf formats */
-	enum ia_css_frame_format
-	vf_formats[IA_CSS_FRAME_FORMAT_NUM]; /** types of supported vf formats */
+	/* number of supported vf formats */
+	CSS_ALIGN(s32	     num_vf_formats, 8);
+	/* types of supported vf formats */
+	enum ia_css_frame_format vf_formats[IA_CSS_FRAME_FORMAT_NUM];
 	u8			     num_output_pins;
 	ia_css_ptr		     xmem_addr;
 
@@ -291,11 +293,11 @@ struct ia_css_binary_xinfo {
  * the entry function in icache.
  */
 struct ia_css_bl_info {
-	u32 num_dma_cmds;	/** Number of cmds sent by CSS */
-	u32 dma_cmd_list;	/** Dma command list sent by CSS */
-	u32 sw_state;	/** Polled from css */
+	u32 num_dma_cmds;	/* Number of cmds sent by CSS */
+	u32 dma_cmd_list;	/* Dma command list sent by CSS */
+	u32 sw_state;		/* Polled from css */
 	/* Entry functions */
-	u32 bl_entry;	/** The SP entry function */
+	u32 bl_entry;		/* The SP entry function */
 };
 
 /* Structure describing the SP binary.
@@ -303,35 +305,41 @@ struct ia_css_bl_info {
  * the entry function in pmem.
  */
 struct ia_css_sp_info {
-	u32 init_dmem_data; /** data sect config, stored to dmem */
-	u32 per_frame_data; /** Per frame data, stored to dmem */
-	u32 group;		/** Per pipeline data, loaded by dma */
-	u32 output;		/** SP output data, loaded by dmem */
-	u32 host_sp_queue;	/** Host <-> SP queues */
-	u32 host_sp_com;/** Host <-> SP commands */
-	u32 isp_started;	/** Polled from sensor thread, csim only */
-	u32 sw_state;	/** Polled from css */
-	u32 host_sp_queues_initialized; /** Polled from the SP */
-	u32 sleep_mode;  /** different mode to halt SP */
-	u32 invalidate_tlb;		/** inform SP to invalidate mmu TLB */
+	u32 init_dmem_data; /* data sect config, stored to dmem */
+	u32 per_frame_data; /* Per frame data, stored to dmem */
+	u32 group;		/* Per pipeline data, loaded by dma */
+	u32 output;		/* SP output data, loaded by dmem */
+	u32 host_sp_queue;	/* Host <-> SP queues */
+	u32 host_sp_com;/* Host <-> SP commands */
+	u32 isp_started;	/* Polled from sensor thread, csim only */
+	u32 sw_state;	/* Polled from css */
+	u32 host_sp_queues_initialized; /* Polled from the SP */
+	u32 sleep_mode;  /* different mode to halt SP */
+	u32 invalidate_tlb;		/* inform SP to invalidate mmu TLB */
 
 	/* ISP2400 */
-	u32 stop_copy_preview;       /** suspend copy and preview pipe when capture */
-
-	u32 debug_buffer_ddr_address;	/** inform SP the address
-	of DDR debug queue */
-	u32 perf_counter_input_system_error; /** input system perf
-	counter array */
-
-	u32 threads_stack; /** sp thread's stack pointers */
-	u32 threads_stack_size; /** sp thread's stack sizes */
-	u32 curr_binary_id;        /** current binary id */
-	u32 raw_copy_line_count;   /** raw copy line counter */
-	u32 ddr_parameter_address; /** acc param ddrptr, sp dmem */
-	u32 ddr_parameter_size;    /** acc param size, sp dmem */
+	/* suspend copy and preview pipe when capture */
+	u32 stop_copy_preview;
+	/*
+	 * inform SP the address
+	 * of DDR debug queue
+	 */
+	u32 debug_buffer_ddr_address;
+	/*
+	 * input system perf
+	 * counter array
+	 */
+	u32 perf_counter_input_system_error;
+
+	u32 threads_stack; /* sp thread's stack pointers */
+	u32 threads_stack_size; /* sp thread's stack sizes */
+	u32 curr_binary_id;        /* current binary id */
+	u32 raw_copy_line_count;   /* raw copy line counter */
+	u32 ddr_parameter_address; /* acc param ddrptr, sp dmem */
+	u32 ddr_parameter_size;    /* acc param size, sp dmem */
 	/* Entry functions */
-	u32 sp_entry;	/** The SP entry function */
-	u32 tagger_frames_addr;   /** Base address of tagger state */
+	u32 sp_entry;	/* The SP entry function */
+	u32 tagger_frames_addr;   /* Base address of tagger state */
 };
 
 /* The following #if is there because this header file is also included
@@ -343,36 +351,36 @@ struct ia_css_sp_info {
 /* Accelerator firmware information.
  */
 struct ia_css_acc_info {
-	u32 per_frame_data; /** Dummy for now */
+	u32 per_frame_data;	/* Dummy for now */
 };
 
 /* Firmware information.
  */
 union ia_css_fw_union {
-	struct ia_css_binary_xinfo	isp; /** ISP info */
-	struct ia_css_sp_info		sp;  /** SP info */
-	struct ia_css_bl_info           bl;  /** Bootloader info */
-	struct ia_css_acc_info		acc; /** Accelerator info */
+	struct ia_css_binary_xinfo	isp;	/* ISP info */
+	struct ia_css_sp_info		sp;	/* SP info */
+	struct ia_css_bl_info           bl;	/* Bootloader info */
+	struct ia_css_acc_info		acc;	/* Accelerator info */
 };
 
 /* Firmware information.
  */
 struct ia_css_fw_info {
-	size_t			 header_size; /** size of fw header */
+	size_t			 header_size;	/* size of fw header */
 
 	CSS_ALIGN(u32 type, 8);
-	union ia_css_fw_union	 info; /** Binary info */
-	struct ia_css_blob_info  blob; /** Blob info */
+	union ia_css_fw_union	 info;		/* Binary info */
+	struct ia_css_blob_info  blob;		/* Blob info */
 	/* Dynamic part */
 	struct ia_css_fw_info   *next;
 
-	CSS_ALIGN(u32       loaded, 8);	/** Firmware has been loaded */
-	CSS_ALIGN(const u8 *isp_code, 8);  /** ISP pointer to code */
-	/** Firmware handle between user space and kernel */
+	CSS_ALIGN(u32       loaded, 8);		/* Firmware has been loaded */
+	CSS_ALIGN(const u8 *isp_code, 8);	/* ISP pointer to code */
+	/* Firmware handle between user space and kernel */
+	/* Sections to copy from/to ISP */
 	CSS_ALIGN(u32	handle, 8);
-	/** Sections to copy from/to ISP */
+	/* Initializer for local ISP memories */
 	struct ia_css_isp_param_css_segments mem_initializers;
-	/** Initializer for local ISP memories */
 };
 
 struct ia_css_blob_descr {
@@ -387,15 +395,19 @@ struct ia_css_acc_fw;
 /* Structure describing the SP binary of a stand-alone accelerator.
  */
 struct ia_css_acc_sp {
-	void (*init)(struct ia_css_acc_fw *);	/** init for crun */
-	u32 sp_prog_name_offset;		/** program name offset wrt hdr in bytes */
-	u32 sp_blob_offset;		/** blob offset wrt hdr in bytes */
-	void	 *entry;			/** Address of sp entry point */
-	u32 *css_abort;			/** SP dmem abort flag */
-	void	 *isp_code;			/** SP dmem address holding xmem
-						     address of isp code */
-	struct ia_css_fw_info fw;		/** SP fw descriptor */
-	const u8 *code;			/** ISP pointer of allocated SP code */
+	void (*init)(struct ia_css_acc_fw *acc_fw);	/* init for crun */
+	/* program name offset wrt hdr in bytes */
+	u32 sp_prog_name_offset;
+	u32 sp_blob_offset;		/* blob offset wrt hdr in bytes */
+	void	 *entry;			/* Address of sp entry point */
+	u32 *css_abort;			/* SP dmem abort flag */
+	/*
+	 * SP dmem address holding xmem
+	 * address of isp code
+	 */
+	void	 *isp_code;
+	struct ia_css_fw_info fw;		/* SP fw descriptor */
+	const u8 *code;			/* ISP pointer of allocated SP code */
 };
 
 /* Acceleration firmware descriptor.
@@ -403,17 +415,23 @@ struct ia_css_acc_sp {
   * ISP code (a separate pipeline stage).
   */
 struct ia_css_acc_fw_hdr {
-	enum ia_css_acc_type type;	/** Type of accelerator */
-	u32	isp_prog_name_offset; /** program name offset wrt
-						   header in bytes */
-	u32	isp_blob_offset;      /** blob offset wrt header
-						   in bytes */
-	u32	isp_size;	      /** Size of isp blob */
-	const u8  *isp_code;	      /** ISP pointer to code */
-	struct ia_css_acc_sp  sp;  /** Standalone sp code */
-	/** Firmware handle between user space and kernel */
+	enum ia_css_acc_type type;	/* Type of accelerator */
+	/*
+	 * program name offset wrt
+	 * header in bytes
+	 */
+	u32	isp_prog_name_offset;
+	/*
+	 * blob offset wrt header
+	 * in bytes
+	 */
+	u32	isp_blob_offset;
+	u32	isp_size;		/* Size of isp blob */
+	const u8  *isp_code;		/* ISP pointer to code */
+	struct ia_css_acc_sp  sp;	/* Standalone sp code */
+	/* Firmware handle between user space and kernel */
 	u32	handle;
-	struct ia_css_data parameters; /** Current SP parameters */
+	struct ia_css_data parameters;	/* Current SP parameters */
 };
 
 /* Firmware structure.
@@ -424,7 +442,7 @@ struct ia_css_acc_fw_hdr {
   * header and computed using the access macros below.
   */
 struct ia_css_acc_fw {
-	struct ia_css_acc_fw_hdr header; /** firmware header */
+	struct ia_css_acc_fw_hdr header;	/* firmware header */
 	/*
 	int8_t   isp_progname[];	  **< ISP program name
 	int8_t   sp_progname[];	  **< SP program name, stand-alone only
diff --git a/drivers/staging/media/atomisp/pci/ia_css_buffer.h b/drivers/staging/media/atomisp/pci/ia_css_buffer.h
index 7c00dd1d33fd..df64656667ca 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_buffer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_buffer.h
@@ -44,24 +44,31 @@ enum ia_css_buffer_type {
  *  independent buffer queues and access functions.
  */
 struct ia_css_buffer {
-	enum ia_css_buffer_type type; /** Buffer type. */
+	enum ia_css_buffer_type type;	/* Buffer type. */
+	/*
+	 * exposure id for this buffer; 0 = not available
+	 * see ia_css_event_public.h for more detail.
+	 */
 	unsigned int exp_id;
-	/** exposure id for this buffer; 0 = not available
-	     see ia_css_event_public.h for more detail. */
 	union {
-		struct ia_css_isp_3a_statistics
-			*stats_3a;    /** 3A statistics & optionally RGBY statistics. */
-		struct ia_css_isp_dvs_statistics *stats_dvs;   /** DVS statistics. */
-		struct ia_css_isp_skc_dvs_statistics *stats_skc_dvs;  /** SKC DVS statistics. */
-		struct ia_css_frame              *frame;       /** Frame buffer. */
-		struct ia_css_acc_param          *custom_data; /** Custom buffer. */
-		struct ia_css_metadata           *metadata;    /** Sensor metadata. */
-	} data; /** Buffer data pointer. */
-	u64 driver_cookie; /** cookie for the driver */
-	struct ia_css_time_meas
-		timing_data; /** timing data (readings from the timer) */
-	struct ia_css_clock_tick
-		isys_eof_clock_tick; /** ISYS's end of frame timer tick*/
+		/* 3A statistics & optionally RGBY statistics. */
+		struct ia_css_isp_3a_statistics *stats_3a;
+		/* DVS statistics. */
+		struct ia_css_isp_dvs_statistics *stats_dvs;
+		/* SKC DVS statistics. */
+		struct ia_css_isp_skc_dvs_statistics *stats_skc_dvs;
+		/* Frame buffer. */
+		struct ia_css_frame              *frame;
+		/* Custom buffer. */
+		struct ia_css_acc_param          *custom_data;
+		/* Sensor metadata. */
+		struct ia_css_metadata           *metadata;
+	} data;				/* Buffer data pointer. */
+	u64 driver_cookie;		/* cookie for the driver */
+	/* timing data (readings from the timer) */
+	struct ia_css_time_meas timing_data;
+	/* ISYS's end of frame timer tick */
+	struct ia_css_clock_tick isys_eof_clock_tick;
 };
 
 /* @brief Dequeue param buffers from sp2host_queue
diff --git a/drivers/staging/media/atomisp/pci/ia_css_dvs.h b/drivers/staging/media/atomisp/pci/ia_css_dvs.h
index 6930f1ec3aee..d53475d6fba6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_dvs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_dvs.h
@@ -33,9 +33,9 @@ struct ia_css_isp_dvs_statistics {
 	ia_css_ptr ver_proj;
 	u32   hor_size;
 	u32   ver_size;
-	u32   exp_id;   /** see ia_css_event_public.h for more detail */
-	ia_css_ptr data_ptr; /* base pointer containing all memory */
-	u32   size;     /* size of allocated memory in data_ptr */
+	u32   exp_id;		/* see ia_css_event_public.h for more detail */
+	ia_css_ptr data_ptr;	/* base pointer containing all memory */
+	u32   size;		/* size of allocated memory in data_ptr */
 };
 
 /* Structure that holds SKC DVS statistics in the ISP internal
diff --git a/drivers/staging/media/atomisp/pci/ia_css_env.h b/drivers/staging/media/atomisp/pci/ia_css_env.h
index 42bf739c51f5..145350f54f61 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_env.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_env.h
@@ -32,45 +32,63 @@ enum ia_css_mem_attr {
  *  This is never expected to allocate more than one page of memory (4K bytes).
  */
 struct ia_css_cpu_mem_env {
+	/* Flush function to flush the cache for given accelerator. */
 	void (*flush)(struct ia_css_acc_fw *fw);
-	/** Flush function to flush the cache for given accelerator. */
 };
 
 /* Environment with function pointers to access the CSS hardware. This includes
  *  registers and local memories.
  */
 struct ia_css_hw_access_env {
+	/*
+	 * Store an 8 bit value into an address in the CSS HW address space.
+	 * The address must be an 8 bit aligned address.
+	 */
 	void (*store_8)(hrt_address addr, uint8_t data);
-	/** Store an 8 bit value into an address in the CSS HW address space.
-	     The address must be an 8 bit aligned address. */
+	/*
+	 * Store a 16 bit value into an address in the CSS HW address space.
+	 * The address must be a 16 bit aligned address.
+	 */
 	void (*store_16)(hrt_address addr, uint16_t data);
-	/** Store a 16 bit value into an address in the CSS HW address space.
-	     The address must be a 16 bit aligned address. */
+	/*
+	 * Store a 32 bit value into an address in the CSS HW address space.
+	 * The address must be a 32 bit aligned address.
+	 */
 	void (*store_32)(hrt_address addr, uint32_t data);
-	/** Store a 32 bit value into an address in the CSS HW address space.
-	     The address must be a 32 bit aligned address. */
+	/*
+	 * Load an 8 bit value from an address in the CSS HW address
+	 * space. The address must be an 8 bit aligned address.
+	 */
 	uint8_t (*load_8)(hrt_address addr);
-	/** Load an 8 bit value from an address in the CSS HW address
-	     space. The address must be an 8 bit aligned address. */
+	/*
+	 * Load a 16 bit value from an address in the CSS HW address
+	 * space. The address must be a 16 bit aligned address.
+	 */
 	uint16_t (*load_16)(hrt_address addr);
-	/** Load a 16 bit value from an address in the CSS HW address
-	     space. The address must be a 16 bit aligned address. */
+	/*
+	 * Load a 32 bit value from an address in the CSS HW address
+	 * space. The address must be a 32 bit aligned address.
+	 */
 	uint32_t (*load_32)(hrt_address addr);
-	/** Load a 32 bit value from an address in the CSS HW address
-	     space. The address must be a 32 bit aligned address. */
+	/*
+	 * Store a number of bytes into a byte-aligned address in the CSS HW
+	 * address space.
+	 */
 	void (*store)(hrt_address addr, const void *data, uint32_t bytes);
-	/** Store a number of bytes into a byte-aligned address in the CSS HW address space. */
+	/*
+	 * Load a number of bytes from a byte-aligned address in the CSS HW
+	 * address space.
+	 */
 	void (*load)(hrt_address addr, void *data, uint32_t bytes);
-	/** Load a number of bytes from a byte-aligned address in the CSS HW address space. */
 };
 
 /* Environment with function pointers to print error and debug messages.
  */
 struct ia_css_print_env {
+	/* Print a debug message. */
 	int  __printf(1, 0) (*debug_print)(const char *fmt, va_list args);
-	/** Print a debug message. */
+	/* Print an error message. */
 	int  __printf(1, 0) (*error_print)(const char *fmt, va_list args);
-	/** Print an error message.*/
 };
 
 /* Environment structure. This includes function pointers to access several
@@ -79,9 +97,9 @@ struct ia_css_print_env {
  *  Windows and several simulation environments.
  */
 struct ia_css_env {
-	struct ia_css_cpu_mem_env   cpu_mem_env;   /** local flush. */
-	struct ia_css_hw_access_env hw_access_env; /** CSS HW access functions */
-	struct ia_css_print_env     print_env;     /** Message printing env. */
+	struct ia_css_cpu_mem_env   cpu_mem_env;   /* local flush. */
+	struct ia_css_hw_access_env hw_access_env; /* CSS HW access functions */
+	struct ia_css_print_env     print_env;     /* Message printing env. */
 };
 
 #endif /* __IA_CSS_ENV_H */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
index f7215dd96739..2d25e4f62c9a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
@@ -27,39 +27,41 @@
  * 4) "enum ia_css_event_type convert_event_sp_to_host_domain"	(sh_css.c)
  */
 enum ia_css_event_type {
+	/* Output frame ready. */
 	IA_CSS_EVENT_TYPE_OUTPUT_FRAME_DONE		= BIT(0),
-	/** Output frame ready. */
+	/* Second output frame ready. */
 	IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE	= BIT(1),
-	/** Second output frame ready. */
+	/* Viewfinder Output frame ready. */
 	IA_CSS_EVENT_TYPE_VF_OUTPUT_FRAME_DONE		= BIT(2),
-	/** Viewfinder Output frame ready. */
+	/* Second viewfinder Output frame ready. */
 	IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE	= BIT(3),
-	/** Second viewfinder Output frame ready. */
+	/* Indication that 3A statistics are available. */
 	IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE		= BIT(4),
-	/** Indication that 3A statistics are available. */
+	/* Indication that DIS statistics are available. */
 	IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE		= BIT(5),
-	/** Indication that DIS statistics are available. */
+	/* Pipeline Done event, sent after last pipeline stage. */
 	IA_CSS_EVENT_TYPE_PIPELINE_DONE			= BIT(6),
-	/** Pipeline Done event, sent after last pipeline stage. */
+	/* Frame tagged. */
 	IA_CSS_EVENT_TYPE_FRAME_TAGGED			= BIT(7),
-	/** Frame tagged. */
+	/* Input frame ready. */
 	IA_CSS_EVENT_TYPE_INPUT_FRAME_DONE		= BIT(8),
-	/** Input frame ready. */
+	/* Metadata ready. */
 	IA_CSS_EVENT_TYPE_METADATA_DONE			= BIT(9),
-	/** Metadata ready. */
+	/* Indication that LACE statistics are available. */
 	IA_CSS_EVENT_TYPE_LACE_STATISTICS_DONE		= BIT(10),
-	/** Indication that LACE statistics are available. */
+	/* Extension stage complete. */
 	IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE		= BIT(11),
-	/** Extension stage complete. */
+	/*
+	 * Timer event for measuring the SP side latencies. It contains the
+	 * 32-bit timer value from the SP
+	 */
 	IA_CSS_EVENT_TYPE_TIMER				= BIT(12),
-	/** Timer event for measuring the SP side latencies. It contains the
-	     32-bit timer value from the SP */
+	/* End Of Frame event, sent when in buffered sensor mode. */
 	IA_CSS_EVENT_TYPE_PORT_EOF			= BIT(13),
-	/** End Of Frame event, sent when in buffered sensor mode. */
+	/* Performance warning encounter by FW */
 	IA_CSS_EVENT_TYPE_FW_WARNING			= BIT(14),
-	/** Performance warning encounter by FW */
+	/* Assertion hit by FW */
 	IA_CSS_EVENT_TYPE_FW_ASSERT			= BIT(15),
-	/** Assertion hit by FW */
 };
 
 #define IA_CSS_EVENT_TYPE_NONE 0
@@ -89,47 +91,62 @@ enum ia_css_event_type {
  * filled.
  */
 struct ia_css_event {
+	/*
+	 * Pipe handle on which event happened, NULL for non pipe related
+	 * events.
+	 */
 	struct ia_css_pipe    *pipe;
-	/** Pipe handle on which event happened, NULL for non pipe related
-	     events. */
+	/* Type of Event, always valid/filled. */
 	enum ia_css_event_type type;
-	/** Type of Event, always valid/filled. */
+	/* Port number for EOF event (not valid for other events). */
 	u8                port;
-	/** Port number for EOF event (not valid for other events). */
+	/*
+	 * Exposure id for EOF/FRAME_TAGGED/FW_WARNING event (not valid for
+	 * other events) The exposure ID is unique only within a logical stream
+	 * and it is only generated on systems that have an input system (such
+	 * as 2400 and 2401). Most outputs produced by the CSS are tagged with
+	 * an exposure ID. This allows users of the CSS API to keep track of
+	 * which buffer was generated from which sensor output frame. This
+	 * includes: EOF event, output frames, 3A statistics, DVS statistics and
+	 * sensor metadata. Exposure IDs start at IA_CSS_MIN_EXPOSURE_ID,
+	 * increment by one until IA_CSS_MAX_EXPOSURE_ID is reached, after that
+	 * they wrap around to IA_CSS_MIN_EXPOSURE_ID again. Note that in case
+	 * frames are dropped, this will not be reflected in the exposure IDs.
+	 * Therefor applications should not use this to detect frame drops.
+	 */
 	u8                exp_id;
-	/** Exposure id for EOF/FRAME_TAGGED/FW_WARNING event (not valid for other events)
-	     The exposure ID is unique only within a logical stream and it is
-	     only generated on systems that have an input system (such as 2400
-	     and 2401).
-	     Most outputs produced by the CSS are tagged with an exposure ID.
-	     This allows users of the CSS API to keep track of which buffer
-	     was generated from which sensor output frame. This includes:
-	     EOF event, output frames, 3A statistics, DVS statistics and
-	     sensor metadata.
-	     Exposure IDs start at IA_CSS_MIN_EXPOSURE_ID, increment by one
-	     until IA_CSS_MAX_EXPOSURE_ID is reached, after that they wrap
-	     around to IA_CSS_MIN_EXPOSURE_ID again.
-	     Note that in case frames are dropped, this will not be reflected
-	     in the exposure IDs. Therefor applications should not use this
-	     to detect frame drops. */
+	/*
+	 * Firmware Handle for ACC_STAGE_COMPLETE event (not valid for other
+	 * events).
+	 */
 	u32               fw_handle;
-	/** Firmware Handle for ACC_STAGE_COMPLETE event (not valid for other
-	     events). */
+	/* Firmware warning code, only for WARNING events. */
 	enum ia_css_fw_warning fw_warning;
-	/** Firmware warning code, only for WARNING events. */
+	/*
+	 * Firmware module id, only for ASSERT events, should be logged by
+	 * driver.
+	 */
 	u8                fw_assert_module_id;
-	/** Firmware module id, only for ASSERT events, should be logged by driver. */
+	/*
+	 * Firmware line number, only for ASSERT events, should be logged by
+	 * driver.
+	 */
 	u16               fw_assert_line_no;
-	/** Firmware line number, only for ASSERT events, should be logged by driver. */
+	/*
+	 * For storing the full 32-bit of the timer value. Valid only for TIMER
+	 * event
+	 */
 	clock_value_t	       timer_data;
-	/** For storing the full 32-bit of the timer value. Valid only for TIMER
-	     event */
+	/*
+	 * For storing the code of the TIMER event. Valid only for
+	 * TIMER event
+	 */
 	u8                timer_code;
-	/** For storing the code of the TIMER event. Valid only for
-	     TIMER event */
+	/*
+	 * For storing the subcode of the TIMER event. Valid only
+	 * for TIMER event
+	 */
 	u8                timer_subcode;
-	/** For storing the subcode of the TIMER event. Valid only
-	     for TIMER event */
 };
 
 /* @brief Dequeue a PSYS event from the CSS system.
diff --git a/drivers/staging/media/atomisp/pci/ia_css_firmware.h b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
index fcfa400cfdd1..eb19c858544f 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
@@ -18,8 +18,8 @@
 /* CSS firmware package structure.
  */
 struct ia_css_fw {
-	void	    *data;  /** pointer to the firmware data */
-	unsigned int bytes; /** length in bytes of firmware data */
+	void	    *data;	/* pointer to the firmware data */
+	unsigned int bytes;	/* length in bytes of firmware data */
 };
 
 struct device;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_format.h b/drivers/staging/media/atomisp/pci/ia_css_frame_format.h
index 0cb9c0fbe88c..5ecf814b238e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_format.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_format.h
@@ -40,47 +40,69 @@
 	- css/bxt_sandbox/isysapi/interface/ia_css_isysapi_fw_types.h
 */
 enum ia_css_frame_format {
-	IA_CSS_FRAME_FORMAT_NV11 = 0,   /** 12 bit YUV 411, Y, UV plane */
-	IA_CSS_FRAME_FORMAT_NV12,       /** 12 bit YUV 420, Y, UV plane */
-	IA_CSS_FRAME_FORMAT_NV12_16,    /** 16 bit YUV 420, Y, UV plane */
-	IA_CSS_FRAME_FORMAT_NV12_TILEY, /** 12 bit YUV 420, Intel proprietary tiled format, TileY */
-	IA_CSS_FRAME_FORMAT_NV16,       /** 16 bit YUV 422, Y, UV plane */
-	IA_CSS_FRAME_FORMAT_NV21,       /** 12 bit YUV 420, Y, VU plane */
-	IA_CSS_FRAME_FORMAT_NV61,       /** 16 bit YUV 422, Y, VU plane */
-	IA_CSS_FRAME_FORMAT_YV12,       /** 12 bit YUV 420, Y, V, U plane */
-	IA_CSS_FRAME_FORMAT_YV16,       /** 16 bit YUV 422, Y, V, U plane */
-	IA_CSS_FRAME_FORMAT_YUV420,     /** 12 bit YUV 420, Y, U, V plane */
-	IA_CSS_FRAME_FORMAT_YUV420_16,  /** yuv420, 16 bits per subpixel */
-	IA_CSS_FRAME_FORMAT_YUV422,     /** 16 bit YUV 422, Y, U, V plane */
-	IA_CSS_FRAME_FORMAT_YUV422_16,  /** yuv422, 16 bits per subpixel */
-	IA_CSS_FRAME_FORMAT_UYVY,       /** 16 bit YUV 422, UYVY interleaved */
-	IA_CSS_FRAME_FORMAT_YUYV,       /** 16 bit YUV 422, YUYV interleaved */
-	IA_CSS_FRAME_FORMAT_YUV444,     /** 24 bit YUV 444, Y, U, V plane */
-	IA_CSS_FRAME_FORMAT_YUV_LINE,   /** Internal format, 2 y lines followed
-					     by a uvinterleaved line */
-	IA_CSS_FRAME_FORMAT_RAW,	/** RAW, 1 plane */
-	IA_CSS_FRAME_FORMAT_RGB565,     /** 16 bit RGB, 1 plane. Each 3 sub
-					     pixels are packed into one 16 bit
-					     value, 5 bits for R, 6 bits for G
-					     and 5 bits for B. */
-	IA_CSS_FRAME_FORMAT_PLANAR_RGB888, /** 24 bit RGB, 3 planes */
-	IA_CSS_FRAME_FORMAT_RGBA888,	/** 32 bit RGBA, 1 plane, A=Alpha
-					     (alpha is unused) */
-	IA_CSS_FRAME_FORMAT_QPLANE6, /** Internal, for advanced ISP */
-	IA_CSS_FRAME_FORMAT_BINARY_8,	/** byte stream, used for jpeg. For
-					     frames of this type, we set the
-					     height to 1 and the width to the
-					     number of allocated bytes. */
-	IA_CSS_FRAME_FORMAT_MIPI,	/** MIPI frame, 1 plane */
-	IA_CSS_FRAME_FORMAT_RAW_PACKED, /** RAW, 1 plane, packed */
-	IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_8,	      /** 8 bit per Y/U/V.
-							   Y odd line; UYVY
-							   interleaved even line */
-	IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8, /** Legacy YUV420. UY odd
-							   line; VY even line */
-	IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_10       /** 10 bit per Y/U/V. Y odd
-							   line; UYVY interleaved
-							   even line */
+	IA_CSS_FRAME_FORMAT_NV11 = 0,   /* 12 bit YUV 411, Y, UV plane */
+	IA_CSS_FRAME_FORMAT_NV12,       /* 12 bit YUV 420, Y, UV plane */
+	IA_CSS_FRAME_FORMAT_NV12_16,    /* 16 bit YUV 420, Y, UV plane */
+	/* 12 bit YUV 420, Intel proprietary tiled format, TileY */
+	IA_CSS_FRAME_FORMAT_NV12_TILEY,
+	IA_CSS_FRAME_FORMAT_NV16,       /* 16 bit YUV 422, Y, UV plane */
+	IA_CSS_FRAME_FORMAT_NV21,       /* 12 bit YUV 420, Y, VU plane */
+	IA_CSS_FRAME_FORMAT_NV61,       /* 16 bit YUV 422, Y, VU plane */
+	IA_CSS_FRAME_FORMAT_YV12,       /* 12 bit YUV 420, Y, V, U plane */
+	IA_CSS_FRAME_FORMAT_YV16,       /* 16 bit YUV 422, Y, V, U plane */
+	IA_CSS_FRAME_FORMAT_YUV420,     /* 12 bit YUV 420, Y, U, V plane */
+	IA_CSS_FRAME_FORMAT_YUV420_16,  /* yuv420, 16 bits per subpixel */
+	IA_CSS_FRAME_FORMAT_YUV422,     /* 16 bit YUV 422, Y, U, V plane */
+	IA_CSS_FRAME_FORMAT_YUV422_16,  /* yuv422, 16 bits per subpixel */
+	IA_CSS_FRAME_FORMAT_UYVY,       /* 16 bit YUV 422, UYVY interleaved */
+	IA_CSS_FRAME_FORMAT_YUYV,       /* 16 bit YUV 422, YUYV interleaved */
+	IA_CSS_FRAME_FORMAT_YUV444,     /* 24 bit YUV 444, Y, U, V plane */
+	/*
+	 * Internal format, 2 y lines followed
+	 * by a uvinterleaved line
+	 */
+	IA_CSS_FRAME_FORMAT_YUV_LINE,
+	IA_CSS_FRAME_FORMAT_RAW,	/* RAW, 1 plane */
+	/*
+	 * 16 bit RGB, 1 plane. Each 3 sub
+	 * pixels are packed into one 16 bit
+	 * value, 5 bits for R, 6 bits for G
+	 * and 5 bits for B.
+	 */
+	IA_CSS_FRAME_FORMAT_RGB565,
+	IA_CSS_FRAME_FORMAT_PLANAR_RGB888, /* 24 bit RGB, 3 planes */
+	/*
+	 * 32 bit RGBA, 1 plane, A=Alpha
+	 * (alpha is unused)
+	 */
+	IA_CSS_FRAME_FORMAT_RGBA888,
+	IA_CSS_FRAME_FORMAT_QPLANE6, /* Internal, for advanced ISP */
+	/*
+	 * byte stream, used for jpeg. For
+	 * frames of this type, we set the
+	 * height to 1 and the width to the
+	 * number of allocated bytes.
+	 */
+	IA_CSS_FRAME_FORMAT_BINARY_8,
+	IA_CSS_FRAME_FORMAT_MIPI,	/* MIPI frame, 1 plane */
+	IA_CSS_FRAME_FORMAT_RAW_PACKED, /* RAW, 1 plane, packed */
+	/*
+	 * 8 bit per Y/U/V.
+	 * Y odd line; UYVY
+	 * interleaved even line
+	 */
+	IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_8,
+	/*
+	 * Legacy YUV420. UY odd
+	 * line; VY even line
+	 */
+	IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8,
+	/*
+	 * 10 bit per Y/U/V. Y odd
+	 * line; UYVY interleaved
+	 * even line
+	 */
+	IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_10
 };
 
 /* NOTE: IA_CSS_FRAME_FORMAT_NUM was purposely defined outside of enum type ia_css_frame_format, */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 936b17950b3a..ab8b049753f8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -23,10 +23,10 @@
  *  colors on the first line and the first two colors from the second line.
  */
 enum ia_css_bayer_order {
-	IA_CSS_BAYER_ORDER_GRBG, /** GRGRGRGRGR .. BGBGBGBGBG */
-	IA_CSS_BAYER_ORDER_RGGB, /** RGRGRGRGRG .. GBGBGBGBGB */
-	IA_CSS_BAYER_ORDER_BGGR, /** BGBGBGBGBG .. GRGRGRGRGR */
-	IA_CSS_BAYER_ORDER_GBRG, /** GBGBGBGBGB .. RGRGRGRGRG */
+	IA_CSS_BAYER_ORDER_GRBG, /* GRGRGRGRGR .. BGBGBGBGBG */
+	IA_CSS_BAYER_ORDER_RGGB, /* RGRGRGRGRG .. GBGBGBGBGB */
+	IA_CSS_BAYER_ORDER_BGGR, /* BGBGBGBGBG .. GRGRGRGRGR */
+	IA_CSS_BAYER_ORDER_GBRG, /* GBGBGBGBGB .. RGRGRGRGRG */
 };
 
 #define IA_CSS_BAYER_ORDER_NUM (IA_CSS_BAYER_ORDER_GBRG + 1)
@@ -35,57 +35,64 @@ enum ia_css_bayer_order {
  *  frame buffer.
  */
 struct ia_css_frame_plane {
-	unsigned int height; /** height of a plane in lines */
-	unsigned int width;  /** width of a line, in DMA elements, note that
-				  for RGB565 the three subpixels are stored in
-				  one element. For all other formats this is
-				  the number of subpixels per line. */
-	unsigned int stride; /** stride of a line in bytes */
-	unsigned int offset; /** offset in bytes to start of frame data.
-				  offset is wrt data field in ia_css_frame */
+	/* height of a plane in lines */
+	unsigned int height;
+	/*
+	 * width of a line, in DMA elements, note that for RGB565 the
+	 * three subpixels are stored in one element. For all other
+	 * formats this is the number of subpixels per line.
+	 */
+	unsigned int width;
+	/* stride of a line in bytes */
+	unsigned int stride;
+	/*
+	 * offset in bytes to start of frame data. offset is wrt data
+	 * field in ia_css_frame
+	 */
+	unsigned int offset;
 };
 
 /* Binary "plane". This is used to story binary streams such as jpeg
  *  images. This is not actually a real plane.
  */
 struct ia_css_frame_binary_plane {
-	unsigned int		  size; /** number of bytes in the stream */
-	struct ia_css_frame_plane data; /** plane */
+	unsigned int		  size; /* number of bytes in the stream */
+	struct ia_css_frame_plane data; /* plane */
 };
 
 /* Container for planar YUV frames. This contains 3 planes.
  */
 struct ia_css_frame_yuv_planes {
-	struct ia_css_frame_plane y; /** Y plane */
-	struct ia_css_frame_plane u; /** U plane */
-	struct ia_css_frame_plane v; /** V plane */
+	struct ia_css_frame_plane y; /* Y plane */
+	struct ia_css_frame_plane u; /* U plane */
+	struct ia_css_frame_plane v; /* V plane */
 };
 
 /* Container for semi-planar YUV frames.
   */
 struct ia_css_frame_nv_planes {
-	struct ia_css_frame_plane y;  /** Y plane */
-	struct ia_css_frame_plane uv; /** UV plane */
+	struct ia_css_frame_plane y;  /* Y plane */
+	struct ia_css_frame_plane uv; /* UV plane */
 };
 
 /* Container for planar RGB frames. Each color has its own plane.
  */
 struct ia_css_frame_rgb_planes {
-	struct ia_css_frame_plane r; /** Red plane */
-	struct ia_css_frame_plane g; /** Green plane */
-	struct ia_css_frame_plane b; /** Blue plane */
+	struct ia_css_frame_plane r; /* Red plane */
+	struct ia_css_frame_plane g; /* Green plane */
+	struct ia_css_frame_plane b; /* Blue plane */
 };
 
 /* Container for 6-plane frames. These frames are used internally
  *  in the advanced ISP only.
  */
 struct ia_css_frame_plane6_planes {
-	struct ia_css_frame_plane r;	  /** Red plane */
-	struct ia_css_frame_plane r_at_b; /** Red at blue plane */
-	struct ia_css_frame_plane gr;	  /** Red-green plane */
-	struct ia_css_frame_plane gb;	  /** Blue-green plane */
-	struct ia_css_frame_plane b;	  /** Blue plane */
-	struct ia_css_frame_plane b_at_r; /** Blue at red plane */
+	struct ia_css_frame_plane r;	  /* Red plane */
+	struct ia_css_frame_plane r_at_b; /* Red at blue plane */
+	struct ia_css_frame_plane gr;	  /* Red-green plane */
+	struct ia_css_frame_plane gb;	  /* Blue-green plane */
+	struct ia_css_frame_plane b;	  /* Blue plane */
+	struct ia_css_frame_plane b_at_r; /* Blue at red plane */
 };
 
 /* Crop info struct - stores the lines to be cropped in isp */
@@ -100,13 +107,21 @@ struct ia_css_crop_info {
 /* Frame info struct. This describes the contents of an image frame buffer.
   */
 struct ia_css_frame_info {
-	struct ia_css_resolution res; /** Frame resolution (valid data) */
-	unsigned int padded_width; /** stride of line in memory (in pixels) */
-	enum ia_css_frame_format format; /** format of the frame data */
-	unsigned int raw_bit_depth; /** number of valid bits per pixel,
-					 only valid for RAW bayer frames */
-	enum ia_css_bayer_order raw_bayer_order; /** bayer order, only valid
-						      for RAW bayer frames */
+	/* Frame resolution (valid data) */
+	struct ia_css_resolution res;
+	/* stride of line in memory (in pixels) */
+	unsigned int padded_width;
+	/* format of the frame data */
+	enum ia_css_frame_format format;
+	/*
+	 * number of valid bits per pixel, only valid for RAW bayer
+	 * frames
+	 */
+	unsigned int raw_bit_depth;
+	/*
+	 * bayer order, only valid for RAW bayer frames
+	 */
+	enum ia_css_bayer_order raw_bayer_order;
 	/* the params below are computed based on bayer_order
 	 * we can remove the raw_bayer_order if it is redundant
 	 * keeping it for now as bxt and fpn code seem to use it
@@ -123,9 +138,9 @@ struct ia_css_frame_info {
  *  Specifies the DVS loop delay in "frame periods"
  */
 enum ia_css_frame_delay {
-	IA_CSS_FRAME_DELAY_0, /** Frame delay = 0 */
-	IA_CSS_FRAME_DELAY_1, /** Frame delay = 1 */
-	IA_CSS_FRAME_DELAY_2  /** Frame delay = 2 */
+	IA_CSS_FRAME_DELAY_0, /* Frame delay = 0 */
+	IA_CSS_FRAME_DELAY_1, /* Frame delay = 1 */
+	IA_CSS_FRAME_DELAY_2  /* Frame delay = 2 */
 };
 
 /* Frame structure. This structure describes an image buffer or frame.
@@ -143,9 +158,12 @@ struct ia_css_frame {
 	struct vb2_v4l2_buffer vb;
 	/* List-head for linking into the activeq or buffers_waiting_for_param list */
 	struct list_head queue;
-	struct ia_css_frame_info frame_info; /** info struct describing the frame */
-	ia_css_ptr   data;	       /** pointer to start of image data */
-	unsigned int data_bytes;       /** size of image data in bytes */
+	/* info struct describing the frame */
+	struct ia_css_frame_info frame_info;
+	/* pointer to start of image data */
+	ia_css_ptr   data;
+	/* size of image data in bytes */
+	unsigned int data_bytes;
 	/* LA: move this to ia_css_buffer */
 	/*
 	 * -1 if data address is static during life time of pipeline
@@ -161,10 +179,19 @@ struct ia_css_frame {
 	 * binary, we use output port, but we expect VF_OUTPUT_DONE event
 	 */
 	enum ia_css_buffer_type buf_type;
+	/* exposure id, see ia_css_event_public.h for more detail */
 	unsigned int exp_id;
-	/** exposure id, see ia_css_event_public.h for more detail */
-	u32 isp_config_id; /** Unique ID to track which config was actually applied to a particular frame */
-	bool valid; /** First video output frame is not valid */
+	/*
+	 * Unique ID to track which config was actually applied to a
+	 * particular frame
+	 */
+	u32 isp_config_id;
+	/* First video output frame is not valid */
+	bool valid;
+	/*
+	 * frame planes, select the right one based on
+	 * info.format
+	 */
 	union {
 		unsigned int	_initialisation_dummy;
 		struct ia_css_frame_plane raw;
@@ -175,8 +202,7 @@ struct ia_css_frame {
 		struct ia_css_frame_nv_planes nv;
 		struct ia_css_frame_plane6_planes plane6;
 		struct ia_css_frame_binary_plane binary;
-	} planes; /** frame planes, select the right one based on
-		       info.format */
+	} planes;
 };
 
 #define vb_to_frame(vb2) \
diff --git a/drivers/staging/media/atomisp/pci/ia_css_input_port.h b/drivers/staging/media/atomisp/pci/ia_css_input_port.h
index f138dfa8f6b2..3a515f433713 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_input_port.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_input_port.h
@@ -25,28 +25,28 @@
  *  be run without compression.
  */
 enum ia_css_csi2_compression_type {
-	IA_CSS_CSI2_COMPRESSION_TYPE_NONE, /** No compression */
-	IA_CSS_CSI2_COMPRESSION_TYPE_1,    /** Compression scheme 1 */
-	IA_CSS_CSI2_COMPRESSION_TYPE_2     /** Compression scheme 2 */
+	IA_CSS_CSI2_COMPRESSION_TYPE_NONE,	/* No compression */
+	IA_CSS_CSI2_COMPRESSION_TYPE_1,		/* Compression scheme 1 */
+	IA_CSS_CSI2_COMPRESSION_TYPE_2		/* Compression scheme 2 */
 };
 
 struct ia_css_csi2_compression {
+	/* Compression used */
 	enum ia_css_csi2_compression_type type;
-	/** Compression used */
+	/* Compressed bits per pixel (only when compression is enabled) */
 	unsigned int                      compressed_bits_per_pixel;
-	/** Compressed bits per pixel (only when compression is enabled) */
+	/* Uncompressed bits per pixel (only when compression is enabled) */
 	unsigned int                      uncompressed_bits_per_pixel;
-	/** Uncompressed bits per pixel (only when compression is enabled) */
 };
 
 /* Input port structure.
  */
 struct ia_css_input_port {
-	enum mipi_port_id port; /** Physical CSI-2 port */
-	unsigned int num_lanes; /** Number of lanes used (4-lane port only) */
-	unsigned int timeout;   /** Timeout value */
-	unsigned int rxcount;   /** Register value, should include all lanes */
-	struct ia_css_csi2_compression compression; /** Compression used */
+	enum mipi_port_id port; /* Physical CSI-2 port */
+	unsigned int num_lanes; /* Number of lanes used (4-lane port only) */
+	unsigned int timeout;   /* Timeout value */
+	unsigned int rxcount;   /* Register value, should include all lanes */
+	struct ia_css_csi2_compression compression; /* Compression used */
 };
 
 #endif /* __IA_CSS_INPUT_PORT_H */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
index 2a4f11f9d785..60190b3ecda2 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
@@ -19,8 +19,8 @@
 /* Interrupt types, these enumerate all supported interrupt types.
  */
 enum ia_css_irq_type {
-	IA_CSS_IRQ_TYPE_EDGE,  /** Edge (level) sensitive interrupt */
-	IA_CSS_IRQ_TYPE_PULSE  /** Pulse-shaped interrupt */
+	IA_CSS_IRQ_TYPE_EDGE,	/* Edge (level) sensitive interrupt */
+	IA_CSS_IRQ_TYPE_PULSE	/* Pulse-shaped interrupt */
 };
 
 /* Interrupt request type.
@@ -38,50 +38,50 @@ enum ia_css_irq_type {
  * (SW) interrupts
  */
 enum ia_css_irq_info {
+	/* the css receiver has encountered an error */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR            = BIT(0),
-	/** the css receiver has encountered an error */
+	/* the FIFO in the csi receiver has overflown */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_FIFO_OVERFLOW    = BIT(1),
-	/** the FIFO in the csi receiver has overflown */
+	/* the css receiver received the start of frame */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF              = BIT(2),
-	/** the css receiver received the start of frame */
+	/* the css receiver received the end of frame */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_EOF              = BIT(3),
-	/** the css receiver received the end of frame */
+	/* the css receiver received the start of line */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_SOL              = BIT(4),
-	/** the css receiver received the start of line */
+	/* One or more events are available in the PSYS event queue */
 	IA_CSS_IRQ_INFO_EVENTS_READY                  = BIT(5),
-	/** One or more events are available in the PSYS event queue */
+	/* the css receiver received the end of line */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_EOL              = BIT(6),
-	/** the css receiver received the end of line */
+	/* the css receiver received a change in side band signals */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_SIDEBAND_CHANGED = BIT(7),
-	/** the css receiver received a change in side band signals */
+	/* generic short packets (0) */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_GEN_SHORT_0      = BIT(8),
-	/** generic short packets (0) */
+	/* generic short packets (1) */
 	IA_CSS_IRQ_INFO_CSS_RECEIVER_GEN_SHORT_1      = BIT(9),
-	/** generic short packets (1) */
+	/* the primary input formatter (A) has encountered an error */
 	IA_CSS_IRQ_INFO_IF_PRIM_ERROR                 = BIT(10),
-	/** the primary input formatter (A) has encountered an error */
+	/* the primary input formatter (B) has encountered an error */
 	IA_CSS_IRQ_INFO_IF_PRIM_B_ERROR               = BIT(11),
-	/** the primary input formatter (B) has encountered an error */
+	/* the secondary input formatter has encountered an error */
 	IA_CSS_IRQ_INFO_IF_SEC_ERROR                  = BIT(12),
-	/** the secondary input formatter has encountered an error */
+	/* the stream-to-memory device has encountered an error */
 	IA_CSS_IRQ_INFO_STREAM_TO_MEM_ERROR           = BIT(13),
-	/** the stream-to-memory device has encountered an error */
+	/* software interrupt 0 */
 	IA_CSS_IRQ_INFO_SW_0                          = BIT(14),
-	/** software interrupt 0 */
+	/* software interrupt 1 */
 	IA_CSS_IRQ_INFO_SW_1                          = BIT(15),
-	/** software interrupt 1 */
+	/* software interrupt 2 */
 	IA_CSS_IRQ_INFO_SW_2                          = BIT(16),
-	/** software interrupt 2 */
+	/* ISP binary statistics are ready */
 	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = BIT(17),
-	/** ISP binary statistics are ready */
+	/* the input system is in error */
 	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = BIT(18),
-	/** the input system is in error */
+	/* the input formatter is in error */
 	IA_CSS_IRQ_INFO_IF_ERROR                      = BIT(19),
-	/** the input formatter is in error */
+	/* the dma is in error */
 	IA_CSS_IRQ_INFO_DMA_ERROR                     = BIT(20),
-	/** the dma is in error */
+	/* end-of-frame events are ready in the isys_event queue */
 	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = BIT(21),
-	/** end-of-frame events are ready in the isys_event queue */
 };
 
 /* CSS receiver error types. Whenever the CSS receiver has encountered
@@ -95,22 +95,22 @@ enum ia_css_irq_info {
  * different receiver types, or possibly none in case of tests systems.
  */
 enum ia_css_rx_irq_info {
-	IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN   = BIT(0),  /** buffer overrun */
-	IA_CSS_RX_IRQ_INFO_ENTER_SLEEP_MODE = BIT(1),  /** entering sleep mode */
-	IA_CSS_RX_IRQ_INFO_EXIT_SLEEP_MODE  = BIT(2),  /** exited sleep mode */
-	IA_CSS_RX_IRQ_INFO_ECC_CORRECTED    = BIT(3),  /** ECC corrected */
+	IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN   = BIT(0),  /* buffer overrun */
+	IA_CSS_RX_IRQ_INFO_ENTER_SLEEP_MODE = BIT(1),  /* entering sleep mode */
+	IA_CSS_RX_IRQ_INFO_EXIT_SLEEP_MODE  = BIT(2),  /* exited sleep mode */
+	IA_CSS_RX_IRQ_INFO_ECC_CORRECTED    = BIT(3),  /* ECC corrected */
+	/* Start of transmission */
 	IA_CSS_RX_IRQ_INFO_ERR_SOT          = BIT(4),
-	/** Start of transmission */
-	IA_CSS_RX_IRQ_INFO_ERR_SOT_SYNC     = BIT(5),  /** SOT sync (??) */
-	IA_CSS_RX_IRQ_INFO_ERR_CONTROL      = BIT(6),  /** Control (??) */
-	IA_CSS_RX_IRQ_INFO_ERR_ECC_DOUBLE   = BIT(7),  /** Double ECC */
-	IA_CSS_RX_IRQ_INFO_ERR_CRC          = BIT(8),  /** CRC error */
-	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ID   = BIT(9),  /** Unknown ID */
-	IA_CSS_RX_IRQ_INFO_ERR_FRAME_SYNC   = BIT(10), /** Frame sync error */
-	IA_CSS_RX_IRQ_INFO_ERR_FRAME_DATA   = BIT(11), /** Frame data error */
-	IA_CSS_RX_IRQ_INFO_ERR_DATA_TIMEOUT = BIT(12), /** Timeout occurred */
-	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ESC  = BIT(13), /** Unknown escape seq. */
-	IA_CSS_RX_IRQ_INFO_ERR_LINE_SYNC    = BIT(14), /** Line Sync error */
+	IA_CSS_RX_IRQ_INFO_ERR_SOT_SYNC     = BIT(5),  /* SOT sync (??) */
+	IA_CSS_RX_IRQ_INFO_ERR_CONTROL      = BIT(6),  /* Control (??) */
+	IA_CSS_RX_IRQ_INFO_ERR_ECC_DOUBLE   = BIT(7),  /* Double ECC */
+	IA_CSS_RX_IRQ_INFO_ERR_CRC          = BIT(8),  /* CRC error */
+	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ID   = BIT(9),  /* Unknown ID */
+	IA_CSS_RX_IRQ_INFO_ERR_FRAME_SYNC   = BIT(10), /* Frame sync error */
+	IA_CSS_RX_IRQ_INFO_ERR_FRAME_DATA   = BIT(11), /* Frame data error */
+	IA_CSS_RX_IRQ_INFO_ERR_DATA_TIMEOUT = BIT(12), /* Timeout occurred */
+	IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ESC  = BIT(13), /* Unknown escape seq. */
+	IA_CSS_RX_IRQ_INFO_ERR_LINE_SYNC    = BIT(14), /* Line Sync error */
 	IA_CSS_RX_IRQ_INFO_INIT_TIMEOUT     = BIT(15),
 };
 
@@ -119,12 +119,12 @@ enum ia_css_rx_irq_info {
  *  to perform the correct action.
  */
 struct ia_css_irq {
-	enum ia_css_irq_info type; /** Interrupt type. */
-	unsigned int sw_irq_0_val; /** In case of SW interrupt 0, value. */
-	unsigned int sw_irq_1_val; /** In case of SW interrupt 1, value. */
-	unsigned int sw_irq_2_val; /** In case of SW interrupt 2, value. */
+	enum ia_css_irq_info type;	/* Interrupt type. */
+	unsigned int sw_irq_0_val;	/* In case of SW interrupt 0, value. */
+	unsigned int sw_irq_1_val;	/* In case of SW interrupt 1, value. */
+	unsigned int sw_irq_2_val;	/* In case of SW interrupt 2, value. */
+	/* The image pipe that generated the interrupt. */
 	struct ia_css_pipe *pipe;
-	/** The image pipe that generated the interrupt. */
 };
 
 /* @brief Obtain interrupt information.
diff --git a/drivers/staging/media/atomisp/pci/ia_css_metadata.h b/drivers/staging/media/atomisp/pci/ia_css_metadata.h
index 348836175770..d17f01098756 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_metadata.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_metadata.h
@@ -21,24 +21,27 @@
  *  to process sensor metadata.
  */
 struct ia_css_metadata_config {
-	enum atomisp_input_format data_type; /** Data type of CSI-2 embedded
-			data. The default value is ATOMISP_INPUT_FORMAT_EMBEDDED. For
-			certain sensors, user can choose non-default data type for embedded
-			data. */
-	struct ia_css_resolution  resolution; /** Resolution */
+	/*
+	 * Data type of CSI-2 embedded
+	 * data. The default value is ATOMISP_INPUT_FORMAT_EMBEDDED. For
+	 * certain sensors, user can choose non-default data type for embedded
+	 * data.
+	 */
+	enum atomisp_input_format data_type;
+	struct ia_css_resolution  resolution;	/* Resolution */
 };
 
 struct ia_css_metadata_info {
-	struct ia_css_resolution resolution; /** Resolution */
-	u32                 stride;     /** Stride in bytes */
-	u32                 size;       /** Total size in bytes */
+	struct ia_css_resolution resolution;	/* Resolution */
+	u32                 stride;		/* Stride in bytes */
+	u32                 size;		/* Total size in bytes */
 };
 
 struct ia_css_metadata {
-	struct ia_css_metadata_info info;    /** Layout info */
-	ia_css_ptr		    address; /** CSS virtual address */
+	struct ia_css_metadata_info info;	/* Layout info */
+	ia_css_ptr		    address;	/* CSS virtual address */
+	/* Exposure ID, see ia_css_event_public.h for more detail */
 	u32		    exp_id;
-	/** Exposure ID, see ia_css_event_public.h for more detail */
 };
 
 #define SIZE_OF_IA_CSS_METADATA_STRUCT sizeof(struct ia_css_metadata)
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 1d1b704b2bc6..b9b6574fe1bd 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -33,12 +33,19 @@ enum {
  *  create a continuous capture stream.
  */
 enum ia_css_pipe_mode {
-	IA_CSS_PIPE_MODE_PREVIEW,	/** Preview pipe */
-	IA_CSS_PIPE_MODE_VIDEO,		/** Video pipe */
-	IA_CSS_PIPE_MODE_CAPTURE,	/** Still capture pipe */
-	IA_CSS_PIPE_MODE_COPY,		/** Copy pipe, only used for embedded/image data copying */
-	IA_CSS_PIPE_MODE_YUVPP,		/** YUV post processing pipe, used for all use cases with YUV input,
-									for SoC sensor and external ISP */
+	/* Preview pipe */
+	IA_CSS_PIPE_MODE_PREVIEW,
+	/* Video pipe */
+	IA_CSS_PIPE_MODE_VIDEO,
+	/* Still capture pipe */
+	IA_CSS_PIPE_MODE_CAPTURE,
+	/* Copy pipe, only used for embedded/image data copying */
+	IA_CSS_PIPE_MODE_COPY,
+	/*
+	 * YUV post processing pipe, used for all use cases with YUV
+	 * input, for SoC sensor and external ISP
+	 */
+	IA_CSS_PIPE_MODE_YUVPP,
 };
 
 /* Temporary define  */
@@ -49,10 +56,10 @@ enum ia_css_pipe_mode {
  * the order should match with definition in sh_css_defs.h
  */
 enum ia_css_pipe_version {
-	IA_CSS_PIPE_VERSION_1 = 1,		/** ISP1.0 pipe */
-	IA_CSS_PIPE_VERSION_2_2 = 2,		/** ISP2.2 pipe */
-	IA_CSS_PIPE_VERSION_2_6_1 = 3,		/** ISP2.6.1 pipe */
-	IA_CSS_PIPE_VERSION_2_7 = 4		/** ISP2.7 pipe */
+	IA_CSS_PIPE_VERSION_1 = 1,		/* ISP1.0 pipe */
+	IA_CSS_PIPE_VERSION_2_2 = 2,		/* ISP2.2 pipe */
+	IA_CSS_PIPE_VERSION_2_6_1 = 3,		/* ISP2.6.1 pipe */
+	IA_CSS_PIPE_VERSION_2_7 = 4		/* ISP2.7 pipe */
 };
 
 /*
@@ -61,66 +68,90 @@ enum ia_css_pipe_version {
  * set by AIC
  */
 struct ia_css_pipe_config {
+	/* mode, indicates which mode the pipe should use. */
 	enum ia_css_pipe_mode mode;
-	/** mode, indicates which mode the pipe should use. */
+	/*
+	 * Pipe version, indicates which imaging pipeline the pipe
+	 * should use.
+	 */
 	enum ia_css_pipe_version isp_pipe_version;
-	/** pipe version, indicates which imaging pipeline the pipe should use. */
+	/* input effective resolution */
 	struct ia_css_resolution input_effective_res;
-	/** input effective resolution */
+	/* bayer down scaling */
 	struct ia_css_resolution bayer_ds_out_res;
-	/** bayer down scaling */
+	/* capture post processing input resolution */
 	struct ia_css_resolution capt_pp_in_res;
-	/** capture post processing input resolution */
+	/* ISP2401: view finder post processing input resolution */
 	struct ia_css_resolution vf_pp_in_res;
 
-	/** ISP2401: view finder post processing input resolution */
+	/*
+	 * For IPU3 only: use output_system_in_res to specify what input
+	 * resolution will OSYS receive, this resolution is equal to the
+	 * output resolution of GDC if not determined CSS will set
+	 * output_system_in_res with main osys output pin resolution All
+	 * other IPUs may ignore this property
+	 */
 	struct ia_css_resolution output_system_in_res;
-	/** For IPU3 only: use output_system_in_res to specify what input resolution
-	     will OSYS receive, this resolution is equal to the output resolution of GDC
-	     if not determined CSS will set output_system_in_res with main osys output pin resolution
-	     All other IPUs may ignore this property */
+	/* dvs crop, video only, not in use yet. Use dvs_envelope below. */
 	struct ia_css_resolution dvs_crop_out_res;
-	/** dvs crop, video only, not in use yet. Use dvs_envelope below. */
+	/* output of YUV scaling */
 	struct ia_css_frame_info output_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
-	/** output of YUV scaling */
+	/* output of VF YUV scaling */
 	struct ia_css_frame_info vf_output_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
-	/** output of VF YUV scaling */
+	/* Default capture config for initial capture pipe configuration. */
 	struct ia_css_capture_config default_capture_config;
-	/** Default capture config for initial capture pipe configuration. */
-	struct ia_css_resolution dvs_envelope; /** temporary */
+	/* temporary */
+	struct ia_css_resolution dvs_envelope;
+	/* indicates the DVS loop delay in frame periods */
 	enum ia_css_frame_delay dvs_frame_delay;
-	/** indicates the DVS loop delay in frame periods */
+	/*
+	 * Disabling digital zoom for a pipeline, if this is set to
+	 * false, then setting a zoom factor will have no effect. In
+	 * some use cases this provides better performance.
+	 */
 	bool enable_dz;
-	/** Disabling digital zoom for a pipeline, if this is set to false,
-	     then setting a zoom factor will have no effect.
-	     In some use cases this provides better performance. */
+	/*
+	 * Disabling "Defect Pixel Correction" for a pipeline, if this
+	 * is set to false. In some use cases this provides better
+	 * performance.
+	 */
 	bool enable_dpc;
-	/** Disabling "Defect Pixel Correction" for a pipeline, if this is set
-	     to false. In some use cases this provides better performance. */
+	/*
+	 * Enabling BCI mode will cause yuv_scale binary to be picked up
+	 * instead of vf_pp. This only applies to viewfinder post
+	 * processing stages.
+	 */
 	bool enable_vfpp_bci;
-	/** Enabling BCI mode will cause yuv_scale binary to be picked up
-	     instead of vf_pp. This only applies to viewfinder post
-	     processing stages. */
 
 /* ISP2401 */
+	/*
+	 * Enabling of TNR (temporal noise reduction). This is only
+	 * applicable to video pipes. Non video-pipes should always set
+	 * this parameter to false.
+	 */
 	bool enable_tnr;
-	/** Enabling of TNR (temporal noise reduction). This is only applicable to video
-	     pipes. Non video-pipes should always set this parameter to false. */
 
+	/* Pointer to ISP configuration */
 	struct ia_css_isp_config *p_isp_config;
-	/** Pointer to ISP configuration */
+	/* GDC in buffer resolution. */
 	struct ia_css_resolution gdc_in_buffer_res;
-	/** GDC in buffer resolution. */
+	/*
+	 * GDC in buffer offset - indicates the pixel coordinates of the
+	 * first valid pixel inside the buffer
+	 */
 	struct ia_css_point gdc_in_buffer_offset;
-	/** GDC in buffer offset - indicates the pixel coordinates of the first valid pixel inside the buffer */
 
 /* ISP2401 */
+	/*
+	 * Origin of internal frame positioned on shading table at
+	 * shading correction in ISP.
+	 * NOTE: Shading table is larger than or equal to internal
+	 *       frame. Shading table has shading gains and internal
+	 *       frame has bayer data. The origin of internal frame is
+	 *       used in shading correction in ISP to retrieve shading
+	 *       gains which correspond to bayer data.
+	 */
 	struct ia_css_coordinate internal_frame_origin_bqs_on_sctbl;
-	/** Origin of internal frame positioned on shading table at shading correction in ISP.
-	     NOTE: Shading table is larger than or equal to internal frame.
-		   Shading table has shading gains and internal frame has bayer data.
-		   The origin of internal frame is used in shading correction in ISP
-		   to retrieve shading gains which correspond to bayer data. */
 };
 
 /*
@@ -141,38 +172,55 @@ struct ia_css_pipe_config {
  *           - On the Behalf of CSS-API Committee.
  */
 struct ia_css_pipe_info {
+	/*
+	 * Info about output resolution. This contains the stride which
+	 * should be used for memory allocation.
+	 */
 	struct ia_css_frame_info output_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
-	/** Info about output resolution. This contains the stride which
-	     should be used for memory allocation. */
+	/*
+	 * Info about viewfinder output resolution (optional). This
+	 * contains the stride that should be used for memory
+	 * allocation.
+	 */
 	struct ia_css_frame_info vf_output_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
-	/** Info about viewfinder output resolution (optional). This contains
-	     the stride that should be used for memory allocation. */
+	/*
+	 * Raw output resolution. This indicates the resolution of the
+	 * RAW bayer output for pipes that support this. Currently, only
+	 * the still capture pipes support this feature. When this
+	 * resolution is smaller than the input resolution, cropping
+	 * will be performed by the ISP. The first cropping that will be
+	 * performed is on the upper left corner where we crop 8 lines
+	 * and 8 columns to remove the pixels normally used to
+	 * initialize the ISP filters. This is why the raw output
+	 * resolution should normally be set to the input resolution -
+	 * 8x8.
+	 */
 	struct ia_css_frame_info raw_output_info;
-	/** Raw output resolution. This indicates the resolution of the
-	     RAW bayer output for pipes that support this. Currently, only the
-	     still capture pipes support this feature. When this resolution is
-	     smaller than the input resolution, cropping will be performed by
-	     the ISP. The first cropping that will be performed is on the upper
-	     left corner where we crop 8 lines and 8 columns to remove the
-	     pixels normally used to initialize the ISP filters.
-	     This is why the raw output resolution should normally be set to
-	     the input resolution - 8x8. */
 	/* ISP2401 */
+	/*
+	 * For IPU3 only. Info about output system in resolution which
+	 * is considered as gdc out resolution.
+	 */
 	struct ia_css_resolution output_system_in_res_info;
-	/** For IPU3 only. Info about output system in resolution which is considered
-	     as gdc out resolution. */
+	/*
+	 * After an image pipe is created, this field will contain the
+	 * info for the shading correction.
+	 */
 	struct ia_css_shading_info shading_info;
-	/** After an image pipe is created, this field will contain the info
-	     for the shading correction. */
+	/*
+	 * After an image pipe is created, this field will contain the
+	 * grid info for 3A and DVS.
+	 */
 	struct ia_css_grid_info  grid_info;
-	/** After an image pipe is created, this field will contain the grid
-	     info for 3A and DVS. */
+	/*
+	 * The very first frames in a started stream do not contain
+	 * valid data. In this field, the CSS-firmware communicates to
+	 * the host-driver how many initial frames will contain invalid
+	 * data; this allows the host-driver to discard those initial
+	 * invalid frames and start it's output at the first valid
+	 * frame.
+	 */
 	int num_invalid_frames;
-	/** The very first frames in a started stream do not contain valid data.
-	     In this field, the CSS-firmware communicates to the host-driver how
-	     many initial frames will contain invalid data; this allows the
-	     host-driver to discard those initial invalid frames and start it's
-	     output at the first valid frame. */
 };
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/ia_css_prbs.h b/drivers/staging/media/atomisp/pci/ia_css_prbs.h
index 3bb1e5dbb4fc..400c91bb1ab2 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_prbs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_prbs.h
@@ -36,10 +36,12 @@ enum ia_css_prbs_id {
  */
 struct ia_css_prbs_config {
 	enum ia_css_prbs_id	id;
-	unsigned int		h_blank;	/** horizontal blank */
-	unsigned int		v_blank;	/** vertical blank */
-	int			seed;	/** random seed for the 1st 2-pixel-components/clock */
-	int			seed1;	/** random seed for the 2nd 2-pixel-components/clock */
+	unsigned int		h_blank;	/* horizontal blank */
+	unsigned int		v_blank;	/* vertical blank */
+	/* random seed for the 1st 2-pixel-components/clock */
+	int			seed;
+	/* random seed for the 2nd 2-pixel-components/clock */
+	int			seed1;
 };
 
 #endif /* __IA_CSS_PRBS_H */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_properties.h b/drivers/staging/media/atomisp/pci/ia_css_properties.h
index 3f087e2df99a..9ef6aee66651 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_properties.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_properties.h
@@ -16,8 +16,11 @@
 
 struct ia_css_properties {
 	int  gdc_coord_one;
-	bool l1_base_is_index; /** Indicate whether the L1 page base
-				    is a page index or a byte address. */
+	/*
+	 * Indicate whether the L1 page base
+	 * is a page index or a byte address.
+	 */
+	bool l1_base_is_index;
 	enum ia_css_vamem_type vamem_type;
 };
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index a505f3797962..4a5e99db232b 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -25,23 +25,32 @@
  * Note that not all ISP modes support all input modes.
  */
 enum ia_css_input_mode {
-	IA_CSS_INPUT_MODE_SENSOR, /** data from sensor */
-	IA_CSS_INPUT_MODE_FIFO,   /** data from input-fifo */
-	IA_CSS_INPUT_MODE_TPG,    /** data from test-pattern generator */
-	IA_CSS_INPUT_MODE_PRBS,   /** data from pseudo-random bit stream */
-	IA_CSS_INPUT_MODE_MEMORY, /** data from a frame in memory */
-	IA_CSS_INPUT_MODE_BUFFERED_SENSOR /** data is sent through mipi buffer */
+	IA_CSS_INPUT_MODE_SENSOR, /* data from sensor */
+	IA_CSS_INPUT_MODE_FIFO,   /* data from input-fifo */
+	IA_CSS_INPUT_MODE_TPG,    /* data from test-pattern generator */
+	IA_CSS_INPUT_MODE_PRBS,   /* data from pseudo-random bit stream */
+	IA_CSS_INPUT_MODE_MEMORY, /* data from a frame in memory */
+	IA_CSS_INPUT_MODE_BUFFERED_SENSOR /* data is sent through mipi buffer */
 };
 
 /* Structure of the MIPI buffer configuration
  */
 struct ia_css_mipi_buffer_config {
-	unsigned int size_mem_words; /** The frame size in the system memory
-					  words (32B) */
-	bool contiguous;	     /** Allocated memory physically
-					  contiguously or not. \deprecated{Will be false always.}*/
-	unsigned int nof_mipi_buffers; /** The number of MIPI buffers required for this
-					stream */
+	/*
+	 * The frame size in the system memory
+	 * words (32B)
+	 */
+	unsigned int size_mem_words;
+	/*
+	 * Allocated memory physically
+	 * contiguously or not. \deprecated{Will be false always.}
+	 */
+	bool contiguous;
+	/*
+	 * The number of MIPI buffers required for this
+	 * stream
+	 */
+	unsigned int nof_mipi_buffers;
 };
 
 enum {
@@ -55,41 +64,56 @@ enum {
  *  multiple of this in one virtual channel.
  */
 struct ia_css_stream_isys_stream_config {
-	struct ia_css_resolution  input_res; /** Resolution of input data */
-	enum atomisp_input_format format; /** Format of input stream. This data
-					       format will be mapped to MIPI data
-					       type internally. */
-	int linked_isys_stream_id; /** default value is -1, other value means
-							current isys_stream shares the same buffer with
-							indicated isys_stream*/
-	bool valid; /** indicate whether other fields have valid value */
+	struct ia_css_resolution  input_res; /* Resolution of input data */
+	/*
+	 * Format of input stream. This data
+	 * format will be mapped to MIPI data
+	 * type internally.
+	 */
+	enum atomisp_input_format format;
+	/*
+	 * default value is -1, other value means
+	 * current isys_stream shares the same buffer with
+	 * indicated isys_stream
+	 */
+	int linked_isys_stream_id;
+	bool valid; /* indicate whether other fields have valid value */
 };
 
 struct ia_css_stream_input_config {
-	struct ia_css_resolution  input_res; /** Resolution of input data */
-	struct ia_css_resolution  effective_res; /** Resolution of input data.
-							Used for CSS 2400/1 System and deprecated for other
-							systems (replaced by input_effective_res in
-							ia_css_pipe_config) */
-	enum atomisp_input_format format; /** Format of input stream. This data
-					       format will be mapped to MIPI data
-					       type internally. */
-	enum ia_css_bayer_order bayer_order; /** Bayer order for RAW streams */
+	struct ia_css_resolution  input_res; /* Resolution of input data */
+	/*
+	 * Resolution of input data.
+	 * Used for CSS 2400/1 System and deprecated for other
+	 * systems (replaced by input_effective_res in
+	 * ia_css_pipe_config)
+	 */
+	struct ia_css_resolution  effective_res;
+	/*
+	 * Format of input stream. This data
+	 * format will be mapped to MIPI data
+	 * type internally.
+	 */
+	enum atomisp_input_format format;
+	enum ia_css_bayer_order bayer_order; /* Bayer order for RAW streams */
 };
 
 /* Input stream description. This describes how input will flow into the
  *  CSS. This is used to program the CSS hardware.
  */
 struct ia_css_stream_config {
-	enum ia_css_input_mode    mode; /** Input mode */
+	enum ia_css_input_mode    mode; /* Input mode */
 	union {
-		struct ia_css_input_port  port; /** Port, for sensor only. */
-		struct ia_css_prbs_config prbs; /** PRBS configuration */
-	} source; /** Source of input data */
-	unsigned int	      channel_id; /** Channel on which input data
-						   will arrive. Use this field
-						   to specify virtual channel id.
-						   Valid values are: 0, 1, 2, 3 */
+		struct ia_css_input_port  port; /* Port, for sensor only. */
+		struct ia_css_prbs_config prbs; /* PRBS configuration */
+	} source; /* Source of input data */
+	/*
+	 * Channel on which input data
+	 * will arrive. Use this field
+	 * to specify virtual channel id.
+	 * Valid values are: 0, 1, 2, 3
+	 */
+	unsigned int	      channel_id;
 	struct ia_css_stream_isys_stream_config
 		isys_config[IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH];
 	struct ia_css_stream_input_config input_config;
@@ -100,34 +124,61 @@ struct ia_css_stream_config {
 	 * in the form 2^N * 2^N
 	 */
 	/* ISP2401 */
-	unsigned int sensor_binning_factor; /** Binning factor used by sensor
-						 to produce image data. This is
-						 used for shading correction. */
-	unsigned int pixels_per_clock; /** Number of pixels per clock, which can be
-					    1, 2 or 4. */
-	bool online; /** offline will activate RAW copy on SP, use this for
-			  continuous capture. */
+	/*
+	 * Binning factor used by sensor
+	 * to produce image data. This is
+	 * used for shading correction.
+	 */
+	unsigned int sensor_binning_factor;
+	/*
+	 * Number of pixels per clock, which can be
+	 * 1, 2 or 4.
+	 */
+	unsigned int pixels_per_clock;
+	/*
+	 * offline will activate RAW copy on SP, use this for
+	 * continuous capture.
+	 */
+	bool online;
 	/* ISYS2401 usage: ISP receives data directly from sensor, no copy. */
-	unsigned int init_num_cont_raw_buf; /** initial number of raw buffers to
-					     allocate */
-	unsigned int target_num_cont_raw_buf; /** total number of raw buffers to
-					     allocate */
-	bool pack_raw_pixels; /** Pack pixels in the raw buffers */
-	bool continuous; /** Use SP copy feature to continuously capture frames
-			      to system memory and run pipes in offline mode */
-	bool disable_cont_viewfinder; /** disable continuous viewfinder for ZSL use case */
-	s32 flash_gpio_pin; /** pin on which the flash is connected, -1 for no flash */
-	int left_padding; /** The number of input-formatter left-paddings, -1 for default from binary.*/
-	struct ia_css_mipi_buffer_config
-		mipi_buffer_config; /** mipi buffer configuration */
-	struct ia_css_metadata_config
-		metadata_config;     /** Metadata configuration. */
-	bool ia_css_enable_raw_buffer_locking; /** Enable Raw Buffer Locking for HALv3 Support */
+	/*
+	 * initial number of raw buffers to
+	 * allocate
+	 */
+	unsigned int init_num_cont_raw_buf;
+	/*
+	 * total number of raw buffers to
+	 * allocate
+	 */
+	unsigned int target_num_cont_raw_buf;
+	bool pack_raw_pixels; /* Pack pixels in the raw buffers */
+	/*
+	 * Use SP copy feature to continuously capture frames
+	 * to system memory and run pipes in offline mode
+	 */
+	bool continuous;
+	/* disable continuous viewfinder for ZSL use case */
+	bool disable_cont_viewfinder;
+	/* pin on which the flash is connected, -1 for no flash */
+	s32 flash_gpio_pin;
+	/*
+	 * The number of input-formatter left-paddings, -1 for default from
+	 * binary.
+	 */
+	int left_padding;
+	/* mipi buffer configuration */
+	struct ia_css_mipi_buffer_config mipi_buffer_config;
+	/* Metadata configuration. */
+	struct ia_css_metadata_config metadata_config;
+	/* Enable Raw Buffer Locking for HALv3 Support */
+	bool ia_css_enable_raw_buffer_locking;
+	/*
+	 * Lock all RAW buffers (true) or lock only buffers processed by
+	 * video or preview pipe (false).
+	 * This setting needs to be enabled to allow raw buffer locking
+	 * without continuous viewfinder.
+	 */
 	bool lock_all;
-	/** Lock all RAW buffers (true) or lock only buffers processed by
-	     video or preview pipe (false).
-	     This setting needs to be enabled to allow raw buffer locking
-	     without continuous viewfinder. */
 };
 
 struct ia_css_stream;
@@ -136,8 +187,8 @@ struct ia_css_stream;
  *  created.
  */
 struct ia_css_stream_info {
+	/* Info about the metadata layout, this contains the stride. */
 	struct ia_css_metadata_info metadata_info;
-	/** Info about the metadata layout, this contains the stride. */
 };
 
 /* @brief Load default stream configuration
diff --git a/drivers/staging/media/atomisp/pci/ia_css_timer.h b/drivers/staging/media/atomisp/pci/ia_css_timer.h
index 5c73e8c61588..d2e6cdee8f40 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_timer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_timer.h
@@ -19,27 +19,27 @@ typedef u32 clock_value_t;
 
 /* @brief 32 bit clock tick,(timestamp based on timer-value of CSS-internal timer)*/
 struct ia_css_clock_tick {
-	clock_value_t ticks; /** measured time in ticks.*/
+	clock_value_t ticks; /* measured time in ticks.*/
 };
 
 /* @brief TIMER event codes */
 enum ia_css_tm_event {
+	/* Timer Event after Initialization */
 	IA_CSS_TM_EVENT_AFTER_INIT,
-	/** Timer Event after Initialization */
+	/* Timer Event after end of Main */
 	IA_CSS_TM_EVENT_MAIN_END,
-	/** Timer Event after end of Main */
+	/* Timer Event after thread start */
 	IA_CSS_TM_EVENT_THREAD_START,
-	/** Timer Event after thread start */
+	/* Timer Event after Frame Process Start */
 	IA_CSS_TM_EVENT_FRAME_PROC_START,
-	/** Timer Event after Frame Process Start */
+	/* Timer Event after Frame Process End */
 	IA_CSS_TM_EVENT_FRAME_PROC_END
-	/** Timer Event after Frame Process End */
 };
 
 /* @brief code measurement common struct */
 struct ia_css_time_meas {
-	clock_value_t	start_timer_value;	/** measured time in ticks */
-	clock_value_t	end_timer_value;	/** measured time in ticks */
+	clock_value_t	start_timer_value;	/* measured time in ticks */
+	clock_value_t	end_timer_value;	/* measured time in ticks */
 };
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 7065eded7a33..d43bb2ee07c8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -64,8 +64,8 @@
 /* Min and max exposure IDs. These macros are here to allow
  * the drivers to get this information. Changing these macros
  * constitutes a CSS API change. */
-#define IA_CSS_ISYS_MIN_EXPOSURE_ID 1   /** Minimum exposure ID */
-#define IA_CSS_ISYS_MAX_EXPOSURE_ID 250 /** Maximum exposure ID */
+#define IA_CSS_ISYS_MIN_EXPOSURE_ID 1   /* Minimum exposure ID */
+#define IA_CSS_ISYS_MAX_EXPOSURE_ID 250 /* Maximum exposure ID */
 
 /* opaque types */
 struct ia_css_isp_parameters;
@@ -82,23 +82,23 @@ typedef u32 ia_css_ptr;
 /* Generic resolution structure.
  */
 struct ia_css_resolution {
-	u32 width;  /** Width */
-	u32 height; /** Height */
+	u32 width;  /* Width */
+	u32 height; /* Height */
 };
 
 /* Generic coordinate structure.
  */
 struct ia_css_coordinate {
-	s32 x;	/** Value of a coordinate on the horizontal axis */
-	s32 y;	/** Value of a coordinate on the vertical axis */
+	s32 x;	/* Value of a coordinate on the horizontal axis */
+	s32 y;	/* Value of a coordinate on the vertical axis */
 };
 
 /* Vector with signed values. This is used to indicate motion for
  * Digital Image Stabilization.
  */
 struct ia_css_vector {
-	s32 x; /** horizontal motion (in pixels) */
-	s32 y; /** vertical motion (in pixels) */
+	s32 x; /* horizontal motion (in pixels) */
+	s32 y; /* vertical motion (in pixels) */
 };
 
 /* Short hands */
@@ -107,33 +107,39 @@ struct ia_css_vector {
 
 /* CSS data descriptor */
 struct ia_css_data {
-	ia_css_ptr address; /** CSS virtual address */
-	u32   size;    /** Disabled if 0 */
+	ia_css_ptr address; /* CSS virtual address */
+	u32   size;    /* Disabled if 0 */
 };
 
 /* Host data descriptor */
 struct ia_css_host_data {
-	char      *address; /** Host address */
-	u32   size;    /** Disabled if 0 */
+	char      *address; /* Host address */
+	u32   size;    /* Disabled if 0 */
 };
 
 /* ISP data descriptor */
 struct ia_css_isp_data {
-	u32   address; /** ISP address */
-	u32   size;    /** Disabled if 0 */
+	u32   address; /* ISP address */
+	u32   size;    /* Disabled if 0 */
 };
 
 /* Shading Correction types. */
 enum ia_css_shading_correction_type {
-	IA_CSS_SHADING_CORRECTION_NONE,	 /** Shading Correction is not processed in the pipe. */
-	IA_CSS_SHADING_CORRECTION_TYPE_1 /** Shading Correction 1.0 (pipe 1.0 on ISP2300, pipe 2.2 on ISP2400/2401) */
-
-	/** More shading correction types can be added in the future. */
+	/* Shading Correction is not processed in the pipe. */
+	IA_CSS_SHADING_CORRECTION_NONE,
+	/*
+	 * Shading Correction 1.0 (pipe 1.0 on ISP2300, pipe 2.2 on
+	 * ISP2400/2401)
+	 */
+	IA_CSS_SHADING_CORRECTION_TYPE_1,
+
+	/* More shading correction types can be added in the future. */
 };
 
 /* Shading Correction information. */
 struct ia_css_shading_info {
-	enum ia_css_shading_correction_type type; /** Shading Correction type. */
+	/* Shading Correction type. */
+	enum ia_css_shading_correction_type type;
 
 	union {	/* Shading Correction information of each Shading Correction types. */
 
@@ -281,74 +287,116 @@ struct ia_css_shading_info {
 		 */
 		struct {
 			/* ISP2400 */
-			u32 enable;	/** Shading correction enabled.
-						     0:disabled, 1:enabled */
+			/*
+			 * Shading correction enabled.
+			 * 0:disabled, 1:enabled
+			 */
+			u32 enable;
 
 			/* ISP2401 */
-			u32 num_hor_grids;	/** Number of data points per line per color on shading table. */
-			u32 num_ver_grids;	/** Number of lines of data points per color on shading table. */
-			u32 bqs_per_grid_cell; /** Grid cell size in BQ unit.
-							 NOTE: bqs = size in BQ(Bayer Quad) unit.
-							       1BQ means {Gr,R,B,Gb} (2x2 pixels).
-							       Horizontal 1 bqs corresponds to horizontal 2 pixels.
-							       Vertical 1 bqs corresponds to vertical 2 pixels. */
+			/*
+			 * Number of data points per line per color on
+			 * shading table.
+			 */
+			u32 num_hor_grids;
+			/*
+			 * Number of lines of data points per color on
+			 * shading table.
+			 */
+			u32 num_ver_grids;
+			/*
+			 * Grid cell size in BQ unit.
+			 * NOTE: bqs = size in BQ(Bayer Quad) unit.
+			 *       1BQ means {Gr,R,B,Gb} (2x2 pixels).
+			 *       Horizontal 1 bqs corresponds to horizontal 2
+			 *       pixels. Vertical 1 bqs corresponds to vertical
+			 *       2 pixels.
+			 */
+			u32 bqs_per_grid_cell;
+			/*
+			 * Horizontal ratio of bayer scaling between
+			 * input width and output width, for the
+			 * scaling which should be done before shading
+			 * correction.
+			 * output_width = input_width *
+			 *   bayer_scale_hor_ratio_out /
+			 *   bayer_scale_hor_ratio_in + 0.5
+			 */
 			u32 bayer_scale_hor_ratio_in;
 			u32 bayer_scale_hor_ratio_out;
 
-			/** Horizontal ratio of bayer scaling between input width and output width,
-			     for the scaling which should be done before shading correction.
-				output_width = input_width * bayer_scale_hor_ratio_out
-								/ bayer_scale_hor_ratio_in + 0.5 */
+			/*
+			 * Vertical ratio of bayer scaling between input
+			 * height and output height, for the scaling
+			 * which should be done before shading
+			 * correction.
+			 * output_height = input_height *
+			 *   bayer_scale_ver_ratio_out /
+			 *   bayer_scale_ver_ratio_in + 0.5
+			 */
 			u32 bayer_scale_ver_ratio_in;
 			u32 bayer_scale_ver_ratio_out;
 
-			/** Vertical ratio of bayer scaling
-			between input height and output height, for the scaling
-			which should be done before shading correction.
-			  output_height = input_height * bayer_scale_ver_ratio_out
-						/ bayer_scale_ver_ratio_in */
 			/* ISP2400 */
+			/*
+			 * X coordinate (in bqs) of bayer origin on
+			 * shading table. This indicates the left-most
+			 * pixel of bayer (not include margin) inputted
+			 * to the shading correction. This corresponds
+			 * to the left-most pixel of bayer inputted to
+			 * isp from sensor.
+			 */
 			u32 sc_bayer_origin_x_bqs_on_shading_table;
-			/** X coordinate (in bqs) of bayer origin on shading table.
-			This indicates the left-most pixel of bayer
-			(not include margin) inputted to the shading correction.
-			This corresponds to the left-most pixel of bayer
-			inputted to isp from sensor. */
+
 			/* ISP2400 */
+			/*
+			 * Y coordinate (in bqs) of bayer origin on
+			 * shading table. This indicates the top pixel
+			 * of bayer (not include margin) inputted to
+			 * the shading correction. This corresponds to
+			 * the top pixel of bayer inputted to isp from
+			 * sensor.
+			 */
 			u32 sc_bayer_origin_y_bqs_on_shading_table;
-			/** Y coordinate (in bqs) of bayer origin on shading table.
-			This indicates the top pixel of bayer
-			(not include margin) inputted to the shading correction.
-			This corresponds to the top pixel of bayer
-			inputted to isp from sensor. */
-
-			/** Vertical ratio of bayer scaling between input height and output height,
-			     for the scaling which should be done before shading correction.
-				output_height = input_height * bayer_scale_ver_ratio_out
-								/ bayer_scale_ver_ratio_in + 0.5 */
+
 			/* ISP2401 */
+			/*
+			 * Sensor data size (in bqs) inputted to ISP.
+			 * This is the size BEFORE bayer scaling.
+			 * NOTE: This is NOT the size of the physical
+			 *       sensor size. CSS requests the driver
+			 *       that ISP inputs sensor data by the size
+			 *       of isp_input_sensor_data_res_bqs. The
+			 *       driver sends the sensor data to ISP,
+			 *       after the adequate cropping/binning/
+			 *       scaling are applied to the physical
+			 *       sensor data area. ISP assumes the area
+			 *       of isp_input_sensor_data_res_bqs is
+			 *       centered on the physical sensor.
+			 */
 			struct ia_css_resolution isp_input_sensor_data_res_bqs;
-			/** Sensor data size (in bqs) inputted to ISP. This is the size BEFORE bayer scaling.
-			     NOTE: This is NOT the size of the physical sensor size.
-				   CSS requests the driver that ISP inputs sensor data
-				   by the size of isp_input_sensor_data_res_bqs.
-				   The driver sends the sensor data to ISP,
-				   after the adequate cropping/binning/scaling
-				   are applied to the physical sensor data area.
-				   ISP assumes the area of isp_input_sensor_data_res_bqs
-				   is centered on the physical sensor. */
+
 			/* ISP2401 */
+			/*
+			 * Sensor data size (in bqs) at shading
+			 * correction. This is the size AFTER bayer
+			 * scaling.
+			 */
 			struct ia_css_resolution sensor_data_res_bqs;
-			/** Sensor data size (in bqs) at shading correction.
-			     This is the size AFTER bayer scaling. */
+
 			/* ISP2401 */
+			/*
+			 * Origin of sensor data area positioned on
+			 * shading table at shading correction. The
+			 * coordinate x,y should be positive values.
+			 */
 			struct ia_css_coordinate sensor_data_origin_bqs_on_sctbl;
-			/** Origin of sensor data area positioned on shading table at shading correction.
-			     The coordinate x,y should be positive values. */
 		} type_1;
 
-		/** More structures can be added here when more shading correction types will be added
-		     in the future. */
+		/*
+		 * More structures can be added here when more shading
+		 * correction types will be added in the future.
+		 */
 	} info;
 };
 
@@ -373,15 +421,14 @@ struct ia_css_shading_info {
 struct ia_css_grid_info {
 	/* \name ISP input size
 	  * that is visible for user
-	  * @{
 	  */
 	u32 isp_in_width;
 	u32 isp_in_height;
-	/* @}*/
 
-	struct ia_css_3a_grid_info  s3a_grid; /** 3A grid info */
+	/* 3A grid info */
+	struct ia_css_3a_grid_info  s3a_grid;
+	/* All types of DVS statistics grid info union */
 	union ia_css_dvs_grid_u dvs_grid;
-	/** All types of DVS statistics grid info union */
 
 	enum ia_css_vamem_type vamem_type;
 };
@@ -398,19 +445,24 @@ struct ia_css_grid_info {
  *  advanced ISP can correct for these imperfections using this table.
  */
 struct ia_css_morph_table {
-	u32 enable; /** To disable GDC, set this field to false. The
-			  coordinates fields can be set to NULL in this case. */
-	u32 height; /** Table height */
-	u32 width;  /** Table width */
+	/*
+	 * To disable GDC, set this field to false. The coordinates
+	 * fields can be set to NULL in this case.
+	 */
+	u32 enable;
+	/* Table height */
+	u32 height;
+	/* Table width */
+	u32 width;
+	/* X coordinates that describe the sensor imperfection */
 	u16 *coordinates_x[IA_CSS_MORPH_TABLE_NUM_PLANES];
-	/** X coordinates that describe the sensor imperfection */
+	/* Y coordinates that describe the sensor imperfection */
 	u16 *coordinates_y[IA_CSS_MORPH_TABLE_NUM_PLANES];
-	/** Y coordinates that describe the sensor imperfection */
 };
 
 struct ia_css_dvs_6axis_config {
+	/* Exposure ID, see ia_css_event_public.h for more detail */
 	unsigned int exp_id;
-	/** Exposure ID, see ia_css_event_public.h for more detail */
 	u32 width_y;
 	u32 height_y;
 	u32 width_uv;
@@ -425,8 +477,8 @@ struct ia_css_dvs_6axis_config {
  * This specifies the coordinates (x,y)
  */
 struct ia_css_point {
-	s32 x; /** x coordinate */
-	s32 y; /** y coordinate */
+	s32 x; /* x coordinate */
+	s32 y; /* y coordinate */
 };
 
 /*
@@ -447,27 +499,27 @@ struct ia_css_point {
  * y + height <= effective input height
  */
 struct ia_css_dz_config {
-	u32 dx; /** Horizontal zoom factor */
-	u32 dy; /** Vertical zoom factor */
-	struct v4l2_rect zoom_region; /** region for zoom */
+	u32 dx; /* Horizontal zoom factor */
+	u32 dy; /* Vertical zoom factor */
+	struct v4l2_rect zoom_region; /* region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
  *  Primary ISP, the Advanced ISP (GDC) or the low-light ISP (ANR).
  */
 enum ia_css_capture_mode {
-	IA_CSS_CAPTURE_MODE_RAW,      /** no processing, copy data only */
-	IA_CSS_CAPTURE_MODE_BAYER,    /** bayer processing, up to demosaic */
-	IA_CSS_CAPTURE_MODE_PRIMARY,  /** primary ISP */
-	IA_CSS_CAPTURE_MODE_ADVANCED, /** advanced ISP (GDC) */
-	IA_CSS_CAPTURE_MODE_LOW_LIGHT /** low light ISP (ANR) */
+	IA_CSS_CAPTURE_MODE_RAW,      /* no processing, copy data only */
+	IA_CSS_CAPTURE_MODE_BAYER,    /* bayer processing, up to demosaic */
+	IA_CSS_CAPTURE_MODE_PRIMARY,  /* primary ISP */
+	IA_CSS_CAPTURE_MODE_ADVANCED, /* advanced ISP (GDC) */
+	IA_CSS_CAPTURE_MODE_LOW_LIGHT /* low light ISP (ANR) */
 };
 
 struct ia_css_capture_config {
-	enum ia_css_capture_mode mode; /** Still capture mode */
-	u32 enable_xnr;	       /** Enable/disable XNR */
+	enum ia_css_capture_mode mode; /* Still capture mode */
+	u32 enable_xnr;	       /* Enable/disable XNR */
 	u32 enable_raw_output;
-	bool enable_capture_pp_bli;    /** Enable capture_pp_bli mode */
+	bool enable_capture_pp_bli;    /* Enable capture_pp_bli mode */
 };
 
 /* default settings for ia_css_capture_config structs */
@@ -490,101 +542,115 @@ struct ia_css_capture_config {
  *    ["ISP block", 2only] : ISP block is used only for ISP2.
  */
 struct ia_css_isp_config {
-	struct ia_css_wb_config   *wb_config;	/** White Balance
-							[WB1, 1&2] */
-	struct ia_css_cc_config   *cc_config;	/** Color Correction
-							[CSC1, 1only] */
-	struct ia_css_tnr_config  *tnr_config;	/** Temporal Noise Reduction
-							[TNR1, 1&2] */
-	struct ia_css_ecd_config  *ecd_config;	/** Eigen Color Demosaicing
-							[DE2, 2only] */
-	struct ia_css_ynr_config  *ynr_config;	/** Y(Luma) Noise Reduction
-							[YNR2&YEE2, 2only] */
-	struct ia_css_fc_config   *fc_config;	/** Fringe Control
-							[FC2, 2only] */
-	struct ia_css_formats_config
-		*formats_config;	/** Formats Control for main output
-							[FORMATS, 1&2] */
-	struct ia_css_cnr_config  *cnr_config;	/** Chroma Noise Reduction
-							[CNR2, 2only] */
-	struct ia_css_macc_config *macc_config;	/** MACC
-							[MACC2, 2only] */
-	struct ia_css_ctc_config  *ctc_config;	/** Chroma Tone Control
-							[CTC2, 2only] */
-	struct ia_css_aa_config   *aa_config;	/** YUV Anti-Aliasing
-							[AA2, 2only]
-							(not used currently) */
-	struct ia_css_aa_config   *baa_config;	/** Bayer Anti-Aliasing
-							[BAA2, 1&2] */
-	struct ia_css_ce_config   *ce_config;	/** Chroma Enhancement
-							[CE1, 1only] */
+	/* White Balance [WB1, 1&2] */
+	struct ia_css_wb_config   *wb_config;
+	/* Color Correction [CSC1, 1only] */
+	struct ia_css_cc_config   *cc_config;
+	/* Temporal Noise Reduction [TNR1, 1&2] */
+	struct ia_css_tnr_config  *tnr_config;
+	/* Eigen Color Demosaicing [DE2, 2only] */
+	struct ia_css_ecd_config  *ecd_config;
+	/* Y(Luma) Noise Reduction [YNR2&YEE2, 2only] */
+	struct ia_css_ynr_config  *ynr_config;
+	/* Fringe Control [FC2, 2only] */
+	struct ia_css_fc_config   *fc_config;
+	/* Formats Control for main output [FORMATS, 1&2] */
+	struct ia_css_formats_config *formats_config;
+	/* Chroma Noise Reduction [CNR2, 2only] */
+	struct ia_css_cnr_config  *cnr_config;
+	/* MACC [MACC2, 2only] */
+	struct ia_css_macc_config *macc_config;
+	/* Chroma Tone Control [CTC2, 2only] */
+	struct ia_css_ctc_config  *ctc_config;
+	/*
+	 * YUV Anti-Aliasing
+	 * [AA2, 2only] (not used currently)
+	 */
+	struct ia_css_aa_config   *aa_config;
+	/* Bayer Anti-Aliasing [BAA2, 1&2] */
+	struct ia_css_aa_config   *baa_config;
+	/* Chroma Enhancement [CE1, 1only] */
+	struct ia_css_ce_config   *ce_config;
 	struct ia_css_dvs_6axis_config *dvs_6axis_config;
-	struct ia_css_ob_config   *ob_config;  /** Objective Black
-							[OB1, 1&2] */
-	struct ia_css_dp_config   *dp_config;  /** Defect Pixel Correction
-							[DPC1/DPC2, 1&2] */
-	struct ia_css_nr_config   *nr_config;  /** Noise Reduction
-							[BNR1&YNR1&CNR1, 1&2]*/
-	struct ia_css_ee_config   *ee_config;  /** Edge Enhancement
-							[YEE1, 1&2] */
-	struct ia_css_de_config   *de_config;  /** Demosaic
-							[DE1, 1only] */
-	struct ia_css_gc_config   *gc_config;  /** Gamma Correction (for YUV)
-							[GC1, 1only] */
-	struct ia_css_anr_config  *anr_config; /** Advanced Noise Reduction */
-	struct ia_css_3a_config   *s3a_config; /** 3A Statistics config */
-	struct ia_css_xnr_config  *xnr_config; /** eXtra Noise Reduction */
-	struct ia_css_dz_config   *dz_config;  /** Digital Zoom */
-	struct ia_css_cc_config *yuv2rgb_cc_config; /** Color Correction
-							[CCM2, 2only] */
-	struct ia_css_cc_config *rgb2yuv_cc_config; /** Color Correction
-							[CSC2, 2only] */
-	struct ia_css_macc_table  *macc_table;	/** MACC
-							[MACC1/MACC2, 1&2]*/
-	struct ia_css_gamma_table *gamma_table;	/** Gamma Correction (for YUV)
-							[GC1, 1only] */
-	struct ia_css_ctc_table   *ctc_table;	/** Chroma Tone Control
-							[CTC1, 1only] */
+	/* Objective Black [OB1, 1&2] */
+	struct ia_css_ob_config   *ob_config;
+	/* Defect Pixel Correction [DPC1/DPC2, 1&2] */
+	struct ia_css_dp_config   *dp_config;
+	/* Noise Reduction [BNR1&YNR1&CNR1, 1&2] */
+	struct ia_css_nr_config   *nr_config;
+	/* Edge Enhancement [YEE1, 1&2] */
+	struct ia_css_ee_config   *ee_config;
+	/* Demosaic [DE1, 1only] */
+	struct ia_css_de_config   *de_config;
+	/* Gamma Correction (for YUV) [GC1, 1only] */
+	struct ia_css_gc_config   *gc_config;
+	/* Advanced Noise Reduction */
+	struct ia_css_anr_config  *anr_config;
+	/* 3A Statistics config */
+	struct ia_css_3a_config   *s3a_config;
+	/* eXtra Noise Reduction */
+	struct ia_css_xnr_config  *xnr_config;
+	/* Digital Zoom */
+	struct ia_css_dz_config   *dz_config;
+	/* Color Correction [CCM2, 2only] */
+	struct ia_css_cc_config *yuv2rgb_cc_config;
+	/* Color Correction [CSC2, 2only] */
+	struct ia_css_cc_config *rgb2yuv_cc_config;
+	/* MACC [MACC1/MACC2, 1&2] */
+	struct ia_css_macc_table  *macc_table;
+	/* Gamma Correction (for YUV) [GC1, 1only] */
+	struct ia_css_gamma_table *gamma_table;
+	/* Chroma Tone Control [CTC1, 1only] */
+	struct ia_css_ctc_table   *ctc_table;
 
 	/* \deprecated */
-	struct ia_css_xnr_table   *xnr_table;	/** eXtra Noise Reduction
-							[XNR1, 1&2] */
-	struct ia_css_rgb_gamma_table *r_gamma_table;/** sRGB Gamma Correction
-							[GC2, 2only] */
-	struct ia_css_rgb_gamma_table *g_gamma_table;/** sRGB Gamma Correction
-							[GC2, 2only] */
-	struct ia_css_rgb_gamma_table *b_gamma_table;/** sRGB Gamma Correction
-							[GC2, 2only] */
-	struct ia_css_vector      *motion_vector; /** For 2-axis DVS */
+	/* eXtra Noise Reduction [XNR1, 1&2] */
+	struct ia_css_xnr_table   *xnr_table;
+	/* sRGB Gamma Correction [GC2, 2only] */
+	struct ia_css_rgb_gamma_table *r_gamma_table;
+	/* sRGB Gamma Correction [GC2, 2only] */
+	struct ia_css_rgb_gamma_table *g_gamma_table;
+	/* sRGB Gamma Correction [GC2, 2only] */
+	struct ia_css_rgb_gamma_table *b_gamma_table;
+	/* For 2-axis DVS */
+	struct ia_css_vector      *motion_vector;
 	struct ia_css_shading_table *shading_table;
 	struct ia_css_morph_table   *morph_table;
-	struct ia_css_dvs_coefficients *dvs_coefs; /** DVS 1.0 coefficients */
-	struct ia_css_dvs2_coefficients *dvs2_coefs; /** DVS 2.0 coefficients */
+	/* DVS 1.0 coefficients */
+	struct ia_css_dvs_coefficients *dvs_coefs;
+	/* DVS 2.0 coefficients */
+	struct ia_css_dvs2_coefficients *dvs2_coefs;
 	struct ia_css_capture_config   *capture_config;
 	struct ia_css_anr_thres   *anr_thres;
 	/* @deprecated{Old shading settings, see bugzilla bz675 for details} */
 	struct ia_css_shading_settings *shading_settings;
-	struct ia_css_xnr3_config *xnr3_config; /** eXtreme Noise Reduction v3 */
+	struct ia_css_xnr3_config *xnr3_config; /* eXtreme Noise Reduction v3 */
 	/* comment from Lasse: Be aware how this feature will affect coordinate
 	 *  normalization in different parts of the system. (e.g. face detection,
 	 *  touch focus, 3A statistics and windows of interest, shading correction,
 	 *  DVS, GDC) from IQ tool level and application level down-to ISP FW level.
 	 *  the risk for regression is not in the individual blocks, but how they
 	 *  integrate together. */
-	struct ia_css_output_config
-		*output_config;	/** Main Output Mirroring, flipping */
-
-	struct ia_css_scaler_config
-		*scaler_config;         /** Skylake: scaler config (optional) */
-	struct ia_css_formats_config
-		*formats_config_display;/** Formats control for viewfinder/display output (optional)
-										[OSYS, n/a] */
-	struct ia_css_output_config
-		*output_config_display; /** Viewfinder/display output mirroring, flipping (optional) */
-
-	struct ia_css_frame
-		*output_frame;          /** Output frame the config is to be applied to (optional) */
-	u32			isp_config_id;	/** Unique ID to track which config was actually applied to a particular frame */
+	/* Main Output Mirroring, flipping */
+	struct ia_css_output_config *output_config;
+
+	/* Skylake: scaler config (optional) */
+	struct ia_css_scaler_config *scaler_config;
+	/*
+	 * Formats control for viewfinder/display output (optional)
+	 * [OSYS, n/a]
+	 */
+	struct ia_css_formats_config *formats_config_display;
+	/* Viewfinder/display output mirroring, flipping (optional) */
+	struct ia_css_output_config *output_config_display;
+
+	/* Output frame the config is to be applied to (optional) */
+	struct ia_css_frame *output_frame;
+	/*
+	 * Unique ID to track which config was actually applied to a
+	 * particular frame
+	 */
+	u32			isp_config_id;
 };
 
 #endif /* _IA_CSS_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index bc2a78dff004..b8d8943123b8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -21,7 +21,7 @@
  *  This is also known as Low-Light.
  */
 struct ia_css_anr_config {
-	s32 threshold; /** Threshold */
+	s32 threshold;	/* Threshold */
 	s32 thresholds[4 * 4 * 4];
 	s32 factors[3];
 };
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h
index 150d3960caee..12a6c255bf1a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h
@@ -22,15 +22,17 @@
  * ISP2.6.1: BNLM is used.
  */
 struct ia_css_bnlm_config {
-	bool		rad_enable;	/** Enable a radial dependency in a weight calculation */
-	s32		rad_x_origin;	/** Initial x coordinate for a radius calculation */
-	s32		rad_y_origin;	/** Initial x coordinate for a radius calculation */
+	/* Enable a radial dependency in a weight calculation */
+	bool		rad_enable;
+	/* Initial x coordinate for a radius calculation */
+	s32		rad_x_origin;
+	/* Initial x coordinate for a radius calculation */
+	s32		rad_y_origin;
 	/* a threshold for average of weights if this < Th, do not denoise pixel */
 	s32		avg_min_th;
 	/* minimum weight for denoising if max < th, do not denoise pixel */
 	s32		max_min_th;
 
-	/**@{*/
 	/* Coefficient for approximation, in the form of (1 + x / N)^N,
 	 * that fits the first-order exp() to default exp_lut in BNLM sheet
 	 * */
@@ -38,61 +40,40 @@ struct ia_css_bnlm_config {
 	u32	exp_coeff_b;
 	s32		exp_coeff_c;
 	u32	exp_exponent;
-	/**@}*/
 
-	s32 nl_th[3];	/** Detail thresholds */
+	s32 nl_th[3];	/* Detail thresholds */
 
 	/* Index for n-th maximum candidate weight for each detail group */
 	s32 match_quality_max_idx[4];
 
-	/**@{*/
 	/* A lookup table for 1/sqrt(1+mu) approximation */
 	s32 mu_root_lut_thr[15];
 	s32 mu_root_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* A lookup table for SAD normalization */
 	s32 sad_norm_lut_thr[15];
 	s32 sad_norm_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* A lookup table that models a weight's dependency on textures */
 	s32 sig_detail_lut_thr[15];
 	s32 sig_detail_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* A lookup table that models a weight's dependency on a pixel's radial distance */
 	s32 sig_rad_lut_thr[15];
 	s32 sig_rad_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* A lookup table to control denoise power depending on a pixel's radial distance */
 	s32 rad_pow_lut_thr[15];
 	s32 rad_pow_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* Non linear transfer functions to calculate the blending coefficient depending on detail group */
 	/* detail group 0 */
-	/**@{*/
 	s32 nl_0_lut_thr[15];
 	s32 nl_0_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* detail group 1 */
 	s32 nl_1_lut_thr[15];
 	s32 nl_1_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* detail group 2 */
 	s32 nl_2_lut_thr[15];
 	s32 nl_2_lut_val[16];
-	/**@}*/
-	/**@{*/
 	/* detail group 3 */
 	s32 nl_3_lut_thr[15];
 	s32 nl_3_lut_val[16];
-	/**@}*/
-	/**@}*/
 };
 
 #endif /* __IA_CSS_BNLM_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
index 387909c35c1a..49bef057e74c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
@@ -22,42 +22,42 @@
  * ISP2.6.1: BNR2.2 is used.
  */
 struct ia_css_bnr2_2_config {
-	/**@{*/
 	/* Directional variance gain for R/G/B components in dark region */
 	s32 d_var_gain_r;
 	s32 d_var_gain_g;
 	s32 d_var_gain_b;
-	/**@}*/
-	/**@{*/
 	/* Slope of Directional variance gain between dark and bright region */
 	s32 d_var_gain_slope_r;
 	s32 d_var_gain_slope_g;
 	s32 d_var_gain_slope_b;
-	/**@}*/
-	/**@{*/
 	/* Non-Directional variance gain for R/G/B components in dark region */
 	s32 n_var_gain_r;
 	s32 n_var_gain_g;
 	s32 n_var_gain_b;
-	/**@}*/
-	/**@{*/
 	/* Slope of Non-Directional variance gain between dark and bright region */
 	s32 n_var_gain_slope_r;
 	s32 n_var_gain_slope_g;
 	s32 n_var_gain_slope_b;
-	/**@}*/
 
-	s32 dir_thres;		/** Threshold for directional filtering */
-	s32 dir_thres_w;		/** Threshold width for directional filtering */
-	s32 var_offset_coef;	/** Variance offset coefficient */
-	s32 dir_gain;		/** Gain for directional coefficient */
-	s32 detail_gain;		/** Gain for low contrast texture control */
-	s32 detail_gain_divisor;	/** Gain divisor for low contrast texture control */
-	s32 detail_level_offset;	/** Bias value for low contrast texture control */
-	s32 d_var_th_min;		/** Minimum clipping value for directional variance*/
-	s32 d_var_th_max;		/** Maximum clipping value for diretional variance*/
-	s32 n_var_th_min;		/** Minimum clipping value for non-directional variance*/
-	s32 n_var_th_max;		/** Maximum clipping value for non-directional variance*/
+	s32 dir_thres;		/* Threshold for directional filtering */
+	/* Threshold width for directional filtering */
+	s32 dir_thres_w;
+	s32 var_offset_coef;	/* Variance offset coefficient */
+	s32 dir_gain;		/* Gain for directional coefficient */
+	/* Gain for low contrast texture control */
+	s32 detail_gain;
+	/* Gain divisor for low contrast texture control */
+	s32 detail_gain_divisor;
+	/* Bias value for low contrast texture control */
+	s32 detail_level_offset;
+	/* Minimum clipping value for directional variance */
+	s32 d_var_th_min;
+	/* Maximum clipping value for diretional variance */
+	s32 d_var_th_max;
+	/* Minimum clipping value for non-directional variance */
+	s32 n_var_th_min;
+	/* Maximum clipping value for non-directional variance */
+	s32 n_var_th_max;
 };
 
 #endif /* __IA_CSS_BNR2_2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h
index 9bb9ca7f7ad2..0086c1786fcc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h
@@ -25,22 +25,46 @@
  *  ISP2: CNR2 is used for Still.
  */
 struct ia_css_cnr_config {
-	u16 coring_u;	/** Coring level of U.
-				u0.13, [0,8191], default/ineffective 0 */
-	u16 coring_v;	/** Coring level of V.
-				u0.13, [0,8191], default/ineffective 0 */
-	u16 sense_gain_vy;	/** Sensitivity of horizontal edge of Y.
-				u13.0, [0,8191], default 100, ineffective 8191 */
-	u16 sense_gain_vu;	/** Sensitivity of horizontal edge of U.
-				u13.0, [0,8191], default 100, ineffective 8191 */
-	u16 sense_gain_vv;	/** Sensitivity of horizontal edge of V.
-				u13.0, [0,8191], default 100, ineffective 8191 */
-	u16 sense_gain_hy;	/** Sensitivity of vertical edge of Y.
-				u13.0, [0,8191], default 50, ineffective 8191 */
-	u16 sense_gain_hu;	/** Sensitivity of vertical edge of U.
-				u13.0, [0,8191], default 50, ineffective 8191 */
-	u16 sense_gain_hv;	/** Sensitivity of vertical edge of V.
-				u13.0, [0,8191], default 50, ineffective 8191 */
+	/*
+	 * Coring level of U.
+	 * u0.13, [0,8191], default/ineffective 0
+	 */
+	u16 coring_u;
+	/*
+	 * Coring level of V.
+	 * u0.13, [0,8191], default/ineffective 0
+	 */
+	u16 coring_v;
+	/*
+	 * Sensitivity of horizontal edge of Y.
+	 * u13.0, [0,8191], default 100, ineffective 8191
+	 */
+	u16 sense_gain_vy;
+	/*
+	 * Sensitivity of horizontal edge of U.
+	 * u13.0, [0,8191], default 100, ineffective 8191
+	 */
+	u16 sense_gain_vu;
+	/*
+	 * Sensitivity of horizontal edge of V.
+	 * u13.0, [0,8191], default 100, ineffective 8191
+	 */
+	u16 sense_gain_vv;
+	/*
+	 * Sensitivity of vertical edge of Y.
+	 * u13.0, [0,8191], default 50, ineffective 8191
+	 */
+	u16 sense_gain_hy;
+	/*
+	 * Sensitivity of vertical edge of U.
+	 * u13.0, [0,8191], default 50, ineffective 8191
+	 */
+	u16 sense_gain_hu;
+	/*
+	 * Sensitivity of vertical edge of V.
+	 * u13.0, [0,8191], default 50, ineffective 8191
+	 */
+	u16 sense_gain_hv;
 };
 
 #endif /* __IA_CSS_CNR2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
index ee2cf2877b7d..93019eaee502 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
@@ -15,10 +15,10 @@
  *
  */
 struct ia_css_conversion_config {
-	u32 en;     /** en parameter */
-	u32 dummy0; /** dummy0 dummy parameter 0 */
-	u32 dummy1; /** dummy1 dummy parameter 1 */
-	u32 dummy2; /** dummy2 dummy parameter 2 */
+	u32 en;		/* en parameter */
+	u32 dummy0;	/* dummy0 dummy parameter 0 */
+	u32 dummy1;	/* dummy1 dummy parameter 1 */
+	u32 dummy2;	/* dummy2 dummy parameter 2 */
 };
 
 #endif /* __IA_CSS_CONVERSION_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h
index 1e56d78e5ab9..920ba2aaf8f2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h
@@ -60,11 +60,17 @@
  *	4096	-3430	-666
  */
 struct ia_css_cc_config {
-	u32 fraction_bits;/** Fractional bits of matrix.
-					u8.0, [0,13] */
-	s32 matrix[3 * 3]; /** Conversion matrix.
-					s[13-fraction_bits].[fraction_bits],
-					[-8192,8191] */
+	/*
+	 * Fractional bits of matrix.
+	 * u8.0, [0,13]
+	 */
+	u32 fraction_bits;
+	/*
+	 * Conversion matrix.
+	 * s[13-fraction_bits].[fraction_bits],
+	 * [-8192,8191]
+	 */
+	s32 matrix[3 * 3];
 };
 
 #endif /* __IA_CSS_CSC_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h
index 41337538abbb..2b980219bc03 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h
@@ -14,7 +14,7 @@
 
 /*VMEM Luma params*/
 struct ia_css_isp_ctc2_vmem_params {
-	/** Gains by Y(Luma) at Y = 0.0,Y_X1, Y_X2, Y_X3, Y_X4*/
+	/* Gains by Y(Luma) at Y = 0.0,Y_X1, Y_X2, Y_X3, Y_X4 */
 	VMEM_ARRAY(y_x, ISP_VEC_NELEMS);
 	/* kneepoints by Y(Luma) 0.0, y_x1, y_x2, y _x3, y_x4*/
 	VMEM_ARRAY(y_y, ISP_VEC_NELEMS);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
index 187c22f8da51..c1daff0c0f7a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
@@ -15,9 +15,10 @@
 *  ISP261: CTC2 (CTC by Fast Approximate Distance)
 */
 struct ia_css_ctc2_config {
-	/** Gains by Y(Luma) at Y =0.0,Y_X1, Y_X2, Y_X3, Y_X4 and Y_X5
-	*   --default/ineffective value: 4096(0.5f)
-	*/
+	/*
+	 * Gains by Y(Luma) at Y =0.0,Y_X1, Y_X2, Y_X3, Y_X4 and Y_X5
+	 * --default/ineffective value: 4096(0.5f)
+	 */
 	s32 y_y0;
 	s32 y_y1;
 	s32 y_y2;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h
index 67f4e01a3197..21807b9d7d8a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h
@@ -48,39 +48,72 @@ enum ia_css_vamem_type {
  *  ISP2: CTC2 is used.
  */
 struct ia_css_ctc_config {
-	u16 y0;	/** 1st kneepoint gain.
-				u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
-				default/ineffective 4096(0.5) */
-	u16 y1;	/** 2nd kneepoint gain.
-				u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
-				default/ineffective 4096(0.5) */
-	u16 y2;	/** 3rd kneepoint gain.
-				u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
-				default/ineffective 4096(0.5) */
-	u16 y3;	/** 4th kneepoint gain.
-				u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
-				default/ineffective 4096(0.5) */
-	u16 y4;	/** 5th kneepoint gain.
-				u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
-				default/ineffective 4096(0.5) */
-	u16 y5;	/** 6th kneepoint gain.
-				u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
-				default/ineffective 4096(0.5) */
-	u16 ce_gain_exp;	/** Common exponent of y-axis gain.
-				u8.0, [0,13],
-				default/ineffective 1 */
-	u16 x1;	/** 2nd kneepoint luma.
-				u0.13, [0,8191], constraints: 0<x1<x2,
-				default/ineffective 1024 */
-	u16 x2;	/** 3rd kneepoint luma.
-				u0.13, [0,8191], constraints: x1<x2<x3,
-				default/ineffective 2048 */
-	u16 x3;	/** 4th kneepoint luma.
-				u0.13, [0,8191], constraints: x2<x3<x4,
-				default/ineffective 6144 */
-	u16 x4;	/** 5tn kneepoint luma.
-				u0.13, [0,8191], constraints: x3<x4<8191,
-				default/ineffective 7168 */
+	/*
+	 * 1st kneepoint gain.
+	 * u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
+	 * default/ineffective 4096(0.5)
+	 */
+	u16 y0;
+	/*
+	 * 2nd kneepoint gain.
+	 * u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
+	 * default/ineffective 4096(0.5)
+	 */
+	u16 y1;
+	/*
+	 * 3rd kneepoint gain.
+	 * u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
+	 * default/ineffective 4096(0.5)
+	 */
+	u16 y2;
+	/*
+	 * 4th kneepoint gain.
+	 * u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
+	 * default/ineffective 4096(0.5)
+	 */
+	u16 y3;
+	/*
+	 * 5th kneepoint gain.
+	 * u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
+	 * default/ineffective 4096(0.5)
+	 */
+	u16 y4;
+	/*
+	 * 6th kneepoint gain.
+	 * u[ce_gain_exp].[13-ce_gain_exp], [0,8191],
+	 * default/ineffective 4096(0.5)
+	 */
+	u16 y5;
+	/*
+	 * Common exponent of y-axis gain.
+	 * u8.0, [0,13],
+	 * default/ineffective 1
+	 */
+	u16 ce_gain_exp;
+	/*
+	 * 2nd kneepoint luma.
+	 * u0.13, [0,8191], constraints: 0<x1<x2,
+	 * default/ineffective 1024
+	 */
+	u16 x1;
+	/*
+	 * 3rd kneepoint luma.
+	 * u0.13, [0,8191], constraints: x1<x2<x3,
+	 * default/ineffective 2048
+	 */
+	u16 x2;
+	/*
+	 * 4th kneepoint luma.
+	 * u0.13, [0,8191], constraints: x2<x3<x4,
+	 * default/ineffective 6144
+	 */
+	u16 x3;
+	/*
+	 * 5tn kneepoint luma.
+	 * u0.13, [0,8191], constraints: x3<x4<8191,
+	 * default/ineffective 7168
+	 */
+	u16 x4;
 };
 
 union ia_css_ctc_data {
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h
index e1f025846b83..101d27758f2b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h
@@ -18,17 +18,26 @@
  * (ISP2: DE2 is used.)
  */
 struct ia_css_de_config {
-	ia_css_u0_16 pixelnoise; /** Pixel noise used in moire elimination.
-				u0.16, [0,65535],
-				default 0, ineffective 0 */
-	ia_css_u0_16 c1_coring_threshold; /** Coring threshold for C1.
-				This is the same as nr_config.threshold_cb.
-				u0.16, [0,65535],
-				default 128(0.001953125), ineffective 0 */
-	ia_css_u0_16 c2_coring_threshold; /** Coring threshold for C2.
-				This is the same as nr_config.threshold_cr.
-				u0.16, [0,65535],
-				default 128(0.001953125), ineffective 0 */
+	/*
+	 * Pixel noise used in moire elimination.
+	 * u0.16, [0,65535],
+	 * default 0, ineffective 0
+	 */
+	ia_css_u0_16 pixelnoise;
+	/*
+	 * Coring threshold for C1.
+	 * This is the same as nr_config.threshold_cb.
+	 * u0.16, [0,65535],
+	 * default 128(0.001953125), ineffective 0
+	 */
+	ia_css_u0_16 c1_coring_threshold;
+	/*
+	 * Coring threshold for C2.
+	 * This is the same as nr_config.threshold_cr.
+	 * u0.16, [0,65535],
+	 * default 128(0.001953125), ineffective 0
+	 */
+	ia_css_u0_16 c2_coring_threshold;
 };
 
 #endif /* __IA_CSS_DE_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h
index ca36c001607c..ecafcdac44e7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h
@@ -18,16 +18,25 @@
  *  ISP2: DE2 is used.
  */
 struct ia_css_ecd_config {
-	u16 zip_strength;	/** Strength of zipper reduction.
-				u0.13, [0,8191],
-				default 5489(0.67), ineffective 0 */
-	u16 fc_strength;	/** Strength of false color reduction.
-				u0.13, [0,8191],
-				default 8191(almost 1.0), ineffective 0 */
-	u16 fc_debias;	/** Prevent color change
-				     on noise or Gr/Gb imbalance.
-				u0.13, [0,8191],
-				default 0, ineffective 0 */
+	/*
+	 * Strength of zipper reduction.
+	 * u0.13, [0,8191],
+	 * default 5489(0.67), ineffective 0
+	 */
+	u16 zip_strength;
+	/*
+	 * Strength of false color reduction.
+	 * u0.13, [0,8191],
+	 * default 8191(almost 1.0), ineffective 0
+	 */
+	u16 fc_strength;
+	/*
+	 * Prevent color change
+	 *      on noise or Gr/Gb imbalance.
+	 * u0.13, [0,8191],
+	 * default 0, ineffective 0
+	 */
+	u16 fc_debias;
 };
 
 #endif /* __IA_CSS_DE2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h
index 036727f3772d..3fee57c06551 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h
@@ -19,22 +19,28 @@
  *  ISP2: DPC2 is used.
  */
 struct ia_css_dp_config {
-	ia_css_u0_16 threshold; /** The threshold of defect pixel correction,
-			      representing the permissible difference of
-			      intensity between one pixel and its
-			      surrounding pixels. Smaller values result
-				in more frequent pixel corrections.
-				u0.16, [0,65535],
-				default 8192, ineffective 65535 */
-	ia_css_u8_8 gain;	 /** The sensitivity of mis-correction. ISP will
-			      miss a lot of defects if the value is set
-				too large.
-				u8.8, [0,65535],
-				default 4096, ineffective 65535 */
-	u32 gr;	/* unsigned <integer_bits>.<16-integer_bits> */
-	u32 r;	/* unsigned <integer_bits>.<16-integer_bits> */
-	u32 b;	/* unsigned <integer_bits>.<16-integer_bits> */
-	u32 gb;	/* unsigned <integer_bits>.<16-integer_bits> */
+	/*
+	 * The threshold of defect pixel correction,
+	 * representing the permissible difference of
+	 * intensity between one pixel and its
+	 * surrounding pixels. Smaller values result
+	 *   in more frequent pixel corrections.
+	 *   u0.16, [0,65535],
+	 *   default 8192, ineffective 65535
+	 */
+	ia_css_u0_16 threshold;
+	/*
+	 * The sensitivity of mis-correction. ISP will
+	 * miss a lot of defects if the value is set
+	 *   too large.
+	 *   u8.8, [0,65535],
+	 *   default 4096, ineffective 65535
+	 */
+	ia_css_u8_8 gain;
+	u32 gr;		/* unsigned <integer_bits>.<16-integer_bits> */
+	u32 r;		/* unsigned <integer_bits>.<16-integer_bits> */
+	u32 b;		/* unsigned <integer_bits>.<16-integer_bits> */
+	u32 gb;		/* unsigned <integer_bits>.<16-integer_bits> */
 };
 
 #endif /* __IA_CSS_DP_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h
index c261899bcaa0..db3d634f1f21 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h
@@ -13,15 +13,12 @@
 
 #include "type_support.h"
 
-/**@{*/
 /* Floating point constants for different metrics. */
 #define METRIC1_ONE_FP	BIT(12)
 #define METRIC2_ONE_FP	BIT(5)
 #define METRIC3_ONE_FP	BIT(12)
 #define WBGAIN_ONE_FP	BIT(9)
-/**@}*/
 
-/**@{*/
 /* Defect Pixel Correction 2 configuration.
  *
  * \brief DPC2 public parameters.
@@ -35,7 +32,6 @@
  *
  */
 struct ia_css_dpc2_config {
-	/**@{*/
 	s32 metric1;
 	s32 metric2;
 	s32 metric3;
@@ -43,9 +39,7 @@ struct ia_css_dpc2_config {
 	s32 wb_gain_r;
 	s32 wb_gain_b;
 	s32 wb_gain_gb;
-	/**@}*/
 };
 
-/**@}*/
 
 #endif /* __IA_CSS_DPC2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
index bbd97c71a6fd..57dc32d65936 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
@@ -33,47 +33,70 @@
  */
 
 struct ia_css_eed1_8_config {
-	s32 rbzp_strength;	/** Strength of zipper reduction. */
-
-	s32 fcstrength;	/** Strength of false color reduction. */
-	s32 fcthres_0;	/** Threshold to prevent chroma coring due to noise or green disparity in dark region. */
-	s32 fcthres_1;	/** Threshold to prevent chroma coring due to noise or green disparity in bright region. */
-	s32 fc_sat_coef;	/** How much color saturation to maintain in high color saturation region. */
-	s32 fc_coring_prm;	/** Chroma coring coefficient for tint color suppression. */
-
-	s32 aerel_thres0;	/** Threshold for Non-Directional Reliability at dark region. */
-	s32 aerel_gain0;	/** Gain for Non-Directional Reliability at dark region. */
-	s32 aerel_thres1;	/** Threshold for Non-Directional Reliability at bright region. */
-	s32 aerel_gain1;	/** Gain for Non-Directional Reliability at bright region. */
-
-	s32 derel_thres0;	/** Threshold for Directional Reliability at dark region. */
-	s32 derel_gain0;	/** Gain for Directional Reliability at dark region. */
-	s32 derel_thres1;	/** Threshold for Directional Reliability at bright region. */
-	s32 derel_gain1;	/** Gain for Directional Reliability at bright region. */
-
-	s32 coring_pos0;	/** Positive Edge Coring Threshold in dark region. */
-	s32 coring_pos1;	/** Positive Edge Coring Threshold in bright region. */
-	s32 coring_neg0;	/** Negative Edge Coring Threshold in dark region. */
-	s32 coring_neg1;	/** Negative Edge Coring Threshold in bright region. */
-
-	s32 gain_exp;	/** Common Exponent of Gain. */
-	s32 gain_pos0;	/** Gain for Positive Edge in dark region. */
-	s32 gain_pos1;	/** Gain for Positive Edge in bright region. */
-	s32 gain_neg0;	/** Gain for Negative Edge in dark region. */
-	s32 gain_neg1;	/** Gain for Negative Edge in bright region. */
-
-	s32 pos_margin0;	/** Margin for Positive Edge in dark region. */
-	s32 pos_margin1;	/** Margin for Positive Edge in bright region. */
-	s32 neg_margin0;	/** Margin for Negative Edge in dark region. */
-	s32 neg_margin1;	/** Margin for Negative Edge in bright region. */
-
-	s32 dew_enhance_seg_x[IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS];		/** Segment data for directional edge weight: X. */
-	s32 dew_enhance_seg_y[IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS];		/** Segment data for directional edge weight: Y. */
-	s32 dew_enhance_seg_slope[(IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS -
-				   1)];	/** Segment data for directional edge weight: Slope. */
-	s32 dew_enhance_seg_exp[(IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS -
-				 1)];	/** Segment data for directional edge weight: Exponent. */
-	s32 dedgew_max;	/** Max Weight for Directional Edge. */
+	s32 rbzp_strength;	/* Strength of zipper reduction. */
+
+	s32 fcstrength;		/* Strength of false color reduction. */
+	/*
+	 * Threshold to prevent chroma coring due to noise or green disparity
+	 * in dark region.
+	 */
+	s32 fcthres_0;
+	/*
+	 * Threshold to prevent chroma coring due to noise or green disparity
+	 * in bright region.
+	 */
+	s32 fcthres_1;
+	/*
+	 * How much color saturation to maintain in high color saturation
+	 * region.
+	 */
+	s32 fc_sat_coef;
+	/* Chroma coring coefficient for tint color suppression. */
+	s32 fc_coring_prm;
+	/* Threshold for Non-Directional Reliability at dark region. */
+	s32 aerel_thres0;
+	/* Gain for Non-Directional Reliability at dark region. */
+	s32 aerel_gain0;
+	/* Threshold for Non-Directional Reliability at bright region. */
+	s32 aerel_thres1;
+	/* Gain for Non-Directional Reliability at bright region. */
+	s32 aerel_gain1;
+	/* Threshold for Directional Reliability at dark region. */
+	s32 derel_thres0;
+	/* Gain for Directional Reliability at dark region. */
+	s32 derel_gain0;
+	/* Threshold for Directional Reliability at bright region. */
+	s32 derel_thres1;
+	/* Gain for Directional Reliability at bright region. */
+	s32 derel_gain1;
+	/* Positive Edge Coring Threshold in dark region. */
+	s32 coring_pos0;
+	/* Positive Edge Coring Threshold in bright region. */
+	s32 coring_pos1;
+	/* Negative Edge Coring Threshold in dark region. */
+	s32 coring_neg0;
+	/* Negative Edge Coring Threshold in bright region. */
+	s32 coring_neg1;
+
+	s32 gain_exp;		/* Common Exponent of Gain. */
+	s32 gain_pos0;		/* Gain for Positive Edge in dark region. */
+	s32 gain_pos1;		/* Gain for Positive Edge in bright region. */
+	s32 gain_neg0;		/* Gain for Negative Edge in dark region. */
+	s32 gain_neg1;		/* Gain for Negative Edge in bright region. */
+
+	s32 pos_margin0;	/* Margin for Positive Edge in dark region. */
+	s32 pos_margin1;	/* Margin for Positive Edge in bright region. */
+	s32 neg_margin0;	/* Margin for Negative Edge in dark region. */
+	s32 neg_margin1;	/* Margin for Negative Edge in bright region. */
+	/* Segment data for directional edge weight: X. */
+	s32 dew_enhance_seg_x[IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS];
+	/* Segment data for directional edge weight: Y. */
+	s32 dew_enhance_seg_y[IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS];
+	/* Segment data for directional edge weight: Slope. */
+	s32 dew_enhance_seg_slope[(IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1)];
+	/* Segment data for directional edge weight: Exponent. */
+	s32 dew_enhance_seg_exp[(IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1)];
+	s32 dedgew_max;		/* Max Weight for Directional Edge. */
 };
 
 #endif /* __IA_CSS_EED1_8_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h
index 5958e7b2ddfe..52908888d487 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h
@@ -20,11 +20,14 @@
  *  ISP2: FORMATS is used.
  */
 struct ia_css_formats_config {
-	u32 video_full_range_flag; /** selects the range of YUV output.
-				u8.0, [0,1],
-				default 1, ineffective n/a\n
-				1 - full range, luma 0-255, chroma 0-255\n
-				0 - reduced range, luma 16-235, chroma 16-240 */
+	/*
+	 * selects the range of YUV output.
+	 * u8.0, [0,1],
+	 * default 1, ineffective n/a\n
+	 * 1 - full range, luma 0-255, chroma 0-255\n
+	 * 0 - reduced range, luma 16-235, chroma 16-240
+	 */
+	u32 video_full_range_flag;
 };
 
 #endif /* __IA_CSS_FORMATS_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h
index 8b246c80e105..c9666255a1f3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h
@@ -25,16 +25,31 @@
  */
 
 struct ia_css_fpn_table {
-	s16 *data;		/** Table content (fixed patterns noise).
-					u0.[13-shift], [0,63] */
-	u32 width;		/** Table width (in pixels).
-					This is the input frame width. */
-	u32 height;	/** Table height (in pixels).
-					This is the input frame height. */
-	u32 shift;		/** Common exponent of table content.
-					u8.0, [0,13] */
-	u32 enabled;	/** Fpn is enabled.
-					bool */
+	/*
+	 * Table content (fixed patterns noise).
+	 * u0.[13-shift], [0,63]
+	 */
+	s16 *data;
+	/*
+	 * Table width (in pixels).
+	 * This is the input frame width.
+	 */
+	u32 width;
+	/*
+	 * Table height (in pixels).
+	 * This is the input frame height.
+	 */
+	u32 height;
+	/*
+	 * Common exponent of table content.
+	 * u8.0, [0,13]
+	 */
+	u32 shift;
+	/*
+	 * Fpn is enabled.
+	 * bool
+	 */
+	u32 enabled;
 };
 
 struct ia_css_fpn_configuration {
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h
index 09d3fb41b73f..e57ae4427c0a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h
@@ -30,13 +30,15 @@
  *  ISP1: GC1 is used.
  * (ISP2: GC2(sRGB Gamma Correction) is used.)
  */
-/** IA_CSS_VAMEM_TYPE_1(ISP2300) or
-     IA_CSS_VAMEM_TYPE_2(ISP2400) */
+/*
+ * IA_CSS_VAMEM_TYPE_1(ISP2300) or
+ * IA_CSS_VAMEM_TYPE_2(ISP2400)
+ */
 union ia_css_gc_data {
+	/* Y(Luma) Gamma table on vamem type 1. u0.8, [0,255] */
 	u16 vamem_1[IA_CSS_VAMEM_1_GAMMA_TABLE_SIZE];
-	/** Y(Luma) Gamma table on vamem type 1. u0.8, [0,255] */
+	/* Y(Luma) Gamma table on vamem type 2. u0.8, [0,255] */
 	u16 vamem_2[IA_CSS_VAMEM_2_GAMMA_TABLE_SIZE];
-	/** Y(Luma) Gamma table on vamem type 2. u0.8, [0,255] */
 };
 
 struct ia_css_gamma_table {
@@ -51,12 +53,18 @@ struct ia_css_gamma_table {
  * (ISP2: GC2 (sRGB Gamma Correction) is used.)
   */
 struct ia_css_gc_config {
-	u16 gain_k1; /** Gain to adjust U after YUV Gamma Correction.
-				u0.16, [0,65535],
-				default/ineffective 19000(0.29) */
-	u16 gain_k2; /** Gain to adjust V after YUV Gamma Correction.
-				u0.16, [0,65535],
-				default/ineffective 19000(0.29) */
+	/*
+	 * Gain to adjust U after YUV Gamma Correction.
+	 * u0.16, [0,65535],
+	 * default/ineffective 19000(0.29)
+	 */
+	u16 gain_k1;
+	/*
+	 * Gain to adjust V after YUV Gamma Correction.
+	 * u0.16, [0,65535],
+	 * default/ineffective 19000(0.29)
+	 */
+	u16 gain_k2;
 };
 
 /* Chroma Enhancement configuration.
@@ -69,10 +77,16 @@ struct ia_css_gc_config {
  * (ISP2: CE1 is not used.)
  */
 struct ia_css_ce_config {
-	u8 uv_level_min; /** Minimum of chroma output level.
-				u0.8, [0,255], default/ineffective 0 */
-	u8 uv_level_max; /** Maximum of chroma output level.
-				u0.8, [0,255], default/ineffective 255 */
+	/*
+	 * Minimum of chroma output level.
+	 * u0.8, [0,255], default/ineffective 0
+	 */
+	u8 uv_level_min;
+	/*
+	 * Maximum of chroma output level.
+	 * u0.8, [0,255], default/ineffective 255
+	 */
+	u8 uv_level_max;
 };
 
 /* Multi-Axes Color Correction (MACC) configuration.
@@ -82,8 +96,11 @@ struct ia_css_ce_config {
  *  ISP2: MACC2 is used.
  */
 struct ia_css_macc_config {
-	u8 exp;	/** Common exponent of ia_css_macc_table.
-				u8.0, [0,13], default 1, ineffective 1 */
+	/*
+	 * Common exponent of ia_css_macc_table.
+	 * u8.0, [0,13], default 1, ineffective 1
+	 */
+	u8 exp;
 };
 
 #endif /* __IA_CSS_GC_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h
index abb0d3d871b3..b1e39bd83c43 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h
@@ -28,14 +28,18 @@
 #define IA_CSS_VAMEM_2_RGB_GAMMA_TABLE_SIZE_LOG2    8
 #define IA_CSS_VAMEM_2_RGB_GAMMA_TABLE_SIZE     ((1U << IA_CSS_VAMEM_2_RGB_GAMMA_TABLE_SIZE_LOG2) + 1)
 
-/** IA_CSS_VAMEM_TYPE_1(ISP2300) or
-     IA_CSS_VAMEM_TYPE_2(ISP2400) */
+/*
+ * IA_CSS_VAMEM_TYPE_1(ISP2300) or
+ * IA_CSS_VAMEM_TYPE_2(ISP2400)
+ */
 union ia_css_rgb_gamma_data {
+	/*
+	 * RGB Gamma table on vamem type1. This table is not used,
+	 * because sRGB Gamma Correction is not implemented for ISP2300.
+	 */
 	u16 vamem_1[IA_CSS_VAMEM_1_RGB_GAMMA_TABLE_SIZE];
-	/** RGB Gamma table on vamem type1. This table is not used,
-		because sRGB Gamma Correction is not implemented for ISP2300. */
+	/* RGB Gamma table on vamem type2. u0.12, [0,4095] */
 	u16 vamem_2[IA_CSS_VAMEM_2_RGB_GAMMA_TABLE_SIZE];
-	/** RGB Gamma table on vamem type2. u0.12, [0,4095] */
 };
 
 struct ia_css_rgb_gamma_table {
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index d6785724fe97..52029880032d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -55,9 +55,12 @@ struct ia_css_hdr_exclusion_params {
  * the CSS API. Currently, only test parameters are defined.
  */
 struct ia_css_hdr_config {
-	struct ia_css_hdr_irradiance_params irradiance; /** HDR irradiance parameters */
-	struct ia_css_hdr_deghost_params    deghost;    /** HDR deghosting parameters */
-	struct ia_css_hdr_exclusion_params  exclusion; /** HDR exclusion parameters */
+	/* HDR irradiance parameters */
+	struct ia_css_hdr_irradiance_params irradiance;
+	/* HDR deghosting parameters */
+	struct ia_css_hdr_deghost_params    deghost;
+	/* HDR exclusion parameters */
+	struct ia_css_hdr_exclusion_params  exclusion;
 };
 
 #endif /* __IA_CSS_HDR_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
index b0538808ae56..d096911df3fc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
@@ -45,11 +45,13 @@
  *   OutV = (   0 * InU + 4096 * InV) >> (13 - 1)
  */
 struct ia_css_macc1_5_table {
+	/*
+	 * 16 of 2x2 matix
+	 * MACC1_5: s[macc_config.exp].[13-macc_config.exp], [-8192,8191]
+	 *   default/ineffective: (s1.12)
+	 *       16 of "identity 2x2 matix" {4096,0,0,4096}
+	 */
 	s16 data[IA_CSS_MACC_NUM_COEFS * IA_CSS_MACC_NUM_AXES];
-	/** 16 of 2x2 matix
-	  MACC1_5: s[macc_config.exp].[13-macc_config.exp], [-8192,8191]
-	    default/ineffective: (s1.12)
-		16 of "identity 2x2 matix" {4096,0,0,4096} */
 };
 
 /* Multi-Axes Color Correction (MACC) configuration.
@@ -58,8 +60,11 @@ struct ia_css_macc1_5_table {
  *  ISP2: MACC1_5 is used.
  */
 struct ia_css_macc1_5_config {
-	u8 exp;	/** Common exponent of ia_css_macc_table.
-				u8.0, [0,13], default 1, ineffective 1 */
+	/*
+	 * Common exponent of ia_css_macc_table.
+	 * u8.0, [0,13], default 1, ineffective 1
+	 */
+	u8 exp;
 };
 
 #endif /* __IA_CSS_MACC1_5_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
index 20e34f53bec2..92707d602886 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
@@ -42,14 +42,16 @@
  */
 
 struct ia_css_macc_table {
+	/*
+	 * 16 of 2x2 matix
+	 * MACC1: s2.13, [-65536,65535]
+	 *   default/ineffective:
+	 *       16 of "identity 2x2 matix" {8192,0,0,8192}
+	 * MACC2: s[macc_config.exp].[13-macc_config.exp], [-8192,8191]
+	 *   default/ineffective: (s1.12)
+	 *       16 of "identity 2x2 matix" {4096,0,0,4096}
+	 */
 	s16 data[IA_CSS_MACC_NUM_COEFS * IA_CSS_MACC_NUM_AXES];
-	/** 16 of 2x2 matix
-	  MACC1: s2.13, [-65536,65535]
-	    default/ineffective:
-		16 of "identity 2x2 matix" {8192,0,0,8192}
-	  MACC2: s[macc_config.exp].[13-macc_config.exp], [-8192,8191]
-	    default/ineffective: (s1.12)
-		16 of "identity 2x2 matix" {4096,0,0,4096} */
 };
 
 #endif /* __IA_CSS_MACC_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h
index 9e5cd58df563..a34128b3c29b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h
@@ -19,18 +19,30 @@
 #include "ia_css_frac.h"
 
 struct ia_css_ob2_config {
-	ia_css_u0_16 level_gr;    /** Black level for GR pixels.
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	ia_css_u0_16  level_r;     /** Black level for R pixels.
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	ia_css_u0_16  level_b;     /** Black level for B pixels.
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	ia_css_u0_16  level_gb;    /** Black level for GB pixels.
-					u0.16, [0,65535],
-					default/ineffective 0 */
+	/*
+	 * Black level for GR pixels.
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16 level_gr;
+	/*
+	 * Black level for R pixels.
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16  level_r;
+	/*
+	 * Black level for B pixels.
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16  level_b;
+	/*
+	 * Black level for GB pixels.
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16  level_gb;
 };
 
 #endif /* __IA_CSS_OB2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h
index b1470f8b424c..066de00290a3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h
@@ -16,9 +16,9 @@
 /* Optical black mode.
  */
 enum ia_css_ob_mode {
-	IA_CSS_OB_MODE_NONE,	/** OB has no effect. */
-	IA_CSS_OB_MODE_FIXED,	/** Fixed OB */
-	IA_CSS_OB_MODE_RASTER	/** Raster OB */
+	IA_CSS_OB_MODE_NONE,	/* OB has no effect. */
+	IA_CSS_OB_MODE_FIXED,	/* Fixed OB */
+	IA_CSS_OB_MODE_RASTER	/* Raster OB */
 };
 
 /* Optical Black level configuration.
@@ -28,33 +28,54 @@ enum ia_css_ob_mode {
  *  ISP2: OB1 is used.
  */
 struct ia_css_ob_config {
-	enum ia_css_ob_mode mode; /** Mode (None / Fixed / Raster).
-					enum, [0,2],
-					default 1, ineffective 0 */
-	ia_css_u0_16 level_gr;    /** Black level for GR pixels
-					(used for Fixed Mode only).
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	ia_css_u0_16 level_r;     /** Black level for R pixels
-					(used for Fixed Mode only).
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	ia_css_u0_16 level_b;     /** Black level for B pixels
-					(used for Fixed Mode only).
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	ia_css_u0_16 level_gb;    /** Black level for GB pixels
-					(used for Fixed Mode only).
-					u0.16, [0,65535],
-					default/ineffective 0 */
-	u16 start_position; /** Start position of OB area
-					(used for Raster Mode only).
-					u16.0, [0,63],
-					default/ineffective 0 */
-	u16 end_position;  /** End position of OB area
-					(used for Raster Mode only).
-					u16.0, [0,63],
-					default/ineffective 0 */
+	/*
+	 * Mode (None / Fixed / Raster).
+	 * enum, [0,2],
+	 * default 1, ineffective 0
+	 */
+	enum ia_css_ob_mode mode;
+	/*
+	 * Black level for GR pixels
+	 * (used for Fixed Mode only).
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16 level_gr;
+	/*
+	 * Black level for R pixels
+	 * (used for Fixed Mode only).
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16 level_r;
+	/*
+	 * Black level for B pixels
+	 * (used for Fixed Mode only).
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16 level_b;
+	/*
+	 * Black level for GB pixels
+	 * (used for Fixed Mode only).
+	 * u0.16, [0,65535],
+	 * default/ineffective 0
+	 */
+	ia_css_u0_16 level_gb;
+	/*
+	 * Start position of OB area
+	 * (used for Raster Mode only).
+	 * u16.0, [0,63],
+	 * default/ineffective 0
+	 */
+	u16 start_position;
+	/*
+	 * End position of OB area
+	 * (used for Raster Mode only).
+	 * u16.0, [0,63],
+	 * default/ineffective 0
+	 */
+	u16 end_position;
 };
 
 #endif /* __IA_CSS_OB_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h
index 7c17ef200571..32646f309116 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h
@@ -32,8 +32,8 @@ struct ia_css_output1_configuration {
 };
 
 struct ia_css_output_config {
-	u8 enable_hflip;  /** enable horizontal output mirroring */
-	u8 enable_vflip;  /** enable vertical output mirroring */
+	u8 enable_hflip;	/* enable horizontal output mirroring */
+	u8 enable_vflip;	/* enable vertical output mirroring */
 };
 
 #endif /* __IA_CSS_OUTPUT_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
index b8206d2f3d31..80cd9a10b001 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
@@ -30,64 +30,103 @@
  */
 struct ia_css_3a_grid_info {
 #if defined(SYSTEM_css_skycam_c0_system)
-	u32 ae_enable;					/** ae enabled in binary,
-								   0:disabled, 1:enabled */
-	struct ae_public_config_grid_config
-		ae_grd_info;	/** see description in ae_public.h*/
-
-	u32 awb_enable;					/** awb enabled in binary,
-								   0:disabled, 1:enabled */
-	struct awb_public_config_grid_config
-		awb_grd_info;	/** see description in awb_public.h*/
-
-	u32 af_enable;					/** af enabled in binary,
-								   0:disabled, 1:enabled */
-	struct af_public_grid_config		af_grd_info;	/** see description in af_public.h*/
-
-	u32 awb_fr_enable;					/** awb_fr enabled in binary,
-								   0:disabled, 1:enabled */
-	struct awb_fr_public_grid_config
-		awb_fr_grd_info;/** see description in awb_fr_public.h*/
-
-	u32 elem_bit_depth;    /** TODO:Taken from BYT  - need input from AIQ
-					if needed for SKC
-					Bit depth of element used
-					to calculate 3A statistics.
-					This is 13, which is the normalized
-					bayer bit depth in DSP. */
+	/*
+	 * ae enabled in binary,
+	 * 0:disabled, 1:enabled
+	 */
+	u32 ae_enable;
+	/* see description in ae_public.h */
+	struct ae_public_config_grid_config ae_grd_info;
+	/*
+	 * awb enabled in binary,
+	 * 0:disabled, 1:enabled
+	 */
+	u32 awb_enable;
+	/* see description in awb_public.h */
+	struct awb_public_config_grid_config awb_grd_info;
+	/*
+	 * af enabled in binary,
+	 * 0:disabled, 1:enabled
+	 */
+	u32 af_enable;
+	/* see description in af_public.h */
+	struct af_public_grid_config		af_grd_info;
+	/*
+	 * awb_fr enabled in binary,
+	 * 0:disabled, 1:enabled
+	 */
+	u32 awb_fr_enable;
+	/* see description in awb_fr_public.h */
+	struct awb_fr_public_grid_config awb_fr_grd_info;
+	/*
+	 * TODO:Taken from BYT  - need input from AIQ
+	 * if needed for SKC
+	 * Bit depth of element used
+	 * to calculate 3A statistics.
+	 * This is 13, which is the normalized
+	 * bayer bit depth in DSP.
+	 */
+	u32 elem_bit_depth;
 
 #else
-	u32 enable;            /** 3A statistics enabled.
-					0:disabled, 1:enabled */
-	u32 use_dmem;          /** DMEM or VMEM determines layout.
-					0:3A statistics are stored to VMEM,
-					1:3A statistics are stored to DMEM */
-	u32 has_histogram;     /** Statistics include histogram.
-					0:no histogram, 1:has histogram */
-	u32 width;		    /** Width of 3A grid table.
-					(= Horizontal number of grid cells
-					in table, which cells have effective
-					statistics.) */
-	u32 height;	    /** Height of 3A grid table.
-					(= Vertical number of grid cells
-					in table, which cells have effective
-					statistics.) */
-	u32 aligned_width;     /** Horizontal stride (for alloc).
-					(= Horizontal number of grid cells
-					in table, which means
-					the allocated width.) */
-	u32 aligned_height;    /** Vertical stride (for alloc).
-					(= Vertical number of grid cells
-					in table, which means
-					the allocated height.) */
-	u32 bqs_per_grid_cell; /** Grid cell size in BQ(Bayer Quad) unit.
-					(1BQ means {Gr,R,B,Gb}(2x2 pixels).)
-					Valid values are 8,16,32,64. */
-	u32 deci_factor_log2;  /** log2 of bqs_per_grid_cell. */
-	u32 elem_bit_depth;    /** Bit depth of element used
-					to calculate 3A statistics.
-					This is 13, which is the normalized
-					bayer bit depth in DSP. */
+	/*
+	 * 3A statistics enabled.
+	 * 0:disabled, 1:enabled
+	 */
+	u32 enable;
+	/*
+	 * DMEM or VMEM determines layout.
+	 * 0:3A statistics are stored to VMEM,
+	 * 1:3A statistics are stored to DMEM
+	 */
+	u32 use_dmem;
+	/*
+	 * Statistics include histogram.
+	 * 0:no histogram, 1:has histogram
+	 */
+	u32 has_histogram;
+	/*
+	 * Width of 3A grid table.
+	 * (= Horizontal number of grid cells
+	 * in table, which cells have effective
+	 * statistics.)
+	 */
+	u32 width;
+	/*
+	 * Height of 3A grid table.
+	 * (= Vertical number of grid cells
+	 * in table, which cells have effective
+	 * statistics.)
+	 */
+	u32 height;
+	/*
+	 * Horizontal stride (for alloc).
+	 * (= Horizontal number of grid cells
+	 * in table, which means
+	 * the allocated width.)
+	 */
+	u32 aligned_width;
+	/*
+	 * Vertical stride (for alloc).
+	 * (= Vertical number of grid cells
+	 * in table, which means
+	 * the allocated height.)
+	 */
+	u32 aligned_height;
+	/*
+	 * Grid cell size in BQ(Bayer Quad) unit.
+	 * (1BQ means {Gr,R,B,Gb}(2x2 pixels).)
+	 * Valid values are 8,16,32,64.
+	 */
+	u32 bqs_per_grid_cell;
+	u32 deci_factor_log2;	/* log2 of bqs_per_grid_cell. */
+	/*
+	 * Bit depth of element used
+	 * to calculate 3A statistics.
+	 * This is 13, which is the normalized
+	 * bayer bit depth in DSP.
+	 */
+	u32 elem_bit_depth;
 #endif
 };
 
@@ -114,35 +153,59 @@ struct ia_css_3a_grid_info {
  *  ISP2: S3A2 and SDVS2 are used.
  */
 struct ia_css_3a_config {
-	ia_css_u0_16 ae_y_coef_r;	/** Weight of R for Y.
-						u0.16, [0,65535],
-						default/ineffective 25559 */
-	ia_css_u0_16 ae_y_coef_g;	/** Weight of G for Y.
-						u0.16, [0,65535],
-						default/ineffective 32768 */
-	ia_css_u0_16 ae_y_coef_b;	/** Weight of B for Y.
-						u0.16, [0,65535],
-						default/ineffective 7209 */
-	ia_css_u0_16 awb_lg_high_raw;	/** AWB level gate high for raw.
-						u0.16, [0,65535],
-						default 65472(=1023*64),
-						ineffective 65535 */
-	ia_css_u0_16 awb_lg_low;	/** AWB level gate low.
-						u0.16, [0,65535],
-						default 64(=1*64),
-						ineffective 0 */
-	ia_css_u0_16 awb_lg_high;	/** AWB level gate high.
-						u0.16, [0,65535],
-						default 65535,
-						ineffective 65535 */
-	ia_css_s0_15 af_fir1_coef[7];	/** AF FIR coefficients of fir1.
-						s0.15, [-32768,32767],
-				default/ineffective
-				-6689,-12207,-32768,32767,12207,6689,0 */
-	ia_css_s0_15 af_fir2_coef[7];	/** AF FIR coefficients of fir2.
-						s0.15, [-32768,32767],
-				default/ineffective
-				2053,0,-18437,32767,-18437,2053,0 */
+	/*
+	 * Weight of R for Y.
+	 * u0.16, [0,65535],
+	 * default/ineffective 25559
+	 */
+	ia_css_u0_16 ae_y_coef_r;
+	/*
+	 * Weight of G for Y.
+	 * u0.16, [0,65535],
+	 * default/ineffective 32768
+	 */
+	ia_css_u0_16 ae_y_coef_g;
+	/*
+	 * Weight of B for Y.
+	 * u0.16, [0,65535],
+	 * default/ineffective 7209
+	 */
+	ia_css_u0_16 ae_y_coef_b;
+	/*
+	 * AWB level gate high for raw.
+	 * u0.16, [0,65535],
+	 * default 65472(=1023*64),
+	 * ineffective 65535
+	 */
+	ia_css_u0_16 awb_lg_high_raw;
+	/*
+	 * AWB level gate low.
+	 * u0.16, [0,65535],
+	 * default 64(=1*64),
+	 * ineffective 0
+	 */
+	ia_css_u0_16 awb_lg_low;
+	/*
+	 * AWB level gate high.
+	 * u0.16, [0,65535],
+	 * default 65535,
+	 * ineffective 65535
+	 */
+	ia_css_u0_16 awb_lg_high;
+	/*
+	 * AF FIR coefficients of fir1.
+	 *                 s0.15, [-32768,32767],
+	 * default/ineffective
+	 * -6689,-12207,-32768,32767,12207,6689,0
+	 */
+	ia_css_s0_15 af_fir1_coef[7];
+	/*
+	 * AF FIR coefficients of fir2.
+	 *                 s0.15, [-32768,32767],
+	 * default/ineffective
+	 * 2053,0,-18437,32767,-18437,2053,0
+	 */
+	ia_css_s0_15 af_fir2_coef[7];
 };
 
 /* 3A statistics. This structure describes the data stored
@@ -156,41 +219,70 @@ struct ia_css_3a_config {
  *  ISP2: S3A2 is used.
  */
 struct ia_css_3a_output {
-	s32 ae_y;    /** Sum of Y in a statistics window, for AE.
-				(u19.13) */
-	s32 awb_cnt; /** Number of effective pixels
-				in a statistics window.
-				Pixels passed by the AWB level gate check are
-				judged as "effective". (u32) */
-	s32 awb_gr;  /** Sum of Gr in a statistics window, for AWB.
-				All Gr pixels (not only for effective pixels)
-				are summed. (u19.13) */
-	s32 awb_r;   /** Sum of R in a statistics window, for AWB.
-				All R pixels (not only for effective pixels)
-				are summed. (u19.13) */
-	s32 awb_b;   /** Sum of B in a statistics window, for AWB.
-				All B pixels (not only for effective pixels)
-				are summed. (u19.13) */
-	s32 awb_gb;  /** Sum of Gb in a statistics window, for AWB.
-				All Gb pixels (not only for effective pixels)
-				are summed. (u19.13) */
-	s32 af_hpf1; /** Sum of |Y| following high pass filter af_fir1
-				within a statistics window, for AF. (u19.13) */
-	s32 af_hpf2; /** Sum of |Y| following high pass filter af_fir2
-				within a statistics window, for AF. (u19.13) */
+	/*
+	 * Sum of Y in a statistics window, for AE.
+	 * (u19.13)
+	 */
+	s32 ae_y;
+	/*
+	 * Number of effective pixels
+	 * in a statistics window.
+	 * Pixels passed by the AWB level gate check are
+	 * judged as "effective". (u32)
+	 */
+	s32 awb_cnt;
+	/*
+	 * Sum of Gr in a statistics window, for AWB.
+	 * All Gr pixels (not only for effective pixels)
+	 * are summed. (u19.13)
+	 */
+	s32 awb_gr;
+	/*
+	 * Sum of R in a statistics window, for AWB.
+	 * All R pixels (not only for effective pixels)
+	 * are summed. (u19.13)
+	 */
+	s32 awb_r;
+	/*
+	 * Sum of B in a statistics window, for AWB.
+	 * All B pixels (not only for effective pixels)
+	 * are summed. (u19.13)
+	 */
+	s32 awb_b;
+	/*
+	 * Sum of Gb in a statistics window, for AWB.
+	 * All Gb pixels (not only for effective pixels)
+	 * are summed. (u19.13)
+	 */
+	s32 awb_gb;
+	/*
+	 * Sum of |Y| following high pass filter af_fir1
+	 * within a statistics window, for AF. (u19.13)
+	 */
+	s32 af_hpf1;
+	/*
+	 * Sum of |Y| following high pass filter af_fir2
+	 * within a statistics window, for AF. (u19.13)
+	 */
+	s32 af_hpf2;
 };
 
 /* 3A Statistics. This structure describes the statistics that are generated
  *  using the provided configuration (ia_css_3a_config).
  */
 struct ia_css_3a_statistics {
-	struct ia_css_3a_grid_info
-		grid;	/** grid info contains the dimensions of the 3A grid */
-	struct ia_css_3a_output
-		*data;	/** the pointer to 3a_output[grid.width * grid.height]
-						     containing the 3A statistics */
-	struct ia_css_3a_rgby_output *rgby_data;/** the pointer to 3a_rgby_output[256]
-						     containing the histogram */
+	/* grid info contains the dimensions of the 3A grid */
+	struct ia_css_3a_grid_info grid;
+	/*
+	 * the pointer to 3a_output[grid.width * grid.height]
+	 * containing the 3A statistics
+	 */
+	struct ia_css_3a_output *data;
+	/*
+	 * the pointer to 3a_rgby_output[256]
+	 * containing the histogram
+	 */
+	struct ia_css_3a_rgby_output *rgby_data;
 };
 
 /* Histogram (Statistics for AE).
@@ -204,10 +296,10 @@ struct ia_css_3a_statistics {
  *  ISP2: HIST2 is used.
  */
 struct ia_css_3a_rgby_output {
-	u32 r;	/** Number of R of one bin of the histogram R. (u24) */
-	u32 g;	/** Number of G of one bin of the histogram G. (u24) */
-	u32 b;	/** Number of B of one bin of the histogram B. (u24) */
-	u32 y;	/** Number of Y of one bin of the histogram Y. (u24) */
+	u32 r;	/* Number of R of one bin of the histogram R. (u24) */
+	u32 g;	/* Number of G of one bin of the histogram G. (u24) */
+	u32 b;	/* Number of B of one bin of the histogram B. (u24) */
+	u32 y;	/* Number of Y of one bin of the histogram Y. (u24) */
 };
 
 #endif /* __IA_CSS_S3A_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
index 2f91934f2c06..7c781b672fdd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
@@ -18,10 +18,10 @@
  *  For each color we store a grid of values.
  */
 enum ia_css_sc_color {
-	IA_CSS_SC_COLOR_GR, /** Green on a green-red line */
-	IA_CSS_SC_COLOR_R,  /** Red */
-	IA_CSS_SC_COLOR_B,  /** Blue */
-	IA_CSS_SC_COLOR_GB  /** Green on a green-blue line */
+	IA_CSS_SC_COLOR_GR,	/* Green on a green-red line */
+	IA_CSS_SC_COLOR_R,	/* Red */
+	IA_CSS_SC_COLOR_B,	/* Blue */
+	IA_CSS_SC_COLOR_GB	/* Green on a green-blue line */
 };
 
 /* Lens Shading Correction table.
@@ -55,28 +55,45 @@ enum ia_css_sc_color {
  *  ISP2: SC1 is used.
  */
 struct ia_css_shading_table {
-	u32 enable; /** Set to false for no shading correction.
-			  The data field can be NULL when enable == true */
+	/*
+	 * Set to false for no shading correction.
+	 * The data field can be NULL when enable == true
+	 */
+	u32 enable;
 	/* ------ deprecated(bz675) : from ------ */
-	u32 sensor_width;  /** Native sensor width in pixels. */
-	u32 sensor_height; /** Native sensor height in lines.
-		When shading_settings.enable_shading_table_conversion is set
-		as 0, sensor_width and sensor_height are NOT used.
-		These are used only in the legacy shading table conversion
-		in the css, when shading_settings.
-		enable_shading_table_conversion is set as 1. */
+	u32 sensor_width;	/* Native sensor width in pixels. */
+	/*
+	 * Native sensor height in lines.
+	 * When shading_settings.enable_shading_table_conversion is set
+	 * as 0, sensor_width and sensor_height are NOT used.
+	 * These are used only in the legacy shading table conversion
+	 * in the css, when shading_settings.
+	 * enable_shading_table_conversion is set as 1.
+	 */
+	u32 sensor_height;
 	/* ------ deprecated(bz675) : to ------ */
-	u32 width;  /** Number of data points per line per color.
-				u8.0, [0,81] */
-	u32 height; /** Number of lines of data points per color.
-				u8.0, [0,61] */
-	u32 fraction_bits; /** Bits of fractional part in the data
-				points.
-				u8.0, [0,13] */
+	/*
+	 * Number of data points per line per color.
+	 * u8.0, [0,81]
+	 */
+	u32 width;
+	/*
+	 * Number of lines of data points per color.
+	 * u8.0, [0,61]
+	 */
+	u32 height;
+	/*
+	 * Bits of fractional part in the data
+	 * points.
+	 * u8.0, [0,13]
+	 */
+	u32 fraction_bits;
+	/*
+	 * Table data, one array for each color.
+	 * Use ia_css_sc_color to index this array.
+	 * u[13-fraction_bits].[fraction_bits], [0,8191]
+	 */
 	u16 *data[IA_CSS_SC_NUM_COLORS];
-	/** Table data, one array for each color.
-	     Use ia_css_sc_color to index this array.
-	     u[13-fraction_bits].[fraction_bits], [0,8191] */
 };
 
 /* ------ deprecated(bz675) : from ------ */
@@ -87,24 +104,27 @@ struct ia_css_shading_table {
  *  removed from the css.
  */
 struct ia_css_shading_settings {
-	u32 enable_shading_table_conversion; /** Set to 0,
-		if the conversion of the shading table should be disabled
-		in the css. (default 1)
-		  0: The shading table is directly sent to the isp.
-		     The shading table should contain the data based on the
-		     ia_css_shading_info information filled in the css.
-		  1: The shading table is converted in the css, to be fitted
-		     to the shading table definition required in the isp.
-		NOTE:
-		Previously, the shading table was always converted in the css
-		before it was sent to the isp, and this config was not defined.
-		Currently, the driver is supposed to pass the shading table
-		which should be directly sent to the isp.
-		However, some drivers may still pass the shading table which
-		needs the conversion without setting this config as 1.
-		To support such an unexpected case for the time being,
-		enable_shading_table_conversion is set as 1 by default
-		in the css. */
+	/*
+	 * Set to 0,
+	 * if the conversion of the shading table should be disabled
+	 * in the css. (default 1)
+	 *   0: The shading table is directly sent to the isp.
+	 *      The shading table should contain the data based on the
+	 *      ia_css_shading_info information filled in the css.
+	 *   1: The shading table is converted in the css, to be fitted
+	 *      to the shading table definition required in the isp.
+	 * NOTE:
+	 * Previously, the shading table was always converted in the css
+	 * before it was sent to the isp, and this config was not defined.
+	 * Currently, the driver is supposed to pass the shading table
+	 * which should be directly sent to the isp.
+	 * However, some drivers may still pass the shading table which
+	 * needs the conversion without setting this config as 1.
+	 * To support such an unexpected case for the time being,
+	 * enable_shading_table_conversion is set as 1 by default
+	 * in the css.
+	 */
+	u32 enable_shading_table_conversion;
 };
 
 /* ------ deprecated(bz675) : to ------ */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
index 1a3790c1c353..fd6b9849f3f2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
@@ -17,8 +17,8 @@
  */
 
 struct ia_css_dvs_grid_dim {
-	u32 width;		/** Width of DVS grid table in cells */
-	u32 height;	/** Height of DVS grid table in cells */
+	u32 width;	/* Width of DVS grid table in cells */
+	u32 height;	/* Height of DVS grid table in cells */
 };
 
 /* DVS statistics dimensions in number of cells for
@@ -41,61 +41,91 @@ struct ia_css_sdis_info {
  *  ISP2: SDVS2 is used.
  */
 struct ia_css_dvs_grid_res {
-	u32 width;		/** Width of DVS grid table.
-					(= Horizontal number of grid cells
-					in table, which cells have effective
-					statistics.)
-					For DVS1, this is equal to
-					 the number of vertical statistics. */
-	u32 aligned_width; /** Stride of each grid line.
-					(= Horizontal number of grid cells
-					in table, which means
-					the allocated width.) */
-	u32 height;	/** Height of DVS grid table.
-					(= Vertical number of grid cells
-					in table, which cells have effective
-					statistics.)
-					For DVS1, This is equal to
-					the number of horizontal statistics. */
-	u32 aligned_height;/** Stride of each grid column.
-					(= Vertical number of grid cells
-					in table, which means
-					the allocated height.) */
+	/*
+	 * Width of DVS grid table.
+	 * (= Horizontal number of grid cells
+	 * in table, which cells have effective
+	 * statistics.)
+	 * For DVS1, this is equal to
+	 *  the number of vertical statistics.
+	 */
+	u32 width;
+	/*
+	 * Stride of each grid line.
+	 * (= Horizontal number of grid cells
+	 * in table, which means
+	 * the allocated width.)
+	 */
+	u32 aligned_width;
+	/*
+	 * Height of DVS grid table.
+	 * (= Vertical number of grid cells
+	 * in table, which cells have effective
+	 * statistics.)
+	 * For DVS1, This is equal to
+	 * the number of horizontal statistics.
+	 */
+	u32 height;
+	/*
+	 * Stride of each grid column.
+	 * (= Vertical number of grid cells
+	 * in table, which means
+	 * the allocated height.)
+	 */
+	u32 aligned_height;
 };
 
 /* TODO: use ia_css_dvs_grid_res in here.
  * However, that implies driver I/F changes
  */
 struct ia_css_dvs_grid_info {
-	u32 enable;        /** DVS statistics enabled.
-					0:disabled, 1:enabled */
-	u32 width;		/** Width of DVS grid table.
-					(= Horizontal number of grid cells
-					in table, which cells have effective
-					statistics.)
-					For DVS1, this is equal to
-					 the number of vertical statistics. */
-	u32 aligned_width; /** Stride of each grid line.
-					(= Horizontal number of grid cells
-					in table, which means
-					the allocated width.) */
-	u32 height;	/** Height of DVS grid table.
-					(= Vertical number of grid cells
-					in table, which cells have effective
-					statistics.)
-					For DVS1, This is equal to
-					the number of horizontal statistics. */
-	u32 aligned_height;/** Stride of each grid column.
-					(= Vertical number of grid cells
-					in table, which means
-					the allocated height.) */
-	u32 bqs_per_grid_cell; /** Grid cell size in BQ(Bayer Quad) unit.
-					(1BQ means {Gr,R,B,Gb}(2x2 pixels).)
-					For DVS1, valid value is 64.
-					For DVS2, valid value is only 64,
-					currently. */
-	u32 num_hor_coefs;	/** Number of horizontal coefficients. */
-	u32 num_ver_coefs;	/** Number of vertical coefficients. */
+	/*
+	 * DVS statistics enabled.
+	 * 0:disabled, 1:enabled
+	 */
+	u32 enable;
+	/*
+	 * Width of DVS grid table.
+	 * (= Horizontal number of grid cells
+	 * in table, which cells have effective
+	 * statistics.)
+	 * For DVS1, this is equal to
+	 *  the number of vertical statistics.
+	 */
+	u32 width;
+	/*
+	 * Stride of each grid line.
+	 * (= Horizontal number of grid cells
+	 * in table, which means
+	 * the allocated width.)
+	 */
+	u32 aligned_width;
+	/*
+	 * Height of DVS grid table.
+	 * (= Vertical number of grid cells
+	 * in table, which cells have effective
+	 * statistics.)
+	 * For DVS1, This is equal to
+	 * the number of horizontal statistics.
+	 */
+	u32 height;
+	/*
+	 * Stride of each grid column.
+	 * (= Vertical number of grid cells
+	 * in table, which means
+	 * the allocated height.)
+	 */
+	u32 aligned_height;
+	/*
+	 * Grid cell size in BQ(Bayer Quad) unit.
+	 * (1BQ means {Gr,R,B,Gb}(2x2 pixels).)
+	 * For DVS1, valid value is 64.
+	 * For DVS2, valid value is only 64,
+	 * currently.
+	 */
+	u32 bqs_per_grid_cell;
+	u32 num_hor_coefs;	/* Number of horizontal coefficients. */
+	u32 num_ver_coefs;	/* Number of vertical coefficients. */
 };
 
 /* Number of DVS statistics levels
@@ -105,85 +135,85 @@ struct ia_css_dvs_grid_info {
 /* DVS statistics generated by accelerator global configuration
  */
 struct dvs_stat_public_dvs_global_cfg {
+	/* DVS statistics global configuration - kappa */
 	unsigned char kappa;
-	/** DVS statistics global configuration - kappa */
+	/* DVS statistics global configuration - match_shift */
 	unsigned char match_shift;
-	/** DVS statistics global configuration - match_shift */
+	/* DVS statistics global configuration - y binning mode */
 	unsigned char ybin_mode;
-	/** DVS statistics global configuration - y binning mode */
 };
 
 /* DVS statistics generated by accelerator level grid
  *  configuration
  */
 struct dvs_stat_public_dvs_level_grid_cfg {
+	/* DVS statistics grid width */
 	unsigned char grid_width;
-	/** DVS statistics grid width */
+	/* DVS statistics grid height */
 	unsigned char grid_height;
-	/** DVS statistics grid height */
+	/* DVS statistics block width */
 	unsigned char block_width;
-	/** DVS statistics block width */
+	/* DVS statistics block  height */
 	unsigned char block_height;
-	/** DVS statistics block  height */
 };
 
 /* DVS statistics generated by accelerator level grid start
  *  configuration
  */
 struct dvs_stat_public_dvs_level_grid_start {
+	/* DVS statistics level x start */
 	unsigned short x_start;
-	/** DVS statistics level x start */
+	/* DVS statistics level y start */
 	unsigned short y_start;
-	/** DVS statistics level y start */
+	/* DVS statistics level enable */
 	unsigned char enable;
-	/** DVS statistics level enable */
 };
 
 /* DVS statistics generated by accelerator level grid end
  *  configuration
  */
 struct dvs_stat_public_dvs_level_grid_end {
+	/* DVS statistics level x end */
 	unsigned short x_end;
-	/** DVS statistics level x end */
+	/* DVS statistics level y end */
 	unsigned short y_end;
-	/** DVS statistics level y end */
 };
 
 /* DVS statistics generated by accelerator Feature Extraction
  *  Region Of Interest (FE-ROI) configuration
  */
 struct dvs_stat_public_dvs_level_fe_roi_cfg {
+	/* DVS statistics fe-roi level x start */
 	unsigned char x_start;
-	/** DVS statistics fe-roi level x start */
+	/* DVS statistics fe-roi level y start */
 	unsigned char y_start;
-	/** DVS statistics fe-roi level y start */
+	/* DVS statistics fe-roi level x end */
 	unsigned char x_end;
-	/** DVS statistics fe-roi level x end */
+	/* DVS statistics fe-roi level y end */
 	unsigned char y_end;
-	/** DVS statistics fe-roi level y end */
 };
 
 /* DVS statistics generated by accelerator public configuration
  */
 struct dvs_stat_public_dvs_grd_cfg {
+	/* DVS statistics level grid configuration */
 	struct dvs_stat_public_dvs_level_grid_cfg    grd_cfg;
-	/** DVS statistics level grid configuration */
+	/* DVS statistics level grid start configuration */
 	struct dvs_stat_public_dvs_level_grid_start  grd_start;
-	/** DVS statistics level grid start configuration */
+	/* DVS statistics level grid end configuration */
 	struct dvs_stat_public_dvs_level_grid_end    grd_end;
-	/** DVS statistics level grid end configuration */
 };
 
 /* DVS statistics grid generated by accelerator
  */
 struct ia_css_dvs_stat_grid_info {
+	/* DVS statistics global configuration (kappa, match, binning) */
 	struct dvs_stat_public_dvs_global_cfg       dvs_gbl_cfg;
-	/** DVS statistics global configuration (kappa, match, binning) */
+	/* DVS statistics grid configuration (blocks and grids) */
 	struct dvs_stat_public_dvs_grd_cfg       grd_cfg[IA_CSS_DVS_STAT_NUM_OF_LEVELS];
-	/** DVS statistics grid configuration (blocks and grids) */
+	/* DVS statistics FE ROI (region of interest) configuration */
 	struct dvs_stat_public_dvs_level_fe_roi_cfg
 		fe_roi_cfg[IA_CSS_DVS_STAT_NUM_OF_LEVELS];
-	/** DVS statistics FE ROI (region of interest) configuration */
 };
 
 /* DVS statistics generated by accelerator default grid info
@@ -202,10 +232,10 @@ struct ia_css_dvs_stat_grid_info {
  *  CSS format
  * */
 union ia_css_dvs_grid_u {
+	/* DVS statistics produced by accelerator grid info */
 	struct ia_css_dvs_stat_grid_info dvs_stat_grid_info;
-	/** DVS statistics produced by accelerator grid info */
+	/* DVS (DVS1/DVS2) grid info */
 	struct ia_css_dvs_grid_info dvs_grid_info;
-	/** DVS (DVS1/DVS2) grid info */
 };
 
 #endif /* __IA_CSS_SDIS_COMMON_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h
index 02a91968c37a..1d217d6e72e6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h
@@ -23,12 +23,18 @@
  */
 
 struct ia_css_dvs_coefficients {
-	struct ia_css_dvs_grid_info
-		grid;/** grid info contains the dimensions of the dvs grid */
-	s16 *hor_coefs;	/** the pointer to int16_t[grid.num_hor_coefs * IA_CSS_DVS_NUM_COEF_TYPES]
-				     containing the horizontal coefficients */
-	s16 *ver_coefs;	/** the pointer to int16_t[grid.num_ver_coefs * IA_CSS_DVS_NUM_COEF_TYPES]
-				     containing the vertical coefficients */
+	/* grid info contains the dimensions of the dvs grid */
+	struct ia_css_dvs_grid_info grid;
+	/*
+	 * the pointer to int16_t[grid.num_hor_coefs *
+	 * IA_CSS_DVS_NUM_COEF_TYPES] containing the horizontal coefficients
+	 */
+	s16 *hor_coefs;
+	/*
+	 * the pointer to int16_t[grid.num_ver_coefs *
+	 * IA_CSS_DVS_NUM_COEF_TYPES] containing the vertical coefficients
+	 */
+	s16 *ver_coefs;
 };
 
 /* DVS 1.0 Statistics.
@@ -36,12 +42,18 @@ struct ia_css_dvs_coefficients {
  */
 
 struct ia_css_dvs_statistics {
-	struct ia_css_dvs_grid_info
-		grid;/** grid info contains the dimensions of the dvs grid */
-	s32 *hor_proj;	/** the pointer to int16_t[grid.height * IA_CSS_DVS_NUM_COEF_TYPES]
-				     containing the horizontal projections */
-	s32 *ver_proj;	/** the pointer to int16_t[grid.width * IA_CSS_DVS_NUM_COEF_TYPES]
-				     containing the vertical projections */
+	/* grid info contains the dimensions of the dvs grid */
+	struct ia_css_dvs_grid_info grid;
+	/*
+	 * the pointer to int16_t[grid.height * IA_CSS_DVS_NUM_COEF_TYPES]
+	 * containing the horizontal projections
+	 */
+	s32 *hor_proj;
+	/*
+	 * the pointer to int16_t[grid.width * IA_CSS_DVS_NUM_COEF_TYPES]
+	 * containing the vertical projections
+	 */
+	s32 *ver_proj;
 };
 
 #endif /* __IA_CSS_SDIS_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
index 2bed08435755..ecdfd7798aa7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
@@ -22,10 +22,10 @@
  *  arrays that contain the coefficients for each type.
  */
 struct ia_css_dvs2_coef_types {
-	s16 *odd_real; /** real part of the odd coefficients*/
-	s16 *odd_imag; /** imaginary part of the odd coefficients*/
-	s16 *even_real;/** real part of the even coefficients*/
-	s16 *even_imag;/** imaginary part of the even coefficients*/
+	s16 *odd_real;		/* real part of the odd coefficients*/
+	s16 *odd_imag;		/* imaginary part of the odd coefficients*/
+	s16 *even_real;		/* real part of the even coefficients*/
+	s16 *even_imag;		/* imaginary part of the even coefficients*/
 };
 
 /* DVS 2.0 Coefficients. This structure describes the coefficients that are needed for the dvs statistics.
@@ -33,22 +33,22 @@ struct ia_css_dvs2_coef_types {
  *  coefficients.
  */
 struct ia_css_dvs2_coefficients {
-	struct ia_css_dvs_grid_info
-		grid;        /** grid info contains the dimensions of the dvs grid */
-	struct ia_css_dvs2_coef_types
-		hor_coefs; /** struct with pointers that contain the horizontal coefficients */
-	struct ia_css_dvs2_coef_types
-		ver_coefs; /** struct with pointers that contain the vertical coefficients */
+	/* grid info contains the dimensions of the dvs grid */
+	struct ia_css_dvs_grid_info grid;
+	/* struct with pointers that contain the horizontal coefficients */
+	struct ia_css_dvs2_coef_types hor_coefs;
+	/* struct with pointers that contain the vertical coefficients */
+	struct ia_css_dvs2_coef_types ver_coefs;
 };
 
 /* DVS 2.0 Statistic types. This structure contains 4 pointers to
  *  arrays that contain the statistics for each type.
  */
 struct ia_css_dvs2_stat_types {
-	s32 *odd_real; /** real part of the odd statistics*/
-	s32 *odd_imag; /** imaginary part of the odd statistics*/
-	s32 *even_real;/** real part of the even statistics*/
-	s32 *even_imag;/** imaginary part of the even statistics*/
+	s32 *odd_real;		/* real part of the odd statistics*/
+	s32 *odd_imag;		/* imaginary part of the odd statistics*/
+	s32 *even_real;		/* real part of the even statistics*/
+	s32 *even_imag;		/* imaginary part of the even statistics*/
 };
 
 /* DVS 2.0 Statistics. This structure describes the statistics that are generated using the provided coefficients.
@@ -56,12 +56,12 @@ struct ia_css_dvs2_stat_types {
  *  the horizontal odd real statistics. Valid statistics data area is int16_t[0..grid.height-1][0..grid.width-1]
  */
 struct ia_css_dvs2_statistics {
-	struct ia_css_dvs_grid_info
-		grid;       /** grid info contains the dimensions of the dvs grid */
-	struct ia_css_dvs2_stat_types
-		hor_prod; /** struct with pointers that contain the horizontal statistics */
-	struct ia_css_dvs2_stat_types
-		ver_prod; /** struct with pointers that contain the vertical statistics */
+	/* grid info contains the dimensions of the dvs grid */
+	struct ia_css_dvs_grid_info grid;
+	/* struct with pointers that contain the horizontal statistics */
+	struct ia_css_dvs2_stat_types hor_prod;
+	/* struct with pointers that contain the vertical statistics */
+	struct ia_css_dvs2_stat_types ver_prod;
 };
 
 #endif /* __IA_CSS_SDIS2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h
index a462365783af..c83a61efb997 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h
@@ -22,23 +22,33 @@
  * ISP2.6.1: TDF is used.
  */
 struct ia_css_tdf_config {
-	s32 thres_flat_table[64];	/** Final optimized strength table of NR for flat region. */
-	s32 thres_detail_table[64];	/** Final optimized strength table of NR for detail region. */
-	s32 epsilon_0;		/** Coefficient to control variance for dark area (for flat region). */
-	s32 epsilon_1;		/** Coefficient to control variance for bright area (for flat region). */
-	s32 eps_scale_text;		/** Epsilon scaling coefficient for texture region. */
-	s32 eps_scale_edge;		/** Epsilon scaling coefficient for edge region. */
-	s32 sepa_flat;		/** Threshold to judge flat (edge < m_Flat_thre). */
-	s32 sepa_edge;		/** Threshold to judge edge (edge > m_Edge_thre). */
-	s32 blend_flat;		/** Blending ratio at flat region. */
-	s32 blend_text;		/** Blending ratio at texture region. */
-	s32 blend_edge;		/** Blending ratio at edge region. */
-	s32 shading_gain;		/** Gain of Shading control. */
-	s32 shading_base_gain;	/** Base Gain of Shading control. */
-	s32 local_y_gain;		/** Gain of local luminance control. */
-	s32 local_y_base_gain;	/** Base gain of local luminance control. */
-	s32 rad_x_origin;		/** Initial x coord. for radius computation. */
-	s32 rad_y_origin;		/** Initial y coord. for radius computation. */
+	/* Final optimized strength table of NR for flat region. */
+	s32 thres_flat_table[64];
+	/* Final optimized strength table of NR for detail region. */
+	s32 thres_detail_table[64];
+	/* Coefficient to control variance for dark area (for flat region). */
+	s32 epsilon_0;
+	/* Coefficient to control variance for bright area (for flat region). */
+	s32 epsilon_1;
+	/* Epsilon scaling coefficient for texture region. */
+	s32 eps_scale_text;
+	/* Epsilon scaling coefficient for edge region. */
+	s32 eps_scale_edge;
+	/* Threshold to judge flat (edge < m_Flat_thre). */
+	s32 sepa_flat;
+	/* Threshold to judge edge (edge > m_Edge_thre). */
+	s32 sepa_edge;
+	s32 blend_flat;		/* Blending ratio at flat region. */
+	s32 blend_text;		/* Blending ratio at texture region. */
+	s32 blend_edge;		/* Blending ratio at edge region. */
+	s32 shading_gain;	/* Gain of Shading control. */
+	s32 shading_base_gain;	/* Base Gain of Shading control. */
+	s32 local_y_gain;	/* Gain of local luminance control. */
+	s32 local_y_base_gain;	/* Base gain of local luminance control. */
+	/* Initial x coord. for radius computation. */
+	s32 rad_x_origin;
+	/* Initial y coord. for radius computation. */
+	s32 rad_y_origin;
 };
 
 #endif /* __IA_CSS_TDF_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
index 676a633336a2..4d6a266c6f22 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
@@ -36,21 +36,24 @@ Copyright (c) 2010 - 2015, Intel Corporation.
  * 4. Selection of the reference frame buffer to be used for noise reduction.
  */
 struct ia_css_tnr3_kernel_config {
-	unsigned int maxfb_y;                        /** Maximum Feedback Gain for Y */
-	unsigned int maxfb_u;                        /** Maximum Feedback Gain for U */
-	unsigned int maxfb_v;                        /** Maximum Feedback Gain for V */
-	unsigned int round_adj_y;                    /** Rounding Adjust for Y */
-	unsigned int round_adj_u;                    /** Rounding Adjust for U */
-	unsigned int round_adj_v;                    /** Rounding Adjust for V */
-	unsigned int knee_y[TNR3_NUM_SEGMENTS - 1];  /** Knee points */
-	unsigned int sigma_y[TNR3_NUM_SEGMENTS +
-					       1]; /** Standard deviation for Y at points Y0, Y1, Y2, Y3 */
-	unsigned int sigma_u[TNR3_NUM_SEGMENTS +
-					       1]; /** Standard deviation for U at points U0, U1, U2, U3 */
-	unsigned int sigma_v[TNR3_NUM_SEGMENTS +
-					       1]; /** Standard deviation for V at points V0, V1, V2, V3 */
-	unsigned int
-	ref_buf_select;                 /** Selection of the reference buffer */
+	/* Maximum Feedback Gain for Y */
+	unsigned int maxfb_y;
+	/* Maximum Feedback Gain for U */
+	unsigned int maxfb_u;
+	/* Maximum Feedback Gain for V */
+	unsigned int maxfb_v;
+	unsigned int round_adj_y;                    /* Rounding Adjust for Y */
+	unsigned int round_adj_u;                    /* Rounding Adjust for U */
+	unsigned int round_adj_v;                    /* Rounding Adjust for V */
+	unsigned int knee_y[TNR3_NUM_SEGMENTS - 1];  /* Knee points */
+	/* Standard deviation for Y at points Y0, Y1, Y2, Y3 */
+	unsigned int sigma_y[TNR3_NUM_SEGMENTS + 1];
+	/* Standard deviation for U at points U0, U1, U2, U3 */
+	unsigned int sigma_u[TNR3_NUM_SEGMENTS + 1];
+	/* Standard deviation for V at points V0, V1, V2, V3 */
+	unsigned int sigma_v[TNR3_NUM_SEGMENTS + 1];
+	/* Selection of the reference buffer */
+	unsigned int ref_buf_select;
 };
 
 #endif
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h
index 574444750986..1bd496fd3562 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h
@@ -27,23 +27,32 @@
  */
 
 struct ia_css_tnr_config {
-	ia_css_u0_16 gain; /** Interpolation ratio of current frame
-				and previous frame.
-				gain=0.0 -> previous frame is outputted.
-				gain=1.0 -> current frame is outputted.
-				u0.16, [0,65535],
-			default 32768(0.5), ineffective 65535(almost 1.0) */
-	ia_css_u0_16 threshold_y; /** Threshold to enable interpolation of Y.
-				If difference between current frame and
-				previous frame is greater than threshold_y,
-				TNR for Y is disabled.
-				u0.16, [0,65535], default/ineffective 0 */
-	ia_css_u0_16 threshold_uv; /** Threshold to enable interpolation of
-				U/V.
-				If difference between current frame and
-				previous frame is greater than threshold_uv,
-				TNR for UV is disabled.
-				u0.16, [0,65535], default/ineffective 0 */
+	/*
+	 * Interpolation ratio of current frame
+	 *         and previous frame.
+	 *         gain=0.0 -> previous frame is outputted.
+	 *         gain=1.0 -> current frame is outputted.
+	 *         u0.16, [0,65535],
+	 * default 32768(0.5), ineffective 65535(almost 1.0)
+	 */
+	ia_css_u0_16 gain;
+	/*
+	 * Threshold to enable interpolation of Y.
+	 * If difference between current frame and
+	 * previous frame is greater than threshold_y,
+	 * TNR for Y is disabled.
+	 * u0.16, [0,65535], default/ineffective 0
+	 */
+	ia_css_u0_16 threshold_y;
+	/*
+	 * Threshold to enable interpolation of
+	 * U/V.
+	 * If difference between current frame and
+	 * previous frame is greater than threshold_uv,
+	 * TNR for UV is disabled.
+	 * u0.16, [0,65535], default/ineffective 0
+	 */
+	ia_css_u0_16 threshold_uv;
 };
 
 #endif /* __IA_CSS_TNR_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h
index cf1e4f401cd1..cc989e7fb3cc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h
@@ -17,7 +17,7 @@
 
 /* Viewfinder decimation */
 struct sh_css_isp_vf_isp_config {
-	u32 vf_downscale_bits; /** Log VF downscale value */
+	u32 vf_downscale_bits;	/* Log VF downscale value */
 	u32 enable;
 	struct ia_css_frame_sp_info info;
 	struct {
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h
index 0319fb1a33db..9426732ee9b0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h
@@ -16,7 +16,7 @@
 #include <type_support.h>
 
 struct ia_css_vf_configuration {
-	u32 vf_downscale_bits; /** Log VF downscale value */
+	u32 vf_downscale_bits;	/* Log VF downscale value */
 	const struct ia_css_frame_info *info;
 };
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h
index 3a59c7de7387..31d351dc06a8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h
@@ -18,21 +18,36 @@
  *  ISP2: WB1 is used.
  */
 struct ia_css_wb_config {
-	u32 integer_bits; /** Common exponent of gains.
-				u8.0, [0,3],
-				default 1, ineffective 1 */
-	u32 gr;	/** Significand of Gr gain.
-				u[integer_bits].[16-integer_bits], [0,65535],
-				default/ineffective 32768(u1.15, 1.0) */
-	u32 r;	/** Significand of R gain.
-				u[integer_bits].[16-integer_bits], [0,65535],
-				default/ineffective 32768(u1.15, 1.0) */
-	u32 b;	/** Significand of B gain.
-				u[integer_bits].[16-integer_bits], [0,65535],
-				default/ineffective 32768(u1.15, 1.0) */
-	u32 gb;	/** Significand of Gb gain.
-				u[integer_bits].[16-integer_bits], [0,65535],
-				default/ineffective 32768(u1.15, 1.0) */
+	/*
+	 * Common exponent of gains.
+	 * u8.0, [0,3],
+	 * default 1, ineffective 1
+	 */
+	u32 integer_bits;
+	/*
+	 * Significand of Gr gain.
+	 * u[integer_bits].[16-integer_bits], [0,65535],
+	 * default/ineffective 32768(u1.15, 1.0)
+	 */
+	u32 gr;
+	/*
+	 * Significand of R gain.
+	 * u[integer_bits].[16-integer_bits], [0,65535],
+	 * default/ineffective 32768(u1.15, 1.0)
+	 */
+	u32 r;
+	/*
+	 * Significand of B gain.
+	 * u[integer_bits].[16-integer_bits], [0,65535],
+	 * default/ineffective 32768(u1.15, 1.0)
+	 */
+	u32 b;
+	/*
+	 * Significand of Gb gain.
+	 * u[integer_bits].[16-integer_bits], [0,65535],
+	 * default/ineffective 32768(u1.15, 1.0)
+	 */
+	u32 gb;
 };
 
 #endif /* __IA_CSS_WB_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h
index 42ad8b9b51d3..08b6d257263e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h
@@ -38,13 +38,15 @@
 /* Number of elements in the xnr table. */
 #define IA_CSS_VAMEM_2_XNR_TABLE_SIZE		BIT(IA_CSS_VAMEM_2_XNR_TABLE_SIZE_LOG2)
 
-/** IA_CSS_VAMEM_TYPE_1(ISP2300) or
-     IA_CSS_VAMEM_TYPE_2(ISP2400) */
+/*
+ * IA_CSS_VAMEM_TYPE_1(ISP2300) or
+ * IA_CSS_VAMEM_TYPE_2(ISP2400)
+ */
 union ia_css_xnr_data {
+	/* Coefficients table on vamem type1. u0.12, [0,4095] */
 	u16 vamem_1[IA_CSS_VAMEM_1_XNR_TABLE_SIZE];
-	/** Coefficients table on vamem type1. u0.12, [0,4095] */
+	/* Coefficients table on vamem type2. u0.12, [0,4095] */
 	u16 vamem_2[IA_CSS_VAMEM_2_XNR_TABLE_SIZE];
-	/** Coefficients table on vamem type2. u0.12, [0,4095] */
 };
 
 struct ia_css_xnr_table {
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
index fc4b9033951c..aec778efa9c7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
@@ -38,12 +38,12 @@
  * IA_CSS_XNR3_SIGMA_SCALE.
  */
 struct ia_css_xnr3_sigma_params {
-	int y0;     /** Sigma for Y range similarity in dark area */
-	int y1;     /** Sigma for Y range similarity in bright area */
-	int u0;     /** Sigma for U range similarity in dark area */
-	int u1;     /** Sigma for U range similarity in bright area */
-	int v0;     /** Sigma for V range similarity in dark area */
-	int v1;     /** Sigma for V range similarity in bright area */
+	int y0;		/* Sigma for Y range similarity in dark area */
+	int y1;		/* Sigma for Y range similarity in bright area */
+	int u0;		/* Sigma for U range similarity in dark area */
+	int u1;		/* Sigma for U range similarity in bright area */
+	int v0;		/* Sigma for V range similarity in dark area */
+	int v1;		/* Sigma for V range similarity in bright area */
 };
 
 /*
@@ -55,10 +55,10 @@ struct ia_css_xnr3_sigma_params {
  * with IA_CSS_XNR3_CORING_SCALE. The ineffective value is 0.
  */
 struct ia_css_xnr3_coring_params {
-	int u0;     /** Coring threshold of U channel in dark area */
-	int u1;     /** Coring threshold of U channel in bright area */
-	int v0;     /** Coring threshold of V channel in dark area */
-	int v1;     /** Coring threshold of V channel in bright area */
+	int u0;		/* Coring threshold of U channel in dark area */
+	int u1;		/* Coring threshold of U channel in bright area */
+	int v0;		/* Coring threshold of V channel in dark area */
+	int v1;		/* Coring threshold of V channel in bright area */
 };
 
 /*
@@ -72,7 +72,7 @@ struct ia_css_xnr3_coring_params {
  * value of 0.0 bypasses the entire xnr3 filter.
  */
 struct ia_css_xnr3_blending_params {
-	int strength;   /** Blending strength */
+	int strength;	/* Blending strength */
 };
 
 /*
@@ -81,9 +81,11 @@ struct ia_css_xnr3_blending_params {
  * from the CSS API.
  */
 struct ia_css_xnr3_config {
-	struct ia_css_xnr3_sigma_params    sigma;    /** XNR3 sigma parameters */
-	struct ia_css_xnr3_coring_params   coring;   /** XNR3 coring parameters */
-	struct ia_css_xnr3_blending_params blending; /** XNR3 blending parameters */
+	struct ia_css_xnr3_sigma_params    sigma;    /* XNR3 sigma parameters */
+	/* XNR3 coring parameters */
+	struct ia_css_xnr3_coring_params   coring;
+	/* XNR3 blending parameters */
+	struct ia_css_xnr3_blending_params blending;
 };
 
 #endif /* __IA_CSS_XNR3_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h
index bf5c388938ef..1fc2ab54b876 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h
@@ -20,25 +20,40 @@
  *        BNR1,YNR2,CNR2 are used for Still.
  */
 struct ia_css_nr_config {
-	ia_css_u0_16 bnr_gain;	   /** Strength of noise reduction (BNR).
-				u0.16, [0,65535],
-				default 14336(0.21875), ineffective 0 */
-	ia_css_u0_16 ynr_gain;	   /** Strength of noise reduction (YNR).
-				u0.16, [0,65535],
-				default 14336(0.21875), ineffective 0 */
-	ia_css_u0_16 direction;    /** Sensitivity of edge (BNR).
-				u0.16, [0,65535],
-				default 512(0.0078125), ineffective 0 */
-	ia_css_u0_16 threshold_cb; /** Coring threshold for Cb (CNR).
-				This is the same as
-				de_config.c1_coring_threshold.
-				u0.16, [0,65535],
-				default 0(0), ineffective 0 */
-	ia_css_u0_16 threshold_cr; /** Coring threshold for Cr (CNR).
-				This is the same as
-				de_config.c2_coring_threshold.
-				u0.16, [0,65535],
-				default 0(0), ineffective 0 */
+	/*
+	 * Strength of noise reduction (BNR).
+	 * u0.16, [0,65535],
+	 * default 14336(0.21875), ineffective 0
+	 */
+	ia_css_u0_16 bnr_gain;
+	/*
+	 * Strength of noise reduction (YNR).
+	 * u0.16, [0,65535],
+	 * default 14336(0.21875), ineffective 0
+	 */
+	ia_css_u0_16 ynr_gain;
+	/*
+	 * Sensitivity of edge (BNR).
+	 * u0.16, [0,65535],
+	 * default 512(0.0078125), ineffective 0
+	 */
+	ia_css_u0_16 direction;
+	/*
+	 * Coring threshold for Cb (CNR).
+	 * This is the same as
+	 * de_config.c1_coring_threshold.
+	 * u0.16, [0,65535],
+	 * default 0(0), ineffective 0
+	 */
+	ia_css_u0_16 threshold_cb;
+	/*
+	 * Coring threshold for Cr (CNR).
+	 * This is the same as
+	 * de_config.c2_coring_threshold.
+	 * u0.16, [0,65535],
+	 * default 0(0), ineffective 0
+	 */
+	ia_css_u0_16 threshold_cr;
 };
 
 /* Edge Enhancement (sharpen) configuration.
@@ -49,24 +64,33 @@ struct ia_css_nr_config {
  *       (YEE2 is used for Still.)
  */
 struct ia_css_ee_config {
-	ia_css_u5_11 gain;	  /** The strength of sharpness.
-					u5.11, [0,65535],
-					default 8192(4.0), ineffective 0 */
-	ia_css_u8_8 threshold;    /** The threshold that divides noises from
-					edge.
-					u8.8, [0,65535],
-					default 256(1.0), ineffective 65535 */
-	ia_css_u5_11 detail_gain; /** The strength of sharpness in pell-mell
-					area.
-					u5.11, [0,65535],
-					default 2048(1.0), ineffective 0 */
+	/*
+	 * The strength of sharpness.
+	 * u5.11, [0,65535],
+	 * default 8192(4.0), ineffective 0
+	 */
+	ia_css_u5_11 gain;
+	/*
+	 * The threshold that divides noises from
+	 * edge.
+	 * u8.8, [0,65535],
+	 * default 256(1.0), ineffective 65535
+	 */
+	ia_css_u8_8 threshold;
+	/*
+	 * The strength of sharpness in pell-mell
+	 * area.
+	 * u5.11, [0,65535],
+	 * default 2048(1.0), ineffective 0
+	 */
+	ia_css_u5_11 detail_gain;
 };
 
 /* YNR and YEE (sharpen) configuration.
  */
 struct ia_css_yee_config {
-	struct ia_css_nr_config nr; /** The NR configuration. */
-	struct ia_css_ee_config ee; /** The EE configuration. */
+	struct ia_css_nr_config nr;	/* The NR configuration. */
+	struct ia_css_ee_config ee;	/* The EE configuration. */
 };
 
 #endif /* __IA_CSS_YNR_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h
index 502e104d7226..77ed218e4e8c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h
@@ -19,18 +19,30 @@
  *  ISP2: YNR2 and YEE2 are used for Still.
  */
 struct ia_css_ynr_config {
-	u16 edge_sense_gain_0;   /** Sensitivity of edge in dark area.
-					u13.0, [0,8191],
-					default 1000, ineffective 0 */
-	u16 edge_sense_gain_1;   /** Sensitivity of edge in bright area.
-					u13.0, [0,8191],
-					default 1000, ineffective 0 */
-	u16 corner_sense_gain_0; /** Sensitivity of corner in dark area.
-					u13.0, [0,8191],
-					default 1000, ineffective 0 */
-	u16 corner_sense_gain_1; /** Sensitivity of corner in bright area.
-					u13.0, [0,8191],
-					default 1000, ineffective 0 */
+	/*
+	 * Sensitivity of edge in dark area.
+	 * u13.0, [0,8191],
+	 * default 1000, ineffective 0
+	 */
+	u16 edge_sense_gain_0;
+	/*
+	 * Sensitivity of edge in bright area.
+	 * u13.0, [0,8191],
+	 * default 1000, ineffective 0
+	 */
+	u16 edge_sense_gain_1;
+	/*
+	 * Sensitivity of corner in dark area.
+	 * u13.0, [0,8191],
+	 * default 1000, ineffective 0
+	 */
+	u16 corner_sense_gain_0;
+	/*
+	 * Sensitivity of corner in bright area.
+	 * u13.0, [0,8191],
+	 * default 1000, ineffective 0
+	 */
+	u16 corner_sense_gain_1;
 };
 
 /* Fringe Control configuration.
@@ -41,45 +53,84 @@ struct ia_css_ynr_config {
  *  ISP2: FC2 is used for Still.
  */
 struct ia_css_fc_config {
-	u8  gain_exp;   /** Common exponent of gains.
-				u8.0, [0,13],
-				default 1, ineffective 0 */
-	u16 coring_pos_0; /** Coring threshold for positive edge in dark area.
-				u0.13, [0,8191],
-				default 0(0), ineffective 0 */
-	u16 coring_pos_1; /** Coring threshold for positive edge in bright area.
-				u0.13, [0,8191],
-				default 0(0), ineffective 0 */
-	u16 coring_neg_0; /** Coring threshold for negative edge in dark area.
-				u0.13, [0,8191],
-				default 0(0), ineffective 0 */
-	u16 coring_neg_1; /** Coring threshold for negative edge in bright area.
-				u0.13, [0,8191],
-				default 0(0), ineffective 0 */
-	u16 gain_pos_0; /** Gain for positive edge in dark area.
-				u0.13, [0,8191],
-				default 4096(0.5), ineffective 0 */
-	u16 gain_pos_1; /** Gain for positive edge in bright area.
-				u0.13, [0,8191],
-				default 4096(0.5), ineffective 0 */
-	u16 gain_neg_0; /** Gain for negative edge in dark area.
-				u0.13, [0,8191],
-				default 4096(0.5), ineffective 0 */
-	u16 gain_neg_1; /** Gain for negative edge in bright area.
-				u0.13, [0,8191],
-				default 4096(0.5), ineffective 0 */
-	u16 crop_pos_0; /** Limit for positive edge in dark area.
-				u0.13, [0,8191],
-				default/ineffective 8191(almost 1.0) */
-	u16 crop_pos_1; /** Limit for positive edge in bright area.
-				u0.13, [0,8191],
-				default/ineffective 8191(almost 1.0) */
-	s16  crop_neg_0; /** Limit for negative edge in dark area.
-				s0.13, [-8192,0],
-				default/ineffective -8192(-1.0) */
-	s16  crop_neg_1; /** Limit for negative edge in bright area.
-				s0.13, [-8192,0],
-				default/ineffective -8192(-1.0) */
+	/*
+	 * Common exponent of gains.
+	 * u8.0, [0,13],
+	 * default 1, ineffective 0
+	 */
+	u8  gain_exp;
+	/*
+	 * Coring threshold for positive edge in dark area.
+	 * u0.13, [0,8191],
+	 * default 0(0), ineffective 0
+	 */
+	u16 coring_pos_0;
+	/*
+	 * Coring threshold for positive edge in bright area.
+	 * u0.13, [0,8191],
+	 * default 0(0), ineffective 0
+	 */
+	u16 coring_pos_1;
+	/*
+	 * Coring threshold for negative edge in dark area.
+	 * u0.13, [0,8191],
+	 * default 0(0), ineffective 0
+	 */
+	u16 coring_neg_0;
+	/*
+	 * Coring threshold for negative edge in bright area.
+	 * u0.13, [0,8191],
+	 * default 0(0), ineffective 0
+	 */
+	u16 coring_neg_1;
+	/*
+	 * Gain for positive edge in dark area.
+	 * u0.13, [0,8191],
+	 * default 4096(0.5), ineffective 0
+	 */
+	u16 gain_pos_0;
+	/*
+	 * Gain for positive edge in bright area.
+	 * u0.13, [0,8191],
+	 * default 4096(0.5), ineffective 0
+	 */
+	u16 gain_pos_1;
+	/*
+	 * Gain for negative edge in dark area.
+	 * u0.13, [0,8191],
+	 * default 4096(0.5), ineffective 0
+	 */
+	u16 gain_neg_0;
+	/*
+	 * Gain for negative edge in bright area.
+	 * u0.13, [0,8191],
+	 * default 4096(0.5), ineffective 0
+	 */
+	u16 gain_neg_1;
+	/*
+	 * Limit for positive edge in dark area.
+	 * u0.13, [0,8191],
+	 * default/ineffective 8191(almost 1.0)
+	 */
+	u16 crop_pos_0;
+	/*
+	 * Limit for positive edge in bright area.
+	 * u0.13, [0,8191],
+	 * default/ineffective 8191(almost 1.0)
+	 */
+	u16 crop_pos_1;
+	/*
+	 * Limit for negative edge in dark area.
+	 * s0.13, [-8192,0],
+	 * default/ineffective -8192(-1.0)
+	 */
+	s16  crop_neg_0;
+	/*
+	 * Limit for negative edge in bright area.
+	 * s0.13, [-8192,0],
+	 * default/ineffective -8192(-1.0)
+	 */
+	s16  crop_neg_1;
 };
 
 #endif /* __IA_CSS_YNR2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index b7ff809eeeab..fda157ec0cc8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -45,21 +45,21 @@ extern int dbg_level;
  *  Values can be combined to dump a combination of sets.
  */
 enum ia_css_debug_enable_param_dump {
-	IA_CSS_DEBUG_DUMP_FPN = BIT(0),  /** FPN table */
-	IA_CSS_DEBUG_DUMP_OB  = BIT(1),  /** OB table */
-	IA_CSS_DEBUG_DUMP_SC  = BIT(2),  /** Shading table */
-	IA_CSS_DEBUG_DUMP_WB  = BIT(3),  /** White balance */
-	IA_CSS_DEBUG_DUMP_DP  = BIT(4),  /** Defect Pixel */
-	IA_CSS_DEBUG_DUMP_BNR = BIT(5),  /** Bayer Noise Reductions */
-	IA_CSS_DEBUG_DUMP_S3A = BIT(6),  /** 3A Statistics */
-	IA_CSS_DEBUG_DUMP_DE  = BIT(7),  /** De Mosaicing */
-	IA_CSS_DEBUG_DUMP_YNR = BIT(8),  /** Luma Noise Reduction */
-	IA_CSS_DEBUG_DUMP_CSC = BIT(9),  /** Color Space Conversion */
-	IA_CSS_DEBUG_DUMP_GC  = BIT(10), /** Gamma Correction */
-	IA_CSS_DEBUG_DUMP_TNR = BIT(11), /** Temporal Noise Reduction */
-	IA_CSS_DEBUG_DUMP_ANR = BIT(12), /** Advanced Noise Reduction */
-	IA_CSS_DEBUG_DUMP_CE  = BIT(13), /** Chroma Enhancement */
-	IA_CSS_DEBUG_DUMP_ALL = BIT(14), /** Dump all device parameters */
+	IA_CSS_DEBUG_DUMP_FPN = BIT(0),		/* FPN table */
+	IA_CSS_DEBUG_DUMP_OB  = BIT(1),		/* OB table */
+	IA_CSS_DEBUG_DUMP_SC  = BIT(2),		/* Shading table */
+	IA_CSS_DEBUG_DUMP_WB  = BIT(3),		/* White balance */
+	IA_CSS_DEBUG_DUMP_DP  = BIT(4),		/* Defect Pixel */
+	IA_CSS_DEBUG_DUMP_BNR = BIT(5),		/* Bayer Noise Reductions */
+	IA_CSS_DEBUG_DUMP_S3A = BIT(6),		/* 3A Statistics */
+	IA_CSS_DEBUG_DUMP_DE  = BIT(7),		/* De Mosaicing */
+	IA_CSS_DEBUG_DUMP_YNR = BIT(8),		/* Luma Noise Reduction */
+	IA_CSS_DEBUG_DUMP_CSC = BIT(9),		/* Color Space Conversion */
+	IA_CSS_DEBUG_DUMP_GC  = BIT(10),	/* Gamma Correction */
+	IA_CSS_DEBUG_DUMP_TNR = BIT(11),	/* Temporal Noise Reduction */
+	IA_CSS_DEBUG_DUMP_ANR = BIT(12),	/* Advanced Noise Reduction */
+	IA_CSS_DEBUG_DUMP_CE  = BIT(13),	/* Chroma Enhancement */
+	IA_CSS_DEBUG_DUMP_ALL = BIT(14),	/* Dump all device parameters */
 };
 
 #define IA_CSS_ERROR(fmt, ...) \
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
index 095d1853670f..5e80e96b04e3 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
@@ -54,7 +54,7 @@ struct ia_css_isp_param_isp_segments {
 
 /* Memory offsets in binary info */
 struct ia_css_isp_param_memory_offsets {
-	u32 offsets[IA_CSS_NUM_PARAM_CLASSES];  /** offset wrt hdr in bytes */
+	u32 offsets[IA_CSS_NUM_PARAM_CLASSES];	/* offset wrt hdr in bytes */
 };
 
 /* Offsets for ISP kernel parameters per isp memory.
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f4b4..ae9e10ad139c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -12,17 +12,18 @@
 #include "ia_css_spctrl_comm.h"
 
 typedef struct {
-	u32        ddr_data_offset;       /**  posistion of data in DDR */
-	u32        dmem_data_addr;        /** data segment address in dmem */
-	u32        dmem_bss_addr;         /** bss segment address in dmem  */
-	u32        data_size;             /** data segment size            */
-	u32        bss_size;              /** bss segment size             */
+	u32        ddr_data_offset;       /*  posistion of data in DDR */
+	u32        dmem_data_addr;        /* data segment address in dmem */
+	u32        dmem_bss_addr;         /* bss segment address in dmem  */
+	u32        data_size;             /* data segment size            */
+	u32        bss_size;              /* bss segment size             */
 	u32        spctrl_config_dmem_addr; /* <location of dmem_cfg  in SP dmem */
 	u32        spctrl_state_dmem_addr;  /* < location of state  in SP dmem */
 	unsigned int    sp_entry;                /* < entry function ptr on SP */
-	const void      *code;                   /** location of firmware */
+	const void      *code;                   /* location of firmware */
 	u32         code_size;
-	char      *program_name;    /** not used on hardware, only for simulation */
+	/* not used on hardware, only for simulation */
+	char      *program_name;
 } ia_css_spctrl_cfg;
 
 /* Get the code addr in DDR of SP */
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h
index f358785fa5b6..665b89adb3cb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h
@@ -23,12 +23,12 @@ typedef enum {
  * initialization of SP DMEM using the SP itself
  */
 struct ia_css_sp_init_dmem_cfg {
-	ia_css_ptr      ddr_data_addr;  /** data segment address in ddr  */
-	u32        dmem_data_addr; /** data segment address in dmem */
-	u32        dmem_bss_addr;  /** bss segment address in dmem  */
-	u32        data_size;      /** data segment size            */
-	u32        bss_size;       /** bss segment size             */
-	sp_ID_t         sp_id;          /* <sp Id */
+	ia_css_ptr      ddr_data_addr;	/* data segment address in ddr  */
+	u32        dmem_data_addr;	/* data segment address in dmem */
+	u32        dmem_bss_addr;	/* bss segment address in dmem  */
+	u32        data_size;		/* data segment size            */
+	u32        bss_size;		/* bss segment size             */
+	sp_ID_t         sp_id;		/* <sp Id */
 };
 
 #define SIZE_OF_IA_CSS_SP_INIT_DMEM_CFG_STRUCT	\
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..81702e2d389c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -102,21 +102,21 @@ enum ia_sh_css_modes {
 	sh_css_mode_resume
 };
 
-/**
+/*
  * struct sh_css_stream_seed - a stream seed, to save and restore the
  * stream data.
  *
- * @orig_stream:	pointer to restore the original handle
- * @stream:		handle, used as ID too.
- * @stream_config:	stream config struct
- * @num_pipes:		number of pipes
- * @pipes:		pipe handles
- * @orig_pipes:		pointer to restore original handle
- * @pipe_config:	pipe config structs
+ * @orig_stream:        pointer to restore the original handle
+ * @stream:             handle, used as ID too.
+ * @stream_config:      stream config struct
+ * @num_pipes:          number of pipes
+ * @pipes:              pipe handles
+ * @orig_pipes:         pointer to restore original handle
+ * @pipe_config:        pipe config structs
  *
  * the stream seed contains all the data required to "grow" the seed again
  * after it was closed.
-*/
+ */
 struct sh_css_stream_seed {
 	struct ia_css_stream		**orig_stream;
 	struct ia_css_stream		*stream;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index ec68c16d4272..effc1af560de 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -224,13 +224,18 @@ struct sh_css_ddr_address_map_compound {
 };
 
 struct ia_css_isp_parameter_set_info {
-	struct sh_css_ddr_address_map
-		mem_map;/** pointers to Parameters in ISP format IMPT:
-						    This should be first member of this struct */
-	u32
-	isp_parameters_id;/** Unique ID to track which config was actually applied to a particular frame */
-	ia_css_ptr
-	output_frame_ptr;/** Output frame to which this config has to be applied (optional) */
+	/*
+	 * pointers to Parameters in ISP format IMPT: This should be
+	 * first member of this struct
+	 */
+	struct sh_css_ddr_address_map mem_map;
+	/*
+	 * Unique ID to track which config was actually applied to a
+	 * particular frame
+	 */
+	u32 isp_parameters_id;
+	/* Output frame to which this config has to be applied (optional) */
+	ia_css_ptr output_frame_ptr;
 };
 
 /* this struct contains all arguments that can be passed to
@@ -344,13 +349,17 @@ struct sh_css_sp_input_formatter_set {
  * Do NOT change this struct's layout or remove seemingly unused fields!
  */
 struct sh_css_sp_config {
-	u8			no_isp_sync; /* Signal host immediately after start */
-	u8			enable_raw_pool_locking; /** Enable Raw Buffer Locking for HALv3 Support */
+	/* Signal host immediately after start */
+	u8			no_isp_sync;
+	/* Enable Raw Buffer Locking for HALv3 Support */
+	u8			enable_raw_pool_locking;
+	/*
+	 * If raw buffer locking is enabled, this flag indicates whether
+	 * raw frames are locked when their EOF event is successfully
+	 * sent to the host (true) or when they are passed to the
+	 * preview/video pipe (false).
+	 */
 	u8			lock_all;
-	/** If raw buffer locking is enabled, this flag indicates whether raw
-	     frames are locked when their EOF event is successfully sent to the
-	     host (true) or when they are passed to the preview/video pipe
-	     (false). */
 
 	 /*
 	  * Note the fields below are only used on the ISP2400 not on the ISP2401,
@@ -360,8 +369,9 @@ struct sh_css_sp_config {
 		u8					a_changed;
 		u8					b_changed;
 		u8					isp_2ppc;
+		/* CSI-2 port is used as index. */
 		struct sh_css_sp_input_formatter_set
-			set[SH_CSS_MAX_IF_CONFIGS]; /* CSI-2 port is used as index. */
+			set[SH_CSS_MAX_IF_CONFIGS];
 	} input_formatter;
 
 	sync_generator_cfg_t	sync_gen;
@@ -414,8 +424,8 @@ struct sh_css_sp_pipeline_io {
  * Only when all streams are configured, the CSI RX is started for that port.
  */
 struct sh_css_sp_pipeline_io_status {
-	u32	active[N_INPUT_SYSTEM_CSI_PORT];	/** registered streams */
-	u32	running[N_INPUT_SYSTEM_CSI_PORT];	/** configured streams */
+	u32	active[N_INPUT_SYSTEM_CSI_PORT];	/* registered streams */
+	u32	running[N_INPUT_SYSTEM_CSI_PORT];	/* configured streams */
 };
 
 enum sh_css_port_dir {
@@ -673,8 +683,11 @@ struct sh_css_hmm_buffer {
 			ia_css_ptr	frame_data;
 			u32	flashed;
 			u32	exp_id;
-			u32	isp_parameters_id; /** Unique ID to track which config was
-								actually applied to a particular frame */
+			/*
+			 * Unique ID to track which config was actually
+			 * applied to a particular frame
+			 */
+			u32	isp_parameters_id;
 		} frame;
 		ia_css_ptr ddr_ptrs;
 	} payload;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58..543d7d0530db 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -219,7 +219,7 @@ static int calculate_mipi_buff_size(struct ia_css_stream_config *stream_cfg,
 	unsigned int mem_words_per_buff = 0;
 	int err = 0;
 
-	/**
+	/*
 	 * zhengjie.lu@intel.com
 	 *
 	 * NOTE
@@ -236,7 +236,7 @@ static int calculate_mipi_buff_size(struct ia_css_stream_config *stream_cfg,
 	pack_raw_pixels = stream_cfg->pack_raw_pixels;
 	/* end of NOTE */
 
-	/**
+	/*
 	 * zhengjie.lu@intel.com
 	 *
 	 * NOTE
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..70d87f7dd82c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3960,7 +3960,7 @@ sh_css_update_uds_and_crop_info(
 		bool upscale_y = in_frame_info->res.height < out_frame_info->res.height;
 
 		if (info->enable.uds && !info->enable.ds) {
-			/**
+			/*
 			 * we calculate with the envelope that we can actually
 			 * use, the min dvs envelope is for the filter
 			 * initialization.
@@ -3971,7 +3971,7 @@ sh_css_update_uds_and_crop_info(
 				     SH_CSS_MIN_DVS_ENVELOPE;
 			half_env_x = env_width / 2;
 			half_env_y = env_height / 2;
-			/**
+			/*
 			 * for digital zoom, we use the dvs envelope and make
 			 * sure that we don't include the 8 leftmost pixels or
 			 * 8 topmost rows.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.h b/drivers/staging/media/atomisp/pci/sh_css_params.h
index 75957dea3c38..a573019c2a79 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.h
@@ -133,9 +133,13 @@ struct ia_css_isp_parameters {
 	struct sh_css_ddr_address_map_size pipe_ddr_ptrs_size[IA_CSS_PIPE_ID_NUM];
 	struct sh_css_ddr_address_map ddr_ptrs;
 	struct sh_css_ddr_address_map_size ddr_ptrs_size;
-	struct ia_css_frame
-		*output_frame; /** Output frame the config is to be applied to (optional) */
-	u32 isp_parameters_id; /** Unique ID to track which config was actually applied to a particular frame */
+	/* Output frame the config is to be applied to (optional) */
+	struct ia_css_frame *output_frame;
+	/*
+	 * Unique ID to track which config was actually applied to a particular
+	 * frame
+	 */
+	u32 isp_parameters_id;
 };
 
 void

-- 
2.55.0.rc0.799.gd6f94ed593-goog


