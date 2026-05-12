Return-Path: <linux-media+bounces-61319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCZhIdaBA2pX6gEAu9opvQ
	(envelope-from <linux-media+bounces-61319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 21:39:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5B528C0E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 21:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 247983119737
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B5B366054;
	Tue, 12 May 2026 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="CB4G9YGr"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C722D6E6C
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778614524; cv=none; b=KxRSEPEjMt8uWKcoUbjHV9Wai63Dig9RgTFhAiWVtvVgKXCEF8tZ8bJGTDAtczo3lwlbj97ksr7g1324cG65eUOR8ruucUJDiQKO4rSDqJnhVd9D+4tD4VL1mJl/OlfGTw8OuxkWfAfMtxYb35NG+d/ZsAFhQt1+cFKFk2A6w/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778614524; c=relaxed/simple;
	bh=SWcprvJI19SCcP7aeYTJ3NgcYp2vxGmrTPZCl7ZBcYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=kHAd1Z493ay+QcaaExdZ8DX+duFPJNrsPtJ5hdCBm0RmsdSn8mgWYVzwzXI4dBGSeRqy01CNv3t4HUHldpXuMom21XqEJf16Dzp0YTkKwqOkp+g7zSO4SGWReQrNK51VdvUhQNaFGWdZLhDhIG5V2LUeACgUDTOG47vMzY4EcoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=CB4G9YGr; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1778614521; bh=GCL+7JZ51kYJLm0NYk/mb+ZAptiRR6xYLPfYPOAAqoM=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=CB4G9YGrZybDdrnntES5LAdnVw+mKN7Ux36rmk2MODwxxrVFEaqEPOwDVUnL05tPLBpxHxXzMbw0UqaY31/xU27hgNsA8TVC2NGNf5ZWU+0Yh1+CBOI38rQAapSb02bllqcMFMtfoC4GOEhJPB7gaDJdzXZ+kAL/LquiYdLpqdp0960gG2m46OoBl2kk4/yNc1Z4YNNxb4YxEXUJy2/GfC41VzoU7GZb85YwhWMqCjfhU5hXesf++kcoyuHllTViyAMHvsT+jlq5LWNrPS/c2xsRV0+/+K/UIFU8ZGIPEc3QvZ7ZTIK5fzxN4JHv6Ckr7um11omDnzkAKF+oq6ShlA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1778614521; bh=o3AcOD+BrbCA2yggyuVC2QuoF3UdG2ECXOPU931bXDb=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=fYfXgN/cjArsMKLLT+X+bwWOo2oDyiAJ0Ro43fLvzVv0V7fwBiC2T7sySoIhl8cF7jvwcmTOgry2DaAWKj4qpYa4qSp391Q4+UvN6ZRFM2bthGUaMYFurzciTZ6fkeO35q14mahZQSsmFCkNd5XJv6K/WKBNNbHZKWkbWbMBS0NkEggZbbAV+TpZ6186nNCvc6/tVtAwGmWdhPHkJfUysn4fKXP9o3gXGlQ0dOuAJPnCttLuoBA9KUY/qPn5LmNuR8n1519AWtaEGE5eRQP+vy3SQMi+pA3pus4l+4NcezEr8eBWIPKIXEyY8pyeZyZrDBUskzJlv430Ix4o8mTvAQ==
X-YMail-OSG: X.CrbtAVM1mUAjHb3jLr3uyrvIZSmFH6sb6LjhxagKZ6BPgEKJlrx5P35TydIL1
 L91eixhLbnUc5dbRvFu6Xw6emXLAcy5aOwBYYC3oA2Siyg_2FwzSP3Gi3qdls4pjXhBco_lYZs.d
 3_928DW_9O2MpEjRnaKCJZM.y04kcOysjufjhJvuTip4Rr_qSy65lz6CPJlw6nPz1o2Fpp.GX82w
 bZubZfH6LnjLFKMGIh1QMtSKNvUnXjhhqJSY7vlprwOiL5NfupwDB0FKxiAAKhnRKFBCjQHvpgnw
 wd5p71a5I0YzIHFZ_GBAZNpQt5_hfmOIsTl2FOLFmNJwsTqkQbe60flmty8648uJFWCK8u51lY6k
 q2EcspQ0zF26cDgWGqSMUZXEfZ_gCLVO0Yvt7a_cTCNVTpmIiBhw8pNIiUe2LXFgL5xwGfmZKtq9
 P17d4LGczpKJ83AxT.gIgYO_l4VwXCsv9NpuhTz0k.7561DnYcgGnB4OkeM_Z1VrySOeaKNItfcT
 _qlivtup.rUh0kqK629kelFY5oiezkMHBkDtWSp9fDmAPOmndQ.gFPRblskS3DsRifnz2h_l6B.4
 WtnS2h48DcJR8egE2WiE_peUc.JHjbC2nWCHVaAfCjYNjkEQsi0BIVrBYu8c6YOL8gAgMTT5pqew
 oEi85ngyCQlC_ehNgQAruiaSDxgLwRTD5dAips639sGur6S5tjkFkTbc4eNK4ROc8EFFxoFt9TZu
 AaWIsy58ctfGnCkJGwWQ6Ka703wq7.8qIBfOFQb4UrW.679dvlYzzxA8OcRVR4M2g44OTg.uctxR
 o_sGBsEbZIfkcOysJjQ5iyyCIXT7VxS4GlSDNl4Sij__QnVnByZycfCv1X.8cd06E7QXx.0bfbnR
 NaQXqPL58V5mS.EiGGBo1l3zqfKxpF2Zg__P03BMcy0rvxkehCZ98_PjR4EKBCrLLlLstAhL0xnM
 GUrRUbNuTGDXee5v96ty9798mN.wQ0BChvFeeC3RxRRrS9PPGeg0E6_wb1qn29DPxs6vhpmUMMx5
 RUhjrv0nd88.OoWwMBorCVPlmrJ3XhnB9VsG5fMVqqllBt8muLAnkSmiF5JHruHrmXx7nVfA5FxQ
 fvtCp.a8xWyOO94kSxtSSRwzNZke0P_lktiTeZ7Fp636jGpjRokByagAZRtfFKqZ.BZHrJ6IPElL
 xuV4c16GWlCykMQl4fqOrKIFX0CL_rtD0RuEZmQlVwaQhEM18pSloaljiUSM6OT3gorLXunyRoJp
 tPUyxIAzkV0vTdFOUpFfQ6dg8wKKpXxhasUXhftdOlmXISYLTutSz_CzevhLar8EM_YeN8CQXHba
 bvx6rTeSpsJ9NTenHcYR0TY3OmxZmNdR9u7R.XxoNRsxjForDD4lHgM2EyHpaZI2iwIgZpMLemuI
 JCJ3gTw86EIAX0PSH7gqfJ5DIypH.WNuyU4e3BS3c8OF5uN.TSz0yn5ZXWC_.hFC1c6LIKrdQ1Wy
 X4co8m0aaNtn7gg4XJdeJGMegpyp0_utNVN_1TFz1HBq07ppO7Nr4AV0Z_ezke259s.nZuHuLX4w
 Q3tPN6tzirCEKgBexQcEmby_q8GDj3FwfMs4XniICxmpClIEXGC0eX6hgfr5tbw1HuS15cuu8mVT
 UJKVLCBvec9ri13ZYlvl9NDlk7ng463xJhBImsvflcHqx10gG846cGXwzbgmSNnIVSENqlwTmLwz
 vy7wAODD.jppbZAtBPX1oBhJUH7oXK._0xTEtmvGrSO38cx5WA4YqmcNc3Mefc3zTGVJmukmHgpj
 Ohl0Ie4F0PALVnZvh_9ck2U5weYqmEVQ1Z3kde5pqx1b8.oLkdfq2HHaUZNFVX.eRKvcU0Suyh_I
 sIBULy1.2JQsewnmxvI39T4FkkGIGIQoyVcH6NojE0CrfPn0u1jQx3yo80jEBC7nw2ChSCBU2Wlu
 x8dloCIYKPGnxJI7bQeuS_QpR0VfhE9VlmVAYE53rdJt76CNO5MJQk5MPhmifjmwZ5BwYLAyI8tl
 tTjLIzpEnRGDh1nXkVb0HmX52fFR3amNLbThaOQCcCFd6hgKzqt8INCyShAPyvzaAWRrpbuTpRG5
 v.2Rirh6vGeEG0B4I8n84xHuvDpaKrSiO2J5kVEkOEDM1tvZlVemIac4k22HI4rcfKxh5FwRqyd.
 d4BxczUi7UXeAf_F_ifMEK.T6.jSBMUQlH09TJ9FGd7NffBwCXdb_pC9H_d0KCY3PTvVYniBi27i
 s.Hb3e1c3XI5m2qcniaTw4KSJriBYO.QVF.8Daqhs0hvsbnuwNZPj_5de1JwFyt9n_rvQbQoZaJL
 BULom0_DR3pq4zsjicxBFY7igFp0LLyektf2kYTNqtNok
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 8d6d1f8e-33ce-4714-b4d0-ede039141a79
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 12 May 2026 19:35:21 +0000
Received: by hermes--production-ir2-89844b765-bdgnn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4dd80eb2b435a56120c49aad29270489;
          Tue, 12 May 2026 19:35:18 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 12 May 2026 21:35:15 +0200
Subject: [PATCH v4] staging: media: atomisp: remove stale "Generated code"
 comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-atomisp-remove-generated-comment-v4-1-4095ab7e2c14@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dkxbEMGV9zAsShlgjG1JWxsJ4
 e4CnsDlS17++wsL6AkDu2UL85gokLMbFKeM6VHZAYG6jZnksuQXIUFFZyhM4NG4hDCgRa8idqC
 dMWgj8L6shex0pduKbTOTx54+R+LR/Di82yfquO/uxkghOj8fH1K+e3/kUg4C6mudcyxQaFXdZ
 zU6d55erFnX9QuRrJYl4QAAAA==
X-Change-ID: 20260512-atomisp-remove-generated-comment-0f6912dc8cb8
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614517; l=3940;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=SWcprvJI19SCcP7aeYTJ3NgcYp2vxGmrTPZCl7ZBcYE=;
 b=tT12TQcSEVICjrlPkjrAVrp1L5v2MzL3nIRAQ5ojo9ioDLKeOQzD0reBUGi4b6R7+LXKB0FHl
 nX0m7zyUhwsA1w48/rTwmmuv+VKxNyTLKA1jc556qFRm46yFvtLRA8l
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260512-atomisp-remove-generated-comment-v4-1-4095ab7e2c14.ref@yahoo.pl>
X-Rspamd-Queue-Id: D5C5B528C0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,intel.com,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-61319-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,intel.com:email]
X-Rspamd-Action: no action

Remove the "Generated code: do not edit or commmit." comments and
the resulting double blank lines from five files. This code is coupled
with legacy firmware and will never be re-generated, so the comment
is misleading and should be dropped entirely rather than having its
typo fixed.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v4:
- Fix Suggested-by tag attribution (Andy Shevchenko, not Dan Carpenter)
- Add Reviewed-by from Andy Shevchenko
- Link to v3: https://patch.msgid.link/20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl
---
 drivers/staging/media/atomisp/pci/ia_css_isp_configs.c | 2 --
 drivers/staging/media/atomisp/pci/ia_css_isp_params.c  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_params.h  | 2 --
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_states.h  | 1 -
 5 files changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..c33d963d9069 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -4,8 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
-
 #define IA_CSS_INCLUDE_CONFIGURATIONS
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_configs.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
index 1cd3322b0da0..96af15f62060 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
@@ -48,7 +48,6 @@
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
 #include "isp/kernels/bnlm/ia_css_bnlm.host.h"
 #include "isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h"
-/* Generated code: do not edit or commmit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_params.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
index a542f8979905..40ef6e35c30d 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -4,8 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
-
 #ifndef _IA_CSS_ISP_PARAM_H
 #define _IA_CSS_ISP_PARAM_H
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index af1765040464..1ea71477e774 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -3,7 +3,6 @@
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
  */
-/* Generated code: do not edit or commmit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_states.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
index d637ea1d13f6..5bd1d4ae1fe4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
@@ -15,7 +15,6 @@
 #include "isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h"
 #include "isp/kernels/dpc2/ia_css_dpc2.host.h"
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
-/* Generated code: do not edit or commmit. */
 
 #ifndef _IA_CSS_ISP_STATE_H
 #define _IA_CSS_ISP_STATE_H

---
base-commit: 6abf0b2df0b1c2205a4c0591425e6461afa62edb
change-id: 20260512-atomisp-remove-generated-comment-0f6912dc8cb8

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


