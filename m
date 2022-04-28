Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C1B5131A0
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 12:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiD1KzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 06:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237090AbiD1KzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 06:55:07 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0306189CE1
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 03:51:52 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 13FAD20149;
        Thu, 28 Apr 2022 13:51:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1651143110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6WeEeobYsclN/tHlE0+BMkVSQbgBCwJE8a+NGMSpR+8=;
        b=LM4WvKud/nndPE+z1RdPyHfNXMXtmWqJ8S9Y9pBWHsgWbcgUUWKlX/CPnU1RxrTCdbKvtp
        UH2HpCrZ8K60fPDatnl0ioc04DEuuF8J6xdbsIlON71sgigb95RKXnVgsWN4Ql5Z57hBcf
        eGbVUHyOMqomSaSWT6ZDJUYuk4y0Bv0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B589A634C91;
        Thu, 28 Apr 2022 13:51:49 +0300 (EEST)
Date:   Thu, 28 Apr 2022 13:51:49 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mike Pagano <mpagano@gentoo.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1 v2] media: i2c: ov2640: Depend on V4L2_ASYNC
Message-ID: <YmpxxcOrAqSbZ9Az@valkosipuli.retiisi.eu>
References: <90ec589b-7361-03aa-dab1-54ccd4116207@gentoo.org>
 <YmmthjPAJIboBCbk@valkosipuli.retiisi.eu>
 <7a3bfccf-743f-6c18-e221-9490c258a903@gentoo.org>
 <5ba2bee6-5d00-6414-a30a-7f8be8596eb0@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ba2bee6-5d00-6414-a30a-7f8be8596eb0@gentoo.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1651143110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6WeEeobYsclN/tHlE0+BMkVSQbgBCwJE8a+NGMSpR+8=;
        b=JlhWHHxxX74NRqYD2o1DEpN7p//FouFDe7N1vmmStOH8guyJqqDRR08MEIEFldWCHrXRpX
        MBA3xXumOG42y4iEF3WhwYX92N4x0vrxbiyAmWEiVMYichU0srWV1Xa3p0Xmk42UTfhj9l
        b2iilx86AZew4RYJu89S292agKSF7OM=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1651143110; a=rsa-sha256; cv=none;
        b=SZqarhWCQVvyje24P5W+kXqgwcA2UrdnjvRYDTzNuMXfC3xU4Pd1VX+WOhKAB/BLrdYPM8
        ZO7m8petc2KX+M/6xJnPH7rRsNXpU4IaIZ1VPFjU0f3A9rYsl+L68KBqDQj0XSO2x6sLrO
        KmPrakSwo3kOo+8zTh4j6VnsOkGaE8s=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mike,

Thanks for the update.

On Wed, Apr 27, 2022 at 05:59:23PM -0400, Mike Pagano wrote:
> Add V4L2_ASYNC as a dependency to match other drivers and prevent failures when compile testing.

The commit message should be wrapped at 75 characters or earlier.

> 
> Fixes: ff3cc65cadb5 ("media: v4l: async, fwnode: Improve module organisation")
> 

No newline needed here.

I'll address these when merging it.

> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index fae2baabb773..2b20aa6c37b1 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -372,6 +372,7 @@ config VIDEO_OV13B10
>  config VIDEO_OV2640
>  	tristate "OmniVision OV2640 sensor support"
>  	depends on VIDEO_DEV && I2C
> +	select V4L2_ASYNC
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2640 camera.

-- 
Sakari Ailus
