Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366B93B2B75
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhFXJeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 05:34:15 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:40780 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFXJeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 05:34:14 -0400
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 982391B0024A;
        Thu, 24 Jun 2021 12:31:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1624527113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0iGvap/eV/2zN+OduewABmqhwVAmw9j6ZCNs+E9n+7s=;
        b=Bwyq8etvkB/0uY3kyLMjJ0NwenO7cKiLkoZace9ArWOSysAA4bfxPWS7cbEfI8jucNkdrX
        3domcPovaTvxKZGysxvgpgyQdcj2aC2bv6FHRkP2qmG4JHlsswR6Gi43Eer3GA40renpgV
        FFdUv3KVNSpIczMU5mrOx+lCZUfBE0d0Tp857HYh7Q3mBveImln9KUSbRRCPvYFueFlGY0
        /E2RZ7aSDEHDLZ4fel2hfQ++s8Y/m4+bq0HzzTbXnurMA8ElUtiPH8+y9HR494t+eJcQ4E
        paYzM81mEFtQ2bohdw7tjYWIU46Wy9lq0xUnrtfX1634uPPft+/JfpdfzT/8Wg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 45BEB634C87;
        Thu, 24 Jun 2021 12:31:38 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lwLiD-00018j-LB; Thu, 24 Jun 2021 12:31:53 +0300
Date:   Thu, 24 Jun 2021 12:31:53 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Message-ID: <20210624093153.GJ3@valkosipuli.retiisi.eu>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
 <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1624527113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0iGvap/eV/2zN+OduewABmqhwVAmw9j6ZCNs+E9n+7s=;
        b=ADnv+RUlGBaMwtBb94n6it4QAk7BC1zxy4gLpiYqYxKoxRYZ97sFroqHlCblk7LiqTvHq1
        zs/YeJnQDaZATf7vxOm6rV1oWnV7qSPZLuoqztwUesOUfM0xPht0OwLuMvckO9iv6uNlxq
        xr8urOWpE1iDytBNR2QkJ9gBaINaoFGO03UWZLVx2ry4hyUNAgfIGopDdQneY7fg1kUUpr
        lyCT4WgtlR43poAoZT+8PAalqBpe4MhY/zSb2dgAgK+XZcn9dp/8IVvwl0dhrDXdsUAARv
        69aeDe0QmM6dopX8mVRUZuPCjT02UIJdplIDaWRmuO9wW3SwxgrdCvnH8Sgy3Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1624527113; a=rsa-sha256;
        cv=none;
        b=an+WbC0hAzt6h4+MOeIXZTnD48xR25ndkJxgHSBgwJKS3NBfOGH5+EdYMHoiahmtIlFpG0
        /7F5JKVWPXyRHW/VB5u48s5KCji1bFBbgqiZrurXbohC/eNBriRjMXNGPnFlaHPpsr6FRs
        rtsa3zqHX1dfIp3xULibuBmtV64MyrcUCTbIDaZpnjwqP1ToUdB5f6VjyFnx5bi7RP40uT
        fhpqyj3DFBlr+E/9PIbk61JXP5I/swMisr6UvIMbANqkxIxSUSWkBHOo0xOTFMvRLrBIYG
        tSS9d0Hl8J2DPHjrGuY0vUlg3dWoyy8HU0WnChBGcdDLiIBRjnsR5jwbpYYO/w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Could you check if your mail client could be configured not to add junk to
To: field? It often leads anything in the Cc: field being dropped.

On Mon, Jun 21, 2021 at 01:56:47PM +0200, Mauro Carvalho Chehab wrote:
> As pointed by smatch:
> 	drivers/media/v4l2-core/v4l2-flash-led-class.c:264 v4l2_flash_s_ctrl() error: we previously assumed 'fled_cdev' could be null (see line 197)
> 
> It is too late to check if fled_cdev is NULL there. If such check is
> needed, it should be, instead, inside v4l2_flash_init().
> 
> On other words, if v4l2_flash->fled_cdev() is NULL at
> v4l2_flash_s_ctrl(), all led_*() function calls inside the function
> would try to de-reference a NULL pointer, as the logic won't prevent
> it.
> 
> So, remove the useless check.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-flash-led-class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> index 10ddcc48aa17..a1653c635d82 100644
> --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> @@ -194,7 +194,7 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
>  {
>  	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
>  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> -	struct led_classdev *led_cdev = fled_cdev ? &fled_cdev->led_cdev : NULL;
> +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;

fled_cdev may be NULL here. The reason is that some controls are for flash
LEDs only but the same sub-device may also control an indicator. This is
covered when the controls are created, so that the NULL pointer isn't
dereferenced.

If you wish the false positive to be addressed while also improving the
implementation, that could be done by e.g. splitting the switch into two,
the part that needs fled_cdev and another that doesn't.

I can send a patch for that.

Please also cc me to V4L2 flash class patches. I noticed this one by
accident only.

>  	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
>  	bool external_strobe;
>  	int ret = 0;

-- 
Kind regards,

Sakari Ailus
