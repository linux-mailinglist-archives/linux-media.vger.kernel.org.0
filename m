Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FDC727994
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbjFHIG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjFHIG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:06:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CA52129
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 01:06:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B48BB64A13
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 08:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACA6C433D2;
        Thu,  8 Jun 2023 08:06:52 +0000 (UTC)
Message-ID: <b46dab08-0fdc-fc71-a759-e933d831ccec@xs4all.nl>
Date:   Thu, 8 Jun 2023 10:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 2/7] media: v4l: subdev: Support INTERNAL_SOURCE pads in
 routing IOCTLs
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-3-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230505215257.60704-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2023 23:52, Sakari Ailus wrote:
> Take the new INTERNAL_SOURCE pad flag into account in validating routing
> IOCTL argument. Effectively this is a SINK pad in this respect. Due to the
> union there's no need to check for the particular name.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2ec179cd1264..6312fc2bf1f0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -906,7 +906,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				return -EINVAL;
>  
>  			if (!(pads[route->sink_pad].flags &
> -			      MEDIA_PAD_FL_SINK))
> +			      (MEDIA_PAD_FL_SINK |
> +			       MEDIA_PAD_FL_INTERNAL_SOURCE)))
>  				return -EINVAL;
>  
>  			if (route->source_pad >= sd->entity.num_pads)
> @@ -1787,7 +1788,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>  
>  		/* Validate the sink and source pad numbers. */
>  		if (route->sink_pad >= sd->entity.num_pads ||
> -		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
> +		    !(sd->entity.pads[route->sink_pad].flags &
> +		      (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL_SOURCE))) {

So this relates to my reply to the previous patch: calling a sink pad
an INTERNAL_SOURCE is really confusing.

Some suggestions for alternative names:

1) MEDIA_PAD_FL_SINK_INTERNAL
2) MEDIA_PAD_FL_SINK_INTERNAL_SOURCE (or _SRC)
3) MEDIA_PAD_FL_SINK_FROM_INTERNAL_SOURCE (or _SRC)

IMHO the name *has* to start with MEDIA_PAD_FL_SINK_ to indicate
that it is a sink pad, followed by something that indicates that
it is fed from an internal source.

Regards,

	Hans

>  			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
>  				i, route->sink_pad);
>  			goto out;

