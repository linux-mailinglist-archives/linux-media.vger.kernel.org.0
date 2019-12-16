Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF02A11FD6B
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 05:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfLPEEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 23:04:46 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36076 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfLPEEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 23:04:46 -0500
Received: by mail-pg1-f196.google.com with SMTP id k3so2885165pgc.3
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 20:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KahZqBcsSeKct0EiqWh21SP8RWNU6LEX1G6vgvPIaWU=;
        b=kGwLd5atrUc73L3QDEe7IMwNAXlqPT7cFEDLFPFPUXSsHutHgEC2AwTFxI/8VI+KQn
         iPEHYAOrXYVuYu6BVCM+RofvQdR1HSJ65F7IOjR0VY2VBWfdQC/xxujDPNoz+pcVV5tH
         iGF/BFq+NZosrFooUh0y88Mv2AI4mN0k4s/masJGoL+CTBYIBkF7b5M28IJQFurpuagy
         04HZG76QJ0Lpt6u/axhtJI7XnmlHNsyhq7U2WQ+dc7Lo1VLQptTYkAj9NkLkeIcyJrfs
         IVhsNjaw+gS3tdlGE7mmg1hK5ftiznqpMdPFSttg7rACDfQTOGvPqlEmBgsy8lggHuE5
         dALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KahZqBcsSeKct0EiqWh21SP8RWNU6LEX1G6vgvPIaWU=;
        b=VyGMrkZTG8emntRN3cTvxNPHyHRCNvvrI2UE9DFEylkm62jkzKWL4vn0iraD2jmOIB
         PySKLZoH50nPiWD5Zva5hn/KApeXAQGQ8chmQOnUaow2WCXzFuT5C6KzSJJGvgZCVUco
         0QBcVUbPz+St6DkiBH0MooHU1rR+G0BWZeK7nZNc+0923vC0/8XsK+oyD+FWZ6EW+fuw
         kznzKOqqLiW/T6kp/wWEw6aIL7agy2t2Z0de8NcaPxQddnQqEU7rLXHGurZYBcenRORA
         vkLNAzSxP5teZH7EN+FKNQUyaeiQugGGSJBboGprtR+ljCZ4iie585uamoRPgZwomHqi
         0Zmw==
X-Gm-Message-State: APjAAAWFri47KBvQC172vF3Uc+mI2q4j7THLV0rZloXCfbfMdNiQu7KM
        Q8+fGH7+COtuhn0GDL8+L108
X-Google-Smtp-Source: APXvYqyVi0+Wbe50rt3k5sbyx+Sr5W0wpzKMSIEk9kmraZfdbZ3nxQhfzWFDFBYzxcKOueAOPfg6eg==
X-Received: by 2002:a63:9d8f:: with SMTP id i137mr15549868pgd.33.1576469085659;
        Sun, 15 Dec 2019 20:04:45 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:797:cc22:ad66:df45:6a09:a260])
        by smtp.gmail.com with ESMTPSA id g191sm19637765pfb.19.2019.12.15.20.04.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 20:04:44 -0800 (PST)
Date:   Mon, 16 Dec 2019 09:34:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     karthik poduval <karthik.poduval@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 4/5] media: i2c: imx290: Add support to enumerate all
 frame sizes
Message-ID: <20191216040434.GA14778@Mani-XPS-13-9360>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-5-manivannan.sadhasivam@linaro.org>
 <20191203085604.GC5282@valkosipuli.retiisi.org.uk>
 <20191215174834.GD11427@Mani-XPS-13-9360>
 <CAFP0Ok8Vqze8ZRyT1WvMXZeBLcx7oKcTO1Kad4kSFLbpHkok-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFP0Ok8Vqze8ZRyT1WvMXZeBLcx7oKcTO1Kad4kSFLbpHkok-A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 15, 2019 at 03:52:37PM -0800, karthik poduval wrote:
> What if someone adds RAW8 or RAW14 formats in future the enum frame sizes
> code doesn't have to be patched again if written using a loop on formats
> array.
> 

Please don't top post :)

IMX290 only supports RAW10 and RAW12 formats. And I don't think this driver
can handle any other CMOS sensors from Sony, so looping over imx290_formats
seems unnecessary to me.

Thanks,
Mani

> On Sun, Dec 15, 2019, 9:49 AM Manivannan Sadhasivam <
> manivannan.sadhasivam@linaro.org> wrote:
> 
> > Hi Sakari,
> >
> > On Tue, Dec 03, 2019 at 10:56:04AM +0200, Sakari Ailus wrote:
> > > On Sat, Nov 30, 2019 at 12:35:40AM +0530, Manivannan Sadhasivam wrote:
> > > > Add support to enumerate all frame sizes supported by IMX290. This is
> > > > required for using with userspace tools such as libcamera.
> > > >
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org
> > >
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 20 ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index d5bb3a59ac46..f26c4a0ee0a0 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -468,6 +468,25 @@ static int imx290_enum_mbus_code(struct
> > v4l2_subdev *sd,
> > > >     return 0;
> > > >  }
> > > >
> > > > +static int imx290_enum_frame_size(struct v4l2_subdev *subdev,
> > > > +                             struct v4l2_subdev_pad_config *cfg,
> > > > +                             struct v4l2_subdev_frame_size_enum *fse)
> > > > +{
> > > > +   if ((fse->code != imx290_formats[0].code) &&
> > > > +       (fse->code != imx290_formats[1].code))
> > >
> > > Please use a loop over imx290_formats instead.
> > >
> >
> > May I know why? What benefit does it provide over current method?
> >
> > Thanks,
> > Mani
> >
> > > > +           return -EINVAL;
> > > > +
> > > > +   if (fse->index >= ARRAY_SIZE(imx290_modes))
> > > > +           return -EINVAL;
> > > > +
> > > > +   fse->min_width = imx290_modes[fse->index].width;
> > > > +   fse->max_width = imx290_modes[fse->index].width;
> > > > +   fse->min_height = imx290_modes[fse->index].height;
> > > > +   fse->max_height = imx290_modes[fse->index].height;
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > >  static int imx290_get_fmt(struct v4l2_subdev *sd,
> > > >                       struct v4l2_subdev_pad_config *cfg,
> > > >                       struct v4l2_subdev_format *fmt)
> > > > @@ -820,6 +839,7 @@ static const struct v4l2_subdev_video_ops
> > imx290_video_ops = {
> > > >  static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
> > > >     .init_cfg = imx290_entity_init_cfg,
> > > >     .enum_mbus_code = imx290_enum_mbus_code,
> > > > +   .enum_frame_size = imx290_enum_frame_size,
> > > >     .get_fmt = imx290_get_fmt,
> > > >     .set_fmt = imx290_set_fmt,
> > > >  };
> > >
> > > --
> > > Regards,
> > >
> > > Sakari Ailus
> >
