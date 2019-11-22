Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B595F10748F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 16:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKVPJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 10:09:27 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44658 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVPJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 10:09:26 -0500
Received: by mail-qt1-f193.google.com with SMTP id g24so1317985qtq.11
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2019 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=g5NUe7vlbEe2wgfNr66lt2YquPFqR05ke44iUlyinlU=;
        b=YB/UzBGOwUoXBzOrmcmzXISuMyursMtRnjg5a7p/fdYK+/DyPLb/40VRF9XWScfcGz
         xk80Cp/0W8vxIbTT9v4P1MpvrRTk794Qd/t6gFDmn5/Fy25IDRNmEnNLkYaUgJrV6q6B
         N/MPCdJvPY81oc1zHDlVYOi3VMQVJ2sv374uH74hYXkvjnb7/jaD+sHLy2y7MuC8odee
         xhxVxze/dTdua7AWxfk0P4nKulmMv8VsMuxBK/Sb6M/MA79onUv4a0Yx3vaG3bu+ael1
         kc2DY3xoyoqL3B+ZKPkPmh5TvvAAOELQusgdTguCjyWXA7UJSjw/x6+rhXWuVaWZ/xOB
         QxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g5NUe7vlbEe2wgfNr66lt2YquPFqR05ke44iUlyinlU=;
        b=g84Z5BZMg4aU1TT2YwzWz70JY3eD3QFZFJRXpFXcuyG+R4jFdJT0ZGepc9AkNoDe6f
         M6lzxy54RSgbrgKbye3BawscBeRFZL/ydaMfNztEnAU3/61GgM4IuTzs/8CMlQ7I5XWB
         9txBmfvxd4ucnhWeZC66vdV6Uymt425nT2yTtL1BtGHgn8hHTQt/LsS1UVk3qmfbsvmN
         DykJidwcY46U87TVwrYZsbqXGnnZAHt19vTqgFx/Pn1SdC9PwrY9MrA1TBRFz3xKBHLO
         X8sgxFsG3wMTcazqUaCFak48TJC1F2XjEYw+Z/GEzTS7rN2/uSiowiNxOCS1qoJ7ey/p
         SJ4w==
X-Gm-Message-State: APjAAAWiVO0Jqe29fvfDYoyEdC6cxr2j6YW7IdIPKdpJiNslEfNoRPwi
        iSC+n6Zgzm9+YyupEP5UsCGLX1vkgzs=
X-Google-Smtp-Source: APXvYqzzaa1j6TzEWV7XVpPIlvEC8vo0OuVoYXDbGKbWsl9Gpc97/tOwGGj51dxMHx/44cMCTJ0MfA==
X-Received: by 2002:ac8:89c:: with SMTP id v28mr3765148qth.156.1574435365519;
        Fri, 22 Nov 2019 07:09:25 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id c19sm3583774qtb.30.2019.11.22.07.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 07:09:24 -0800 (PST)
Message-ID: <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
Subject: Re: [PATCH] media: hantro: Support H264 profile control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hirokazu Honda <hiroh@chromium.org>, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org
Date:   Fri, 22 Nov 2019 10:09:23 -0500
In-Reply-To: <20191122051608.128717-1-hiroh@chromium.org>
References: <20191122051608.128717-1-hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 22 novembre 2019 à 14:16 +0900, Hirokazu Honda a écrit :
> The Hantro G1 decoder supports H.264 profiles from Baseline to High, with
> the exception of the Extended profile.
> 
> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that the
> applications can query the driver for the list of supported profiles.

Thanks for this patch. Do you think we could also add the LEVEL control
so the profile/level enumeration becomes complete ?

I'm thinking it would be nice if the v4l2 compliance test make sure
that codecs do implement these controls (both stateful and stateless),
it's essential for stack with software fallback, or multiple capable
codec hardware but with different capabilities.

> 
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 6d9d41170832..9387619235d8 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -355,6 +355,16 @@ static const struct hantro_ctrl controls[] = {
>  			.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>  			.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>  		},
> +	}, {
> +		.codec = HANTRO_H264_DECODER,
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +			.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +			.menu_skip_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +		}
>  	}, {
>  	},
>  };

