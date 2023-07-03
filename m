Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8FA74565E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 09:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjGCHrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 03:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjGCHru (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 03:47:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BABCE5A
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 00:47:46 -0700 (PDT)
Received: from ideasonboard.com (85-160-45-219.reb.o2.cz [85.160.45.219])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42916558;
        Mon,  3 Jul 2023 09:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688370421;
        bh=bqKx/Qh8gnFa1Mkmaov7FU1IXxVjGCyZaYryeZixwCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YYrZaAPmKkSP7OYcXJe7MOsgqPItAAJnl7Fuxp7Qv19K2uO2tF3I73ZnJulVAAqbw
         1QAm8I8qR3cEw2SiJ5tzqMBfHyUzCgbUnxp+P2/kJg2HvfmmOgaMz23XkYjneGljJC
         COe53nCoeMcTPE5pwWfwPPmbv8UCJeYM3eUU8Gc4=
Date:   Mon, 3 Jul 2023 09:47:37 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 4/7] media: uapi: v4l: Document source routes
Message-ID: <qiomumxpmbhtowvpdorruk74gcrsbab6c5vfchcfmdt5cd34pi@i7cdk3g6f2ff>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630204338.126583-5-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Fri, Jun 30, 2023 at 11:43:35PM +0300, Sakari Ailus wrote:
> Document how internal pads are used on source routes.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a4f1df7093e8..5a46c9a9d352 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -551,6 +551,26 @@ A stream at a specific point in the media pipeline is identified by the
>  sub-device and a (pad, stream) pair. For sub-devices that do not support
>  multiplexed streams the 'stream' field is always 0.
>
> +.. _v4l2-subdev-source-routes:
> +
> +Source routes
> +^^^^^^^^^^^^^

I always found the concept of source routes a bit confusing, should we
instead just present internal pads ?

> +
> +Cases where a single sub-device pad is a source of multiple streams are special
> +as there is no external sink pad for such a route. In those cases, the sources
> +of the streams are indicated by source routes that have an internal source pad
> +as the sink pad of such a route. Internal source pads have the
> +:ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK``
> +pad flags set.

All this last part is a little bit hard to parse, not your fault but
the fact "internal source pads" are actually "SINK" pads is a bit
confusing ?

Can we remove the "source route" concept to avoid mixing source/sink ?

This can be rewritten as

Internal pads
^^^^^^^^^^^^^

Cases where a single sub-device pad is a source of multiple streams are special
as there is no external sink pad for such a route. A typical example is a
sensor device which produces a video stream and a metadata stream of
embedded data. To support such cases internal pads are introduced as
sink pads of such internally generated streams.
Internal source pads have the :ref:`MEDIA_PAD_FL_INTERNAL
<MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK`` pad flags set.

> +Internal source pads have all the properties of a sink pad in such case,

Also here, "Internal source pads" are actually sinks :)

I would drop "source" from "Internal source pads"


> +including formats and selections. The format in this case is the source format
> +of the stream. An internal pad always has a single stream only (0).
> +
> +Generally source routes are not modifiable but they can be activated and

s/source routes/internal routes/ ?

> +deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> +
>  Interaction between routes, streams, formats and selections
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> --
> 2.39.2
>
