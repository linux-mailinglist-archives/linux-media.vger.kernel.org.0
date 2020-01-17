Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9235141436
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 23:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbgAQWgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 17:36:37 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35371 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgAQWgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 17:36:36 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so19551232lfr.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jan 2020 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=J929h0KZ2ac5S3n4IESBD+8F2tDlpZH15w7wy9ZbFBE=;
        b=zHl0+Tf94O4U64JciaHt7bPupk6wRrba61Tv3DOXIKA9MsJadC1+XuT070kINEwHKI
         8CceetMF2Ob5U4Ke0uRUf2yc4klg0aH/wMV83GXDe5f0VcyPYRxSyu1jdtT4hwySBm5M
         kOh+y131rPtacbpAQdI5ACE/WT30G4S799xU4U6Kfdh/hGLdyg//9vpgRwq1QfOeMQsA
         z3xwmfvhMZC1T+zSSTuBMBmBfMlbcpdPLfvREr9w+orJw1KDxd+Sd9HE5/F4osGAuY1F
         tearJy60FK29q1Bk/6WxXqdCvcf13h9SSE7SVC6ObNBRqRYAdN6PZMQUUN1i7IjCRdcv
         QhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J929h0KZ2ac5S3n4IESBD+8F2tDlpZH15w7wy9ZbFBE=;
        b=hKoOXAWUZKE1dgTz5CFFmToRlPD77levcGmt/KLWlT50jMV474vQqvG0m4uTHJ3rwN
         WDtVsCKa4bBfItoqZs6CPq+lESLsh9VPGLg6LZnK3lp8hsv/CAxI7D101A6M1lY7i4lb
         qj87/Hp8whpoowjbQaXiO4VIUmuzxo0gQrwzwuZ/LUe+veGLMst30dBFvWpqOvCTXZt8
         4h3oe1h06I6DHzt6lMn3GnJBTS/s6iONxwscbZGVRc5rK1lBP3+WfhC0uIUKnTmguvg7
         wan/1/WhedM7/1oTKgjOsu4iANJzaBEGPIGvQ3NAN0QZ4op09qKadzNcvvgW+6Xow738
         aPxw==
X-Gm-Message-State: APjAAAWQZ8r9rANolTyxg5fgLW5NRWwQejpNsb+QIwUPlOXb+n0Wb1fd
        NGI6rCjwz5UISleb4nPLd7sHNsbTSX8=
X-Google-Smtp-Source: APXvYqxnljIUnAxqek19KVME46/kXejNKoBxW1Qteg6+NhVyeOUq/WgWjFhZMs+SGlvbS+CA8r/mYg==
X-Received: by 2002:ac2:4884:: with SMTP id x4mr6701991lfc.92.1579300594976;
        Fri, 17 Jan 2020 14:36:34 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id q13sm15285410ljj.63.2020.01.17.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 14:36:34 -0800 (PST)
Date:   Fri, 17 Jan 2020 23:36:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        tfiga@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: media: rkisp1: make links immutable by default
Message-ID: <20200117223634.GJ1074550@oden.dyn.berto.se>
References: <20200117201218.3745311-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200117201218.3745311-1-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your work.

On 2020-01-17 17:12:18 -0300, Helen Koike wrote:
> The only places which make sese to allow users to enable or disable
> links are:
> 
> * between sensors and isp:
> So users can select which sensor should be used while streaming
> 
> * between isp and the resizers:
>               |
>               v here
> rkisp1_isp:2 -> rkisp1_resizer_mainpath -> rkisp1_mainpath (capture)
>             \-> rkisp1_resizer_selfpath -> rkisp1_selfpath (capture)
>               ^ here
>               |
> 
> So users can disable one of the capture paths when unused, to avoid
> worring about matching formats.
> 
> Make the following links immutable to simplify userspace:
> 
> rkisp1_resizer_mainpath -> rkisp1_mainpath
> rkisp1_resizer_selfpath -> rkisp1_selfpath
> rkisp1_params           -> rkisp1_isp
> rkisp1_isp              -> rkisp1_stats
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> This is the topology graph after disabling all the links with
> media -r
> http://col.la/rkisp1immutable
> 
> Dashed links are the only one can can be enabled/disabled, the others
> are immutable.
> 
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index 558126e66465..4030d5e71af1 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -145,14 +145,15 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  		flags = 0;
>  	}
>  
> -	flags = MEDIA_LNK_FL_ENABLED;
> +	flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
>  
>  	/* create ISP->RSZ->CAP links */
>  	for (i = 0; i < 2; i++) {
>  		source = &rkisp1->isp.sd.entity;
>  		sink = &rkisp1->resizer_devs[i].sd.entity;

nit: To keep with the style of the rest of the function I would set 
flags here and once more bellow in the same loop.

With or without this fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

>  		ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_VIDEO,
> -					    sink, RKISP1_RSZ_PAD_SINK, flags);
> +					    sink, RKISP1_RSZ_PAD_SINK,
> +					    MEDIA_LNK_FL_ENABLED);
>  		if (ret)
>  			return ret;
>  
> -- 
> 2.24.0
> 

-- 
Regards,
Niklas Söderlund
