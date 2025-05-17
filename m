Return-Path: <linux-media+bounces-32688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB5ABAA5F
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 15:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB214A058C
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0D7201013;
	Sat, 17 May 2025 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X12ETQ7U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347F1F9ED2;
	Sat, 17 May 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488487; cv=none; b=u8KdY3KfxupTruKUqGSbwQfLIOCZjEXUb4O8pVp8tVO1Q8TCDucAbbj9aCFS8hkobBXZuWUy13DjH8QH1QjDxnPqPwaUpHjOxqNpkXCuU4otQBlj+SMGuI6jDoCsAX5Ikogl/pLYXYI9gsuz+i2NjhODqjPY2utXMdKMestBsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488487; c=relaxed/simple;
	bh=gmDEnXwRjo+bJNFszJsbjo95GO8tD4tqGQW7d1o1lDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pwgy/g22l4JydCz1erqhvAiY036Jv5ufmIc33VYw3uFppGFTb/5tVV+9RlI5G9Aw8+GGK5yFwwtgcrAg7dlzDbPa56/yQdLv3t0NwLy5/JrQ/Xqw7oRnwxWOiTFQTrcZaINmSwUj4PfGBtGPz3wGqOcs+RpypM5QOnbUsiNin7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X12ETQ7U; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32803984059so15433351fa.2;
        Sat, 17 May 2025 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747488484; x=1748093284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI7TUjGfXSmfmXazMfqv5rln70w6M1XAC14rGLg1cvE=;
        b=X12ETQ7UJxCSLRLLfWUvnmksKY943PFVnNzLhFlkdvRibMo7tq0kg+m1kZV/noyljo
         ETry5qh9jZ48qYyM3V3e+kdUmt7XA8cWc8fgBCO9hEBcMI6gG/COGa9mAwyqg9Wj2zU1
         TZV5ude8n3KP+Bk8ULZveKgDhJ/jhRIcg6ieeS9VV7gLs3aKWwk2YaTMg48itBJNXW/w
         YMx8Gi+7twM+Us6bF4BWMsBcKxWeNGGN52EqUB9KY0jAT3Xm5Uzp3Ndt9zzwo+lFEQ69
         hGm7Ofu76+BZLbHZIT7jYSa/15XxYBA1MkYTQJTETvVrfxTSMtmI8oRa2tKZWZobuyq7
         psyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747488484; x=1748093284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI7TUjGfXSmfmXazMfqv5rln70w6M1XAC14rGLg1cvE=;
        b=Yu0Liay4lw2LmXlG9V0QPtuv9BBWD9PfQDbVToRGwXeGrQDiQt6BPHd596VoaB6WGk
         EwgAXUJm9rleT7afxo7ffvLkcX2rLBpwW5ynO38zTu/fa1FCTxwWq3dyMT+uEtWlmmou
         Q+e5J471JFC6MwADmCyuQJt1AUnNWYDcCqbSdz+HGLCV3O0gtKav6tQJw8VgSo7t+Kgo
         twpSlMJRtEZ7UjP/g1+1OuKD874PIVbakodVgwc377+8ntT70RrNCiqrwFPVD2TmlA2v
         imco7Xc96R1CBH+SsLGPyXOLvKrqOkkjoZUPLSSCzHanAExCrgUV0YPruguBFqprCVcF
         S6pA==
X-Forwarded-Encrypted: i=1; AJvYcCVS7cnQ8rWutsqtlcNp1metFMrrsEnvoKgkB9lgtfQp/IM1hEpxjyfqAO1a1ySDYmEUEUTig5OQHobkVac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCCbJvn2PL2pOXA1V4Lqsgj2GKaR5XcFdd8MuIc0mzqqWTdKfP
	ix0EchhEJsCJvuTtGC+X6yGkXIP87zO9ZoUgenjz+L2GqESC4KVPKkup
X-Gm-Gg: ASbGncuUmSFk/tOeRsEcJpMIlUaBnZ+T09sygpeNJ6uxG2VkbBAWUAUUtJ7VPnvQx8Z
	c6lAyQLvpIQeUoOqL/7UgnbTw54EcEW5f3ZzAYgG1rwFWGpvk642DH5hn6ei873Z6j8hWYWyCs9
	NsK0AO0+XW8iMGc6Zv25a/BHtth4yoawQ1ipkKnJPWdSCYK864F8M3mUeOWRD02+qMdGdQZ+rti
	rwZNNxN31z4HhtJr7n3+u5nt0gZW2YohbM2bQiYi+EBuhoItDjGtiEHaWn+jm9mHN1tNrLfZXcM
	fL2Gu8G1tyzCaeJt/h5ZAyhH0xrM2bjvFJ1IZxrAmm8aw2s3FJaPyBiFvzUg9pk75J96aGGMIrb
	MbfgUInWoWfYHPpry3bQonY5igaJFkP7m+gJVsl7HkrIcfDsb
X-Google-Smtp-Source: AGHT+IEsSe/ClhRreVvRQ63LjMBbkjm2VIQAaZkjewE3YafWUrvnIgpv+xribKL6G3lfDQrBgN+ulA==
X-Received: by 2002:a05:651c:324b:b0:30b:f138:1b9f with SMTP id 38308e7fff4ca-3280771e454mr18580111fa.17.1747488483886;
        Sat, 17 May 2025 06:28:03 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-40ac-27de-68f1-6ee7.rev.dnainternet.fi. [2001:14ba:53:1500:40ac:27de:68f1:6ee7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm8663501fa.94.2025.05.17.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 06:28:03 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH 4/4] docs: Fix typos, improve grammar in Userspace API
Date: Sat, 17 May 2025 16:27:11 +0300
Message-Id: <20250517132711.117618-4-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250517132711.117618-1-hannelotta@gmail.com>
References: <20250517132711.117618-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a typo and improve wording and punctuation in
the documentation for Userspace API.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 Documentation/userspace-api/sysfs-platform_profile.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Documentation/userspace-api/sysfs-platform_profile.rst
index 7f013356118a..6613e188242a 100644
--- a/Documentation/userspace-api/sysfs-platform_profile.rst
+++ b/Documentation/userspace-api/sysfs-platform_profile.rst
@@ -18,9 +18,9 @@ API for selecting the platform profile of these automatic mechanisms.
 Note that this API is only for selecting the platform profile, it is
 NOT a goal of this API to allow monitoring the resulting performance
 characteristics. Monitoring performance is best done with device/vendor
-specific tools such as e.g. turbostat.
+specific tools, e.g. turbostat.
 
-Specifically when selecting a high performance profile the actual achieved
+Specifically, when selecting a high performance profile the actual achieved
 performance may be limited by various factors such as: the heat generated
 by other components, room temperature, free air flow at the bottom of a
 laptop, etc. It is explicitly NOT a goal of this API to let userspace know
@@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile names must:
 "Custom" profile support
 ========================
 The platform_profile class also supports profiles advertising a "custom"
-profile. This is intended to be set by drivers when the setttings in the
+profile. This is intended to be set by drivers when the settings in the
 driver have been modified in a way that a standard profile doesn't represent
 the current state.
 
-- 
2.39.5


