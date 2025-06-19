Return-Path: <linux-media+bounces-35433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A3AE0EB5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 394E87AF3B2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EFD245025;
	Thu, 19 Jun 2025 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MuvuCkYj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AEF30E838
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366054; cv=none; b=nzDu2n+azXwmGnbws3dpZnzX89MVoEVK3zWkKbiM0GrbbJPxALuCY/+ULa/wmYx0fkaHdPTTn4/voxaAzxY175cIdYMUfcdFBoyAK8hbFCNd+VOpRsAXB6iIT8NiShmnnsEsMQnKCgGk+RpJVuUxEEG959oP2E58hYTkVSnf5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366054; c=relaxed/simple;
	bh=HDS1WkRH9rNjeTRUpaJIEt8/O62oUalCdCz/krPskMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxDQ7yRBNW5yKlwR0oF/wVKxfZFJoM26o6Vy2OJAiNxilMUYy09H1hKijjnImJxdjCkR6gGgcDh7Ix9F+C0rC6aTWqccsBYn1PrMOxSg+ZPZeiRngCsmY0HFHhq8VjsNTLVlgBEHTcdVzftQ7kbtOOXTY6W4rmdu7adHdntkKxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MuvuCkYj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D3AD2EC;
	Thu, 19 Jun 2025 22:47:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366036;
	bh=HDS1WkRH9rNjeTRUpaJIEt8/O62oUalCdCz/krPskMw=;
	h=From:To:Cc:Subject:Date:From;
	b=MuvuCkYjXIr912BlIKxjROz4nxO28RaQ2QSC1hnor/LQczIC0N7P7nVapwZ4/l6g2
	 jIL4HeOb7SmAWgn1upp7HH90t8flrBVk9E1w4xLC9T/JncwmhTtu7PfQCna64q56GP
	 mdVnGl8CngMLUeM0oG35EMeToPIem83z1m4ZTslc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] media: v4l2-subdev: Handle number of routes limit in subdev core
Date: Thu, 19 Jun 2025 23:47:07 +0300
Message-ID: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

While adding routing support to the imx-mipi-csis driver, I realized I
had to implement a limit on the number of active routes due to a
limitation of the in-kernel subdev API. Four drivers already implement
the same check, and copying it in a fifth driver felt too much like
cargo-cult.

This small patch series centralizes the check on the number of routes in
the v4l2-subdev core. See patch 1/5 for details. The check is also
relaxed compared to the driver implementations to only count the number
of active routes, as that is the real constraint imposed by the subdev
frame descriptor API.

Patches 2/5 to 5/5 then remove the duplicated check from drivers.

Laurent Pinchart (5):
  media: v4l2-subdev: Limit the number of active routes to
    V4L2_FRAME_DESC_ENTRY_MAX
  media: i2c: ds90ub913: Drop check on number of active routes
  media: i2c: ds90ub953: Drop check on number of active routes
  media: i2c: ds90ub960: Drop check on number of active routes
  media: i2c: max96714: Drop check on number of active routes

 drivers/media/i2c/ds90ub913.c         |  8 --------
 drivers/media/i2c/ds90ub953.c         |  8 --------
 drivers/media/i2c/ds90ub960.c         |  8 --------
 drivers/media/i2c/max96714.c          |  7 -------
 drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
 5 files changed, 14 insertions(+), 31 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
Regards,

Laurent Pinchart


