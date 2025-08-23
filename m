Return-Path: <linux-media+bounces-40813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B0CB3286A
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 13:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C185A08CE
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784D5258CE9;
	Sat, 23 Aug 2025 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4pM2Uq4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B838158DAC;
	Sat, 23 Aug 2025 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755950254; cv=none; b=fssq16OEv9Tk1+Iy4unRGBybcfSW1QGBRdINXZQhEh+ghdjC3rwfy7MO+Vl3pZJ0PJ384uKXec7p02ZRxGAZAPP0Snh+LqcRe0S/o4av1LM4Ogr1t6Yq2wv6wnBgJcbufmypYg4cHzQ2vMg58jdH8zhSwlt/6t1cOh/RwIqusgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755950254; c=relaxed/simple;
	bh=OQ/E4y9kB3rGINfiUnkpCWTQCdSgM4fZZHZXppCOuaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=upawqaonSEUBMcr9BaKEjYjr/HSRKwcemXIYCQqSA3qXSGP4MJe4za4e7zD3lw46k+3NxcKn/laEmJ9QU0qMu8Ii1iZYZA9dd31KHD54Cgh63pwV/snNKTxemP/ja8zV15im0y6Rq6BiIXPizvX9PQz0EXbiD2vFAK5tzLp0+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4pM2Uq4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-246181827e9so21190605ad.3;
        Sat, 23 Aug 2025 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755950252; x=1756555052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shL2fhdQ891TB+Ct80rXzlQvWNofQxPpdzFt0NH7YFc=;
        b=U4pM2Uq4y9Taei86FAssixQKsrwjk2gvJqdNbAB+6cmveaEUPJsUZOsH//DEh391eg
         uY+SvN9AyY5V1Hs8PMfDWiz1ta9WqTi0xj3/p1eVtKUimkJDSBAecv+R4iYaJSZyta5E
         GYsUuxZ9iU7wl+R7+/iI4/ZcpnpH3yLE9X5cyRDxEXyP1dW/f5wUX/eX+uTpcEEvrJ3R
         w26wOxlPyLpzEiHQycNqff0sCnxW2ylhPDq5uKqUun8Vl3yFrUIM2gpAvitlI8lfiwph
         3vAkBYvPyfw6FjmK++qdHLxuNWt2hib7xr7FPGGUTDXdVP+8Zc8rWidglrDR2GOMPNRo
         UguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755950252; x=1756555052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shL2fhdQ891TB+Ct80rXzlQvWNofQxPpdzFt0NH7YFc=;
        b=EZepoIdh+Pq5k0mD/SmfQwC0tR3fIKQ2YEB7zPzunfmbeaQylz/LLEAKRs3lcBhSSo
         /KdCRHBtiXwfaKMwefeVPngGOeVN4mWmRyXnxsz0sSvaUckvzXw75HLHyt69dN/SL9Ns
         yDkWxkGVJ1yaL2wKzZSIIpddx1mv21M7yRLlRqT8Y4JDsHt965cKmHlS90z1zn/BhLH0
         4w8hnApZi0YJqPuti8VwHSKZuxNrCZV/2KQ7f7zT+d+O0V7MdFc4AQtLipkfFGXQTqOU
         MS0SGunSg/pzG79hEVLBksgZ+YZd3KIFpmnL3DLrbFSG6gxYaWGJ8no2+xLDP9CiJlQN
         cV0w==
X-Forwarded-Encrypted: i=1; AJvYcCVvbwwLYywQdCSzscyq2SQusVhoyL7GD+ankEXQvo+CLlt1niTM1eXRp3iDZArR4JWYfvuY4pbhgLuXbYE=@vger.kernel.org, AJvYcCXGekRF7itJxS8n/qFLDtGZ9DLoZhmiUah6I5fpwByNb11nsUAN2GQR8Af5jex26yZcBIeEl25N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ne49tk0CdVMmM9QAfT0JqwlvO9cIhnlsMxpK/YymdSvv6cEV
	2VZqHnEf3Hsl93EflJi9EqW5ZwEDyjEkiGRC5UFREKLOhbmynLfL9YIUNyxixOKh
X-Gm-Gg: ASbGncvBK4NOAs71F454csKzGpvxWjBIpe625Vn8e1jkiM7j6pw9m1SWaAypDR9ZR2v
	c92d5XYaRqaUO6ceXjXKrz2R3IHWNc9Sd7meL07lhyW6lnIXId6nEa8aCKYCB6iBfOxoWVROAz/
	MV2fBseMRGO6NOFvvYCkCJTLysWmO+lOtjyJS+qpIiOdVsFzBlKI2BtJRbejm8zQ6mwsR4PY5mV
	61TtHIiQbIywoAEPRxiHyBfHALLZNQ2k2L/AeoLqGAzgVfYAgezzAe5cGQTOF379liVnb/A7BQs
	bbRoUq927NnzGDtgFZqj21sxiEamwQHHn+2Chg7K9tBhdN/m8E1DRDV7dV02zYs3fenO/N2h5qi
	W7vIlHlj2YV4u7EUL/R7ohOKfIX7jbe52IKRkcym9SZp/i4+LiWUjsSJ1QV0g
X-Google-Smtp-Source: AGHT+IHwCdLyQE3C+sJEfzFoZBM58bhwCO353GeLHr4KxBadFDsZEsS50epSMYoPz/scaHs+CarK3w==
X-Received: by 2002:a17:903:32ce:b0:240:8cb5:98b4 with SMTP id d9443c01a7336-2462ee54600mr84241225ad.23.1755950252443;
        Sat, 23 Aug 2025 04:57:32 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c732sm20969715ad.1.2025.08.23.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 04:57:31 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2] media: vidtv: initialize local pointers upon transfer of memory ownership
Date: Sat, 23 Aug 2025 20:56:59 +0900
Message-Id: <20250823115659.1176464-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vidtv_channel_si_init() creates a temporary list (program, service, event)
and ownership of the memory itself is transferred to the PAT/SDT/EIT
tables through vidtv_psi_pat_program_assign(),
vidtv_psi_sdt_service_assign(), vidtv_psi_eit_event_assign().

The problem here is that the local pointer where the memory ownership
transfer was completed is not initialized to NULL. This causes the
vidtv_psi_pmt_create_sec_for_each_pat_entry() function to fail, and
in the flow that jumps to free_eit, the memory that was freed by
vidtv_psi_*_table_destroy() can be accessed again by
vidtv_psi_*_event_destroy() due to the uninitialized local pointer, so it
is freed once again.

Therefore, to prevent use-after-free and double-free vuln, local pointers
must be initialized to NULL when transferring memory ownership.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1d9c0edea5907af239e0
Fixes: 3be8037960bc ("media: vidtv: add error checks")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Improved patch description wording and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822065849.1145572-1-aha310510@gmail.com/
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index f3023e91b3eb..3541155c6fc6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -461,12 +461,15 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
+	programs = NULL;
 
 	/* assemble all services and assign to SDT */
 	vidtv_psi_sdt_service_assign(m->si.sdt, services);
+	services = NULL;
 
 	/* assemble all events and assign to EIT */
 	vidtv_psi_eit_event_assign(m->si.eit, events);
+	events = NULL;
 
 	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat,
 								     m->pcr_pid);
--

