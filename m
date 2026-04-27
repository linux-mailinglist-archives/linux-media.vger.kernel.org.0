Return-Path: <linux-media+bounces-59661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fs3JQE172mX+AAAu9opvQ
	(envelope-from <linux-media+bounces-59661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:05:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E964470839
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BCEF3015D36
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 10:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818E83B47D2;
	Mon, 27 Apr 2026 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsUU2/uF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF53B27D0
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284060; cv=none; b=EL4vK1D+Kow56TML82EWNiJmqOS7U19v5ua7zJAGToeYgI1FUJnA8jv+IH3GwtdNYp+zBGOEppMn55/EvJ0lWOrm/4xKS/Ky7aQssKlXpbtE0gCkM+nZx2kgkF+6lwmE7Vlo4KxeyDAFeP7eJrp8wPit2pAeLNiqMsj2+6meLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284060; c=relaxed/simple;
	bh=ZI6ZwXlG1e5ACFzhDMQRxll59Q4E3kZhbdsX1UNQ54c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0CSV0BgjSe3odRCZs2NLBdybiW6InojSxjjwOaJv7cf0T6kZmgkYMgDKpSBPUgaX1BguLctlsofgjUkb0oyjw7UVmmiKHJmd+eOoAnXsGHKsuxph5UROdRZvzjr9K+mfBptUURAr2q4SMn7LjY2aH6S3sZ+dgvbjYBxM/qDqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsUU2/uF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a871daa98fso65202375ad.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284057; x=1777888857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=jsUU2/uFRkFRoLNuvuS1g6q/cHoD8Vg1diwcpBbr1fT7LDWeuZP4JiqYAJTVWPdnV6
         Touu6EEbVXqbIK85ZEJ+HVV5X+LFIXUWBQ0sZMz3bu0mqY4AFFT7ybihXQwL2wEYWBZE
         Vg0DnHvYGK7u4kA0cEgAfOw4Kx1V2l4s0twsd6vdzh/OccuvkUb7FJoeV6Ih33oqdBhQ
         X5JXXJmTJTFp/PZfz4Iaeq5Mv1iDQOx6QtDb/DLxXIP2sN7RXj8mOwckSJzWTU6XQOeW
         5yh7FNTcG295/Gg12fchFNrgRWY9T2FSTaEuTnw857S4VBku4u3PReYpRXVMRD+zxVrN
         fueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284057; x=1777888857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=l4ZfSSwDBGjO/4Cq+HD914oSBSU1a08Z6qc6mZVWmIh6/Eq2QcFFM6fM+4C3BDy+QT
         ZmQakhXaHyVx3KSdqn5KBG5dp0gScyU3cQemrXUrOrcMF6bKMPNnB5qoNs33qWKkakxt
         7VjatF6F+d4Loflrx7h/NhjKrSz/j2NipKIgS/lbax/uQKef4TdjsFBEQq8JPlaHiw7X
         TMmouOd4/3gq1R/1Ll6QA+frvftwbbLZ2JXzQFVjKlxqb5/ciYbnJGjjzjCRp4kdB3Qb
         NfJW8af/VfKwvVnNh1XwvbyCiTJbXXWupp4SwfPWQzDdAQcnwlQf+lJztV6vsrNolOqB
         oTOg==
X-Forwarded-Encrypted: i=1; AFNElJ+UXOJHaXHNqlpXAbLBEgspwntzD00DztwF5MxdZ2dhhlYvJg6S9BqqyHRgH9NbpHol2lEZ1eIyTvbw7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdhJngCJUHte4yNSmMSRbsLoZk5s79a7fpAukm+5U9L4GSvBzL
	zBVjSf/JSNJRUB5NN3ken/70fr/U+hgdFAe1v/QeMnj+OJNALolFaDU=
X-Gm-Gg: AeBDieutWQ4yE5Yh8gL8fw/ddb5s+AyS7x+JJgXzJ9uT26HNk0Du1u7Jr8y2ifF41R4
	/cD60SGAwrb6k4HnnrPhCndCWg6goS6TxIMx6UPZdHT5ZnAR6/P+VZzAEoLyYJ8qZv1LIwEbpWZ
	RyQYClYNdhl6B3Tyt5FTfkB4zX0qfKWtvwWOtpN6XWdil2PaXhlSYwCVxbMTItKyraTCxAaVit8
	WETUIVkBj/49PHHpAOje/6LuQbSr8T4pkIb12c0gVukZj47NU2SNiNGBXlfAR6JTOd0bY/Jxkri
	ov88SpYSbSiBsyADWyyyaDgNIZcVHcv+KMskVK/oRSTkywCHfcFLPh9suRQqRiVkR5rBMmjLpbm
	7uaqgXBVAvKMrPokXsXMVoMXzaJZzBiD7YtUm6qMqHmLQeFngyb2QSJ3lSka/jhHisqZpB4bDGr
	eTJzArkWcbnokuWkWGQtZ5HY1APQngm9eaGtTr4mZye/k8nvk74tlTAvxwhSFl2u25N9iZzh67H
	hwV/4zNMQRrc0gtOsav6E38pzDPWp1GMvU3kHJhO9C9wrk=
X-Received: by 2002:a17:902:e54e:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b5f9e64c77mr424633395ad.5.1777284057141;
        Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff713sm304240245ad.5.2026.04.27.03.00.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 03:00:56 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cedrus: clean up media device on probe failure
Date: Mon, 27 Apr 2026 19:00:10 +0900
Message-ID: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4E964470839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59661-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bagmyeonghun-ui-MacBookPro.local:mid]

From: Myeonghun Pak <mhun512@gmail.com>

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..2c25654640 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media_cleanup;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 err_m2m:
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1

