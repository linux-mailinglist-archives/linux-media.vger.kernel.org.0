Return-Path: <linux-media+bounces-10913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336DB8BD42C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 19:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E451C225E9
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 17:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA4A158200;
	Mon,  6 May 2024 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y3Gv+UE1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1899157499;
	Mon,  6 May 2024 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017993; cv=none; b=Vv3ZSnBu+4XjGFo3xfDK+hP5LYvXKaIouDXWbzpcKn0kVwoXeOOA2Zwzpv6stMopinHtVeScZIpVOM0ZVWwwO9rMaiT5EW1LivFtVELaO0FKzDlagKZBKmPLUXqmVogJaL6BvQNu1dgFseA7SkOHOKTheZz/LsMJ5WepdJpVesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017993; c=relaxed/simple;
	bh=mIh/pTz6ceChfPi6dv95WV6CGTKS5DENptkF4iVwPKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZzUtyLYp8aWXqR+VpRC87/8tTMPg38IfA2+iVMpAFn0SgSv0jQYXtOpzkL62/F22Utoh5wLHSnTIs9YRkGU8N8UDgeg1o6LBtERe5PnBIk8YPrOZ9tdS7ShJdPAP9cxR6cVlO2yKcX2/roua5VOXVHCMWE/ARDgYEPsZtYUTFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y3Gv+UE1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BD60114D;
	Mon,  6 May 2024 19:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715017982;
	bh=mIh/pTz6ceChfPi6dv95WV6CGTKS5DENptkF4iVwPKo=;
	h=From:To:Cc:Subject:Date:From;
	b=Y3Gv+UE1yBxt/SPrFyoJ3WwpphafVNQv9C4zI18osqf/C+1ZxZNEX+388vgQGlzDa
	 Rh5ZAJ056Ncuqt8I+5tE9n8XLGKIUsfaiFEtsXBQMLdtEKNhnGnf4ISnX12RLxyaU/
	 Vnl6zYBBasa+oz5WeEKwhnQCpiMQWmMwvl9AmvoU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/2] media: v4l2-subdev: Support const-awareness in state accessors
Date: Mon,  6 May 2024 20:52:53 +0300
Message-ID: <20240506175255.24394-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series comes from a mild annoyance I experienced during
a recent patch review, where I wanted to ask for a pointer to a
v4l2_subdev_state used to access the state in a read-only fashion to be
made const. This wasn't possible as the state accessors functions take a
non-const state pointer, in order to return pointers to mutable formats
and selection rectangles.

Patch 1/2 improves the state accessors to support const states, in the
same wait as the recently introduced container_of_const() macro.
Bikeshedding of the internal macro and function names is expected. Patch
2/2 then shows how this can be used in one driver.

Laurent Pinchart (2):
  media: v4l2-subdev: Provide const-aware subdev state accessors
  media: rkisp1: Mark subdev state pointers as const

 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  8 +--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  8 +--
 drivers/media/v4l2-core/v4l2-subdev.c         | 24 +++----
 include/media/v4l2-subdev.h                   | 66 +++++++++++++------
 4 files changed, 65 insertions(+), 41 deletions(-)


base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
-- 
Regards,

Laurent Pinchart


