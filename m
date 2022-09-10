Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FEB5B43FB
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 06:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiIJEXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Sep 2022 00:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIJEXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Sep 2022 00:23:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8B189CDF
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 21:23:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C41F96108A
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 04:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7D3C43143
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 04:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662783808;
        bh=AqYkfWJD68eQp6TUhwC20h2tjVVHT71IfBzCmZqa7VM=;
        h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
        b=jLjlsq6BXTQlmbF4TQ56qwHYnaIeLljskm2i49MIwqj99N19lrMi2QlSZo8qjSNA/
         5l6zG7DlgSOV1Jh0nH8pkfbaW7JhZJu4UUrmi6sYWYCpgIEja1DkAMFHGxVp0F+xJi
         b9lfEKm7WyxpGAAmojfrvYbmPTwkkyvWthsT5XTey/41UaLWaLOHDxyZWwTBREvLsf
         XwulsiFocy18NnBU5firAtOCJdzqcV7yvWYVcLOWZeHeNpxmd42h8536Zu5O944Hxe
         oqxX7Kigs0TjyHSih6/v1e5+JMmRmMTVhV4jJQdWirhb4PMWFAQGRW/w9vl6+lpmw+
         1wTfOzuFwm/pQ==
Received: by mail-wm1-f44.google.com with SMTP id d5so3112195wms.5
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 21:23:28 -0700 (PDT)
X-Gm-Message-State: ACgBeo36KT/vSL6zeBiIwrL4HfYdxUX5Su2ss4lo3cYwr4diXjoaibZf
        cK69cjm7c9r+LWu9njBKNBe0fGCzI88/uwyPb4Y=
X-Google-Smtp-Source: AA6agR6GXVyQIT5BpjAj7HTPXkSMuq1HPaDOA2sWEI21hTuv3bR2KrLuwx1TbEmNDsCTtf4AuT4mPDXv+R+uVmX18Yc=
X-Received: by 2002:a7b:c8c1:0:b0:3a5:bb57:e7a9 with SMTP id
 f1-20020a7bc8c1000000b003a5bb57e7a9mr7323170wml.18.1662783806326; Fri, 09 Sep
 2022 21:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com> <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
In-Reply-To: <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
Reply-To: wens@kernel.org
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Sat, 10 Sep 2022 12:23:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zCVs8d1AqLYZZF+pT11RsqY2haDaEc3cnh58WJX+Zwg@mail.gmail.com>
Message-ID: <CAGb2v64zCVs8d1AqLYZZF+pT11RsqY2haDaEc3cnh58WJX+Zwg@mail.gmail.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 5, 2022 at 10:46 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > 16:45-18:00 Anything else?
> >
> > I think it'd be great to have a GPG key signing party at the end of the
> > meeting.
>
> It's a good idea. Could everybody please send their GPG key fingerprint
> in an e-mail reply to prepare for that ? It can easily be retrieved with
> 'gpg -K' (make sure to pick the right key if you have multiple of them).
> I'll start:
>
> sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
>       94231B980100EC619AC10E10F045C2B96991256E
> uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>

sec   rsa4096/0xC94035C21B4F2AEB 2017-03-14 [SC] [expires: 2023-02-11]
      B3F2469D78D78BD09D366F37C94035C21B4F2AEB
uid                   [ultimate] Chen-Yu Tsai <wens@csie.org>
uid                   [ultimate] Chen-Yu Tsai <wens@freedesktop.org>
uid                   [ultimate] Chen-Yu Tsai <wens@kernel.org>
uid                   [ultimate] Chen-Yu Tsai <wenst@chromium.org>
ssb   rsa4096/0x871A74AAB8E0BE8E 2017-03-14 [E] [expires: 2023-02-11]
ssb   rsa4096/0x389A54219C0F2430 2017-03-15 [S] [expires: 2023-02-11]


Thanks!
