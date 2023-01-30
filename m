Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E764681607
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 17:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236242AbjA3QL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 11:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236937AbjA3QLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 11:11:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F943E639;
        Mon, 30 Jan 2023 08:11:23 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C45928B8;
        Mon, 30 Jan 2023 17:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675095081;
        bh=sG001yyKvLUqqVVjqlpKXCrPqUid8Xi8Bus9CnOQHJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=legGWsqSS5O/61U/ux7b3sNsa1RhCN6agqUV/DO+jVw5XECpPKcP3wTbMdWMycFBJ
         +2g8rqC5+sNSFXEcDJ6GTg55KjWUn4Mj15WUv00aHrvEiAsoi/Jbxj+lR/9LHAxWME
         8vXmgAxhPUk54x2K5iqvv9ZlwOT+hyGiyeOu3ZaA=
Date:   Mon, 30 Jan 2023 17:11:19 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        chiranjeevi.rapolu@intel.com, luca@z3ntu.xyz,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6.1] media: dt-bindings: Add OV5670
Message-ID: <20230130161119.togkryxoaf47bqqp@uno.localdomain>
References: <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <20230128112736.8000-1-jacopo.mondi@ideasonboard.com>
 <b4794490-b059-373a-dec0-58fcd2344f6f@linaro.org>
 <20230129121132.uamuvywdsuah5ivn@uno.localdomain>
 <20230130155840.GA2706990-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230130155840.GA2706990-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 30, 2023 at 09:58:40AM -0600, Rob Herring wrote:
> On Sun, Jan 29, 2023 at 01:11:32PM +0100, Jacopo Mondi wrote:
> > On Sun, Jan 29, 2023 at 12:40:03PM +0100, Krzysztof Kozlowski wrote:
> > > On 28/01/2023 12:27, Jacopo Mondi wrote:
> > > > Add the bindings documentation for Omnivision OV5670 image sensor.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > > v6->6.1
> > > > - Use additionalProperties: false for endpoint properties from
> > > >   video-interfaces.yaml
> > > > - List 'remote-endpoint' among the accepted endpoint properties
> > > >   now that we use additionalProperties: false
> > >
> > > b4 diff '20230128112736.8000-1-jacopo.mondi@ideasonboard.com'
> > > Could not create fake-am range for lower series v1
> > >
> > > Can you send patches in a way it does not break out workflows? Why
> > > making our review process more difficult?
> >
> > Because it's a nit on a 10 patches series with no other changes
> > requested ?
>
> So? Think of patch series as an 'email transport' for your git branches.
> If you rebase your branch, that's a whole new branch to send.
>

So if a series has a single comment and could be then collected as it
is but one patch I saw it happening multiple times on the ML and I
thought it was an accepted practice.


> > What is difficult exactly ?
>
> In addition to 'b4 diff', if a maintainer is applying this series, for a
> v7 they just do:
>
> b4 shazam msgid-of-v7
>
> For v6.1, they do:
>
> b4 shazam msgid-of-v6
> git rebase -i ...
> <stop on patch 1>
> git reset --hard HEAD^
> b4 shazam msgid-of-v6.1
> git rebase --continue
>
> Which one makes the maintainer's life easier?
>

With b4 it now certainly makes a difference.

As I save patches from my mail client and apply them manually I never
really considered picking one patch over the other from the same
thread "more difficult". I should have noticed when Krzysztof
mentioned b4 in his first reply.

> If it's a CI job trying to apply and test this, there's no way it's
> going to do the second case.
>

That's another point yes.

Got your message, I'll stop :)

Don't think a v7 is needed for this on though (if not other
comments ofc)

> Rob
