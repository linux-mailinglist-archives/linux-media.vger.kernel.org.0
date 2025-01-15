Return-Path: <linux-media+bounces-24804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B69A129CA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 18:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E9F188ABB4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 17:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB5D1B4F17;
	Wed, 15 Jan 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUX2Qd3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10B1553BB;
	Wed, 15 Jan 2025 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961933; cv=none; b=ECZqJG7ObyaL5O84+rUs1mfPcq0IQrtVzYtBYuCo++8PlYrfdxN9cPe/WTSi68dP3g1RfuoTyoqHd9tdwvCCUuFfixRNK2BJTyIYqyODhGnP5XMgRufma1LrPPiJoazF/7pK5Cq5ernVkFqpnulC0oUSd8bPw66gAFdxRXprRog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961933; c=relaxed/simple;
	bh=JB/bgg3uge0mWDVfpYjBPVb36B8mkbAOJG8MPiHnYRk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YLCQwY22h++i4zwYHR3u6NgZf1oTUprnMmeJyCK+E3369IpnrWJNJx5I5Wjsj/pJ+TR5D5J8kweyrSNaaDMclw5oaG77Nv49qYY8Fm3hEd+e66XE5cSB8yZ4MlXysnKnI+hPo64DgP11szPNwg84MS7QW3/REFqJT0BHVWa+Bsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUX2Qd3e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso66446e87.0;
        Wed, 15 Jan 2025 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961929; x=1737566729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PG/z1baCojPuO4le7CXrUjhogclaWMbiGdswAWPTKTc=;
        b=kUX2Qd3eX/z+O2Ys6m71Lx7pIq3lpzy2mPBlXTAktY2zreBeWZiDA/DMud5tm8/thB
         UKxTnqsaRj3C29ltBd1SmY/HBTBFc31QsTYnETZnWR4iEgWx+OMKgEuHA22BvUti2cQ/
         8mUGsVZXUKdF0P/S400IKJpY3c7zDAU9VsL0p5EQJgj3hFoWLLtLJeRJEWTMJSLu03l3
         mYl24dLCSIbEW35TdeFFdsq5y55r/Gr71SaT9ZIcN6KDasjIESS5NcM+eWiYJlagJmnA
         mylx8ZYp1hpJQWsA4StFGDDNZvT7UHbSI817QZx+jxl7UT5Jd8Qrj7Lr8hDsI8tOaQQW
         pK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961929; x=1737566729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PG/z1baCojPuO4le7CXrUjhogclaWMbiGdswAWPTKTc=;
        b=qimdhkyhogUuHd8Ol1DR9EitQOSbS2zrNvPsOjDhvF1JW62ZHYxSFgsNWT6dewEbaL
         0cpSSKM9bSHwsPiG9sCoVC41E2mUBU3jvu6LFss0QMZXdHFVTRkpQb60qzic5zCamwLz
         QqimFAcGsg1exrkby63W3JiGVOpMWj2IkRGecsB64lqeogMiePRUeWsI5qehdM+nbf4Y
         HVnROX3akWeqClD10yzeytip3G2Nb3d1quFkKeqOk7uzq8zwhntkm4dsSb0ZyW//eDUD
         ipIDX0+KmemAeUBHGQXvQHhkNeZG0M5YwRoi/2we7qf8ShwbRXF3MNPRU/sNLlUb0Hii
         TPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXE9arvAy1TBAtF+oaThazX9407D/LxI2bCpqkLUE+i30CGAd27hD7UotgBjhcrA2hj9GU6KlP@vger.kernel.org, AJvYcCXrINtRQfn5TtvPf5/wgoROov6si1DSmp2KawP4itEYZehTVhwohoiZY3npwmV0LiD192nRUiym3B8dsxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+Q81Zlwp0Nh/z/3YSysAresXuV4XQP6I2n2pPHIQCcvDMY3m
	HV/yHJ+CHbRa5arWbPcp8WpkybKUZDL3CLW00VDOtZCCFkHxyllM
X-Gm-Gg: ASbGncsThT3NyvIkhbDH585CALYsjINk18ib31fFg5HN48eH6inJGWRUfk6jHW/wHLM
	tdUVvqVBJ2dkghOEkwXIxRKZjgMwJxTXbdX1t+9G8SG2fat6XSMqPQA4IhercanuEA9zqOLElHF
	fjY1U+t7WADPrNKQiIcjBXIZ22TtpGLXLfKjB3mR7PPCgtibZNYZ3Dtvm2iBWIGRFpCWUJeKzrl
	2i7K24xKc6b1hXunzdMYhq34kQRffC0DD5B4ZIf/8+e5g7opOkc5XnxazjphZfm8arylAEzWpcu
	q4NNkJzePHE/fM/Z5/FvmeevMcYMkB0SmyPxlIiDFu4EN/0IwMzR
X-Google-Smtp-Source: AGHT+IFtcNnFisb7W8qriHPRdB3XZhFwcWwCCL/Jg5S8tXq5BqcpUH13lXdpxIr2CInw4dZiwF+IKQ==
X-Received: by 2002:a05:6512:31d3:b0:53f:6c6a:f99f with SMTP id 2adb3069b0e04-54284507063mr8355270e87.8.1736961928964;
        Wed, 15 Jan 2025 09:25:28 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6778sm2105360e87.131.2025.01.15.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:25:28 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v2 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Wed, 15 Jan 2025 20:25:04 +0300
Message-Id: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDvh2cC/22NQQ6CMBBFr0JmbU2nYDGuuIdhUcoAE6UlLSEa0
 rtbWLt8P/nv7RApMEV4FDsE2jiydxnUpQA7GTeS4D4zKKkqVCWKrhLhxXERzjvrJwrkVmF6TbW
 tjb53BvJ1CTTw59Q+28wTx9WH71nZ8FgP4U2iVP+FG4qc6gzqaqixVLYZZ8Pvq/UztCmlH5bfp
 1m4AAAA
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
Changes in v2:
- Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
- Add cache management timing information to patch 2 commit message.
- Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com

---
Mikhail Rudenko (2):
      media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
      media: rkisp1: Allow non-coherent video capture buffers

 drivers/media/common/videobuf2/videobuf2-dma-contig.c   | 14 ++++++++++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c |  1 +
 2 files changed, 15 insertions(+)
---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


