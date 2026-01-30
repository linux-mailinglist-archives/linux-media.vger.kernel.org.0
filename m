Return-Path: <linux-media+bounces-51839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GPnGpCpfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:52:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D9BABBD
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DD8C301B42B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F583876A4;
	Fri, 30 Jan 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJSIV50Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CBB3859C6
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777414; cv=none; b=daDwKaIwv3oNNAhktfshqQLIrVRmoQuiqp9flILB7ZUi9D/XmhOuKAacdj/jsqSXRa43jYgWOJU5v6lP1uNtwus2ErfB26KpgRGo4O2/H+u3UhxdOy7njutNIrU1ACQaglNjRrIFiRK9P5JJbucz2KqhUxINYMDWQaVFI8TTO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777414; c=relaxed/simple;
	bh=1gog1afMORIsIGPfEuVIVFQI1bsAxNOV2bdjIS1D/tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFAebFRmQdIZH9hZOExxtaINnchDEETFlsgY40LfMnQnZd53ycSIZf0m3URcUKPuJMj/zSB0UCq86elPH1l8pyNMFirSl2v4xRxsaLaRwvntLyCcrf1n14NR5Ml9xfku49JHDK1+3ZWTTc7klAnt25Xf/aKqMlLgl8zsv/HTKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJSIV50Y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so23434585e9.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777410; x=1770382210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=nJSIV50YbkuFpXi+g+3OXtnq2hPRyfSERimjnpur2xcfIISwt08vGgIkBjD7ofwkdr
         u9u1Ijz9WQF8M7w0n9d+YA2OQqOIX/HnFW7v5LBwbYyqOH+A+PfgK3cuEA4+kDYFUHj9
         loHZW2v0YmuhI/bFIZ0uC0P9Nh4ZkbGzqiVO50C3ZG6iXRcndkoHnVHY17dWW0/hZ32y
         +ko3oxLmgvCYaGrFXdip7mSRgcMFl082BoLTW6khbE8aX1+54M39VvSULTntUdELfTga
         4E2XbjgVgDPI0Ar4khzRpq17AfJBIY48X+GK9LWj3PzCopqY/sth9TDWpBAiLoEGY+9n
         O4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777410; x=1770382210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=CONFireWy6D8L6DPoW7LdXZVZBa/8YtWU0tbsRC/6P5EXIjbmU7Uw431Uv9I1s3Ymf
         KUYPV9i+B0XBNKAnypu3J0EhSd0UxY5f7WxVoOKrvpNk0PCua7wASwzNIvpleXD55iCA
         LLnS2mSWfLMLmOrb7zMxIYFgFviXqRNspuD0fc4HMLFqw5v/l5H1+aiH8kB1b7/2k2MO
         49DUW61rRQJ2dZiGW8ccX19Ex4aV6oRq7eKCJsAFkUyuL1qG/GYp15fgT3h9o7gqTitU
         YgnPrMvmCBWW+MbI7M7tgSwQNy8JKsydU1Lv8mJQZOSb7C3pTzeHranMvl3s/pLqHBGW
         aW1g==
X-Forwarded-Encrypted: i=1; AJvYcCVWdrGJtwV7fBpB1n3SWKRBfZ9toF2a6mIu07LGlAt40I2f3oRt3L75JrwCYJfZ+M+vmsMklTmLM2GgwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMU13cXCrCK6cvz3JhnEFO9uer2H8XcHWeL37RWIfXr9cxkNhN
	mc6P78E/YNp7doJdJsUSedSm6sH5ELrjLxmKlqOYCRg/dOw9YU4Fegtr
X-Gm-Gg: AZuq6aL3KPgOws7EQz6KIyovWpUSU03UEKXTp/wMyOUcrOZIARokZTiVL25aq6+ouCg
	KfTwN1UNzucs4Fk+oFlO+bFVIzE2PJede1zk9u9KXFlWXkujtVQsHwhQeHJC2U7TmO96n/1AFk8
	+/Jv13m2ecQ3ENGE1hrD7hvkwEtd642MQB4OiLAI94isfEcAOTZRDiZwN+5Ei3TRsGPryUHyndg
	lksks5wRk0ttGw5j/smaVNNEP93Zt8S4jZcjeeybUymqgIWfMEPiNaW4inVUNxYZ9rquWbsvkN3
	gPihs06I6BASugZwWX+NvrvuY9uCnNgqx/ZiGHgVRJPMQ1vL1hPWpRX5mVPMI1JpvibGc7pTqD0
	q1UFUZhcldOS/gKWprqQCSssM7JT31l0cGlo6KbezRaSHXAilxGvYzsn1ATeQlypuvXUMIH8SaX
	msEdMGGBJggZM=
X-Received: by 2002:a05:600c:a4c:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-482db45770cmr35972115e9.6.1769777409790;
        Fri, 30 Jan 2026 04:50:09 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 14/15] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Fri, 30 Jan 2026 14:49:31 +0200
Message-ID: <20260130124932.351328-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51839-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B9D9BABBD
X-Rspamd-Action: no action

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0


