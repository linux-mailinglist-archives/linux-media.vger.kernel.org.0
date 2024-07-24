Return-Path: <linux-media+bounces-15316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DB193AFF1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 12:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2010F1F22B62
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 10:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35343155CB2;
	Wed, 24 Jul 2024 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D/VWW2RB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63F17C6A
	for <linux-media@vger.kernel.org>; Wed, 24 Jul 2024 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721817866; cv=none; b=MAABwnhYYOdOPSmyCyeGmlA+ZMbGUZfAuZvUDMxhAvaTtbvJm68qh0uKuB1WmClwZeN6hZtTMWLie2kkgAi/w5fT4jf+WN0xQ77nWoXvNe/qSUjAPoubo05W2xkVxMiGpn1ne+BhHO06jj6QLMxhdfw+vLe6bqEkIdqXcTMdWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721817866; c=relaxed/simple;
	bh=dWciJ20dIcAUj3o3pH/zZz68nZOMcjUvGkR2Zlh4dS4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=J3ERqNUYvefXvrxcKl+wUaYIXuikWjnxdeVrWUZ4dy/9PJVoGYmPXtJtP+xHSjaIU2LRN44Lt7EDkrwOfOnOL8vz0JDxzAEB1kkQM5DusDpxvVbE01aneAg1H3rr2CUNjDis7Gstcql7aOg9rZGhZe8EDoqqkYaWekV42nyI2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D/VWW2RB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 961B913D7;
	Wed, 24 Jul 2024 12:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721817819;
	bh=dWciJ20dIcAUj3o3pH/zZz68nZOMcjUvGkR2Zlh4dS4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=D/VWW2RBSXwFb3YfVAwbOHTVqvgX3RrVXIaMaS7fGRHXn1xbeA8AaaHH7kXBtNA94
	 NDHrw0miRb1ysGaECRwwEsu/AYCr/e7ltDbyzD6zEkuIOxMAdLk0ccoFFmOIbNwrHo
	 Qd8q1bwBNJ3onCID6cVJirPULNUb3cZ7oGiaj2Ac=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v7 0/12] media: rkisp1: Extensible parameters and companding
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Stefan Klug <stefan.klug@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Wed, 24 Jul 2024 11:44:20 +0100
Message-ID: <172181786012.1463270.9516240500127620073@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Jacopo,

For this series,

Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

on a Debix-SOM with both an IMX335 and IMX283. And also in particular, I
can confirm the Gamma control is now functional in v7 \o/ Thanks.

--
Kieran


Quoting Jacopo Mondi (2024-07-24 09:49:51)
> v6->v7:
> - Collect [PATCH v2 0/5] media: rkisp1: Add support for the companding bl=
ock
> - Fix GOC handling
> - Fix newly introduced errors in checkstyle and documentation reported by
>   https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/123=
1492
>=20
> v5->v6:
> - Collect [v5.2 6/7] from Laurent
> - Collect Paul's tags
> - Add extra validation for unexpected data after the payload end as
>   suggested by Sakari
>=20
> v4->v5:
> - Refine validation of the ext params buffer following Laurent's suggesti=
on
> - perform memcpy of the parameters buffer after sizes validation
>=20
> v3->v4:
> - Introduce 'union rkisp1_ext_params_config' to avoid casts in the block
>   handlers
>=20
> v2->v3:
> - Address Laurent's comments on the uAPI:
>   - rename $block_config with  just 'config'
>   - reduce header size
>   - rename a few fields/blocks
>=20
> - Address Laurent's comment on the params node:
>   - Use the plane payload for memcpy() and buffer validation
>   - drop buf_out_validate() and use buf_prepare() only
>   - validate the total buffer size against the buffer payload
>   - use const pointers where possible
>=20
> v1->v2:
> - re-order patches to introduce parameters buffer caching for the existing
>   "fixed" format before introducing the "extensible" format
> - align all structures to 64-bit boundaries in the uAPI
> - remove NO_CHANGE enablement state and cache a bitmask of enabled blocks
> - address review comments in documentation
>=20
> The VeriSilicon ISP8000 IP, supported through the rkisp1 driver in the Li=
nux
> kernel, is integrated in several SoCs from different vendors. Different
> revisions of the IP differ in the number of supported features and in the
> register space location assigned to specific ISP blocks.
>=20
> The current configuration parameters format, defined in
> include/uapi/linux/rkisp1-config.h is realized by a C structure (struct
> rkisp1_params_cfg) which wraps other structures that allows to configure
> specific ISP blocks. The layout of the parameters buffer is part of the L=
inux
> kernel uAPI and can hardly be extended or modified to adapt it to differe=
nt
> revisions of the same IP.
>=20
> This series proposes the introduction of a new parameters format for the =
RkISP1
> (without dropping support for the existing one) which is designed with th=
e goals
> of being:
>=20
> 1) versioned: can be changed without breaking existing applications
> 2) extensible: new blocks and parameters can be added without breaking th=
e uABI
>=20
> To do so, a new 'struct rkisp1_ext_params_cfg' type is introduced. It wra=
ps an
> header and a data buffer, which userspace fills with configuration blocks
> for each ISP block it intends to configure. The parameters buffer is thus=
 of
> different effective sizes, depending on the number of blocks userspace in=
tends
> to configure.
>=20
> The kernel driver parses the data block and decides, based on the version=
ing
> number and the platform it operates on, how to handle each block.
>=20
> The parameters format is very similar to the parameters format implemented
> in the in-review Mali C55 ISP driver [1]
>=20
> CI pipeline [2]
>=20
> [1] https://lore.kernel.org/linux-media/20240529152858.183799-15-dan.scal=
ly@ideasonboard.com/
> [2] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1=
231500
>=20
> Jacopo Mondi (7):
>   media: uapi: rkisp1-config: Add extensible params format
>   media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
>   media: rkisp1: Add struct rkisp1_params_buffer
>   media: rkisp1: Copy the parameters buffer
>   media: rkisp1: Cache the currently active format
>   media: rkisp1: Implement extensible params support
>   media: rkisp1: Implement s_fmt/try_fmt
>=20
> Laurent Pinchart (2):
>   media: rkisp1: Add helper function to swap colour channels
>   media: rkisp1: Add features mask to extensible block handlers
>=20
> Paul Elder (3):
>   media: rkisp1: Add register definitions for the companding block
>   media: rkisp1: Add feature flags for BLS and compand
>   media: rkisp1: Add support for the companding block
>=20
>  Documentation/admin-guide/media/rkisp1.rst    |   11 +-
>  .../media/v4l/metafmt-rkisp1.rst              |   57 +-
>  .../platform/rockchip/rkisp1/rkisp1-common.c  |   14 +
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |   38 +-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |    9 +-
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 1016 +++++++++++++++--
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |   23 +
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   |   51 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  include/uapi/linux/rkisp1-config.h            |  576 ++++++++++
>  include/uapi/linux/videodev2.h                |    1 +
>  11 files changed, 1640 insertions(+), 157 deletions(-)
>=20
> --
> 2.45.2
>

