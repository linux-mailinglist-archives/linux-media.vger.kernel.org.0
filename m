Return-Path: <linux-media+bounces-16201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF29504F2
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0AB1C2298B
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1101199EB8;
	Tue, 13 Aug 2024 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MnOiMhYC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1981607B9
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552289; cv=none; b=A175PKgNgARjEZWk9zkcUCIky2+UXy/7QB6r2adU5mkzNRuztQi7XlqD/rwG6nSNLDolV7nbVorRCwcseBG7V676UaLktnOYj4TFksGM/OFJGAF39rVZar5JXkvDfMr+BMyXg81l6qidCnTWXmjLcRogRlA9Gqr9x99vIBdsClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552289; c=relaxed/simple;
	bh=D46mnIY05bLlJLderz5nA93RqoBFIU6rfQGGg4rdj9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j1xV+zD86tDZcqGO88a9AsfeudTVF13a8qPkHggbflr0RSmq5NvYY2oTjPQ6NHA5gt36yjKRQCBdPL6CFx3RFTLyZnOEEcoWYJsIN6MbAH0eZw2Fga40uAQhTCLiEJ84Z7SVA58T95ch/b4/+wAU638CbsuTKsdimKfjP/lObxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MnOiMhYC; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a1e31bc1efso329446985a.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552286; x=1724157086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ad/UsD/zD6NURBrzmTO0bADHZ1bo0+n8OWAPnHCmhL4=;
        b=MnOiMhYCrtweHQCmJCOr2bymMLkoCi5FJl7rU2E47LU5p1nzUb3Nk9LV63ILyTigls
         iFkSW2y5b7d9+OZwWd5pNOex7Uv8cwx+U4y0MCaZSeMHbyE0X4O/5JNHWcusVxDZA4Dv
         J4cutNoBADXWS0Ub4b8fvc/DizOts3VO+eI3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552286; x=1724157086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad/UsD/zD6NURBrzmTO0bADHZ1bo0+n8OWAPnHCmhL4=;
        b=XXQXluqZYhrYesn8H2zwayx2c45c8BPgcS/HUW8bdNRqp/AX05gtQcc+y/AXHCmo7r
         l7F9LEygY7T9lvpF9d82ikTWUIAJ9eRzq5IXxkXVh4sFMCFeanVkkDa+CaxXhVhJilM3
         7Eg+3wzYffVX0t7/Ar1BiEXuaZ8xvgHeNMtVTkrUVtQs6ZZzD35BjYt45CpVYB9xBW/V
         Gvs0Ld0hbKtotl2ejNIDxqBwipZ/h8pXaXh9xH50gWSjr5TvN4T6id9YiwISeofiVr5L
         gn4RQpygD8L2cVk2ik5NiAHcfIACEB6h7HNv+/G09HYfHehsrLASGIfz5nNeIirhgF5F
         NGIg==
X-Forwarded-Encrypted: i=1; AJvYcCXUJpBysKmnCyben2IazgMtVV2rXWQWoc544KzZBCa+dR0fgd14vcNF8wG4xTx42mHVx2MvnH7iV0MJlu92sf0bNiFzkY0z5oaGsjk=
X-Gm-Message-State: AOJu0Ywy4o/BmnCGmk3HDYkQS5DDgwc5AnDmviLwNtxVnk91eD+s6Xak
	uSfTUR9I+S+gYLmv3JFydyN2cXiQMAahJ3V3+yH1rtkTFL4mWvQcUp18HwYzyw==
X-Google-Smtp-Source: AGHT+IGm2SIiezQ97zlmfRJwUB2Qa8OnBFZT9eLqo0k+qF2gvugaUClmqGHKLwhCwmjaOU2v6shxlg==
X-Received: by 2002:a05:620a:3724:b0:7a1:c431:3bc2 with SMTP id af79cd13be357-7a4e15b8e5emr428421185a.44.1723552286470;
        Tue, 13 Aug 2024 05:31:26 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 00/10] media: Fix the last set of coccinelle warnings
Date: Tue, 13 Aug 2024 12:31:20 +0000
Message-Id: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhSu2YC/4XOzW7CMAzA8VdBOS+T43w03Yn3QBws16WRBkHpq
 ECo777AZRMUcfxb8s++qlFKklF9ra6qyJTGlA81wsdK8UCHnejU1VYI6MBDozkzJ91/y5lKoYt
 uKUJDUQxEUXXrWKRP57u42dYe0viTy+V+YDK36WtrMhq0I4eG0fQdhDUPJe/Taf+Zy07duAnfE
 FiJhoQwIPcQ/AJh/xG4QNhKcEfQsrc+mqUv3B8RIDwTrhLWNq2IF+kwPhDzPP8ClThafXoBAAA
 =
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


