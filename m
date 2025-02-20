Return-Path: <linux-media+bounces-26450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD44A3D8F1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB06188B3AE
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524721F3BBE;
	Thu, 20 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GKwk5ZKU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D131D63C2;
	Thu, 20 Feb 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051502; cv=none; b=VCKtyFWiFYqBJue4qbV13lUUSnFjcWa50djP+1HjwpptcnmjbyjuBycCl0mbXAU7FIJzIcLBb80+m/dQjZZy7uaA9NN6dgJ7q7sBZHbLTK7pgWhSLmil2wOMhillzCgU2ToLklCludazXA18VrWZmcaTecmMVVYuKKGKSuTR0yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051502; c=relaxed/simple;
	bh=xlLl1DJawLisfXNM+nY3LWGqJWif1fFYtqrXN7NQV9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPwpuv0xLsQ9ZIGOvP2yhZ6Q8BB99IIdfhbPA6nz2FdQOk2uHy5Hx5X0WBqxFM/NqdhLWv6nMaOV1rUYQd1un0KN1wDrmzyb1xnYFJV9jxUvTd0u/k5/brRbZzn+ENte/b/PqBk35UKrZ1BpL7DDxGvOv0MuFRP/qlskY2tinnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GKwk5ZKU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5799074C;
	Thu, 20 Feb 2025 12:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740051415;
	bh=xlLl1DJawLisfXNM+nY3LWGqJWif1fFYtqrXN7NQV9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKwk5ZKUmbL7p+4UlYHMd9yLoF+qhwDfO0XI15X3Y/17FQw11Lyfn8Kw7Vu8ZJV3D
	 fL9TUKSCylYI7F86cDZtGiMbY+Rdwp9hz2A2cjAlcVR9dUHs34BbpXuJc7B36waG6K
	 KP2QE64oFCS07JtT6hLnotuPVhTLCfhOAlktIsy0=
Date: Thu, 20 Feb 2025 12:38:15 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, 
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Message-ID: <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
References: <20250220092036.6757-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>

Hi Cosmin

On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
> Currently, the v4l2_subdev_state_xlate_streams() function is used
> to translate streams from one pad to another.
> This function takes the entire subdev state as argument, but only makes
> use of the routing.

Correct, but is this a problem ?

Is this the first step for a larger rework or is this a drive-by
beautification ?

I'm asking because (and I know it's hard to strike a balance) this
kind of changes tend to make back-porting a more painful, and if
only justified by "it looks better" I would be a bit hesitant in
taking them.


>
> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
> used without the entire subdev state, to avoid passing the entire state
> around when not needed.
>
> Convert all usages of v4l2_subdev_state_xlate_streams() to
> v4l2_subdev_routing_xlate_streams().
>
> Remove v4l2_subdev_state_xlate_streams().
>
> V2:
>   * Fix description of parameters
>
> Cosmin Tanislav (3):
>   media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>   media: use v4l2_subdev_routing_xlate_streams()
>   media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>
>  drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>  drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>  drivers/media/i2c/max96714.c                  | 16 ++++++-------
>  drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>  include/media/v4l2-subdev.h                   | 10 ++++----
>  8 files changed, 53 insertions(+), 47 deletions(-)
>
> --
> 2.48.1
>
>

