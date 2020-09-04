Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBB025D692
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 12:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbgIDKlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 06:41:15 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:37763 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgIDKlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 06:41:11 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 711E4C0004;
        Fri,  4 Sep 2020 10:41:06 +0000 (UTC)
Date:   Fri, 4 Sep 2020 12:44:53 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: ov5640: Fail probe on unsupported
 bus_type
Message-ID: <20200904104453.le66sdczzcjyhecz@uno.localdomain>
References: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200813171337.5540-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200813171337.5540-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar

On Thu, Aug 13, 2020 at 06:13:37PM +0100, Lad Prabhakar wrote:
> Fail probe if unsupported bus_type is detected.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>


> ---
>  drivers/media/i2c/ov5640.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 160d2857352a..3191e2b223c3 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3078,6 +3078,13 @@ static int ov5640_probe(struct i2c_client *client)
>  		return ret;
>  	}
>
> +	if (sensor->ep.bus_type != V4L2_MBUS_PARALLEL &&
> +	    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> +	    sensor->ep.bus_type != V4L2_MBUS_BT656) {
> +		dev_err(dev, "Unsupported bus type %d\n", sensor->ep.bus_type);
> +		return -EINVAL;
> +	}
> +
>  	/* get system clock (xclk) */
>  	sensor->xclk = devm_clk_get(dev, "xclk");
>  	if (IS_ERR(sensor->xclk)) {
> --
> 2.17.1
>
