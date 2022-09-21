Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E6D5BF2F1
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 03:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbiIUBcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 21:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiIUBcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 21:32:17 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8930C65656
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 18:32:16 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id p18so4149622plr.8
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date;
        bh=44W1iWoe/OCt3N1YUGhGLpWVuBp9xFH3tOMlpEc38Fs=;
        b=aI3jaQBXmj1V42iRAkISQxqC0rLlpScMW8O7m3XLv2NXAw17rCHCE2O09zJ7rIdEsf
         7/AOj8AgKPGBCYMvCW7zuAM2H8xpUhKLOkCMLoTFPp5aYiMuUAAEzjfTXNpov+pyH4v0
         v6B1oADuSWvMBvVHqEcC5TSlsS2sWAZkBHSNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
        bh=44W1iWoe/OCt3N1YUGhGLpWVuBp9xFH3tOMlpEc38Fs=;
        b=NgH2QNDdrnmXkMbcsI42B07lSm9i52yvrPf7gYNviPHak6h81oKPSUk8bFaUDFpKM0
         n7Tjjqk6U3Tf+i1MMEdWOY9Pn0Q0wR09sExtfIfwQQ8KLpESa99WuStc45nx8IPFnWSH
         UjKnOqm6oj040BgNSWw+KmJe/wkUHyEVe1MuUL28cP4MtVjNaL4pEp7rE8g46kIP6z4y
         g5u0fE07eUmf5jWaRD1kmudvul518f729Ku9VN7A5Z06BfCoVziDELwXOsm+uyfrrfR2
         nDlZ+fG2FXu1Vgy1Cdhe1Tj8dvNjeF1Hh6yUfQtTh0Lox96kvromLUjdPEbp46h3mh6X
         tYKw==
X-Gm-Message-State: ACrzQf1/ud0QZ3x7zuIQj09QOY08k7PS+xw1wPloO4cALDqTlX7w4lid
        LKchtZ6xtiC/HYUxumw3JPdQRw==
X-Google-Smtp-Source: AMsMyM6W8Iwua8n8vvSxHt1iyG1sRK19IEa4cnmXps3dmtdRz6Mtf2Z7l0dCfQ5FtKeo0HpZfKsiOA==
X-Received: by 2002:a17:90b:1d08:b0:200:823f:9745 with SMTP id on8-20020a17090b1d0800b00200823f9745mr6757655pjb.84.1663723936033;
        Tue, 20 Sep 2022 18:32:16 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cc93:90d7:674f:156a])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902d18200b001728ac8af94sm535623plb.248.2022.09.20.18.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 18:32:15 -0700 (PDT)
From:   Hidenori Kobayashi <hidenorik@chromium.org>
X-Google-Original-From: Hidenori Kobayashi <hidenorik@google.com>
Date:   Wed, 21 Sep 2022 10:32:12 +0900
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hidenori Kobayashi <hidenorik@chromium.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov8856: Add runtime PM callbacks
Message-ID: <20220921013212.m7sqb4v7hk5rddfa@google.com>
References: <20220920020002.710533-1-hidenorik@chromium.org>
 <Yyl7spRDgJ+R39Pj@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyl7spRDgJ+R39Pj@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your review!

On Tue, Sep 20, 2022 at 11:37:06AM +0300, Sakari Ailus wrote:
> Hi Hidenori,
> 
> On Tue, Sep 20, 2022 at 11:00:01AM +0900, Hidenori Kobayashi wrote:
> > There were no runtime PM callbacks registered, leaving regulators being
> > enabled while the device is suspended on DT systems. Calling existing
> > power controlling functions from callbacks properly turn them off/on.
> > 
> > Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
> > ---
> >  drivers/media/i2c/ov8856.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> > index a9728afc81d4..3f57bc30b78b 100644
> > --- a/drivers/media/i2c/ov8856.c
> > +++ b/drivers/media/i2c/ov8856.c
> > @@ -2200,6 +2200,26 @@ static int __maybe_unused ov8856_resume(struct device *dev)
> >  	return 0;
> >  }
> >  
> > +static int __maybe_unused ov8856_runtime_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov8856 *ov8856 = to_ov8856(sd);
> > +
> > +	__ov8856_power_off(ov8856);
> 
> Could you refactor this a bit, changing the __ov8856_power_off() argument
> to struct dev *?

Sure. I'll make V2 with this refactoring. I'm guessing that we want the
same for __ov8856_power_on(). Please let me know if otherwise.

> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused ov8856_runtime_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov8856 *ov8856 = to_ov8856(sd);
> > +
> > +	return __ov8856_power_on(ov8856);
> > +}
> > +
> >  static int ov8856_set_format(struct v4l2_subdev *sd,
> >  			     struct v4l2_subdev_state *sd_state,
> >  			     struct v4l2_subdev_format *fmt)
> > @@ -2540,6 +2560,7 @@ static int ov8856_probe(struct i2c_client *client)
> >  
> >  static const struct dev_pm_ops ov8856_pm_ops = {
> >  	SET_SYSTEM_SLEEP_PM_OPS(ov8856_suspend, ov8856_resume)
> > +	SET_RUNTIME_PM_OPS(ov8856_runtime_suspend, ov8856_runtime_resume, NULL)
> >  };
> >  
> >  #ifdef CONFIG_ACPI

Best regards,
Hidenori
