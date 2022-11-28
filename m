Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C070963AB89
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbiK1OrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiK1Oqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:46:48 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E59424BEA
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:46:07 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id x16so5098086ilm.5
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu3AlxX7xiP1ZxkhGpBJWzH6KwfLmbx8l4QHA9JroSg=;
        b=rrWYrJyZkE2pdYbxfljiQg5+IEKZbzIQTllpY5PfSnTFeevo0mTZDCP5n1dhPxeoSp
         QsnsD0+RZtix46wAEVTxbsKWPj2kKQo+ORGstMizAbMrR8KAPtLBpnLgkt3mlzCwI/S4
         Yyj7UNa7Vxi+GHvgYz9KK9dlD9eDvGY2ZiIEyaM10HpEMYc4gClR2R0GuZPW833/HXoW
         fTR8QKbqWbodOYTgwO5HzWjPSmT6/zjZQH+pYhT8o+747YjPmJljFqIFXYbLRwXeNAbZ
         wmgXLU6dkAjdlwKbjF2hyRsnfyaveny28XF3aKLWVIOfxq38S6E8xCz5wdGHNCQXIW4J
         /Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu3AlxX7xiP1ZxkhGpBJWzH6KwfLmbx8l4QHA9JroSg=;
        b=4bnItZKVN+k6HncqLEYTGR0rbY7u4zYdNVQlkrRSvpodHOUbJNVJR2ENtElMcmHKAG
         FShVx/bx2Rj0mdwa+jl7WA+HlUW68Fs3Hx4gqSJB4ysOtbUwJqKdl3LZjlY5KL0wgDxv
         WzasSWgK5XR+fuDjeWc83Q+WstceZ4aODW/V4eZ09ZEEIHOwo68+WWcJP75DWriAUIG9
         LeHTXEsqP+kizPOZZM4PhG39Bl4CzaFOoYk6ZNvT5COyxKCEzR3Vpk7bvdtPIs370ksa
         KoQhF+haHHOfAyW3lgWkeKX1jPz5Pev5B/9kY1DMzvm9NKHygI0lFuQ2eTegeDJMJcTd
         KE/g==
X-Gm-Message-State: ANoB5pmu7goMtbz4TY7H2b2AjkAw3pHZRJUi4lWsHbVQLIkIt8I1cZJv
        fB2MXRXPdiZJmObie2yShyXtkDOv2NjpCBYEU2juZg==
X-Google-Smtp-Source: AA0mqf6k0j5aKNWsLdcfK+c8nQIAQroYGM0pV6aAOfrdI+oKV8n2EKppasPmqOSHsArBjS64Wy6MV0g+2S9q1IfZ8hA=
X-Received: by 2002:a92:c844:0:b0:302:f785:c9a1 with SMTP id
 b4-20020a92c844000000b00302f785c9a1mr7912296ilq.165.1669646766794; Mon, 28
 Nov 2022 06:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
 <538d4c30-aa78-ed05-4c46-84018fd9afdd@xs4all.nl> <Y4S+kroyBqhohW22@valkosipuli.retiisi.eu>
In-Reply-To: <Y4S+kroyBqhohW22@valkosipuli.retiisi.eu>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 28 Nov 2022 14:45:49 +0000
Message-ID: <CAPY8ntCesbv_GPAbjHjn1ewdgyg1t-oXRfAQqU1WD5KrD6rO9w@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] ov9282: Add ov9281 support
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans & Sakari

On Mon, 28 Nov 2022 at 13:58, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Hans,
>
> On Mon, Nov 28, 2022 at 02:52:28PM +0100, Hans Verkuil wrote:
> > Hi Alexander,
> >
> > On 11/24/22 11:29, Alexander Stein wrote:
> > > Hello all,
> > >
> > > This is v5 of the ov9281 support series. Thanks for the feedback I received
> > > over the time.
> > >
> > > Changes in v5:
> > > * Removed unrelated patches from the series
> > > * Squashed previous patch 3 & 6 (now patch 2)
> > > * Removed error handling for device_get_match_data() call
> > > * Added Kieran's r-b to patch 2
> > >
> > > Best regards,
> > > Alexander
> > >
> > > Alexander Stein (2):
> > >   media: dt-bindings: media: Add compatible for ov9281
> > >   media: i2c: ov9282: Add ov9281 compatible
> > >
> > >  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 5 ++++-
> > >  drivers/media/i2c/ov9282.c                                   | 5 ++++-
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> >
> > With the latest staging tree I am now getting these smatch and sparse warnings:
> >
> > sparse:
> >
> > drivers/media/i2c/ov9282.c:267:24: warning: symbol 'common_regs_list' was not declared. Should it be static?
> > drivers/media/i2c/ov9282.c:145: warning: Function parameter or member 'crop' not described in 'ov9282_mode'
> > drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'supplies' not described in 'ov9282'
> > drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'pixel_rate' not described in 'ov9282'
> > drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'noncontinuous_clock' not described in 'ov9282'
> >
> > smatch also has this:
> >
> > drivers/media/i2c/ov9282.c:1262 ov9282_power_on() warn: 'ov9282->inclk' from clk_prepare_enable() not released on lines: 1252.
> >
> > Can you take a look and post a patch on top fixing this?
>
> The two patches aren't the culprit. I've seen a report on this, too. Let's
> continue on the other thread once found.

These look to come from my series [1]. I'll send patches in a moment.

  Dave

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20221028160902.2696973-2-dave.stevenson@raspberrypi.com/

> --
> Kind regards,
>
> Sakari Ailus
