Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89AC3512427
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 22:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiD0U54 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 16:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236920AbiD0U5y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 16:57:54 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91F2888E4
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 13:54:38 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 905DA1B00131;
        Wed, 27 Apr 2022 23:54:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1651092876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=csdTiyTlVnYGcGk091jMB7CS9qnhs3IxIkUF9aR0c8o=;
        b=BYD5kTeGV2Qb4OLKxkCaFR94TjanU0u3pP8OCQ6wJ4WaiGUoMmiNH1cMPtF1vNsCVwbK+X
        +MlN5lBT8y7MhZAtZOlXAvE1ApodEF4g2hxQnbIRqy031UPkHeGaaJvwzXG8LNC7OSKS8n
        Y6MizggHiOo8KKSyiafooIlALEh3sEsj7hERzqqICQ3h9l/06G0MayLRmm2xuBeH2P2W68
        t0BFEvT/TcmW4m2p7t8Fa1Vdgmv4PGL66Gnu2A69obWA6mhzpihymPRtOQHmS/doU2exTx
        1ttH3vUO/eWfuV2FjKQUQsKrXHDI8BXZLcZHVpoiP5ZVYi9v58Er2LqFHqsfOw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 75DA0634C91;
        Wed, 27 Apr 2022 23:54:30 +0300 (EEST)
Date:   Wed, 27 Apr 2022 23:54:30 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mike Pagano <mpagano@gentoo.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: ov2640: Depend on V4L2_FWNODE
Message-ID: <YmmthjPAJIboBCbk@valkosipuli.retiisi.eu>
References: <90ec589b-7361-03aa-dab1-54ccd4116207@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ec589b-7361-03aa-dab1-54ccd4116207@gentoo.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1651092876; a=rsa-sha256;
        cv=none;
        b=BiR6ofqGAj3f9mpQW/49+ZQmJWeb+lwCO8cnMBh/KAROMR3Knu2ymCOeYE9Gw06HvZtVEd
        GI+Q/Gp0Z+Njb0P0Fwuo0Jx25ykYR3kHhkOJWEfqiQRCDBqbH+7f9TBu2F5Ehm0jhge0Jy
        ZdqDQu1jpIlEAvfQyR+0Q7rKb0/7y1nOKaYBJfGG33rVCVrat3+vf1FXDsFJgc6+JVlnfb
        1XGqr3P0/d9NkTn21fpzIOVXmpFz3+Lk/TlyyoT+lCllVNbQoFbrWzBcOKVMFUsZyq0xe7
        2T0mGZ7yYSwc1nJqIq5fqU25FQw8lSVXTOE0m4HAb6Uuqg3dbTTxbSSmmz3vSQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1651092876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=csdTiyTlVnYGcGk091jMB7CS9qnhs3IxIkUF9aR0c8o=;
        b=byEikFrvmRf+Zw1qRMdrOgKALy+gkymTS+CljYUJ/PtBdV1vK1j/TqTUOXGQQwkTQadpP9
        ov4NygnAtNDJTLUti5FwxToARQZhegN5LKdsITUyo5tS1qZ0Xf2puu0CI3S64crCa6PaJd
        QtnzluRSjZVkDzYMhm2gWBVFugqdSs5NDj29JhAp/fQMRn+ROWSzlzEmJESpQT/xBdXxs0
        R9VLvDgcmdNbSsB7A3ffz7IyBojLINaJ9x0KmLRKBdWu9tNSxrQWste4IZ+kkAAjkhKok1
        05DRg97ZJl1bm78xXsshhSFeS+sYdPxcPvXhZIjlL+MMIwdoTX3aw6jQ7k/7SA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mike,

Thanks for the patch.

On Wed, Apr 27, 2022 at 04:20:12PM -0400, Mike Pagano wrote:
> Add V4L2_FWNODE as a dependency to match other drivers and prevent
> failures when compile testing.
> 
> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index fae2baabb773..6168c04d8b37 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -372,6 +372,7 @@ config VIDEO_OV13B10
>  config VIDEO_OV2640
>  	tristate "OmniVision OV2640 sensor support"
>  	depends on VIDEO_DEV && I2C
> +	select V4L2_FWNODE

The driver doesn't use v4l2-fwnode but seems to depend on v4l2-async.

Shouldn't this be V4L2_ASYNC instead?

Could you also add this tag:

Fixes: ff3cc65cadb5 ("media: v4l: async, fwnode: Improve module organisation")

>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2640 camera.

-- 
Kind regards,

Sakari Ailus
