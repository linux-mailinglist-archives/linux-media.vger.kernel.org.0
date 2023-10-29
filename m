Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299C27DADE7
	for <lists+linux-media@lfdr.de>; Sun, 29 Oct 2023 19:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjJ2S40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 14:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjJ2S4Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 14:56:25 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7934EAD
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 11:56:23 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso25240945e9.3
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1698605782; x=1699210582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J67VL168EXCg6ojlawoeEdohbeM+0KOOSBveNBY5m+E=;
        b=KlI9BTt6ph9EIiPyrIQtxMaFd6sWaCbqmuctVYkkttBqIPWO7Rq17RVtGkLsAcNKTY
         PwLU7uIUTMxFfXoxGEPGy2WU3n0E6/Q1CFMEpUYGcIAp9+oD/t+hzcU3GHsrGQeSjlXl
         84apXq8mwcSvy34W5waVt0qlmRHDO5tzJ8DFcrq24cWMnifH+pbr+YdpB/hGqAtyPJxb
         X8MybQSRMnQFsaUxccrTss617XygjFXHD5SlzQ7CkSkLaVVNUVysRVyMMttGvcN/BsEI
         9JvnKaziC9Mn1CTGUl46Ypp/BxmDGT6seXpKxGDX3axII5QEDufr6JFAnxb8qeC1mdsA
         FuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698605782; x=1699210582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J67VL168EXCg6ojlawoeEdohbeM+0KOOSBveNBY5m+E=;
        b=exU+gyHyRaCNI14MMqbA32DPULzALN7V6iG1Zgp/5TNrqKYMVw0RqdFIKGu8BoLy7v
         xsGqHxVPecdHKpYI14av8S0EtrFihDRahhhchded86NFHCzL6zW+qH7W7OPbbia5QU8j
         FgQckPpQyT4E7dWHgke+fGeIuStJSDHi2Y5TfOb3q6KnW1nEA45XzRBESM9PGWUuigQn
         WYQDOqPPfFS9Oy53eefWE+KCzWfaMuQmhRzf4ANLn188L6nehGb6CmwXR552MlEzKhS4
         fx6dRZzc2z5ktWWqoEVdDlYXQQsXMggUX17e1rHXtjelxtC2QP6zbvSletPkWSB8KvCN
         e77Q==
X-Gm-Message-State: AOJu0YxOsL8AVGFJZUKoS04E7BRCPGlU3JBlNh4b+wbIaBEhysXbMYg8
        q7vHWqUypRxgmk1FwasKwMwM81e9SyoMi+60nk8iOg==
X-Google-Smtp-Source: AGHT+IEx7mOV5mtjPDIUnMqi5wFMtmVOBit1RmyI2VibBuYXKM6oc4W/CvwPUo2+uRuoyRXpwedhLA==
X-Received: by 2002:a05:600c:1d08:b0:408:4d0e:68ac with SMTP id l8-20020a05600c1d0800b004084d0e68acmr6486650wms.32.1698605781525;
        Sun, 29 Oct 2023 11:56:21 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b00401b242e2e6sm10725528wmq.47.2023.10.29.11.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 11:56:20 -0700 (PDT)
Date:   Sun, 29 Oct 2023 18:56:19 +0000
From:   Phillip Potter <phil@philpotter.co.uk>
To:     Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Cc:     ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: stk1160: Fixed high volume of stk1160_dbg messages
Message-ID: <ZT6q0xhAsHmX9GZQ@equinox>
References: <20231029143604.120329-1-ghanshyam1898@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029143604.120329-1-ghanshyam1898@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 29, 2023 at 08:06:04PM +0530, Ghanshyam Agrawal wrote:
> The function stk1160_dbg gets called too many times, which causes
> the output to get flooded with messages. Since stk1160_dbg uses
> printk, it is now replaced with printk_ratelimited directly.
> 
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
>  drivers/media/usb/stk1160/stk1160-video.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 4e966f6bf608..f5b75f380c19 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -105,17 +105,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>  	u8 *dst = buf->mem;
>  	int remain;
>  
> -	/*
> -	 * TODO: These stk1160_dbg are very spammy!
> -	 * We should 1) check why we are getting them
> -	 * and 2) add ratelimit.
> -	 *
> -	 * UPDATE: One of the reasons (the only one?) for getting these
> -	 * is incorrect standard (mismatch between expected and configured).
> -	 * So perhaps, we could add a counter for errors. When the counter
> -	 * reaches some value, we simply stop streaming.
> -	 */
> -
>  	len -= 4;
>  	src += 4;
>  
> @@ -151,7 +140,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>  
>  	/* Let the bug hunt begin! sanity checks! */
>  	if (lencopy < 0) {
> -		stk1160_dbg("copy skipped: negative lencopy\n");
> +		printk_ratelimited("copy skipped: negative lencopy\n");
>  		return;
>  	}
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Hi Ghanshyam,

As we've conversed about this via other comms channels, thought I'd
offer my comments here for what they are worth. Thanks for the patch
firstly.

Few things I would change though:
(1) Keep the comment around perhaps, but modify/move it, to specify the
    reason for the ratelimiting is caused by standard mismatches.
    Perhaps also leave a note about the possibility of it being due to
    other problems also, given the comment says "the only one?" posed as
    a question.
(2) For consistency, probably worth making use of KERN_WARNING in your
    new printk_ratelimited call.

All the best.

Regards,
Phil
