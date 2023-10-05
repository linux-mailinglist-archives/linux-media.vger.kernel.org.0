Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E35E7BA051
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbjJEOev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbjJEOcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:32:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E6E24EB9
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 04:40:21 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E2C8C;
        Thu,  5 Oct 2023 13:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696505913;
        bh=LUBwgmOnESqdb7XxTvJfVN+UyOXK+KnzgMC0susmxAw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pBl2qEFmIGp5cjvM0VHOCQjG92qnEuhpEVA4kzhvnnUQfq+B6UI5Y3yXgcm+vs8ly
         JQObakFIPV4gFB+NEpdq6s3xWX5fZfrdA2Az9q5Pf4FkB8ZO8vcj1kSG452ZB4E9O7
         s9NK53v1GHpuMRJj0i9vYO5cIYO5zFNg0hUbJZws=
Message-ID: <02386178-0ea4-ea8b-ae68-17ebe6aeaa6d@ideasonboard.com>
Date:   Thu, 5 Oct 2023 14:40:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 08/28] media: Documentation: Additional streams
 generally don't harm capture
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-9-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20231003115237.76828-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 14:52, Sakari Ailus wrote:
> Having extra streams on the source end of the link that cannot be captured
> by the sink sub-device generally are not an issue, at least not on CSI-2
> bus. Still document that there may be hardware specific limitations. For
> example on parallel bus this might not work on all cases.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index f375b820ab68..a387e8a15b8d 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
>   pads.
>   
>   Subdevice drivers that support multiplexed streams are compatible with
> -non-multiplexed subdev drivers, but, of course, require a routing configuration
> -where the link between those two types of drivers contains only a single
> -stream.
> +non-multiplexed subdev drivers. However, if the driver at the sink end of a link
> +does not support streams, then only the stream 0 on source end may be
> +captured. There may be additional hardware specific limitations.
>   
>   Understanding streams
>   ^^^^^^^^^^^^^^^^^^^^^

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

