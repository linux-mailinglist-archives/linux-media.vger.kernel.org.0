Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3A325C5B0
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 17:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgICPsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 11:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICPsp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 11:48:45 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20549C061244;
        Thu,  3 Sep 2020 08:48:45 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so3761098wrp.8;
        Thu, 03 Sep 2020 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OPj9d30CAARqGx+bikPSsEnUWXOcRX7Mxe5aMa8ahCE=;
        b=Fv+ELy+K8p1TzkuFzHURU8ULrabjLy/GA+gzrVslyT9VOYD/zzcxlCRarBUx24WKrr
         j5Zr67a5zMLy7bfYFOfwlVMhz0E9e2ZT1vbriU7KZwnmIfrI+Vvgk/eBjxqJ5U60a7n8
         8qXKrhUyNu+W5a3GLvwkqwPEcZoFmGBsfTsLAVqsgZS0j4L2k9ovbYqObZHMpPMoDAYG
         bxUfk47jrPQJXDXj//x4zgv++hYgtm05jEFuPueuVK4kNvaM8ywNZyeWHHhRnP7ji5oW
         Gy4tjKcYBr1v93ZJTIKinzVU8XXLMKlP2jGlJ2JLd3wPZMjg1lyL3vvEmGRB9/0ZM7C2
         5w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OPj9d30CAARqGx+bikPSsEnUWXOcRX7Mxe5aMa8ahCE=;
        b=pyMrYsylGaximgyfSuMKHOn0tuQubyOhOTd8Cj+UV1UkMTgqZuNZugeko+v7q7nr7e
         W0Sehy9DP8gqkZwp1ui9EAI1/OlAMBb++lUqaOGG80sDY62fdo4LNzsLDFZiDY5g58AW
         OZaR4hA+6xqZQ9qBiYSUam055fQQxPx2Vqhf0gpcoMwO+5aEiHdsj7qJJ1Em7mFOQwDz
         ujRWKJEw4QiObvFsYh5YhDb9C97ZMtmwc8KN4lQJyvKLG7InRwMYI+cV37nF3OXMeDEM
         72ZIZ9RMtu0PilRiyx4rCBAkN8i6T3YkOEwnnmaUEpvXBtq+rzM/QFJ/D8wEdY+yePAt
         o9vQ==
X-Gm-Message-State: AOAM532IGRibxczIFO6RSQ7JnptE4SP+eSm6DHaaasL2Rzh672/y57CR
        J6ACyea/j168Qxdvgng6Tc0=
X-Google-Smtp-Source: ABdhPJzoUWMY/x3nAOJw9Pgg2IVnTKHb2nEiyUuAELHzrPUZ4WLFr/xkMOPobcmcW7xqeTvOZwlHsA==
X-Received: by 2002:adf:f78c:: with SMTP id q12mr3157273wrp.6.1599148123691;
        Thu, 03 Sep 2020 08:48:43 -0700 (PDT)
Received: from medion (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id x24sm5546173wrd.53.2020.09.03.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 08:48:42 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date:   Thu, 3 Sep 2020 16:48:41 +0100
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix error path in lm3554_probe()
Message-ID: <20200903154841.w5rppm325jobimud@medion>
References: <20200902184207.479525-1-alex.dewar90@gmail.com>
 <20200903121134.GB8299@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903121134.GB8299@kadam>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good point about the timer!

> >  
> > -	err = lm3554_gpio_init(client);
> > -	if (err) {
> > +	ret = lm3554_gpio_init(client);
> > +	if (ret) {
> >  		dev_err(&client->dev, "gpio request/direction_output fail");
> > -		goto fail2;
> > +		goto err_cleanup_entity;
> >  	}
> >  	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
> 
> If atomisp_register_i2c_module() fails then we need to call
> lm3554_gpio_uninit(client) and do other cleanup.

I'm probably showing my ignorance here, but I can't see what cleanup we
need. Inside lm3554_gpio_init we have:

	ret = gpiod_direction_output(pdata->gpio_reset, 0);
	if (ret < 0)
		return ret;
	dev_info(&client->dev, "flash led reset successfully\n");

	if (!pdata->gpio_strobe)
		return -EINVAL;

	ret = gpiod_direction_output(pdata->gpio_strobe, 0);
	if (ret < 0)
		return ret;

I'm not sure how you "undo" a call to gpiod_direction_output, but I'm
thinking you won't need to do anything because it should be ok to leave
a gpio to output 0... right?

Alex

> 
> > -fail2:
> > +
> > +err_cleanup_entity:
> >  	media_entity_cleanup(&flash->sd.entity);
> > +err_free_ctrl_handler:
> >  	v4l2_ctrl_handler_free(&flash->ctrl_handler);
> 
> regards,
> dan carpenter
> 
