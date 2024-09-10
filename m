Return-Path: <linux-media+bounces-18118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85041974132
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9811F22B5B
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698E11A38F3;
	Tue, 10 Sep 2024 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxxVjaA1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1516DED5;
	Tue, 10 Sep 2024 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990862; cv=none; b=jUXxe3MqBpjH2aCJVr6ed9mF13sf6kt/n4XCG+FLxDm3zuXqmasquxj54zf+hUCsf1wBKtOaTkOAkwyuI8JPeHGLvE8FgWa/fkZh2xtzxWtA/vPQWsxXD9W+xd8KaTTo9gmNQRd1qOBWUXlFJjDoDJluACFRwGm6CwiVedvqCsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990862; c=relaxed/simple;
	bh=NlSjka77y+J8o4ScRfds9q3Fu4ziU17R6W9K0mJQg5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vEKwHLEO8DtWvSkpopLvCbVH0+QYPeOGkKJXSHfktvGGob1gBlsBcrVj9rh+qEPxOfu2wQ5xAti9DlqpSEkVqW5olTIwko/7mzpMXu7txtDQCMpahdIT3/V8Gk8YaNtF8oFUjkaJKes/FdGRHN4mpmSe4xbjKinHKdXOKDpBqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxxVjaA1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-375e5c12042so573260f8f.3;
        Tue, 10 Sep 2024 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990859; x=1726595659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lnrn0tVafziV/wQlzrgAUX9MZJP0JQ/xVWaaouixC1k=;
        b=VxxVjaA1caXvor5nBBYaRP+ttJmV+5BJ5JGyaPO8ZwpREWTxdxpFu6X9AU77CwuCxY
         qZi7uaNlySR/iWVIN4MxzqRSLGJiwh8+SNEMtbwlzkBpC/uCMzO8i7NfNriapmvOEPKM
         dtU8p9HwdDa2AB24gNl+yp4jzcs0TqzR9SSeQu8qGO353DWe6qTarZQpfnlGVNDUUwYt
         jofLDhBa+h/psRptk9kfWK/XW2tekPxd1ko8INVNYZpH7RBRdjUNBeEHp4WWf2A9X9Q/
         FdnO1D+gHy7p8Z+oAJ0EDyZmv7FurAsh8tNblctMyjItSR7yCxUCQMR0qkJjabKDw02u
         atCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990859; x=1726595659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnrn0tVafziV/wQlzrgAUX9MZJP0JQ/xVWaaouixC1k=;
        b=Uufq6YDHUoXj+Sk23WYTdYQ5ajWxNjmdJrGRZ3qt9qI3B/k6sRMzQnxBSlN/yGynzA
         PKwPlqyOAFZ582/5pF1wPRwerp+S6w2o9sXjnTEUdyI0fHhocw8/Ass0pRVBeBywQGCa
         el18NffvUapV/bPLPEdPSphaXt9QU9699qSs49Ng6nhN/QolLNKVKM99thozyHzuh+nn
         yTxoxrBkS89OBIF4pN3SSmWpVl0ZDrJGhe6Nh0WpkLREJEE8s+2uJFZHX2bKmV/aegeT
         uavH6ETKqhvQO27U2oZTpnYNtV4QxXh1jlZFHbwPPYPVubtT1nR90av9BUN9StiXs2HI
         0TIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVYcW+/SR/COdVR+G5b0labb1n/IlEbZSd34mEdL2rrYnO/k6uikz/BN84QzgRwRSNkhsJ4F/IajLeNnK9ze6eHaw=@vger.kernel.org, AJvYcCUZrtCvxFbzTv3IjtVViSf9bWVDWJ2DaD6t75m4gPHX4jXxuancSHqhR/JImo9gp+MRGgznwdvM2jXE5hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDCCo5nnAhbHYr0RsvDfqId0kxK4Fliv3bOF6bgeKsP6Nj4+2u
	bhg5DmO09yM2+Pt4VOEOtuOccY73sRZDyN0XS8QrxeWgs+PZrbQV
X-Google-Smtp-Source: AGHT+IELlOZrbpDDmQmCbRbG0vRIkhFYJaViGyYnBLu4bKmd6e+VWjqkUKFL2ARZcYylZS9VGP+oBw==
X-Received: by 2002:adf:e5c4:0:b0:371:8e0d:c1d9 with SMTP id ffacd0b85a97d-378b07ad2dbmr332439f8f.19.1725990859385;
        Tue, 10 Sep 2024 10:54:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/16] media: platform: rzg2l-cru: CSI-2 and CRU enhancements
Date: Tue, 10 Sep 2024 18:53:41 +0100
Message-Id: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add the below:
- Retrieve virtual channel from remote subdev
- Support to capture 8bit Bayer formats.

v1->v2
- Fixed retrieving VC from subdev
- Fixed review comments pointed by Laurent
  * Refactored supported CRU formats
  * Added MUST_CONNECT flag wherever required
  * Dropped `channel` member from `struct

v1:
Link: https://lore.kernel.org/all/20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (16):
  media: platform: rzg2l-cru: rzg2l-ip: Use the RZG2L_CRU_IP_SINK/SOURCE
    enum entries
  media: platform: rzg2l-cru: Mark sink pads with MUST_CONNECT flag
  media: platform: rzg2l-cru: rzg2l-csi2: Mark sink and source pad with
    MUST_CONNECT flag
  media: platform: rzg2l-cru: rzg2l-csi2: Make use of
    NR_OF_RZG2L_CSI2_PAD
  media: platform: rzg2l-cru: rzg2l-csi2: Implement .get_frame_desc()
  media: platform: rzg2l-cru: rzg2l-video: Retrieve virtual channel
    information
  media: platform: rzg2l-cru: Remove `channel` member from `struct
    rzg2l_cru_csi`
  media: platform: rzg2l-cru: rzg2l-video: Use MIPI CSI-2 data types for
    ICnMC_INF definitions
  media: platform: rzg2l-cru: Remove unused fields from
    rzg2l_cru_ip_format struct
  media: platform: rzg2l-cru: Simplify handling of supported formats
  media: platform: rzg2l-cru: rzg2l-ip: Use `rzg2l_cru_ip_formats` array
    in enum_frame_size callback
  media: platform: rzg2l-cru: rzg2l-csi2: Remove unused datatype field
    from rzg2l_csi2_format
  media: platform: rzg2l-cru: rzg2l-video: Use
    rzg2l_cru_ip_code_to_fmt() to validate format
  media: platform: rzg2l-cru: rzg2l-csi2: Make use of rzg2l_csi2_formats
    array in rzg2l_csi2_enum_frame_size()
  media: renesas: rzg2l-cru: Refactor ICnDMR register configuration
  media: platform: rzg2l-cru: Add support to capture 8bit raw sRGB

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |   3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  31 +++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  91 +++++++++---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 133 ++++++++++--------
 5 files changed, 207 insertions(+), 90 deletions(-)

-- 
2.34.1


