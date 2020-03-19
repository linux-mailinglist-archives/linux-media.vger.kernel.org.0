Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2914918C03C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 20:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgCSTZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 15:25:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50760 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgCSTZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 15:25:25 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 065FEA53;
        Thu, 19 Mar 2020 20:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584645922;
        bh=9fMfpE2TtqoGMTxxGlZAZuUO960rZTFDs3z/4LMmd+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJKYSV8aS/wFm50ih860prvm3u7uSpDRpvZ/pRnsVfFraHAlpxwhPDRRYSS/9hPJu
         tjoCczm7FwrE8jvyVsJlxCj66UJ44iQe+SnbfLEef8bFlJ9Q4SLyPhpz8bYxkjoMbp
         iqk7IbifBb2IjvktV5YQHOh8mH25JgmYTi26rwJc=
Date:   Thu, 19 Mar 2020 21:25:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: imx.rst: Add example media graph
Message-ID: <20200319192516.GM14585@pendragon.ideasonboard.com>
References: <20200319183932.12403-1-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319183932.12403-1-slongerbeam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Thu, Mar 19, 2020 at 11:39:32AM -0700, Steve Longerbeam wrote:
> Add the media graph topology for the i.MX6Q SabreSD.

You may want to explain why having the graph in the kernel documentation
is useful. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  Documentation/media/v4l-drivers/imx.rst       | 14 +++++
>  .../media/v4l-drivers/imx6q-sabresd.dot       | 56 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/media/v4l-drivers/imx6q-sabresd.dot
> 
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 1246573c1019..9ce4b7d122e5 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -102,6 +102,20 @@ Some of the features of this driver include:
>    problems with the ADV718x video decoders.
>  
>  
> +Topology
> +--------
> +  
> +The following shows the media topology for the i.MX6Q SabreSD:
> +
> +.. _imx6q_sabresd_topology_graph:
> +
> +.. kernel-figure:: imx6q-sabresd.dot
> +    :alt:   Diagram of the i.MX6Q SabreSD media pipeline topology
> +    :align: center
> +
> +    Media pipeline graph on i.MX6Q SabreSD
> +
> +
>  Entities
>  --------
>  
> diff --git a/Documentation/media/v4l-drivers/imx6q-sabresd.dot b/Documentation/media/v4l-drivers/imx6q-sabresd.dot
> new file mode 100644
> index 000000000000..7d56cafa1944
> --- /dev/null
> +++ b/Documentation/media/v4l-drivers/imx6q-sabresd.dot
> @@ -0,0 +1,56 @@
> +digraph board {
> +	rankdir=TB
> +	n00000001 [label="{{<port0> 0} | ipu1_csi0\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port2 -> n00000005 [style=dashed]
> +	n00000001:port1 -> n0000000f:port0 [style=dashed]
> +	n00000001:port1 -> n0000000b:port0 [style=dashed]
> +	n00000005 [label="ipu1_csi0 capture\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n0000000b [label="{{<port0> 0 | <port1> 1} | ipu1_vdic\n/dev/v4l-subdev1 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000b:port2 -> n0000000f:port0 [style=dashed]
> +	n0000000f [label="{{<port0> 0} | ipu1_ic_prp\n/dev/v4l-subdev2 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000f:port1 -> n00000013:port0 [style=dashed]
> +	n0000000f:port2 -> n0000001c:port0 [style=dashed]
> +	n00000013 [label="{{<port0> 0} | ipu1_ic_prpenc\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000013:port1 -> n00000016 [style=dashed]
> +	n00000016 [label="ipu1_ic_prpenc capture\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +	n0000001c [label="{{<port0> 0} | ipu1_ic_prpvf\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000001c:port1 -> n0000001f [style=dashed]
> +	n0000001f [label="ipu1_ic_prpvf capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +	n0000002f [label="{{<port0> 0} | ipu1_csi1\n/dev/v4l-subdev5 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000002f:port2 -> n00000033 [style=dashed]
> +	n0000002f:port1 -> n0000000f:port0 [style=dashed]
> +	n0000002f:port1 -> n0000000b:port0 [style=dashed]
> +	n00000033 [label="ipu1_csi1 capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +	n0000003d [label="{{<port0> 0} | ipu2_csi0\n/dev/v4l-subdev6 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000003d:port2 -> n00000041 [style=dashed]
> +	n0000003d:port1 -> n0000004b:port0 [style=dashed]
> +	n0000003d:port1 -> n00000047:port0 [style=dashed]
> +	n00000041 [label="ipu2_csi0 capture\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +	n00000047 [label="{{<port0> 0 | <port1> 1} | ipu2_vdic\n/dev/v4l-subdev7 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000047:port2 -> n0000004b:port0 [style=dashed]
> +	n0000004b [label="{{<port0> 0} | ipu2_ic_prp\n/dev/v4l-subdev8 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000004b:port1 -> n0000004f:port0 [style=dashed]
> +	n0000004b:port2 -> n00000058:port0 [style=dashed]
> +	n0000004f [label="{{<port0> 0} | ipu2_ic_prpenc\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000004f:port1 -> n00000052 [style=dashed]
> +	n00000052 [label="ipu2_ic_prpenc capture\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
> +	n00000058 [label="{{<port0> 0} | ipu2_ic_prpvf\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000058:port1 -> n0000005b [style=dashed]
> +	n0000005b [label="ipu2_ic_prpvf capture\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
> +	n0000006b [label="{{<port0> 0} | ipu2_csi1\n/dev/v4l-subdev11 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000006b:port2 -> n0000006f [style=dashed]
> +	n0000006b:port1 -> n0000004b:port0 [style=dashed]
> +	n0000006b:port1 -> n00000047:port0 [style=dashed]
> +	n0000006f [label="ipu2_csi1 capture\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
> +	n00000079 [label="{{<port0> 0} | imx6-mipi-csi2\n/dev/v4l-subdev12 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000079:port2 -> n0000002f:port0 [style=dashed]
> +	n00000079:port3 -> n0000003d:port0 [style=dashed]
> +	n00000079:port1 -> n0000007f:port0 [style=dashed]
> +	n00000079:port4 -> n00000083:port0 [style=dashed]
> +	n0000007f [label="{{<port0> 0 | <port1> 1} | ipu1_csi0_mux\n/dev/v4l-subdev13 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000007f:port2 -> n00000001:port0 [style=dashed]
> +	n00000083 [label="{{<port0> 0 | <port1> 1} | ipu2_csi1_mux\n/dev/v4l-subdev14 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000083:port2 -> n0000006b:port0 [style=dashed]
> +	n00000087 [label="{{} | ov5640 1-003c\n/dev/v4l-subdev15 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000087:port0 -> n00000079:port0 [style=dashed]
> +}

-- 
Regards,

Laurent Pinchart
