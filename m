Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F09238960F
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 21:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhESTCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 15:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhESTCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 15:02:45 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78324C061761
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 12:01:25 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010:afd2:773e:79db:477b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4DF6B1B002F1;
        Wed, 19 May 2021 22:01:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1621450881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qo/vi0wq4L+WKO/LfHvNJwknDs9hwyaZcr0nmGtpm0Y=;
        b=D6Q0IUrsgxxmkWCzui7CZR1q469yyuofl+zJB0a9/hw6616g0oyyAemoqaqz9xJIWgYuGq
        gOhjQvbVahoB3tejo4iGa68lJ0NSgRbURTe+3AdITO32Rev6itwhKNg9KAkGpafIvQJbGn
        Dh/fqF5FhdUumf6sXj8eEhdIRc2zFICcs0NIkA2YlLQevo1cUc+daMf8O7ITK7mgJRRtLG
        mk/RFS4UceGXK73jEwXXBDfps2gvqb0zef42Z3TvBul0lqCqlJ1F8v5dY7vM7BpcuSLp22
        6OOn4+3dU8kwRXwonSvEL1NlbVVreFJ6iLiVVuHlVfmIJVCZWwv3vpwJXFsiRQ==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5EAE3634C89;
        Wed, 19 May 2021 21:57:52 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1ljRRZ-0000Nt-7D; Wed, 19 May 2021 22:01:21 +0300
Date:   Wed, 19 May 2021 22:01:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <20210519190121.GJ3@valkosipuli.retiisi.eu>
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
 <20210517100240.3323-3-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517100240.3323-3-david.plowman@raspberrypi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1621450881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qo/vi0wq4L+WKO/LfHvNJwknDs9hwyaZcr0nmGtpm0Y=;
        b=jZNO3Fyt5jY4IlLonzZjGnAAu837BU242P2aErscAuzMUOHHQvyIuj6Ho5+bBD2tJ4F4a3
        IdWOtsajXeY1TWkGtmxfULFcxY2bu8jPPud+p7QWqSPhzjmYEDzZG70C4f/VvHpmtYYQNg
        6VX/olGgmZYOmDFXx8LfL0ygmWODKbKgKd5ly8kflZl0eaPu0PRIa6UDel4pMfg3a5pnZD
        9Rk4MNtxG8wQhD0Q3NY1qhJCxO99yoJNt9Zhk7/6CTpCRcZYqsUOr0DaVWzqW407157fjB
        k+CQwhVL36P6dIgZrYfAGiuIucHIPvEp0zluXTRunGKibvfYdVECcc+6Hsfh1Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1621450881; a=rsa-sha256;
        cv=none;
        b=H8LfKURfC4mAuAUInq9OeWfanScWJmFouOwEb9AcEgOsrNzH2I7BOV1DZtis5FlvEUWkrK
        qb1PADgMrXoF7XQF04aojMCi1dy9MQP8W85hY1UDJGxg7Xu4i3m6rT0HnEeiOS7uuBU8pf
        6buD6sH2dFRtFf+BO/tDiQpKUsgW8mKz7RZIkw64B4I1ZtmWP+t3qHUtdS8+QvaTbGayj9
        6e1oubZBsJM2V0tphnqtrdW1s/ObGfzzDn4AuYW/ZRemTMJS/Wdv6AhKLloNKq/Jav70z9
        PARN4KspHexHV7L4AkRn69u1kj5j91HlmcOvjt7JEToJH4KWu3cy2/bb9F5bgA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

Thanks for the patch.

Cc'ing Laurent, too.

On Mon, May 17, 2021 at 11:02:40AM +0100, David Plowman wrote:
> Add documentation for each of the controls
> 
> V4L2_CID_NOTIFY_GAIN_RED
> V4L2_CID_NOTIFY_GAIN_GREENR
> V4L2_CID_NOTIFY_GAIN_BLUE
> V4L2_CID_NOTIFY_GAIN_GREENB
> 
> These controls are required by sensors that need to know what colour
> gains will be applied to pixels by downstream processing (such as by
> an ISP), though the sensor does not apply these gains itself.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index de43f5c8486d..f824d6c36ae8 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -72,3 +72,31 @@ Image Source Control IDs
>      * - __u32
>        - ``height``
>        - Height of the area.
> +
> +``V4L2_CID_NOTIFY_GAIN_RED (integer)``
> +    Notify the sensor what gain will be applied to red pixels by the
> +    subsequent processing (such as by an ISP). The sensor is merely
> +    informed of this value in case it performs processing that requires
> +    it, but it is not applied to the output pixels themselves. The
> +    units are determined by the sensor driver.

I wonder if this should say the default value should reflect gain of 1. It
probably wouldn't hurt at least.

> +
> +``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
> +    Notify the sensor what gain will be applied to green pixels (on
> +    red rows) by subsequent processing (such as by an ISP). The sensor
> +    is merely informed of this value in case it performs processing
> +    that requires it, but it is not applied to the output pixels
> +    themselves. The units are determined by the sensor driver.
> +
> +``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
> +    Notify the sensor what gain will be applied to blue pixels by the
> +    subsequent processing (such as by an ISP). The sensor is merely
> +    informed of this value in case it performs processing that requires
> +    it, but it is not applied to the output pixels themselves. The
> +    units are determined by the sensor driver.
> +
> +``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
> +    Notify the sensor what gain will be applied to green pixels (on
> +    blue rows) by subsequent processing (such as by an ISP). The sensor
> +    is merely informed of this value in case it performs processing
> +    that requires it, but it is not applied to the output pixels
> +    themselves. The units are determined by the sensor driver.

-- 
Kind regards,

Sakari Ailus
