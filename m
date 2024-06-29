Return-Path: <linux-media+bounces-14404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9250491CE0F
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 18:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33769282AD8
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 16:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E5C81AD7;
	Sat, 29 Jun 2024 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKmM03kg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950D51E526
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719677413; cv=none; b=WI4gzd6n7bwdjqC9MkZi0eoaz6xvgn4O4J0ZZK3D/sMOfhwLrTLNEMwQKkmSdSM3aU6bz9N+6fgXATEBdl4kee8lYqcoIt27A6FLY2VInNyvYdBwz2V/fhbqt6bRYWRAnk10L5Ptx3EoH2IrK8bxtwaEm562yxWyVFEh06j3I5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719677413; c=relaxed/simple;
	bh=cyPlYNTqhJTEkNxm45fUr0NW2yXymUURRjur4jdlxmw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=CH+D0BqzcVgmO5NISZPcIuvhETaYC7f3lf8N6/Kz0rhnQ5wh7GYKMxO8wksuNaGuC6ta5hNtTULSzrxHHF9eM2O0G3Qu12usuMvSvsTwAvliGrDuiUo7EtPLL2JfFroaLk9rHseU8AZHE5NT6+ihsub6ufqihR4WjHeCpBZuuxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKmM03kg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d203d4682so1971677a12.0
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719677410; x=1720282210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AtW0mkusQw2p526+V7WoV79wAiHJT178yAsHnrkF6nk=;
        b=VKmM03kg350w06H3rn8+nJ7biWkWaFwA+/eRAUa5ieaIA2rdyo9Yi9+FhAcvnInha8
         GIpBJZbLRyeQmHHsn56xAbU5J1RZGufctUTKO5wVhpkbmufpVIXkKF3BYq9rB+9RlwJl
         bH86JL/k6dcsv06o8NTNBqw0Z1+rJjW5kRddYgzRXSb86x9l3mdVF+hXijHtQB4VeAjI
         SG+Zeqi5m13KfucfjF6sRiiZtObHNi+X8Akus2NG4h3h+PQ7LVDQVLfLAwCuhkjYYSwL
         MnBOCmQdj90WJSNPR3+soL3al1Trf6EtDuVDu+O1qnhrFHou11thaqekPVzjhI9mrxXk
         rcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719677410; x=1720282210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtW0mkusQw2p526+V7WoV79wAiHJT178yAsHnrkF6nk=;
        b=g+GhVFJv89wEa/gFHVGNNQK+oOveC+DVVnUFMaLJPdQ/TsPf8dsXr0hx+zczpJ45tQ
         RAx2xbnNiT4gBhm87XKqVyguohKXOblExULzVkA9aDBW2Mz4gJjQJdp71PaHIvamhydz
         aP5hGP0mSwwp9lARpciQCrevSrvyRwAJeyAF918hSad0GDNK+q5EE+hOG4m14q1Dou2x
         9rZW7FhRVxanqYOF9IKAbzxuvUEx+ZtGI53A0APOnj7NStKMVaW1nFSjE/pz9uq8qRe+
         feltIYqT7dQaYgRhJeRWuM8bNOL7/diby9nja3HfMyO2yndpJC+x+It2Q/i14axTxP//
         7a0Q==
X-Gm-Message-State: AOJu0Yz8LOVlkVVIAY9EEmhBtTaLPUV1ZFgF/d/gGUdodStgwfyEJH0e
	TwZ2DcguIaekxLS4AamVYMb53ihlbJv9M49j40sshEVYEmTfDL22YFsTmw==
X-Google-Smtp-Source: AGHT+IE1kyFxO80n15HGIWBxd1qZg03b6ZX9Qw7+Bnxnkp6mqrf8IbsjuE/4oFr7bCdzXpzqSvYiNA==
X-Received: by 2002:a05:6402:350d:b0:57d:4876:55ce with SMTP id 4fb4d7f45d1cf-5879f59a5b2mr891136a12.19.1719677409734;
        Sat, 29 Jun 2024 09:10:09 -0700 (PDT)
Received: from aero-laptop.. (46-237-99-248.varna.ddns.bulsat.com. [46.237.99.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324ed2dsm2368798a12.28.2024.06.29.09.10.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 09:10:09 -0700 (PDT)
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.11] Venus updates
Date: Sat, 29 Jun 2024 19:09:47 +0300
Message-Id: <20240629160947.255026-1-stanimir.k.varbanov@gmail.com>
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
 - Adds support for msm8998 in the venus driver and dt-binding.
 - A fix for flushing buffers on streamoff.
 - A fix for use-after-free in video decoder close.
 - A fix to avoid multiple coredumps.

Please, pull.

regards,
~Stan

The following changes since commit 8771b7f31b7fff91a998e6afdb60650d4bac59a5:

  media: bcm2835-unicam: Depend on COMMON_CLK (2024-05-14 08:09:05 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.11

for you to fetch changes up to 9ee162e49e14499e7505cc8a140fa4e98f0b0a22:

  media: venus: fix use after free in vdec_close (2024-06-29 18:54:11 +0300)

----------------------------------------------------------------
Venus updates for v6.11

----------------------------------------------------------------
Dikshita Agarwal (3):
      media: venus: flush all buffers in output plane streamoff
      media: venus: avoid multiple core dumps
      media: venus: fix use after free in vdec_close

Marc Gonzalez (1):
      dt-bindings: media: add qcom,msm8998-venus

Pierre-Hugues Husson (1):
      media: venus: add msm8998 support

 .../bindings/media/qcom,msm8996-venus.yaml         |  4 +-
 drivers/media/platform/qcom/venus/core.c           | 45 +++++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/vdec.c           |  3 +-
 4 files changed, 50 insertions(+), 3 deletions(-)

