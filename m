Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11CE474208
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 13:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhLNMGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 07:06:35 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:49620 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhLNMGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 07:06:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5831D61473
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 12:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030D7C34605;
        Tue, 14 Dec 2021 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639483593;
        bh=od8cI5Sx/3UqugzXJsDQn/aHWoU/7/vztexzhpjXzVs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OHph1CfeC73MZVSo4rBC87TMGx3g3YIC/OH3q2ljukR1lDta+xB49LTs2MzyCJLI+
         GiABg6sYw3zVsKThxc61d8ZwBiqHTZaLZZ7nbk14lGPaAVsVsg/cc4bLoXwUcEf0zM
         NQIupOJnUEtf1aqCUtltBPEzjS8LC9YBALNOd0Hea1rZowCThIAduvWS2s4xMkOfkQ
         YU09e8tfBo1LMmWlaipbsOE12WwSnS+NwcEIWP0Nt8pi6scvcx1L7zPW/a0srs3giE
         MPdd5HeJwWNqZlJI2fuF0C6UHif6qWqMdjUhFr3H96EyO4SgLowxle33+h5/1B1fbg
         vKPIYwAiLSVUA==
Date:   Tue, 14 Dec 2021 13:06:30 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stefan Seyfried <stefan.seyfried@googlemail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] v4l-utils: fix DVB-S scan
Message-ID: <20211214130630.3f43441c@coco.lan>
In-Reply-To: <cc3f28bd-ab2c-2ca7-c35f-9944e0e2853a@message-id.googlemail.com>
References: <cc3f28bd-ab2c-2ca7-c35f-9944e0e2853a@message-id.googlemail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 10 Feb 2021 16:13:56 +0100
Stefan Seyfried <stefan.seyfried@googlemail.com> escreveu:

> Hi all,
> 
> dvbv5-scan did report all channels as DVB-S2, due to broken logic.
> Debug output showed "modulation_system DVB-S" correctly, but the code 
> that stores the delivery system for output used a different (IMO 
> invalid) logic.
> This in turn made drivers that actually care for the delivery system 
> (e.g. b2c2-flexcop-pci / cx24120) unhappy, resulting in incomplete scan 
> results. For drivers that just don't care (e.g. dvb-usb-technisat-usb2 / 
> stv6110x) it "just" resulted in wrong "DELIVERY_SYSTEM = DVBS2" for all 
> channels in scan output.
> 
> The patch is attached, because I'm pretty sure that Thunderbird would 
> mess it up. You can also fetch it from
> 
> https://github.com/seife/v4l-utils.git fix-dvbs-scan
> 
> Best regards,
> 
> 	Stefan
> 
> --- a/lib/libdvbv5/dvb-scan.c
> +++ b/lib/libdvbv5/dvb-scan.c
> @@ -1118,9 +1118,12 @@ static void add_update_nit_dvbs
>                               dvbs_dvbc_dvbs_freq_inner[d->fec]);
>          dvb_store_entry_prop(new, DTV_ROLLOFF,
>                               dvbs_rolloff[d->roll_off]);
> -       if (d->roll_off != 0)
> +       if (d->modulation_system != 0)
>                  dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
>                                       SYS_DVBS2);
> +       else
> +               dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
> +                                    SYS_DVBS);

This will likely break for DVBS2. What should be done here would
be to check if the returned parameters fit on DVB-S or DVB-S2.

So, it should be like:

	if (d->modulation_system != QPSK || (d->roll_off && d->roll_off != ROLLOFF_35)
                  dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
                                       SYS_DVBS2);
       else
                  dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
                                       SYS_DVBS);

Perhaps it should also test FEC as well, as some are only available
on DVB-S2.

Regards,
Mauro

Thanks,
Mauro
