Return-Path: <linux-media+bounces-59867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM38K6Ln8GkIbAEAu9opvQ
	(envelope-from <linux-media+bounces-59867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:00:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7F48981D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 088C9310A8C9
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EC53264DD;
	Tue, 28 Apr 2026 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCJBPJ9h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98F2DF717
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394007; cv=none; b=jcsfWqtxkJoxgPXNIO84h1sQxs7Vhu/EuU6uusA1OzY3yLY47S5YIIN4CR2WyoXRZ6cgKLRuliqF+xsUi1a9UdD827A8i2JpACgB3dYdgBmnm8pzmnVDO0Q4HkXMH6HyX/bmBNetOesKbCWqt8CVyQP328lY5C4eeS7fqEuLiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394007; c=relaxed/simple;
	bh=WDH6pRA7EbpkJTMzOV6Go8ZWNnndc9bdckcBY8wTY3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2FLuGSJwJdedz9oWzVKRjXVgtH1+x+a91lm3MKc3rvjdsoO7LBM0BZCBcff7Z+FHF027Y4NPOUsc97bZKIjUmzlYWEZ3vEXwnjzKbk7yaLuNz9SrrqDsyeb3toSk//NyElzTz/jGN9Fv01Y+exGky+ZIqrF6p7Am8WbyhC9YRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCJBPJ9h; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-42ff0576868so2393635fac.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777394005; x=1777998805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wboe/aXKnnq5f84y1la/d9ohgX40/EwE5yX2y+CnoIE=;
        b=QCJBPJ9heJ8V5fnaMNy6r1JltVRJVSd/0xDBxX6+m3IC9Jzz2JztudW3FM764iRg45
         E8Qcuq77FH/fnQBeSPS/GdAZGuzu7FECLiu6gWJRvtK/R8+7wVXWizPsJSuZiV5Z/wT0
         9jlFbeUU7IumL0kSSyBI98v5Pr2xPnwPtH1qOxWXlc40tWz4jbWB5NemY1am9Qoc48bl
         5A+rQKc6V8R2cxm0okiBMV4nXbAGyxLCYyADIvNeueSvteha92B0AdL18C3/naQsO0zu
         KBS+EqJFRrLSqWxKmX2YLy96sg+y9p42N8xaPMJSBdCVNnYY5Mv64LbnOqx/5szm1d3c
         RRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394005; x=1777998805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wboe/aXKnnq5f84y1la/d9ohgX40/EwE5yX2y+CnoIE=;
        b=i7cDMmn0v2j629euaI/BT84M1NWM5C8CYu85TlEzVpd+LN5mMoIRYimIA28WK5h6Kc
         LvG76oluOPeiQYXyBQHN7kBW2uUfp/6UF4ROJB4nb5gmfO1RQ4QrO8K0cKJcvQmi7VDI
         +y1zysNEHAWbAchOAZFCjFe5Y0y/0TYI+yxsGzRQyhL9RyTosDkNSiScpfswqH5e3787
         /2fhkgmfrKHIJk0AOpeAF48zIieNFOyyCERqBt6pogzj7aCOuGaVbcBiKJO1X5TaPVYW
         E3ij5LUDRNQNnuwfVD/VdQXuOGaCKJgN2WX3cMZMUU2OVYHO2GFc8i09FjfYKp4wBukm
         lVfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PDT92djV4bJbz++EfLADBp3vEl5SavmGwDIxf606ZWOVQHO0SjEJCnXgsqqgTlb++CgXu0WUMB8A2pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUD6IHSZH+dUPkJsgNZU6NnQk9AtFtWyYSEB0M8pLGYltdLXy
	iPTmNgDFyn/uonS+N0j4h/yiQ0XM9bCXKxSEvSGBGKIKCDP3EuDC3ok=
X-Gm-Gg: AeBDiesmkD7TrcILD9j21euiDIo93wg9PkknkTb0ddQAyeSWWw+Pdj7Wbqdo5BVw63D
	xWZI52BsaHA1xC9ZP6B/+IyrQ5N3umiQ4kWkWuNIvyGYsv43uyLglz4CgDIIVQKWAX6qRZtXPm+
	swCWY39W5ffCopgCvDQ1Uz/TQsuha1ooQk/2cnw6vFrkjzDx+JrrD56VMV9hv7Az/2ZuqoAPxNy
	526iqvdy1GBP2zabfZ9dy/9Lotj+diMxXVyyQRxOMKyiSST8mUZaohvEsC7FHWoMQmjjwdWhQgb
	FnZ9aSR571/eJAirV4HjeBsjt8XsLWwv1gsH7eIstjAtcU59UEAISUKK2WGcb2PCPOdR4Ui+Urc
	S+I0S7dxUsJ5Ma5CEKwidbpdpqEyW7kd1KDeOU/Uz93IFNkUyqCmdgnpwFZDg+6yzn8bXXw70uh
	V44ccJkHodHMd2tzV9CFnwjTEzmGkWb8y1qXI3WftELR22bqOBi0fbRE2E/W/O9/Gdq1Vs6JmaL
	bXH9q2MVdwhOXyaq5+oJBioWUw=
X-Received: by 2002:a05:6870:3233:b0:42f:e6c8:2ea8 with SMTP id 586e51a60fabf-433f37e6fb7mr2077151fac.6.1777394005428;
        Tue, 28 Apr 2026 09:33:25 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-433ef7d122esm2301556fac.0.2026.04.28.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:33:24 -0700 (PDT)
From: Mhanna112-code <marchanna111@gmail.com>
To: linux-staging@lists.linux.dev
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mhanna112-code <marchanna111@gmail.com>
Subject: [PATCH] staging: tegra-video: replace bit shifts with BIT() macro
Date: Tue, 28 Apr 2026 11:33:12 -0500
Message-ID: <20260428163312.7374-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 37A7F48981D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59867-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marchanna111@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Replace manual bit shifts with the BIT() macro to follow kernel
coding style and improve readability.

Fixes the following checkpatch warning:

CHECK: Prefer using the BIT macro

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index eb1fc5b7e2cd..f3edca909684 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,15 +177,15 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
 #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
 #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
 #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
-#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
 #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
 #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
 #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
-- 
2.43.0


