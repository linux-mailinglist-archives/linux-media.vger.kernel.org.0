Return-Path: <linux-media+bounces-47069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773EC5CBDD
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608173AE78E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FE0303CA3;
	Fri, 14 Nov 2025 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uWT1sC7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391714AD20
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118149; cv=none; b=GYjK0J2uj5glp97OpVVN0ouwfm6FkNxeALCT7Nk+KRO9tLDrn/3MG9bY2obzQ3jJt2oQyqlyL5M2qzmlInatrasauXmnqQzBvHAZFnc/fqL5PWkSK8qrv6kLKf3Yc+QQrqf2LuHMWKMRbd68vHpX/iDlKgCDV4yv/nAP2MmTfrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118149; c=relaxed/simple;
	bh=yR9CnGqCpudjR8YVTD4Buy88w1EjTSik0jPNGVc97hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYJIZJDFOSVa1Suc2mxaFxIXPg9BJwSTC+MK5J2K8p18dzWoqZ83DVxQnD7lirjueCCvgC31MSl7noDEBhpsahOGWNYUkUCjzYptQ6MDo/XECRNN67HUJ9qLwGVan98PDz8qbtRQ09riM0AfM0B1lMZw4vxApqcateQQD67aywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uWT1sC7Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 927131E5A;
	Fri, 14 Nov 2025 12:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763118022;
	bh=yR9CnGqCpudjR8YVTD4Buy88w1EjTSik0jPNGVc97hs=;
	h=From:To:Cc:Subject:Date:From;
	b=uWT1sC7ZN7ew0selzQP7ejzC7aX0j3IS/jwmfo9UmdEsd/ruNTZEi3oL2vwKxVGog
	 H84109u5BvGUAx+1NLNIEW7JmNYIbtJw4BgG+OpDzZ0J1FBmYTV+mzxQzHFFuQT9So
	 t/Qa11YPo1mB0Xs57mt17SNcBStSIYsl9GIKXDiw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: hans@jjverkuil.nl,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] Mali-C55, v4l2-isp late fixes
Date: Fri, 14 Nov 2025 12:02:10 +0100
Message-ID: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As suggested by Hans, 2 patches to be applied on top of the Mali C55
pull request.

The first addresses Hans' review comments on v4l2-isp and updates its users.
The second one is a drive-by change that brings Mali in par with RkISP1 and
C3 and asserts the size correctness of the ISP blocks handlers and type info.

Jacopo Mondi (2):
  media: v4l2-isp: Rename block_info to block_type_info
  media: mali-c55: Assert ISP blocks size correctness

 .../platform/amlogic/c3/isp/c3-isp-params.c   |  9 ++++---
 .../platform/arm/mali-c55/mali-c55-params.c   | 10 ++++---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  9 ++++---
 drivers/media/v4l2-core/v4l2-isp.c            | 16 ++++++------
 include/media/v4l2-isp.h                      | 26 +++++++++----------
 5 files changed, 38 insertions(+), 32 deletions(-)

--
2.51.1


