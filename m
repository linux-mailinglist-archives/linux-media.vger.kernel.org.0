Return-Path: <linux-media+bounces-59872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHCnGg8C8WnubgEAu9opvQ
	(envelope-from <linux-media+bounces-59872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:53:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B541B48ADEA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1544A3040A93
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 18:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B1447CC80;
	Tue, 28 Apr 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahVvLN3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124443CEF3
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402241; cv=none; b=I5x/8BEOR41ekAVd2ilLDdvkVL9eeT/fvVZ5XdfFvI3rRkdcsX1G7xTFKvbmI/XrQ9IOKYmeQytoO/pz/D9lOROXNlE+uklsGdVzKWNRRzga+bP2loHoxNslS1cpoVuK/BvZ1Z9Ws0EEET1cbkl5ql6Q3DnMcNm1yK1UHLgov88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402241; c=relaxed/simple;
	bh=uDaNoagHys08JDYY0sUwwSl3qH/ea5LeNwTnG/ymv1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=stFhkeAByKlXGXv0oJ/ympOhNPMAGMnJ49lJ1PkKX1she/RrjOHJQ4NtD4bYE6OnWQaz0FoZuUcMvI5cYTsnt5iTTthVVLiUi9PFmOWy2teXuUYTGs9SOqVRk7yjmYclF0ghtpwk99EtfothWGFBmf3taBrSTgpK1pQXyYSNXKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahVvLN3i; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-479e4835e26so5344061b6e.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777402239; x=1778007039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIv1W6wjvbNHFz0BT7UvNZrlsknFtuu9/9aZ0cJuVUQ=;
        b=ahVvLN3infsiCMPtFeo71ImoM6oa8I3vy0zP2FaTkM6LkYqCIWv4+49CwTkNoVaFtF
         +SE0aMDG4Rr7R1WIaHLwGrCU9bUadPeSm9yc0VyZkD4hhQLU9U9VAuG5DT20UZlWHND5
         4zfDwtECr72UoZXYEA5uE9E6lxIb5S/FUrS/5jRk8S0Wy9O45tShevvj4zFDeDGxsTZZ
         YBRk/2OZZt2MOY2J+G7gDE70k98qohpqOx1SiOrHgSa2epOZotA5VNRNXcYFZqdsn2m/
         jcjgEmyR1FTML9HDDNnUgYlTWTOOyZBOwTA46oNbhSfyQYqO3nznR5FgU+XvCwVrEyp3
         8LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402239; x=1778007039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIv1W6wjvbNHFz0BT7UvNZrlsknFtuu9/9aZ0cJuVUQ=;
        b=O5z/jo0P1AYeUs9K23dZ89XjDeunVCx7fIA7XeHfsmxbCjwCS1SYC3EjJe0u7iftaz
         v0/XLeuPrh6LAVokVwu59N2kLbdT4eVHOuh2PSs3EXdMLOcx1M9mzRTHHZpuwyTHXhiy
         oNsLopMAg8P0Of0p5Fxt3xiz6c5OabWxbK6nBLYLJ6wAojKcZJG5sSnuf/z5XyNSyu7d
         7kxVJMyxwvkVnLaJe7S/MvIEnfbra2Q2TvymrRbkies+5rtpBbxjbihGSrbG2/tW78tc
         cDyPo7lN2iCUbhLw6fj0zwftEYIeKjny8g6Ja4g/fTO7PsnS42sHeZde2LpCZBRYFxnj
         QhbA==
X-Gm-Message-State: AOJu0YwEOe7O464EG+sf5DDnisS+hQ1KCkIKyDVST3aKUwjc+B8/nNdX
	fOFesXO07AuQlSmwIK09bp+UIg4cDTYE76Vv+iy+4ZWswjyHNWtvm9syB5TRrCNNvw==
X-Gm-Gg: AeBDies7XuGOF3gK1lT08X4uUB7hUY1aJF5u7xcsAbzp13SMW2k1/MI7/10pNiD7wCd
	osMtdfisBoNNntxgQwsRh0SYD1PFZb6r44o8zi21kRHGXG+NMh4DJXokum/0MeBV0Hmt3d/L00v
	k4c/UyDpgLRrIbOwfbwPuAQ8Ue8R0wvtkRDltDvS+Isp5J/zZ7sAZfPgzZS6U3QwTmQiuBdPrh1
	+xpT4qCKMZDgCWFWQimRf9O8RxoD/TliN+awLOm2vY7HDjTfdCaMgX0xRnU5vF6J68ePxYtJSLV
	GsaLOL5thnoYwaW+MerEDnwRRy+yzv9EQOYeutN600Ra9gg+AJToZrffVVAFNh65l2JaKyLp8tL
	pdCw6izZDG7SB9os08QGff/S7rPA7nH3EQxpc90B6w3i81mpeSIr09+tbB0tkkLXMmlqLmIgUNT
	8yAVDpZD7ikYWqN6z4ftXNTsstZjfWgbg+QweLUsz0SCuD44wc5rRm5g/e6GqyO18XghcGOAYCk
	UZsJYNmBWcxzC5PwtdlsGFyIKQ=
X-Received: by 2002:a05:6808:30a7:b0:467:2f84:b0c6 with SMTP id 5614622812f47-47c28d69514mr2327577b6e.8.1777402238476;
        Tue, 28 Apr 2026 11:50:38 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c291c314fsm2008443b6e.16.2026.04.28.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:50:37 -0700 (PDT)
From: Marc Hanna <marchanna111@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Marc Hanna <marchanna111@gmail.com>
Subject: [PATCH v2] staging: tegra-video: Align wrapped function arguments
Date: Tue, 28 Apr 2026 13:50:24 -0500
Message-ID: <20260428185024.853-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B541B48ADEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59872-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[marchanna111@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Align wrapped arguments in tegra20.c
to follow kernel coding style.

v2:
- Fix From header
- Update commit message per review feedback

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.43.0


