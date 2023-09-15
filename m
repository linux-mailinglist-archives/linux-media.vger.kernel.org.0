Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20467A1A34
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbjIOJRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbjIOJRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:17:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDB09B
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:16:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5D1C2C6;
        Fri, 15 Sep 2023 11:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694769324;
        bh=L37XgJL8EFX6zZVETvlogaImDDKgS5tT76WfoB68WMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bm0bp4DMn/OY3t+Ngtqs0vNQkH3XIvBqEkPAtCxPQ8fAKqD4uZwHW2fpAbEP54RRD
         NgAgdCZB/OwAWEANFcbC8OzB7KIRzPVObZYHZd8JlcjEiZDQFQvokBtVjlvzKAdcB3
         45TfmcuGkRk5BesmCVjG9jbdYu/17FRqbo4AwNqQ=
Date:   Fri, 15 Sep 2023 12:17:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 1/7] media: Documentation: Align numbered list, make it a
 proper ReST
Message-ID: <20230915091711.GB14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 10:28:03AM +0300, Sakari Ailus wrote:
> Align lines for numbered list so that Sphinx produces an uniform output
> for all list entries. Also indent paragraphs of such list entries for
> consistency.
> 
> Also use ReST numbered list syntax for the entries.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 49 +++++++++----------
>  1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a4f1df7093e8..43988516acdd 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -579,20 +579,19 @@ is started.
>  
>  There are three steps in configuring the streams:
>  
> -1) Set up links. Connect the pads between sub-devices using the :ref:`Media
> -Controller API <media_controller>`
> +1. Set up links. Connect the pads between sub-devices using the
> +   :ref:`Media Controller API <media_controller>`
>  
> -2) Streams. Streams are declared and their routing is configured by
> -setting the routing table for the sub-device using
> -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> -setting the routing table will reset formats and selections in the
> -sub-device to default values.
> +2. Streams. Streams are declared and their routing is configured by setting the
> +   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
> +   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
> +   reset formats and selections in the sub-device to default values.
>  
> -3) Configure formats and selections. Formats and selections of each stream
> -are configured separately as documented for plain sub-devices in
> -:ref:`format-propagation`. The stream ID is set to the same stream ID
> -associated with either sink or source pads of routes configured using the
> -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> +3. Configure formats and selections. Formats and selections of each stream are
> +   configured separately as documented for plain sub-devices in
> +   :ref:`format-propagation`. The stream ID is set to the same stream ID
> +   associated with either sink or source pads of routes configured using the
> +   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
>  
>  Multiplexed streams setup example
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> @@ -618,11 +617,11 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
>  
>  To configure this pipeline, the userspace must take the following steps:
>  
> -1) Set up media links between entities: connect the sensors to the bridge,
> -bridge to the receiver, and the receiver to the DMA engines. This step does
> -not differ from normal non-multiplexed media controller setup.
> +1. Set up media links between entities: connect the sensors to the bridge,
> +   bridge to the receiver, and the receiver to the DMA engines. This step does
> +   not differ from normal non-multiplexed media controller setup.
>  
> -2) Configure routing
> +2. Configure routing
>  
>  .. flat-table:: Bridge routing table
>      :header-rows:  1
> @@ -656,14 +655,14 @@ not differ from normal non-multiplexed media controller setup.
>        - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>        - Pixel data stream from Sensor B
>  
> -3) Configure formats and selections
> +3. Configure formats and selections
>  
> -After configuring routing, the next step is configuring the formats and
> -selections for the streams. This is similar to performing this step without
> -streams, with just one exception: the ``stream`` field needs to be assigned
> -to the value of the stream ID.
> +   After configuring routing, the next step is configuring the formats and
> +   selections for the streams. This is similar to performing this step without
> +   streams, with just one exception: the ``stream`` field needs to be assigned
> +   to the value of the stream ID.
>  
> -A common way to accomplish this is to start from the sensors and propagate the
> -configurations along the stream towards the receiver,
> -using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> -stream endpoint in each sub-device.
> +   A common way to accomplish this is to start from the sensors and propagate
> +   the configurations along the stream towards the receiver, using
> +   :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> +   stream endpoint in each sub-device.

-- 
Regards,

Laurent Pinchart
