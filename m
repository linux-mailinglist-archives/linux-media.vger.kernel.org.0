Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5C126FA5EB
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 12:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbjEHKOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 06:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbjEHKON (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 06:14:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FA53AA12
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 03:14:12 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 539FA755;
        Mon,  8 May 2023 12:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683540844;
        bh=Npyxkuk0SoVE98D1CdapQrgnws4OAjDG00fXDTuqw7k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HHTME3OVaOcPxf/aKDmUXrkY7KZ9Htr98FVf5NuvMFoCLyb9U4XfllSExqfVpB6+m
         sUaGPxBuNzHZK3UnWKTevkkuF/DOLhhiJHc8tRM9eTZUrUQ5hZYhxfDB4CwpUt1C85
         VZ3tp7mvOMyNDWpptPfUSu/wbYg1Zfl2kq7ZsArA=
Message-ID: <691a9d35-218f-4eef-ddb0-5834f1e222c8@ideasonboard.com>
Date:   Mon, 8 May 2023 13:14:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 2/7] media: v4l: subdev: Support INTERNAL_SOURCE pads in
 routing IOCTLs
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-3-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230505215257.60704-3-sakari.ailus@linux.intel.com>
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
> Take the new INTERNAL_SOURCE pad flag into account in validating routing
> IOCTL argument. Effectively this is a SINK pad in this respect. Due to the
> union there's no need to check for the particular name.

What union? The one you add in the next patch?

As a concept the internal source pads sound good, and they work in 
practice in my tests. But this union is what grates me a bit. We have a 
flag, MEDIA_PAD_FL_INTERNAL_SOURCE, which tells which field of the union 
to use, and then we go and do not use the new union field. Well, and 
also the naming, as we normally have source and sink pads, but now we 
also have internal source pads, which are actually identical to sink pads...

I understand the idea and reasoning, but the two points above do confuse 
me and I'm sure would confuse others also.

I wonder if it would be less or more confusing to simplify this by just 
adding a MEDIA_PAD_FL_INTERNAL, which could be applied to either a 
source or a sink pad, and would prevent linking to it. The flag would 
indicate that the stream from/to that pad is generated/consumed 
internally. (I don't know when you would need an internal pad to consume 
data, but... who knows, the need might pop up =).

That would mean that an "internal sink pad" would generate a data 
stream, i.e. it's a "source", but I think a normal sink pad is almost 
the same anyway: when considering entity's internal routing, the normal 
sink pad is a "source", and the same logic would apply with the internal 
pads too.

An internal sink pad that generates a stream is a bit more confusing 
than an internal source pad, but I think that confusion is less than the 
rest of the confusion in the code-side that comes with the internal 
source pads.

  Tomi

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2ec179cd1264..6312fc2bf1f0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -906,7 +906,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>   				return -EINVAL;
>   
>   			if (!(pads[route->sink_pad].flags &
> -			      MEDIA_PAD_FL_SINK))
> +			      (MEDIA_PAD_FL_SINK |
> +			       MEDIA_PAD_FL_INTERNAL_SOURCE)))
>   				return -EINVAL;
>   
>   			if (route->source_pad >= sd->entity.num_pads)
> @@ -1787,7 +1788,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>   
>   		/* Validate the sink and source pad numbers. */
>   		if (route->sink_pad >= sd->entity.num_pads ||
> -		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
> +		    !(sd->entity.pads[route->sink_pad].flags &
> +		      (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL_SOURCE))) {
>   			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
>   				i, route->sink_pad);
>   			goto out;

