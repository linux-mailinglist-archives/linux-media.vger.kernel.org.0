Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F2B2E90F8
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 08:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbhADH3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 02:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbhADH3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 02:29:21 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF14C06179F
        for <linux-media@vger.kernel.org>; Sun,  3 Jan 2021 23:28:00 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j13so10371941pjz.3
        for <linux-media@vger.kernel.org>; Sun, 03 Jan 2021 23:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FV11oIRk+TS/pD/8cNBoW/mAuSHG2JQfCawYOikAwtE=;
        b=ztavayUlJb9IYhviZXLVPDXytXrfD2aw4hqUXe6JBxG3R1ObnfA5+HWwIajvVgpWj9
         1on2MgzPWWQMeg/0X/G2jJ1qzOz+W3rBCLo5GgkVhRObxgG4TCdpqWJI0+y++DkIYNJE
         h8NG4lDrCZxE3VBlzQ83b0I/rV6xqWOPBYYG40rNoNzEbUZeBeGqY21yf6eE86nGddgq
         pIJl9l5S3NGgr5PCZlM83o3tQ+0n2BlWb3lcdEhyU2eaLqyyn7vNNK3THK4N7YZz/lyE
         ngMTXHgpzuWDcqsjiW3miMdFq4mnvkjU1tUf/2n79EJ0sHez/qLW/VyfVOGOJ7sBUHoC
         IO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FV11oIRk+TS/pD/8cNBoW/mAuSHG2JQfCawYOikAwtE=;
        b=MU0vNpPATEX+EJV+r4kGChv9NhDC8dI+LbNKKJBViuy31ITtlz+vRynlT51hY26+Gx
         EoswF2et3axl8Hdx+r0kuQZr9AM9GTDV9JBYzpfuielUcq9Jfii5TP9f8DcDovOYjmCP
         sW/h0iowoCpkOT5Wa6p/VPentxriy2pX0X2zeGFI4y51Ubw1ljfogKq8/3322txPG48i
         9jhe0//a/gm6TFkq4wOB+bsNViCLhvmxuVF8O/agVSzBkvHdCBDEG4d1Y1qBSOgxK6hl
         zWy8bVWzqSw1gDxCW3u13bfFEjxRTh/2ACsJ2VDTfStXRPwv24Rr2RBQS4CdynsYK92p
         +i9w==
X-Gm-Message-State: AOAM531bBrURB+byzG4HjJsytZHU61Qi44oNqwIE+3cZkZc5EyjGAOqp
        EAVX7KOann6kAi/lWvRiGilgFw==
X-Google-Smtp-Source: ABdhPJz+3zSxoQuv088o2E7z4G5iPXrMvcrUmHufPvXe/YbO6D9/ZpI0OF0DVfbjBZBJFqdSEZ/lbQ==
X-Received: by 2002:a17:902:e9d2:b029:db:d4f6:b581 with SMTP id 18-20020a170902e9d2b02900dbd4f6b581mr47937489plk.34.1609745279376;
        Sun, 03 Jan 2021 23:27:59 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id a31sm59943909pgb.93.2021.01.03.23.27.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jan 2021 23:27:58 -0800 (PST)
Date:   Mon, 4 Jan 2021 12:57:56 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 07/31] serial: qcom_geni_serial: convert to use
 devm_pm_opp_* API
Message-ID: <20210104072756.xdvsryok3sxdiytg@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-8-tiny.windzz@gmail.com>
 <20210104071910.2a2otwxyniu7c22z@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104071910.2a2otwxyniu7c22z@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dropped lots of people from cc list

On 04-01-21, 12:49, Viresh Kumar wrote:
> On 01-01-21, 16:54, Yangtao Li wrote:
> > Use devm_pm_opp_* API to simplify code, and we don't need
> > to make opp_table glabal.
> > 
> > Let's remove opp_table from geni_se later.
> > 
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 23 +++++++++--------------
> >  1 file changed, 9 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 5aada7ebae35..36a92df8ec11 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1352,6 +1352,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> >  	int irq;
> >  	bool console = false;
> >  	struct uart_driver *drv;
> > +	struct opp_table *opp_table;
> >  
> >  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
> >  		console = true;
> > @@ -1433,13 +1434,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> >  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
> >  		port->cts_rts_swap = true;
> >  
> > -	port->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
> > -	if (IS_ERR(port->se.opp_table))
> > -		return PTR_ERR(port->se.opp_table);
> > +	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "se");
> > +	if (IS_ERR(opp_table))
> > +		return PTR_ERR(opp_table);
> >  	/* OPP table is optional */
> > -	ret = dev_pm_opp_of_add_table(&pdev->dev);
> > +	ret = devm_pm_opp_of_add_table(&pdev->dev);
> >  	if (ret) {
> > -		dev_pm_opp_put_clkname(port->se.opp_table);
> > +		devm_pm_opp_put_clkname(&pdev->dev, opp_table);
> 
> We shouldn't be doing this here, i.e. put_clkname. Even when the OPP
> table isn't present, this driver calls dev_pm_opp_set_rate() which
> behaves like clk_set_rate() in this case and so the clk name is still
> required by the OPP core.

The same problem is there with multiple patches, fix them all please.

-- 
viresh
