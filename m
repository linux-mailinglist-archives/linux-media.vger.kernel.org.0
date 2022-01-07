Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C1948734B
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 08:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbiAGHGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 02:06:36 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41052 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiAGHGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 02:06:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BC81EB822DA
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 07:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6038C36AEB;
        Fri,  7 Jan 2022 07:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641539193;
        bh=JgglJKagfFE+Zj1mhESiArQ8fOFdW7TdUUW3JhzewLA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jwvWcSlcZ/XrIHs0cw3QtYOo9vY0aEl8JhrUWMAvZ0JM/Nej0PpP+4BvBLsC9+g/l
         kvUzhMvBiWQHpbuDICo8OhzZadNP1cjbDyQwdcJ1mcLrQZstRPLZWcoIdrfb4hzyB8
         vFo4/4p4RJsKUS5Zmqmja+TVcxIAjBtlD25CHM+qWRzTMqXgijT/zfYhOPkvkSuW1k
         elRNgry0jkSv+AzcAmDX+qNw38jisQcjtInXIdqGDPXTLI3/6d8zRmj1zamRHjGnxh
         SKdf6wYlHPeLJlb7RI4d+XYjfCVu2iLirbAJqD8gKaICeS4+NT7BWvPgsiI9xMwNfJ
         SPtVpPYTyCQfw==
Date:   Fri, 7 Jan 2022 08:06:25 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: add support for 1.7MHz and 6.1 MHz
Message-ID: <20220107080625.00547988@coco.lan>
In-Reply-To: <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
References: <cover.1639140967.git.mchehab+huawei@kernel.org>
        <76c2ea87882c87bd35066a85cb48292a36a79fce.1639140967.git.mchehab+huawei@kernel.org>
        <trinity-b5cc1284-ccc2-477c-ac90-56ee40da91af-1641483579446@3c-app-gmx-bs50>
        <trinity-59d726d3-993c-43c9-9e44-5be5cdfae74d-1641493525223@3c-app-gmx-bap38>
        <20220106213045.6afe5a35@coco.lan>
        <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 7 Jan 2022 00:16:45 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> "Mauro Carvalho Chehab" <mchehab@kernel.org> wrote:
> > I suspect that the entire get_bandwidth() code on drivers are
> > dead code, as the core doesn't call it anymore. This used to be
> > needed before DVBv5 API.
> >
> > Probably, the right fix here would be to simply strip this function
> > from all drivers.  
> 
> Hmm, I am actually doing this in a frontend driver I'm currently
> developing, in the get_frontend() callback function:
> 
> if (fe->ops.tuner_ops.get_bandwidth) {
> 	ret = fe->ops.tuner_ops.get_bandwidth(fe, &bandwidth);
> 	if (ret)
> 		goto err;
> 	props->bandwidth_hz = bandwidth;
> }
> 
> The documentation for get_frontend() states that it should return
> the parameters actually in use. And these might differ from the
> requested ones. So I see some value in filling in the actually
> applied bandwidth filter there.
> 

Ok, but the tuner driver could just update props->bandwidth_hz directly.

On the other hand, there's not much value on updating it, IMO. 

See, channels are spaced by bandwidth. So, let's say, a 6MHz based
channeling (like ATSC) would have a frequency table like:

	Channel 14: 471.25 MHz
	Channel 15: 477.25 MHz
	Channel 16: 483.25 MHz

Let's suppose the user wants to tune channel 15.

If the tuner bandwidth filter is lower than 6MHz, the demod won't be
able to lock, as the FEC inner coding (Viterbi) will have too many
errors.

If channels 14 and 16 are empty, there won't be co-channel interference,
so any bandwidth between 6 MHz and 12 MHz should work.

If either channel 14 or 16 are used and the bandwidth filter is
higher than 6 MHz, demod will get crosstalk noise, causing troubles to
FEC inner coding. So, it won't properly lock. The end result is that
the tune will also fail. Even if it can eventually tune, the decoded 
stream will have a very poor quality, probably making the channel 
useless.

As the DVB core already stores the bandwidth used to tune at props,
since the introduction of DVBv5 API, any get calls will return the
tuned bandwidth. So, there's no practical need to update 
props->bandwidth_hz.

There's also another reason why this shouldn't be updated. For cable
and satellite tuning, the bandwidth is indirectly estimated by the
DVB core, depending on the roll-off factor, at dtv_set_frontend():

	switch (c->delivery_system) {
	...
	case SYS_DVBC_ANNEX_A:
                rolloff = 115;
                break;
        case SYS_DVBC_ANNEX_C:
                rolloff = 113;
                break;
	...
	}
	if (rolloff)
                c->bandwidth_hz = mult_frac(c->symbol_rate, rolloff, 100);

So, bandwidth_hz actually contain the actual required bandwidth in
order to exclude all co-channel and spurious frequencies, in order
to minimize the noise. This is documented at DVB uAPI[1].

[1] See note 2 at:
    https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/dvb/fe_property_parameters.html

So, for for DVB-C/S/S2, if the tuner driver touches it, it will not 
report the estimated value anymore, violating the uAPI.

So, it sounds that the better is to not use the returned value, which
effectively makes the get_bandwidth() callback useless.

So, I may end preparing a patch series some day to remove
get_bandwidth() everywhere, if I have enough time, but for now,
I'll accept your fix patch.

> > OK! I'll wait for your patch.  
> 
> Posted. Thanks for your time and patience.

Thanks, patches look sane on my eyes.

Thanks,
Mauro
