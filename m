Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9C3141798
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2020 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgARNOL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jan 2020 08:14:11 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40136 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728688AbgARNOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jan 2020 08:14:11 -0500
Received: by mail-qk1-f194.google.com with SMTP id c17so25580517qkg.7
        for <linux-media@vger.kernel.org>; Sat, 18 Jan 2020 05:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ipJnENm92tONi4RWbdh0snWRdszAjntq3m+L0rHWSpY=;
        b=TUtRV/G/AYPFtVTLJq6lYk4DSXJ1qzKNKFFgl640Jx4iRRenK6mJMYrLY0Pss10Tm7
         WLuCUagKMWaKk4Aanx44WhZewSxKOBlFgZ6x2lOectjiLTPkW0NbnU7ioHVom6ETZNri
         eRCEwgcOMOunuGOoincA+TmDF2eWJsqlQ0Ogr67Zol01CDIzXYxWpWwn+rbdzuZKFssA
         HYLY7tvqjwcseFKG4ItnR4fNR0nb5/3ZW4kZXQDkZTCijKblr4UE44gB9pt219MGuTd9
         qGC4vbBkw4cniDdvjBoz2fZhZBXJc2LUTvi4n11lXxXzgYh1Umyy4s+OfhQLQF2Ic/nf
         poew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ipJnENm92tONi4RWbdh0snWRdszAjntq3m+L0rHWSpY=;
        b=WKL8sKTrmd7Rcao1REgldoT+SgwPIohRGu1MjzFl8UyafB2Y4XurG6iCcaSQ8eV6OV
         Q5ZgwHmTtcdoqiheXokdlvcEN0OcUyhGnynleNtNMviqdhU2Y+hULuZzcaLnTT8j1W6u
         d1o7ZuVUvcEtbCw+yXp/wDqOuUTLOy8HtlSOZNWR5IAG0bDyJEWQnXbIUA+oW5SGMgXS
         GBSjb9ZcLoyHPs7SDSEioQ2cp6Z3HZG+fcCmKQdmpiYu+t/tULv/WJBYr8LiZwNDuTSi
         9TMB4YVi53qfllbL2cq7KNXJORSdqb3H3RUvjUidmpa5V3xaXCkzXIooW1kbD+wjgYY/
         e8tw==
X-Gm-Message-State: APjAAAXin/eG3ZlJEymYFTMlRWNe/jApfKDw2fpfy+6guMS1rr4mWQbd
        w4NPBRCgC3Gaw2Xcd6r7yrCIwA==
X-Google-Smtp-Source: APXvYqwNpMyG5dQ/EEU73vRRsyp0Drr0DaxV6Ougxn/x4c8ND22mF7vR+kfmPEA2quUiZZoFf9rXaA==
X-Received: by 2002:a37:3d8:: with SMTP id 207mr41865601qkd.335.1579353249670;
        Sat, 18 Jan 2020 05:14:09 -0800 (PST)
Received: from nicolas-tpx395 ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id d26sm13031035qka.28.2020.01.18.05.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 05:14:08 -0800 (PST)
Message-ID: <ba1205ec1baca58e72e788da3cd0864a2527d059.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] Stateful Encoding: final bits
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Date:   Sat, 18 Jan 2020 08:14:07 -0500
In-Reply-To: <eeb55c72-2abd-8ce9-a352-1247a366ce9a@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
         <20191220144734.31667e9c@litschi.hi.pengutronix.de>
         <eeb55c72-2abd-8ce9-a352-1247a366ce9a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 06 janvier 2020 à 16:02 +0100, Hans Verkuil a écrit :
> (Added Nicolas as I'd like his input as well)

Sorry for the delay, I was pretty far behind on tracking this ML.

> 
> Reply below:
> 
> On 12/20/19 2:47 PM, Michael Tretter wrote:
> > Hello Hans,
> > 
> > On Tue, 19 Nov 2019 12:34:52 +0100, Hans Verkuil wrote:
> > > This series adds support for fractions in the control framework,
> > > and a way to obtain the min and max values of compound controls
> > > such as v4l2_fract.
> > > 
> > > Next it adds the V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to
> > > set the framerate for the encoder.
> > > 
> > > The next patch adds support for the V4L2_BUF_FLAG_TOO_SMALL flag
> > > to signal that the capture buffer was too small.
> > > 
> > > The final patch adds the encoder spec (unchanged from v3).
> > > 
> > > Michael, can you add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
> > > to your encoder driver? Let me know if something isn't working.
> > 
> > I implemented the control and hooked it up with S_PARM as well. The
> > implementation was straightforward without any real issues. I'll send a
> > patch in reply to this mail. Having a control for configuring the frame
> > rate that is encoded into the SPS feels correct. This is in line with
> > configuring the bitrate, level, etc.
> > 
> > However, after seeing the implementation and fiddling around with it in
> > userspace, I am not convinced that S_PARM should be used signal the
> > rate at which frames are submitted.
> > 
> > Setting the frame submission rate to something different than the
> > frame rate of the stream would be most interesting for transcoding use
> > cases. The user space would either want to run the encoding as fast as
> > possible or, if there are multiple encoding processes, as fast as
> > possible with properly shared resources. Boiling this information down
> > into a single number (and calling is "rate at which frames are
> > submitted") sounds kind of wrong, because the userspace does not know
> > which submission rate would lead to a good result.
> > 
> > Using the frame rate for such a setting seems pretty unique to the
> > allegro encoder. Other encoders might use different mechanisms to boost
> > the encoding speed, e.g., might be able to temporarily increase the
> > clock rate of the codec. In these cases, the driver would need to
> > translate the "framerate" set via S_PARM to a clock rate for the codec.
> > This does not sound right.
> > 
> > However, in the end, this would lead to exposing single parameters that
> > allow to tune the codec via generic controls. This does not seem to be
> > the right way, at all. Maybe we could have a control that tells the
> > encoder to "run as fast as possible" or to "run with as little
> > resources as possible", which would be applicable to more encoders and
> > the driver would have to decide how to implement this "profile".
> > 
> > Still, I am not really sure, if this is the proper way to solve this.
> 
> I think you raise good points.
> 
> So this means that we need this new control (required for stateful encoders)
> and optionally allow S_PARM to be used as an alternative way to set the
> same control.

Indeed that rase a strong point. In all scenarios I have in mind you're analyses
is correct. It's binary:

  a) This is live and then the frame rate and the speed matches
  b) This is offline processing, and then we'd like to use as much power as possible

What I think is important in what you raise, is that unlike the Allegro encoder,
other encoders may be able to control usage in a more dynamic ways which indeed
is not guarantied to correlate with framerate (could be utilisation driver clock
scaling). Then yes, a control to tell the Allegro encoder that we are doing
offline processing would work, though it can be optional, as other encoder with
more dynamic performance scaling won't need that hint to work.

> 
> I prefer to make S_PARM optional and require the control, since I hate S_PARM
> :-)
> 
> It would mean that all existing stateful encoders need to implement this new
> control, but I think that's a good idea anyway.

I share your preference, but that means more userspace backward compatibility
code is needed. Notably, I'll have try the new one and fallback for this case to
stay compatible with older kernel.

> 
> > > I need to add a test control for this to vivid as well and add support
> > > for this to v4l2-ctl, that's on my TODO list.
> > > 
> > > Open questions:
> > > 
> > > 1) Existing encoder drivers use S_PARM to signal the frameperiod,
> > > but as discussed in Lyon this should be the rate at which frames are
> > > submitted for encoding, which can be different from
> > > V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE. But given the current use-cases
> > > I was wondering if calling S_PARM should set the ENC_FRAME_RATE
> > > control as well, and you would need to explicitly set the control
> > > after S_PARM if the two are not the same. This would mean that
> > > existing applications that don't know about the control can keep working.
> > 
> > In the patch I did exactly that and we should be backwards compatible
> > to applications that use only S_PARM.
> > 
> > Michael
> > 
> 
> Thanks for working on this!
> 
> Happy New Year,
> 
> 	Hans

