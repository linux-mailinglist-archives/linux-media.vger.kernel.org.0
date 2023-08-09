Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4EF7753DA
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 09:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjHIHN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 03:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjHIHNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 03:13:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98275212C
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 00:13:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37CBC62FDA
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 07:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DCBC433C7;
        Wed,  9 Aug 2023 07:13:36 +0000 (UTC)
Message-ID: <a4f8b418-2d64-6d25-472a-9983b74a33ed@xs4all.nl>
Date:   Wed, 9 Aug 2023 09:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v11 07/11] media: v4l2: document the usage of min/max for
 V4L2_CTRL_TYPE_RECT
Content-Language: en-US, nl
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20230426082923.132909-1-yunkec@google.com>
 <20230426082923.132909-8-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230426082923.132909-8-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2023 10:29, Yunke Cao wrote:
> Document the default implementation of min/max for rectangle controls.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v10:
> - Added Reviewed-by from Daniel.
> Changelog since v9:
> - No change.
> Changelog since v8:
> - New patch.
> 
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 58982cd382e3..efa07428ba7a 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -447,7 +447,11 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_rect`, containing a rectangle described by
>  	the position of its top-left corner, the width and the height. Units
> -	depend on the use case.
> +	depend on the use case. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
> +	``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of rectangle sizes. The
> +	top-left corner of the minimum and maximum rectangles should be the
> +	same. For example, a control can have a minimum rectangle of 1x1@0x0 and
> +	a maximum of 640x480@0x0.

I am not sure that it is wise to document here how MIN/MAX_VAL work. This might
depend on the control itself. E.g. patch 11/11 nicely documents this for
V4L2_CID_UVC_REGION_OF_INTEREST_RECT.

I am actually in favor of dropping this patch altogether. Whether min/max is
supported and what it means has to be part of the actual control documentation
and not of the definition of the compound control type itself.

Regards,

	Hans

>      * - ``V4L2_CTRL_TYPE_H264_SPS``
>        - n/a
>        - n/a

