Return-Path: <linux-media+bounces-16640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D666395C8C7
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 11:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0511F223F6
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 09:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B83F149C6A;
	Fri, 23 Aug 2024 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kq/a1/JD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091144C62B
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403887; cv=none; b=brmUA0rPIb21UWGAHcArixNoZWUAbRK1H0JDGSNWHCxuattW/VT4L32pwRc6m9Tf268uPCQrRNWrp4lyX0dzCpUDXfKcXsqr7A0RKliY5/lKPBNlae/lLGviMLUV5zFy98ra0QbJ9qtD1i4O6+r7+01P9D07F4H7YYovCuZFJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403887; c=relaxed/simple;
	bh=7ylv+SyHTFPjt0dfwa/yI27GpRvTd+PJu6khJdUDcOU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=CwcZEj67vwrHsgS3Mp80oLiR/1D0zc0bm1Ht5ZiN9QjZiDQyZdb6ZxH46I96sigqq7sMpUWU9a011HCfgHmdZtxi1hwJETaXz6ct4ESbYweg37HL+vYDny4ow4tzeiJj6gu5JOY7jtrBnhzibGMlYv9dBkmrsyFx4bovEuuGF8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kq/a1/JD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37189d8e637so898062f8f.3
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724403884; x=1725008684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq0tjBXKnrba/Yxn/HCt3zuj6LoYvhrmxWFXABbC8tQ=;
        b=Kq/a1/JDtV+odpSDLffjVCEoUSShrC7vSh1Oid22Ej0t5mBYwJD6kaMlGZWnYErSde
         lMCB+LnRcVd8BcXgHAqt3iBCtangIR/r2bzBoPPLEsrkZ0gp2SB0CwRy3l6m7pE6DsW1
         O3JvebKiY6pQOcHLu010wGSa5Cj2dHA9Oth0TCxxqVP3zhX+vHXXnT1AgWo9D62E83ow
         NkO2ruAZoPqrqx9/uFv/9EpYbrmpu6XlPQVxHKDwQuV8HVeljYXwWGnH1Hxn3SiKETJq
         9mGWf/8JlEvhPGqopyZyfIQ8RveMFvpY1GyGb+715wp1QyJHNfRYIboX2PiZKysUMsd6
         PEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724403884; x=1725008684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq0tjBXKnrba/Yxn/HCt3zuj6LoYvhrmxWFXABbC8tQ=;
        b=rkfetP5ntKjjGtEQINu6wqP+N/Q4cez/pavg2w8fBP96Mgq5G1nusymWGyTHYZPzlJ
         sRpiRbSsBUYdxOwzY+9RRgHFJ2iRMI6GHLj1NHEceB5acO5U1z5j/zd926rU/6MSuxEl
         /oOIPvW4ZBcUvvleIOw75rBwVGoRCwrnD0c28N08iAtdhZzjKpAd6aYTMUeg0s5Nxbjf
         IzN5Q4S2i1zH6m0xWt3auaMEjCnTDl4qKdF7zmY1g+d415QwE35PFbkKL8a4CH33iTpl
         uAvn7uF1mmQtDoJqPO4p4XGVeV964bRDwU7f2V71SkHZyHA5gpIubbk4F0Plo7iULhKu
         syrA==
X-Gm-Message-State: AOJu0YwrfxSgS+KArS3qOjCDnQOzawkhA07zR+Bt7bntKXrNkAGtwRFv
	Og/PN79jMfINUUEkrEkGdpUmB8+kztVrghm1f44k76hydX/PrCNlfzKoUQ==
X-Google-Smtp-Source: AGHT+IGwGe0RT4kZWzdM5cVyx1lVrNtmaRWoMkiXedcZiWweF49xlLs8dHa5EaWv2MStP1FuiV+oCg==
X-Received: by 2002:adf:f782:0:b0:36b:bb84:33e2 with SMTP id ffacd0b85a97d-3731187e1f1mr951330f8f.37.1724403884003;
        Fri, 23 Aug 2024 02:04:44 -0700 (PDT)
Received: from aero-laptop.. (79-100-234-73.ip.btc-net.bg. [79.100.234.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm3636530f8f.18.2024.08.23.02.04.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 02:04:43 -0700 (PDT)
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.12] Venus updates
Date: Fri, 23 Aug 2024 12:04:38 +0300
Message-Id: <20240823090438.130446-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

The pull request includes:
 - cocci warning/errors (Ricardo Ribalda).
 - Constify structs (Christophe JAILLET).
 - A fix for use-after-free when removing venus core module.
 - Use iommu_paging_domain_alloc() when loading firmware through IOMMU.
 - Change min iommu items in dt-binding for SC7280.

Please, pull.

regards,
~Stan

The following changes since commit 31aaa7d95e09892c81df0d7c49ae85640fa4e202:

  media: cec: cec-adap.c: improve CEC_MSG_FL_REPLY_VENDOR_ID check (2024-08-08 15:24:03 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.12

for you to fetch changes up to 5c6fd86dd3b3d6f37b0d07175ce24945134856fd:

  media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry (2024-08-23 10:46:31 +0300)

----------------------------------------------------------------
Venus updates for v6.12

----------------------------------------------------------------
Christophe JAILLET (1):
      media: venus: Constify struct dec_bufsize_ops and enc_bufsize_ops

Lu Baolu (1):
      media: venus: firmware: Use iommu_paging_domain_alloc()

Luca Weiss (1):
      media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry

Ricardo Ribalda (9):
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported
      media: venus: Convert one-element-arrays to flex-arrays

Zheng Wang (1):
      media: venus: fix use after free bug in venus_remove due to race condition

 .../devicetree/bindings/media/qcom,sc7280-venus.yaml |  1 +
 drivers/media/platform/qcom/venus/core.c             |  1 +
 drivers/media/platform/qcom/venus/firmware.c         |  6 +++---
 drivers/media/platform/qcom/venus/hfi_cmds.c         |  8 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h         | 16 ++++++++--------
 drivers/media/platform/qcom/venus/hfi_helper.h       | 20 ++++++++++----------
 drivers/media/platform/qcom/venus/hfi_parser.c       |  2 +-
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 20 ++++++++++----------
 8 files changed, 38 insertions(+), 36 deletions(-)

