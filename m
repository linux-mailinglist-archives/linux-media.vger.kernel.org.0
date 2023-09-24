Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5406F7AC79F
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 12:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjIXKzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 06:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIXKzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 06:55:54 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27824100
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 03:55:48 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RtjbM6fRWz49Q1V;
        Sun, 24 Sep 2023 13:55:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1695552945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7KfF8p+2kieYHYNZ9yte/6MyKffgjF3KHmJyLr8TnH0=;
        b=c7gmZ8QEm4e6xG4iumR6aNrSkakK4J/QkFrDlMK60LWYjcZIoGV35Fkogc5FQFckTkfcwy
        En3F7NGDrjjonhRPJn31E7wbz5s/byYS12BU8yMRA124dP5oost44FauDQq4MOHjG6k0TW
        TY7xJhCfSB9Znosn0fgRhR3wT1qQu6HsA653/ZKccRMm/uK/4AIAOSsUSaOPGpLwfsg6fw
        s6UrJuGtzmm6y5MGME5TmkIoX6mDa2KLXusunTTXOscdYDZYhTenmokZl2OboiLmxKr8vC
        syb64DZnTWaUdZuLxo0bwzozxs5ersxOzzN+Rg0dMBX0YRS6cp3ZUJeflwH2rw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1695552945; a=rsa-sha256;
        cv=none;
        b=R0bWNDJRW3gMUq10XtYd5UMbJk8FIKMpEkpohjLoc1s+1RVYtxUKe8p3HN/6r+wxyop1yg
        YmHMfZnnRMMQvn++uvRdma0xPut4awu3HY7hOCYMJFD/YHMsY+kFYSoQkTIFrEyd8QDF0G
        6+PORa82foN/QhfSVVB5Q6L+f2ZS9p6h/CIdIZw+iVp71Gj60sgZKtfYhPULO+crWLkOVi
        Fv7IB8zGl9Qsrf0KVtpgg0KdBy0G2ReKN3w2iXvKIh2ttfWYQpJg00aldUFue6CUDZqe1w
        IFtM/UCld7UCPsmdpB8w7Uqb4+/BTJiasx9Wn2IanvgZMzFIdKDPrMVuXkkFJg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1695552945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7KfF8p+2kieYHYNZ9yte/6MyKffgjF3KHmJyLr8TnH0=;
        b=USvG0lRcx4U8jGxXi5q3NCcUQCqowU/Jm5XGyAzSB/egqkoQui30K4EliB6PkoqNZKuhuv
        onF5hsLpb0JW9VJv4Mtqx12FhrPyhz7GzBCytZKRnIM/hpH7e9BB+k7RkaYK+G4D28XsMj
        mGWvbYn1+WjRHFrJ/bbjSQKGCnVsynmY+vNozXTL0I7QNk074vM7FEuMjrA1GthtTV/IL3
        4bo/X51ao6Rqcv/w8igDiyS9qsQRclDoaLwr4NynD9uBzAo9BOIg1w0XUPYKjrrLAai0kC
        2xebNxW9kgmilYNmxbSf9ArZ6rVyT+qirbJcsVgYkf45NIhlujEG+BiCIPA3ng==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 20ED4634C93;
        Sun, 24 Sep 2023 13:55:43 +0300 (EEST)
Date:   Sun, 24 Sep 2023 10:55:42 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCHv2 11/23] media: v4l2-dev.h: increase struct video_device
 name size
Message-ID: <ZRAVrlJr2H+Rvh9R@valkosipuli.retiisi.eu>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-12-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923152107.283289-12-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Sep 23, 2023 at 05:20:55PM +0200, Hans Verkuil wrote:
> Increase the size of the name field to prevent a lot of
> string truncate compiler warnings.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

I wonder if there's a way to avoid these otherwise. They still 32
characters when exposed to the user space. Besides --- will the strings
exported to the user space remain "\0"-terminated?

> ---
>  include/media/v4l2-dev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index e0a13505f88d..d82dfdbf6e58 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -284,7 +284,7 @@ struct video_device {
>  	struct v4l2_prio_state *prio;
>  
>  	/* device info */
> -	char name[32];
> +	char name[64];
>  	enum vfl_devnode_type vfl_type;
>  	enum vfl_devnode_direction vfl_dir;
>  	int minor;

-- 
Regards,
Sakari Ailus
