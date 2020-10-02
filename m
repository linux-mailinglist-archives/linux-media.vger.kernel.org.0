Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AADC3281916
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 19:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgJBRWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 13:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgJBRWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 13:22:05 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83269C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 10:22:05 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m5so2783653lfp.7
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 10:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O/LalO+XkPSdurD5Da6ggjXoRPyLmkjltFDRihZ1iro=;
        b=1MsY8SdNRho02OeG5Dmob+Hyl9AMm8RCxEv+I+id1H6gwdX6/61EYdea5I6fVcXVYV
         ADLK7tJg8Nm+dr7GHH8rzs4Bkeo9bX+D8NaGWAZbI8cOwV+5eRW18Wsb7Z3FKFxnz4N2
         UdDgch38RK7GFdH5/vKJTIaqDQjlYr1UEbcHlQVNKeB4+AjePxLlvyoux73PsHdzavPu
         sAUseBy2HVMqMQiyJ7L05zKm4ja8cs84I1MGdLR8TP3euIyjsWhrExH6dtv+6f06pVdY
         EwshgPTIifOmhlTKCTi93jUgdCZzd/7j2c4wDEiE8judokvFg6ye6vNEf35tjC/SVKHc
         +f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O/LalO+XkPSdurD5Da6ggjXoRPyLmkjltFDRihZ1iro=;
        b=YAzsURnNB5p5CeI/QYfdO6shM1oKnqCzeW12CKpp1JxpSUjJRSWU+NjcWUe5WCrXyf
         PCKJHjcq0I70jHNtZ68MD5GHMGqF/2775FAgPeyoeRkgx09h0Sk+EMdL0ec3mtK2/ku1
         qbMKmzBA/5eNZRupkWRQkxdGCRtLbRzy2v1FzTZYrPT2uvbbEIb/AqJTQvyxiqFuY31q
         wXSsNUwbVInm13AMfJeWfonZYv1CSY86VPANNUJepq8ULUMSbDVh81uGGqMZ6OFKc+EQ
         ma5cJuV0znqaSu+bFBFZ8bGxE0eeh0QKkuPFgeeSssaxY0oF/dtJgcf6GZ4qiO3v+ajI
         KI9Q==
X-Gm-Message-State: AOAM533Tkx9F9fcZqIDFk5+lGiXheyAFAktyLyIJ5TPNWbuaHSG5yuHF
        +ker2hfh7XLSF4ol6ogtqWpN6pXulYAqew==
X-Google-Smtp-Source: ABdhPJwK7E9AtSmCqZ4KyGRI+Mf9h8C+n+bR7cMhq7hhtzdAMqJR8/vkt5OYLx/fp2S6bILf6l+4ng==
X-Received: by 2002:a05:6512:318d:: with SMTP id i13mr1210938lfe.184.1601659323948;
        Fri, 02 Oct 2020 10:22:03 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id b19sm418428lfg.232.2020.10.02.10.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:22:03 -0700 (PDT)
Date:   Fri, 2 Oct 2020 19:22:02 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        jmondi@jmondi.org
Subject: Re: [PATCH 5/5] v4l2-fwnode: Say it's fine to use
 v4l2_fwnode_endpoint_parse
Message-ID: <20201002172202.ytvvmghelo4oajwb@oden.dyn.berto.se>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930144811.16612-6-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your work.

On 2020-09-30 17:48:11 +0300, Sakari Ailus wrote:
> Earlier it was expected that there would be more variable size endpoint
> properties and that most if not all drivers would need them. For that
> reason it was expected also that v4l2_fwnode_endpoint_parse would no
> longer be needed.
> 
> What actually happened that not all drivers require "link-frequencies",
> the only variable size media endpoint property without a small upper
> limit. Therefore drivers that do not need that information are fine using
> v4l2_fwnode_endpoint_parse. So don't tell drivers to use
> v4l2_fwnode_endpoint_alloc_parse in all cases.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/media/v4l2-fwnode.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 0c28dc11e829..cbd872e59f8e 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -245,8 +245,8 @@ struct v4l2_fwnode_connector {
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
>   * NOTE: This function does not parse properties the size of which is variable
> - * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() in
> - * new drivers instead.
> + * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() if
> + * you need properties of variable size.
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure
> -- 
> 2.27.0
> 
> 

-- 
Regards,
Niklas Söderlund
