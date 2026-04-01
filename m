Return-Path: <linux-media+bounces-57901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJVvHfduzWnvdQYAu9opvQ
	(envelope-from <linux-media+bounces-57901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:16:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244737FBDA
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A71793020665
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 19:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFAF4611D7;
	Wed,  1 Apr 2026 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPs+WcT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A041939FCC5
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070902; cv=none; b=hMH57eOcR4xfz5wB9VDjGQFoE+cEenu8JHcjTpwQSqlAJQh0uf7yLGVTcnnDdj9l7bkHnIslOvMEHD8y1JZRSvDuoW05OUeDGfz4IuwOMFx6x4Jqjt2wVvS6wMqbKstsYvZta9gX5BoZBzPmMS4nfy3NnDoCjr2UislHTP2ySA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070902; c=relaxed/simple;
	bh=aOQvwFmNxOkcH3hY6TC/0qXbXfPYEsiczqDbdm09a6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVAaXhrW7c1cmfDG31PjD4WKkaW0D0PGFxGeX6B1cNhncgBQ7MXwWykEinqJzyVnPJIJbwD8GyCg05clgoTKKeNu0nrVauQr88F2AttDvtr/Qpcv9FX+kKcNX6Kt9lCT6kq1ZU9DqQumEmioA2E9b1U0dphyVflljymcVK7Z8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPs+WcT3; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so171051e87.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070899; x=1775675699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=SPs+WcT3v/bRdlDxN9A7VdqtjQsZhAcnCa/O3aU8I2KGNozjUJ9Owk3Dpld1ZfOnNp
         JvoSf5Vmyr7j2sFW3vxoHUC+O2lW4YQ+uOfEcrmT8ooEfakJRg6kZftc+MMOHA08oKDO
         rBTKUZx25xcSnD7PB/ykliWflY8/3CzUl46w6QKWVKrLyyrh8uef+JHV9QcGbMnRAT5W
         j5xs7WRu2L+4ArZOLIyGC0EWcusNV4uBPZJ9YKXVy1gjzcR9Kq8tuQrSCyRE5W0N5Kgw
         1syeEsRPfwH41exSB64u8BOYJqyy2Ed/46eQzNTiT9+gxvHIF/GWAusWBLzkxasGGjDN
         LaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070899; x=1775675699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=dO4yAIyBgD9+nks5Icl+Pp49bZfTU3+Pokp2FXTrH3oDGAK8y6uyas0VCBMThq2NlD
         22rZ0qSQx8nv0kblV4FxvYi6G722zKd+mlh/LyS2Ft9Lgup3U7fzE6r0aJYqgBXT5/tP
         7tcVxjY3e3fIGKVbe4trKyb6NX8XHAfMwyFXQtgj5pHax416F1dc0MvVEgHlBXm3obqm
         zrQRLn6QvwDQs2p1hijLVt/xt5BQJxrXFsJV9E2FY5C8YWekXYkaHxLYXzSS3fgMlb5V
         DBzsnXfvJnxgn3zbKFuTVl7dq800v569UPnKl/Tyh0C4cXxSEboBoXOXmzxI16Y8gkar
         Po1A==
X-Forwarded-Encrypted: i=1; AJvYcCVosCe438Fp1QpD0QDer2nZwiUVTlhuRPgXP5sFBfx+GlKN20TolXw9eQ0IlXmDg/ouWrRueRxy+J71QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsilaHzsX2zke0c6ovKxvVtBuve1FfbRuI+lFEaRdWID8qfuV
	FK1faptXfLSg2XfthFA7oMyAxDEuNadU2IhyMDofT4MvCyIyAZR0SNWf
X-Gm-Gg: ATEYQzxdXgDOBZ1VoAGrqFH3QA1Z6xmbnAEKg3JSBVAqyFXulZYJKug03KqDilAf5QZ
	gpL7dtvRlRSK0kR4RxPHIjEuCwzF6lR7a5sbx3stOlOT6sAt+ZCOUrtp6wDkY0nJWMVLLK+IU7u
	lEzQhSVVp6/MUAerGhPHLmZNm22Se1J0kHzPgmPPyfTPo7hO0blgz44lufM2zKkPx3THxswvy0u
	aKIveBERPwdollXZKvfmttglxrUg/egD9vz2Y+zVeaYrFISrvjv9q0HPHIuSLOpZ+eSPoXwXp2D
	R7CddrWwgAMKgm10YlXSC5SUzkMzwSp5bEJu9+KV9GmJ8ld84APd+L1WiP/SSqbqVg9/d/R4mDe
	xszDtSOVs8snOeVfvz/SvWbFaJSVZJMR2+GR10FZyzQ8Yg+UvsIUGfpdYdOEEZNRb5vX/rYbB2o
	O35Ib5GbOV+EEhilf/BuIUmk/8VQ==
X-Received: by 2002:a05:6512:3b87:b0:5a2:78fa:2700 with SMTP id 2adb3069b0e04-5a2c1f3c4d5mr1943599e87.23.1775070898394;
        Wed, 01 Apr 2026 12:14:58 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:14:57 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Date: Wed,  1 Apr 2026 22:14:40 +0300
Message-ID: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57901-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sholland.org:email]
X-Rspamd-Queue-Id: 8244737FBDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e2..1d2130f35fffc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
 err_m2m_release:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_free:
+	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
-- 
2.51.0


