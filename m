Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E311B4708DE
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 19:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245407AbhLJSgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 13:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhLJSgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 13:36:43 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E129AC061746
        for <linux-media@vger.kernel.org>; Fri, 10 Dec 2021 10:33:07 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id t5so32315877edd.0
        for <linux-media@vger.kernel.org>; Fri, 10 Dec 2021 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+5wfzvY98r911pdlNHS5MRZhjqkHPF9SqDy5RQ+nGs=;
        b=0FrAeyHRpiQDLNRCH38LGYEW5OlercFk3DROOyI+5MF4Aiw8BvLF+GCTJpv3NKxJy8
         w6XzrFa0A4VvMMlEU5z/Z298tMnaEJKBq6VeGIjX+thf/iO5KbDMg1BG2s0ux0pQV0XL
         L0w0pukiLEDpC5eKc8vPyhFf4+3+6sceGamqAVhs5Kn+fhrwpRXew7EnfGZfjV1KOpOo
         GsbDXtupxwNXVLa7onRj0aOr7ByIMeeLVr8b9i5Ih2ez3BMkuu+Noz8qQcPqLFM956T3
         mU1cLd9j/5Aeb5XROTdKgsLG6YeZUnyInnb8MjJCX3TEKg+E78spgZbNmQA8jGbD++MV
         Xm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+5wfzvY98r911pdlNHS5MRZhjqkHPF9SqDy5RQ+nGs=;
        b=TqNK/q7Vd8IGws1W1A/ByJJ2QEBO2P2pFNmpaMFObFUqLNTbT1KAZfaAv5nllBLkz1
         bbAQ2c1GjPvxKsJvPTeVlKL4byFKHb1RKYcicdP5T7QGESpvVMRpfBjUCHPdr4zlahL8
         2fTFVo7YYflU9H4MaFE7WUiHzy6gd9q1rP5KAo4BotNMV9LvKAuWzDNRuiBaPgqgrfdb
         Wk+2CdvObqSotj1A3CZv5umHMNR7ME4+pY63s9Ebv+n9KxhiTmn3F6HgXpqcaewyBXBX
         uL20a3LEdHUdKgu40zsKkYkDB7HTHct3tQPYhORQL4ANMsLvU1MjY2CX0dzWcg5lV94B
         wI/w==
X-Gm-Message-State: AOAM531OpUFxfLChFMS/XUscW/uQM+6TFcgbndv0GuziNnn/Nd7F148/
        BmCw2rwr+YC/X+svHIOKBops9GgyQi15FoYt7tZcqQ==
X-Google-Smtp-Source: ABdhPJw2lS/O2yAfLVTw6WVq78ELyMdt5/AEs5anuvPRPowAgkoa3NmZtsHE2c0DEj0r6fuPtxiB7KX0gypvQotrn6Q=
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr40506518edq.370.1639161186439;
 Fri, 10 Dec 2021 10:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20211208225030.2018923-1-aford173@gmail.com> <20211208225030.2018923-5-aford173@gmail.com>
 <YbHZvysazqYeZ8h3@eze-laptop> <CAHCN7xKrHSSsqS9DNL1tMH1Ctpz16FsSgcVbSHXzUWF98v738Q@mail.gmail.com>
 <YbNz94G3vwbHCMdB@robh.at.kernel.org> <c88b7a90f7a3bf94fc0cbb9a6f967ce769d5c03b.camel@pengutronix.de>
 <CAHCN7xLQrYy6H3U_yjCevu7F3AtEJJNbA7gdig=dn08hQfXCUA@mail.gmail.com>
In-Reply-To: <CAHCN7xLQrYy6H3U_yjCevu7F3AtEJJNbA7gdig=dn08hQfXCUA@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 10 Dec 2021 15:32:54 -0300
Message-ID: <CAAEAJfAuH_cupFkEN=5M3fy-JJ401EB3f2-6yvXFt9zJ4rYW4A@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: media: nxp,imx8mq-vpu: Support split
 G1 and G2 nodes with vpu-blk-ctrl
To:     Adam Ford <aford173@gmail.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Chris Healy <cphealy@gmail.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> >
> > I'm in favor of dropping the old binding from the schema. New DTs
> > should clearly use the new binding and old DTs shouldn't change
> > anymore, so validation is less useful there.
>
> I wonder if it makes sense to have a more standardized hantro schema
> for all the users instead of one dedicated to each platform using a
> hantro driver.  The unified schema could have all the various
> compatible flags so the driver still knows which features are
> enabled/disabled and it's very clear who all the users are for it. I
> would think it could cover both the encoder and decoder variants as
> well.  We do something similar for 8250 serial ports.
>
> If so, can someone from the media group suggest the best one to
> follow?  Ezequiel suggested I look at the sama5d4-vdec to help reduce
> some clutter in the driver.  If that binding is good enough, should I
> just add the compatible flags to that and potentially rename it.
>

A unified schema might sound elegant and compelling, but I suspect
it can bite us down the road, due to differences in the platform integration.

Seems we are all on-board going forward with a patch similar to this one,
but also dropping the deprecated binding from the schema (while of course
still supporting old DTBs on new kernels).

Rob's suggestion about having a warning in the platform if the binding has
not been updated, sounds like very useful too.

Keep in mind v5.16-rc5 is near, which means we still have a few weeks to
discuss this patch, until the next linux-media merge season.

Thanks,
Ezequiel
