Return-Path: <linux-media+bounces-38728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF0B188A1
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 23:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7706C7AA5DE
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 21:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F277428EA56;
	Fri,  1 Aug 2025 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TlPqjWHh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF8154BE2
	for <linux-media@vger.kernel.org>; Fri,  1 Aug 2025 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083194; cv=none; b=LvQSzsmljN/TLYzCfSg4paaZMkPV8uivpYgX0Hl/0mA+KmbQaDMrK8j6maFwAPw4xZWNOWWH798YOhzZsOa3j/ZrNolLrhtwnKZKad7qrP6bVX2amh5lV8PAHOsiPiXzYK+cvlCXMuBYz11O0ETlHZti4Rc+d55Dbii1zQYYl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083194; c=relaxed/simple;
	bh=oN6XpE9OHRyB+JWejgT1fLjEbaw9Vp28BwidxWB9bek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/SqwOyNSIJFhllm5ErArc9ORJI24IF3QapgItFfqPtFLx6Z/yOID8yZFJNyxTr0VZcpgXAlTGvoOWCfyDWx782LxKdqA43YvmCdexyGrVbv23OEYPFksJUwwjlb5wh3wLzOYqqU5GRDigow2z41f3sMJUgAdVxZhivfFUzcFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TlPqjWHh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45E2850A;
	Fri,  1 Aug 2025 23:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754083139;
	bh=oN6XpE9OHRyB+JWejgT1fLjEbaw9Vp28BwidxWB9bek=;
	h=From:To:Cc:Subject:Date:From;
	b=TlPqjWHh7ALXw5vtsUE07dDsb/1XO8MAS3OAJ8DxG2cXcx/rI6DnuiRkFRj40n3PH
	 wmdF4TuNFkCwBpxPobh5WEWRuOMtGyfB/LAJghDcoBmgpcQf8BBMo4ihbb3TdP5OUD
	 adpbR15umR1zrSgn2WkrOVAooLGql3YpWcFKTIiE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev
Subject: [PATCH 0/3] media: Use v4l2_event_subdev_unsubscribe() in more drivers
Date: Sat,  2 Aug 2025 00:19:30 +0300
Message-ID: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series contains drive-by cleanups for the omap3isp,
atomisp and imx media drivers. I noticed that all those drivers
implemented custom subdev .unsubscribe_event() handlers, for those
handlers to perform exactly the same operation as
v4l2_event_subdev_unsubscribe(). The series replaces them with direct
usage of the v4l2_event_subdev_unsubscribe() function.

Laurent Pinchart (3):
  media: omap3isp: Drop custom .unsubscribe_event() handler
  media: staging: atomisp: Drop custom .unsubscribe_event() handler
  media: staging: imx: Drop custom .unsubscribe_event() handler

 drivers/media/platform/ti/omap3isp/ispccdc.c       | 8 +-------
 drivers/media/platform/ti/omap3isp/isph3a_aewb.c   | 2 +-
 drivers/media/platform/ti/omap3isp/isph3a_af.c     | 2 +-
 drivers/media/platform/ti/omap3isp/isphist.c       | 2 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       | 7 -------
 drivers/media/platform/ti/omap3isp/ispstat.h       | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 9 +--------
 drivers/staging/media/imx/imx-media-csi.c          | 8 +-------
 8 files changed, 6 insertions(+), 35 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart


