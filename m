Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B821C431E
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 19:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730052AbgEDRnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 13:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729386AbgEDRnN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 13:43:13 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A47C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 10:43:13 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id z90so186671qtd.10
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=H/Opovsqgl980RMnusXrKi/rPKCvnYLYTI09XWkUy9U=;
        b=R+XA9SlyhAcehwF2Bt8ohO89qvIPSoF8h5JHYRA0XHxuLNnPlfh88sohdkvCwW0RWm
         wPdrpnNVG+8EucbyhbiG+Gt2wuIRWcpnp6APVFFc2sTDBA9BB4DJgVsXpUy9h0N+x9qt
         1m2xIph1h/qZsYLNAfEHWlpFhgtv7rVg9kKTuIB1WT0r7qfdGvz7gM6DrM+buE61Ll97
         S4FsNQLTOMx30gbSCxbYBq7aJLjGDNg7p125V6DnaXEbroRlTTamCBMVG85ftsbxLXVX
         t0jl4u38fTAKUa7Kcme+VT3BG9zWfmoBn3gdchE/Os7hJUUcaQ4Wz0uPNCS4YMqFgXmO
         mSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=H/Opovsqgl980RMnusXrKi/rPKCvnYLYTI09XWkUy9U=;
        b=LBP8sRiHZodpTTD2YedNmrWHV4qvyV825jiCuw2VjxyI5RQ+npCpjDrON/eFdR9NBx
         RJeDbLcQTJAV/Iit0DxIITDXjVtF+AK18WmkM/KZ2oWF3vhVZplXnyb/T4m92rZ6Srxn
         IDdb6driSeMOCJBRF+vj3Ldlul9k30m4meVokao3Obh2bPGo8g5NgWHKKHS17ASG7AdH
         73KjBSCvUtegkUDoyhA0e0lAblu6urE6Cnto30BHFNbrKuVV7NuDZuU6fNzbvdRvr8j+
         QQiezH0qA3lk7A0wHr4LJRJREOH7BFfN8wRcX7mcmrKDh/yrg7aFfEMYThUxECa5gzAR
         2zKw==
X-Gm-Message-State: AGi0PuYhnbCoxSLq3AZkWU4c4dfTYfEtJPXAWhqeFMBiApegpOQTfKfs
        mPn/N9zVfE/iOCgCAl2EBLLmGA==
X-Google-Smtp-Source: APiQypJC8BLdxxgE2nPYrND9yR1BlJnYntyxU7Gc0/Jkpj45TnewhOCVUBSIDKdIwbLMcaEN5lTaeQ==
X-Received: by 2002:aed:233d:: with SMTP id h58mr291006qtc.4.1588614192662;
        Mon, 04 May 2020 10:43:12 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id b19sm10717483qkg.72.2020.05.04.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 10:43:12 -0700 (PDT)
Message-ID: <cfa5b20f9f545dba9c9aa21ad9ce24f96eece1a2.camel@ndufresne.ca>
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Date:   Mon, 04 May 2020 13:43:11 -0400
In-Reply-To: <793c9c28-f922-d1fa-bfda-1709262d4d2c@linaro.org>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
         <d97b3c8e8a838d60d2d0d6058b77e624c0ee2fe1.camel@ndufresne.ca>
         <793c9c28-f922-d1fa-bfda-1709262d4d2c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le samedi 02 mai 2020 à 12:33 +0300, Stanimir Varbanov a écrit :
> Hi Nicolas,
> 
> On 5/1/20 5:19 PM, Nicolas Dufresne wrote:
> > Le jeudi 30 avril 2020 à 14:38 +0300, Stanimir Varbanov a écrit :
> > > Here we add two more reasons for dynamic-resolution-change state
> > > (I think the name is misleading espesially "resolution" word, maybe
> > > dynamic-bitstream-change is better to describe).
> > > 
> > > The first one which could change in the middle of the stream is the
> > > bit-depth. For worst example the stream is 8bit at the begging but
> > > later in the bitstream it changes to 10bit. That change should be
> > > propagated to the client so that it can take appropriate  action. In
> > > this case most probably it has to stop the streaming on the capture
> > > queue and re-negotiate the pixel format and start the streaming
> > > again.
> > > 
> > > The second new reason is colorspace change. I'm not sure what action
> > > client should take but at least it should be notified for such change.
> > > One possible action is to notify the display entity that the colorspace
> > > and its parameters (y'cbcr encoding and so on) has been changed.
> > 
> > Just to help with the use case, colorspace changes need to be
> > communicated to the following HW or software in your media pipeline.
> > Let's consider a V4L2 only use case:
> > 
> >   m2m decoder -> m2m color transform - >...
> > 
> > The userspace needs to be aware on time, so that it can reconfigure the
> > color transformation parameters. The V4L2 event is a miss-fit though,
> > as it does not tell exactly which buffer will start having this new
> > colorspace. So in theory, one would have to:
> > 
> >   - drain
> >   - send the new csc parameters
> >   - resume
> > 
> > I'm not sure if our drivers implement resuming after CMD_STOP, do you
> 
> According to the spec, after implicit drain the decoder is stopping and
> the client have two options:
> 
> 1. streamoff -> reconfigure queue -> streamon
> 2. decoder command start
> 
> #2 would be the case with colorspace changes.

Agreed, I just wanted to underline as as no userspace make any use of
that, CMD_START might current be broken in many places. That being
said, if we only use it in the context of a new event, it can't cause
any harm.

> 
> > have information about that ? We could also go through streamoff/on
> > cycle in the mean time. Most codec won't allow changing these
> > parameters on delta frames, as it would force the decoder doing CSC
> > conversion of the reference frames in decode process, that seems
> > unrealistically complex requirement.
> 
> Shouldn't such changes be preceded by IDR (or what is applicable for the
> codec)?

VP9 does not have this limitation. So reference frames and the output
frame can be of different size. It's likely unique to VP9. 

> 
> > That being said, please keep in mind that in VP9, reference frames do
> > not have to be of the same sizes. You can change the resolution at any
> > point in time. No one managed to decode the related test vectors [0]
> > with our current event base resolution change notification.
> > 
> > [0] FRM_RESIZE https://www.webmproject.org/vp9/levels/
> 
> I'd like to try those test streams.

You might also want to be aware of:

http://www.itu.int/net/itu-t/sigdb/spevideo/Hseries-s.htm
https://chromium.googlesource.com/webm/vp8-test-vectors/

Would be an nice and easy project to write a little runner for these
compliance and integrate that into kernel CI. For stateful codecs it is
trivial really. I'm working on GStreamer /GstValidate runners, as we
want something generic across OS and CODEC APIs, but kernelci folks
didn't seem very keen in having a framework on their rootfs (please
correct me if I'm wrong on this).

> 
> So, If I understood your comments correctly, the colorspace change event
> in stateful decoder spec isn't needed?



> 
> > > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > > ---
> > >  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > index 606b54947e10..bf10eda6125c 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > @@ -906,7 +906,11 @@ reflected by corresponding queries):
> > >  
> > >  * visible resolution (selection rectangles),
> > >  
> > > -* the minimum number of buffers needed for decoding.
> > > +* the minimum number of buffers needed for decoding,
> > > +
> > > +* bit-depth of the bitstream has been changed,
> > > +
> > > +* colorspace (and its properties) has been changed.
> > >  
> > >  Whenever that happens, the decoder must proceed as follows:
> > >  

