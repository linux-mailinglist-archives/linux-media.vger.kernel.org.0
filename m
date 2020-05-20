Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497D81DBDA6
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 21:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgETTJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 15:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgETTJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 15:09:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6137FC061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:09:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id c3so46111wru.12
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2uv115ZmwEOxbzM6rKStRbpYSEXtCDm13HcFyuFXDNE=;
        b=BuFPXn+njqI8T+xD8kqoBCycMaoWQ43XAQ/G8jsny4cXHe7z+q/xhAT2MsxWzPszz3
         raveWsV+lovEdsDo3k3j5nPe5mQOW1VAi15zh5HKSsYr/a73Jcn2Rl/sf+FeRqvX161d
         U2g9o0YvRFKk6p7XV2qDDk6qT1pKXQPH+2xjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2uv115ZmwEOxbzM6rKStRbpYSEXtCDm13HcFyuFXDNE=;
        b=iS7jqbXaP7Y+mRkcsQs4Vu6JvEQP0bYMzRJY63ox2ikJCyh9sP8o5QOEkgs0nRBSO3
         1w7SVx6URWuGx8J94ZJ/cX05nLFDi3hipwg5WcULexZxAdmUDvrEDheVy1gf6+FBMNqm
         fs0IUmYrU8WTuClzAv/ovFiFLASpX52GUNVM3TWEY3WJp4gArsTRANG7OIzGvqGfFX48
         AjlcUAq92XBQDaeU7tk398DD/w5pR7zbtA5sdVTaexeJBf25fBJPySQxGh3vZCm6eiwn
         M6GIf0fElGCz9DqrcDc6KIHgtqbwE8+3NJ29Cf6vUg4NWl0i2fLsQW5FzX4a2AJqmt6P
         B0cQ==
X-Gm-Message-State: AOAM53310gY9sHzv7ctQezqyp/34eaMsCw5gRAt1A1s60H4ypoHf0j6+
        K4qDhm0X7rJN1l81bxN9jyaKmw==
X-Google-Smtp-Source: ABdhPJz+pccWiNV6rJYe6p6KVRJ6TVbPWC89eaJ58rSkWoNhpI/lbUNDw1brnGfDsJQ1jiQXL9K9LA==
X-Received: by 2002:adf:a54e:: with SMTP id j14mr5020212wrb.99.1590001767814;
        Wed, 20 May 2020 12:09:27 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id p23sm3933396wma.17.2020.05.20.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 12:09:27 -0700 (PDT)
Date:   Wed, 20 May 2020 19:09:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCHv2 2/2] vidioc-g-parm.rst: update the VIDIOC_G/S_PARM
 documentation
Message-ID: <20200520190925.GB35530@chromium.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520100159.2094831-3-hverkuil-cisco@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, May 20, 2020 at 12:01:59PM +0200, Hans Verkuil wrote:
> This documentation is very outdated. In particular, it is
> not obvious at all that this is used to change the framerate of
> sensors.
> 
> Fix it, and include references to the stateful encoder API where
> this works slightly different.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/v4l/vidioc-g-parm.rst | 51 ++++++++++++-------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Just one nit inline.

> @@ -216,8 +229,8 @@ union holding separate parameters for input and output devices.
>  
>      * - ``V4L2_CAP_TIMEPERFRAME``
>        - 0x1000
> -      - The frame skipping/repeating controlled by the ``timeperframe``
> -	field is supported.
> +      - The frame period can be modified by settings the ``timeperframe``
> +	field.
>  

s/settings/setting/

Best regards,
Tomasz

