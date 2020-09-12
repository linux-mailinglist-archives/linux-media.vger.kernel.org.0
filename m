Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA7B267B0C
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgILOvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgILOtR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:49:17 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00060C061573;
        Sat, 12 Sep 2020 07:49:06 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id r8so10155734qtp.13;
        Sat, 12 Sep 2020 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=VIl8oc5v5kZHCnLewFAw9Hm4WzGzc8lZoGkyc1yZSGg=;
        b=OhWSmM+j6Ushw+TOLq8Paac0y/kTpOQ57F92Bc24OvDxcz/sX3g5ne3/sjpcJ94kOC
         vas5DOvGZQD3XnPnv7NMv+SrJlSCKq0U7IeWsmoIctiBA35HfZuwzacKg26kGUaRzd+f
         PzuhwcbY6rk+2mQh3h6SN8xAx2Omr4YbsAmCMvCoMMbUjyyYOsRBaD0P4jJ7IzCM/HgB
         j8sTI5DQSddnoxAD64yASNyFE74ZIgJZsGLf5PaN9Tu742ZZzYXu78+F1QlDZ6WqMxI5
         6gA2aC4VbUqH3a2XB/LKsvQWYtkIYo8gIl56pixCC7SoHTcpx6QBzO24gnwz+ySXap7P
         /I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=VIl8oc5v5kZHCnLewFAw9Hm4WzGzc8lZoGkyc1yZSGg=;
        b=RTG1GWuQ0Cvo31m32sYPKZC9xzs/mSJ4yDQ54c1M4UBRoQyr5lrrAkAu2BXtGgS/eD
         m4ZUh0S5MrEDlh0Lr5dZ5NdCyWs7rSQ3jPkaCJ0ywrBNb5EQ6KJakApTJLGXpDIyjdoO
         fyDFmKrA7OUlvlkLymXMsBGCijvBTT5MqSAv01DMCv9zUhVML5AA6iATXVy0Uikf69t6
         laTYTbdWaTi9Oq1qdI2XIrDd+Fid+68ujRfmp5E8feajHpNfk9P0bgvuXOYVxSrTv6XR
         DnaSUcfEj2hesQ9lDOliAotKB9Zecxm+APSFPqXjiFdzgFupdfbfed17WTXAd0Xw03rp
         oswQ==
X-Gm-Message-State: AOAM532XXzzA/aYXiG7RaGailhaH3f0t+8Y3abta0YTIXDHb4vpu48Vp
        ESvnUfQxJ/WUs3/0R4R7+muabHaxtigunw==
X-Google-Smtp-Source: ABdhPJwdK6yoyN6rPp1ADzpOBTulPM9j81xXYdaDM9bskGm9V+vOJFWEQJtXIGsQF8OP5SVIVQM4WA==
X-Received: by 2002:ac8:d01:: with SMTP id q1mr6600235qti.276.1599922146141;
        Sat, 12 Sep 2020 07:49:06 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id u55sm7781126qtu.42.2020.09.12.07.49.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Sep 2020 07:49:05 -0700 (PDT)
Date:   Sat, 12 Sep 2020 11:49:01 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
        "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <15028D87-A496-4CAD-91A6-E4467489C4D0@getmailspring.com>
In-Reply-To: <20200912111506.2d2bd512@coco.lan>
References: <20200912111506.2d2bd512@coco.lan>
Subject: Re: [v10 0/4] media: vidtv: Implement a virtual DVB driver
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans and Mauro & all


>Why the dvb_ prefix? All virtual drivers just start with 'vi'.
>
>And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
>Just like the other virtual media drivers?

I guess Mauro was the one to come up with the dvb_* prefix for the
kernel modules for the reasons he explicited up in this thread. 

As far as dvb_vidtv_bridge.ko and vidtv_bridge.c, I just wanted to be
verbose so that people would look at this and see that it is the code
for a bridge driver, since this is also supposed to be a template. 

Also because I had some trouble myself figuring out what was what when
first browsing through other dvb drivers. That said, I am 100% onboard
with renaming this to vidtv.ko or whatever seems more appropiate :)


>Yet, I agree with you that at least an alias is needed.
>earlier today, I wrote a patch with such purpose:

If you all would like to just leave this at that ^ I am also ok with it.

>For regression testing of vidtv during the daily build it would be
great if
>the contrib/test/test-media script can be enhanced to include vidtv.

Sure, I can do that if you'd like. Can you provide some tips on how to
get started? :)

>Note that this script relies on the /dev/mediaX devices to run the
tests. I
>noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
>CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would
be good
>to support in vidtv.

I didn't write any code for this specifically. I was under the
impression that the dvb core would create any/all the necessary files. Mauro?


>I'm thinking on something like:
>
>echo 1 >/sys/kernel/debug/vidtv/discontinuity
>
>to generate a frame numbering discontinuity
>
>and other things like that, changing S/N ratio and other parameters
>and injecting errors, in order to test the effects on user apps.

Can you provide an initial list of things you would like to see? I can
then implement these and we can go from there

When you say 'frame numbering discontinuity', do you mean having a gap
in the the TS continuity counter for a given pid?

For the s302m encoder, maybe we can add some noise to the samples?

> changing S/N ratio

Btw 'lose lock if signal goes bad' code in vidtv_tuner.c and
vidtv_demod.c does not work currently. Mainly because they expect an
array of valid frequencies to compare to and as of now there's no default.

I mean these, just to be clear:

static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS];
module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
  		 "Valid DVB-T frequencies to simulate");

static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS];
module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
		 "Valid DVB-C frequencies to simulate");

static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS];
module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
		 "Valid DVB-C frequencies to simulate");

static unsigned int max_frequency_shift_hz;
module_param(max_frequency_shift_hz, uint, 0);
MODULE_PARM_DESC(max_frequency_shift_hz,
		 "Maximum shift in HZ allowed when tuning in a channel")






> No. I meant the audio was not a sinusoidal wave after such change.

This encoder is dead simple and yet I have been struggling :/

Here is the relevant decoding code in libavcodec/s302m.c:

        for (; buf_size > 4; buf_size -= 5) {
            *o++ = (ff_reverse[buf[1]]        <<  8) |
                    ff_reverse[buf[0]];
            *o++ = (ff_reverse[buf[4] & 0xf0] << 12) |
                   (ff_reverse[buf[3]]        <<  4) |
                   (ff_reverse[buf[2]]        >>  4);
            buf += 5;
        }

I am somewhat confident that the opposite to the above is precisely what
I sent you last:

> f.data[0] = reverse[sample & 0xff];
> f.data[1] = reverse[(sample & 0xff00) >> 8];
> f.data[2] = (vucf << 4) | (reverse[(sample & 0x0f)] >> 4);
> f.data[3] = reverse[(sample & 0x0ff0) >> 4];
> f.data[4] = reverse[(sample & 0xf000) >> 12] >> 4;


Their encoder, which works perfectly of course, is:

libavcodec/s302menc.c:

        for (c = 0; c < frame->nb_samples; c++) {
            uint8_t vucf = s->framing_index == 0 ? 0x10 : 0;

            for (channels = 0; channels < avctx->channels; channels +=
2) {
                o[0] = ff_reverse[ samples[0] & 0xFF];
                o[1] = ff_reverse[(samples[0] & 0xFF00) >>  8];
                o[2] = ff_reverse[(samples[1] & 0x0F)   <<  4] | vucf;
                o[3] = ff_reverse[(samples[1] & 0x0FF0) >>  4];
                o[4] = ff_reverse[(samples[1] & 0xF000) >> 12];
                o += 5;
                samples += 2;

            }

            s->framing_index++;
            if (s->framing_index >= 192)
                s->framing_index = 0;
        }

In which samples[0] and samples[1] are the same for stereo audio.

If you feel like we should only address this later I can drop this
subject but as we've both established, the encoder in v10 is flat out
wrong. Your call :)


-- thanks
-- Daniel

