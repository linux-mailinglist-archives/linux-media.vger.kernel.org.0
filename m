Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC65715572
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 08:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjE3GSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 02:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjE3GSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 02:18:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5569BF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 23:18:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06FCAE4;
        Tue, 30 May 2023 08:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685427479;
        bh=ng/xJMtcnAXKP9hN6KbPpceuT8TSvfWBHq5lc6eRiXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nWZpRGDsHHueM4kt0dRXO5GqVQsoT2wjiN17tMRth0K66JZJ6Dq2ieDUKmhYk3IVe
         EVRIXP1N3wqMbkKBKjk5i/yv4EXhyDq/3Mm2Cc8y6ErxmtAsyYRdeZdK/5hIKOS9Da
         uMub5sjqBm/6oq/WfFwWrBN6s50ldxR3gAcZk8l0=
Date:   Tue, 30 May 2023 09:18:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 32/32] media: Documentation: v4l: Document
 sub-device notifiers
Message-ID: <20230530061820.GB6404@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-33-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-33-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, May 25, 2023 at 12:16:15PM +0300, Sakari Ailus wrote:
> Document that sub-device notifiers are now registered using
> v4l2_async_subdev_nf_init(). No documentation is changed as it seems that
> sub-device notifiers were not documented apart from kernel-doc comments.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/v4l2-subdev.rst | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 83d3d29608136..d62b341642c96 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -193,9 +193,7 @@ picked up by bridge drivers.
>  Bridge drivers in turn have to register a notifier object. This is
>  performed using the :c:func:`v4l2_async_nf_register` call. To
>  unregister the notifier the driver has to call
> -:c:func:`v4l2_async_nf_unregister`. The former of the two functions
> -takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
> -pointer to struct :c:type:`v4l2_async_notifier`.
> +:c:func:`v4l2_async_nf_unregister`.
>  
>  Before registering the notifier, bridge drivers must do two things: first, the
>  notifier must be initialized using the :c:func:`v4l2_async_nf_init`.
> @@ -204,6 +202,12 @@ that the bridge device needs for its operation. Several functions are available
>  to add subdevice descriptors to a notifier, depending on the type of device and
>  the needs of the driver.
>  
> +For a sub-device driver to register a notifier, the process is otherwise similar
> +to that of a bridge driver, apart from that the notifier is initialised using
> +:c:func:`v4l2_async_subdev_nf_init` instead. A sub-device notifier may complete
> +only after the V4L2 device becomes available, i.e. there's a path via async
> +sub-devices and notifiers to that root notifier.

This is correct, but I doubt anyone who doesn't have an in-depth
knowledge of the v4l2-async framework will be able to understand it. For
instance, the concept of "root notifier" isn't explained anywhere. And
the v4l2_async_subdev_nf_register() function isn't mentioned.

The v4l2-async documentation needs a rewrite.

> +
>  :c:func:`v4l2_async_nf_add_fwnode`, :c:func:`v4l2_async_nf_add_fwnode_remote`
>  :c:and func:`v4l2_async_nf_add_i2c` are for registering their async sub-devices
>  :c:with the notifier.

-- 
Regards,

Laurent Pinchart
