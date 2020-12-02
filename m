Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F322CC958
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 23:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgLBWIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 17:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgLBWIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 17:08:42 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B77C0617A6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 14:07:59 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0051B634C24;
        Thu,  3 Dec 2020 00:06:34 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kkaGh-000369-Bw; Thu, 03 Dec 2020 00:06:35 +0200
Date:   Thu, 3 Dec 2020 00:06:35 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 5/5] media: bcm2835-unicam: Add TODO file
Message-ID: <20201202220635.GC4351@valkosipuli.retiisi.org.uk>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110174036.220883-6-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Nov 10, 2020 at 06:40:36PM +0100, Jacopo Mondi wrote:
> The bcm2835-unicam driver is currently in staging mainly for
> two reasons:
> - Handling of CSI-2 embedded data
> - Usage of both media controller API and subdev kAPI
> 
> Provide a more detailed description of the currently on-going design
> discussions in the associated TODO file.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/bcm2835-unicam/TODO | 37 +++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 drivers/staging/media/bcm2835-unicam/TODO
> 
> diff --git a/drivers/staging/media/bcm2835-unicam/TODO b/drivers/staging/media/bcm2835-unicam/TODO
> new file mode 100644
> index 0000000000000..c7840872eea4c
> --- /dev/null
> +++ b/drivers/staging/media/bcm2835-unicam/TODO
> @@ -0,0 +1,37 @@
> +BCM2835 Unicam driver TODO list
> +===============================
> +
> +The unicam driver could be considered ready to be moved out of the staging
> +directory in terms of code quality and expected functionalities.
> +
> +However there currently are two design issues that suggest the driver is
> +better kept in staging for the time being.
> +
> +CSI-2 Embedded data support:
> +----------------------------
> +
> +The RaspberryPi camera stack and camera applications rely on the availability of
> +the sensor produced CSI-2 embedded data, whose support is currently not
> +finalized in mainline Linux.
> +
> +The driver conditionally registers an additional video device node
> +'unicam-embedded' with a single sink pad which connects to the sensor
> +sub-device source pad #1 to expose ancillary data.
> +
> +Currently none of the mainline sensor drivers register more than a single pad,
> +and consequentially no embedded data from the sensor are exposed to userspace.
> +
> +The current implementation is then subject to changes depending on how support
> +for CSI-2 embedded data gets finalized in Linux.

Are you looking to use out-of-tree sensor drivers that have two pads? I'd
rather see sensor drivers merged to mainline proper.

But as noted in the other e-mail, we need VC / stream support so this needs
to be addressed for reasons not related to Unicam.

> +
> +Media controller support:
> +-------------------------
> +
> +Due to compatibility reasons with the existing RaspberryPi software ecosystem
> +the unicam driver implements the media controller interface to allow the
> +enumeration of the connected entities but handles the configuration of the
> +sensor sub-device using the v4l2-subdev kAPI instead of delegating that to
> +user-space.
> +
> +Discussions are on-going on how this should be better handled (driver option,
> +KConfig option etc etc).

That's a fair use case. There are two ways to handle it, either in the
kernel where the choice affects how the user space looks like. You have an
option of module parameter or Kconfig option there, and both are true
annoyances.

Another option is to work around it in the user space, wrapping the IOCTL
calls. This way no kernel build or module load time parameters would be
needed to switch between the two sets of user space programs.

We probably can't decide it now, but could an MC-only driver + user space
compatibility layer be an option here?

-- 
Kind regards,

Sakari Ailus
