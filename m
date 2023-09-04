Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90DED7910F2
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 07:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbjIDFe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 01:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbjIDFe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 01:34:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15946F9
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 22:34:23 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27C61497;
        Mon,  4 Sep 2023 07:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693805576;
        bh=zs4kGHF3GPj01G+ctlxltJJYAUkBTwhzoaqwSgzHIpQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MyqDq1G/MzcqVO9EOYh0Y3E3rd3Mau1Of9ipIT3RClCzWcQa7vn6cMAZGmBhqjCSG
         F8G+VB1P/Nik5K0e0XZ13vYvJHhBgMLbKKHbdGGpm2aNhLw90REEycXOapuk5FfTPd
         7SM8kKESsM2Z2TO1VdNK0+ox84d/iPdR6o6DWuMk=
Message-ID: <d6704989-ecd3-744a-6593-c0f3208eaaba@ideasonboard.com>
Date:   Mon, 4 Sep 2023 08:34:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support depends
 on streams
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/08/2023 18:55, Laurent Pinchart wrote:
> Routing support, through the subdev .set_routing() operation, requires
> the subdev to support streams. This is however not clearly documented
> anywhere. Fix it by expanding the operation's documentation to indicate
> that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   include/media/v4l2-subdev.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b325df0d54d6..0b04ed1994b6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
>    *		     operation shall fail if the pad index it has been called on
>    *		     is not valid or in case of unrecoverable failures.
>    *
> - * @set_routing: enable or disable data connection routes described in the
> - *		 subdevice routing table.
> + * @set_routing: Enable or disable data connection routes described in the
> + *		 subdevice routing table. Subdevs that implement this operation
> + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
>    *
>    * @enable_streams: Enable the streams defined in streams_mask on the given
>    *	source pad. Subdevs that implement this operation must use the active

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

