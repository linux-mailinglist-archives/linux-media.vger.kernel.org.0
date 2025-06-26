Return-Path: <linux-media+bounces-36024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69DAEA343
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9735416E055
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67441202962;
	Thu, 26 Jun 2025 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="entpwaOy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A911E7C03;
	Thu, 26 Jun 2025 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954224; cv=none; b=GJ07VYLfmw7aWqn9ruzFwI77t65ERm8lWbWqqfrIhsnvfe+eJ0GbytJ7/4L1tzEa2kaA37PSVmPCx1SSb52sYff+CXllzxrXrWdTvHFXv0jl5ntkHxsKxIGbR2ysvKcreq4iPOoWuRF6QpSeus1uVtpHTLaKo3KJQEeOjEAvOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954224; c=relaxed/simple;
	bh=AQiq4z0xA88o3HSFvbhcfQRTGqMXtRqE6hPl7TrS0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqnO4I/liU0shZv9mg4Rt1ao1ZSWi+PgwsWpSk3DBCBhG24k8u/fsqvlplY3GYNllj7rPgQI8aVv/dqCjdploM13Kgb9WfW6mxssWWmpzadkB7MrV0EWbJ57FsrnJi7N7xIY4ezGnVLyN0vLL3brXG3FvjC9TQs+poOO12eUhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=entpwaOy; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748ece799bdso917686b3a.1;
        Thu, 26 Jun 2025 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750954223; x=1751559023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=entpwaOy+Brf64flOPLBp1+MRfOfxAlCA7AiKaRoha2FXM21NyCV21E6GkPIKSY0Li
         jPPPTV/AarleDeD7mcbNQRXZMYlKrFSqycsvt5waiFjpQuS9FgWKuS66/1+KWnJoBTVx
         UxfTdDFjMIZX9EzG78A+8zvvqcSNItKIgtFIgwfWH9zBoAAdJCaho7ZGgZMen+GSLlYe
         xy4wtE8sYXGw091kThakEBP9VB8EavFnH1FBj60wRPs3W/W2OD772UsVThT0ndEg3fMT
         oDR1G7XiR8Qrz2ZSRqqzqBPe3YVYTQl5XiT/CKJu6+IdFHoZm0IfG1yMmb1rOghirrX/
         hGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954223; x=1751559023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=HopQIPOdimiduEPVfhm3IBRfEJxY8Za5nRzuqCLlLDgy/cLebcTmZvll12gGA0nM0t
         gt6SKfEK2aZ7Y+o8x/iRy7IrN4sTA955uzkEeO4oHk3Brg9GgvtimJjL0qv3Mo4/tY0I
         u96ro24r2LT0NU1hOFqwX/gbbafj7RMi/yLxny3Y2PGF08xLrX7tFZgj27hMsrv3+rQX
         t3Tt1oO6EQ750g4wS/+OC32V/gIk/hgd2EbiKb1EmvqKhrGuhkBN3grEnnrs6GgqV/AZ
         gXSEv5mfAYX3HfavRpeqCzlQ+8Sz6v2eqPVMZ6V909h2Zvd5Nw5FPqAe0HgzfeWOXdQs
         hsdg==
X-Forwarded-Encrypted: i=1; AJvYcCWA2rA584RrelwGIKKdko5FkJksenaBIvpUkHB054d0z/giduf8pu6Y7j2ZI6C/Ek61KWIagCqhSolPq5U=@vger.kernel.org, AJvYcCWcmnqCgSmO6nspYqfTrLg+Lp5V/8BHMK0VAiEgOrx7eA7QaSS4nSM+iauxsXiGAMdIxpbbLSB9qQ7D9Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynI44GD0fmivr7J3Ocrs6Yn0y8ydChqSFZitLdusz7/DSWtDcI
	0zc8FzmtLveAYMh/fqyKhc2jam7PmQ0v94yO8qWtVyiBEefiJGaPlOIS
X-Gm-Gg: ASbGnctQxv6Nf4UYwlXjJfOnkKd7Aq1YnWcDozKOWS+X/ggMDOZWj5mROyVS7IGmEO+
	EDxChl0ofFyVTm1C0+RH5Q7EiSJ1iAdru+tQpmQHwMJLAVGy5PItP/KgGRZKTJfx3yiMDTEoKko
	yB1lrOJh1rSjelNaUFE2Zmcq++Sagx3R6Ua76+hyWS/+K5SE9e7aKRqQ4s+R65AWVEVGr9OACw6
	0lfOU156zM8LAT/n2CG7yIcthtQk3YBAbwfiMXC2cOo3U+fJb7Ub95DPlX2Plk+OQO6BJLy9Ciw
	pJWh2JAhZ9I5jkhoHGK6eJVxMyYWjfmW9TBtjdxjGS+vvzuD9FVAMGBYx5CF6y50RA==
X-Google-Smtp-Source: AGHT+IF9+/ylR0X0zs3Ub5Nxn8yMQupY0tyd0iZN0NmSeaDh2qSacydKHfMjG6bR6+uLmMbB2VYVHw==
X-Received: by 2002:a05:6a00:3c90:b0:748:3485:b99d with SMTP id d2e1a72fcca58-74ad45abe59mr11562215b3a.18.1750954222499;
        Thu, 26 Jun 2025 09:10:22 -0700 (PDT)
Received: from icarus.. ([45.64.160.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540ae36sm114168b3a.14.2025.06.26.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:10:22 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: mchehab@kernel.org
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: av7110: Replace msleep() with usleep_range() in tuner function
Date: Thu, 26 Jun 2025 21:53:50 +0545
Message-ID: <20250626160853.8772-1-pratibimbakhadka@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
waiting loop of nexusca_stv0297_tuner_set_params().

usleep_range() is preferred over msleep() for short delays (< 20ms) as
it provides better accuracy and allows the scheduler flexibility for
power management optimizations. The 10-12ms range maintains the same
timing behavior while giving the kernel scheduler room to optimize.

This change improves timing precision during the PLL lock detection
phase without affecting the overall functionality of the tuner
configuration process.

Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index bc9a2a40afcb..7f6c610579c8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1827,7 +1827,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 12000);
 	}
 
 	return 0;
-- 
2.49.0


