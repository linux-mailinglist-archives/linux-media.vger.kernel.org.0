Return-Path: <linux-media+bounces-50930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C2D38AAC
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 01:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A03430A32E9
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 00:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED80719D07E;
	Sat, 17 Jan 2026 00:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7qGEHfn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E989155C97
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609546; cv=none; b=GN0VoUwZT5lZ+/COIZl0LE+eW9B+4tbF75sDCWM1KaDkA35FCqQ2fMOFchJOxUNq0uGNeyNM9T+KdtMDO0yMiXrCB4cOtyWRiBofJoRTKTbcQrnX+gbvX8W7zwLyAf0ve3Mq7dvEtjctXGOgT9IuInCDzrpLbds3+M45oVgHEI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609546; c=relaxed/simple;
	bh=zMWrCZMndADSkg4s8xix2EZGPZMfvSP6VQAt0nAFJNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkE2Kwdp6mvc72NnSOTAlBN4CMiNIYL0cqlkYGHBrwhB092F5boUUL1AHLA1t18QGQDtd4dZ2jg0pX+i7aROb8gZlraQu1o1TKTdqKvM8stjvhvUQgt+2iruz/P3EdlB4+ODrFnszDur+cMsH9OKwhxJAQgKFzi4ug6rqxF4iM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7qGEHfn; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12336c0a8b6so5392759c88.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 16:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609541; x=1769214341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=W7qGEHfn7+KVbeYkEa5SCSSN7O7DsBveNX0/+eFiqXIqsdDBoVHKyT33qWCG7HLHdC
         GgYAcvv9eNRD6QN74WoweNIEXlVd6u7Sg0kVlPPn5g8l5knsx+H2oTsxEAwUaY9qDT1M
         w9C+9HXJfG1ukyC7FaPzxr3WzLXDgFcxREbc5hGrkTNofr1vqpoAQSPVS+MI6xksoFwx
         p9FtRp0SLsYy22TdP0WeOhf0tfGWEH06mOEmldKFJUV8fO0ChV5TgirRZRd70QcISHdH
         psA77TBYpVwhM0hTMbVdxljABk6rQwgSXYnSC0rx1OE9wh1BvaX8RffwqNvSVyW+6wM9
         2aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609541; x=1769214341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=JMNlDxOgyod7WfewApGaxWgVQsCB2L5xrv8viRFgzeoxqe4yMNa+I643ul3WVvRa/r
         eM2UUHnylWPF79XM4/jHpWWLx0/P3M3aEfzcMbDYLto3hqQiNUnE/8p+lYOgbfUpRqZB
         +jEvlmg3NSqayov0uGqI9lDNdNNjhwV6/kfo8Tx4sO++DQRmWuDHqiUpevgarArU2LRY
         i6R+y/gL6hbmrfosNMuvvUCJyyB4NwKrMS7W8Zsyae7AhVvtfEs5RxY0QwdJy3kBgAKE
         9saKLrtw+Pi15vrI9Gd9zszr+rywr0nRkEpv5C+uFKHfVHH2CxENNKs32QEqoFKYg4dT
         EKgw==
X-Forwarded-Encrypted: i=1; AJvYcCXumeZkxEmX5XYlCSC8Pu/rDhzWz75MpX26SeYRWjDVeVDF+Vmd3ZLGfoviunq5ncwNkBgiF8mlUnONWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxageEEv8u9UjE6l9oRyhZNFsBDVpTfzzrMwxhWw6HYMLdc8kF+
	bXz8A/KC4AroYoTzxlhYCiCe3LMuoeWgQH/QM3Lrv6oKEZUYdOjK/FoO
X-Gm-Gg: AY/fxX6fiTnzVgBkfK0ecV0bbyjj4PG2bRD0DU4J/3mM6V/kVvZ941tsudJtd+puZOT
	sbS/NUFXBgI7yJbo+xDgAVPy5XPC8Q9Ka21KxIGMPX66BvUX2mn8Xfr48B+yA6dYYpWA7uQXIAe
	40d+fQvxJ/oJ4MUEtZHphjplZqnw3d5X6hLK4pN2523JUckUI6kBgsUhgmeujD9VmUSWYEfZiE+
	jbsB7h8zZVXPIKxrrTKpBz/jN7zyN+IXCDaZRmS9DsyDRCaxvb1RhBu6adhfU1SD8AWW69A1qzL
	glfSLXb/qlLH1x8wDcV7+t9q4ISVIIlkNizMFXrKo8qC/aC3cBOfl8xEEmCM3FAiOvi4pI88pHV
	IqhTT4FVNNqJgoHmlanrT593Ujfwc0i8SYEbukf7mdfXBr36D8LZmpqnSHkOdeBQ8jgHyLNqvd7
	My39zPW2hDOE8wqrRqzVprK0ct0wFsdmbAxwKQ49Fa4HwxjzoEpBL15x5BnRfTztu1xb+PWMSOW
	UTl1c4=
X-Received: by 2002:a05:7022:225:b0:11b:9386:a3cf with SMTP id a92af1059eb24-1244a782252mr4273827c88.48.1768609541196;
        Fri, 16 Jan 2026 16:25:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm4287875c88.2.2026.01.16.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:25:32 +0100
Message-ID: <176860947674.1613073.11085159197676774675.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
        commit: d6e8b796d0d67699c74ee3cbc46601cf9ec925bb

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

