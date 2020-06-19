Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816342004B4
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgFSJLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 05:11:11 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55845 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgFSJLK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 05:11:10 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MXYEr-1jNs2M3G9f-00Z3DM; Fri, 19 Jun 2020 11:10:53 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 8E2596518E2;
        Fri, 19 Jun 2020 09:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id E5kOhP1Rq5qJ; Fri, 19 Jun 2020 11:10:52 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.10.5.94])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 3CF6D650C2F;
        Fri, 19 Jun 2020 11:10:52 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 15BCA804FB; Fri, 19 Jun 2020 11:10:52 +0200 (CEST)
Date:   Fri, 19 Jun 2020 11:10:52 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 7/9] media: adv748x: only activate DAI if it is
 described in device tree
Message-ID: <20200619091052.GB7780@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <c3c8ece14c0fbc987dc201c9b61dd22d98f83056.1585852001.git.alexander.riesen@cetitec.com>
 <c752ea76-c8da-c77a-104f-9163230cc08a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c752ea76-c8da-c77a-104f-9163230cc08a@ideasonboard.com>
X-Provags-ID: V03:K1:rbl/SW6nDhOvVZnU3VniVHKkESyDd8Y5zwjO7GuJtU+r0jMpPem
 ZxlIay/v5RD2OgtYAGDJbcTrtjfwviHE1cp2Dw3QJ3aHSAgvXOWARIeiSai/t3JcW5M43/g
 LoteXF9oTuMYUT0DPcEahQFieByYGPXlRz6MUdfC/kAvs8kB8wByGJE8zaAugjnqdsQbIW5
 V8WPgVfjFVhd0HYoO9bHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d5tnjAyihLc=:GQv3a49z6BNFOKGlDseJQx
 JHhmPglGY+xmSFCCqp/Y1J0xuavrn6sjGxeJcFEBTFUDqPtAog/dRaEe5c480YGUVfFXb0p66
 OdKYEYxNSZ3nv/r9tWELjjjhja9qa7v8QIDt+5lq47izvs+zF3WlHqs1c9qk49cTLYHtUf3m4
 gLZ84bJ4P+yo4YUYHPoAo8VWabo186PMwBu25gO6Y0I+3/5OIfXdeAifVLyLwsFRtWuRrh34B
 mqqjY+KSKwzrcmJx19QBCxtuBUwWGaBK8A/Br/JG18l9iala6Y+h9aOW7lH3SzJUwJm/CvXj0
 5y+3stpCeH08AR1bWS+kr7Lgkpjfg4Yp+e2ZXkj0MNrDaU0EWA+pulNaKhbc3e/yM7IFuQeuB
 MG2KGmuB9qYRym5Ki4EnrrWdTtuHeHJapxY1BFoWCcEV79rudRDaKrMOPPY9kjZCmDdvq+KPN
 INu0YKoX2/IDsSr+A9D4d6aPyx4263mV8Ow5us4JxyRRGPUMVtN/6MmO9rPD8TgFD2d8kaN/P
 9WfoB4213DYQhZx5ld9CRN8VZ08em2iWhcJcd3o4U2HFddqvXO2nyIjpYb8rzxLjxO1DszUPk
 mY+5jd0cjN1GM04Lno/HKod/Oz0VNxaquMf/0zSvgHOG4pGFwW9bC2PrHxNdL2XU7CnweMbcg
 UDmvY7KzZ/w2A2hCWK8gRcSdrgzttiRj1LXtRz96K5L+9OKzt5zcNszK39FklNnuNyfWtt2Tw
 4kfznpLi9oJktk1MBplEsHXXgUY/trNTP3F4wBtZLHze/2fblXNiro/lPL0QMGgR8pLSfAeTJ
 mthzJyMZgWb17zLdvztJtUHXH4c7rJamygh4fT0F5jV80SekE2ZTIZbkeJ0h/xYWLeKA/Vx
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran Bingham, Thu, Jun 18, 2020 18:17:04 +0200:
> On 02/04/2020 19:34, Alex Riesen wrote:
> > To avoid setting it up even if the hardware is not actually connected
> > to anything physically.
> > 
> > Besides, the bindings explicitly notes that port definitions are
> > "optional if they are not connected to anything at the hardware level".
> > 
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-dai.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> > index 185f78023e91..f9cc47fa9ad1 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-dai.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> > @@ -216,6 +216,11 @@ int adv748x_dai_init(struct adv748x_dai *dai)
> >  	int ret;
> >  	struct adv748x_state *state = adv748x_dai_to_state(dai);
> >  
> > +	if (!state->endpoints[ADV748X_PORT_I2S]) {
> > +		adv_info(state, "no I2S port, DAI disabled\n");
> > +		ret = 0;
> > +		goto fail;
> 
> How about just 'return 0'?

Indeed. In the retrospect, the whole event of loading the DAI driver does not
feel that important anymore to warrant logging on info prio.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> This could also be folded into 5/9 too I guess?, though it is easier to
> review the sequential additions, rather than the one-big-feature
> addition ;-)

I would prefer to have it separately, if you don't mind: maybe not a big one,
but loading a driver without hardware for it *is* an event.

Thanks,
Alex
