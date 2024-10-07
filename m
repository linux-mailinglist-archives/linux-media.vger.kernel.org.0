Return-Path: <linux-media+bounces-19150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC15992BE4
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 14:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0981C22033
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 12:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4FE1D2B2F;
	Mon,  7 Oct 2024 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8gZ398J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D41E519;
	Mon,  7 Oct 2024 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304707; cv=none; b=OAGsqms9z2/n/syuy4TEkrFnXp5YzGpTE0nio69ZioZLpFYho49lrzrFFz/IhSECLWrX2siqie5yAgeYOvEwfkSstwHnjWzeUwdpDVLSzlTScZbJqo6fBvXk/AI+0XavP6A9JzU6IdyPc3Mkuhp94rFZtq+XgDA415vQI4OafqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304707; c=relaxed/simple;
	bh=odAPpBT/zYedTl3X7UH5eVT95wTIKt/IubVvFrMiNPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hB8hexEGpVuaKu/FWtCd/CNAI1xsVWansEbqzqd79C8VIB67vngAI0UrUYVsqk2sVU2vmb2p40MTSjzUTyIfuJT5iRwZQdbi1O+Jpi90muG/ES4e9Oe7ITk49NstO+oNbk7aTYgkDlJ5YF738MXmiDt5pGXTpF24V8pb/KYm1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8gZ398J; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so38673151fa.2;
        Mon, 07 Oct 2024 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728304704; x=1728909504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4N4WRwWKnBCjI4J9wKZ7MwHF7s+GuSiaI5NgEKRFt8=;
        b=e8gZ398J0naskfY1XtWkHxuIonUIaxxQiR8xqDdIecVEhFsas6rnpmrMxU4U2DB5k4
         WNmKrKmBLPCE0bT8obZkL28xcgfidtIrXlC0V/qatQcb6s2ls3wBFb/dlcR2uh6+scnj
         vqZ48Z94RDzA3MUkpiHBxQLEGCdgZGkgN6LXCfwy6IjvPpePSEMYxJeAerScc40YS408
         VE81PteS/3kAguuwoPui60YiP0i3PYc9/EQYOUVPpSvUtFwLX1EoGgAj7kZ+5QGoHksa
         zno7R1weco0KQ2hu68+LUI5+I/9a23711A2afjw2TQOK+EAYIzmAmDlMAxEIj6yc77KX
         uHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304704; x=1728909504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4N4WRwWKnBCjI4J9wKZ7MwHF7s+GuSiaI5NgEKRFt8=;
        b=VDBhT6zz0nxBSvWInVH+xT1PgYrFR4kpHWnUo/bhBaThlFre24MWmA3ftUFayiCHNH
         kJ0LLiN799N7wWdOQjn6Y4z+PtTJ1EXvi589TzBd6TaVA0uBO722GqMcY+P6QQsIyrcX
         G2zIOfHR4UsVkgryT5fX+bwnGdVnEIVX75stx2XxFdP0QHl1tD00wwBh9m6hPF+9YFMF
         D8mt4SWQF2E1vqwOR3k92Q2zxSQ+akPygZ4ccACM+4qo6SdXzkXUC/uZ5w3tnlnZvucH
         wMSTREI5RyzUxNvhjADdJHTTMbgKEO0frcaIkGOV3xBOUUi6HnVjnyW9FU179Z4sS1mn
         FAyw==
X-Forwarded-Encrypted: i=1; AJvYcCVaGGcOovkGuNs+0Dirrg0ALCR6sKnR18bfZ6DUJSxHfQy+BTHaA6UtVXNA44TXFmKxXH/NX1aOj9ezQM0=@vger.kernel.org, AJvYcCWBxAJ8X+7tOs8iELG24eetI5V6vJkaracXPErPYuipc7Ectynxg77gPNbolUngFcJoJAibtyi3lTSx7kvlUpXvcSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DNj2EYeptDyCCCy3R0H/v0Fn6tORhhQaC5A1RXbkCchoM7Jt
	DrBEwrFH92G7lt8hhxVsnGbfqJ4d19rDGkLjojOqknYvG0+0/HU+MOiiBQ==
X-Google-Smtp-Source: AGHT+IEJw8zFkm6MmMyZHv/FNQY64b9MViKfx6FjnuRizVpR3z3M6sT9SzV6/x+wDGcXGET87hh57w==
X-Received: by 2002:a05:651c:2210:b0:2f4:5d9:e8e3 with SMTP id 38308e7fff4ca-2faf3c14096mr61429301fa.7.1728304703395;
        Mon, 07 Oct 2024 05:38:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05ac2casm3153143a12.34.2024.10.07.05.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:38:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_frame_desc()
Date: Mon,  7 Oct 2024 13:38:09 +0100
Message-ID: <20241007123809.89281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `get_frame_desc()` operation should always be called on a source pad,
which is indicated by the `MEDIA_PAD_FL_SOURCE` flag. This patch adds a
check in `call_get_frame_desc()` to ensure that the `MEDIA_PAD_FL_SOURCE`
flag is set for the pad before invoking `get_frame_desc()`. If the pad is
not a source pad, the function will return an `-EOPNOTSUPP` error,
signaling that the operation is not supported on non-source pads.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Added a check for CONFIG_MEDIA_CONTROLLER, as the `entity` member in 
  `struct v4l2_subdev` is only available when CONFIG_MEDIA_CONTROLLER
  is enabled.
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index de9ac67574bb..446fbc3805c7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -325,6 +325,11 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	unsigned int i;
 	int ret;
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
+		return -EOPNOTSUPP;
+#endif
+
 	memset(fd, 0, sizeof(*fd));
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
-- 
2.43.0


