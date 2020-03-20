Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7618718CC0A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 11:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgCTK7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 06:59:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:41897 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgCTK7C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 06:59:02 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MPXta-1itszl3gFW-00Meet; Fri, 20 Mar 2020 11:58:47 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E62146501DB;
        Fri, 20 Mar 2020 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iWOs4ZaNJtNh; Fri, 20 Mar 2020 11:58:46 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 9777564F45C;
        Fri, 20 Mar 2020 11:58:46 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 11:58:46 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 09B4B8050D; Fri, 20 Mar 2020 11:58:46 +0100 (CET)
Date:   Fri, 20 Mar 2020 11:58:46 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] media: adv748x: add support for HDMI audio
Message-ID: <20200320105846.GG4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <252bb433f47b0ccb61bb077abdbd892091abc550.1584639664.git.alexander.riesen@cetitec.com>
 <CAMuHMdXOAQtuxCAfb=sZKodyJWwSrf-GO-pdV3HYkOytQW4ENg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXOAQtuxCAfb=sZKodyJWwSrf-GO-pdV3HYkOytQW4ENg@mail.gmail.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D776A
X-Provags-ID: V03:K1:gtuij3dAJiYujWnkoDtooYsdCMWO9pBYd9dPTTa/FSGo8gecAfC
 URld0b8m+Rp/auU0krCrDaaXNorutl+DDrafS3dPrrUAUOLw7JXbbvI1mVibbmCOQXKYIvk
 ezIQmWEASa/+6YHZ8Nfa+MiLM9ojp8w1V24gfWxek7ZCKQc2SYBW8lqtwAlfUqUNBAHSTiF
 EN9Z693r2b9T7rDM9t6vg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yiw+bxjplYU=:Ewjxxm0gcp4ntRvEsGYeZV
 7zsQK2sxjP4AvCducAmfHAokJ7y7uzrkl94oaECFh2BrRJAu3ejMBZF/xGwQ6mEU6ch2eF3ai
 +e5+DXZKEnwPks+ue3r3fdoivP8aHalIYyPyU985b9l6MxYUwD+HCH6pmXJCjxUs+lUM/eNnR
 FL2gELpL5xDn+LSoxgshN4HtlUsVsbdA0O/j/I6+SLmzLUmUVT6mRYa4pAuk7xcGnGyPecIfA
 GLa4+oKFgR8O7bUD82KNyDd6tpBW8XR1x7SveaCTuseqNhPh3AOcrjbg/wF/SOsTcRWzZW+OS
 U0o1JKMpS3kl/tiOK1422h1IhlIJrm9HrXpaGgNYbdZlduKP+ca3K0TG7CfSzY9ktakOwvz+j
 56qmx28b5g2RRObGPwhBroXwwoPgc3gTPkKe3ry9Df8Q8OgdFhUFoXtUOpXvMh/r1zDFcHHjt
 q3kYsrP0V1jK8wgyDLeXUwcpXIMhtKQqPLHDax5JQKry9aROE1ZHnYYE/Ry/l7TeXPsDAiJk9
 P1Z2Mj03clbdY7v+q8Sr6OrUv8A+DctE3EWGIl+O3NBTTPgW4qMXJdP0mPEySD8/6Ril78eRB
 M9F7a9Jsvx+KRD0PYuHlsFHbOCO/L03+TIq9h/QqGSy3iJJk2Rq9A3mrF424z5RPQMexoaDkH
 ZLjACeKiLhLL9c+q3He+e7JtW9U0VpcRFOhf83VZLB7a2sLRDBVGkAw4/GgxsEk9LtLLrlbeN
 p7bVmEDYKxkPIf0ma4MYQTesQoacvZBurF3+V7+He138APayDX/wotHV3s/4bHVjLeyxL2fCY
 2k6hd/GA7rcIiLAvEWHiGy6CD+6IB45WQRwnTx/P8sAoSTnzaiPEtJ9qEsR4B2aKBJLTW2X
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Fri, Mar 20, 2020 09:43:29 +0100:
> CC linux-clk for the clock provider.
> 
> On Thu, Mar 19, 2020 at 6:42 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > This adds an implemention of SoC DAI driver which provides access to the
> > I2S port of the device.

I just noticed I don't do clk_prepare_enable anywhere.
Shouldn't the clock master enable its clocks somewhere?

> > diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> > new file mode 100644
> > index 000000000000..4775a0c7ed7f
> > --- /dev/null
> > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
...
> > +static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> > +{
> > +       struct adv748x_state *state = state_of(dai);
> > +
> > +       if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
> > +               return -EINVAL;
> > +       return set_audio_pads_state(state, 1);
> > +}

For example, here, after activation of the lines succeeded?

> > +static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> > +{
> > +       struct adv748x_state *state = state_of(dai);
> > +
> > +       set_audio_pads_state(state, 0);
> > +}

And clk_disable_unprepare here, before shutting down the pads?

Regards,
Alex

