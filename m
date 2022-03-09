Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 311FE4D2B7A
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 10:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiCIJLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 04:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiCIJLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 04:11:33 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5410B16BF95
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 01:10:34 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id DD1161B00220;
        Wed,  9 Mar 2022 11:10:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1646817032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fRo81M6uCoePc71EisbV3PYOP4cegffJ3Vjqzcg83CE=;
        b=MFDYfLD023oXLBbvNUWs7YfzgSutXlltOPi6SJecdK+ZCxopOVrX5ghPAh0ceY2wBsayrK
        +lJcHEErXuPUcZNNhuUEuxQXx8fWaZN6SvM+jckniUTN9s1Le8AL4jzl1+axKUPziAfHQR
        yDl+mQLHgOOY7vnJt7rq32pYRcv0tgflowPrdUg0jnrxcJRXj5IfQzwdz97NY3MR1z7BoC
        yPRMZHF8W+Eo4CSpE7qQyV8m+U35CM4X4vTUGb/ldpQkSfBCJCtCubHyq2g2bxKKQqTr6O
        yZY5Tg7zPxxXCF2fkBYI1GQvnJ+XwmHXIdejBMXSK1JI5Ij2J0XK0tPrkZiuZw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 894F6634C90;
        Wed,  9 Mar 2022 11:10:31 +0200 (EET)
Date:   Wed, 9 Mar 2022 11:10:31 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 3/4] mc: Set bus_info in media_device_init()
Message-ID: <YihvB4GLscaxJ+s5@valkosipuli.retiisi.eu>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-4-sakari.ailus@linux.intel.com>
 <YfQEDKFnJxIfADYx@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQEDKFnJxIfADYx@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1646817032; a=rsa-sha256;
        cv=none;
        b=txerjmIBZWiE2d/OsTfiees7Pvi2HsxQxuSdhxqM6se+1MuHIvbFFBPFIVhKwILMo2C2Iu
        YKd81oLUsrAlYe+EA6vS8ZSWblJwaYekxDn7vajxZHks8Wclf/pxsC04kOI/VlsUeBMgdn
        J+ITa+O9mvjKGr16YKEdFGKh0+lB+b4+SzZ1TbFniSP5cxsq10wsroCQQ8Cro5C0bW6pv8
        l2dW3W2HmZzq6Lpn86yFixqumsIZ+JDiQWNy4y/4MAju9Ca9t1JPeSUO/ApW3GLRgxqb8P
        uTTA5xqfUPwxSGsnOXc8npA35lIaX6Uei7UPwrjbaskphsn88JX6DFem7LDYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1646817032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fRo81M6uCoePc71EisbV3PYOP4cegffJ3Vjqzcg83CE=;
        b=EsuqnuI+a6nZ6S8oz4KXQnhNEUfE7ElPVyH2g4Sts0Z5/p5wDu/EZ/LOqyVkh5Bsa5rL+r
        t3NI9FQnHSU2FZsNdv5eOYMhPccH+bgu76n7KpsntgBSlgCzYEcF+Acg1kfjKIf0WmQfuX
        CHb9Q3+C2JeEH3dunuZlwX0h45BuYawuPYI/6ZzEN8AO2Nf5bysm3/JKrULYrwp2jG1OBt
        ZECKFsJvnaXBSPLc9W4Tro8ObRn75wmszg+LkFI6rcuso4tSN6CwaHFcdsF03b+Eu8jYej
        NcCqUfeCa/tt/saIviOzCtodYYQxRQ+FKryC6LjrFsLBzF7CXfUAQyjCHjv6DA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jan 28, 2022 at 04:56:12PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Jan 28, 2022 at 10:33:08AM +0200, Sakari Ailus wrote:
> > Set bus_info field based on struct device in media_device_init() and
> > remove corresponding code from drivers.
> > 
> > Also update media_entity_init() documentation: the dev field must be now
> 
> Did you mean media_device_init() ?

Yes.

> 
> > initialised before calling it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-device.c                       | 4 ++++
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      | 2 --
> >  drivers/media/platform/rcar-vin/rcar-core.c        | 2 --
> >  drivers/media/platform/stm32/stm32-dcmi.c          | 2 --
> >  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 2 --
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 2 --
> >  drivers/media/platform/ti-vpe/cal.c                | 2 --
> >  drivers/media/platform/vsp1/vsp1_drv.c             | 2 --
> >  include/media/media-device.h                       | 9 ++++++---
> >  9 files changed, 10 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index 094647fdb866..824d89b325a6 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -700,6 +700,10 @@ void media_device_init(struct media_device *mdev)
> >  
> >  	atomic_set(&mdev->request_id, 0);
> >  
> > +	if (!*mdev->bus_info)
> > +		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
> > +				   mdev->dev);
> > +
> >  	dev_dbg(mdev->dev, "Media device initialized\n");
> >  }
> >  EXPORT_SYMBOL_GPL(media_device_init);
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > index 0e9b0503b62a..b15fac775e14 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > @@ -1777,8 +1777,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  	cio2->media_dev.dev = dev;
> >  	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
> >  		sizeof(cio2->media_dev.model));
> > -	snprintf(cio2->media_dev.bus_info, sizeof(cio2->media_dev.bus_info),
> > -		 "PCI:%s", pci_name(cio2->pci_dev));
> >  	cio2->media_dev.hw_revision = 0;
> >  
> >  	media_device_init(&cio2->media_dev);
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 0186ae235113..1099cab7d95d 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -94,8 +94,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
> >  
> >  	strscpy(mdev->driver_name, KBUILD_MODNAME, sizeof(mdev->driver_name));
> >  	strscpy(mdev->model, match->compatible, sizeof(mdev->model));
> > -	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
> > -		 dev_name(mdev->dev));
> >  
> >  	media_device_init(mdev);
> >  
> > diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> > index 7694ffef5c00..90c69113ce60 100644
> > --- a/drivers/media/platform/stm32/stm32-dcmi.c
> > +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> > @@ -1970,8 +1970,6 @@ static int dcmi_probe(struct platform_device *pdev)
> >  
> >  	/* Initialize media device */
> >  	strscpy(dcmi->mdev.model, DRV_NAME, sizeof(dcmi->mdev.model));
> > -	snprintf(dcmi->mdev.bus_info, sizeof(dcmi->mdev.bus_info),
> > -		 "platform:%s", DRV_NAME);
> >  	dcmi->mdev.dev = &pdev->dev;
> >  	media_device_init(&dcmi->mdev);
> >  
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index 80a10f238bbe..18e6c65f4737 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -173,8 +173,6 @@ static int sun4i_csi_probe(struct platform_device *pdev)
> >  	strscpy(csi->mdev.model, "Allwinner Video Capture Device",
> >  		sizeof(csi->mdev.model));
> >  	csi->mdev.hw_revision = 0;
> > -	snprintf(csi->mdev.bus_info, sizeof(csi->mdev.bus_info), "platform:%s",
> > -		 dev_name(csi->dev));
> >  	media_device_init(&csi->mdev);
> >  	csi->v4l.mdev = &csi->mdev;
> >  
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > index fc96921b0583..a971587dbbd1 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > @@ -733,8 +733,6 @@ static int sun6i_csi_v4l2_init(struct sun6i_csi *csi)
> >  	strscpy(csi->media_dev.model, "Allwinner Video Capture Device",
> >  		sizeof(csi->media_dev.model));
> >  	csi->media_dev.hw_revision = 0;
> > -	snprintf(csi->media_dev.bus_info, sizeof(csi->media_dev.bus_info),
> > -		 "platform:%s", dev_name(csi->dev));
> >  
> >  	media_device_init(&csi->media_dev);
> >  	v4l2_async_nf_init(&csi->notifier);
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 4a4a6c5983f7..11f67abc2f38 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -884,8 +884,6 @@ static int cal_media_init(struct cal_dev *cal)
> >  	mdev->dev = cal->dev;
> >  	mdev->hw_revision = cal->revision;
> >  	strscpy(mdev->model, "CAL", sizeof(mdev->model));
> > -	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
> > -		 dev_name(mdev->dev));
> >  	media_device_init(mdev);
> >  
> >  	/*
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> > index c9044785b903..d27594dbf0e1 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -243,8 +243,6 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
> >  	mdev->dev = vsp1->dev;
> >  	mdev->hw_revision = vsp1->version;
> >  	strscpy(mdev->model, vsp1->info->model, sizeof(mdev->model));
> > -	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
> > -		 dev_name(mdev->dev));
> >  	media_device_init(mdev);
> >  
> >  	vsp1->media_ops.link_setup = vsp1_entity_link_setup;
> > diff --git a/include/media/media-device.h b/include/media/media-device.h
> > index 54f0c12bc682..5796162c0280 100644
> > --- a/include/media/media-device.h
> > +++ b/include/media/media-device.h
> > @@ -219,6 +219,12 @@ static inline __must_check int media_entity_enum_init(
> >   * So drivers need to first initialize the media device, register any entity
> >   * within the media device, create pad to pad links and then finally register
> >   * the media device by calling media_device_register() as a final step.
> > + *
> > + * The dev field of struct media_device must be initialised before calling
> > + * media_device_init().
> > + *
> > + * The bus_info field is set by media_device_init() for PCI and platform devices
> > + * if the field begins with '\0'.
> 
> Do you expect any driver for PCI or platform devices to set bus_info, or
> should that be forbidden ?

There are existing devices that do it at least. I'm not sure there should
be any new ones.

> 
> >   */
> >  void media_device_init(struct media_device *mdev);
> >  
> > @@ -243,9 +249,6 @@ void media_device_cleanup(struct media_device *mdev);
> >   * The caller is responsible for initializing the &media_device structure
> >   * before registration. The following fields of &media_device must be set:
> >   *
> > - *  - &media_entity.dev must point to the parent device (usually a &pci_dev,
> > - *    &usb_interface or &platform_device instance).
> > - *
> >   *  - &media_entity.model must be filled with the device model name as a
> 
> This should be media_device, not media_entity. Can you add a patch to
> this series before this one to address this problem ?

Yes.

> 
> >   *    NUL-terminated UTF-8 string. The device/model revision must not be
> >   *    stored in this field.

-- 
Regards,

Sakari Ailus
