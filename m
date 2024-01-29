Return-Path: <linux-media+bounces-4345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1868404FA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0194A280D8E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67485605B1;
	Mon, 29 Jan 2024 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hV0wfjbK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE20604AA;
	Mon, 29 Jan 2024 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531259; cv=none; b=jxc8M9/4b7Gg9SGj+W9iX9dL2xXf/b5hyXwgz1J5RNxuQxdaXDHWoe7yM5ZDR3dzhBe9W6Lm+fdry6yN02925HGlfPkiQwuY52BpJLUZKT1cv4EoJbT7dvAA2uAVdr15dbeD+381N2EjpYkuHgPzaJsuvje8wmK84p1IaPVM2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531259; c=relaxed/simple;
	bh=LD9PXBHasMJZgGdP7dqL3EAkH+ae11rR+hI3U+UsZRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuNQD7v4k/n7REasVtzdULXZuu4SsGQSBRZc9awfRS48FzNoCBsww2IF9nbi1n4TOgodt3MjWuMGghiMRBkm8ZTtcMxMC8FWSHjPPpyyrcUnoz8SwO4Gi6UJ+5UUiLc6CUMnmBBswPXGZH8sf2u+WL34jFuO7szeHwP0wSzscfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hV0wfjbK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FFB91803;
	Mon, 29 Jan 2024 13:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706531178;
	bh=LD9PXBHasMJZgGdP7dqL3EAkH+ae11rR+hI3U+UsZRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hV0wfjbKo92FIVlElfyP/cM6PG/q2iFuoPQOkqKD4H3NktWYUgk5FXVekLTeYivzc
	 tTxmPjr5npkZ3qHxiG2HqsVOTOqnaQGXBaEadpLTCeTgQWT7/jEU6BWRXnnYwubSAR
	 Hcs6IoBoqPWgTocl3pr823q/zsNRkmRRalyMj2h4=
Date: Mon, 29 Jan 2024 14:27:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?B?IlV3ZSBLbGVpbmUtS8ODwrZuaWci?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <20240129122736.GC8131@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>

Hello Morimoto-san,

(CC'ing Sakari Ailus)

On Mon, Jan 29, 2024 at 12:54:24AM +0000, Kuninori Morimoto wrote:
> 
> Hi Rob
> 
> This is v2 of port base loop patch-set
> 
> We have endpoint base functions
> 	- of_graph_get_next_endpoint()
> 	- of_graph_get_endpoint_count()
> 	- for_each_endpoint_of_node()
> 
> But to handling "port" base things, it is not useful. We want to have
> "port" base functions, too. This patch-set adds it.
> 
> Because current existing drivers couldn't use "port" base functions,
> it were implemented in a different way. This patch-set doesn't try
> to full-replace to avoid unknown bug, try easy / quick replace only
> for now, but easy to know how "port" base functions are needed.
> 
> Because I can't test the driver which I can't use, non-ASoC drivers
> needs Tested-by, Acked-by.

The strategy sounds good to me. However, I'm wondering if you shouldn't
take one more step in the core, and implement these as fwnode
operations. Or is there a reason why OF is special, and iterating over
ports would be useful for drivers on OF systems but not on other types
of systems ?

> v1 -> v2
> 	- tidyup function explain
> 	- add missing header on each files
> 
> Kuninori Morimoto (13):
>   of: property: add port base loop
>   of: property: use of_graph_get_next_port() on of_graph_get_next_endpoint()
>   of: property: add of_graph_get_next_endpoint_raw()
>   drm: omapdrm: use of_graph_get_next_endpoint_raw()
>   media: xilinx-tpg: use of_graph_get_next_endpoint_raw()
>   ASoC: audio-graph-card: use of_graph_get_next_endpoint_raw()
>   ASoC: audio-graph-card2: use of_graph_get_next_port()
>   ASoC: audio-graph-card2: use of_graph_get_next_endpoint_raw()
>   ASoC: test-component: use for_each_port_of_node()
>   fbdev: omapfb: use of_graph_get_remote_port()
>   fbdev: omapfb: use of_graph_get_next_port()
>   fbdev: omapfb: use of_graph_get_next_endpoint_raw()
>   fbdev: omapfb: use of_graph_get_next_endpoint()
> 
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |   2 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c             |   2 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |   2 +-
>  drivers/of/property.c                         |  92 +++++++++++++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 101 +-----------------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c   |   3 +-
>  include/linux/of_graph.h                      |  23 ++++
>  include/video/omapfb_dss.h                    |  11 --
>  sound/soc/generic/audio-graph-card.c          |   2 +-
>  sound/soc/generic/audio-graph-card2.c         |  31 ++----
>  sound/soc/generic/test-component.c            |   2 +-
>  17 files changed, 133 insertions(+), 162 deletions(-)

-- 
Regards,

Laurent Pinchart

