Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888392D475B
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 18:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgLIRAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 12:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgLIRAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 12:00:04 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB51C0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 08:59:24 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id m185so780515qkf.12
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 08:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=po+0RK+m6tRodhDvk0UGgPEGPhKn6Ov8o3ir2WGBNdE=;
        b=PofDMy9VBy9CgWE+FcFl2w24tatS2GzvLnk4G/yJY8dEcFFeSkTqfXA3TttUvJ5Jad
         by+8n5NH3tDwuupSCAruooN9WmP1kayYZsegHMamLbKft+Pw7AMu+o8xPEXY7b51Lwd1
         ciNq0ire+Z55K02Uyb6sFHw8MbcWp8ommWJrgKlcLJEJLygRoyPIqdQfWA2kzohVK4DO
         hDWgrSmXCl9ilHXIfzukPmVeBSn9Ky9eITcYPbIS0XBSH4GUh+JZmXZIVKoRUAqbxV/7
         dtsZ9OqcI6y5GBTGQkY62rwTcS8FfjcuLSPwPcbqVCGGmuvWni7IK0ePIB9IBYO8y+xv
         D9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=po+0RK+m6tRodhDvk0UGgPEGPhKn6Ov8o3ir2WGBNdE=;
        b=dz8WcD52BTpUP4FTTlHaGhIZiX69XGWSvL4G2T/89QaOyiosOQYVxSGtxaU3g0lemQ
         /xrR6greYgk8cbn/JszAYKr91vjUvOvQShSK6y9FhkHSm/Q6/umaXftr1PgK4ZEU+jsj
         3EfRY5EY+GmrX846LSDjZtIfVCzvVgSxlUOBZDbrnOA4fe4z+yuBPV3yPA3GKupBitVa
         ijq/ulciMZTSZxPGKvAYk1PL4Y+k4pdBilTUC5Z6knnCkPixP2SxcSKXg74qB7Jw+5Ag
         gI4JTviO5rZkEC27AuB+G4p9IJ5xW8TC2QYHcQoAq0R0mmEGHsEYPFsCBwJ5FEr95Y6w
         jcRA==
X-Gm-Message-State: AOAM5318mvIC5a0/nf2Fm2PMSJ0AtIoawAlVTPHZen5Xvxmzpfu93oHP
        RmaqZOK/sCAzsBu0ajJkeqzfhA==
X-Google-Smtp-Source: ABdhPJx2QGQREWh41GgD3yPUgO8vWKbQ1e0GW3aPVGrf8Q7h/uOJDjBgyFSqJZYxubdMJ4pu18gP8A==
X-Received: by 2002:a37:f509:: with SMTP id l9mr3867626qkk.155.1607533163669;
        Wed, 09 Dec 2020 08:59:23 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id z30sm1359152qtc.15.2020.12.09.08.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:59:22 -0800 (PST)
Message-ID: <210906667a4f582c81ec8375a586a5ba47b93881.camel@ndufresne.ca>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Date:   Wed, 09 Dec 2020 11:59:21 -0500
In-Reply-To: <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
         <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
         <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
         <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
         <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 09 décembre 2020 à 18:51 +0900, Tomasz Figa a écrit :
> On Wed, Dec 9, 2020 at 1:43 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > 
> > Le vendredi 27 novembre 2020 à 03:13 +0900, Hirokazu Honda a écrit :
> > > HI Alexandre,
> > > 
> > > On Tue, Nov 24, 2020 at 7:17 PM Alexandre Courbot <acourbot@chromium.org>
> > > wrote:
> > > > 
> > > > Hi Hiro,
> > > > 
> > > > On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromium.org>
> > > > wrote:
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > According to the official v4l2 encoder driver usage description [1],
> > > > > v4l2 steatful encoder driver doesn't have a guarantee when frames fed
> > > > > to a driver will be returned.
> > > > > To make sure all pending frames are output by the driver, an app must
> > > > > call VIDIOC_ENCODER_CMD with cmd=V4L2_ENC_CMD_STOP.
> > > > > However, it is not mandatory to support the command in the current
> > > > > v4l2 stateful encoder API specification.
> > > > > An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> > > > > My question is when an app has to get all the frames of an encoder
> > > > > sequence, how we can achieve this without V4L2_ENC_CMD_STOP support.
> > > > > This demand is natural and in fact WebCodecs [2] requires this.
> > > > > 
> > > > > I think there are two options,
> > > > > 1.) Ensure that a driver will eventually output frames if it doesn't
> > > > > support V4L2_ENC_CMD_STOP.
> > > > > 2.) Change V4L2_ENC_CMD_STOP support to be mandatory
> > > > 
> > > > Unless I am missing the part of the spec that says the contrary,
> > > > V4L2_ENC_CMD_STOP is part of the encoder specification, and thus is
> > > > mandatory. Some older drivers might not have support for it, in such
> > > > cases the correct course of action would be to fix them.
> > > > 
> > > 
> > > I researched the API documents.
> > > The statement that the support is mandatory to stateful encoders is
> > > added from the latest document v5.9 [1],
> > > It states optional in the API document of v4.19 and v5.8.
> > > Hence my question is obsolete.
> > > 
> > > [1]
> > > https://www.kernel.org/doc/html/v5.9/userspace-api/media/v4l/vidioc-encoder-cmd.html
> > > [2]
> > > https://www.kernel.org/doc/html/v4.19/media/uapi/v4l/vidioc-encoder-cmd.html
> > > [3]
> > > https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/vidioc-encoder-cmd.html?highlight=v4l2_enc_cmd_stop
> > 
> > In historical drivers (Samsung MFC and perhaps Venus ?) an empty payload
> > buffer
> > was used to signal draining. This approach was never documented and had
> > issues.
> > It is still supported by MFC driver so that older Chromium / Android code
> > don't
> > fail on it (even though I doubt it has ever been retested since).
> > 
> 
> FWIW, Chromium has not been relying on this for a long time already.
> 
> That said, I think the question here is about a different class of
> devices. I can imagine some encoders just simply always consuming the
> input buffers as they come and produce corresponding bitstream buffers
> as soon as possible, in a 1:1 relationship. In that case, there would
> be no need for any explicit drain, because one can track which buffers
> came already and infer whether the encoding completed for the source
> buffer of interest.

I believe we decided to make this mantory to all stateless decoder (it makes
userspace life easier). But JPEG decoders predates the spec, so I suspect a JPEG
decoding userspace should behave as you describe to actually work with existing
drivers. I would rather encourage having CMD_STOP in all stateless decoder, even
JPEG.

> 
> Best regards,
> Tomasz
> 
> > > 
> > > Best Regards,
> > > -Hiro
> > > > > 
> > > > > Any comments are appreciated.
> > > > > Thanks so much in advance.
> > > > > 
> > > > > [1]
> > > > > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#drain
> > > > > [2] https://web.dev/webcodecs/
> > > > > 
> > > > > Sincerely,
> > > > > -Hiro
> > 
> > 


