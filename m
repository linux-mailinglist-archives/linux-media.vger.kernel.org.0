Return-Path: <linux-media+bounces-38373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778AB10872
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 13:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6566F54599B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 11:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5085D26B2B3;
	Thu, 24 Jul 2025 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrMa5O3s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D623FC54;
	Thu, 24 Jul 2025 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355034; cv=none; b=E4VCNPXAFygbUhUtX7hDnPFdPjUVyT0uTpNBWmyn5Nm6PD4Mqt6GSLYdGMt21XgiIG9avvRrycEddgS1ICpBEL0EE/ujDLC5wTkJ9pOfONqx6SAbPhJOZTUD4WS2PBuxmg/qJIKBAYSr2CFr4dauPtq3ob4bpaxfRb+/Fjpya0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355034; c=relaxed/simple;
	bh=5WR3YyhrnUDnJVyMFMePoMQk+H2Y2gJczMHXovelp6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MqqkZavqdawhvwK2jJnk7vEK5gVzip4DgvJ+Nd3h80ZG4bea1tOkLkzOAYj4vkkcIyZI8xAO68IIROgVncuwt6XpwBUwIqK5sJWvNoHfQf0oNLJmxaixV69WLz3nXKz2fnkwd+WveZGHcQYiYY27fhvVgWlMexGl8vyCR9KQIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrMa5O3s; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45629703011so5787715e9.0;
        Thu, 24 Jul 2025 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355031; x=1753959831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BO0LugBH9HnRi2SesdTxjFzr6y+8KlqsNdWixdTRhk=;
        b=RrMa5O3soRGmDUkw/x8mIdGGxRSFNTokPFMcFGASJDAP4S+jgEXRfpuHzyQpM16K01
         EbDB8w5MK/p9h98xpN+BGS6mlcA48yHYr0qPC9gWmTFK9IC0wcW/CtmxHcY7yxPaAry9
         4JvR8ZNBcY/gBf3f0CUg+bHMZmrWqHAH2lLR0g02WNlRMv+g/lyWrUKixqQNqiY4L18v
         3Q4IjztJdfczLAqko+x40lMAaGU8rAvX8rTKhoEaQ1z2SO9GVEfpjt6K842BzhLYRCfI
         +mIIX2EgMRtUUz/ASzm7BRlcoNnu+wflq6TekIxlvwhFY4AjvcoHyBfiilMZFWzCQ/dm
         ep6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355031; x=1753959831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BO0LugBH9HnRi2SesdTxjFzr6y+8KlqsNdWixdTRhk=;
        b=WP2AkDprmI3J9ksX8WL/QtFw/Bh3QCGAxciMmWfbHPGXg4P3dkW2WV9N68mfGy4sqR
         pMe2b3hVt3AdiHTvpxIZdVs8PIrVB3UtHI94p0R0lHKh66MD/sqqXRUsy/D7s3/P2L+0
         XpyJgK7iF4lWzBXQWsn2RfpjCBai5mcP5VXYj6OrjT9ElpeqKnuynoWH9DH6cN3X2vFo
         L75JjqyVvTIakJwHrrmRInon9Qrl1BzBTdbakLq43xZmVmc7OOjcytfj32NAcjISMV76
         tIuW79KZKyNX72WZsCBg3i2izmWirLM908xpVh3hCWa/JXve4H2Tlgcy3U+nU+d7GqsV
         Xfwg==
X-Forwarded-Encrypted: i=1; AJvYcCVzwxhx3Jp86eMtBcrCr3JagcNsr2PzXiOD31B1f2jO+eS/q9gC8rZmeb1CijQu9VfZTRbbTchTlZkmDRI=@vger.kernel.org, AJvYcCWWPYTxfm5ASORwZzSqFlu3/L2EUZgd5w+vo/A2+IRLFkChZ49GZe6A4bFSXA1kK1Ad04w3S0TuwGohNdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26NNHK/SbBqvuXCJytb87id86NlsbTRXZIOU8sOxP08eVpHfO
	m5lbjf/HVP873hbYzj6+d8666Ioj+J/LKAEpEw6Gi63TdHittfyjp/Ug
X-Gm-Gg: ASbGnct8KxACZoIJg1Mr9kXiBRqFSI3EJPN9Wfekoml8FORHHsW01Ze/yR7VxvsYGkG
	P9F8Qjmdx1EsNCNpkimHkQbiVKY8bj283HBGhIgYeU1CZQ1UsjW1CeLCbCOc0g5wWg7fl9aZLG4
	5y7mcZUFAsE1SJUb0e8llh5AooJtp7JmCWmpq/BJOuLJl43UhuHukgVujEHHfxF/B3TMHZ2Y8+t
	6SR4uL7r1AtCN775wk3QgGzrjMK/JvSX7ZYvO+D8q0c1SnCadN6BRrmpxUjXu3nlgLTSfxX07Tq
	6UcXLks3LEC6pV2EHrvjLcO63AkqTlqF7PDsZlbIj+UeimSTR5uAdoE1gpgxw6TFc34ekj7a7Nk
	D+54E7JaZQmJhgWBjw0It
X-Google-Smtp-Source: AGHT+IHeIgYUhMAED1s/zSMayTQsBvAjmPpTfLT7EAOQtX4ff7O+VmXQ6PzHyT1cibrfeoGpSbvJDw==
X-Received: by 2002:a05:600c:4e47:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45868c9d3c0mr62970365e9.14.1753355031254;
        Thu, 24 Jul 2025 04:03:51 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45870532af4sm16463945e9.4.2025.07.24.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:03:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: Kconfig: Fix spelling mistake "Tehnology" -> "Technology"
Date: Thu, 24 Jul 2025 12:03:18 +0100
Message-ID: <20250724110318.140684-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are spelling mistakes in the DVB_DS3000 and DVB_TS2020
config. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/dvb-frontends/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index 2ef2ff2a38ff..bcc97ca86ed5 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -163,7 +163,7 @@ config DVB_CX24123
 	  A DVB-S tuner module. Say Y when you want to support this frontend.
 
 config DVB_DS3000
-	tristate "Montage Tehnology DS3000 based"
+	tristate "Montage Technology DS3000 based"
 	depends on DVB_CORE && I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -270,7 +270,7 @@ config DVB_TDA826X
 	  A DVB-S silicon tuner module. Say Y when you want to support this tuner.
 
 config DVB_TS2020
-	tristate "Montage Tehnology TS2020 based tuners"
+	tristate "Montage Technology TS2020 based tuners"
 	depends on DVB_CORE && I2C
 	select REGMAP_I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
-- 
2.50.0


