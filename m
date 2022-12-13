Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F9E64B01B
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 08:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbiLMHA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 02:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234613AbiLMHAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 02:00:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1986D17E20
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 23:00:23 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 775F04A7;
        Tue, 13 Dec 2022 08:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670914821;
        bh=6air7Md2Wjw/4lAoS6t+E3fUT4fW6o1B6G+XU4ccyrs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HNylMCwVVJ+zE1BJVfQXefixsfe7QTaOxG95QCgoYMSB9mazn9FwqcvSUGT4efGnN
         cBJ+jTT2eE94wofS1iIPbIt8tq9/loYxgIeEKbpeLVwE0L9sstHSFDA3fzhy4WDVlp
         +O1+xNivxju76ajCbwaW5+Zt6Lkz2fiC67cK8Jb8=
Message-ID: <104dbafe-9cc6-d8d0-b14d-ca0ba02f5b89@ideasonboard.com>
Date:   Tue, 13 Dec 2022 09:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: mc: Improve the media_entity_has_pad_interdep()
 documentation
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
References: <20221212221719.18053-1-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212221719.18053-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/12/2022 00:17, Laurent Pinchart wrote:
> Document the function parameters, the requirements on the pad0 and pad1
> arguments, the locking requirements and the return value. Also improve
> the documentation of the corresponding .has_pad_interdep() operation,
> stating clearly that the operation must be called through the
> media_entity_has_pad_interdep() function only.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/mc/mc-entity.c | 15 ++++++++++++++-
>   include/media/media-entity.h |  4 +++-
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index f19bb98071b2..e9b71b895f98 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -226,7 +226,13 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
>    * Graph traversal
>    */
>   
> -/*
> +/**
> + * media_entity_has_pad_interdep - Check interdependency between two pads
> + *
> + * @entity: The entity
> + * @pad0: The first pad index
> + * @pad1: The second pad index
> + *
>    * This function checks the interdependency inside the entity between @pad0
>    * and @pad1. If two pads are interdependent they are part of the same pipeline
>    * and enabling one of the pads means that the other pad will become "locked"
> @@ -236,6 +242,13 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
>    * to check the dependency inside the entity between @pad0 and @pad1. If the
>    * has_pad_interdep operation is not implemented, all pads of the entity are
>    * considered to be interdependent.
> + *
> + * One of @pad0 and @pad1 must be a sink pad and the other one a source pad.
> + * The function returns false if both pads are sinks or sources.
> + *
> + * The caller must hold entity->graph_obj.mdev->mutex.
> + *
> + * Return: true if the pads are connected internally and false otherwise.
>    */
>   static bool media_entity_has_pad_interdep(struct media_entity *entity,
>   					  unsigned int pad0, unsigned int pad1)
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 1b820cb6fed1..741f9c629c6f 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -262,7 +262,9 @@ struct media_pad {
>    *			part of the same pipeline and enabling one of the pads
>    *			means that the other pad will become "locked" and
>    *			doesn't allow configuration changes. pad0 and pad1 are
> - *			guaranteed to not both be sinks or sources.
> + *			guaranteed to not both be sinks or sources. Never call
> + *			the .has_pad_interdep() operation directly, always use
> + *			media_entity_has_pad_interdep().

This is a bit confusing comment to have in the public header, as the 
media_entity_has_pad_interdep() is an internal func. The above gives the 
feeling that I'm supposed to call this, but via 
media_entity_has_pad_interdep(), but... there's no 
media_entity_has_pad_interdep().

If I'm not mistaken, none of the ops in media_entity_operations are 
supposed to be called by anyone outside mc-entity.c.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

