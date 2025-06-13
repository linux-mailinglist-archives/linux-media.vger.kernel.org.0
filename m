Return-Path: <linux-media+bounces-34744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E643DAD8A4C
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 13:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0E2189D3C3
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25D2D5C9C;
	Fri, 13 Jun 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lStUkEtw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC12D23BA;
	Fri, 13 Jun 2025 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813742; cv=none; b=dxi/p4cAe1vnDMwMgxDbzbcZhUGHZ8set69cqKae35bCMOAPRNU5osHmxNAu2j32NLy0pZJj27i2eOzcMfo+L0WC0QI+LWwRBBr2Lw+ljf6vqBim60oacPZlMTt2iO8xTV87hgLMBcF1drixkcbypjFW2gi0n8/2yropYaV5oV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813742; c=relaxed/simple;
	bh=h5XJn4jKKPyJl4ZR+oCf81faL03F5ytH65S0Mpvxubo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSzOH8jWu5qTt6Uc2jyqNMssUdsqwGc7Ua3oL80trgLYkHjg8DfENnmQz0ULaFL/RfSe1TeKhDG7yavFrnALqKFmTjU6sLtxe/D7bQ0cY3xYd92dyaKMmhq5N325KmqNnvEn8VH2n7pTW4OcwSX5SWBSz9qA8LH5e6s0w6r/KaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lStUkEtw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade76b8356cso388147566b.2;
        Fri, 13 Jun 2025 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813739; x=1750418539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jRErl1Hd6c1H2bSp37oguSwzUv2R5RPWGmw0G5pGgA=;
        b=lStUkEtw75GQNTsaCAwPVVge0OH2qAHmmgr/C7PBrWyi2Tks0AjOdEMTFhur8mxg4g
         WyihMB64p57Qm6WKfxPQLKufz8k2z7BxUUs4u5Ywy9Jt+sTMMH5laDL/wvT08CxV3TYK
         Mm+gA9GOYabAczu42NyMiVgDHtd2mcQvQznwjbmgr40iLod5wyWXqjxIjlDBxG6iEXrj
         ERfsRp2AfvaJrv+NYTHTPgK4rFMVZwyINb30aTSIy05neUR7vIvc/G3kPnvDclK639iH
         Xe8N0mKQ6OV1TVk4Pq4uSoWyhl4MeSKtLPzJIgRhpCkfG/R7jp4WhcvAKN4yuL9iJ84V
         nnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813739; x=1750418539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jRErl1Hd6c1H2bSp37oguSwzUv2R5RPWGmw0G5pGgA=;
        b=EY4B/fOUe3D0Yr7GxrsoBfDFRCSth+G18pYJLzCoV/o/QTzxz0RsHqweUrY/cERo3g
         xLPK/RT4vpLgzDwzW46FQ/9eLZYCoZQU1qE0S3bUrf62UmpHxDMZZwQM6FCdk5nP0CH2
         dqFAt5+re4xeUqEM7n5mRsfiauJ/VdWbnm//vcgphatVO0meK08Dz0f5vhtaGkssyx4H
         l5H0h/GqCXaY9cfUh5EZeAji8jPGp5NoBC0xp2zGt8hM0INM62l0OSxCE9I4+YQqC64U
         ErULY+t3Yzi7iG2XfPrsP2gVBIysgOUsbtrYID+eqRny8kvMZLudJ2NrrsNDrMQz00m2
         AjYg==
X-Forwarded-Encrypted: i=1; AJvYcCVnUwM1mQWIK2Jro6m+jP0B164N/JBsvkS9zqmTIORRzLVnZUAW2CoQN9l9MorZhqXSeIzN3q8WS4mVzVQ=@vger.kernel.org, AJvYcCWMAGfetPpDBSWC9yNnMyD54QRWk6NA321CiN+Mdl56eQuvkRo1Vg5droviP1u/NOs4GiFWQ4eaJ1yeYvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1J70tCIqZEPcfwDZRieeIqsNliwRUEu/8gSXGIbKX/hzTAwjh
	4ZA3/wdR4gqe42Qxpo4EEkWgYGkCiQ5JT0IEoPfwZmrN9mDsNiP30/7D2LQbzg==
X-Gm-Gg: ASbGncuDwD/A7SyTuZ8jenjLTY+T6bL7DUci1mHvqLPd/MAy+QR3dpQsIlqYcLVUW47
	BHlcsp9SjEIDbhShRTk2C0i9pvBmW/cBx6R+6ThVyhICjZQC/wDDHu+jyz318l81p+glagj+NPl
	KkaZ542uYgP4j4ZgP2+rzJKU0ci20bcGhnMLUm2aWMnZKpT8GSk5WdY37bBfqX5SmEoJVKTrhRt
	hqehqccNgIaAmbN3p7PTQ++sssuDZhN+5N3n9HbWIDe8Uq9uL6qvyDUx+3xFWNd6m/SaH8Jurko
	bikM7jazPs+hjGCWuBLb/4BW5yIqlrEGnZ9zfdeeADcCgX5SO2umPrPoL7CP6WZlCAytb5Hcthw
	=
X-Google-Smtp-Source: AGHT+IEw0poj/QFAw6cUUkKrZtgbwtpHCJ4kHnURQ/8JggrN75ucG41fhMexA9oOXUzpkknbm3FjEQ==
X-Received: by 2002:a17:907:8692:b0:ad8:9c97:c2fc with SMTP id a640c23a62f3a-adec55ee144mr247898366b.13.1749813738900;
        Fri, 13 Jun 2025 04:22:18 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b99asm111022566b.125.2025.06.13.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:22:18 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 0/3] media: rc: ir-spi: allocate buffer dynamically
Date: Fri, 13 Jun 2025 14:21:50 +0300
Message-ID: <20250613112210.22731-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the static transmit buffer with a dynamically allocated one,
removing the limit imposed on the number of pulses to transmit.

Add a check to constrain the carrier frequency inside
ir_spi_set_tx_carrier().

Switch to u64 arithmetic to ir_spi_tx() when calculating the number
of pulses to transmit.

V5:
 * add separate patch to solve overflow issues in ir_spi_tx()
 * avoid overflow in carrier frequency constraint

V4:
 * add separate patch to constrain the carrier frequency

V3:
 * move the allocation to be done per-TX operation

V2:
 * use devm_krealloc_array

Cosmin Tanislav (3):
  media: rc: ir-spi: allocate buffer dynamically
  media: rc: ir-spi: constrain carrier frequency
  media: rc: ir-spi: avoid overflow in multiplication

 drivers/media/rc/ir-spi.c | 40 +++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

-- 
2.49.0


