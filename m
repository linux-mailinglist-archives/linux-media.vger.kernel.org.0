Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87896FA7C4
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 12:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbjEHKev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 06:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbjEHKeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 06:34:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780D1170E
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 03:33:28 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23EE7755;
        Mon,  8 May 2023 12:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683542001;
        bh=MA5yPih+wEsLs1ip+Z26MU79e/aP1sjwSUyDKNxDYtU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gRx9wr/gbKP38qJxXTeGh2LvY8feZly2Hnr7q3NghBe7hSDObyLD3x1NIlVa9fvrn
         pZpyk8hOM+xXWqQbH3Yl4J2QFzFduStaVOZdW188Q1zP5TrMqdOA8BEjI+QqwUCPG1
         hy/fbGaLfQxEvBGPcw92zNtiaq+URnQyBtfFkji4=
Message-ID: <5b7038ce-d897-931f-2c6e-30bdd1a30342@ideasonboard.com>
Date:   Mon, 8 May 2023 13:33:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 3/7] media: uapi: v4l: Document source routes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-4-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230505215257.60704-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2023 00:52, Sakari Ailus wrote:
> Document how internal pads are used on source routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst     | 18 ++++++++++++++++++
>   .../media/v4l/vidioc-subdev-g-routing.rst      |  5 +++++
>   include/uapi/linux/v4l2-subdev.h               |  6 +++++-
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a4f1df7093e8..395e06d2f0f2 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -551,6 +551,24 @@ A stream at a specific point in the media pipeline is identified by the
>   sub-device and a (pad, stream) pair. For sub-devices that do not support
>   multiplexed streams the 'stream' field is always 0.
>   
> +.. _v4l2-subdev-source-routes:
> +
> +Source routes
> +^^^^^^^^^^^^^
> +
> +Cases where a single sub-device pad is a source of multiple streams are special
> +as there is no sink pad for such a route. In those cases, an internal pad is
> +used as the sink pad. Such pads have the :ref:`MEDIA_PAD_FL_INTERNAL_SOURCE
> +<MEDIA-PAD-FL-INTERNAL-SOURCE>` flag set.
> +
> +Internal pads have all the properties of a sink pad in such case, including
> +formats and selections. The format in this case is the source format of the
> +stream. An internal pad always has a single stream only (0).
> +
> +Generally source routes are not modifiable but they can be activated and
> +inactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> +

I find the above chapter a bit difficult to read, but I think we need to 
conclude on the internal-pad vs internal-source-pad discussion first. 
However, one point/question:

You write that there's only one stream in an internal pad. I wonder if 
that's a good or a necessary limitation... Do you see that allowing 
multiple streams brings extra complexity? It's still up to each driver 
to decide how many streams they support (most would just support a 
single one), so each driver can easily enforce that limit.

I'm fine with starting with only single-stream support, but if we later 
need to loosen that restriction, I wonder if it'll be difficult if we 
have specified that there can be only one stream. I.e. will the drivers 
and the userspace depend on that limit.

  Tomi

