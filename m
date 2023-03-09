Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F66B1AC0
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 06:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjCIFbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 00:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjCIFau (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 00:30:50 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AF4C88AE
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 21:30:35 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id v11so848690plz.8
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 21:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678339834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMozddLcckxJPR9KMkky1FpCCvQxRbHBHsMITI6/3RQ=;
        b=gf5J/X1F0Fs+EcgnDeWW+ePla7l/gjrmmo4B33Rv/ISBV6IGztl+Rq7Zfjq7WaVfAH
         TfFtTwAuRcauZF1ahm3fGghd6vcbzvAp+JnqlpsWD4Fxd6+13ODUbK9zpGaGm8DBLRlP
         23nR4Prrc5QskvT37zeNkgyNaxHYF/xu1g26o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678339834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMozddLcckxJPR9KMkky1FpCCvQxRbHBHsMITI6/3RQ=;
        b=Ou39vlnjmf1lUo4wys50r2Rhm4MPVn8WgmaikUydp0sNgKZij4OJDSD4Wr09Q2VtDE
         7qgFM4uE7nWJpb/Z9ovA0XddzJX70fCAej/LxylC0stetguQhdpOmA3I5mGmELH9PvXV
         cSv31b0zeEkdR5dErQ8yOIGuSCxhDiLGuiUTYznNfyBV3UxiHK/eZaTCrPIFfxwGNHpT
         ezdWFKzWi3SMom9Yi7+lKIT9PaEyv4Veic7XH4YisTiGNOu+fXkxk2j3UrmEr9Vjz0O2
         L4eXo9pqINv4w0YePbygt5cxB7ryDMoGWH1JSz8RHwKVSKhQjFxgukgrZq6BmilbxQS2
         9fDQ==
X-Gm-Message-State: AO0yUKWRZ2+5o8aQQixHF2ProSNYiZzhvBUNSSJ+yzAVnsLE5ewi0o6J
        R4xCS9H8+3wcXvEZJtMdD1OQVg==
X-Google-Smtp-Source: AK7set+DTsP1Y4RYOllJ40Wh0DfbP6p4NM72fLETK1lWy6BdNaNZTR20txCaMWsYVoWzAq+jVK5/Vg==
X-Received: by 2002:a17:902:e80a:b0:199:10d2:b9da with SMTP id u10-20020a170902e80a00b0019910d2b9damr25313304plg.58.1678339834544;
        Wed, 08 Mar 2023 21:30:34 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id ko7-20020a17090307c700b0019a6cce2060sm8748193plb.57.2023.03.08.21.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 21:30:34 -0800 (PST)
Date:   Thu, 9 Mar 2023 14:30:30 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "hn.chen" <hn.chen@sunplusit.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND v5 2/5] media: uvcvideo: Quirk for invalid dev_sof
 in Logitech C922
Message-ID: <20230309053030.GB1045797@google.com>
References: <20220920-resend-hwtimestamp-v5-0-139d1a144614@chromium.org>
 <20220920-resend-hwtimestamp-v5-2-139d1a144614@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v5-2-139d1a144614@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/08 23:45), Ricardo Ribalda wrote:
[..]
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -541,7 +541,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  
>  	stream->clock.last_sof = dev_sof;
>  
> -	host_sof = usb_get_current_frame_number(stream->dev->udev);

What host_sof is set to? Some stack garbage?

> +	/*
> +	 * On some devices, like the Logitech C922, the device SOF does not run
> +	 * at a stable rate of 1kHz. For those devices use the host SOF instead.
> +	 */
> +	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> +		dev_sof = usb_get_current_frame_number(stream->dev->udev);
> +
>  	time = uvc_video_get_time();
