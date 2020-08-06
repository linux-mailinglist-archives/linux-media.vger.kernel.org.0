Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6223DCC1
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbgHFQzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:55:48 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:33314 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbgHFQzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:55:47 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 8EC6B3B2C33;
        Thu,  6 Aug 2020 14:37:42 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 75B25C000F;
        Thu,  6 Aug 2020 14:32:18 +0000 (UTC)
Date:   Thu, 6 Aug 2020 16:35:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: ov772x: Document endpoint
 properties
Message-ID: <20200806143559.ha6amfa4gq2o4jbi@uno.localdomain>
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Aug 03, 2020 at 12:39:11PM +0100, Lad Prabhakar wrote:
> Document endpoint properties required for parallel interface
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/i2c/ov772x.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> index 0b3ede5b8e6a..1f4153484717 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> @@ -21,6 +21,22 @@ subnode for its digital output video port, in accordance with the video
>  interface bindings defined in Documentation/devicetree/bindings/media/
>  video-interfaces.txt.
>
> +Endpoint node required properties for parallel connection are:
> +- remote-endpoint: a phandle to the bus receiver's endpoint node.

we allow endpoints without a remote end connected usually. They can be
filled in later, in example, with an overlay.

> +- bus-width: shall be set to <8> for 8 bits parallel bus
> +	     or <10> for 10 bits parallel bus
> +- data-shift: shall be set to <2> for 8 bits parallel bus
> +	      (lines 9:2 are used) or <0> for 10 bits parallel bus

defining what is required or optional might be hard. I don't see the
driver enforcing their presence and I assume they have safe default.
Maybe make them optional and specify what the defaul value is ?


> +- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> +		(Not required for bus-type equal 6)
> +- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> +		(Not required for bus-type equal 6)

If they're not required, they're optional, aren't they ? :)

> +- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> +	       signal. (Not required for bus-type equal 6)

Why the pclk polarity is does not apply to BT.656 ?

> +- bus-type: data bus type. Possible values are:
> +	    5 - Parallel
> +	    6 - Bt.656

Are we making this required, or do we expect this to be deduced
depending on which other properties have been specified ? Sakari it
seems you would like this to become a properties that has to be
specified most of the times, right ? (I tend to agree with that FWIW),
but does it impact retro-compatibility ?

> +
>  Example:
>
>  &i2c0 {
> --
> 2.17.1
>
