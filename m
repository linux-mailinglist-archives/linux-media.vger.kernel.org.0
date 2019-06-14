Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A141D4510B
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 03:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfFNBJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 21:09:40 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43699 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfFNBJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 21:09:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id z24so623718qtj.10
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2019 18:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aV94+7/kBRsQyxN3Ja8VvOedA1WaNneDPWTVpwe7CyY=;
        b=YVL85hv7g+XaUVvZfWNaihsjyjWHHeHGgKHno+2IU60cESJj7RdWJMkITA1lS/EldF
         hk1DCDZ9//kHrg6A/7/EKPOqUd39ad0EheyumdhKv5ZwL5Gk49k9zk1mHli6i8necM1H
         884KIRQnaqYG7k0Fy0gH/z5Cef58BxBM7DvDvqOjUvITGwW7oAg6tHZo5EMOdyHHSwXp
         7U86q/20gyD8J+t6H1wNC4mPMJYf65u2NhFePzu4VR3YU09EGvGSslT7d1isawZnDTvm
         DjjwaXeCT/AxMLph5nlvjlTtzlnM6kspK08Q5P6XrTLsUzO/R7ENBQZBOF0ARn8Hih/+
         raVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aV94+7/kBRsQyxN3Ja8VvOedA1WaNneDPWTVpwe7CyY=;
        b=FYhU+BegPOfrQHJv5y0DOkt3aC6cSOwzrL4U+npIHYXtEGNiBbw+KG3kWuyNF65Fum
         3D9DXGRRTmXjROCxAPYLrWscL69wfxmq9VP/3be/16wyL8dbFDOwlKqTuetIz8EdnJPv
         FGyLynbBIf6udQD2KtRZyUUXuAFr50qSEG6HeHK1veRw8ZzQJUgkfEbd0f0D2CmKk3uc
         ukGc4NdTLJokANqT2XujGhhCz4i6LiZVGz+F9wSGNaJMlWjaLJcnv4sGgQw0CeDzNezF
         Ysat9pOuzn1uf2joVSjucbNxnzugv/G0amO/JI5l5b8CGCkk2LHHNKTliMm+5QXU3IQw
         b0mQ==
X-Gm-Message-State: APjAAAW3QN52E272d/ObXjvBA3WAgu59V7pJVaoFRb9eyFr/y/NV0TqP
        mFOCKWIUjzqzpcAPH8P/Dtj2+qZW1U5fJgU3
X-Google-Smtp-Source: APXvYqz6ksGWfgSrSgvSCZx0YJDaVIVR53q3HMUG5QpfLRMBpfV1uWKf9AArTa+bsVwjMZBJZFGHAA==
X-Received: by 2002:a0c:d013:: with SMTP id u19mr5882260qvg.136.1560474578737;
        Thu, 13 Jun 2019 18:09:38 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id z126sm915024qkb.7.2019.06.13.18.09.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 18:09:37 -0700 (PDT)
Message-ID: <615f53383f8f65011d1ce3ec49f6d78b67b8ddea.camel@ndufresne.ca>
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
Date:   Thu, 13 Jun 2019 21:09:35 -0400
In-Reply-To: <259bb812-9cc9-8fe7-8fc6-2cbd5ef44ac3@xs4all.nl>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <259bb812-9cc9-8fe7-8fc6-2cbd5ef44ac3@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 13 juin 2019 à 08:48 +0200, Hans Verkuil a écrit :
> On 6/3/19 1:28 PM, Hans Verkuil wrote:
> > Since Tomasz was very busy with other things, I've taken over this
> > patch series. This v4 includes his draft changes and additional changes
> > from me.
> > 
> > This series attempts to add the documentation of what was discussed
> > during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> > later Embedded Linux Conference Europe 2014 in Düsseldorf and then
> > eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
> > video team (but mostly in a cosmetic way or making the document more
> > precise), during the several years of Chrome OS using the APIs in
> > production.
> > 
> > Note that most, if not all, of the API is already implemented in
> > existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
> > this series is just to formalize what we already have.
> > 
> > Thanks everyone for the huge amount of useful comments to previous
> > versions of this series. Much of the credits should go to Pawel Osciak
> > too, for writing most of the original text of the initial RFC.
> > 
> > This v4 incorporates all known comments (let me know if I missed
> > something!) and should be complete for the decoder.
> > 
> > For the encoder there are two remaining TODOs for the API:
> > 
> > 1) Setting the frame rate so bitrate control can make sense, since
> >    they need to know this information.
> > 
> >    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
> >    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
> >    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
> >    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
> >    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.
> 
> Alternative proposal:
> 
> 1) Add support for fractions (struct v4l2_fract) as a control type:
>    V4L2_CTRL_TYPE_FRACT.
> 
> 2) Add a new V4L2_CID_MPEG_FRAME_INTERVAL control.

Is the MPEG namespace historical ? That might be confusing for users.

> 
> Encoders shall support this control.
> 
> 3) For backwards compatibility reasons encoder drivers still have to
> support G/S_PARM, but this can now be implemented by standard helpers
> that query this control. Drivers also have to implement ENUM_FRAMEINTERVALS.

That's won't be very friendly for UI generator like qv4l2. Support for
v4l2_fract as control should include a way to describe the supported
values of that control the usual way I think.

Also, long term, it would be nice to have two sets of frame rates. The
one that the HW can handle "real-time" and the one that can be used for
bitrate calculation. So staying away from ENUM_FRAMEINTERVALS for
bitrate configuration would be nicer.

> If the range of intervals is always the same regardless of the frame size,
> then a helper can be used that queries the min/max/step of the control, but
> if it is dependent on the frame size, then it has to be implemented in the
> driver itself.
> 
> I'm sticking to frame intervals instead of frame rates for the simple reason
> that that's what V4L2 has used since the beginning. I think it is too confusing
> to change this to a frame rate. This is just my opinion, though.

I suggested frame rate since this is what I saw implemented by HW
registers (if you think it's worth it, I can try and make a list).
Also, frame-interval steps are not compatible with frame-rate steps
(something that was raised through a venus driver bug) last year. Even
v4l2-ctl was displaying that in a very confusing way. Something as
simple as 1 to 30 fps cannot be exposed through ENU_FRAMEINTERVALS. You
are forced to expose the full fractional range of interval, from 1/30
to 1/1. For Venus it was not that much of a trouble, since its stores a
framerate as Q16..

> 
> I also chose to make this a codec control, not a generic user control: this
> value together with the bit rate control(s) determine the compression size,
> it does not determine the actual time it takes for the encoder to compress
> the raw frames. Hence it is really not the same thing as the frame interval

That's a good point.

> of a video capture device. If we want to use a control for that as well in
> the future as a replacement for G/S_PARM, then that should be a new control.
> And we would like need per-pad controls as well in order to implement that.
> Which is a lot more work.
> 
> Regards,
> 
> 	Hans


