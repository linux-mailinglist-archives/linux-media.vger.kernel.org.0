Return-Path: <linux-media+bounces-33110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA09AC0ADF
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584FB4E6F49
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC1E28A71B;
	Thu, 22 May 2025 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Utx3SMOZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BB28A3FC;
	Thu, 22 May 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914828; cv=none; b=cJ2KCHcU6VhBF6bvyxDVU6n9OwzOJVeR2zvMOFtRfG8OVOLXsrNemu3xHSZ70nGCN2P9gs4SsSgi4FzivektE4sRU4d0O9tXEZaupYlT55jRN+CWXIQc/BgTqJi7VtYuTm+8UCWqlDsH/pRRBuBqZ3tHtcuFcjkRhl2pt9GLzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914828; c=relaxed/simple;
	bh=Mg7qX4I7qYfvYCd1yjRtE6Q0z11dgZZ2/+YP6BRNSqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILAUWFPdodKPmZZlOEzx+fgGrbxhcev+MBguKDKtlO4NQELa8Gf7k1HPOgSKXTexyVAPl/GZqv7vDzuu06GFGbPjFj0Ro3oTkJEU2WwFMC4lUQM6BBAarzFXg+VKfKPZKpVmJMb2mnTOV0Bh0oso/KJBW+G7U93v1m+J5HRtESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Utx3SMOZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-550e2b9084dso9121755e87.1;
        Thu, 22 May 2025 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914825; x=1748519625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhOX9eggKzblhpKFsblCKZYMw/3b9yOOLEO13B9qp7Q=;
        b=Utx3SMOZurm20dWZOc3S3XQqvEHM+QxaJLlnA010tnKVXIOjPHUjadtXiGDdtRQ+HI
         V1zh5wBn1YN8ZXPKAFEMpjiJ7oZTxsSAFgA0ZodYGEmB74rfUNMkN6EXWOPOqjNJUBU9
         bOp6tYW7E6uZS3fHF1FwO1mdzk8MZe159ZhoFZ9ZmKdUHYyGmqVavOSoTcqVxIU3eMSV
         xH3AYU0cX6xNDDNsZGb9XxErU8uNShMwHNYoWWT9MuU7j5vwROO9IZ2sVjPQEt5ug6XY
         pnwclSNWHP+gseafHKpZEzEG3fVMII86pG50U360sJPn1uRbWVW+3ZGtRGUKQwpIhUTI
         NNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914825; x=1748519625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhOX9eggKzblhpKFsblCKZYMw/3b9yOOLEO13B9qp7Q=;
        b=jJb85Fm+18m9gsbOUw69Ty1NtKhcoZnQXp7wspAMqq5VygYApkDUbeA4Qsdnk6WzmN
         IShldxDiwkRZ+ksYZAbjhlZLB+QIK5rbLTTWsnRuTxQePngt84ehsWfQCnzvOn4N8JbW
         QjU6w3XqoUtdIOqnPZMqY4ghu30mHSYPj/svFUzSWHRmzmD9tTM/ZNI3hIXjOxsOMnF4
         RIFJLyF1HGnvugsbWktArm77w/DffxY43AEaCQ/s9NQu6OkG/UWN+BMu6flCpllowxQe
         5NUh+EEKlsDrXcNM7vtqMA3HqkDqRsYtQRq/L/pSP0OnL+pL/zpTSgXXF0IsH2NfYFE9
         aaog==
X-Forwarded-Encrypted: i=1; AJvYcCWsWToNDwLIIj80bI1J1nW90aSd7gabFi2s940AISewjVxbr03c7rlvqNPSUo+8R/ob/FSMjGDEEMN/IiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EU3sSGQlOwM2z7yfV+VTCAHSlpyScWAk0SPkz/aY9FMsd3yo
	qW/kIl8NZ9GkOArjlKsA4zQD/mQXAv8LZlemA/tTKgla2BprRq8Rw6cf
X-Gm-Gg: ASbGncsvUU8r7LsfOC5YuHVvBI7MB+8o2CLjyq0Q463adtoEoCkHA98bd3zrkd5OgmE
	XBV+GKwrVwHk5bDl1pIzUcSVWdiZoTm/msPUWBmQpkDwrWkfl4yYaRYc9lzw82Zhsew3+WibQng
	nTPFneB+iXXBo7NJVamgLAvExnaAsR6uOzyIncDxsApJO5Vd7ZEXjV/R/e1XSHk9/mRRTWsBnlJ
	zmFZt7blLCoQC8Wq6ryCP8LP2Li/JLHh68h3sWZxepNOHDIbZpGGZsizPfqRfLpVTFmIF21C7pN
	sZRNto4SoF8BPq0ENHjBrb8AQFNavTk7aDxBim8i6dlVRcZz5HwV3Y+lvYqyEuRrXLE4ubKutfD
	1qI5/W+a6IqKqxKONKUWf6bMxMBd1NDgIYCQdTGOTNEr+Jix/toOAd2eB
X-Google-Smtp-Source: AGHT+IHEu6igARvex4pLKN67zsQTJTB2aQTsbDZx0BPl2mbP8nmToiz5iTopXp5wnV0hgYgTHrkRVQ==
X-Received: by 2002:a05:6512:31d6:b0:54f:c616:ee28 with SMTP id 2adb3069b0e04-550e9906d2bmr8236399e87.47.1747914824718;
        Thu, 22 May 2025 04:53:44 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:44 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
Date: Thu, 22 May 2025 14:52:55 +0300
Message-Id: <20250522115255.137450-4-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
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

Notes:
    v1 -> v2: No changes

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


