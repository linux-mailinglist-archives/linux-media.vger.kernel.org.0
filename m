Return-Path: <linux-media+bounces-25386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7ADA2132E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 21:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D521888892
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 20:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E9E1E6DC5;
	Tue, 28 Jan 2025 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASMatkGe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FF1A841A;
	Tue, 28 Jan 2025 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738096584; cv=none; b=CTmpryhDBr3+Gdb+LVM3bhQtUNvpmrjQp1tQF+xEgQfQpbH3OE1dIYVlFs2tPt/vDzzsGoX50/RMXj+xq+PBDZCNKr5wo9CCMXEW3VKtKfCgVetqi2SMjmX0F4XhukAWZnikIGKi/a903aEfzynmJ5C5Y8dj53wI9cs/45NlFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738096584; c=relaxed/simple;
	bh=9HegVYpmcpsIjCAwYKV9jxL8aEd/LIX5x0DITCw3Gug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qy+yppgqR+Lw+hUiIgWlFJxQm6McABiwmSqBdBrmoMkzADZvCTWwEIClvVWRf20xS70AgF5aiK3X6M45ZIn/UkQ2rZ/4C+jf2kE/xm4NOtTfJfajCfgbPWHOMbHIlHZnHZBXj/pEmEylHnm1dZ6FB+M2TKyELh3TrhQgTu/Aa6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASMatkGe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f22fd6887so6688282e87.2;
        Tue, 28 Jan 2025 12:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738096581; x=1738701381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeS284yiagAUt5myzqhlz9U/p7Feb1MPVxopSKm2pkQ=;
        b=ASMatkGe5b4DdEaP0VjevpprddYxKTiGCWOgLX/iOc7EWjaLW7NL/HNKYc6VYTn0eX
         IdCHrjOIueZAaslYf0IaugtvA8tghU6Xsn8VOXLUDyPwSawIosxyVoIePnvLBTguxkh5
         0dw+2UznpoqrFpXH9hLsIpb+iz2l6PwrYV0ffI9vt82R6s3ibDi29Q6oe6jU4rDMH4lJ
         ptb8uarpd4oOPFvUz9sLB3otw9X3FVxvHjJnootZVUHeYOV4TFrDpYV8Z9s8epKm0wXg
         4dbFQ0vvnFyeHW0cUn6nXaQZYNkAqMGY/+go5cqjYVGqZ8jjZiN8ANooRZr7z6NTHDJp
         zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738096581; x=1738701381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeS284yiagAUt5myzqhlz9U/p7Feb1MPVxopSKm2pkQ=;
        b=mm49MW/abYJ4NU5AJ+kz4kEbVnzexWC5UvkYSPjOvzn2ueSjU1soSd2kzp7Gt3qe3x
         ULiiJeupfsZEj93/TOmOMXTL3n4r9XAN3Fvne/M8Y+MZk1BqWavV2+qNwljYPj91lP+l
         2ZxXGT2JqSwemGhUUybfXdbbjqZvP1vN2IbnTvf4Buqzha103J0b1EYWoPRTudOL7rkJ
         FrKZZpQaecXBSCUjRdOIXGhEx4oJj0ZG53QkM7e7XYulIagOYLFIxHoF3KAERXGH8vr+
         AdtqS8BYk65xg4Zv7pIuFk7OsnF8ZXSorfimHC8nDhzV+uSSIpzHN5CcKU6er8IzSlIT
         lW1w==
X-Forwarded-Encrypted: i=1; AJvYcCUl5JEp/DtVcSvQae6xHHaV5dFfII5WOR+VpiUPc+QbU+ZaXQRUlhXgWRt4OjoU92H3dqVO02+A70oenIE=@vger.kernel.org, AJvYcCW4AuzLI2VJrXdeKQE2jzlItktfnr0BOJ8iclIevzT57xzKz6iV6kBtT3pSR8gVWXhp/AptlB4c@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3kt3o3oTeZ8YcaIEq22l6H4uEOjpfCm1gFVprDFPWeQ3sV2P7
	HpwaBRafUtO9i5UWL4MMZe1BRTuTna1sG0QINtCfg3S3g7bU7vpimxSYA+un
X-Gm-Gg: ASbGncusLS1irT/TYsb8KRq40P82cAHCJHIMGMjqP2HWrj1Ot+ZymtmNYo6q77B7u5p
	sKj+xzPnK8npredUirAjZ5DowopMsd4H2f6ejUkfT7ZMaEtKieOJxYVwvvz2LUhYc1f/xrATYkw
	sLT0XnCpUgctB71MYMvpfKjBfsV24Se9xE8Q75fkamVP0ZnYtOrTBsFIBJCi0PNljpgRMP9pDaW
	h7mOouRU/wmfF4XImIKklsbg18fobSoNpYpDI2HB7oFakLVBTKf97BT2/XvhsIfMuCT1CdrEAnB
	s0/PZzPRi6oFLUD0U2Ge97xaW7gBGUmgzQSHOzqLLUDvSH61IPeQtirciMXBwp3QFFIfLsxryF5
	4xVjYBBHIFEU=
X-Google-Smtp-Source: AGHT+IHcthjhhWNVY7ur0ZzUoR3bMalPrCYYX+hqCRvtnsfoAcW/QdYT3x+76JRzqpm9R+ts44luCw==
X-Received: by 2002:a05:6512:3d2:b0:53e:383c:dfa9 with SMTP id 2adb3069b0e04-543e4c0323bmr115743e87.30.1738096579828;
        Tue, 28 Jan 2025 12:36:19 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fcb0sm1778361e87.55.2025.01.28.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:36:18 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v3 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Tue, 28 Jan 2025 23:35:50 +0300
Message-Id: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKY/mWcC/3XNTQ7CIBCG4as0rMUwA/2JK+9hXFA6bYkKDTRE0
 /Tu0q660OU7yTzfwiIFS5FdioUFSjZa73LIU8HMqN1A3Ha5GQpUgBJ4q3h42Dhx553xIwVyM9d
 dRbWpddW0muXXKVBv3zt7u+cebZx9+OwrCbbrBpYCBP4GE/A81WqoVF+DRHMdXto+z8a/2AYmP
 CBQ/kGQCy6aUhJoVALwiKzr+gWSROXf/QAAAA==
X-Change-ID: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

This small series adds support for non-coherent video capture buffers
on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
allocated by dma-contig allocator. Patch 2 allows non-coherent
allocations on the rkisp1 capture queue. Some timing measurements are
provided in the commit message of patch 2.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
Changes in v3:
- ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
- invalidate/flush kernel mappings as appropriate if they exist
- use dma_sync_sgtable_* instead of dma_sync_sg_*
- Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com

Changes in v2:
- Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
- Add cache management timing information to patch 2 commit message.
- Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com

---
Mikhail Rudenko (2):
      media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
      media: rkisp1: Allow non-coherent video capture buffers

 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
 2 files changed, 23 insertions(+)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


