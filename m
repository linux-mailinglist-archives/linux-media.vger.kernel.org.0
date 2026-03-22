Return-Path: <linux-media+bounces-56627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LwiGf6Uv2nq6QMAu9opvQ
	(envelope-from <linux-media+bounces-56627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 08:06:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B55882E8757
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 08:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C9A93013A54
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 07:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CE334A76F;
	Sun, 22 Mar 2026 07:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bW3Fjsoh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0106E2C11FD
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163186; cv=none; b=FewL+UaT8JQpdw9XlQfYJkRdetlCdzxtZog97H3kZe9GNKetV2M+doE7JszvJMmf3bA5QXhMSdtgt+vhaGe5w7RPsTa/n1Lsq/UoUanIkTYGeutGO5k5doQRP9W4Q9fvEfOOf1J0ztaO6PYLtgBGoUShWjsFk3fZu9Y8oeN/6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163186; c=relaxed/simple;
	bh=kL4O5B+ynNZ2gkdeDFcZBX6xhj7D655y8QcoId7ibzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUnKYRVutx0LY0+e/eUE7bPZ6hQ0CY85xaN3CdxhtmKdHHmXGqn4bug25Jn3m+MFCwlADB3I2bXa3enjiksbr5iIzD6Tdf/EgccbYvKhrSfNsDSrZ/GMndPdVRejhn9wKFVPXEjX76M0vDd2oaumrl0AQjlJQlc1RgZYp0GORGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bW3Fjsoh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35ba2ae4df3so1329051a91.2
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774163184; x=1774767984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSC7ropIK/vP88asTdrbl36/LNFhuDhnabpvB85e4WY=;
        b=bW3FjsohmGG/C0TDzMyH2ioaoFGOD7QqhAdm9KINgZuTAcIfZxk5kqrFhwyaycHXWT
         Dud9Ml9IXMYJZALc/AbkSJyVHp+7hb0vCOJl+l+7Q4nV5Wa2e4+TJGqleg1afMMDNPKR
         pTKiqEWU52x58aEqh+3TDmWxSN0mHMO0qRVhvJOF+HlNYbYwQf/5cTOZ6JNIwiJQ99HI
         SeHUEiAUuyz4oXOu1hhtXYgLUKh00JxRvlquJpHTj7U4XvvPEdCBunWmvFWwCT5/P3EO
         zCO9OjXc1cNv1yeQydtP3bvj1SneR4vMZ4vS4baMEJXYdf9PfI/gVdaMvlsCWGpvJFul
         XH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774163184; x=1774767984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSC7ropIK/vP88asTdrbl36/LNFhuDhnabpvB85e4WY=;
        b=XEOH/ULoBXRBcgWUdjoh0BW49B9uXYhVPJNDRKEGTSdXI/iMDXrRUIHFppHbcOIwjN
         BnifCUjft8SUMLjrVJgp0a/rVNt3laHutyZ6jlu1XcbknyqnyQIlpm+ZJcsOxMkctmEl
         Q1DLRU6/TYP5IHHHfh3s4gc0gvPq/6RE5OJe1+V/BYBWmRqLaxQput3t2rUrju0R56GO
         k07dPKo8TmYU9Q4wfN+xhaWTNA13D8y9LQI92w9dddkPqSikgnzpSd0xBnQURjH4+RBQ
         egiyU+3dEA1pJM8tmXb3VAY9xbUZNl5l2D4EVnDg2+JsDjqmNj+Vqd8abQEhscC7u4Os
         fPnw==
X-Forwarded-Encrypted: i=1; AJvYcCXHsrZOjEZPaBXEkkrn7ybYGeTzW4Qoye8ocQzwfo0jb4BCq/fAruQdCLFf6NiRhvWYZY0ffo+0uc8rqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5gjhCOOXkJ2OuL9UTViJf/TjsM4FZ8TZ0FYnnO328KSecVx3
	ROAbuZ7aYNKmMZHZ8jT0YWq2KQx3QvbinZrIiTTVb6H4y9CyL5AYBY06
X-Gm-Gg: ATEYQzxqZq0S3qKu+misFXPlplTQiodw2EUgVIRAUFDfp0RXli7/1uesd4zWEhQ+FHc
	3KuIUeaMYm+IrbhJg3tc9ygfYr/Mn85mpKt6hPUjMeP1dLWnVxZkTZ68wDsC3VjHrPKBWPCblrx
	mqmaO/tXXZ8jAmfAmLdNIlLG3oAOiNe2faQgNRKpwQ2w3GVq4W5ljj51dwwet3RKiaCn3rcUNTF
	b2rRha/mPGXvmgomIi5Q9o81H58w3B+KgpO3TAhQEjucHCh8HyspojVO6oDXbzMF5RTYoFAjzAb
	ujP8E5HUTm4tLQk4E4NK2GJccIZRHtBl/fl4aqJL5E8DW6tQBWXr0+yex8uiaDRpcw5JuAmdBnC
	TU/l4gGKSFNjC2ljd/IfO93B2G3FB3rkYbZxK685Y7QgEa4CxHsZHR91YnkAqHSxW1P8jcs0QdE
	hwlxYjCL4Ntv+p1wYSYLfcx3If/Sa6EXyPNUTWzFYPP1muONzhagOdXsTm1q4PXw==
X-Received: by 2002:a17:90b:35d0:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35bd2c69ef3mr8011764a91.15.1774163184289;
        Sun, 22 Mar 2026 00:06:24 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([60.243.255.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff7090sm9471192a91.3.2026.03.22.00.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 00:06:23 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: abinashsinghlalotra@gmail.com
Cc: d-gole@ti.com,
	daniel.baluta@nxp.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	m-chawdhry@ti.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	simona.toaca@nxp.com
Subject: [PATCH v2] staging: media: atomisp: replace uint32_t with u32
Date: Sun, 22 Mar 2026 12:36:14 +0530
Message-ID: <20260322070614.8419-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321184224.36322-1-abinashsinghlalotra@gmail.com>
References: <20260321184224.36322-1-abinashsinghlalotra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-56627-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[abinashsinghlalotra@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: B55882E8757
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace usage of uint32_t with u32 to comply with kernel coding
style guidelines.

Reported by checkpatch.pl.
CHECK: Prefer kernel type 'u32' over 'uint32_t'

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---

v2:
- Fix subject prefix to include 'media'

Similar cleanup done in:
d6e1f701c61f ("staging: gpib: tnt4882: u8 over uint8_t")

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings




 .../staging/media/atomisp/pci/atomisp_subdev.c | 18 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_subdev.h | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..ff9f08cbf73b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -180,8 +180,8 @@ static int isp_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
-				    uint32_t target)
+static int isp_subdev_validate_rect(struct v4l2_subdev *sd, u32 pad,
+				    u32 target)
 {
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK:
@@ -203,8 +203,8 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target)
+	u32 which, u32 pad,
+	u32 target)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -229,8 +229,8 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad)
+			 struct v4l2_subdev_state *sd_state, u32 which,
+			 u32 pad)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -242,7 +242,7 @@ struct v4l2_mbus_framefmt
 
 static void isp_get_fmt_rect(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     struct v4l2_mbus_framefmt **ffmt,
 			     struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 			     struct v4l2_rect *comp[ATOMISP_SUBDEV_PADS_NUM])
@@ -291,7 +291,7 @@ static const char *atomisp_pad_str(unsigned int pad)
 
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
+				 u32 which, u32 pad, u32 target,
 				 u32 flags, struct v4l2_rect *r)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
@@ -467,7 +467,7 @@ static int isp_subdev_set_selection(struct v4l2_subdev *sd,
 
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e1d0168cb91d..b12bb65be3f2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -315,20 +315,20 @@ bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 /* Get pointer to appropriate format */
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad);
+			 struct v4l2_subdev_state *sd_state, u32 which,
+			 u32 pad);
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target);
+	u32 which, u32 pad,
+	u32 target);
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
+				 u32 which, u32 pad, u32 target,
 				 u32 flags, struct v4l2_rect *r);
 /* Actually set the format */
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt);
 
 void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
-- 
2.43.0


