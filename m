Return-Path: <linux-media+bounces-22968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03269E9FF7
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 21:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88482188716A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AD019924E;
	Mon,  9 Dec 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q3j8YqzE";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="heYaDx3w"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-32.smtp-out.eu-west-1.amazonses.com (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88511552E0;
	Mon,  9 Dec 2024 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774525; cv=none; b=hXaq7V8004EsZJw5twVCWhhLXoDCtoegTq9QXG7eqeDJbvXbDj4HDLKuHycL42w9qs8zE7EIwIvtZ0lBzy84o9sk0EN2R0GQG0FbwCx4WUybNPu6eOnaelm0TFzU5XK0nTtiT+YN60Ik1XKSXVjn/4a/wg1fwVTI8VdSjsrRLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774525; c=relaxed/simple;
	bh=/4RZbyvnAxjSwIetXPV5ahVyR7xjhkpwwsXpSPAIkEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZthTrSlMaBNY2AOF8LCMLU3HqVtIJ6dHNj6BXSM7t/eG4FvwBajpabppP6OAdT0A4Y2GyS+drOxzT2PYdkOuuqh16PpHzYzItOiVENc3n3q+rzPeJxBDMsTSQzwPYw+beSzLUKA65i1l6cFE/T7JezChMuH1GlupWADNvD8TxOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q3j8YqzE; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=heYaDx3w; arc=none smtp.client-ip=54.240.7.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1733774522;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=/4RZbyvnAxjSwIetXPV5ahVyR7xjhkpwwsXpSPAIkEE=;
	b=q3j8YqzEw2kp6sZJWf0YqBmDf1HP/JiESgOgCGPdqWTwXllOTM6VTRGZ5DtFBG8w
	hOlAvRJc7y/53e/HEEYn4qxWZMEvVfOp38oQKivA2OQ7SkiQOfNvsPPAoUvvAfXa6nu
	Dk2DSh6yqjuZxnM//Belss69XgmdrWXdpSU5oGHOYwOu1Y5j/pQQzlR33p+qYCdRaee
	yUMYOZtC/umWMtI4rElLJCCFDYUUXfsKj79OXT0ORrltFwBf3zgJTasuoop80VQaeCb
	eZ1Lq5QZR+zW9/+90THbvejOr5XHhtYCQ9orXklQvJGX2aSCHqZs4bhMPMQbqFgsCkL
	0Fqh6DL8iw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1733774522;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=/4RZbyvnAxjSwIetXPV5ahVyR7xjhkpwwsXpSPAIkEE=;
	b=heYaDx3wMmAKYEeYmndi5e5YW5uus5cH7dbrjAC8DnHu+k50IJdaW0SiURBbL3bK
	IMonPZlVGEfi/t7vBLgBtcGMiGB++xpTK8M76d6KZhntcQCEIXxdEzNB0dNsbQ2sVVQ
	4aDRru77Ne3ms3H1bQKTAl5mCiBDCfcgtWbhcgsI=
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, jose.abreu@synopsys.com, 
	nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 
	nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, 
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, shreeya.patel@collabora.com, 
	dmitry.osipenko@collabora.com, 
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v5 1/4] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Mon, 9 Dec 2024 20:02:02 +0000
Message-ID: <01020193ad03b755-9daf2dc6-b077-4f66-af12-8a7ad4b2ae13-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.09-54.240.7.32

Add an entry for Synopsys DesignWare HDMI Receiver Controller
Driver.

Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v5 :-
- Added a missing closing bracket for the email

Changes in v4 :-
- No change

Changes in v3 :-
- No change

Changes in v2 :-
- Add a patch for MAINTAINERS file changes

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7700208f6ccf..3960c3ca1849 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22768,6 +22768,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
+SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
+M:	Shreeya Patel <shreeya.patel@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	kernel@collabora.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+F:	drivers/media/platform/synopsys/hdmirx/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
2.39.2


