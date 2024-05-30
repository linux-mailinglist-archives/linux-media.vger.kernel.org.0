Return-Path: <linux-media+bounces-12243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647588D4C9A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F9051C210CC
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B111183097;
	Thu, 30 May 2024 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RMiWI0oI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FD61C2A8;
	Thu, 30 May 2024 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075590; cv=none; b=EI5hszKZ1EepbjASNfDOq2cef5f4Dpd9N78QDYpOCnt8ff/j5kiabriRuQXplROgGJBWZWi+WfsMCcYJXl7LjrIrCIVkfjAZRzLvDozGUFmS8zPlzhOD11gX6KBYtquZnG/IQy+aVUEhOo2/O/ad77u8+N8aKK+d/xqjsQifbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075590; c=relaxed/simple;
	bh=r4K4Gx4Wd1q9XvtfkuKCTGwiVYD+mCp1Rs435mgNJys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VD6+3XBP/T8bXj0fjx5jQsTuDyeqq6O245yvQLPIXsAdUnJyKpHQgDiw/eWfPOKbAXT4Sv3jkLT1ODgW2eZZ2fZvfYiocaG6t2KzeMZXt/5Fa3wpE6Js8T4llhmossumguUlkqq1TFWPvwu46TwKpN8bCmtW81X3sgY7vFE3Nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=RMiWI0oI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=DQLQE1FIAuFo5tjq5i9dB2LPrhSJfMJnZUJEE6KMuqY=; b=RMiWI0oI+NOTAtVY
	ijrFPsoHZzwIyaIrAG5Z4rUrACmZVU7VFUZ0eP9BfeRax0fQaeytx6XH9I+vqTccPi7RjnXSzgbTm
	NP//y8G7iOxkQsIgYmZkW0HZpnbMiEJJmmQavEohM/vDP9Ttl1Zu7ZG8rUs1JLsOmijPI9IfQzT5j
	OjumhDZX4nmwbSfD86tY5gRy/CRXYct1ZrSASb/m4se9fRTXSdqhr9/fe6cjh0qLFI/4zUcW17UDL
	px/EQx4x0LThjgH/XnuBsGgYge0rqUscrUpLHbAAXkFh1l5OsMlIFbu2NYVPRaf+n+KB7JkYpEaXP
	NaISS+Hx2DmE3bh0cQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sCfnS-003N3v-0Y;
	Thu, 30 May 2024 13:26:22 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 0/3] Dead structs in media/platform
Date: Thu, 30 May 2024 14:26:16 +0100
Message-ID: <20240530132619.71103-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Clean out a bunch of dead structs in media/platform.
Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

v2:
  Removed tegra_vde_h264_frame declaration in header
  Typo in first subject line

Dr. David Alan Gilbert (3):
  media: amphion: remove unused struct 'vpu_malone_frame_buffer'
  media: m2m-deinterlace: remove unused struct 'vb2_dc_conf'
  media: tegra-vde: remove unused struct 'tegra_vde_h264_frame'

 drivers/media/platform/amphion/vpu_malone.c    | 5 -----
 drivers/media/platform/m2m-deinterlace.c       | 4 ----
 drivers/media/platform/nvidia/tegra-vde/h264.c | 5 -----
 drivers/media/platform/nvidia/tegra-vde/vde.h  | 1 -
 4 files changed, 15 deletions(-)

-- 
2.45.1


