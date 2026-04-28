Return-Path: <linux-media+bounces-59843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLWWONqr8GnOWwEAu9opvQ
	(envelope-from <linux-media+bounces-59843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:45:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784B4850A5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53BD930A6012
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655AF43D503;
	Tue, 28 Apr 2026 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bMygC0oT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773A43C051
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380090; cv=none; b=b694S78TjvyGazZYCb34I7EIxD28QY+dTtRgiBLppW+F1Hvgf6VMGO3kL7MEUPmtwLfC9pD0e5+T6fTpu+ntHqo8SUKhtc/Zhaj8aH3GKoZahw3Ovw5WTfXqOyL8iafLxUIdGvxjVrsgAICI6X2HWpBW0MewT8N1MX4eJQmPwNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380090; c=relaxed/simple;
	bh=pRgYAG7i71lCsBAZBdT5Yr8NlqJWs3vM/Vy7RE30WSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u2bgPjcWJh1YGTFJMavc7FNORxPHeHO1FBzTdMVQexIOOT4G0pz42swYTnji7xNsoD64TaeE48CZblagaSbsQTRtO7KNhbDeKmcM1+buc4MpO9P75I4/xZBzDqa7QZ2HyDXxnBjBEfaS+my78R30Gx6Njaq3nWtAEaA5/DG/ycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bMygC0oT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2b636b944so15954533e87.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380081; x=1777984881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHggW5sbT0Gy3AFxkHr9GAwTW2JGfsyZeCtfl/8SYAw=;
        b=bMygC0oTWFqiC8n+neD3XFtZDNPVW7dl3NFmQVNxr0yHMYbJ6a/NZ5KjOnGKulY/4b
         1ZA6rm4IxZfJeIARUn0xuOWmnA4bGG6H30NM/mXZyotRSltNUHdg/KzQNol0xmekpvC4
         btDtca8zFXsQA3NknKNjTEYjCPgi8HGNl9N+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380081; x=1777984881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHggW5sbT0Gy3AFxkHr9GAwTW2JGfsyZeCtfl/8SYAw=;
        b=ddT5Y6Tb+Y7dtkAJbdHT/T8E/prIgxA/c278V3dkxqPUro6dAguSbbnQVPx8bQWvAo
         WcI6hhLo3TEsG++OnIEvLw5J9AskEbilAqgWdLzyV/qu7FqcGOqoV3QatQ0lqz7jPWYN
         I9tIPJqSqJt9pz5nPw3qb9WbYmuQunTeToj1l9Ma+NRlTNNT46ikKx/Jy4tWMzIhAcSO
         6ycfIP077ZHCyLzxTr3ZIVH5M9wU+s8/1Dxs0TZ5poI0A+7NlPRYBsa3NvzVkq8wE52a
         mJZ/lX1hDfgL1q4s5MvU/81XTzHjZb7gQM0oc8EPquX/v0BdTyTILWmurEjLKyntur0x
         VodA==
X-Gm-Message-State: AOJu0YykwZc03Lvsq7oOnq66NqS8v1ejttiPKSgLrkjnPFWUtZU/PILn
	aAuJkfmaleLc7tZSFbGh4Fz/zTNBPIflcU4Yj64aGqnorc6wDhGJTU3KcP5kccY41A==
X-Gm-Gg: AeBDiesN+CkYGqJRM2MmudCbH1LVweN9UJ9nDSWebrXgP4yrlci1FfdgA9u4Z9/Iyef
	lAMOrk+0Pl9JTACHWTl6mWQ/fpPO3skIqIKmrMMefPxzkHN1UW6zyKOGt7DNDUg4NQ/wzV9td98
	TQtUXWnamEylLpiTfDtpMNY/G92aqiATcRAB9F1z1m4tQcA+qVV4IImygk0Q+bjxiQN3ArkB6tv
	UrTU0r4KGZ0YIlcf3xIOVkbGd7VDKleuXo3zkei0c5JoLnIggu2eIHTfYm2a7v88oOI8lzfG1Al
	UqbtL1o9ugnO3ldt0HNhoz66Wap6QEC28NwF058F4j7WFh6lfD/RQGaIaciGejGnXl4RhWKxz0F
	EuaA9pcV1nmKyI7qU+uUKUt9DArowIGhAvyMyalRHR3jlksUFhOiB4D6k8NOEgwuGt4deEsfxHv
	F4pFdrGE2QX9ZuuBYJE2aHxUdQFlpD7Q8kSZT7OJVhWCNbzUxEeBruxTMmqacow3vRjCtN7PfYh
	Nwl3ezoPvIP09M2HQ==
X-Received: by 2002:a05:6512:1594:b0:5a2:c0f1:17d2 with SMTP id 2adb3069b0e04-5a74640b7ffmr1010015e87.10.1777380080486;
        Tue, 28 Apr 2026 05:41:20 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:09 +0000
Subject: [PATCH 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-3-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 3784B4850A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59843-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

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


