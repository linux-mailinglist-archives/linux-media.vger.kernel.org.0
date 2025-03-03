Return-Path: <linux-media+bounces-27325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D86A4BF24
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 12:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF1B83AB7AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 11:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08EE20124F;
	Mon,  3 Mar 2025 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImUYuPRt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF7201004;
	Mon,  3 Mar 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002018; cv=none; b=CS38JBP7iTok/wKBPASCGHEEAEhCFJmtVJnyasl3mpPITRKZ9Gbmw3ndrQHxMwsCrBKIV8DnKHrYCL06tU8Rh3R4XQNeWHyicVkGSAHS6mo6NzzbYhczq1zszOF4FezO9icdW1e40ZkBMMrn6iiLvdmgvGyT0S8TFqLeDLsWNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002018; c=relaxed/simple;
	bh=8N2x1prHCqsw9SKleqTPzrElYsqqBHYR09odxC9PM4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ah7I0AWv/covMZjcN9q+YnRVpfwEq8MY/giq08npSTeVKCzbeeyjmZqwWlv41W3Xg0FyBA0Mb3yg0gJrRg8q4P+CqUyjdepPGuNm2pxplgGajCW8ph2f1PxNaO8F+Kizw4nCj235CSFRCyzma8uM93XJ4+bvfFD7S7CDfr34fwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImUYuPRt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54954fa61c8so2924881e87.1;
        Mon, 03 Mar 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741002013; x=1741606813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGsNFf+UfdU9W8kSubEW5P15Pc45666u5Nv+Ism+9VE=;
        b=ImUYuPRte7+/9aUW/pXwvYlZtDxzDtU6Yik9rmYnaaBjPllPKam8VaLhClvvi63jVk
         h+TCeYiWTcZaaWAUqKuOYBd5tc5QDn6ctvz2yxAUqJ6feFynbPmbExMyYLiERONl/15E
         ywGdQhgiQ9dqRY8M5nIvL27ucd7poFOtGooW3szXbvQpAeNnHLkzFruehHa/0e1Rzrmj
         q8CryoRgf896V89yHadqcvAolmlZDeJtBdqssYhB/4tt/HeIcfaOZ6rW/VA5mIvu4wQT
         b9zkQurmoxWpFMPjlYnKzuEPdjQx6u2jeo6ODDcEMKmDZvQcBCWU2KO4DOn/mLsHO6PR
         opRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002013; x=1741606813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGsNFf+UfdU9W8kSubEW5P15Pc45666u5Nv+Ism+9VE=;
        b=kPZq2AoHuaWJLxUggZiZFy7CGdKVj5YD1QkbpimUhToSFsNsdjT+RoKZ2ATrSceaQs
         2pycTU88nreLXyjsc8oEJ8hBoxQb/+Xqhb1HKn1i/qABE10t54SjUVzMXRag5W5z0Mkp
         noed8ew/xYimylffQRIFG2K+6nhefpBHwX0Mh/XaXORJiVx4Xt/GgI8vQ0/+4hRAQ0Rz
         WDE6GdB+++rVQYTdr9YhQKvOr6zPmY8q8P8NGO09H7ePiWmOKBjUKkmc2ht5YJtQ5WXj
         kzgIgPmhiu63qMzFE3oovjAouz6b2m3rRDyV9r0GzHCnjMidlH+wsBOjR7RkhrKQDzFD
         ykxg==
X-Forwarded-Encrypted: i=1; AJvYcCUoHIf7tu7HkOZJogX1pEJBU3K83LUQFPrxFdS+c/kRm/XAw2KoJ2wGy4mhjVtqyk+dmTj1YZv1@vger.kernel.org, AJvYcCVjY8CGkHmQQoWzCAHabOd7762oO3YVzQxq9B9ySCxMZlsOcgJcIRhUMPdrPspXvxqeFhld8KNAigPV/70=@vger.kernel.org
X-Gm-Message-State: AOJu0YywbdI+NSlebtmyeInvDQUc5IBb0ehFY00EbN+MR0ZVvfNrpVTD
	0ZAEJD7QNfakudZQdc3Z7OM4JLqioF93epzM11lnVcjKadHmhud17nEpfZGf
X-Gm-Gg: ASbGncsjltf70VoLXSnWXd6hXO0K6AXK4B5sPvKRAnnbtNxw5L5+s2DkMJyLAIUM1wJ
	OSIsd0Hiyu3rpK4NnSLiQ2ihcy8yQDZXNPRj/xTI4xWOEqbS6t00OP9vLUQsAhBNgdZfbxftM24
	0YjO8ZC8Zifo6UktIbgJBX7V45vvYTXfh/IGfyppoyhb7P9CoNbYH0dqJCDmDBHMZnVWvpbAWDq
	4MJyQ9t0hQ8fFrxFpsR4KZDW17aLXAaSc/yCfjvFwPTrM4AJXoxCY9r3G7zFgPejWVW2DNsbSzY
	4p6ML4ua4Ipp6S1tX3LgXi97eobZxUJRbTmakq1UBIEVCasvyRIlGoVoaBQFQWUcGVRNfPC2IPT
	44B5N9LOQn3FJV50c2KWPeZZnpK4LRIr4RoQLKErP
X-Google-Smtp-Source: AGHT+IE6TYJc7vhbUwCxB48YuKMrTqXMOVFOkYXJN/faNQ19JttNP6FSxSJOeitCW88+hzBFm5/lpA==
X-Received: by 2002:ac2:4f01:0:b0:549:1c87:af8e with SMTP id 2adb3069b0e04-5494c37f6d9mr5827800e87.37.1741002011703;
        Mon, 03 Mar 2025 03:40:11 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54949de706fsm1125399e87.23.2025.03.03.03.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:40:11 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v4 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Mon, 03 Mar 2025 14:40:08 +0300
Message-Id: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiVxWcC/3XNTQrCMBCG4atI1kYyk/TPlfcQF9N0aoOalESKI
 r27qasiunwH5vleInF0nMR+8xKRJ5dc8DnMdiPsQP7M0nW5BSo0gBpka2S8uDRKH7wNA0f2d0l
 dyZWtqKxbEvl1jNy7x4c9nnIPLt1DfH5WJliuC1goUPgbnEDmqZagNH0FGu3hfCN33dlwEws44
 QqB4g+CUklVF5qB0CjAb0SvEKz/IDojLfW6sU1TdUhrZJ7nN/E04QhCAQAA
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
Changes in v4:
- rebase to media/next
- use `direction` instead of `buf->dma_dir` in dma_sync_sgtable_*
- Link to v3: https://lore.kernel.org/r/20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com

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
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


