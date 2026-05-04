Return-Path: <linux-media+bounces-60238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA+aNQFD+Gn9rwIAu9opvQ
	(envelope-from <linux-media+bounces-60238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:56:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCA4B910A
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80B323014C5C
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACE52EAD1B;
	Mon,  4 May 2026 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gGMygKS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01EA2D8773
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877657; cv=none; b=BnjFC5wS0vEh8DZR2VFxCD4hsb0Y7wNahaqdnG69kQp1+dBuqNidgSYYV7HYb/64YXusfQJ80UxRx6xsBk6JRaeaauUU30dSp6It2hHWrGU/6ATHz/uolA2OEdzE1k52bd20pgn2oT91NK2Jolq/pjHmm1Ivkl5U9HjZ6NuBKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877657; c=relaxed/simple;
	bh=1ZSaYK9KkfV5+GCoFqf+X0v1Q+Y+dHjA70Bg+RMm57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fk3p/fw4y5XVjg6QJeGsvZOjaAoguoLfOtXhEHzvVLFbGbotgJTD29Zt2Qtp2k+rfr185mpFA8y8af421UqOir+j6VSGE6ZmK5QF2z+brX4xGKJaGwOdQw6O7H3as912d8BOD30j6QWO47xKZiPbWJ7/GkrMWUvIiw6xG1I6a8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gGMygKS2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a865d1547aso1575140e87.1
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877654; x=1778482454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=gGMygKS2gl8mmkhLk85E2YT7VK5WTLCxGOA2AL+AXsq61/VKUogY0IoZAuUxQZwU6b
         WKy9wL0E9RpimII2qNCFsKARw6IMJ6SkiGjFTMi4YN+4PSdpPYDNDVHcMUOhyR3DVKmB
         5fYd0zEQxZmP/EY+IdT9ITvuFtW9QekhD8Deo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877654; x=1778482454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=AL02P9+AVsEW6xo1Gm9obZFterxe2YRR8AGpP4d9/3tGh8bAi1cpSmPhF/Zqqddqf0
         MEvXoaGSTV+sTMT5PWOZzisOJ5YvFy+zlSuG6vQ/x6YpGJ4mBAX2pn1/CCM2cMLK6KWA
         MNSiggyzMN3DRvMwSq/CiWVD0Tla0dzZPd8M3xWva0pkqxu1XNg29d3wYP8+GUd6iuEK
         XXkJXNJEb2py7m7nz+0qA5BLbR3Sq9/+0uXZ6s9dAT+Yu5KUMZmDBvbC3kniGf0OUCOg
         kLVCFiq55A/Q0rFBjiA/3/Iub8e5uD1jEuqSdSUBRixHWQF5/+vcx7zZquH9NFkAqPk6
         +dHw==
X-Gm-Message-State: AOJu0YyOO0BAivHPLTVV2C+H8I44Tg5HCmLfS3JqhaAE6rfViM/lAfj+
	Ksqt8fcP2pv+QngH1/MIXcioa3yktAQd8238TfiX+sDTulqaW93uIcVh3rGal+yRTQ==
X-Gm-Gg: AeBDieubvSL/8AnjDNaelwqLjjX+NXRs1fXDyLHAx/jvp2TZpN8OS2jlI9hM+uKT/kq
	7GQYfSwwGHGB5uP41djsBgcJN5LcAnVRI0E+f5WZyjOS7gCumuFNNP6QAIoqtuLcDwqyGrFpjen
	iIbrEKfYw2R9ec8uuEPHQ/jt4x7VTRcnGq5K0w/8ZCeWDfScWBzgjYrB6BDBA6UnqxGFwE4m54w
	kSUS0/y8ztnoyMRFRgeJscvTDhlscVb+J8NiuJlm2tXYvpi6Jyg2N83oB7jBEydJlFGGjNqFsr9
	TXBkAz+wkEXya7NInmKovRTC1ExD1W2PUM/M3l4c3VulH4MOejyOa95YrUVUZ5MsHDygqkEx38t
	kK5l8nV7T2t/gCw6Sd3Bn14tFoWJQJpCuqIl3E1qd1PshuRMVOjHDbX1cTqUNLeQ6AC6eKSIACX
	9LvGEbOr6kM5DQb8wORm1/eK83vLGAchFGcPfIrMqT12obVFZB7R05ErGU6MAHhWyZhMEhQsY3H
	2C3KhJO3YhqNpYsZg==
X-Received: by 2002:a05:6512:3e18:b0:5a4:299:285b with SMTP id 2adb3069b0e04-5a8621509dbmr2250062e87.12.1777877653936;
        Sun, 03 May 2026 23:54:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:06 +0000
Subject: [PATCH v3 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-3-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 50CCA4B910A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60238-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following false positive smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..ae75982fb514 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
 
 	state->source_pad = state->info->num_dv_ports
 			  + (state->info->has_afe ? 2 : 0);
+	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
+		err = -EINVAL;
+		v4l2_err(sd, "invalid chip info\n");
+		goto err_i2c;
+	}
+
 	for (i = 0; i < state->source_pad; ++i)
 		state->pads[i].flags = MEDIA_PAD_FL_SINK;
 	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;

-- 
2.54.0.545.g6539524ca2-goog


