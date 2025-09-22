Return-Path: <linux-media+bounces-42872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F2B8EF58
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8803E177492
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3803A1F5858;
	Mon, 22 Sep 2025 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ39ONn6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CBF1FDA
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758516827; cv=none; b=Q092ARDtt02SeuYtU/yHfRAxuphMyvptXAGiFnfjjY9GdnhtR0ylkxZjy1LArGhDWaPTUb6hnCYGy9Dlh9EQpMlc8V+GFDYGuoIxmsADvwnYGpgeUF1Ha87+SJabg1n9i6mSE7TdaVEDePjgWI/mA88G8OilAm+lhL7tnz8qujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758516827; c=relaxed/simple;
	bh=R4BpydptfYN3o2mCLvyEh4whce1vNzMChCA1I6SaaVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNbbdD3LfL1a7CmploSbonieM7OA0yfRyYDY22F6uRPLxa09M/GBCW7xfoLpTc49OPCcyu4j7D2D6TmWlZDtQVT8UzB16Nxmxt/JPhtvedoUCBdAVegLSk22Jq/3hud8v3fr9/cqf8TfOFmusv5BNUpGWl+XcMDwF58MlNo3QWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ39ONn6; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-635355713d9so752740d50.3
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758516825; x=1759121625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=SJ39ONn6jPzBkB5dz+soNiATt+8T7bPhvbz90EcaPYb3c2V0aw85aDdeftqgHuk8EF
         6OiTCNNoLN1Ku/KMHCUPi411P2WpHPn8QU4Mhw1YAWaATF8/WPnFwlDEx9BGTW5Jrafp
         YwNV7XqODSTIq9nRYQGhUFNA9XOQ4hDpTecPA0DQ0Fq1tVc8P1n5KAd8yxjZn3a8i0tC
         hiwsU4jd6NhQ9dJcYLNdSHr9FvB2HsnZacDhER0tLSMDh6+BD9etrOg44QKixcoS525X
         qGmafuJwkgpWKeoh8DGq0Mhi6p4V5BZcuYMmEC3M2KahKBt15X4VcR5Piu4Fw/3DBvIs
         UNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758516825; x=1759121625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=Ad4FLMcd/a2v+csMI0WRkX7S9HoMEbFGVe+cj1h2miB7ohp69wepWInl+yU2+OJic1
         9oz32US8YekOwBQJjs7KZvoh9iVBf/44ug1eRH7L557nLI1+jT0S0JrD6ItlbHVfAjld
         RiInurOG3RTyHt1gCEvRJdRufFZ2oOD1eF7V2tH+16KctNzB010jI7jA4PIisdhfIMh/
         OrpxSKGzD49QyS4hMgdenewyxk8smpifaroWSxBKe1VZZTvFM6wRwGJZIojaOAs0+8C+
         GTmkB2UK6EvuE4l8xWrhxfRgEyd/8y1lHvSRF43D5DW6+l1/4JH9Oz6kHBmEDA7i4cxf
         jmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxH64bLfPeR63YwCPgADMN3ZCT032qcwi/YxqSVR2lgFu+fvnOTlSiwnVdId748fs6b9Jhoe17vMhnLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AM+mWYWT4l8L9lw9GnvykTmQaud9k+m6hOYSSmppc4N45y5G
	UQ2cE/ddwlXSmejvu7cYhb7UczqPPczetEMxvtIcTKviJc6Fqq4djpcj
X-Gm-Gg: ASbGncuBIMkgxKEQbkj9ekRL3JmVFb9o0g/4WATveIWdqMqRqWis+sejF3sUETjnwl8
	V65J6KyOqlrirD9TlcymTUh+oVZAaxAOZM39aaUoyfZvW0Zwo69peuqB3fDZBedMUR71Ejnmfkn
	lngD3L2KaZsvI5tDUX/Fiti/Fpv1Api9FELBER1mDmNuoxQd7Piv3+JM0YRrXY80RM3KUmzV6ig
	uTMYX6/XdNkmsH4amL1iOiRNCC+yn9SJ80ap3s0zFvCWjOy/Wkryix2rmnItpak4YQq3tV+s+Br
	Hj2CGv2GQnQMywp067wIxTqOPemtPXNAb6OfFerqhr5w5MOL3xlk1ZBVpcceJXL2XU61iIZWW7J
	7LkIvZuziKdegVHmF4fNw3z7s1HytdKFFM+mZ1r1RmmzAXHIWnTFGa2NYErPfuGPX7H4dQa/Mg9
	M8+K3RNCm3k1KHbCWTxO+upoUG63YABQ==
X-Google-Smtp-Source: AGHT+IF8vlQDlWIOABf6wW3SdvlnGI16JI8T1UNVZOSc+psQY1uUjhsIYqq8AHdZRMc/72dvevUKiQ==
X-Received: by 2002:a53:cb52:0:b0:62f:c634:4b3f with SMTP id 956f58d0204a3-634779ae1e2mr6763489d50.7.1758516825010;
        Sun, 21 Sep 2025 21:53:45 -0700 (PDT)
Received: from ubuntu (host-101-28.flgauca.gainesville.fl.us.clients.pavlovmedia.net. [153.33.101.28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-739717173ccsm30912107b3.30.2025.09.21.21.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 21:53:44 -0700 (PDT)
From: Jaiden Magnan <jaiden.linux@gmail.com>
To: hansg@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jaiden Magnan <jaiden.linux@gmail.com>
Subject: [PATCH] staging: media: atomisp: binary: fixed a brace coding style issue v2
Date: Mon, 22 Sep 2025 04:53:42 +0000
Message-ID: <20250922045342.21307-1-jaiden.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Jaiden Magnan <jaiden.linux@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2264db62c818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -498,7 +498,8 @@ ia_css_binary_init_infos(void) {
 }
 
 int
-ia_css_binary_uninit(void) {
+ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
-- 
2.43.0


