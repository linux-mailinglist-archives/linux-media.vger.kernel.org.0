Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E549F5F9D43
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 13:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiJJLDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 07:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiJJLDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 07:03:47 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9079DFAC;
        Mon, 10 Oct 2022 04:03:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkv1q4tdsdyy1rk42mgbt-3.rev.dnainternet.fi [IPv6:2001:14ba:446a:dc40:6f18:157:2316:5143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 6964C1B001B1;
        Mon, 10 Oct 2022 14:03:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1665399822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X+umJlZlDZ6iSnvwxVf1PmWT7krWCU4iHOOGGM49XJ0=;
        b=HLwEa1DSIR1kzxU3hqCTaZ1ZJ8fxZC5oZvYZatX72Wckl43xo58rAZrY9p6v+mWHI4B+BI
        Iam6n3ZuuBRf+K6e+9mxqyatEVzNdzDvNwZfpy1B/CFzGWgXAeybiyDVjJx7PRdMjIYsEt
        X5wXPIbAeVbFFfQG7p4C/r4YadIHG7qwYS6kTwuoMXGExIcVtXLHt/sHdjwrnHwLX4md6F
        xegs/TVzfRpSqwi2ITamWuzRfojnEwgidhy82bN6sJ6Pt/knpZPwMHacIM8PHuB3ykNU/6
        VDC1dMnhdqNIrpu1+D9XNZcy7NDNomOdSxFcjP+ERziiV7jFgaB26pQhT5DiQw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D1851634C93;
        Mon, 10 Oct 2022 14:03:41 +0300 (EEST)
Date:   Mon, 10 Oct 2022 14:03:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH] media: Documentation: Drop deprecated bytesused == 0
Message-ID: <Y0P8DQQ0XlRxzAoH@valkosipuli.retiisi.eu>
References: <20221009213509.860-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009213509.860-1-laurent.pinchart@ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1665399822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X+umJlZlDZ6iSnvwxVf1PmWT7krWCU4iHOOGGM49XJ0=;
        b=HxR3uaBRGoWlBvJoLd5b7/p/amZQ5M72sw0OFPcktOR/9f7Wa+ZIf+oipa2xzJdTJB+TY0
        VGmElii/6p6fGIImGHC53PpqkJ+BgrSfPZ7n7Gfxnz1kf0q4hyC85h3OXuDr0E4c8k+E/A
        2pXxLRLED1UiATGeYZr5W3/Aw4uBKGmHUUxHGu+paZTmsn8RLWa3ZPq0xYvPc4alsH+O6p
        gkiyAuiPPrAzesLwWEeqSy2EZtdSqB/mO8gH5YWn3IVXr2CYgYv9+fia+fEIy/r60hFiP5
        +hvhzveUc3rnV9yaPwh/3Ly1zyTMrxaHEnp52GxAAUUAtwbqAN07j1r97kND4A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1665399822; a=rsa-sha256;
        cv=none;
        b=YW1ArMHyOEhEbGtMmt12xX/R+4fxComNmM0c+PDUfh831PQZjBtyKkyxt1XXriHceEJ9aE
        INZ57scckNCGlPTFv7sMGc25ODoV6LI2JmAewJkgzPxvkBKKyDZva5Pt7bF0dstlEZtuAN
        TbN9L2GX4u4+h6Lf6w8PZuteSk0rYTLsrUpbdtEyoabBaD40qlV0XGybTCjlaVV7BZM5sp
        a4Pq1sEcYkhdFBmk49qCtDGuzgqsAsyIZqbP/VjeYroEf8iapdQSqq/Yh1hP12nmIeFE7y
        q4yIXV+98lJJqGjQAaavDWWcuV+Bc5DpsOxYuXIHzyULI/JU+SyxlT4pgqNqLQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Oct 10, 2022 at 12:35:09AM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The V4L2 API historically allowed buffers to be queued with bytesused
> set to 0 on output devices, in which case the driver would use the
> buffer length. This behaviour is deprecated, and videobuf2 prints a
> warning message in the kernel log. Drop it from the documentation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

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
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Sakari Ailus
