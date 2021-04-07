Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECBD3570EF
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 17:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353837AbhDGPuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 11:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353818AbhDGPsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 11:48:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E93C061760;
        Wed,  7 Apr 2021 08:48:32 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso1415388wmq.1;
        Wed, 07 Apr 2021 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VXyrtGnwTjNkgIA1jrziNG4eeLUP6i3fUCHQ1vhVTNk=;
        b=AT3fDu5INkxhj3Ycskj+25gD7VvEaPZFZOqS+dhmjSsFiVZ01PPcXhLNUTnVfU6F9T
         E0XhY4u1NBJm5jTKMs7AcK+gzPIAXkVqEgk+T49IfKZLkDo5mqKZKRVFf11vkcvr5LUA
         jXeX/IYQl6oBAUQLk3c2+KmMoN8w+LME7R5+tp200su1i7v4ClMarRdCiNqfPZnLAqX1
         k7FMPChv+9NMP1ym25RwMfvTL/6KVRO1Kh1ziGhSI4x7ijLJK86xHGHdwQJ+fVlh/7Be
         Z1oGWwNYGPu9/pqRHVoHZRW8mBI6HXAVhCeK00BOayKoSU9s9USmOKT4eQRZ/kGHWoJ4
         5u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VXyrtGnwTjNkgIA1jrziNG4eeLUP6i3fUCHQ1vhVTNk=;
        b=ugFB5YX3YCfTD2hL3v2W5Ah5e7+It42wVwcazLQox/NVinMYV3JFit7TRdpgh6W5jX
         94RmY51Sus3XleUfkAmNiPfHl0Ap3otzqLSsYaXYillw/Y8YIkE3+/Rj9YX5jTRBiKBw
         GlGUlWeiqfTmAkjANeR2aUqLoqbk6mYzfmXE5j30tNVC6JAyOgwRK3DZKQTA6j09jA5f
         RcBpt0pYUJar7KSNZUop/LNkJgeBLZgftYJTZLa1m3DysPFbfovrrgHANa2vBWfzL+pG
         SgJpZCelxGFvIOhG4+XSU7XGxM7ep7++5hPEM/QsBz50nZJueqt8f44ZHUn735HjbYLG
         1GvQ==
X-Gm-Message-State: AOAM531/b7+19UA1PpCp2n0vD7kzfbYW1o9xU/Zwe4jQ+e50dF45kxwB
        wFgaj2WbLEsRSYQJP8qWIs0=
X-Google-Smtp-Source: ABdhPJzD7dxKEjfVHj/Mt5EH5n5S/dlaxsmEkejN73MZv+TvkDOrEI5rgccyVlOqrKVUnws2nEHr5A==
X-Received: by 2002:a05:600c:2946:: with SMTP id n6mr3655449wmd.52.1617810511641;
        Wed, 07 Apr 2021 08:48:31 -0700 (PDT)
Received: from 192.168.10.5 ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id v185sm9224838wmb.25.2021.04.07.08.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:48:31 -0700 (PDT)
Message-ID: <5daaeac37cfa5c07a1880ae49b712566a561ba1a.camel@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: media/meson: remove redundant
 dev_err call
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     musamaanjum@gmail.com, linqiheng@huawei.com,
        kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-media@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/Amlogic Meson SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 07 Apr 2021 20:48:21 +0500
In-Reply-To: <93218bc8-2cbb-bacc-f985-876a842261c4@xs4all.nl>
References: <20210407101047.GA1491258@LEGION>
         <93218bc8-2cbb-bacc-f985-876a842261c4@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-04-07 at 16:05 +0200, Hans Verkuil wrote:
> Hi Muhammad,
> 
> On 07/04/2021 12:10, Muhammad Usama Anjum wrote:
> > devm_ioremap_resource() prints error message in itself. Remove the
> > dev_err call to avoid redundant error message.
> 
> Please split this up into two separate patches! They are independent
> changes and these two drivers are maintained by different people as well.
> 
> The patch itself looks OK, but it really has to be two separate patches.
> 
Okay. I'll send two separate patches. Thank you.

Regards,
Usama
> Regards,
> 
> 	Hans
> 
> > Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> > ---
> >  drivers/staging/axis-fifo/axis-fifo.c   | 1 -
> >  drivers/staging/media/meson/vdec/vdec.c | 8 ++------
> >  2 files changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> > index 2bb1c2e9cb57..ed9281089738 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
> >  	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
> >  	if (IS_ERR(fifo->base_addr)) {
> >  		rc = PTR_ERR(fifo->base_addr);
> > -		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
> >  		goto err_initial;
> >  	}
> >  
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> > index 5d4db7a5b4b5..e51d69c4729d 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
> >  
> >  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
> >  	core->dos_base = devm_ioremap_resource(dev, r);
> > -	if (IS_ERR(core->dos_base)) {
> > -		dev_err(dev, "Couldn't remap DOS memory\n");
> > +	if (IS_ERR(core->dos_base))
> >  		return PTR_ERR(core->dos_base);
> > -	}
> >  
> >  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
> >  	core->esparser_base = devm_ioremap_resource(dev, r);
> > -	if (IS_ERR(core->esparser_base)) {
> > -		dev_err(dev, "Couldn't remap ESPARSER memory\n");
> > +	if (IS_ERR(core->esparser_base))
> >  		return PTR_ERR(core->esparser_base);
> > -	}
> >  
> >  	core->regmap_ao =
> >  		syscon_regmap_lookup_by_phandle(dev->of_node,
> > 

