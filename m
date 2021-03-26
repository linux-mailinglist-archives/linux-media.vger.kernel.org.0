Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E8834AFD9
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 21:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhCZUJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 16:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhCZUIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 16:08:37 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EE1C0613AA;
        Fri, 26 Mar 2021 13:08:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u10so8787276lju.7;
        Fri, 26 Mar 2021 13:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bTSKUkeadgfX9uFyTr/0jnVXknNnSOXxi4Zs42xIHHg=;
        b=ihng4i0WrKAbWFHENw9r2dTuK2dWiAULRyVWA0o7CDIki4FSnuAXZoZX9cXoB5NrZB
         JY7KOfZObgEWpwqtm9pMvg27/PTud1g8z1h0eNWm0aIsqqLvSoqYsOXmCuaREMr6prNz
         zU7Eg2UYk4Us5GBZIAZIMWOS29iY0tIzlQrKsMwNPVvXaihwZUon9tNcycBVe1Vk9R4V
         dzxN9uMSg8zK/A9exy4LG59ppVOg38xm3hoNZtTvKc4SsoFLRljae60qPxWGl6s5beTU
         3pnqZZiaqFSHvEhgHgMqb4faJvcJyhAKW+H5MfDBf2DvzcU7AThR0+XyEpAdlanX0iBB
         Njfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bTSKUkeadgfX9uFyTr/0jnVXknNnSOXxi4Zs42xIHHg=;
        b=bpBgPU42buw521Na5pJgYDjAfV6tqjCZhrKURpWBoel44f04mGOJwxIdYfAPKhhdo/
         k2D+iATS/xO5ROAmQj3fRkYOIBtC6uYbn6IGH1rV1cSaF9AaLxoQIY2zGGj27KkJu2fi
         NL3Uf7rkoAjZRcuU7AQZf3OI+jL7o42xl+my7ZQqw6HI9NGv74b9utI0kTjQ2ugk/Mxg
         vAMnLHOK1LTUnPoFAf2lsFDECrDxpYhXBEgdloplkrhkGf0gYmSKt2AUYcBpOIgLRW/Q
         Bla3qqWaMN8UDN+HkSjiwFInQB51jWEDa0h7mnW4+b/mRqthkFKr5kf2Dss6a+uP7pL5
         Q0wg==
X-Gm-Message-State: AOAM533HbV75SIFDhkTR6c7N5b2lTQ8fvoB2vFs/EpauM4T7qT0Qtt21
        RtoEVJqAO/6Pbf4dmVZHJ7DydiflOVH99cBZ
X-Google-Smtp-Source: ABdhPJwym6uk4OtELrbqMJwOrYQLce2aqJWpmLQ3HotcGPUdQyGv6jzOzfCWkqzMGgJSYHpM42aGPQ==
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr10055761ljp.277.1616789315032;
        Fri, 26 Mar 2021 13:08:35 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id l10sm962994lfk.48.2021.03.26.13.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 13:08:34 -0700 (PDT)
Message-ID: <988f3fa172458cd1f24366d4a9dbd636d2f8cbff.camel@gmail.com>
Subject: Re: [PATCH] drivers/media/usb/gspca/stv06xx: fix memory leak
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
Date:   Fri, 26 Mar 2021 23:08:33 +0300
In-Reply-To: <20210323171356.4a613351@coco.lan>
References: <20210226233731.614553-1-paskripkin@gmail.com>
         <20210323171356.4a613351@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi! Thanks for the review.

On Tue, 2021-03-23 at 17:13 +0100, Mauro Carvalho Chehab wrote:
> Em Sat, 27 Feb 2021 02:37:31 +0300
> Pavel Skripkin <paskripkin@gmail.com> escreveu:
> 
> > Syzbot reported memory leak in hdcs_probe_1x00()[1].
> > hdcs_probe_1x00() allocates memory for struct hdcs, but if
> > hdcs_init() fails in gspca_dev_probe2()
> > this memory becomes leaked.
> > 
> > int gspca_dev_probe2(struct usb_interface *intf,
> >                 const struct usb_device_id *id,
> >                 const struct sd_desc *sd_desc,
> >                 int dev_size,
> >                 struct module *module)
> > {
> > ...
> > 
> >         ret = sd_desc->config(gspca_dev, id);
> >         if (ret < 0)
> >                 goto out;
> >         ret = sd_desc->init(gspca_dev);
> >         if (ret < 0)
> >                 goto out;
> > ...
> > out:
> >         if (gspca_dev->input_dev)
> >                 input_unregister_device(gspca_dev->input_dev);
> >         v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
> >         v4l2_device_unregister(&gspca_dev->v4l2_dev);
> >         kfree(gspca_dev->usb_buf);
> >         kfree(gspca_dev);
> >         return ret;
> > }
> > 
> > Reported-by: syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > Change-Id: Ia198671177ee346de61780813025110c7c491d7a
> > ---
> >  drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> > b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> > index 5a47dcbf1c8e..24df13b33a02 100644
> > --- a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> > +++ b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> > @@ -485,7 +485,7 @@ static int hdcs_init(struct sd *sd)
> >                                            stv_bridge_init[i][1]);
> >         }
> >         if (err < 0)
> > -               return err;
> > +               goto error;
> >  
> >         /* sensor soft reset */
> >         hdcs_reset(sd);
> > @@ -496,12 +496,12 @@ static int hdcs_init(struct sd *sd)
> >                                              stv_sensor_init[i][1]);
> >         }
> >         if (err < 0)
> > -               return err;
> > +               goto error;
> >  
> >         /* Enable continuous frame capture, bit 2: stop when frame
> > complete */
> >         err = stv06xx_write_sensor(sd, HDCS_REG_CONFIG(sd), BIT(3));
> >         if (err < 0)
> > -               return err;
> > +               goto error;
> >  
> >         /* Set PGA sample duration
> >         (was 0x7E for the STV602, but caused slow framerate with
> > HDCS-1020) */
> > @@ -512,9 +512,13 @@ static int hdcs_init(struct sd *sd)
> >                 err = stv06xx_write_sensor(sd, HDCS_TCTRL,
> >                                 (HDCS_ADC_START_SIG_DUR << 5) | hdcs-
> > >psmp);
> >         if (err < 0)
> > -               return err;
> > +               goto error;
> >  
> >         return hdcs_set_size(sd, hdcs->array.width, hdcs-
> > >array.height);
> > +
> > +error:
> > +       kfree(hdcs);
> > +       return err;
> >  }
> 
> This doesn't seem the right fix here, as it is not the _init function
> that allocates it. Also, when the device is disconnected, a memory
> leak
> will happen.

It won't.

static int hdcs_probe_1x00(struct sd *sd)
{
	....
	sd->sensor_priv = hdcs;
	....
}


static void sd_disconnect(struct usb_interface *intf)
{
	void *priv = sd->sensor_priv;
	....
	kfree(priv);
}

Is it correct?

> 
> I suspect that the right fix would be to move this:
> 
>         hdcs = kmalloc(sizeof(struct hdcs), GFP_KERNEL);
>         if (!hdcs)
>                 return -ENOMEM;
> 
> To the main driver (stv06xx.c) - probably replacing it by kzalloc(),
> 

I don't really understand why, because this allocation refers only to
stv06xx_hdcs, and other stv06xx sensors don't use it.

If hdcs_init() fails, we won't be able to access this pointer, because 
in gspca_dev_probe2() only this code will be executed on error
condition:

	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
	v4l2_device_unregister(&gspca_dev->v4l2_dev);
	kfree(gspca_dev->usb_buf);
	kfree(gspca_dev);

Maybe, I don't properly understand it, can You explain, please?

> and then handle the free code both both sd_probe() and sd_disconnect().
> 
> 
> Thanks,

-- 
With regards,
Pavel Skripkin


