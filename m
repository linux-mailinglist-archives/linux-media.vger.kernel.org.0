Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF8C265F69
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 14:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgIKMUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 08:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgIKMSa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 08:18:30 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB337C061573;
        Fri, 11 Sep 2020 05:18:27 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id r8so7576388qtp.13;
        Fri, 11 Sep 2020 05:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=Cs/iobQYRqaFzLTEbvzarWAtlZcWcdH6WTrzD1iXXms=;
        b=IUSXE6G6aAvVETAfO/9wzVtAQbhmuaBANbZW856L+9qmoQGKQRJyQxoWowvBm4MdCU
         QsOiF2fwjEOKvOOpl+RiGRXx568y2k33MMaYgyAr37FN5R3p0YT21HaSF8WkUjZ6j8zw
         i7O0qUMzZhydCtO3XDbAbRNdN3deIogsj5+CyAVD8305408T52Z4OxGzKAGuPBIZYSaU
         RgL1gOXI9ZcKdMkX0GfjDVW3BTEHr1kwovGWs77Z1WziipDTnbM7o6ygaMI7ybQusCQS
         VVRobQWt6z5GMdnKXUhikh8Cg+dLNRACf4q88Aqh29j5tqYz0BB2GnxPjNUiCx7q73yD
         Rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=Cs/iobQYRqaFzLTEbvzarWAtlZcWcdH6WTrzD1iXXms=;
        b=lBskcOWFOao0vtE190xbz1qSXxAhXjzdR97AONHQP8Eo9Bdyg2LfQn64/8+oa2ktb8
         obwO77mSb6jp8lsEu9TgO9on3ly+bGT16ZftidIi59NvhjJZYjt/lOUWpG8cuNbmb93t
         jbsR1bDgZM8IdO+CHFrASS4+U8d018Tg3jBaw6qrKYdqBppPRwWcI5bHVVxYojhvB3ku
         wT2WPY/auA1/MbFlPSyduO4geSFdueLMiOz4nrO0iA25Y94qiqoMsz9k2qtmPvAvZJaC
         UPs5NuiX0cBjvhoOi3edQ+9U6rK6H+ZELqwd3ziFqgzoEg2WLbqHoWW2wBta8kNY5E4B
         g8cw==
X-Gm-Message-State: AOAM533hwEviA8q4lwognwIM8fIPUaKxMPMwl8uu4cuXbGooJmaW1WoI
        305KibrGUyPOZ0WNZNQOgPA=
X-Google-Smtp-Source: ABdhPJx1zaU8fB7FYIimQwDiXZm3pN0k86OKVpf8m5ton+2GLUPtSwQJ7gLWULRv1XFPbncBR3VlFA==
X-Received: by 2002:ac8:3933:: with SMTP id s48mr1524081qtb.294.1599826705565;
        Fri, 11 Sep 2020 05:18:25 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id r42sm2444052qtk.29.2020.09.11.05.18.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2020 05:18:25 -0700 (PDT)
Date:   Fri, 11 Sep 2020 09:18:20 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
        "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <25F257A6-C651-4BE7-8482-14FCF121D88F@getmailspring.com>
In-Reply-To: <20200911100200.25214c37@coco.lan>
References: <20200911100200.25214c37@coco.lan>
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

Hey Mauro,

> Thanks for all the hard work on it. Very much appreciated!
> 
> I finally found some time to test it. For now, just a quick
> test from my side, without passing any arguments to the
> driver.
> 

That's nice!

> My plan is to write some patches on the top of yours, in order to
> address the problems I'll find on it. If not something more critical
> won't be solved in time, we may still add it at staging/media. 
> Let's see.

OK

> 	3. dvbv5-zap wrote an empty audio file (without -P flag).
> 	   Probably there are still some issues at the program
> 	   channel descriptor or service;

I don't remember whether I tried this. I tried dumping the stream to a
file with dvbzap, which should work. By the way, I guess we should be
comparing the output to this

$ ffmpeg -f lavfi -i sine=frequency=1000:duration=5 -ac 2 -c:a s302m
-strict -2 out.ts

Since it produces a playable transport stream file that actually sounds
like a sine tone.

Inspecting ffmpeg & vidtv output side by side in dvbinspector, you'll
see that they're mostly the same. I have a separate PID for the PCR and
some other minor differences.



> 	4. The provider service field is null. Perhaps we could
> 	   add some string there, like "linuxtv.org".
> 	5. Maybe we could also add a simple NIT table, just to
> 	   avoid dvbv5-scan to wait for it until timeout.
> 
> Also, it probably makes sense to add a debugfs interface in
> order to allow injecting errors at the stream at runtime.

Sure. This is fun, sign me up for it.



As I said in a previous email, I think the buffer in vidtv_s302m.c is
not exactly what we want. It sounds like noise.

I got it from here:
https://www.daycounter.com/Calculators/Sine-Generator-Calculator.phtml

I will just copy what I had in a previous email here:

>How do I compute the values for a sine wave such that it can be played indefinitely?
>
>I was thinking about this: (just spitballing here..)
>
>sampling_rate_khz = 48000
>buffer_size = sampling_rate_khz * seconds
>i = 0
>
>for i < buffer_size:
>buffer[i] = 32767 * sin( 2 * PI * freq / (sampling_rate_khz * i) )
>
>
>but rather I want to precompute a single period for a given frequency
>such that I can loop on the array indefinitely



By the way, after some time trying out stuff, I guess this is actually
what we need in vidtv_s302m_write_frame:

static u32 vidtv_s302m_write_frame(struct vidtv_encoder *e,
				   u16 sample)
{
	u32 nbytes = 0;
	struct vidtv_s302m_frame_16 f = {};
	struct vidtv_s302m_ctx *ctx = e->ctx;

	/* from ffmpeg: see s302enc.c */

	u8 vucf = ctx->frame_index == 0 ? 1 : 0;

	f.data[0] = reverse[sample & 0xff];
	f.data[1] = reverse[(sample & 0xff00) >>  8];
	f.data[2] = (vucf << 4)  | (reverse[(sample & 0x0f)] >> 4);
	f.data[3] = reverse[(sample & 0x0ff0) >>  4];
	f.data[4] = reverse[(sample & 0xf000) >> 12] >> 4;

	nbytes += vidtv_memcpy(e->encoder_buf,
			       e->encoder_buf_offset,
			       VIDTV_S302M_BUF_SZ,
			       &f,
			       sizeof(f));

	e->encoder_buf_offset += nbytes;

	ctx->frame_index++;
	if (ctx->frame_index >= S302M_BLOCK_SZ)
		ctx->frame_index = 0;

	return nbytes;
}


i.e. see: https://docplayer.net/37828038-For-television-mapping-of-aes3-data-into-an-mpeg-2-transport-stream.html
Figure 5, page 4.




Lastly, I am somewhat new to C, so a few things might look odd here and
there. If you come across something that's too verbose tell me and I
will try to tidy it up.


--thanks
-- Daniel


