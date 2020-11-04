Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E762A6B43
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 18:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbgKDRA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 12:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbgKDRA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 12:00:58 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6F9C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 09:00:58 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 133161F45B24
Message-ID: <2144c41cd78ebed91989c4329dd4cd941be37f78.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] CODA timeout fix & assorted changes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Fabio Estevam <festevam@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Date:   Wed, 04 Nov 2020 14:00:48 -0300
In-Reply-To: <AM6PR01MB5574778C3ACD64DBC9DA4E86E2070@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
         <CAOMZO5DpGXoyXm0D63BL84qMAnPkNOiUcmYsmp9QdogePrLxZw@mail.gmail.com>
         <4521d217f456dbab1279cfba2d23b426435c6d9c.camel@collabora.com>
         <CAOMZO5B=3Y5C-5mStLFwdzmV+t7nqEgEOHoK6-6217UWdJWd3g@mail.gmail.com>
         <AM6PR01MB5574778C3ACD64DBC9DA4E86E2070@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, 2020-10-12 at 14:47 +0000, Benjamin Bara - SKIDATA wrote:
> Hi Ezequiel!
> 
> I applied your series on top of bbf5c979011a099af5dc76498918ed7df445635b (5.9 tag).
> Additionally, I applied the attached patch to print the active metas during coda_fill_bitstream():
> 0001-DEBUG-coda-print-list-of-current-active-metas.patch
> 
> For verification, I used the attached single-color video:
> MPEG4, 512x512, ~135 kb/s, 20 FPS, GoP = 5; see below for reproduction steps.
> This might be a very "hard" and "theoretical" sample.
> However, with this video, I still get a timeout (see error log below).
> 
> When applying my "simplistic approach" (second patch) on top of that, the video is working.
> I saw a padding to 512 byte in the H.264 implementation, therefore I assumed it's the same here.
> Since I don't know how to pad the MPEG4 stream, I decided to keep adding frames
> until the "requirement" (I have no documentation for that) is reached.
> Therefore, this patch ensures that there are at least two buffers queued
> which reach the 512 byte threshold (for simplistic reasons 3, since "beyond the current one").
> 
> Note that the second patch is also just a proof of concept, there might be more efficient solutions.
> 
> If your reproduction attempts lead to different results, please write me an email.
> 
> Regards & many thanks!
> Benjamin
> 
> 
> *Video creation:*
> 1.) Create single color video:
> gst-launch-1.0 videotestsrc num-buffers=100 pattern=blue ! \
> video/x-raw,format=I420,width=512,height=512 ! v4l2mpeg4enc output-io-mode=4 ! \
> avimux ! filesink location=temp.avi
> 
> 2.) Re-encode with a GoP (IIRC this option is not provided by v4l2mpeg4enc,
> even though enabled in the driver; I usually do this on my test pc, not the SuT):
> ffmpeg -i temp.avi -vf scale=512:512 -vtag "xvid" -g 5 mpeg4.avi
> 
> *Error log:*
> [ 1067.150368] coda 2040000.vpu: 0: start streaming vid-cap
> [ 1067.164871] coda 2040000.vpu: 0: not ready: need 2 buffers available (queue:1 + bitstream:0)
> [ 1067.165490] coda 2040000.vpu: 0: job ready
> [ 1067.166682] coda 2040000.vpu: 0: active metas:
> [ 1067.166692] coda 2040000.vpu: 0: - payload: 60
> [ 1067.166697] coda 2040000.vpu: 0: - payload: 2913
> [ 1067.166702] coda 2040000.vpu: 0: - payload: 155
> [ 1067.166706] coda 2040000.vpu: 0: - payload: 155
> [ 1067.166711] coda 2040000.vpu: 0: - payload: 155
> [ 1067.166715] coda 2040000.vpu: 0: want to queue: payload: 155
> [ 1067.166973] coda 2040000.vpu: 0: active metas:
> [ 1067.166982] coda 2040000.vpu: 0: - payload: 60
> [ 1067.166987] coda 2040000.vpu: 0: - payload: 2913
> [ 1067.166992] coda 2040000.vpu: 0: - payload: 155
> [ 1067.166996] coda 2040000.vpu: 0: - payload: 155
> [ 1067.167000] coda 2040000.vpu: 0: - payload: 155
> [ 1067.167005] coda 2040000.vpu: 0: want to queue: payload: 155
> [ 1068.168449] coda 2040000.vpu: CODA PIC_RUN timeout
> 

Many thanks for your report. Indeed you managed to create
a video that is quite problematic for CODA.

Adding some debugging code to dump the metas, and then 
inspect the bitstream payload before/after a sync,
we can see that the hardware buffer has 690 bytes.

This seems a bit confusing, since the driver considers
it's enough. From the log below, isn't this supposed
to be enough metas?

[  274.087643] coda 2040000.vpu: CODA PIC_RUN timeout
[  274.092655] coda 2040000.vpu: 	meta 2: 432 - 804 (00 00 01 b0 01)
[  274.099133] coda 2040000.vpu: 	meta 3: 804 - 1176 (00 00 01 b0 01)
[  274.105551] coda 2040000.vpu: 	meta 4: 1176 - 1548 (00 00 01 b0 01)
[  274.112200] coda 2040000.vpu: 	meta 5: 1548 - 1920 (00 00 01 b0 01)
[  274.118840] coda 2040000.vpu: 	meta 6: 1920 - 2292 (00 00 01 b0 01)
[  274.125347] coda 2040000.vpu: bitstream payload: 690 (before sync)
[  274.130627] coda 2040000.vpu: bitstream payload: 690 (after sync)

Philipp, what do you think?

I must admit I can't fully wrap my head around
your prefetch fix, and how the new condition
would fix this issue. Could you explain it in more detail?

Why wouldn't the prefetcher count chunks smaller than 512?
Do you have some documentation for that?

Thanks,
Ezequiel

