Return-Path: <linux-media+bounces-12646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2C8FE76B
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 512961F26CC4
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EACB194C9A;
	Thu,  6 Jun 2024 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OWBinAfU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE411607B2
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679852; cv=none; b=KV/EJJ0E6pOAxDJBE2GuSi9fzUUDqpu2cb/G+fpEpVezECbTvbjpEgirXYtHuYHuikGym1WDd63Tnru7jljI8GI+2o9TCTFQ1nBZVJ7LeEVPt0qvmlU08dcu/UsZeEZO3Lxr4gBDr4voG7piMb+2ed3w7ekdCH8fQfFbMgqn3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679852; c=relaxed/simple;
	bh=SAejXvaGIkk/FmNtQiseSS7vb8NuZINDurAfuZH6sKc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GP0Ni2k7ojiR/3EFs8L634tlpTruvlDkHZtiKqci/vNdWBfiCTjWC8L1sPwvEjMJamv94A6In5FeR5fTl0DBVpE33n5/uiNgGWRMfZOTitQzWoviM9UM2QIODzWLUmg6mCgjyDqyOAbqjSgNitcdbHpXwlI7iiSejM2aKDtg2es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OWBinAfU; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-79533d9fdb3so45399185a.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679849; x=1718284649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3rA2wtN8OcyqgNSHm5jFE8HCUqDzvFj4F+hpoah2wQ=;
        b=OWBinAfUZnM3lGrnaQ4egD6DbUdqUhoeMMkcUHWA5efmjwrV1KgpWrA+qo7sRbXX5K
         75VnAL/ZPTsHV02J8IUWuAnMMBYVm1ClpLkHcsvTflBis1gPcW9dKkE44tg2soDnKoJy
         kSDMTFYvRYS4bV4+i3a+kLqD7TOZCzdCFiBaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679849; x=1718284649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3rA2wtN8OcyqgNSHm5jFE8HCUqDzvFj4F+hpoah2wQ=;
        b=YKk89A4AwLI6oX/EWdJgtOhhJkBHSAZqLnIEzPG+hX08OBYWrD/mo/LFO/QXHvqQPH
         bFOet+8u84IW9v4GGuSD3DW51SBOXdV2KmvE66ok6CT9ehB5F02X7ytNF7CXuhNFHlPR
         XbtahJDRu66PAMMFRneKCP4tcI+P4qm4zSglb+ROdFpPxPvFQGdwUnTaNxqODOlO/wGR
         UPNX7M1uCVaQpvcp1BRQVyi07DsZQbserA7/K7C//Wllrsjv50TGqsg7xIVIX6fbA4h+
         JytBbgSu9DX+UsMQJmuJuacaeLZs5Vf6ZtfQMUtUXGBLHk/SxcRURLrs8xETQMuL1WMM
         yNkg==
X-Forwarded-Encrypted: i=1; AJvYcCVGMrDoQ9/zCUctJG52C824tOOTOegOxricBSf7IKUSQ/4YX39MT22DHTAjqg9b8WLJ21FmqidHvurAH/PfMNj4bt35VZr8LZdnHz4=
X-Gm-Message-State: AOJu0YwY9TTZAInRySlCtfRCxM4PfcYb5eJf1gEv9I+Z5eyMd61qfSec
	zHgYhVy+rGyPBp/49KJjH9+vh8VBtWlUCKZFqwaD4zjo3xEBszr9ViDItIyX5w==
X-Google-Smtp-Source: AGHT+IEQW5U6dbkoc06U16r3Rl91JLSt2iOy7tMg1PUb2EP+OFpp8lGChaJqjTKIQLv1wVZB5kLEXQ==
X-Received: by 2002:a05:622a:1388:b0:440:2a5b:ed6 with SMTP id d75a77b69052e-440361fbc96mr45674931cf.5.1717679849384;
        Thu, 06 Jun 2024 06:17:29 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 00/11] media: Fix the last set of coccinelle warnings
Date: Thu, 06 Jun 2024 13:16:34 +0000
Message-Id: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK2YWYC/4XOzQ6CMAzA8VcxOzvTlW9Pvofx0JQCS4SZoQRCe
 HcHJ2MwHv9N+mtn1Yu30qvzYVZeBttb14WIjwfFDXW1aFuGVggYQwKZZsdsdXWXkbynSReUQ0a
 5GMhFha2Hl8qOm3i9hW5s/3R+2g4MZp3+tgajQccUo2E0VQnphRvvWvtqT87XauUG/ENgIDISw
 hS5gjTZIaIPAneIKBBcEhScREluvr9YluUNm/I8ijcBAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

With this set we are done with all the cocci warning/errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
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
Ricardo Ribalda (11):
      media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T and MBIN_SEGMENT_T
      media: venus: Remove unused structs
      media: venus: Use flex array for hfi_session_release_buffer_pkt
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported

 drivers/media/dvb-frontends/mxl5xx_defs.h      |  4 +--
 drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++---
 drivers/media/platform/qcom/venus/hfi_cmds.h   | 38 ++++------------------
 drivers/media/platform/qcom/venus/hfi_helper.h | 45 ++------------------------
 drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
 5 files changed, 16 insertions(+), 81 deletions(-)
---
base-commit: 24147897507cd3a7d63745d1518a638bf4132238
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


