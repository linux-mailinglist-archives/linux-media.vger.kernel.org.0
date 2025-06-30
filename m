Return-Path: <linux-media+bounces-36227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4DAED1FF
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 02:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8238D3A88C0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 00:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19800208CA;
	Mon, 30 Jun 2025 00:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q1zTnwWF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487BD29B0
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244390; cv=none; b=isfS1liiG/lAD7h3sIx7xMNG6hZxmL/+46Bf84qZccFfgOvNYkokSGlhMZcCeVIKYydanT917ZjkLk+12K+a6OYzl6Kxi2m4XFaq92lYkmd8PkNoDQ9RvILWlMK3DKJ1vWoz4ikPbe0AYT1xMHtDuCAakZK+Nx7xxcg1eywpl/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244390; c=relaxed/simple;
	bh=6Rpp3G4tUXDVsv6wniuCfR8woQ2+Lf/5jAj34d6jx+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3KmfJPpuDv4SuoR4T4QhHsBFlXWO+OzmfLDp1sQREutaFuHob+9Ip718Tk8JdPkuOpdNMMlNYY0UuyIDV6uX37fua3IfU2eIb7IpOIul88lnezch5/A3bj52ja79utznIZVy83WRm9anWnfIx3qmRQjhlpeiqgjMggKspmKkC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q1zTnwWF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 027D53D5;
	Mon, 30 Jun 2025 02:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751244365;
	bh=6Rpp3G4tUXDVsv6wniuCfR8woQ2+Lf/5jAj34d6jx+M=;
	h=From:To:Cc:Subject:Date:From;
	b=q1zTnwWFWRjxiFUakYaoiQlVPat7C8TehVKN+Z/ltUEb4TSWc542in2ygoibLaG3T
	 xEt0zI40I+BBjzEkMWLSmmTzTzD0fAE9L4EJ+Lh59hErlkA3OaxjvhDmRstGYMh2z9
	 crGJCDR8pFeweCtoZZr/W2nSrAVoWiqBtIcxhANU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH 0/2] media: Make v4l2_subdev_stream_config private
Date: Mon, 30 Jun 2025 03:46:00 +0300
Message-ID: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series attempts to avoid usage of the
v4l2_subdev_stream_config structure in drivers. The rationale is that
the structure was meant to be an implementation detail. Recent
discussions about how we store stream config led to considering a need
to rework the internals, and usage of the structure in drivers makes
this more difficult.

Patch 1/2 drops usage of the structure in the ds90ub913 driver, and
patch 2/2 then makes the structure private to v4l2-subdev.c.

Ideally we should also make v4l2_subdev_pad_config private, but it has a
few more users:

drivers/media/pci/saa7134/saa7134-empress.c
drivers/media/platform/atmel/atmel-isi.c
drivers/media/platform/intel/pxa_camera.c
drivers/media/platform/marvell/mcam-core.c
drivers/media/platform/renesas/renesas-ceu.c
drivers/media/platform/via/via-camera.c
drivers/staging/media/deprecated/atmel/atmel-isc-base.c

All those drivers are video-centric drivers that use
v4l2_subdev_pad_config to implement TRY_FMT. I think we could use
v4l2_subdev_call_state_try() in those drivers, like done in

commit f076057f0107c3ef890bfad8d6658387504e7f11
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Fri Jul 1 14:15:59 2022 +0100

    media: stm32: dcmi: Fix subdev op call with uninitialized state

I however lack the ability to test that beside compile testing.

Laurent Pinchart (2):
  media: i2c: ds90ub913: Stop accessing streams configs directly
  media: v4l2-subdev: Make struct v4l2_subdev_stream_config private

 drivers/media/i2c/ds90ub913.c         | 17 +++++++++--------
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 25 +------------------------
 3 files changed, 34 insertions(+), 32 deletions(-)


base-commit: c0b1da281d84d33281fc49289f0c7f8aada450ff
prerequisite-patch-id: e09080849e2b6fabfc70eb12b5c99c42111d3823
-- 
Regards,

Laurent Pinchart


