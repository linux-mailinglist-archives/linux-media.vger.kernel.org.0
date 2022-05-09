Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C982751F955
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbiEIKLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 06:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbiEIKL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 06:11:28 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B2C1498EF
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 03:07:35 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4B4731B000FB;
        Mon,  9 May 2022 13:04:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1652090656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k5zSIxPL0pXYut+HsrEjEM1ZtXOLxASy6QfohQG/iUs=;
        b=Dr4rwUXfudNAIPN9SsGmSK4Sl5JknUYSYe4qKWKu+7p/+VvWgKHnKUVki3PGsZ91slyqXG
        SEuTGXwLwLAd0sxb8rzbdxnrJ6AGfw+HJBLYvO8t8FCm0V80mQo4OTy+ByOfYr9wSgTMyK
        unBD5k58NEO5rLMcE6nvBafuy8FL5y6lWYBMk4zQ29blWRExjt2FCvkF4Uf5eJCQyrdcJ1
        w786UAvdtUalielCxxj9icQRNsmMiYsQqaC1iAtOTayMVXY0Ezi/Q1iSt3uvyzm+TqXQSf
        wN+k6O4U+yTWhpPJ43bNdvtQt7PgjhOlnUXYSmn7oUtGHofKtFua8Eef0IPZ6w==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B4FC9634C91;
        Mon,  9 May 2022 13:04:15 +0300 (EEST)
Date:   Mon, 9 May 2022 13:04:15 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 7/7] uvc_v4l2.c: avoid using iterator used outside loop
Message-ID: <YnjnH6TPVi1kV/Yv@valkosipuli.retiisi.eu>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
 <20220509091553.2637089-8-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509091553.2637089-8-hverkuil-cisco@xs4all.nl>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1652090656; a=rsa-sha256;
        cv=none;
        b=btKumzueD8nZ4qkw5NH+nlqT9GJ+4RNI2Y2tO2ekXpZo8K6fOzDYluX7VytlRTLUR+FrXs
        D6erEBMwrAdRyEAasnEW0kX6vS9RVahYPHv+elTzAmobh1onGVZ2atxxbdkE/x+slIX2iF
        YDrLRv9sC24VvAL6H8Sf4otqkskaX2mltLAuE8mUVFrtKTMNAFxEKuWYqahcAQKY53zQXw
        g/1EolH6zhqLqbCHIOz/fAnqkHovgdkgoyfe++tt/g0+UTPs/oozjAjkNixmgqiFrD3Tp1
        lkh1vyReMenYCDF/w2cgpJwv3kCQNDw1TaM9kOJDR5tj/VP+r5B83RuaI+xQlg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1652090656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k5zSIxPL0pXYut+HsrEjEM1ZtXOLxASy6QfohQG/iUs=;
        b=ksABDQZsX49b772uEWJQVlTBfwSPLSFm3qM1wcvwutSlQX644Uu57GPNCcRfWLm68qEuiA
        dhtg4eXLlySN9un68BWvYG1I4hoGS3QGRJLAARfom3hboDXxk5G/UMkz/Ydp4EEOg9rvxH
        b4kA11u2FChkPuXyGK9WR133Um2XqBmUCPnF3NLtIg5VBBfny5Ccyr53oUykwbYHIhP68/
        M1nGari1149HxAbpMPOMmx+TmQ2MUFFLzyOU1XKENWpPhVLSMtpT0dRHw8npESMWsjBC16
        7jR6QyBkZbI5NUjGSBxZTNrMn+44uI0v3exbiiKC2fXtb6ANnNI1JkFQi+E6Ag==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the set.

On Mon, May 09, 2022 at 11:15:53AM +0200, Hans Verkuil wrote:
> Fixes these two smatch warnings:
> 
> drivers/media/usb/uvc/uvc_v4l2.c:885 uvc_ioctl_enum_input() warn: iterator used outside loop: 'iterm'
> drivers/media/usb/uvc/uvc_v4l2.c:896 uvc_ioctl_enum_input() warn: iterator used outside loop: 'iterm'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..ff3f04af4e21 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c

...

> @@ -879,21 +880,25 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>  		if (index != 0)
>  			return -EINVAL;
>  		list_for_each_entry(iterm, &chain->entities, chain) {
> -			if (UVC_ENTITY_IS_ITERM(iterm))
> +			if (UVC_ENTITY_IS_ITERM(iterm)) {
> +				pin = iterm->id;
> +				found_pin = true;
>  				break;
> +			}
>  		}
> -		pin = iterm->id;
>  	} else if (index < selector->bNrInPins) {
>  		pin = selector->baSourceID[index];
>  		list_for_each_entry(iterm, &chain->entities, chain) {
>  			if (!UVC_ENTITY_IS_ITERM(iterm))
>  				continue;
> -			if (iterm->id == pin)
> +			if (iterm->id == pin) {
> +				found_pin = true;
>  				break;
> +			}
>  		}
>  	}
>  
> -	if (iterm == NULL || iterm->id != pin)
> +	if (!found_pin)
>  		return -EINVAL;
>  
>  	memset(input, 0, sizeof(*input));

iterm is used a few lines below, too, so this patch doesn't remove its use
outside the loop. Which btw. I don't think is a problem at all. Doing that
is relatively common IMO.

For the rest of the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
