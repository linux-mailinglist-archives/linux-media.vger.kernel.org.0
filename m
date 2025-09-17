Return-Path: <linux-media+bounces-42657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E9B7DD91
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893FB520CC2
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 10:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A9D302770;
	Wed, 17 Sep 2025 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kQwX5uvD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FAD27B327
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103581; cv=none; b=haw76aCkSwkeIJWGER7OweF6qJ8IsYx4e68T6so5pgV1tHvI9Xbl6GuF1N6X7bxmfeMtfEHPj8Agfbw2krTfxnrrL8rE4nZrMTHp8Em/BaHAlewEgZxgz9zp4INPhbZF6EPCmIgU1cUBl1CxHKZq4Rfy442fx2H7q2KI5wYlx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103581; c=relaxed/simple;
	bh=uJSu8v+IksTcZNMv5O/pb3dNDkS+lhhZMh5ypq2g+o8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UBmegeU8J3PwQpM3h0XJ28J7P6yWjBfQvYNJQiUR6VMZKnnMMb/srgBgHsU7ZtTRlABNBlt1XyZEFtI5rk/6BkrG1w2mfs4JFNlk7APVCgzw7vdnOetgOQWo7vbvOnZ/P9nbR3ZVLlKnajWWX9qaYPWwWh0yOfyXd4fDaK7T+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kQwX5uvD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7D03555A;
	Wed, 17 Sep 2025 12:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758103492;
	bh=uJSu8v+IksTcZNMv5O/pb3dNDkS+lhhZMh5ypq2g+o8=;
	h=Date:From:To:Cc:Subject:From;
	b=kQwX5uvDl73qjMVEVVsiob3q/VMfCy6mvjasg56uI1m1yfYc9Y8fd8dMru86HwVYW
	 qzG6oqjEODaI+fykyuxuoor53u8MvDW4aniitqBw7tIzLe/gJafXFApDiDog4hgaLZ
	 upd+xHVVFllBmL/HP4wvNopk+I7KlfPa3DXzD+Lo=
Date: Wed, 17 Sep 2025 13:05:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.18] Renesas drivers changes
Message-ID: <20250917100542.GC29182@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

These commits escaped my attention when I check for remaining changes
for v6.18. If still possible, I would like to get them merged.

There should be nothing problematic here, the changes are small, and I
haven't received any 0day bot report for the changes in the PM ops
macros. I except that spending the whole of next week in linux-next
before the merge window opens will be more than enough to confirm that.

The following changes since commit 0e2ee70291e64a30fe36960c85294726d34a103e:

  media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID (2025-09-13 18:35:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20250917

for you to fetch changes up to f598a4b589fc7b7e824ca1cf00abaaba6a67a0c8:

  media: vsp1: Export missing vsp1_isp_free_buffer symbol (2025-09-17 12:52:00 +0300)

----------------------------------------------------------------
Renesas media drivers changes:

- Fix missing export symbol in vsp1 driver
- Switch to SYSTEM_SLEEP/RUNTIME_PM_OPS

----------------------------------------------------------------
Geert Uytterhoeven (5):
      media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
      media: renesas: ceu: Convert to RUNTIME_PM_OPS()
      media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIME_PM_OPS()

Laurent Pinchart (1):
      media: vsp1: Export missing vsp1_isp_free_buffer symbol

 drivers/media/platform/renesas/rcar-vin/rcar-core.c |  8 ++++----
 drivers/media/platform/renesas/rcar_drif.c          | 12 ++++++------
 drivers/media/platform/renesas/rcar_fdp1.c          | 10 ++++------
 drivers/media/platform/renesas/renesas-ceu.c        | 10 ++++------
 drivers/media/platform/renesas/vsp1/vsp1_drv.c      | 14 +++++++-------
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c     |  1 +
 6 files changed, 26 insertions(+), 29 deletions(-)

-- 
Regards,

Laurent Pinchart

