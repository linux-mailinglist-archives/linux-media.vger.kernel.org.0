Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88959792531
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235089AbjIEQBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354631AbjIENGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 09:06:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC1B1AE
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 06:06:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44D67AF2;
        Tue,  5 Sep 2023 15:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693919101;
        bh=jFuen25Z7ypsc5BzO2lrHHAwiA1ESfjuoJ90MHPSXi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H9X+Gr4R/PwnCzizOAL6G1jkYROSAoV6xLnBqzddvSReu/4COvqYvvClh9nvjp8Hf
         oEbvB1mYr+yHiME9JB4/wzmCVVz0YWHqWIyBj7nGqYEK5AX+bgJYF3AeoyYusEQXic
         DkHZbhWZbnvn+j89xpzqir2HH7i1mG9MojC4+nd0=
Date:   Tue, 5 Sep 2023 16:06:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 01/10] media: Documentation: Align numbered list
Message-ID: <20230905130640.GF11700@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808075538.3043934-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Aug 08, 2023 at 10:55:29AM +0300, Sakari Ailus wrote:
> Align lines for numbered list so that Sphinx produces an uniform output
> for all list entries.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 27 +++++++++----------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a4f1df7093e8..b023918177b5 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -579,20 +579,19 @@ is started.
>  
>  There are three steps in configuring the streams:
>  
> -1) Set up links. Connect the pads between sub-devices using the :ref:`Media
> -Controller API <media_controller>`
> +1) Set up links. Connect the pads between sub-devices using the
> +   :ref:`Media Controller API <media_controller>`

While at it, could we standardize on 1. vs. 1) ? Both are used in the
same file. After this patch they both render to "1.", but it would be
nice to be consistent in the source too.

>  
> -2) Streams. Streams are declared and their routing is configured by
> -setting the routing table for the sub-device using
> -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> -setting the routing table will reset formats and selections in the
> -sub-device to default values.
> +2) Streams. Streams are declared and their routing is configured by setting the
> +   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
> +   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
> +   reset formats and selections in the sub-device to default values.
>  
> -3) Configure formats and selections. Formats and selections of each stream
> -are configured separately as documented for plain sub-devices in
> -:ref:`format-propagation`. The stream ID is set to the same stream ID
> -associated with either sink or source pads of routes configured using the
> -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> +3) Configure formats and selections. Formats and selections of each stream are
> +   configured separately as documented for plain sub-devices in
> +   :ref:`format-propagation`. The stream ID is set to the same stream ID
> +   associated with either sink or source pads of routes configured using the
> +   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
>  
>  Multiplexed streams setup example
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> @@ -619,8 +618,8 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
>  To configure this pipeline, the userspace must take the following steps:
>  
>  1) Set up media links between entities: connect the sensors to the bridge,
> -bridge to the receiver, and the receiver to the DMA engines. This step does
> -not differ from normal non-multiplexed media controller setup.
> +   bridge to the receiver, and the receiver to the DMA engines. This step does
> +   not differ from normal non-multiplexed media controller setup.
>  
>  2) Configure routing
>  

3) below contains two paragraphs that are not indented.

-- 
Regards,

Laurent Pinchart
