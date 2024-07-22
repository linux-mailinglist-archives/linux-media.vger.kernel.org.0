Return-Path: <linux-media+bounces-15257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E574939117
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 16:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30B1B1C2140F
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 14:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5114516DC33;
	Mon, 22 Jul 2024 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JcwGK4YF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15616DC18;
	Mon, 22 Jul 2024 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660212; cv=none; b=UxxHav9/1uJn58B8Srtlf0nNqEVS6BORD21EZloy6R9qUnUg9tsJhkz5vZOOyjqnocBxBZzGxse+YKNTjDGE1A4k1HYkse9t2mDkDbpv+rUGuOK/VJ0EwJmOkqaDf9+zj63F4IsF7dzu6VwZRWDQARuZcvO/tnSC3FBKQFzbbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660212; c=relaxed/simple;
	bh=wkJ8iIbLDJtmLlh5cYY3xms12LJiEr8uCYopHEhJ5W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2iEosY/6piqaRbf+Gr4me9umuSW0Rj6r1z6YXdqFRs/de8YFT3eburrWj01qcMWzVU5RoyKu3/Xk/pHz4r4lkmYQ/dqmE4410sIYdfqXNNt/qN9Lk3Htz8AqkfU7bE8gp7u0/HfRcZ0IwvasdAGgOJCGdHdJFmkrIUS6bvcnJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JcwGK4YF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B81014CF;
	Mon, 22 Jul 2024 16:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721660167;
	bh=wkJ8iIbLDJtmLlh5cYY3xms12LJiEr8uCYopHEhJ5W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcwGK4YFLaWzl6MONALmDjSq4dU5xT7BrQpRGDCZ31iHblzoWGUBYqTNSe7k/KUjf
	 hJAuvRLjpGT/ZPc9kgoUJQhQQA2Gftml16cDvtNXzM5RE9PHGr5ELmv7eDqG5D+mgz
	 JRbIXiK1mVyRarB7Ldt5q5yR/63cbqTWrR7CKR3Y=
Date: Mon, 22 Jul 2024 17:56:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 14/14] admin-guide: media: Update documents for
 StarFive Camera Subsystem
Message-ID: <20240722145631.GM13497@pendragon.ideasonboard.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-15-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-15-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Tue, Jul 09, 2024 at 01:38:24AM -0700, Changhuang Liang wrote:
> Add ISP output parameters and 3A statistisc collection data video
> device for documents.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../admin-guide/media/starfive_camss.rst      | 11 +++++++---
>  .../media/starfive_camss_graph.dot            | 22 +++++++++++--------
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/starfive_camss.rst b/Documentation/admin-guide/media/starfive_camss.rst
> index ca42e9447c47..020f1969e67f 100644
> --- a/Documentation/admin-guide/media/starfive_camss.rst
> +++ b/Documentation/admin-guide/media/starfive_camss.rst
> @@ -58,15 +58,20 @@ The media controller pipeline graph is as follows:
>      :alt:   starfive_camss_graph.dot
>      :align: center
>  
> -The driver has 2 video devices:
> +The driver has 4 video devices:
>  
> +- output_params: The meta output device, transmitting the parameters to ISP
> +  module.
>  - capture_raw: The capture device, capturing image data directly from a sensor.
>  - capture_yuv: The capture device, capturing YUV frame data processed by the
> -  ISP module
> +  ISP module.
> +- capture_scd: The meta capture device, capturing 3A statistics collection data

Renaming "scd" to "stats" (here and through the whole series) would make
the code and documentation easier to understand for third parties, as
it's not immediately clear what "scd" means. I won't insist too much if
this would cause lots of issues.

> +  processed by the ISP module.
>  
>  The driver has 3 subdevices:
>  
> -- stf_isp: is responsible for all the isp operations, outputs YUV frames.
> +- stf_isp: is responsible for all the isp operations, outputs YUV frames
> +  and 3A statistics collection data.
>  - cdns_csi2rx: a CSI-2 bridge supporting up to 4 CSI lanes in input, and 4
>    different pixel streams in output.
>  - imx219: an image sensor, image data is sent through MIPI CSI-2.
> diff --git a/Documentation/admin-guide/media/starfive_camss_graph.dot b/Documentation/admin-guide/media/starfive_camss_graph.dot
> index 8eff1f161ac7..7961255d3ad6 100644
> --- a/Documentation/admin-guide/media/starfive_camss_graph.dot
> +++ b/Documentation/admin-guide/media/starfive_camss_graph.dot
> @@ -1,12 +1,16 @@
>  digraph board {
>  	rankdir=TB
> -	n00000001 [label="{{<port0> 0} | stf_isp\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000001:port1 -> n00000008 [style=dashed]
> -	n00000004 [label="capture_raw\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> -	n00000008 [label="capture_yuv\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> -	n0000000e [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n0000000e:port1 -> n00000001:port0 [style=dashed]
> -	n0000000e:port1 -> n00000004 [style=dashed]
> -	n00000018 [label="{{} | imx219 6-0010\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000018:port0 -> n0000000e:port0 [style=bold]
> +	n00000001 [label="{{<port0> 0 | <port1> 1} | stf_isp\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port2 -> n0000000e
> +	n00000001:port3 -> n00000012 [style=dashed]
> +	n00000006 [label="output_params\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n00000006 -> n00000001:port1 [style=dashed]
> +	n0000000a [label="capture_raw\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +	n0000000e [label="capture_yuv\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +	n00000012 [label="capture_scd\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +	n0000001c [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n/dev/v4l-subdev1 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000001c:port1 -> n00000001:port0 [style=dashed]
> +	n0000001c:port1 -> n0000000a [style=dashed]
> +	n00000026 [label="{{} | imx219 6-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000026:port0 -> n0000001c:port0 [style=bold]
>  }

-- 
Regards,

Laurent Pinchart

