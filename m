Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E5014FAA3
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 22:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBAVUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 16:20:46 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:40501
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726453AbgBAVUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Feb 2020 16:20:46 -0500
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 7B0AA7410BE;
        Sat,  1 Feb 2020 21:20:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (100-96-9-4.trex.outbound.svc.cluster.local [100.96.9.4])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id D3BC7741064;
        Sat,  1 Feb 2020 21:20:43 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from pdx1-sub0-mail-a33.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Sat, 01 Feb 2020 21:20:44 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@b-rad.cc
X-MailChannels-Auth-Id: dreamhost
X-Supply-Abiding: 7cc1c64e0ebcb59d_1580592044314_2061351304
X-MC-Loop-Signature: 1580592044314:4144073154
X-MC-Ingress-Time: 1580592044314
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTP id 1BE297FE21;
        Sat,  1 Feb 2020 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        nextdimension.cc; bh=gUCiHtq0IXHnMmiWTM8bdKs6ol4=; b=xr0Wp/XUd8u
        gFlEDUjPW+rQvbmOAHQU3vG/1w2pltuj2Rvj7OcmjT62piuVOWR+KWuX5xoDP9/B
        HkoHaW+5Zk3qGJUV5WxshrkaB2XCQMWH/7Jm+xW3U143dJHXq1rGuyWVPRX6VBEw
        RFO7lAsoDa+/OOIgPBE3Sl5cEzWGGJCc=
Received: from [192.168.0.21] (66-90-181-52.dyn.grandenetworks.net [66.90.181.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@b-rad.cc)
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTPSA id C6B887FE18;
        Sat,  1 Feb 2020 13:20:35 -0800 (PST)
Subject: Re: [PATCH v3 04/14] si2157: Add analog tuning related functions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>
Cc:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-5-brad@nextdimension.cc>
 <f2375be1-5bb2-ef59-ecd9-a3a8f6081b99@iki.fi>
 <20191219141300.3ffbdb1e@kernel.org>
X-DH-BACKEND: pdx1-sub0-mail-a33
From:   Brad Love <brad@nextdimension.cc>
Openpgp: preference=signencrypt
Autocrypt: addr=brad@nextdimension.cc; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fd8d4630-bc1e-e28d-1d6a-3e9cc6ae201a@nextdimension.cc>
Date:   Sat, 1 Feb 2020 15:20:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191219141300.3ffbdb1e@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 15
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgedvgddugeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecukfhppeeiiedrledtrddukedurdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopegludelvddrudeikedrtddrvddungdpihhnvghtpeeiiedrledtrddukedurdehvddprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhg
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,


On 12/19/19 7:13 AM, Mauro Carvalho Chehab wrote:
> Em Sun, 24 Nov 2019 07:09:07 +0200
> Antti Palosaari <crope@iki.fi> escreveu:
>
>> On 11/14/19 10:03 PM, Brad Love wrote:
>>> Include set_analog_params, get_frequency, and get_bandwidth.
>>>
>>> Tested with NTSC and PAL standards via ch3/4 generator. Other standards
>>> are included, but are untested due to lack of generator.
>>>
>>> Signed-off-by: Brad Love <brad@nextdimension.cc>
>>> ---
>>> Changes since v1:
>>> - remove __func__ from dev_dbg macros  
>> After all it looks pretty simply, but implementation is not done that 
>> simply. Crazy RF/IF offsets, impossible values and so.
>>
>> I think you need to study some tuner basics:
>> * what IF frequency is, why, and so
>> * IF vs. BW, what is relation, what are possible values
>> * Down conversion RF to IF. OK, *on that case* firmware covers PLL, but 
>> it is fundamental. So basics of integer-N and fractional-N PLL is always 
>> you must to know.
>> * Filtering. Especially IF filtering, which is generally low-pass 
>> filtering. Think possible filters when selecting IF.
> For me, the implementation seems to make sense. I mean, for analog TV, both
> channel bandwidth and chroma/audio sub-carrier IF depends on the TV standard
> only.
>
> So, for NTSC and PAL/M/N/N', bandwidth is always 6MHz. For other standards, it
> may be either 6MHz, 7MHz or 8MHz. the actual bandwidth depends if it is
> a channel at VHF or at UHF range.
>
> So, this part of the patch sounds OK to me.
>
> The IF is actually a little trickier. Yet, if you take a lok on other
> tuners, like drivers/media/tuners/tda827x.c, it is up tot he tuner to
> automatically set the IF that will work for each video standard:
>
> static void tda827x_set_std(struct dvb_frontend *fe,
> 			    struct analog_parameters *params)
> {
> 	struct tda827x_priv *priv = fe->tuner_priv;
> 	char *mode;
>
> 	priv->lpsel = 0;
> 	if (params->std & V4L2_STD_MN) {
> 		priv->sgIF = 92;
> 		priv->lpsel = 1;
> 		mode = "MN";
> 	} else if (params->std & V4L2_STD_B) {
> 		priv->sgIF = 108;
> 		mode = "B";
> ...
>
> static int tda827xo_set_analog_params(struct dvb_frontend *fe,
> 				      struct analog_parameters *params)
> {
>
> ...
>
> 	N = freq + priv->sgIF;
>
> In other words, for analog TV, the tuner will always receive the 
> channel central frequency, with may vary depending on the video
> standard, and will adjust it to tune at the right channel, using the
> per-standard IF (if needed), as, on most tuner drivers, the tunning
> frequency should be either initial frequency or the main carrier
> frequency, and not the center frequency.
>
>
> Cheers,
> Mauro


This code has been widely tested by multiple Hauppauge customers across
North America and Europe. This code has been in use by various parties
for years, with zero issues reported. I am merely working to upstream
all of the code we have generated over the years.

It took a while for me to get tester and test bench time, but included
below is results from using an analog generator and testing channels
across the entire frequency range for ATSC and PAL-I analog TV channels.
First lock and signal strength were verified, then video and audio
signal decoding was verified. Decoding is flawless on every channel tried.

Software used for validation is scantv, tvtime, vlc, and qv4l2.

Cheers,

Brad


$ #########################
$ # USA ATSC TESTING
$ #########################
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
5    ( 77.25 MHz): ???
[unknown (5)]
channel = 5

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
10   (193.25 MHz): ???
[unknown (10)]
channel = 10

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
17   (489.25 MHz): ???
[unknown (17)]
channel = 17

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
30   (567.25 MHz): ???
[unknown (30)]
channel = 30

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
40   (627.25 MHz): ???
[unknown (40)]
channel = 40

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
50   (687.25 MHz): ???
[unknown (50)]
channel = 50

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
60   (747.25 MHz): ???
[unknown (60)]
channel = 60

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
70   (807.25 MHz): ???
[unknown (70)]
channel = 70

<...>
$
$ scantv -n NTSC-M -f us-bcast
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = us-bcast

[defaults]
input = Television
norm = NTSC-M


scanning channel list us-bcast...
<...>
83   (885.25 MHz): ???
[unknown (83)]
channel = 83

$ #########################
$ # EUROPEAN PAL-I TESTING
$ #########################
$
$ scantv -n PAL-I -f europe-west
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = europe-west

[defaults]
input = Television
norm = PAL-I


scanning channel list europe-west...
<...>
21   (471.25 MHz): ???
[unknown (21)]
channel = 21

<...>
$
$ scantv -n PAL-I -f europe-west
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = europe-west

[defaults]
input = Television
norm = PAL-I


scanning channel list europe-west...
<...>
30   (543.25 MHz): ???
[unknown (30)]
channel = 30

<...>
$
$ scantv -n PAL-I -f europe-west
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = europe-west

[defaults]
input = Television
norm = PAL-I


scanning channel list europe-west...
<...>
40   (623.25 MHz): ???
[unknown (40)]
channel = 40

<...>
$
$ scantv -n PAL-I -f europe-west
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = europe-west

[defaults]
input = Television
norm = PAL-I


scanning channel list europe-west...
<...>
50   (703.25 MHz): ???
[unknown (50)]
channel = 50

<...>
$
$ scantv -n PAL-I -f europe-west
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = europe-west

[defaults]
input = Television
norm = PAL-I


scanning channel list europe-west...
<...>
60   (783.25 MHz): ???
[unknown (60)]
channel = 60

<...>
$
$ scantv -n PAL-I -f europe-west
vid-open-auto: using analog TV device /dev/video0
[global]
freqtab = europe-west

[defaults]
input = Television
norm = PAL-I


scanning channel list europe-west...
<...>
68   (847.25 MHz): ???
[unknown (68)]
channel = 68

<...>
$
$
$



