Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C971EF886
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 15:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgFENCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 09:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgFENCQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 09:02:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FC2C08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 06:02:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so9704637wru.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y3GLNe1uiEEyqomGYmE3fIeULXusz66pcaCDflcIBb4=;
        b=i5o+dER1J+4I9KjApGJUl5j8vc3AgLlhglvEfXsfp9xNaKskTKEJLqxNDa11iCBswD
         lHjCEBND3KFJe13zffeJZSFvRRMjnmD1xDuFAStUns7l00Mhdzdv/n2dDXwdUGNLjoMR
         Q8UajpX7oLNc+ArM8+h2A4JIYy6XJYGovy2B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y3GLNe1uiEEyqomGYmE3fIeULXusz66pcaCDflcIBb4=;
        b=PfB9Ub7L3DF8vtgha6A9AxXXopzNDcG0Xz9lyDFUSiZGmxiWuaZ+e1/wSsxhlJoplG
         ee1Mv6WNC9Ns4AeOOyqFNsnEBUmbb0Zh+hPqaMGFYTfcl1BKYYXwOZID2BitfEThZG3s
         /7upu0T8ImAL33IJA3Lz97JDglkC1diYJjgYUWqO8PismicpBMMuymNOBEPJTZ4guVUU
         GvmNYnahtQ1rGiq/+EkNWMj+ElV6TvjT8ubsFxKtY4y+daYDh+7z1HaNIz5X4cbOGc26
         iwmKHggGmB1QIFDJvdRXtB6ChXsrPthbR8MfJ6Rl2uZkSqCDR+WAfa3WWC1eI7HVqtGQ
         JrBQ==
X-Gm-Message-State: AOAM533VLxtiMyROHgPjhQk/yrjyY70UruOyfnoJN9ARfN+x3lCqRemG
        3kcHgVv/THda/cdCpXkr3vZ/Jg==
X-Google-Smtp-Source: ABdhPJzbEgAdOn5Dla25twrnFWibCM+By/CY94AZjk2Mnb7Wp+Gcych9tY+BqMoYs3yiFXxox2M6aQ==
X-Received: by 2002:a05:6000:12c8:: with SMTP id l8mr9792905wrx.148.1591362134700;
        Fri, 05 Jun 2020 06:02:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d5sm12890866wrb.14.2020.06.05.06.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 06:02:14 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:02:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605130212.GA6303@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605121459.GS16711@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605121459.GS16711@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 05, 2020 at 03:14:59PM +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> Thank you for the update.
> 
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/media/i2c/Kconfig  |  13 ++
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 581 insertions(+)
> >  create mode 100644 drivers/media/i2c/dw9768.c
[snip]
> > +static int dw9768_runtime_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > +
> > +	dw9768_release(dw9768);
> > +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > +			       dw9768->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dw9768_runtime_resume(struct device *dev)
> 
> __maybe_unused for this and the suspend callback.
>

These are always used. If runtime PM is disabled, they are called
explicitly in probe and remove.

Best regards,
Tomasz

