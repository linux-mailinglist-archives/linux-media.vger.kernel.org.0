Return-Path: <linux-media+bounces-8593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A83897BFA
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 01:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F831F27CCB
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 23:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040C3156991;
	Wed,  3 Apr 2024 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BfVSQUgM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C3156663
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186680; cv=none; b=GkzHae8I+Iq+sGLAclSb60A6vlewEqfuWEx+gM1gCPQBo4FE+Cx9NSVbY4EUCNVgwqDeZg3N1a9D9Seh4B/jz2DrEEwuq9Aj6Bfn44eu1CV/E2WFmSsvh0WFUF679jZnght7PKv5/mOajuSR4MxgRTOGWX46JUlZk4uvI9JZag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186680; c=relaxed/simple;
	bh=YCXZOjWUxB/VgoGdFpBNam95XhuBP+XXTJ4pR/ZZerI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2nFAOExNo0pn/UgRO6ygMlNIG4IUZAt2uvBBLb4nJ73yyFZ0keJQUm1V4RfD6Dz3IvsBbJwpkzrq+BhSN3PJ+HaL0zGkMasKdWArdKx+2aIt0lVkO1rwz1jcQ1pALOW8qmQgEKoz97Z6KB8op6RwRkF9lQ8aXZvdN9Y1qJpg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BfVSQUgM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88C664D4;
	Thu,  4 Apr 2024 01:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712186638;
	bh=YCXZOjWUxB/VgoGdFpBNam95XhuBP+XXTJ4pR/ZZerI=;
	h=From:To:Cc:Subject:Date:From;
	b=BfVSQUgMdkn2xIiEolHwH25DLi+k1VJfqwmHC6OikgzLIF4YDnr0c3iisZL0c4Fxs
	 rrPIn3Fa19vpMUd7gw3Z7SjzFKbcEPHZ+1nakM0lZoQXtWYuQOacRn9i6LEkXZ5hrw
	 uyIfYvqdaNxwzHLapaq3ldYZlVMAMzowQz/SjGdg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 0/2] Drop stream support for the subdev crop API
Date: Thu,  4 Apr 2024 02:24:23 +0300
Message-ID: <20240403232425.22304-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series is the v4l-utils side of the corresponding
kernel change, posted in [1].

There's not much else to be said in this cover letter, please see
individual patches for details.

[1] https://lore.kernel.org/linux-media/20240403224233.18224-1-laurent.pinchart@ideasonboard.com/

Laurent Pinchart (2):
  utils: libv4l2subdev: Drop stream support for the crop API
  v4l2-compliance: Drop stream support for the subdev crop API

 utils/media-ctl/libv4l2subdev.c             |  1 -
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 21 +++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)


base-commit: 62f1c6833e12f22c81750529761410621aa54830
-- 
Regards,

Laurent Pinchart


