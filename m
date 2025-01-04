Return-Path: <linux-media+bounces-24239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D612A01140
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 01:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC3AB18849E6
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 00:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD2FEC5;
	Sat,  4 Jan 2025 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TDkZdnkv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B76134BD
	for <linux-media@vger.kernel.org>; Sat,  4 Jan 2025 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735949376; cv=none; b=U92K80UlnSxbfYRnYgedHjtGZSaF7YdCiSxRiO3SSp4dHX4DOnsTjD5zZqx6snMsg1R0SYvoZQYv4BevwP7TD6p7YRZalsRYGZ7wmrRYZcASEL3vHbJg+39UCNZm6XLQIBaV37inSwjgVqdMwf8QNjBZqClyWdCkEn5ZeWeBUsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735949376; c=relaxed/simple;
	bh=Xe+qH9guc091WSE+NzwF18ob5YFMCR1KG/IfAuCzzWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H134d4B3G6joim6DRcQv5qIkx6/yp1fko/b0v0zUq7dc2rkLhoYKYbMA1g8ubW0VPK6huLlhUgkIGn/I2xJ16F1ifqbgWYXQRn6G67j1fUfVWE2wr6AiXBobMwAgcCedcy7kQnXgs9JI2/8rPT9CoN6inmlbtIRkdKEMZL2TUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TDkZdnkv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03549465;
	Sat,  4 Jan 2025 01:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735949323;
	bh=Xe+qH9guc091WSE+NzwF18ob5YFMCR1KG/IfAuCzzWM=;
	h=Date:From:To:Cc:Subject:From;
	b=TDkZdnkvRCaqv01j+xLVhzi0kFuUvASEnUJ599WeFXTM/Ntn5OrcII1U64osB3uUu
	 nCVgIi3DSK7+SNMIDqRFzijS1CuKTEQ31zAG8cpSCSUsM7n2xVNQyDkm50SMCzduR9
	 hqmb8zoj+3L3Trw8DJhYtXOudUR6WU0Zz60zEmPc=
Date: Sat, 4 Jan 2025 02:09:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.14] imx8-isi fixes and improvements
Message-ID: <20250104000932.GT554@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 2762eab6d4140781840f253f9a04b8627017248b:

  media: uvcvideo: Add Kurokesu C1 PRO camera (2025-01-02 09:58:30 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20250103

for you to fetch changes up to 98ee3acfaff63aa41f3e34a13c2254b486e528ae:

  media: nxp: imx8-isi: Add i.MX8ULP support (2025-01-03 20:38:54 +0200)

The series passes CI:
https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1339055.
As it is based on top of the latest fdo next branch, there's *no* need
to rebase.

----------------------------------------------------------------
Miscellaneous imx8-isi fixes and improvements

----------------------------------------------------------------
Guoniu.zhou (2):
      dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string
      media: nxp: imx8-isi: Add i.MX8ULP support

Laurentiu Palcu (1):
      media: nxp: imx8-isi: fix v4l2-compliance test errors

 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml |  2 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c       | 14 ++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h       |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c      |  3 +++
 4 files changed, 20 insertions(+)


-- 
Regards,

Laurent Pinchart


