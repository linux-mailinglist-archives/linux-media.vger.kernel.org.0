Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4C22B66E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 15:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbgKQOHc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 17 Nov 2020 09:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387917AbgKQOH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 09:07:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555DCC0617A7
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 06:07:29 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kf1dl-00022x-4X; Tue, 17 Nov 2020 15:07:25 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kf1dk-00072q-SF; Tue, 17 Nov 2020 15:07:24 +0100
Message-ID: <01cdd884e890f337a315362008cba05b10525b54.camel@pengutronix.de>
Subject: Re: [PATCH] media: dt-bindings: coda: Add missing
 'additionalProperties'
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 17 Nov 2020 15:07:24 +0100
In-Reply-To: <CAL_Jsq+L4TOYWLgk=_xihtw_Jxfjigbn=h3J0LLXiPrMy0gjMA@mail.gmail.com>
References: <20201112224917.165544-1-robh@kernel.org>
         <CAL_Jsq+L4TOYWLgk=_xihtw_Jxfjigbn=h3J0LLXiPrMy0gjMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-11-17 at 07:48 -0600, Rob Herring wrote:
> On Thu, Nov 12, 2020 at 4:49 PM Rob Herring <robh@kernel.org> wrote:
> > 'additionalProperties' is now required by the meta-schema. Add it for
> > coda.
> > 
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/media/coda.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> I missed an error this introduces:
> 
> /home/rob/proj/git/linux-dt/.build-arm/Documentation/devicetree/bindings/media/coda.example.dt.yaml:
> video-codec@63ff4000: 'interrupts' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>         From schema:
> /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/media/coda.yaml

Right, because interrupts are only specified conditionally:

allOf:
  - if:
      properties:
        compatible:
          contains:
            const: cnm,coda960
    then:
      properties:
        interrupts:
          items:
            - description: BIT processor interrupt
            - description: JPEG unit interrupt

        interrupt-names:
          items:
            - const: bit
            - const: jpeg
    else:
      properties:
        interrupts:
          items:
            - description: BIT processor interrupt

What is the proper way to fix this?

regards
Philipp
