Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E5D25DAF5
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 16:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730371AbgIDOHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 10:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730536AbgIDOG7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 10:06:59 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD29C061244;
        Fri,  4 Sep 2020 07:06:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bh1so1189258plb.12;
        Fri, 04 Sep 2020 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PukjSGhlHQX0Z/o0j+rhOHIqKb7zdi9HfeAMWztSDNI=;
        b=HVciF0MxoWzoDMlsOpwCzyc6HoSQJ4IdsGvnRjj3Y0YdbT4YFxFyanNN2hHKR+BoGb
         dPDHOGvGKSVJkWCUTLuZTSOPjcEblqJ2RbVmYHneyKvhPxSTWNCcU73nre14k/Dc1TG4
         tOurTCojQhwc37X/a+4I55MM7OOFZAbVIF7zVZszUZmns3pzXKqVRVtb6YNYnqXwP1YS
         giYy6Zl2ECsKdt3TkKmaW/YLpsSnf+AnfbkZ7pDE8N7KyBIavtftQNAIlpWNLpjtGexY
         ibbA8Jgmvp9MA23ctDFOBJhxpFn9MvhcegrE+bvKxCJZsO2inrIluuV6uxkWnfTeB6sO
         B10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PukjSGhlHQX0Z/o0j+rhOHIqKb7zdi9HfeAMWztSDNI=;
        b=tQYG8c7MGvcMHEqNL+yJsgSThW40YtNtTB1CZKWNozi/S+UGS0HYFRFKPmZLySVX6V
         RIqwCXKboznxrAdTmu3/Lg1gcVYO5xXFk+DRGLqlJX3pcUKMFDowm3gKQQ1cEcIiouPp
         h2rGJ2VhwZrWy6MstOyt7hQZOCKXNJtsd8+XOX0BI5pqGxXO9ngBJTxOgyO/+KiFaPhy
         P4168P0kFv9RdcdRvbe6Hc3n9XXIkfNH85SVlGXDZ3dJGJtPznBJuOf/eZMMbWp+MNYK
         05tZgdZLwUxBse8kFOE02eY22Rw4vUl6d0nrLnc1ITUAk70uWQT02GVFZDebksGQr6xL
         7ywg==
X-Gm-Message-State: AOAM532HbEt7SdwpVvoLIMibnGYStiWeC6x+u5kRsmB7Nd7oLQ92B3Qr
        Y2mVcxocof+REMZsjfwS2t2sGDFiZGMm6mLNuJU=
X-Google-Smtp-Source: ABdhPJwgtrnUVZ5tV/HHgi8WrV/Cc+/+26iw5k1IXy0cgxw3NMHp2gAZwrF76seZVfMd8AZjn/YGIyLNHxZKtWompNM=
X-Received: by 2002:a17:902:56a:: with SMTP id 97mr9045008plf.130.1599228370951;
 Fri, 04 Sep 2020 07:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com> <20200902134421.GN1891694@smile.fi.intel.com>
 <1599225767.4733.64.camel@mhfsdcap03>
In-Reply-To: <1599225767.4733.64.camel@mhfsdcap03>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 4 Sep 2020 17:05:53 +0300
Message-ID: <CAHp75Ve8WNuCuRmFcXaZHLjHMGfsvM=69ii5g4H+NYud6N95eQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>, matrix.zhu@aliyun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 4, 2020 at 4:48 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> On Wed, 2020-09-02 at 16:44 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:

...

> > > +   struct i2c_client *client = to_i2c_client(dev);
> > > +   struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >
> > Same for the rest similar cases.
>
> We've discussed the issue in DW9768 V2.
>
> For V4L2 sub-device drivers, dev_get_drvdata() shouldn't be used
> directly.
>
> More details please check the Google Issue:
> https://partnerissuetracker.corp.google.com/issues/147957975

This is not a public link. Can you remind me what was the issue?

...

> > > +   if (!bus_cfg.nr_of_link_frequencies) {
> > > +           dev_err(dev, "no link frequencies defined\n");
> > > +           ret = -EINVAL;
> > > +           goto check_hwcfg_error;
> > > +   }
> >
> > If it's 0, the below will break on 'if (j == 0)' with slightly different but
> > informative enough message. What do you keep above check for?
>
> I still prefer to the original version.
> If 'bus_cfg.nr_of_link_frequencies' is 0, shouldn't we directly return
> error?

But that will happen anyway. I will leave this to Sakari and
maintainers to decide.

> > > +   for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > > +           for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > > +                   if (link_freq_menu_items[i] ==
> > > +                           bus_cfg.link_frequencies[j]) {
> > > +                           ov02a10->freq_index = i;
> > > +                           break;
> > > +                   }
> > > +           }
> > > +
> > > +           if (j == bus_cfg.nr_of_link_frequencies) {
> > > +                   dev_err(dev, "no link frequency %lld supported\n",
> > > +                           link_freq_menu_items[i]);
> > > +                   ret = -EINVAL;
> >
> > > +                   goto check_hwcfg_error;
> >
> > 'break;' won't work?
> >
> > > +           }
> > > +   }
> > > +
> > > +check_hwcfg_error:
> >
> > out_endpoint_free:
>
> It seems that OV8856 keeps the same pattern.

So, we can do better than that, right?

> > > +   v4l2_fwnode_endpoint_free(&bus_cfg);

...

> > > +   /* Optional indication of physical rotation of sensor */
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > > +   if (!ret && rotation == 180) {
> >
> > Can be simplified (but I'm fine with above):
> >
> >       unsigned int rotation = 0;
> >       ...
> >       fwnode_property_read_u32(..., &rotation);
> >       if (rotation == 180) {
> >               ...
> >       }
> >
>
> Sounds like the readability is improved using the latter style :-)

Yes and makes it clear that this is an optional one.
Also you may consider the following

      unsigned int rotation;
      ...
      /* Optional ... */
      rotation = 0;
      fwnode_property_read_u32(..., &rotation);
      if (rotation == 180) {
          ...
      }

> > > +           ov02a10->upside_down = true;
> > > +           ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > +   }

-- 
With Best Regards,
Andy Shevchenko
