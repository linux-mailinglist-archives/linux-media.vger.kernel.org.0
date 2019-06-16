Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B078472A1
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 02:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfFPARR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 20:17:17 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42723 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfFPARQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 20:17:16 -0400
Received: by mail-qt1-f194.google.com with SMTP id s15so6859106qtk.9
        for <linux-media@vger.kernel.org>; Sat, 15 Jun 2019 17:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RPYWmNahK2vRVRc4rjpcgyBodD//N8htFDABC5qiKy4=;
        b=tvnVWwAKO+gxRapdBP9VjC96gXDZXuU7EIWkDpzqFfbNAW4CbwTrV+6JKz4OAF399n
         CtofDo10IxqiCyQ1Z9Bl+rRcI8uW/dldDVkrM4J216uKA6mFG3Y40UtRQMlnxPmxLz3u
         7fH7Xnp8LVuwCnOkTzYuMfwQmZAw+Vvm/xBnMBkgRhkoNcWJeZGDQ8jeucYsVSVYDfD1
         uxzLAyl3eIng/prCUNuD414rVQ4gC27JLrywce9IkVchYh7sc8c5BltEPh95QlaTOaj4
         i6ab/VyhV47WgOB85xrj/F4s1CbX+knKYOSRQwJfHev6Xvlg0vzU2OmcWutHNkjEJDYa
         OWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RPYWmNahK2vRVRc4rjpcgyBodD//N8htFDABC5qiKy4=;
        b=hJ39TLrI6Hbr8/pmFEUv2+gghBywyDT2mlnCQmNm33gDCdKHB2TCn9xVj8E9b8ZlhH
         Wz0o1VayieQ1l6Ya/3v636xeLV/D5VyfSwypv1hjUSI77Xj5jYp9cJTZrdd6muYlWkgA
         caMlW7zE0PkD72UtEHGbjdAjyLU6Z2d43NAp55U/K6PaXYX+7NQSUb6djnH6gnyRakPP
         pUSV5sAfJN8ejUjTSOWH37Nb1NU9uFd5aJ5MmPcSd+kjrUOLPSk9irke4Y54weED457S
         h2Qz2Fy/bSgZQt0KME7oj4prE04PCE7E5DsuPJbbulaPxbfZ6rDFPzollMG3g2iQ6t2s
         vGdw==
X-Gm-Message-State: APjAAAWp1cW73NsIL2OXw3PrRPtTaK70tLx7LNUAA85qhh9AumBrV6yP
        AI3la47n7zOiOgIqi4J18kT87w==
X-Google-Smtp-Source: APXvYqzog7sFeTixlNzo0cJnGdNsKtNwrbd57ULiUZdtTKqrVxb5B9rWMUEnNYBcSiTK3OGgjct43g==
X-Received: by 2002:ac8:17f7:: with SMTP id r52mr88871478qtk.235.1560644235462;
        Sat, 15 Jun 2019 17:17:15 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id y6sm3821837qki.67.2019.06.15.17.17.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 17:17:14 -0700 (PDT)
Message-ID: <e7660d9558e5fcb0cc040f7c71900706fa90dce1.camel@ndufresne.ca>
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Sat, 15 Jun 2019 20:17:12 -0400
In-Reply-To: <74c25415-01d4-eed6-c277-124a8ef1bf3e@xs4all.nl>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <259bb812-9cc9-8fe7-8fc6-2cbd5ef44ac3@xs4all.nl>
         <615f53383f8f65011d1ce3ec49f6d78b67b8ddea.camel@ndufresne.ca>
         <74c25415-01d4-eed6-c277-124a8ef1bf3e@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le samedi 15 juin 2019 à 10:08 +0200, Hans Verkuil a écrit :
> On 6/14/19 3:09 AM, Nicolas Dufresne wrote:
> > Le jeudi 13 juin 2019 à 08:48 +0200, Hans Verkuil a écrit :
> > > On 6/3/19 1:28 PM, Hans Verkuil wrote:
> > > > Since Tomasz was very busy with other things, I've taken over this
> > > > patch series. This v4 includes his draft changes and additional changes
> > > > from me.
> > > > 
> > > > This series attempts to add the documentation of what was discussed
> > > > during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> > > > later Embedded Linux Conference Europe 2014 in Düsseldorf and then
> > > > eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
> > > > video team (but mostly in a cosmetic way or making the document more
> > > > precise), during the several years of Chrome OS using the APIs in
> > > > production.
> > > > 
> > > > Note that most, if not all, of the API is already implemented in
> > > > existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
> > > > this series is just to formalize what we already have.
> > > > 
> > > > Thanks everyone for the huge amount of useful comments to previous
> > > > versions of this series. Much of the credits should go to Pawel Osciak
> > > > too, for writing most of the original text of the initial RFC.
> > > > 
> > > > This v4 incorporates all known comments (let me know if I missed
> > > > something!) and should be complete for the decoder.
> > > > 
> > > > For the encoder there are two remaining TODOs for the API:
> > > > 
> > > > 1) Setting the frame rate so bitrate control can make sense, since
> > > >    they need to know this information.
> > > > 
> > > >    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
> > > >    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
> > > >    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
> > > >    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
> > > >    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.
> > > 
> > > Alternative proposal:
> > > 
> > > 1) Add support for fractions (struct v4l2_fract) as a control type:
> > >    V4L2_CTRL_TYPE_FRACT.
> > > 
> > > 2) Add a new V4L2_CID_MPEG_FRAME_INTERVAL control.
> > 
> > Is the MPEG namespace historical ? That might be confusing for users.
> 
> Yes, it's historical. I have toyed with the idea of renaming all the
> defines to something like V4L2_CID_CODEC_... (keeping the old defines, of
> course), but I'm not sure it is worth it.
> 
> > > Encoders shall support this control.
> > > 
> > > 3) For backwards compatibility reasons encoder drivers still have to
> > > support G/S_PARM, but this can now be implemented by standard helpers
> > > that query this control. Drivers also have to implement ENUM_FRAMEINTERVALS.
> > 
> > That's won't be very friendly for UI generator like qv4l2. Support for
> > v4l2_fract as control should include a way to describe the supported
> > values of that control the usual way I think.
> 
> Such a control will definitely have the usual min/max/step/default control
> values.
> 
> > Also, long term, it would be nice to have two sets of frame rates. The
> > one that the HW can handle "real-time" and the one that can be used for
> > bitrate calculation. So staying away from ENUM_FRAMEINTERVALS for
> > bitrate configuration would be nicer.
> 
> I'm not sure if that's feasible in practice, although the idea is nice.
> The 'real-time' framerate will likely depend to a huge extent on the
> frequency of various internal clocks and the content of the bitstream.
> 
> I suspect it will be very hard if not impossible to report realistic
> ENUM_FRAMEINTERVAL values for codecs.
> 
> > > If the range of intervals is always the same regardless of the frame size,
> > > then a helper can be used that queries the min/max/step of the control, but
> > > if it is dependent on the frame size, then it has to be implemented in the
> > > driver itself.
> > > 
> > > I'm sticking to frame intervals instead of frame rates for the simple reason
> > > that that's what V4L2 has used since the beginning. I think it is too confusing
> > > to change this to a frame rate. This is just my opinion, though.
> > 
> > I suggested frame rate since this is what I saw implemented by HW
> > registers (if you think it's worth it, I can try and make a list).
> > Also, frame-interval steps are not compatible with frame-rate steps
> > (something that was raised through a venus driver bug) last year. Even
> > v4l2-ctl was displaying that in a very confusing way. Something as
> > simple as 1 to 30 fps cannot be exposed through ENU_FRAMEINTERVALS. You
> > are forced to expose the full fractional range of interval, from 1/30
> > to 1/1. For Venus it was not that much of a trouble, since its stores a
> > framerate as Q16..
> 
> Since this is used for bitrate calculations, and not for determining the
> exact framerate, I'm not sure it matters all that much in this particular
> case. Since you still need to implement G/S_PARM in drivers for backwards
> compatibility reasons I think it is easiest to keep using frame interval
> instead of frame rate.
> 
> Actually, that raises a new question: are there codecs that store the frame rate
> in the bitstream? I haven't heard of that, so I suspect not, but I'm not certain.

Yes, H264 and HEVC have the VUI SEI. In HEVC you can also pass this in
VPS. Both are fractions. I'm not certain, but I think you can embed a
timecode, and these also have the fps.

For stateful encoder, it's always nice if the encoder can produce the
SEI/VPS bit. The worst that could happen is an IP that always produce
that information, and userspace that didn't set anything.

For decoders, it's not something I really care about, since I we do
parse this in GStreamer. That being said, I know that the firmware on
the ZynqMP uses the framerate to calculate the number of cores it uses.
So if you don't pass it, it will chose base on the maximum for the
profile/level, which may greatly reduce the number of concurrent
streams you can run.

> 
> Regards,
> 
> 	Hans
> 
> > > I also chose to make this a codec control, not a generic user control: this
> > > value together with the bit rate control(s) determine the compression size,
> > > it does not determine the actual time it takes for the encoder to compress
> > > the raw frames. Hence it is really not the same thing as the frame interval
> > 
> > That's a good point.
> > 
> > > of a video capture device. If we want to use a control for that as well in
> > > the future as a replacement for G/S_PARM, then that should be a new control.
> > > And we would like need per-pad controls as well in order to implement that.
> > > Which is a lot more work.
> > > 
> > > Regards,
> > > 
> > > 	Hans

