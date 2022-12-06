Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3230643AF5
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 02:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbiLFBvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 20:51:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiLFBvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 20:51:52 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EC522295
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 17:51:52 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id b11so13004454pjp.2
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 17:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aP2EsAUbLg99hVTg478TkqxzQOvyvL1DV7Aju5thIR0=;
        b=cCPTQ8w9If9aVgOV7I3DcAw56TUa5Y1NyZ/vpzs3qV16PCZFwshhxxxvrteMkZdd5b
         V3ZWlsc/38A07hMVMS3GKXRL0PUFmQjOXtPzxJpkPKRaDj2q2MYBiqNd+8BHtLxTUa3F
         o2Hvrqb6xY1IKJfquiC92F41l+8I9yyYXZDw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP2EsAUbLg99hVTg478TkqxzQOvyvL1DV7Aju5thIR0=;
        b=TVtZrOnRl6rZuRid6EtaV+WihOgXvcP0iK083Ng8gKujgzSS5OCDAB3uH/W7SCOVcL
         PjK7MVu4v6R+ZIAYd2/m0qwU46EHtOYUIf9inbJBgKfoRYGZY+wzyJYjw7igDSGwFYxL
         tp1hqEWqvMOFkVIzXlRGeis0z+rbCQvd1Ed/0qMj3eCHDElswA7mMzCmmsxgDAPs1Que
         ZIPY4VmUQzSuLh/Z1DuRHfCUDPo6l5u+Vj+J5nXL7ksT69HemrnUiVPxRcRMim26TEgb
         75gpc/lE6aCjwQVw0iwNsvVSN07Xu7i0j01ri63J4aA1BtmLYy5vgYLPpOijj5MoS0OQ
         Z+FA==
X-Gm-Message-State: ANoB5pnH6TP5frdUy9RMhFsT8XfnvTlnAhfdMGkwePe3L16gI4Ik2aNI
        W6f8z9v0GEdEAmdN09cC3vzLgg==
X-Google-Smtp-Source: AA0mqf6HNcMBHBR+U6nyuXYDvzdaj9YMm6DSuXZj/btdxcPTWjy6A7F7z3Z5eTFTlIo7qkljrjRD6g==
X-Received: by 2002:a17:90b:3d03:b0:213:1e05:f991 with SMTP id pt3-20020a17090b3d0300b002131e05f991mr99565376pjb.216.1670291511690;
        Mon, 05 Dec 2022 17:51:51 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id qe5-20020a17090b4f8500b00218f7c1a7d4sm11631514pjb.56.2022.12.05.17.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 17:51:50 -0800 (PST)
Date:   Tue, 6 Dec 2022 10:51:45 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
        Max Staudt <mstaudt@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: uvcvideo: Do power management granularly
Message-ID: <Y46gMfsJkzZgf2Zq@google.com>
References: <20220920-resend-powersave-v4-0-47484ae40761@chromium.org>
 <20220920-resend-powersave-v4-2-47484ae40761@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-powersave-v4-2-47484ae40761@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/02 18:19), Ricardo Ribalda wrote:
>  /* ------------------------------------------------------------------------
>   * UVC ioctls
>   */
> @@ -249,6 +289,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	 * developers test their webcams with the Linux driver as well as with
>  	 * the Windows driver).
>  	 */
> +	ret = uvc_pm_get(stream);
> +	if (ret)
> +		return ret;
>  	mutex_lock(&stream->mutex);

So here we acquire stream->dev->lock outside of stream->mutex scope

>  	if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
>  		probe->dwMaxVideoFrameSize =
> @@ -257,6 +300,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	/* Probe the device. */
>  	ret = uvc_probe_video(stream, probe);
>  	mutex_unlock(&stream->mutex);
> +	uvc_pm_put(stream);
>  	if (ret < 0)
>  		return ret;

[..]

> @@ -468,7 +512,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  	}
>  
>  	/* Probe the device with the new settings. */
> +	ret = uvc_pm_get(stream);
> +	if (ret) {
> +		mutex_unlock(&stream->mutex);
> +		return ret;
> +	}
>  	ret = uvc_probe_video(stream, &probe);
> +	uvc_pm_put(stream);
>  	if (ret < 0) {
>  		mutex_unlock(&stream->mutex);
>  		return ret;

But here we nest and grab stream->dev->lock under stream->mutex.
Is this nesting intentional?
