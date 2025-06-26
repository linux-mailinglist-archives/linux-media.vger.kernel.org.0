Return-Path: <linux-media+bounces-36025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4CAEA36D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9E7173F88
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA0920E310;
	Thu, 26 Jun 2025 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AARRnun2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAE1EFF9A
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955004; cv=none; b=sFng1IBGpxcoz7ycjI3n/heF7kvgOyT+5cSlnUzQNXVOOPyoXiy8TXzGrWNucTz5w4zM+f3TyCRaDrfXBPW3HNzWXbiXNa4OeHCzEeBv7RREk+PiJc5lexR8gNlANT42yeI6oqvuFO7bd4e8hV1jc1lveMbwKO+ORiVo2pkSlAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955004; c=relaxed/simple;
	bh=oHxJu3J1I3/pWQoPXHgh9afJCpFm5sCTLU1HKlRrQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLZ5LPycO12jRH+hP+Gc+6HgTU/uJtmLgSj0M9xryiVbZPK9zOoEOTu/P72W8V2zr+ltIh2RkaAsWrTsHKeC9oMLaTIQcZ97W+eZ6wBqrndsRgi/PoicTLrcXXiJ8RgA3myNO6mwoCOP+Q7gjgXOVyoRb9RTQSyLQVqK3mIIdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AARRnun2; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6facba680a1so14266336d6.3
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750955002; x=1751559802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Y+w9GjzC4NkgAs20WBoFAeBxQI03y6T8/aweQBwbw=;
        b=AARRnun2soXLFgaBihH6VgkXNXtdLaYowFeOwhdbCJ+3xBRkRVgxVPiI1zZYTDKggq
         bzI6xMoQqYKo9jWiUVaH6cfXiVuwb0jsEg00xpuuPnh8r4W9iaTrm0hxbNqc0ltZVmxU
         9S7r3ShwIK5Az+NSiPKwGfF9Eb/nlC125P0xZfZr1dRkxC6M5em6r0RiDH5rTbW/GZJC
         aqV1tU0r5JbT3y8Hw7MkRo2ndh6RHDodDBkP89HhmYzeWaYM5lO9PX6be4aDfFenzRGe
         HGiaxeUjzgnPL+9kMtcKKmxDdFvEkykT5pCZxG+weRsR44dtLZmqzmOsuaqw7J16btvm
         btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955002; x=1751559802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6Y+w9GjzC4NkgAs20WBoFAeBxQI03y6T8/aweQBwbw=;
        b=HELti2TrobpZZACRgTtZr0GnwfFS463cuFukY/J59pn3G+OCU4hNPEw2av4YmeKeuE
         UYhmN93DtEYdjHgfQYELgUW5KRAr31UTLqu1978xrosU1tP3f27/3ugOA79pRznpfgJJ
         fw+QhstBtDaZnppV/5Moriy4lc5IWQ3XougE/j7YqdC2RPqJ3ZI/e6NLF7jcG1bNzGT3
         AfOuZG5IxlzvHtoXDaReB1lCB/F9ycpwcwEJ1OodVrYk0bFrKEcGEohCWbIP1m18ejGx
         IQBAXSLtrehvtA78cqa6K6R2kUAGI57JDH9b/CqTKZXs/lqp0qf62lOHtdueQl+t+u79
         EA6g==
X-Forwarded-Encrypted: i=1; AJvYcCVL53p1ef2qsmPGLH085dABwicyoDdqUfo0rjDJTShqhFmpYDDsgRB8UrqeeMrRcj6d+6gPcH+J6hQMrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UVY/V5DMzaVd6yoryhvDkz2tdvXYeEVMhwW2wQAPTPZZhRQK
	Jq3ytnffIQcSJTXJ++50Hp1UIcCancYNYmMFg9Vd+rlxGkWV7eApDZzl6Gd6fw==
X-Gm-Gg: ASbGnctqcaBPChGhbc/kEbFrSp/a4mpm1XSommPoy7i+NbMNqRt6qMcOhMrpjcnqJut
	5HDe4e9bz36+epAn/GvdcEOS14i2rg//nktaw5BeBefvuiS65Sm2RnYQ71iYop1yihYvre/LkiL
	xbyb0JBfyTFzCWp8q5OnsjfjanFmlFL5IaYn5LGIUSlJDLeIEtLyEX27FQYarwky7h4dY+65uxr
	qSNSDypAL4cjtBNenwzW+fAX8pW/zuPsrp/6engv9DQiGdPzFTfDjm/j//Z+F9KoOIZ70VQsiwN
	qV1T0qSSz+g+EUcUIq7T90bwTdo+KSViO5xwiuiVL7FX9TiiENra
X-Google-Smtp-Source: AGHT+IFnf/btOMGRB3SCxsal0JNSMJXM7oKpWz8jKIN1AugEBQ2YtYtDmyZWI41LS0peFDhhYvTuMQ==
X-Received: by 2002:a05:6214:2f8c:b0:6fa:c55e:86a with SMTP id 6a1803df08f44-7001378ca3dmr1843446d6.28.1750955001816;
        Thu, 26 Jun 2025 09:23:21 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::50e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm9240436d6.40.2025.06.26.09.23.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:23:21 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5deb
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Thu, 26 Jun 2025 12:23:20 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] Add Fizz board variants, so driver can detect them
Date: Thu, 26 Jun 2025 12:21:29 -0400
Message-ID: <20250626162235.445407-2-pedro.nariyoshi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
coreboot and I noticed that the cec driver refused to load with a bit of
tinkering, I realized that the dmi_match_table was expecting the product
name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
am not sure if this is the best approach, but adding this patch lets me
load the driver and it works properly.

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch).

Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..a26473c3cd84 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
-	/* Google Fizz */
+	/* Google Fizz and variants*/
 	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
+	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
+	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
+	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
+	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
+	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
 	/* Google Moli */
-- 
2.49.0


