Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB55181C22
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 16:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgCKPQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 11:16:30 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43799 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbgCKPQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 11:16:30 -0400
Received: by mail-qk1-f194.google.com with SMTP id q18so2377794qki.10
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YfeEZNntQatr2rfVTp26Dszgk98dSuoaAz+RqyxG8zA=;
        b=a0/l+cWGS7TaNDHLW5zyOeUwEmubnMinF2vIxx2qiNzANgT7HHgTlLN9dXPka1KSoC
         p+nNQx6XWD4agqQaJLMw+htNP58jagGxXvwtD2oMwzQOALxzpkRLuSwiqUz3h+5x7Bfj
         e/7i3xaGltvschGa41kBgqyXjrO/k5iUtNhItUPTvuGizc6VnpgrsUXNAIB847Azqte/
         FApuKp+czTcPGq0g9ADPNUJBYAYPCzQ8nuWzTC5ohhDf0oYLJOdn79pIju1hQIvw/2nf
         hwAtMkGzCuD+NFaVqz/1+18vP6n3HpwncQF+9ufm4CJHPNVUGisUn7dGCV2AvNDFBHnY
         Vijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YfeEZNntQatr2rfVTp26Dszgk98dSuoaAz+RqyxG8zA=;
        b=EKQwnV60ZuDkPpNa8YnuGEBaEna+Enda1gP7bjT5pCiJRih4AweHuGV1aHlsxxxx01
         l+Fch2ZvXcWnZJLgLHBDP+VveKTm7p9zJTQ9nMvIhy9SDJLcyORBcXBgR82rkCClBvIC
         MQK0Pov/KEZ3uoD1McrdumS/xWwJezekHJh7dRxTN8m54GMKLDIplZql1NH3KYVem1Vu
         xxzUKIMZqB9u4dQOhcQr36hXjqFrTQT0joHuC+kiA0PMraN08HFjA+Hj3JDd7P424I4o
         47lNoiiOy87GSr1xaAdqpEiis7BrChi3zydYJWhXdYg70IHkmczVlTL12YmEpewDqiiZ
         tR9A==
X-Gm-Message-State: ANhLgQ2nkNwwFa9uA+WFWd0ynhV1Td4JZeq1quM4pOjoruOuzeQZ7AB+
        fALW/3D9MR582X/H5VGgqzou2t595OQ=
X-Google-Smtp-Source: ADFU+vvLEVQTOrs8t1sfQYZOuputZv7223A0tpVXFucfC1zR1jut+OIDuFYrQYURjsZ/OwW0+gLxYA==
X-Received: by 2002:a37:b002:: with SMTP id z2mr3155537qke.289.1583939787174;
        Wed, 11 Mar 2020 08:16:27 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2610:98:8005::527])
        by smtp.gmail.com with ESMTPSA id z11sm8038468qti.23.2020.03.11.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 08:16:18 -0700 (PDT)
Message-ID: <a60bb7221c23161929aefeb09b5617bb170f93a1.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] Stateful Encoding: final bits
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Date:   Wed, 11 Mar 2020 11:16:16 -0400
In-Reply-To: <20191220144734.31667e9c@litschi.hi.pengutronix.de>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
         <20191220144734.31667e9c@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 20 décembre 2019 à 14:47 +0100, Michael Tretter a écrit :
> Hello Hans,
> 
> On Tue, 19 Nov 2019 12:34:52 +0100, Hans Verkuil wrote:
> > This series adds support for fractions in the control framework,
> > and a way to obtain the min and max values of compound controls
> > such as v4l2_fract.
> > 
> > Next it adds the V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to
> > set the framerate for the encoder.
> > 
> > The next patch adds support for the V4L2_BUF_FLAG_TOO_SMALL flag
> > to signal that the capture buffer was too small.
> > 
> > The final patch adds the encoder spec (unchanged from v3).
> > 
> > Michael, can you add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
> > to your encoder driver? Let me know if something isn't working.
> 
> I implemented the control and hooked it up with S_PARM as well. The
> implementation was straightforward without any real issues. I'll send a
> patch in reply to this mail. Having a control for configuring the frame
> rate that is encoded into the SPS feels correct. This is in line with
> configuring the bitrate, level, etc.
> 
> However, after seeing the implementation and fiddling around with it in
> userspace, I am not convinced that S_PARM should be used signal the
> rate at which frames are submitted.
> 
> Setting the frame submission rate to something different than the
> frame rate of the stream would be most interesting for transcoding use
> cases. The user space would either want to run the encoding as fast as
> possible or, if there are multiple encoding processes, as fast as
> possible with properly shared resources. Boiling this information down
> into a single number (and calling is "rate at which frames are
> submitted") sounds kind of wrong, because the userspace does not know
> which submission rate would lead to a good result.
> 
> Using the frame rate for such a setting seems pretty unique to the
> allegro encoder. Other encoders might use different mechanisms to boost
> the encoding speed, e.g., might be able to temporarily increase the
> clock rate of the codec. In these cases, the driver would need to
> translate the "framerate" set via S_PARM to a clock rate for the codec.
> This does not sound right.
> 
> However, in the end, this would lead to exposing single parameters that
> allow to tune the codec via generic controls. This does not seem to be
> the right way, at all. Maybe we could have a control that tells the
> encoder to "run as fast as possible" or to "run with as little
> resources as possible", which would be applicable to more encoders and
> the driver would have to decide how to implement this "profile".
> 
> Still, I am not really sure, if this is the proper way to solve this.
> 
> > I need to add a test control for this to vivid as well and add support
> > for this to v4l2-ctl, that's on my TODO list.
> > 
> > Open questions:
> > 
> > 1) Existing encoder drivers use S_PARM to signal the frameperiod,
> > but as discussed in Lyon this should be the rate at which frames are
> > submitted for encoding, which can be different from
> > V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE. But given the current use-cases
> > I was wondering if calling S_PARM should set the ENC_FRAME_RATE
> > control as well, and you would need to explicitly set the control
> > after S_PARM if the two are not the same. This would mean that
> > existing applications that don't know about the control can keep working.
> 
> In the patch I did exactly that and we should be backwards compatible
> to applications that use only S_PARM.

As per today's IRC discussion, adding a new FRAME_RATE control will in the end
only move a functionality from one place to another with a different form. If we
want to be reasonnable, despite our common dislike of s_parm, I believe we
should stay were we are with S_PARM, and just make sure drivers don't use this
to scale the HW performance, or not make this the default at least.

In the end, the S_PARM will tell the encoder what to do for CBR with a B/s
configuration and will allow the driver to calculate the contraints to be
written into bitstream headers when supported by the bitstream.

What I'm suggesting for now is to scope out this change until we have a better
reason to ask userspace folks to port. Is that reasonnable ? And we can forcus
on other aspects.

> 
> Michael

