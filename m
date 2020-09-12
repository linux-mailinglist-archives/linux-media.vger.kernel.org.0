Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1EF267BB0
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 19:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgILR5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 13:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:52908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgILR5I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 13:57:08 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C17F21531;
        Sat, 12 Sep 2020 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599933427;
        bh=vWGS1ICIppQE/e9T063JOQjXLg2lT6e/3x7rhMn9DWY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s8pSi39WG9ZHY9HiJC6w8Mt/EcjYFH3JbjmugWFrRnFk1RfMfaetGQlsKDwHTxTyp
         D4eO2b2qm4KOaXPIsDWltHY6VGz4SnOz3evAcEGzoXO1trbL6pyBuSHIT3MU4Bj5ve
         LxFpxxMNkm/HglxcfVBsEAgw7oFOZqZv2D0JlQ/8=
Date:   Sat, 12 Sep 2020 19:57:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
        "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [v10 0/4] media: vidtv: Implement a virtual DVB driver
Message-ID: <20200912195702.58f71f8f@coco.lan>
In-Reply-To: <15028D87-A496-4CAD-91A6-E4467489C4D0@getmailspring.com>
References: <20200912111506.2d2bd512@coco.lan>
        <15028D87-A496-4CAD-91A6-E4467489C4D0@getmailspring.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 12 Sep 2020 11:49:01 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Hans and Mauro & all
> 
> 
> >Why the dvb_ prefix? All virtual drivers just start with 'vi'.
> >
> >And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
> >Just like the other virtual media drivers?  
> 
> I guess Mauro was the one to come up with the dvb_* prefix for the
> kernel modules for the reasons he explicited up in this thread. 
> 
> As far as dvb_vidtv_bridge.ko and vidtv_bridge.c, I just wanted to be
> verbose so that people would look at this and see that it is the code
> for a bridge driver, since this is also supposed to be a template. 
> 
> Also because I had some trouble myself figuring out what was what when
> first browsing through other dvb drivers. That said, I am 100% onboard
> with renaming this to vidtv.ko or whatever seems more appropiate :)

Let us think a little bit about that. 

> 
> 
> >Yet, I agree with you that at least an alias is needed.
> >earlier today, I wrote a patch with such purpose:  
> 
> If you all would like to just leave this at that ^ I am also ok with it.
> 
> >For regression testing of vidtv during the daily build it would be  
> great if
> >the contrib/test/test-media script can be enhanced to include vidtv.  
> 
> Sure, I can do that if you'd like. Can you provide some tips on how to
> get started? :)

Hans can explain it better, but the hole idea is to have a set of
userspace apps that will ensure that drivers will properly implement
the DVB API.

I suspect that, before that (or together with such tooling), we need
to properly implement the frontend ioctl, validating the per delivery
system parameters, as, right now, it just accepts anything from
userspace. 

> >Note that this script relies on the /dev/mediaX devices to run the  
> tests. I
> >noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
> >CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would  
> be good
> >to support in vidtv.  
> 
> I didn't write any code for this specifically. I was under the
> impression that the dvb core would create any/all the necessary files. Mauro?

It should be easy to implement support for it. The core does almost
everything. Drivers just need to initialize the media controller.

See for example:
	drivers/media/usb/em28xx/em28xx-dvb.c


> >I'm thinking on something like:
> >
> >echo 1 >/sys/kernel/debug/vidtv/discontinuity
> >
> >to generate a frame numbering discontinuity
> >
> >and other things like that, changing S/N ratio and other parameters
> >and injecting errors, in order to test the effects on user apps.  
> 
> Can you provide an initial list of things you would like to see? I can
> then implement these and we can go from there

Well, things that could help identifying bugs on userspace...

> 
> When you say 'frame numbering discontinuity', do you mean having a gap
> in the the TS continuity counter for a given pid?

... like this. Yeah, adding a gap a TS continuity counter.

Other things could be to add noise to frames and increment the
dvbv5-stat numbers and shifting bits and/or dropping 188-byte frames.

With that regards, I'm planning to add support for dvb5-stat 
myself, as this should be trivial for me. Once support gets
added, changing the stats is just a matter of increment
some counters at fe cache.

> 
> For the s302m encoder, maybe we can add some noise to the samples?

Yes.

> 
> > changing S/N ratio  
> 
> Btw 'lose lock if signal goes bad' code in vidtv_tuner.c and
> vidtv_demod.c does not work currently. Mainly because they expect an
> array of valid frequencies to compare to and as of now there's no default.
> 
> I mean these, just to be clear:
> 
> static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS];
> module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
> MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
>   		 "Valid DVB-T frequencies to simulate");
> 
> static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS];
> module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
> MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
> 		 "Valid DVB-C frequencies to simulate");
> 
> static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS];
> module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
> MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
> 		 "Valid DVB-C frequencies to simulate");
> 
> static unsigned int max_frequency_shift_hz;
> module_param(max_frequency_shift_hz, uint, 0);
> MODULE_PARM_DESC(max_frequency_shift_hz,
> 		 "Maximum shift in HZ allowed when tuning in a channel")

Yes, I know (btw, there's a bug on its implementation - I'm working
on a fix ATM).

There are two different things here. With the above, you're
simulating tuning at a wrong frequency.

Another thing would be to have a parameter forcing errors.

This can be helpful to dynamically inject errors on a tuned
channel, and see how apps will behave.

> > No. I meant the audio was not a sinusoidal wave after such change.  
> 
> This encoder is dead simple and yet I have been struggling :/

:-)

That happens. As I said, for now this is not too important.
The way it is, it is already possible to test userspace.

Yet, it would be nice to get it fixed, and maybe change
the code in the future to play some simple public
domain music (or maybe some random music using for example
a pentatonic scale). Avoiding a single periodic waveform
can help tracking other issues when there are package drops.

> 
> Here is the relevant decoding code in libavcodec/s302m.c:
> 
>         for (; buf_size > 4; buf_size -= 5) {
>             *o++ = (ff_reverse[buf[1]]        <<  8) |
>                     ff_reverse[buf[0]];
>             *o++ = (ff_reverse[buf[4] & 0xf0] << 12) |
>                    (ff_reverse[buf[3]]        <<  4) |
>                    (ff_reverse[buf[2]]        >>  4);
>             buf += 5;
>         }
> 
> I am somewhat confident that the opposite to the above is precisely what
> I sent you last:
> 
> > f.data[0] = reverse[sample & 0xff];
> > f.data[1] = reverse[(sample & 0xff00) >> 8];
> > f.data[2] = (vucf << 4) | (reverse[(sample & 0x0f)] >> 4);
> > f.data[3] = reverse[(sample & 0x0ff0) >> 4];
> > f.data[4] = reverse[(sample & 0xf000) >> 12] >> 4;  
> 
> 
> Their encoder, which works perfectly of course, is:
> 
> libavcodec/s302menc.c:
> 
>         for (c = 0; c < frame->nb_samples; c++) {
>             uint8_t vucf = s->framing_index == 0 ? 0x10 : 0;
> 
>             for (channels = 0; channels < avctx->channels; channels +=
> 2) {
>                 o[0] = ff_reverse[ samples[0] & 0xFF];
>                 o[1] = ff_reverse[(samples[0] & 0xFF00) >>  8];
>                 o[2] = ff_reverse[(samples[1] & 0x0F)   <<  4] | vucf;
>                 o[3] = ff_reverse[(samples[1] & 0x0FF0) >>  4];
>                 o[4] = ff_reverse[(samples[1] & 0xF000) >> 12];
>                 o += 5;
>                 samples += 2;
> 
>             }
> 
>             s->framing_index++;
>             if (s->framing_index >= 192)
>                 s->framing_index = 0;
>         }
> 
> In which samples[0] and samples[1] are the same for stereo audio.
> 
> If you feel like we should only address this later I can drop this
> subject but as we've both established, the encoder in v10 is flat out
> wrong. Your call :)

Well, if you're confident and had it tested, feel free to submit
a patch ;-)

Thanks,
Mauro
