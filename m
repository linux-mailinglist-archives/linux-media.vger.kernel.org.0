Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D6126B7FB
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgIPAdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:33:39 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57437 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgIONm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:42:29 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7DAB660004;
        Tue, 15 Sep 2020 13:41:29 +0000 (UTC)
Date:   Tue, 15 Sep 2020 15:45:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/3] media: docs: v4l2-subdev: move "Subdev registration"
 to a subsection
Message-ID: <20200915134519.5u3vedcyek5ivvjq@uno.localdomain>
References: <20200904215141.20862-1-luca@lucaceresoli.net>
 <20200904215141.20862-2-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904215141.20862-2-luca@lucaceresoli.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Fri, Sep 04, 2020 at 11:51:40PM +0200, Luca Ceresoli wrote:
> The subdev registration topic is pretty lengthy, and takes more than
> half of the "V4L2 sub-devices" section. Help readers in finding their
> way through the document by dedicating a subsection to
> "Subdev registration".
>
> Each of the two registration methods takes many paragraphs, but since
> adding a subsubsection would be overkill, just emphasize them in bold.

I see bold being used mostly for C symbols names, I don't know if
that's a kind of convention or not.

I would not mind a subsection to be honest...
I think the patch is good and I'll provide a tag, maybe others can
provide opinions too!

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/driver-api/media/v4l2-subdev.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 9a7dddd97f5a..fb66163deb38 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -138,6 +138,9 @@ ensures that width, height and the media bus pixel code are equal on both source
>  and sink of the link. Subdev drivers are also free to use this function to
>  perform the checks mentioned above in addition to their own checks.
>
> +Subdev registration
> +~~~~~~~~~~~~~~~~~~~
> +
>  There are currently two ways to register subdevices with the V4L2 core. The
>  first (traditional) possibility is to have subdevices registered by bridge
>  drivers. This can be done when the bridge driver has the complete information
> @@ -157,7 +160,7 @@ below.
>  Using one or the other registration method only affects the probing process, the
>  run-time bridge-subdevice interaction is in both cases the same.
>
> -In the synchronous case a device (bridge) driver needs to register the
> +In the **synchronous** case a device (bridge) driver needs to register the
>  :c:type:`v4l2_subdev` with the v4l2_device:
>
>  	:c:func:`v4l2_device_register_subdev <v4l2_device_register_subdev>`
> @@ -238,9 +241,9 @@ contain several subdevs that use an I2C bus, but also a subdev that is
>  controlled through GPIO pins. This distinction is only relevant when setting
>  up the device, but once the subdev is registered it is completely transparent.
>
> -In the asynchronous case subdevice probing can be invoked independently of the
> -bridge driver availability. The subdevice driver then has to verify whether all
> -the requirements for a successful probing are satisfied. This can include a
> +In the **asynchronous** case subdevice probing can be invoked independently of
> +the bridge driver availability. The subdevice driver then has to verify whether
> +all the requirements for a successful probing are satisfied. This can include a
>  check for a master clock availability. If any of the conditions aren't satisfied
>  the driver might decide to return ``-EPROBE_DEFER`` to request further reprobing
>  attempts. Once all conditions are met the subdevice shall be registered using
> --
> 2.28.0
>
