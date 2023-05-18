Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF256707F12
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 13:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjERLWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 07:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjERLWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 07:22:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E818EE7A
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 04:22:30 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DD632C6;
        Thu, 18 May 2023 13:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684408936;
        bh=vRLIOXLm2MltG/P/TmFzzGjm2xLzY9an1fBn0l9W6nA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UoRjuo3vcAi51jkIJp0efrTnWK5RBgt8xtliAdBZopIsyvZCXhjBeC0QGkTMHo3Da
         bG+3N4e19BYGxMO49DQjz7BEuGkIy8Q4moGl50UeAkcOgGTmM9bLhQgBRHEH9FA8Cv
         AeGpDpdySiu5+sOnmbaXfrX7EwpFmrMj29RhiP5I=
Message-ID: <de0ace0f-7d8c-756f-92e7-e4f455e5114d@ideasonboard.com>
Date:   Thu, 18 May 2023 14:22:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: v4l2-subdev: Fix missing kerneldoc for client_caps
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
 <20230518094131.7d5057b7@sal.lan>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230518094131.7d5057b7@sal.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2023 11:41, Mauro Carvalho Chehab wrote:
> Em Tue, 18 Apr 2023 13:59:24 +0300
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> escreveu:
> 
>> Add missing kernel doc for the new 'client_caps' field in struct
>> v4l2_subdev_fh.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   include/media/v4l2-subdev.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index cfd19e72d0fc..9d0a6a993fb0 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1119,6 +1119,7 @@ struct v4l2_subdev {
>>    * @vfh: pointer to &struct v4l2_fh
>>    * @state: pointer to &struct v4l2_subdev_state
>>    * @owner: module pointer to the owner of this file handle
>> + * @client_caps: bitmask of V4L2_SUBDEV_CLIENT_CAP_*
> 
> Did you actually check this patch? Adding an asterisk at the end
> should hit a Sphinx warning, as asterisk is the italic markup.
> So, it seems to me that this patch is actually replacing one warning
> by another one!

htmldocs compiles fine for me, without warnings (from this piece of 
code), and the resulting html looks ok. pdfdocs doesn't compile, but I 
have no clue why it fails, and it fails without this patch too.

> Also, it is not pointing the patch this was supposed to be fixing.

That's true.

> Btw, I actually did a fix for it already, while I was working to fix
> some issues on Jenkins. See below. If you're ok with that, please add
> your A-B or R-B. Otherwise, submit another one, after testing that
> Sphinx won't be printing an additional warning.
> 
> Regards,
> Mauro
> 
> ---
> 
> [PATCH] media: v4l2-subdev.h: document client_caps at struct v4l2_subdev_fh
> 
> Gets rid of this documentation warning:
> 
> 	./include/media/v4l2-subdev.h:1130: warning: Function parameter or member 'client_caps' not described in 'v4l2_subdev_fh'
> 
> By adding a documentation about such new field.
> 
> Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index cfd19e72d0fc..62362da0d604 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1119,6 +1119,9 @@ struct v4l2_subdev {
>    * @vfh: pointer to &struct v4l2_fh
>    * @state: pointer to &struct v4l2_subdev_state
>    * @owner: module pointer to the owner of this file handle
> + * @client_caps:
> + *	client capabilities to inform the kernel of the behavior
> + *	of the client as set by VIDIOC_SUBDEV_S_CLIENT_CAP.
>    */
>   struct v4l2_subdev_fh {
>   	struct v4l2_fh vfh;

I'm fine with this version too.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

