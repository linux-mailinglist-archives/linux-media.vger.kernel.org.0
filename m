Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A73488849
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 08:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiAIHJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 02:09:21 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43158 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiAIHJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 02:09:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 192EFB80AE6
        for <linux-media@vger.kernel.org>; Sun,  9 Jan 2022 07:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F418CC36AE3;
        Sun,  9 Jan 2022 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641712158;
        bh=BJvgcOCRjHC0aJy4FQE/LvByHoNBhu/yu3uIuovjkTo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pbgbjGqVmA/M75Ie8bvavVV5uq6EX009IjtZhoENhoQum/7Rlmm/Y5XerkGmxKbbD
         15IyxRD2l9phYjEDJ9k4Z84SsHTb8FM3EyCQ3WWHEVr823HleRQEhGo8DAuDEJiqgO
         z36rBOtUFj5l1n5lscPkIYRkeEUEtErfFsaIhYy6QVaJjx7CfYBkzcj4KS6xe0SR67
         gpkca1WbVah91xsxku57/wTlVStATHeZBdHUE2vnURaCZih5QY7YdqlAG671HqOqfS
         GPwXdWZzs1LjI/pHOrfAduW1FJI3ajCyyTKH79GIoHB6fJGC2vJFTaZBF33/XOXMVe
         LCnFNHxqxwixQ==
Date:   Sun, 9 Jan 2022 08:09:14 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: add support for 1.7MHz and 6.1 MHz
Message-ID: <20220109080914.53e31572@sal.lan>
In-Reply-To: <trinity-37466cd2-8684-4e53-a4a3-7ed406945e90-1641551917644@3c-app-gmx-bap54>
References: <cover.1639140967.git.mchehab+huawei@kernel.org>
        <76c2ea87882c87bd35066a85cb48292a36a79fce.1639140967.git.mchehab+huawei@kernel.org>
        <trinity-b5cc1284-ccc2-477c-ac90-56ee40da91af-1641483579446@3c-app-gmx-bs50>
        <trinity-59d726d3-993c-43c9-9e44-5be5cdfae74d-1641493525223@3c-app-gmx-bap38>
        <20220106213045.6afe5a35@coco.lan>
        <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
        <20220107080625.00547988@coco.lan>
        <trinity-37466cd2-8684-4e53-a4a3-7ed406945e90-1641551917644@3c-app-gmx-bap54>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 7 Jan 2022 11:38:37 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> "Mauro Carvalho Chehab" <mchehab@kernel.org> wrote:
> 
> > As the DVB core already stores the bandwidth used to tune at props,
> > since the introduction of DVBv5 API, any get calls will return the
> > tuned bandwidth.  
> 
> No, not the _tuned_ bandwidth, the "requested" bandwidth, that was
> estimated. I see no value in that information, as the user app can
> easily calculate that by itself. This is not information that the
> kernel or driver needs to provide, as it is solely derived from
> the information the application has given.
> 
> Whereas the _actually applied_ bandwidth filter is an information
> that only the tuner driver can deliver. For example, there are 5MHz
> DVB-T2 channels, but the si2157 only offers a 6MHz bandwidth filter.
> 
> What should get_frontend() return, the requested/nominal 5MHz, or
> the actually used 6MHz?
> 
> Reading the include file, the answer seems clear to me:
> 
> https://git.linuxtv.org/media_tree.git/tree/include/media/dvb_frontend.h
> 
> > * @get_frontend:	callback function used to inform the parameters
> > *			actuall in use.  
> 
> So following that documentation, I would say the actually used 6MHz
> should be put into the property cache by that callback.

For the better or for the worse, the userspace API clearly states that,
for DVB-C/S/S2, it should return the estimated bandwidth, calculated from
Roll-off and signal rate. So, at least for such delivery systems,
props->bandwidh_hz should not be touched by drivers.

There's actually a couple of reasons why bandwidth_hz is calculated
at the core:

1. It helps to have the minimum required bandwidth filter on a single
   place at the core;
2. It helped to address issues with DVB-C Annex-C;
3. It is interesting to allow checking what bandwidth the Kernel actually
   requested the driver, when debugging them. I used this a couple of
   times when fixing Annex-C support on some drivers (I used to have
   a DVB-C Annex-C 6MHz-spaced cable).

For DVB-T/T2, it is even worse, as the properties returned by
FE_GET_PROPERTY are used to store the channel properties to userspace
by tools like dvbv5-scan. Those should reflect the channel 
properties/requirements, not the actual bandwidth filter applied by the
tuner, as the same channel configs can be used by different tuners.

So, a change like that for DVB-T/T2 can actually cause regressions and
bad channel reports when an user is sending patches to the DTV channel
settings on this git tree:

	https://git.linuxtv.org/dtv-scan-tables.git/

-

Now, get_frontend is an internal kAPI. If I'm not mistaken, it was
designed to be used between tuners and demods, for the cases where the
demod would need to know what was the bandwidth set at the tuner.
So, I'm OK if it returns the actually applied bandwidth, provided that
such value is not returned to userspace via DTV_BANDWIDTH_HZ. So,
props->bandwidth_hz should not be updated after its call.

Now, if you think it would be worth to pass the actual bandwidth set
by the hardware to userspace (frankly, I don't know why userspace
might need it), then another DTV property is needed.

Regards,
Mauro
