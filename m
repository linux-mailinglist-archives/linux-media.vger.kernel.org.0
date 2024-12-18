Return-Path: <linux-media+bounces-23677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E259F5BDB
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 01:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A19727A5D0A
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 00:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9833595B;
	Wed, 18 Dec 2024 00:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vDllvh8k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E51E4A4
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 00:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482465; cv=none; b=jzzZ3XklZLYyAe50QRHJMnm/uC/aNK4eIB7wOisVC4z3XIgKt3E8jmBwj0r78gq6saHxwveSt3VtN95dF/9FOqfqN7drK24Qa991MxriZfc/u8/LGyDaAvO/Ycbi7xzOSR1SfG+lCzQKdA6DNtMLEk7jswhvF4aXHGBoW59BH9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482465; c=relaxed/simple;
	bh=0YGwWt8k08NPha0532OoAoYxiQFcSR39OzoSoVtKaag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Teia+woh+R0aMJZyw1B+E48txdVFlHC0Y+AkON3qTy1vYx4/FQHiJ7uJyDi+h7W/skGwIQfapiYgEWzhPxMNi2drmctN7qv3N9R1RHVMThqSwHyM6vzgFtDgjPyp8e+/1kK3FOtR/hv5tzp0lOhkUogUNFfFkBKrtv8m31qI3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vDllvh8k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14B27670;
	Wed, 18 Dec 2024 01:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734482423;
	bh=0YGwWt8k08NPha0532OoAoYxiQFcSR39OzoSoVtKaag=;
	h=Date:From:To:Cc:Subject:From;
	b=vDllvh8k2EKfe2pI8f8+FaY4wsackpIuQAjbiDPVz2ZkBz8nnUfSmYMIi/cjDCEVY
	 49vS/3NpHfJzXecFAv8Y8/JZZqZ7QqnimSiGv6hahjvRVVUxU1a3ozf3KeQ9VIfgFt
	 MtXSerZ9OpM8TLK75XZxmyVY32Cgya9M7hscn9lo=
Date: Wed, 18 Dec 2024 02:40:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.14] imx8-isi fixes and improvements
Message-ID: <20241218004058.GA24802@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20241218

for you to fetch changes up to ee8b722db9a4d4b370ecf9a0b2a6ad39e254daee:

  media: nxp: imx8-isi: Add i.MX8ULP support (2024-12-04 18:50:05 +0200)

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

