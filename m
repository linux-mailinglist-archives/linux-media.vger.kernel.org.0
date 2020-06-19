Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192B5200471
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 10:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731609AbgFSIwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 04:52:01 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44077 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731587AbgFSIv4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 04:51:56 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhFpq-1jI4vB3PPu-00ePJ9; Fri, 19 Jun 2020 10:51:39 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id CEECC651899;
        Fri, 19 Jun 2020 08:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Afr88sTZPnb7; Fri, 19 Jun 2020 10:51:38 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.10.5.94])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 9403864C8CE;
        Fri, 19 Jun 2020 10:51:38 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 6F168804FB; Fri, 19 Jun 2020 10:51:38 +0200 (CEST)
Date:   Fri, 19 Jun 2020 10:51:38 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Subject: Re: [PATCH v5 6/9] media: adv748x: prepare/enable mclk when the
 audio is used
Message-ID: <20200619085138.GA7780@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
 <d9b7a7290e3d95b484a7a760484f827c3ed7651e.1585852001.git.alexander.riesen@cetitec.com>
 <646b0f32-2f83-281a-ccc0-eb88f82eb7a3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <646b0f32-2f83-281a-ccc0-eb88f82eb7a3@ideasonboard.com>
X-Provags-ID: V03:K1:Z40wuChLtVuyGhpa0eSWHYpnckmvA0AneQ/xLB1dN7j3mlvkxGf
 4UIeAZFH8vvMZW1KygniVP7aD1bBW0jwp5C70Q7OLQXiOfmQ6UpXmX2gaB66TEyJ187Rl/D
 JuoSANAV6qZcQFbUIDyyxFis/m4+hL7qZLuu2g19EShFHRh6tXMDh1vM20l9ZWrBONQtOdJ
 qc8AttDstYFLDDvDXvaLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ph7/p+iTgdc=:abepqPEyNSYfo2jDEeHIAl
 MXYHgg7UaQeGzy9u0Z1N0+DGzHKfgsQFvkCrf9ZZzwF8icVrJSJl7LmJA+L45xkr675Bx0T0p
 Zv5rHv+6GeP2mvw9XcHTjYeWlxpVTU7C65ucFBi2j0XxreYfKsWOsI9tJc/REuIxdQ9BiuTMS
 8rMdEH+Nwi4OSSUYAJHzJ6PhJDLn5jlRMR8wjO+dm0Fhebfu/1B9Ff0Qaig7E6FRW6quVVyq5
 pgYuzd/5gCvDkSewvVcNHZYMBteeoa/quOLg043EQTiymbjxBCieUIrZ0AmcX14IOyUmKZ6RC
 EmIBroD4CTFTK6zmRhd/Ey81gghk1LFinHfVrGTGBYd/W+qDfnZ2PQznE05LQpL+Fy+e/e9Kk
 xHXF+hald28fylV241YN9NSsS/V3EyTGheYOOObd4zOflamgk0QeBxOod70rrXc7HoMvSf6/B
 nTeIVfDTWvbLnvO1TBL7IdIFueDzFc/n9P3uTZCaNMU5358YbhudnMK9wuBNWa1RvsZUPTwkE
 iZ3qKrTRQe/AcNs4q3X6/JOl33MyYlxtCO3LOM1UOsOxbRjSkPXZFpiaeXSjW9CE5+VsPzmmx
 IPpiz86zpWxuDm1K4qk2AcUT6bEmlaOqAXK5FmujDNWrbsm8MD+SoVNINJDliVrVDVgHpOxf+
 QAPu6sLH0jf1imxYnlmO8vKm1loj6ZC0/YpnvsUlDZFckfU8wiqbaHhMBmGy6+ZBttpSYpJ9j
 fZfO08u0uUnjrgt82gUhM8eeyrRUTG9cfGbohbncNUfkNEfAK+5hshd7yvIRL8ulrIY/5rgwf
 /wXHTbZNKSvIriL0ExZP3TSmwQAjeRep3wVEP53hSe7zyucRDKDZV9b84Y+eKxZecyXToac
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran Bingham, Thu, Jun 18, 2020 18:23:14 +0200:
> On 02/04/2020 19:34, Alex Riesen wrote:
> > --- a/drivers/media/i2c/adv748x/adv748x-dai.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> > @@ -117,11 +117,22 @@ static int adv748x_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> >  
> >  static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> >  {
> > +	int ret;
> >  	struct adv748x_state *state = state_of(dai);
> >  
> >  	if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
> >  		return -EINVAL;
> this looks quite bunched up so :
> 
> Newline...

Will do.

> > -	return set_audio_pads_state(state, 1);
> > +	ret = set_audio_pads_state(state, 1);
> > +	if (ret)
> > +		goto fail;
> 
> With no action required to cleanup here, I would just
> 		return ret;
> and remove the fail: label.

Of course.

> > +	ret = clk_prepare_enable(mclk_of(state));
> > +	if (ret)
> > +		goto fail_pwdn;
> 
> newline...
> 
> > +	return 0;
> 
> newline...
> 
> Other than that:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

