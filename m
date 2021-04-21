Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046A93670E9
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244626AbhDURHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244618AbhDURHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:07:20 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489E4C06174A;
        Wed, 21 Apr 2021 10:06:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g17so49541648edm.6;
        Wed, 21 Apr 2021 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0vIFwvg8wmGgCq9N2ekETjpF5YhMbIBp9DMrbpQpC+Y=;
        b=nf1dWnvWNOuqt3vHzuJlOw9TvO3bTbWsMp3Lff1WuokW5DSWGIEkUWlKPoPUDwRJNm
         i12/tGJ/F0wlY8aKrxVK5jR7EY2j2aDOVDKmU95o0GV4F5QsXEfeijyWxsf0l8WbK2ZV
         yDqNJOVQ3yoAW67+1YgpBmRn/KIK8usvmTDElx5uu9XKGAbnTbDs3ph/7d8OSJGmzf7F
         9uR2p00VbE43l/JEqbH2ei8IejUB+S2COYERX6EPyPOCDRBWTdJ/+DR0TEiBErKC8OD9
         G4WqM6HOBjay1gb/yWVhLDo2jhpyETF7YSaaorEdLbYQIhhvTtE22jO4rFbx5nJZoI49
         fbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0vIFwvg8wmGgCq9N2ekETjpF5YhMbIBp9DMrbpQpC+Y=;
        b=ghyECdbemGuENyKK7aHKHH+MktytNMoMTJ8E7yBwtzTuDU2MvfgaBzFias/A5PbUpR
         2/sBDvJOXqxh5xx2GP/O38A5fPyrQBsUzJc7ZTNgMwfo8uN2+eX6BxjA67hsVH/XZF3e
         VKvFYT8OgcZ0iKl37h78G0k6wAT+K1t9O6LjeuOLDgWH9VFe7BMW1IqJoEiLguXoU6Wu
         u3aasQkrMbVOZBQn7jvFHAx1jr7rZj+PIwRbB7G+RVNhTzc9Z0dZ+B08ScoMaZdbgjZ8
         Z5Ci4d3T3SlZR1/Dp4SPkLzl0KU7RgcsACi8vX60dW+fb28lH6M42ifQp4ON7KxRfR43
         98nQ==
X-Gm-Message-State: AOAM532RxTIO+P3csz0D7uWePyTkh0hUsj9HTkBGPmlfpU9EbkYDtjrG
        9d6KwecxlFbJP0I0g/zkVCE=
X-Google-Smtp-Source: ABdhPJxlhYtZIHwmZeIw95gfompLSAb8lwPmIZtnOhw1GpsWvk4Rx60Zifo8ntb+Zt2SgqY7Iv2lZw==
X-Received: by 2002:aa7:db16:: with SMTP id t22mr30381869eds.266.1619024806106;
        Wed, 21 Apr 2021 10:06:46 -0700 (PDT)
Received: from agape.jhs ([5.171.81.3])
        by smtp.gmail.com with ESMTPSA id gt26sm83277ejb.31.2021.04.21.10.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:06:45 -0700 (PDT)
Date:   Wed, 21 Apr 2021 19:06:43 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 2/6] staging: media: atomisp: balance braces around
 if...else block
Message-ID: <20210421170642.GA1414@agape.jhs>
References: <cover.1619022192.git.drv@mailo.com>
 <71220662c5facd746e56288cc74786c96fa3c5a7.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71220662c5facd746e56288cc74786c96fa3c5a7.1619022192.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 10:22:19PM +0530, Deepak R Varma wrote:
> Balance braces around the if else blocks as per the code style guidelines.
> Resolves checkpatch script CHECK / WARNING feedback messages.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes in v1:
>    - None.
> 
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c  | 7 ++++---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
>  5 files changed, 12 insertions(+), 11 deletions(-)
> 

Hi,

the email subject prefix should be [PATCH v2 n/N], the previous
patchset was v1 implicitly.

thank you,

fabio
