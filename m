Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4956D354EED
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 10:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239804AbhDFIrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 04:47:36 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43597 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232593AbhDFIrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 04:47:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ThMnl3oQo43ycThMqlNGVz; Tue, 06 Apr 2021 10:47:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617698846; bh=mfkZRE3IiV4Y6zCvybhFbJVgwZDIoc29jVODHYqsFdI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oyEYPcl50nsYFhKGsXRRNGNGOKH5YMZ/54UqjpSZXjvZ3le2SznpWbPtmT3BPjjNS
         smnMu5D4aP8m9y9Pcwp0CWFnXX+mK4jCGDvCy5wPrXUQc+Ep1H7CVi+NEwJXjgpInc
         rjm5h9Ui/JSHsJjxHrCy4eQVRTYo332ZsSqRvYj0I46cFQ/QrJrG8ckMvUndalFRgy
         jBqhEDR6yTDxPrOZ+yN/x8Mz1DKWR8XpK/ucb9+IuTZ+gmc+9uw7nUUOXoDx+X1sJl
         l5Ar6bz3pScGyrVRTE2+OH66+NrMdihcTnsg4Sywky306vbJ+h1NbrnbFXbOScTRyX
         nfwiadOYPF2gA==
Subject: Re: [PATCH] media: usb: Remove duplicate declares
To:     Wan Jiabing <wanjiabing@vivo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
References: <20210327074247.1487713-1-wanjiabing@vivo.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <52a49728-5991-5a51-5001-06d6e3011c56@xs4all.nl>
Date:   Tue, 6 Apr 2021 10:47:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210327074247.1487713-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ2e9pbVV2H+aOoxIDFJhL6OXkX8qNnKp6jgrnx0oXWXax2YThOMu/Cdl7tSqMI/xo9aR0MNIm1ejq772kKCVbv6AI+kssHfip/3sz2NZbRcYSPgzeNL
 HKopQ5SO8mYaSPjaCoYiCCYvi6YBvYBsd0SvjrcBcE/N2s7ihL5cJVgV6JSIKbNyC9OKMEDvuLmIuJSKHmhfz1Vh30kzX0bV8nM49NnMCTy3rLTeDLI37Ucc
 DiIZ4PBTI4676uuW/moA9mpOvrBJFAyxon5LBI7W+9wJf0PBhOo9aEo/GVlu950ZcdC6FFC1yXb1kH6glrC8msLxlJR5blpai+R2lHKMOpE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please specify in the subject line which driver this patch changes.

I also would prefer that this is split into two patches, one for each driver.

Just saying 'media: usb:' makes it look like you have a media/usb subsystem patch,
but that's not the case. Very confusing for code reviewers.

Regards,

	Hans

On 27/03/2021 08:42, Wan Jiabing wrote:
> struct cx231xx has been declared at 146th line.
> struct em28xx has been declared at 219th line.
> Remove the duplicate.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/media/usb/cx231xx/cx231xx.h | 2 --
>  drivers/media/usb/em28xx/em28xx.h   | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
> index b32eab641793..6929e4d97067 100644
> --- a/drivers/media/usb/cx231xx/cx231xx.h
> +++ b/drivers/media/usb/cx231xx/cx231xx.h
> @@ -425,8 +425,6 @@ struct cx231xx_audio {
>  	u16 end_point_addr;
>  };
>  
> -struct cx231xx;
> -
>  /*****************************************************************/
>  /* set/get i2c */
>  /* 00--1Mb/s, 01-400kb/s, 10--100kb/s, 11--5Mb/s */
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index 6648e11f1271..43227111d410 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -628,8 +628,6 @@ struct em28xx_audio {
>  	atomic_t       stream_started;	/* stream should be running if true */
>  };
>  
> -struct em28xx;
> -
>  enum em28xx_i2c_algo_type {
>  	EM28XX_I2C_ALGO_EM28XX = 0,
>  	EM28XX_I2C_ALGO_EM2800,
> 

