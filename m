Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39755F9B1F
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 10:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiJJIha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 04:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiJJIh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 04:37:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCB86581B;
        Mon, 10 Oct 2022 01:37:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03B9860E83;
        Mon, 10 Oct 2022 08:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B981C433D6;
        Mon, 10 Oct 2022 08:37:24 +0000 (UTC)
Message-ID: <b3a819e4-de3d-e5b8-8dfb-d7fc34a6b3b5@xs4all.nl>
Date:   Mon, 10 Oct 2022 10:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH] media: Documentation: Drop deprecated bytesused == 0
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20221009213509.860-1-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221009213509.860-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 10/9/22 23:35, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The V4L2 API historically allowed buffers to be queued with bytesused
> set to 0 on output devices, in which case the driver would use the
> buffer length. This behaviour is deprecated, and videobuf2 prints a
> warning message in the kernel log. Drop it from the documentation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> 
> This patch aims at starting (or continuing) the discussion related to
> handling of bytesused == 0 on video output devices. videobuf2 currently
> printes a warning that indicates the behaviour is deprecated, but the
> API documentation allows it explicitly. This discrepency bothers me and
> I think we should fix it.
> 
> We probably won't be able to drop support for the deprecated behaviour
> in the near future, if ever. If we want to push applications to get
> fixed, we may want to replace the dev_warn() with a WARN_ONCE(), which
> could be done in a v2 of this patch, or in another patch.
> 
> Another option would be to consider that the behaviour is fine and keep
> official support for it in the documentation, in which case vb2 should
> stop warning about it. This wouldn't be my preference.
> 
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 4638ec64db00..04dec3e570ed 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -187,10 +187,8 @@ struct v4l2_buffer
>  	on the negotiated data format and may change with each buffer for
>  	compressed variable size data like JPEG images. Drivers must set
>  	this field when ``type`` refers to a capture stream, applications
> -	when it refers to an output stream. If the application sets this
> -	to 0 for an output stream, then ``bytesused`` will be set to the
> -	size of the buffer (see the ``length`` field of this struct) by
> -	the driver. For multiplanar formats this field is ignored and the
> +	when it refers to an output stream. For multiplanar formats this field
> +        is ignored and the
>  	``planes`` pointer is used instead.
>      * - __u32
>        - ``flags``
> @@ -327,10 +325,7 @@ struct v4l2_plane
>        - ``bytesused``
>        - The number of bytes occupied by data in the plane (its payload).
>  	Drivers must set this field when ``type`` refers to a capture
> -	stream, applications when it refers to an output stream. If the
> -	application sets this to 0 for an output stream, then
> -	``bytesused`` will be set to the size of the plane (see the
> -	``length`` field of this struct) by the driver.
> +	stream, applications when it refers to an output stream.
>  
>  	.. note::
>  
