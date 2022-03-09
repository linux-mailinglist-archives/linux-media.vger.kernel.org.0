Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40CD44D31FA
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbiCIPn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiCIPnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:43:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A051239153
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:42:26 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3734:287e:1a7f:9772] (unknown [IPv6:2a01:e0a:169:7140:3734:287e:1a7f:9772])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1BFA8C4;
        Wed,  9 Mar 2022 16:42:24 +0100 (CET)
Message-ID: <248fbfea-2d71-bd87-33c6-7569537dfc15@gmail.com>
Date:   Wed, 9 Mar 2022 16:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/5] media: entity: Skip non-data links in graph
 iteration
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <20220302220304.1327896-2-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
In-Reply-To: <20220302220304.1327896-2-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NICE_REPLY_A,NML_ADSP_CUSTOM_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi !

Thanks for the patch !

On 02/03/2022 23:03, Daniel Scally wrote:
> When iterating over the media graph, don't follow links that are not
> data links.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

> ---
> 
> Changes since v2:
> 
> 	- None
> 
> Changes since v1:
> 
> 	- Moved to the head of the series
> 	- s/pad-to-pad/data (Sakari)
> 	- Dropped the debug message (Laurent)
> 
> Changes since the rfc:
> 
> 	- new patch
> 
>   drivers/media/mc/mc-entity.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index b411f9796191..d0563ee4b28b 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -295,6 +295,12 @@ static void media_graph_walk_iter(struct media_graph *graph)
>   
>   	link = list_entry(link_top(graph), typeof(*link), list);
>   
> +	/* If the link is not a data link, don't follow it */
> +	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
> +		link_top(graph) = link_top(graph)->next;
> +		return;
> +	}
> +
>   	/* The link is not enabled so we do not follow. */
>   	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
>   		link_top(graph) = link_top(graph)->next;

