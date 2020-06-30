Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71DB20FF70
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 23:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgF3Vs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 17:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgF3Vs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 17:48:56 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DB6C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 14:48:55 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u25so12352361lfm.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Jm1jEr9MLNh0iwu6xOCQxX50sDT2pwTDrdwoFLoZlas=;
        b=EEs4eSixnt3LdF6NEVvLSKXpWpgLxOqtNH7aVll6BMEvkkFF1OwFuq8h7TilXIWtaY
         /Ur/aOVX1b4hk7athFcr0r0A6Lsf/QEiGPWlPmP8fqpixX0zAJ9tm5HDGnN2HjMPd6Bl
         adOtwDKs4bQ38Mtpo8+7YdmViCKOPzTBGcaeRtRrMkqQVXI3BajxnaizeHuwckoWfX7F
         fK9lINPKQrEIeHEq3bRsLMvZbu+nxaBgl9S1IdSh6jqwTJF0aEm1nJuuDZjSbMADTrha
         2rxp+4p7frxpU56LxgIPUVnNPLq7t7PYnnqBrCuAFKBCQ0RDfPYk12F+9oqw/VVUnIua
         vpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Jm1jEr9MLNh0iwu6xOCQxX50sDT2pwTDrdwoFLoZlas=;
        b=AnEKh87i7Lp2J1aPH2wPaZyqXZTeGLk9c184Dmbb2nUmdrm/7TDQncuiM08eJb9RYG
         mhENHDOjNKVFxati58kMCt7Tvm1Ka5bYALHFiRzMvawM3WIw8PBHA8lwOVD0sjWhdObA
         btAzrfau/a6Lm7z9ezi/ec2owqPCSjee9525FocwypAbiBpunbbmU2/82szvXO3Hk8k/
         8j/PxbSnBEhLpNehznQeNIPyXosqHWxtZhkMz/ed1/UwWpkZssL52E39K44q+dC0O49V
         tbHYtV7J8zsDeMb+6q1EFGvbw0C4efILAZwJjD2FEQ89DQhS9baOYt3d0K85nAwXvvUp
         K2pA==
X-Gm-Message-State: AOAM533Z9nXk37sjCeMp9beyX+TSKbG5IN4L1DYviYCLuDCwbbkS07jd
        yhq8zt17LAjTTgZeFGwv9UyD9A==
X-Google-Smtp-Source: ABdhPJw7IQehrrrPHyMcohEA5LINdzv8/cxXHnQz/bbQNI1sb+axgmmTHyzAzfloEx+dzLeaOxiPBA==
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr12699995lfg.196.1593553734135;
        Tue, 30 Jun 2020 14:48:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id q13sm1243830lfb.55.2020.06.30.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:48:53 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:48:52 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 0/3] media: v4l2-async: Accept endpoints and devices
 for fwnode matching
Message-ID: <20200630214852.GI2365286@oden.dyn.berto.se>
References: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for keep continued work on this.

For the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On 2020-06-21 03:00:25 +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series is the third version of fwnode endpoint matching
> support in v4l2-async. The secon version can be found at [1].
> 
> Compared to v2, review comments have been incorporated, patch 4/4 got
> squashed in 1/4 (now 1/3), and the code has been rebased on top of
> v5.8-rc1.
> 
> Sakari, is they way that patch 1/3 determines if a fwnode is an endpoint
> acceptable for you (and for ACPI) ?
> 
> [1] https://lore.kernel.org/linux-media/20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com
> 
> Laurent Pinchart (3):
>   media: v4l2-async: Accept endpoints and devices for fwnode matching
>   media: v4l2-async: Pass notifier pointer to match functions
>   media: v4l2-async: Log message in case of heterogeneous fwnode match
> 
>  drivers/media/v4l2-core/v4l2-async.c | 85 +++++++++++++++++++++++++---
>  1 file changed, 77 insertions(+), 8 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
