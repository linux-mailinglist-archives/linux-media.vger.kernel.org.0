Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB14345ECF
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhCWM74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 08:59:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:42258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231594AbhCWM7j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 08:59:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A9C4619B8;
        Tue, 23 Mar 2021 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616504378;
        bh=j8LFDX65+BUtPjBfNOhhRAorUqLe44m6OLD2BoaUhbM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NL7vefyNv7KSX4gCZ00119xdKitw2h28W0Bc2F/3yTaALbTB9AG4DZ1cy7TF1ZboN
         fTr0TtHoxlgx1iGIVyi6mZ6Wskrilnb4alb2Gun+47Wn+stAw1H4T4CWVI+JWpHPyb
         blJ36lzYeDdnWegwIY6tn60Ru2qhupHeDx9DF2GdVLjPVeKKqLJZnZ/XjHCKeyhbLb
         0JWZbSghAI+0heUclrJ2JHjKRuNZqm6c0DxbQ1gzsCsx9VxqS1DUlmgEvLkMksfUTi
         GL1pEXn2i5JRXV5NsHq7g20VxBCzCsa83clU4YnTUD295TfkGFQjF4h7FWIq8Dv9qX
         IWDtsSn9Cqoxw==
Date:   Tue, 23 Mar 2021 13:59:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andrew Benham <andrew.benham@adsb.co.uk>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] dvb-apps: Add option for UK channel numbering in ZAP
 format
Message-ID: <20210323135932.41a0c2a7@coco.lan>
In-Reply-To: <06ff134b-4727-ba14-e614-934a296ea210@adsb.co.uk>
References: <06ff134b-4727-ba14-e614-934a296ea210@adsb.co.uk>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrew,

Em Sat, 31 Oct 2020 15:23:36 +0000
Andrew Benham <andrew.benham@adsb.co.uk> escreveu:

> There is already a "-u" option to output UK channel numbering in VDR
> format.  Patch accepts the option for ZAP format too.
> 
> In ZAP format, channel names will have "<channel_number>-" prepended,
> allowing channels to be sorted by number order.
> 
> 
> diff -r 3d43b280298c util/scan/dump-zap.c
> --- a/util/scan/dump-zap.c      Fri Mar 21 20:26:36 2014 +0100
> +++ b/util/scan/dump-zap.c      Sat Oct 31 15:12:40 2020 +0000T

The old dvb-apps at https://linuxtv.org/hg/dvb-apps is not maintained
for quite a while, as it depends on the legacy DVBv3 API, being
replaced by the dvbv5-tools, which are part of this repository:

	https://git.linuxtv.org/v4l-utils.git/

There, the apps are at:
	https://git.linuxtv.org/v4l-utils.git/tree/utils/dvb

And the libraries at:
	https://git.linuxtv.org/v4l-utils.git/tree/lib/libdvbv5


Not sure if the tool works with UK channel numbering. If not,
feel free to submit us a patch.

Regards,
Mauro.


> @@ -116,8 +116,12 @@
>                                   int sat_number,
>                                   uint16_t video_pid,
>                                   uint16_t *audio_pid,
> -                                uint16_t service_id)
> +                                uint16_t service_id,
> +                                int dump_channum,
> +                                int channel_num)
>   {
> +       if ((dump_channum == 1) && (channel_num > 0))
> +               fprintf(f, "%i-", channel_num);
>          fprintf (f, "%s:", service_name);
>          zap_dump_dvb_parameters (f, type, p, polarity, sat_number);
>          fprintf (f, ":%i:%i:%i", video_pid, audio_pid[0], service_id);
> diff -r 3d43b280298c util/scan/dump-zap.h
> --- a/util/scan/dump-zap.h      Fri Mar 21 20:26:36 2014 +0100
> +++ b/util/scan/dump-zap.h      Sat Oct 31 15:12:40 2020 +0000
> @@ -14,6 +14,8 @@
>                                   char polarity, int sat,
>                                   uint16_t video_pid,
>                                   uint16_t *audio_pid,
> -                                uint16_t service_id);
> +                                uint16_t service_id,
> +                                int dump_channum,
> +                                int channel_num);
> 
>   #endif
> diff -r 3d43b280298c util/scan/scan.c
> --- a/util/scan/scan.c  Fri Mar 21 20:26:36 2014 +0100
> +++ b/util/scan/scan.c  Sat Oct 31 15:12:40 2020 +0000
> @@ -2477,7 +2477,9 @@
>                                                      sat_number(t),
>                                                      s->video_pid,
>                                                      s->audio_pid,
> -                                                   s->service_id);
> +                                                   s->service_id,
> +                                                   vdr_dump_channum,
> +                                                   s->channel_num);
>                            default:
>                                 break;
>                            }
> @@ -2545,7 +2547,7 @@
>          "               Vdr version 1.3.x and up implies -p.\n"
>          "       -l lnb-type (DVB-S Only) (use -l help to print types) 
> or \n"
>          "       -l low[,high[,switch]] in Mhz\n"
> -       "       -u      UK DVB-T Freeview channel numbering for VDR\n\n"
> +       "       -u      UK DVB-T Freeview channel numbering\n\n"
>          "       -P do not use ATSC PSIP tables for scanning\n"
>          "           (but only PAT and PMT) (applies for ATSC only)\n"
>          "       -A N    check for ATSC 1=Terrestrial [default], 2=Cable 
> or 3=both\n"
> 
> 



Thanks,
Mauro
