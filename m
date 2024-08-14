Return-Path: <linux-media+bounces-16285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221E951A0C
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12AE02841B9
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F3E1AED5E;
	Wed, 14 Aug 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AM0/RTe4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85809143879
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635570; cv=none; b=e2DjfEfU3azZxumm7EoscXiF44T9pq/DiAuanqsADHgYvb7sYut+OmVIiDxj9QnYaKrAUFy5vCiiUIqrcvrFQP8O4yrvp01APMJmDne1IB8cEQEjRKzNhl2/aDQtdSnWu3lhr1oabIlPxhhbE3yqty+3WilJZTCOMz346JDUL+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635570; c=relaxed/simple;
	bh=Fn+BWVx+icfWGuBcquJ0dO16K9xhh0CkAqA0Pv8bYkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QkhG7rOy+affx2eI2C2GTJOabDYlov7bjYt9f21YpfV1T0qt0TNrNa09v7/S2E1//C8gNURKdYt2SKS7o1Mx5lLKqQjAjiJVPXYqn3rtovVxD4l9qjjJFSXr+o/GiIH68PBiA3EUp/kGT5mRZrTg6Z9lIb+P8i09JpqjAQy/89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AM0/RTe4; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d7a544e7so433247985a.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635567; x=1724240367; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crV4WcEqzX/y78Gc0a5APg4xrltVatIzUyaXTSeTgJk=;
        b=AM0/RTe40JT7Le1eh0j2X1U11UBGq7kVfawfjRWl2z905gVXrCX2GHcuu/sfqiG7dL
         RB7VKhjtKY7BQqtVNxtNTtoU58M6NdkjnUd8Zu7jpm4vspT1pitO3cwyqh1n+L993KgG
         4k4iOyqvK+tbNAGaKg4IdOnGEAa1gJQBiS5zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635567; x=1724240367;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crV4WcEqzX/y78Gc0a5APg4xrltVatIzUyaXTSeTgJk=;
        b=pNU8O9mwkXz3y91R6VQzHGKSoMUvlgcRp42sAjfdI/Ko5LxJRaTM2DiceD7ZdSTHCg
         rIj0gNOHd4P6YdXi002XFYrKHS0ZwsZfe10p5kZMy25yUQXHy924Borxf/VolgR/njWI
         f4Qt1oyet2XF5wPRDzDh8i7eaSZ6Gj3Eh2z3Dfbxe/7upTAtzdS4FEffc61EMyNrhk/T
         BQv6T7mMg6TsoBTtJXAXEvUmkLjaL2VqzCm+WimMkg57GtbzqJCjRCCqX/aGG8uJ99i3
         e/ldo6+vlnXZfbaXDxchp9+o5qkvhW+lqY8L+6yRimOKmemoDOVmMD3s7O+SfTdlf0Ig
         GMng==
X-Forwarded-Encrypted: i=1; AJvYcCX+uTrHPNf0ycu2LNaIlRcTggxESg5AMfY4RkUrfnSiuSmLkhLxTbJnf/zz+g7JevVLARj4CuKYN+wd6xg0frpFANtpykwN2BYW0R8=
X-Gm-Message-State: AOJu0YzjAQh+aE47RYxawS+8wn7J1Qonqcc93r1bHHOvgdv4cCf3W9jv
	YoC874YEahfOIRf2P4nmcSZ9+TmFSmBRLCAw05ciumXGDvpQT2dePlSwN7zQAw==
X-Google-Smtp-Source: AGHT+IGQx9KGk3bWnxAIeaEOEjBRP8USeRec4fbWI4sj4c36diyFOYNnmiGxNgNPSm4TjDiH8PPqLA==
X-Received: by 2002:a05:6214:310a:b0:6bb:9e88:c101 with SMTP id 6a1803df08f44-6bf5d26b2b5mr23418286d6.50.1723635567257;
        Wed, 14 Aug 2024 04:39:27 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 00/10] media: Fix the last set of coccinelle warnings
Date: Wed, 14 Aug 2024 11:39:20 +0000
Message-Id: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmXvGYC/4XOzWoCMRDA8VeRnE2ZTL499T3EQ0gmbkCNZO2iy
 L57oxdL3dLjf2B+M3c2Uis0ss3qzhpNZSz11MOuVywO4bQnXlJvhoAKNFgea4yF5wNdQ2vhxn1
 wYIMjAY5Y3zo3yuX6FLe73kMZL7Xdngcm8Zj+bU2CA1dBoYgocgLzGYdWj+Xr+FHbnj24Cf8hs
 BM2UECDMYPRC4T8QeACITsRUwAftdROLH2hXoQB806oTkhpPZEmSugWCPMinJDvhOlEIg8yJ5e
 8+03M8/wNV4KJr70BAAA=
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With this patchset we are done with all the cocci warning/errors.

To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Changes in v7:
- Invert other of tags. SoB is now the first for all the patches
- Link to v6: https://lore.kernel.org/r/20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org

Changes in v6: Thanks Bryan
- Rebase
- Instead of removing the unsused structures convert them to flex arrays
- Link to v5: https://lore.kernel.org/r/20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org

Changes in v5: Thanks Vikash
- Remove patches already merged
- Fix typos and remove hfi_resource_ocmem_requirement
- Link to v4: https://lore.kernel.org/r/20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org

Changes in v4:
- Remove patches already merged
- Combine dvb-frontend/mxl5xx patches and use flex on both (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org

Changes in v3:
- Do not rename structure fields. (Thanks Bryan)
- Link to v2: https://lore.kernel.org/r/20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org

Changes in v2:
- allegro: Replace hard coded 1 with a define. (Thanks Michael)
- Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org

---
Ricardo Ribalda (10):
      media: venus: Use flex array for hfi_session_release_buffer_pkt
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported
      media: venus: Convert one-element-arrays to flex-arrays

 drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h   | 18 +++++++++---------
 drivers/media/platform/qcom/venus/hfi_helper.h | 20 ++++++++++----------
 drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
 4 files changed, 24 insertions(+), 24 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


