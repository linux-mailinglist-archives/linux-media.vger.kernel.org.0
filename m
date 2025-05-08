Return-Path: <linux-media+bounces-32025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA0AAF784
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 12:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB6891744FB
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BF71C84CD;
	Thu,  8 May 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etw+YE2v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CC91C5D59;
	Thu,  8 May 2025 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698930; cv=none; b=CFZY9zCiYH0bZPiX49Wli+LtpnE5tG0kZ3sgL36VeRacF1uEQb0GuC8SXhzspS4l3/BAwOrNqi0CIC2ws13HWpK/r8DZRx2ogfSYBwfoLxN0pz0akFbNQ9mNFu7o2ZcDFIivjTryoTsfT5TyEZfdTenIEuHs5J8PYw+lTCebceE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698930; c=relaxed/simple;
	bh=jE981OKiDJArMCxAhfbnrFBr0Jncd4SYmMkp9KmBFbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ilyDa1O9HOL4rAHSmLbDxqokhwUqg4EyAq9WfxQPCFt3iPxLokki4SJon3XeUMu3ht95goKAS8h4dNV6Ela9dAaGYXcM2h0rDeNo5g8mmE8i4yUN+p1GBSeYlLitIDaJdI4nzCKb1ywGIvfTW5fhn/1yPBwbBO7YJODtpCXUI6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etw+YE2v; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso165124366b.0;
        Thu, 08 May 2025 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746698926; x=1747303726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/yggcqTk0XsV8ZLZmi4xW1R5HqwyeXBRnVnXXBXzi44=;
        b=etw+YE2vBje2Lylq0+flHZi/g9Fjg4V+7oFuJT9Hcbz2drH0w7DMp5JR6ZbqEyM442
         9+6dF0s+3h4IVJ4p13unbm8aXdrT6s4l3Rijt6K3BqZSICMdSakw3wUy0Lva0c4ecMHC
         5PfhFThKxzvb5UgNL3+VmjpJ4538LxBVTcFy71tjPsYTCX+115wiwzGSStY+afBrTQmX
         f6ELSIwN4VX8t34Q/QBcsMpDd8e6vMnKSzDN1vPcPLMoFkdgcuuUJtLr9Js0igL9ryfS
         Rz+SvPYeoIOuSjsgPaX2Rizg06T7raFQILznlknjaS0wIYCRAxUQ5k9XRt6XfUz8xpaS
         CZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698926; x=1747303726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yggcqTk0XsV8ZLZmi4xW1R5HqwyeXBRnVnXXBXzi44=;
        b=cQhYNFQcUZCb6KETnDbZi8jsNiFtG1WJ32c5vUIF5sVJG/iWrqRURACazFQ+Ddagfs
         4qW3GI5Ddp1Y1HN477/h9el5VAkDKRANBBxnk5FqeGo7E9NzCX6e3F96MSWBIKYfO3Xa
         +SC63Zwq0aY120L+1eoXDyRitzUaLSWmkVemPXu/yauJ2cLuC8jCX8a5cu8NGljp3w6e
         fVjVAbHycLpjktfp9UBiZf+VTnwrL4Nx60jLIKw+wpr3BbHatYNY8SKeubas4HAB58Ik
         JKtTSwaBvz1TyOGvmYfuNmVcntUzbyELYUsRuL1mCls2JKXiZix9kvkaM7ha7uPlHW1D
         L3KA==
X-Forwarded-Encrypted: i=1; AJvYcCUxEAFFBc4FP1Rf15zCCHY+8xMyL4j23BRDA4JNSzD8iGf8gBZHC8V4ygCKsvSgLGiGLKnf4BxvpuDOH2loTzg9UsQ=@vger.kernel.org, AJvYcCWR5l/1K8E2yZXn7eHVXTFVT9zBVnmnBUzJOQ2N9CUW4D1NWbQe3exL2t6Rl3aY89k79u8IEfmWppCx+qg=@vger.kernel.org, AJvYcCXSoQExMa+wZk1BKObVlz31rskT5wjUixYCfnC/tGCXuIkZgLlll/fOeDjQyCHmTkwcM1hPH5hmbL43LEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXkJYg8Rc/spb63KJidY92KOsn9bGQftuiNye1BbAAngDChb3
	1WDbMw8QxKDLfTuXfjLigmlb0o9lM92zDptIybaK98S0kfE64091LJycM69dQvTOiQ==
X-Gm-Gg: ASbGncv77bEbJNiSInpRn73zaiBsIAcKHFfMUgzJK+9wP99nD9rDrW4hkPb6JyNXaXn
	ogXDnlrcXINk/396dLpkpv6bbU6HhiNK17NO6+gL86AnXzVXdA2P/tzp8ygauR04DLS1st+hMBY
	KQvbN0/7LnFwmT7GOhdffeF6sGYBVdX19tZzxLbpDff0KZiwLDdPQB6Phkn8B3aMwbL1E6E5fXD
	jnt9Lf2ZwZEE3SzmHxKbk5dbfbbnHsd7jD4GQpMqXwVPuiFig+cJC/BRVqkIBVq99cFhS3zboHj
	N0iNVLSMWME1gRnNizTMq4gHRJZeFYjFPoZcmNc=
X-Google-Smtp-Source: AGHT+IFLWNwEqwwL7ySlndzs3w8P+oDxqOxKWrfiQG9aG8cFcpataBaGlfldTtB7XJlIcIUGavdlKg==
X-Received: by 2002:a17:907:a4ca:b0:acf:8758:50f5 with SMTP id a640c23a62f3a-ad1fe674462mr270453466b.5.1746698926348;
        Thu, 08 May 2025 03:08:46 -0700 (PDT)
Received: from localhost ([87.254.1.131])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad1894c0202sm1059131366b.93.2025.05.08.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:08:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: rcar_jpu: remove redundant case statement when c is zero
Date: Thu,  8 May 2025 11:08:35 +0100
Message-ID: <20250508100835.336240-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The case statement where c is zero is redundant because the previous
while loop will only exit if c is non-zero or non-0xff, so c can
never be zero by the time the switch statement is reaced. Clean up
the code by removing it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/platform/renesas/rcar_jpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 81038df71bb5..6af154b41eb4 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -643,8 +643,6 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
 				return 0;
 			skip(&jpeg_buffer, (long)word - 2);
 			break;
-		case 0:
-			break;
 		default:
 			return 0;
 		}
-- 
2.49.0


