Return-Path: <linux-media+bounces-50480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D50BD13E48
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 17:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14B7E30285EA
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 16:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C7B364053;
	Mon, 12 Jan 2026 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBZ3Gw+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9728B364036
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234095; cv=none; b=RAomoE65SKQFz4jIm+qfZEJ32lLgO4t0PUmhNj7MwdqYudqPkGevf9n7cpy4PJpGMM/kAMvp9Iwa0HMe96Nk20zMmF75/lXN8XIfHx7RRh5QCMRAye/8gVcu13uN+LGr2VcNkn4BOhJ93cBTU3tgzL+AB+54GSaGPwW8uBJgaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234095; c=relaxed/simple;
	bh=x0s0sgtzUWDOu2JlUu6QQr4f9XO0D3MtX4Z0A4Twiqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vGVY3NOqYuZ5IcGOygRWU+zG+AYm0lWOIDQu4xAxflSfzjcOQUWfvc0yi1sbVNIQuASRQHK9fLS++4Cbq6BjA4yFsnK36PD3E7akS20I+BrDWrZa1JfYKuxj2gajNdBhAfR9gEyKFOabH9I2LyMtlauEg2oCD7UbC8ypHoIcun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBZ3Gw+L; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso13733959a12.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768234092; x=1768838892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irOVk04OnB1Z7xuGyQdMIz/lIlx98ijNd4adgMdIp0w=;
        b=LBZ3Gw+Lsngc8I2FqE32F9XJ0H0hgHwRWQsKXns2TAqmUXlO/hh+sieaP7tDv9N6ch
         myVg7V3vUiqW+kuveQg+yskbEPUKBBHlyBfdsEYTy2JtJSkLitNz2kaCrYMLo4NYZxBH
         9eozZ5w4IoOBiKh41j+tOwNivH1oCIzoJta8ROQNMRUanuGXpW10COw9ztAUHtwC/Dl7
         2AX4SyR0PiQsv02fPeHOABKBEn86yjAijW8fxlYefAKUTKnfbZR2wnCPpUohl4ylfecV
         CD+U4AgY6AWL4ZQ547asnch9aM5ZCHQxP+7JLxlJpyHSIPCR/BCCx4md9nDHlK3Q3I4S
         598Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234092; x=1768838892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irOVk04OnB1Z7xuGyQdMIz/lIlx98ijNd4adgMdIp0w=;
        b=uCF2UiaXMJgtFIeNzKaiE97ef23kI1dO8gLVe8OkMZk6tabnOb0jaLePLiBFo89dYx
         1WewYya7tsWrGSPSXlLfSREhdlMlQ++7kDjlCrOMQVeXDv2X6YZ7b2XblAVqLfpDt5Lj
         FJXUc6mC7wIiS1ZjyQri6z0CeKGpOqW1NQVkpbgWV5V63jYmLH+a9Rq5KUAno1fh0vkX
         valFJlXPGQQP+AH696B0HWqD7ai8Clq0FRnmUc1jQ3nff/G7lJF8wMqGUE1238H+hjDs
         Bacc1e1CHm2HlGVplZIcpyS+Vo+EdYKXCjRNozQ2VPnylANourXwJiLgbPgfws9eByx8
         +CIQ==
X-Gm-Message-State: AOJu0YxwjEEYds/kFJROzQvndfpoRZawJdR/leX9R2yGoP42YWbVpLl0
	rpkAYkOo40cUI76RGPlsDQmwLgebptK0fXvcM8BFS195oXlgi/dA51w4JK29LA==
X-Gm-Gg: AY/fxX7righZCyBUL1nAPP1CytwDGReUKl8ZMAYL1s1rK5jWeuUhMEPTpCN3nASpduM
	LZAstlp2chwMTlgIeYGlypP9Q6ps4EvifATKuE0NH9+9TCMpDE9c5y2REfz/WKKBZ2vIisMy+YF
	tbrnzl8dixxIlahMi8td/GvklZYijA8k7fcWM9vaGdHa10/Nsj+WDukEN1g18H7yYRfOJHeDJM0
	tI/MybzYL2dl24oQ2bOmPB8+6IrkQpOrijPH2mYl++kCupczyYE88OB8UpiRon8RMAUkhi0nR4/
	s/N73V1oHIwUfBn52s0ZVG9vezHzarinLSkJgBP1c8rm9Cf3LTa7sNxiRqBl1KJZsbYDcKAFV1Q
	ZH1lpetmZRbx3UTZ3tKqgiiqFvThcRC6MsDH3OCD2pzKD1nLaVFvNjKk3mUlYj7Dz7RbHPAR4qR
	739G2ZfOh3Hny60p6lp++m/m3LsD2n1HN73csZOAQV9VFzgZ2GUcTRYQ==
X-Google-Smtp-Source: AGHT+IFK5/qRoMOhzHdOzDn7wOBWLrNYnn3vootDt8k8wqJ2rVAfYGF4c7rP9ogHzBebRKJdm+ykCw==
X-Received: by 2002:a05:6402:2803:b0:64d:23ac:6caf with SMTP id 4fb4d7f45d1cf-65097dea284mr17171126a12.10.1768234091493;
        Mon, 12 Jan 2026 08:08:11 -0800 (PST)
Received: from MacBookPro ([2a02:8071:2186:3703:6de9:eb98:99c8:7af2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm17850422a12.28.2026.01.12.08.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:08:11 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH v3] media: docs: Fix typo 'hardwares' to 'hardware'
Date: Mon, 12 Jan 2026 17:08:10 +0100
Message-ID: <20260112160810.19051-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix incorrect plural form of the uncountable noun 'hardware' in the
legacy DVB audio documentation.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index 81b762ef17c4..99ffda355204 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -444,7 +444,7 @@ Description
 ~~~~~~~~~~~
 
 A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
+following bits set according to the hardware's capabilities.
 
 
 -----
-- 
2.52.0


