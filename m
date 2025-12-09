Return-Path: <linux-media+bounces-48470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF87CAFEF7
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF217301411E
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A6932720E;
	Tue,  9 Dec 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JUxqUeoW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50A32695F;
	Tue,  9 Dec 2025 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283520; cv=none; b=DuK9uV7ox2hh1HGkbG+pK6dE/LJ74DK4VOghuTehVYZrUI0yqhnkPA/sWlQf+DPo6GBztVEsXSi4Ss3fn5nhz1qpIxuOmyrfTuo1Nj/6dNdqbHV6RfwNkp3at34xUkPbDGWHdRRbPPxP+A4crkJwqULRkS+NmBcg0/qug68o6xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283520; c=relaxed/simple;
	bh=6nkPAaFnJtZWqHjfWRExA7w5rIBqcrVJKOcMVmoZAco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YaOsMzkzJ0sARD1aaeuWujaXoJVA4LMKVl0QCJfbXMXGGVNQtngc/yvUfvOrWn9pigHPhU7IATrPFNwFtM4Kb9eJW6KlXwYzU/L+dcbhkzCE18ivrPuszFPi8hODzuSFwvJGUV7JgBJ0Fgs1xjt6mnIyBiZVQNR/PctKfX9f3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JUxqUeoW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC3FB667;
	Tue,  9 Dec 2025 13:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283507;
	bh=6nkPAaFnJtZWqHjfWRExA7w5rIBqcrVJKOcMVmoZAco=;
	h=From:To:Cc:Subject:Date:From;
	b=JUxqUeoWHQEzltin3ct5hFJ7jAkR+R1h1zg5u1N2eDxMa1RczSFmwUF0cXsIMH943
	 JFOAq/BZaybEL8nD1+a4+KOrWNRV7kiisVCfeNmU2ELWVdptbPA3tpbFDtgj9D935K
	 05ovnCbcFDSpLpmOn36lAY3HFI3vM15EWef5LMeA=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 0/6] media: rkisp1: Add YUV bypass support for rkisp1 
Date: Tue,  9 Dec 2025 12:31:30 +0000
Message-ID: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

The rkisp1 features the capability to use YUV bypass, which lets input
YUV streams to bypass all ISP blocks, and be presented at the output of
the ISP without being modified. This functionality is uimplemented
currently.

At the moment, it is possible to get YUV streams at the output of the
rkisp1, but only if the input is a bayer format. This series allows
YUV to be accepted as both an input and output format, when the YUV data
contains embedded H/VSYNC signals, which are interpreted as the data
start/stop signals for frame data.

This series is tested and works on the Debix Model A iMX8 MPlus with a
GC2145 camera sensor outputting UYVY8_1X16, compiled on top of
media/next.

I am marking this series as RFC because I am keen to know if any other
developers have any ideas on how to improve the series, or if there are
other considerations / edge cases that I need to address.

Thank you very much!

Best wishes,
Isaac

Isaac Scott (6):
  media: rkisp1-resizer: Add YUV source formats to resizer
  media: rkisp1-isp: Add in_bypass flag for YUV bypass
  media: rkisp1-isp: Add target_format
  media: rkisp1: Set input configuration to data mode in bypass
  media: Propagate sink -> source format in YUV passthough
  media: rkisp1: Give buffers back instead of dropping in bypass mode

 .../platform/rockchip/rkisp1/rkisp1-capture.c |  5 ++++
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 25 +++++++++++++------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 16 ++++++++++++
 4 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


