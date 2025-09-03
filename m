Return-Path: <linux-media+bounces-41648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC7B41A02
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E423D5424F4
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A1E2F3C1F;
	Wed,  3 Sep 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QWAJ+P6y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595942F28EF
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891693; cv=none; b=iMXJRH1i8cSifEZUpoGfjjCBqjoqWyFc3ZxNFf0i4TVagvFXYdiAoB0/q9Ho7t81Ebky2/n9Rar7d081kb6fU/bENW5FqeXrDtDmsS4g9GQ6npP0ughCyrIRjSFTbtSlKS4jXjLfD4pm87p+BiswSQt6ujoToCCb+Go2x2jltj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891693; c=relaxed/simple;
	bh=A5vcUWyTNwMbDp1MNbwQOdKbahZxhtxWOywqDTIsHvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bbRryKSQpWHws3N8pH13a2ysJ/jdWoWYJ9MvWhcQjF0Uv5ZL8KxWiz10Z1PeBCgccnjFZ1EzYdh8al+V/46DXVyB5c6DBsCNhaQB9pihwpBR1oYNhwGQeN4vciAIHOV3bdH1NIjH10MSde2wh+VOpcx4ZutmUW1SjZa4sQcXF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QWAJ+P6y; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b046fc9f28bso20415466b.0
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756891689; x=1757496489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KT71c78aJnytQMhNF1V9yN1z/KSnqChOn4nmn+TcdAw=;
        b=QWAJ+P6ynAuTRHAlmO/vWX/elmZI6XZViaqk0tPvvZTbU7UM6Kk0McS9gCs+P5lCJb
         z5AnWOkpitEyfRnwZ/ubmIf5tioB7wwL7kjVmFU7VEEfEdtwz4eZhVLlnAd/CwzC3sbG
         c3nh+ZZoQ9F47fxo6OhoKPUVfpWCPDYnHLCvh8AQdiEGfDKjB20xjCeTMfc8Tqvn/i3R
         JyvyiqT4KaQrOwT+OSalw29VyTBW4Ex6zfYMCSH5+M5LjSIj+DBqiu4X6ZicZRVtXeid
         YJMaZgZrpxV47/ALBbr41J3tuWUo6q9tUF7BWiqVzYI838Bnvm+Pv5t+FsrPPUNPdGf5
         q+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891689; x=1757496489;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KT71c78aJnytQMhNF1V9yN1z/KSnqChOn4nmn+TcdAw=;
        b=Z39Imm7DQ9k+ucr79i86GUohYM5dMi9iUy6DBgnFIYoHxmJRAr3tRaQ46rHncT/axX
         hefB8eOwalxtHI16dT80Lc0POwnvUc5ulVdcTXoUjXPjMbKQdB43jfvnJ2Ji0nh+dIf3
         KBH2OcI99Dj0ZiyvACKvWExk95WarCvpzbMD6HE4hvNH/DRo5v7t+97Dxk1HBa2swvEw
         36lV1mzpwB1AzYlMlJde4EhV5PxRBx47sy+aq/lGXDk9iz6FErIXOQNbg8A4ulHzSaXV
         nWikOhXqyF/nnkSSGORdHRkM+m88FsrjKgCmzTvCrTsBnp7a+VH3I1Ha41mDlc8JR+j0
         VacA==
X-Forwarded-Encrypted: i=1; AJvYcCXbEgVVZ1UF/2lpUHHg5KEJ/7oujgWfh0QsMLE4DKh69dHcsR+aSYdLcAVXpX4avTfgJ2HSDVyJDhYYOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+zEFAlH9Tkm5Vmm2pANK/hH/lmkM169RdprDnrY6aSsPCCs0
	AY+79rxtzA+q5i22QOR2XI+p+3GY5TOvcVn1g7X5iRoN91zSd72HA22qfzxDY2WyXDHlUQqrYPI
	CpDsQeLbTow==
X-Google-Smtp-Source: AGHT+IG4wDv4iN79+PvNL0JjzGDy88GyRihU0bcbVv8rwThsva9C9fXSGG3sjrAuIStIyVDmt3DIgqVwN1pH
X-Received: from ejchw16.prod.google.com ([2002:a17:907:a0d0:b0:b04:c21:7f49])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2682:b0:afd:d9e4:51e7
 with SMTP id a640c23a62f3a-b01f20bde04mr1591474166b.63.1756891689701; Wed, 03
 Sep 2025 02:28:09 -0700 (PDT)
Date: Wed,  3 Sep 2025 09:27:53 +0000
In-Reply-To: <20250903092754.2751556-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250903092754.2751556-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250903092754.2751556-2-abarnas@google.com>
Subject: [RFC PATCH v2 1/2] staging: media: atomisp: Change name to better
 follow its behavior
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Change name to clearly states what function does.
Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../atomisp/pci/hive_isp_css_common/host/vmem.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 547cc480c105..a3fe03216389 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -22,9 +22,9 @@ subword(unsigned long long w, unsigned int start, unsigne=
d int end)
 	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
 }
=20
-/* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx00=
00xxxx]LSB */
+/* clears subword bits like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx=
]LSB */
 static inline unsigned long long
-inv_subword(unsigned long long w, unsigned int start, unsigned int end)
+clear_subword(unsigned long long w, unsigned int start, unsigned int end)
 {
 	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
 }
@@ -45,16 +45,16 @@ static void move_subword(unsigned long long *target, un=
signed int target_bit,
=20
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
 		unsigned long long old_val1;
-		unsigned long long old_val0 =3D inv_subword(target[start_elem],
-							  start_bit, uedge_bits);
+		unsigned long long old_val0 =3D clear_subword(target[start_elem],
+							    start_bit, uedge_bits);
=20
 		target[start_elem] =3D old_val0 | (src_subword << start_bit);
-		old_val1 =3D inv_subword(target[start_elem + 1], 0,
-				       subword_width + start_bit - uedge_bits);
+		old_val1 =3D clear_subword(target[start_elem + 1], 0,
+					 subword_width + start_bit - uedge_bits);
 		target[start_elem + 1] =3D old_val1 | (src_subword >> (uedge_bits - star=
t_bit));
 	} else {
-		unsigned long long old_val =3D inv_subword(target[start_elem], start_bit=
,
-							 start_bit + subword_width);
+		unsigned long long old_val =3D clear_subword(target[start_elem], start_b=
it,
+							   start_bit + subword_width);
=20
 		target[start_elem] =3D old_val | (src_subword << start_bit);
 	}
--=20
2.51.0.355.g5224444f11-goog


