Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C04C430BE3
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 21:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242771AbhJQT7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 15:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242759AbhJQT7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 15:59:41 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E76C06161C
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 12:57:30 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r7so37327777wrc.10
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xtVQlPdkcZnLgGwDqTZh7i92rf4R+GARneWlElIxelE=;
        b=FNuPSAsi/VR0J4YFMAIzaA4a9nC7szSv1+eUS1fROFTS7vM9gkgNvr5vnCQOhfivO0
         mGoVrcJOPPb3Y0SMMu3+OF6lieSI+vN/jRagPKtsEMt0kc9MYo/S1De5cOoXj1TVdP5x
         kP3JGR4osO2ivEMTKhn8gWw7dZpL4pgJQ9bfMpOpB25M033C6D+sHnc5rtStO2gZR1tQ
         BxJ8vyH8BFAoWzpSJfJ7qZOhR8B4f3HJrKI8NB+kBC2B/4vS/GckcFhUsKZ+/rCOG9Ts
         d3Nuzsw9TZq2T5ERg0Tkar/Lhb561sFFyFpSyIQPL08+GY4GheVaSMi2U4o/6xXXGZOQ
         r2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xtVQlPdkcZnLgGwDqTZh7i92rf4R+GARneWlElIxelE=;
        b=2Kosifl2jIrXWHUevykXmBfmN8D5fVcBFt7dOP3J31Y/wG1I3D4dJHRfPgQdNVBj/0
         9+iFwaxf4fMWODzF2Fomnd78I9hraAKoirOnsOpDWsP8RjWP8gOsRAkDz2/Xhrr8YLya
         wGu4PqP7oIn8u/jec/yFsVsX7QEqs3iTkvknMTmTrfCBiYsPaEprTIl7QfalhpwKe63w
         OaJE30gjhZtU/SDwSFmTjrI4FLaMXfmNjDPyeFQVY2lqQlH+uaGTOeQbD6/E6ZLaQz8g
         M7H7RNDH2vmqoQjBgM95JBMWBf3WIAm6mPBqDKkC7l7q/Eoq7fsSijkYBzzWKkaUkFCo
         9nFA==
X-Gm-Message-State: AOAM532Ir/nGQXNuVGZYSIweWceUM06UTIRQ41Frq5CtVo7ypAqqukY8
        jyUZiwUZR8qjH6jwxfyImJ4kWg==
X-Google-Smtp-Source: ABdhPJyuWQWwOMtuiE7ax1hxiutfdudm1XBNHdVou0KYgqADhW+EOkd3K/Rt4ER1gqkVFICKYENbaQ==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr30502649wrs.365.1634500649381;
        Sun, 17 Oct 2021 12:57:29 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id d1sm12061110wrr.72.2021.10.17.12.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 12:57:28 -0700 (PDT)
Date:   Sun, 17 Oct 2021 21:57:27 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 06/10] staging: media: zoran: fusion all modules
Message-ID: <YWyAJ1gqDrSIqAu7@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <20211013185812.590931-7-clabbe@baylibre.com>
 <20211014080155.GY2083@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211014080155.GY2083@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Thu, Oct 14, 2021 at 11:01:55AM +0300, Dan Carpenter a écrit :
> On Wed, Oct 13, 2021 at 06:58:08PM +0000, Corentin Labbe wrote:
> > The zoran driver is split in many modules, but this lead to some
> > problems.
> > One of them is that load order is incorrect when everything is built-in.
> > 
> > Having more than one module is useless, so fusion all zoran modules in
>                                              ^^^^^^
> "fusion" isn't the right word.  It should be "fuse" or even better
> "merge".  Same in the subject.
> 

Hello

I will use merge, thanks for the suggestion.

> > +static int load_codec(struct zoran *zr, u16 codecid)
> > +{
> > +	switch (codecid) {
> > +	case CODEC_TYPE_ZR36060:
> > +#ifdef CONFIG_VIDEO_ZORAN_ZR36060
> > +		return zr36060_init_module();
> > +#else
> > +		pci_err(zr->pci_dev, "ZR36060 support is not enabled\n");
> > +		return -EINVAL;
> > +#endif
> > +		break;
> > +	case CODEC_TYPE_ZR36050:
> > +#ifdef CONFIG_VIDEO_ZORAN_DC30
> > +		return zr36050_init_module();
> > +#else
> > +		pci_err(zr->pci_dev, "ZR36050 support is not enabled\n");
> > +		return -EINVAL;
> > +#endif
> > +		break;
> > +	case CODEC_TYPE_ZR36016:
> > +#ifdef CONFIG_VIDEO_ZORAN_DC30
> > +		return zr36016_init_module();
> > +#else
> > +		pci_err(zr->pci_dev, "ZR36016 support is not enabled\n");
> > +		return -EINVAL;
> > +#endif
> > +		break;
> > +	}
> 
> Not related to your patch but if load_codec() fails, the probe function
> still calls zoran_setup_videocodec() on the failed codec.  It might be
> better to set the codec to zero?
> 
> 		result = load_codec(zr, zr->card.video_codec);
> 		if (result < 0) {
> 			pci_err(pdev, "failed to load codec %s: %d\n", codec_name, result);
> 			zr->card.video_codec = 0;
> 		}
> 

I will rework by adding a video_codec_init/exit, it will help tracking error (current behavour to ignore error is bad).
Furthermore, my patch forgot to add call to all "old module" exits, so dedicated function will be better.

Thanks for the review
Regards
