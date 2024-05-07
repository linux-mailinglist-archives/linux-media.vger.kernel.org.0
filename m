Return-Path: <linux-media+bounces-11002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF78BE3B2
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD2EE1F26AFA
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D622116ABEE;
	Tue,  7 May 2024 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZRX3fQkb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574F168B0B
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087912; cv=none; b=pzh8OvCoKV7nx23Pinjoxf/Y/qgsUYvKFP6hOEnvks7Z176Z0zIsT38DPwaS7GiA1OuEl7Zbw9CZRCiIdmvJhBrxNkWQXlglYJDFy/fqwXYgLvWLyY0ZvRymJOjH1C8epIgvt9M5SPyV3hUK1BbfFdCcIzS1/JnJmn4q7OjXbts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087912; c=relaxed/simple;
	bh=bAi2ZdpBL5YU/Wxi/XteXVj/icGKTIMcJ8j0y8QoFIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FanVvclSg8Vz772G0pY3tr4PVExev4GvCZWeaE+HEtPrugP0GSHmXfr2Dtd4+wsayxhUTb8s4lpD1poWiyd7EVb7kM+F4mgKAFvlIs3OIbuv611KT7WVaQIOntSqcKfXUoPySOmwWWN8Bxubj3QGbfv0UAjgGTBCdXugB5CJZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZRX3fQkb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f049ddd7dso257582785a.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087909; x=1715692709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8f9hc3zYS1+xO9Qa+U18bGlg+mDWX5tgKVnZHr3X7Vw=;
        b=ZRX3fQkbILhVfArWs1t8tD5o2EDIYKsjfkp6aXyd4PRWnf+MYlIP4LvZgzIpNz9ppB
         BgkXuGqoyfeyH8V/pCj63430wJ6DfP/XSGvROpioq+osGTTRXtMcHEYTVmww5MHeG+p/
         PMDCMlI6AB4vDRweg5NzuG/llx6IuK9Pagz1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087909; x=1715692709;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f9hc3zYS1+xO9Qa+U18bGlg+mDWX5tgKVnZHr3X7Vw=;
        b=CkCDbC+6jK6Bx0/7/4QtDxEyCIORGtsbRmnIn12e1aAnGs2hKRPWwju1lOusf6N4SJ
         4h8Uq5ke+/STXMAA8Kx2tbFDZ+hzDX4SNk7DXoqUcN6/P8ZEGU8csXGOPwYJlACzYvL7
         1CIutshnu3m2x+lCcL64mBWuFxepYBzPjNo4+VPHRbqu2T/OG8Sj9AprkR2efLT9vnI6
         /LwfthY0kRhXDkjmb6aSPmx7dOSfStjGfHjgVTdcARleSPLlQfG9ByO1+XtNQvQXxgwI
         xRrRumE7tUaSZx8ebFjwLmBAKRtd0whVo4PBdttUGEwlBM848mK0ODR2itOrMCdb9pjq
         Gejg==
X-Gm-Message-State: AOJu0YzvaanC1M9pOGrQeQLEZ622U+QTqucY57fJtqXplM6UAF8cv27i
	bO3XfMMpOU/2JbZdB8ZBlZaQWzpit+YEsJZJ66kFZU6sgNRiDS2ZW2pW1fopKA==
X-Google-Smtp-Source: AGHT+IEWyU2AaY4LDvGiS+okmI+kA1r/WIVU3XwN1sQPnZg87ruugUrDP1DKKW0TPSio4xfKwE/sTA==
X-Received: by 2002:ad4:5b8d:0:b0:6a0:c8ac:de5 with SMTP id 13-20020ad45b8d000000b006a0c8ac0de5mr16242277qvp.32.1715087909722;
        Tue, 07 May 2024 06:18:29 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/18] media: Fix the last set of coccinelle warnings
Date: Tue, 07 May 2024 13:18:26 +0000
Message-Id: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIqOmYC/x3MMQqAMAxA0atIZgupKFavIg6hphoQlRSkUry7x
 fEN/2eIrMIRxiqD8i1RzqPA1hX4jY6VjSzF0GDTYoe98af3YsLOiVTpMQM57MmxRcdQqks5SPq
 P0/y+H5EtvOVhAAAA
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

With this set we are done with all the cocci warning/errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (18):
      media: allegro: nal-hevc: Refactor nal_hevc_sub_layer_hrd_parameters
      media: xilinx: Refactor struct xvip_dma
      media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
      media: dvb-frontend/mxl5xx: Use flex array for MBIN_SEGMENT_T
      media: pci: cx18: Use flex arrays for struct cx18_scb
      media: siano: Refactor struct sms_msg_data
      media: siano: Remove unused structures
      media: siano: Use flex arrays for sms_firmware
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

 drivers/media/common/siano/smscoreapi.c           | 10 ++---
 drivers/media/common/siano/smscoreapi.h           | 18 +--------
 drivers/media/common/siano/smsdvb-main.c          |  4 +-
 drivers/media/dvb-frontends/mxl5xx.c              |  2 +-
 drivers/media/dvb-frontends/mxl5xx_defs.h         |  4 +-
 drivers/media/pci/cx18/cx18-scb.h                 |  2 +-
 drivers/media/platform/allegro-dvt/allegro-core.c |  6 +--
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 11 ++----
 drivers/media/platform/allegro-dvt/nal-hevc.h     |  6 +--
 drivers/media/platform/qcom/venus/hfi_cmds.c      | 16 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h      | 46 +++++------------------
 drivers/media/platform/qcom/venus/hfi_helper.h    | 45 ++--------------------
 drivers/media/platform/qcom/venus/hfi_parser.c    |  2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c     |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.c        |  4 +-
 drivers/media/platform/xilinx/xilinx-dma.h        |  2 +-
 16 files changed, 48 insertions(+), 132 deletions(-)
---
base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


