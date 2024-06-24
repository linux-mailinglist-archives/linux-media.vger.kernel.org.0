Return-Path: <linux-media+bounces-14032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557C9146BD
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35BC91C222B4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D92132811;
	Mon, 24 Jun 2024 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8fN++gc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3802612E1F6
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222877; cv=none; b=VlXMOE/fnd1BFNnVaz5y1M2gS1yNYGaAXmrUQ8k1S56hLCt/Ct+qkef5N1ayZ4ORJ1azgH4L2sLoP3jop9vJx5k96dzt5Z5sI5TYdWFXfp8uiIUos+2QgGO1QtJQZBGxKvG2kZyqLG0kT9EIVihvzQkVc44UpYJUD3oO6JlNNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222877; c=relaxed/simple;
	bh=Lr5yF3QaL0y7SMSGlclyfoFjJEBmOuBw8Lz7UKRBFxY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PzRc/ac4gi0lIdqzD9nqIiIlkkDnF9FuA6k9U+1r99WoetFCKsu430uweRO3+aAgemjJL2ja3jhicYGoj3201vYXsAWA/Z5Bvo2SaKW7DQSsS/DhB344bUnRkd95UupuutskOmqgrN3AFm82rJzY63tKlfWRius+yyvTImspuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8fN++gc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so31328895e9.0
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222874; x=1719827674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pht3IvVhY+Nj6zHJhE+MfolZZKBRDqmhD2Saz3i11CA=;
        b=E8fN++gcYYB6zcSMjUf68Z9pIoPCaxh6eu/Ncx/Rfn1Tf4GE7aSkbOEFvo8lb45bLo
         26ZWkvqhlDDy1G+ic9+fOHkZX3Xy/A+TYnT5DLuYSTTshEQ7FVeeduNXvhFX62hzo8UG
         BmjNtvMWGUBaiZSolaTiiFPUUEI6zBaUt5RcQW+jKnJsGxmQCf4YizL/JoCnwBAlUV85
         oCKe211x/yuZsO4U1glvkWavZbiNQdaAHK8DAoYrHqk4UsnbZR7RzTDwnzN7h4MD6DbO
         i9J2Sbea3lPr9tFV/wX0P0RrkwRMLabbXJh9Ub3ckeEPAquCTy92J2EwYORsvFL7uGRA
         hMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222874; x=1719827674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pht3IvVhY+Nj6zHJhE+MfolZZKBRDqmhD2Saz3i11CA=;
        b=xA+M/OxKjHxVOum3Z9mZQKGS1WBZc6wINIHfFytxxKvDrPi9VaGXMY4eh7HPhggnHm
         eT9qzboUBSlImfi6ADGR6gijdtTivgM486xzG36ifRnhMOjpD6LtrXNCRvToWpAce5lr
         FgAVzh6p0h3eIjvSUL0PtA7qUX+OT5sI02QDupftFzFE38dGXuHdavUea5FqBlE4yGhn
         L6DMBQES6lKEVqIA+oO8DXRcb2oQHP+RtLRD3CINpLvqqQlo33l8rAdR4uaowTUrnMve
         7AnSK/iyp3XxibFkT1VLvebys4aDIQiwmzxULCi5LuJxy5m1+1kCfCV/qFyqHJyBTjq6
         4SHg==
X-Gm-Message-State: AOJu0Yyr/Ei47ddju7stm30oSHxOV4U4AwatyUbYIbnN38HkF89nQX9A
	Cdk9VUwZrp51tCzuH1+Dl7z4NJJktqeINT4MDiPwBTbj6SKgCG41a6UBz0k=
X-Google-Smtp-Source: AGHT+IEz27bnjwX8uKVBVk8I1Mo9jVeGOGJOrW6hITsGuRBpjzdK6R3hdUnBg6Wt/5HtPKQrH1dUDQ==
X-Received: by 2002:a05:600c:1d24:b0:424:917e:f394 with SMTP id 5b1f17b1804b1-424917ef3dbmr18809475e9.31.1719222873905;
        Mon, 24 Jun 2024 02:54:33 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:54:33 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com
Subject: [PATCH 00/10] Add loopback support across multiple vivid instances 
Date: Mon, 24 Jun 2024 12:52:51 +0300
Message-Id: <20240624095300.745567-1-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series sets up loopback support for video, sliced VBI data and
HDMI CEC across multiple instances in the vivid test driver. It also
updates documentation to reflect changes made.

The first 7 patches do not implement the actual work but are necessary for
setting up the next changes. They address documentation issues,
fix a g_edid bug, resolve a vivid crash when no outputs are configured,
and add the instance number to the video input and output enumerations.

The 8th patch adds the controls and infrastructure needed to enable
loopback across multiple instances.
The 9th patch enables the video looping code and CEC support.
The 10th update documentation to reflect all changes made.

Dorcas Anono Litunya (3):
  media: Documentation: vivid.rst: Remove documentation for Capture
    Overlay
  media: vivid: Add 'Is Connected To' menu controls
  documentation: media: vivid: Update documentation on vivid loopback
    support

Hans Verkuil (7):
  media: Documentation: vivid.rst: fix confusing section refs
  media: Documentation: vivid.rst: drop "Video, VBI and RDS Looping"
  media: Documentation: vivid.rst: add supports_requests
  media: vivid: vidioc_g_edid: do not change the original input EDID
  media: vivid: don't set HDMI TX controls if there are no HDMI outputs
  media: vivid: add instance number to input/output names
  media: vivid: loopback based on 'Connected To' controls

 Documentation/admin-guide/media/vivid.rst     | 185 +++++--------
 drivers/media/test-drivers/vivid/vivid-cec.c  |  88 ++++--
 drivers/media/test-drivers/vivid/vivid-core.c | 250 ++++++++++++++---
 drivers/media/test-drivers/vivid/vivid-core.h | 125 ++++++++-
 .../media/test-drivers/vivid/vivid-ctrls.c    | 262 ++++++++++--------
 .../test-drivers/vivid/vivid-kthread-cap.c    |  86 +++---
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |   5 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 115 +++++---
 .../media/test-drivers/vivid/vivid-vid-cap.h  |   2 +
 .../test-drivers/vivid/vivid-vid-common.c     | 134 ++++++---
 .../test-drivers/vivid/vivid-vid-common.h     |   5 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  |  25 +-
 12 files changed, 859 insertions(+), 423 deletions(-)

-- 
2.34.1


