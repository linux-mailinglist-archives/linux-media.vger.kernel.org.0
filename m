Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F302B441CDB
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhKAOzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhKAOzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 10:55:14 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A37C061764
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 07:52:40 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h16so11611686qtk.0
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mpvNT8Ri6AwqEAbY0lXNb8KCZijn3p0iMge2tpFnF0M=;
        b=gYFcfpozzpHSUVgfxwxaPadsAqpgcmqTGigotPMhTxb2xsahsKb8P3ZraJ94GXFhQi
         0IksXfpjirucdEvciGM0dsyAkZ/pPw4wZQ/+YNt8vu8nzmconlrGozSJ4CPp5Q25Ly9d
         VouUjaOAA0JsNiTUoq83voi+7jYcu+dtxtQ+9PsZ5hC+ONOfbq7hdW7QT+pBrO0TfLyo
         gXW75QosgGlqgcUITWa3Hrh+LnsZjNoe+nTqSxcf9HUVJ1otiz1gRNJPLJ8rGZIDGlrX
         NtP1hvRyUoiQq7aIm2xC9ULZ8Q9V8qVL441FLxKajFtcUEOEUc6hcCAzWFwWT8BNHrxo
         ydeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mpvNT8Ri6AwqEAbY0lXNb8KCZijn3p0iMge2tpFnF0M=;
        b=crf5o11BYteZ9znI/ocKLR/zTnWyoNk1XyN5KBUU4EZtDUVckWUOg7m+xCUk2SnpoA
         PYmf7z/mrYWDiIGDDffonzBNZyTB8OFK0cmDs8p+sU86hPjsPb1RtMtHyBCAfVxF6N0Q
         mAY7IMbMu0mz1lYGHRhk8UbpblzQSlCVFv3kxzYMOtd0P8kC33j5taueeD3llei148Pq
         vBdLyK12IGYTgU03z4EQA2naCuN8+8+x2f+4YIruaBAyplZoxiBHGzz2qy32C1edzdPS
         W7CL3q7VwUe3sZWQEbS9mRMEvUdT+KuHR/Y39wrvkghNkppuO4vdBwaonNTEpIqIIAC9
         FbHA==
X-Gm-Message-State: AOAM5310R6azjvnBis3KxmcdiDHCKZuIdlJ1Aa+sZyhSRiEq9RNOpKy8
        QtFXmZerlS9i5GF1GscmcExLPg==
X-Google-Smtp-Source: ABdhPJzaXX6Ors0LN4D9hHKbAD8CzUdTjEYwfIR+yDsVmlhBBAFKClVJECXSBHac4FSvuoHEzEnvtg==
X-Received: by 2002:ac8:5794:: with SMTP id v20mr30445002qta.243.1635778359759;
        Mon, 01 Nov 2021 07:52:39 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id z19sm10100639qts.96.2021.11.01.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:52:39 -0700 (PDT)
Message-ID: <b8f877c9ba2cbd0d6839ac86892725a41097391a.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions
 about CAPTURE buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Ming Qian <ming.qian@nxp.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Mon, 01 Nov 2021 10:52:38 -0400
In-Reply-To: <dc7496db-9ba3-fa7b-8563-1157b63c9b0d@linaro.org>
References: <20211018091427.88468-1-acourbot@chromium.org>
         <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
         <AM6PR04MB634130FEB433CCA352CE98FBE7879@AM6PR04MB6341.eurprd04.prod.outlook.com>
         <dc7496db-9ba3-fa7b-8563-1157b63c9b0d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 29 octobre 2021 à 10:28 +0300, Stanimir Varbanov a écrit :
> 
> On 10/29/21 5:10 AM, Ming Qian wrote:
> > > -----Original Message-----
> > > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > > Sent: Tuesday, October 26, 2021 10:12 PM
> > > To: Alexandre Courbot <acourbot@chromium.org>; Mauro Carvalho Chehab
> > > <mchehab@kernel.org>; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Tomasz Figa
> > > <tfiga@chromium.org>
> > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions about
> > > CAPTURE buffers
> > > 
> > > Caution: EXT Email
> > > 
> > > Le lundi 18 octobre 2021 à 18:14 +0900, Alexandre Courbot a écrit :
> > > > CAPTURE buffers might be read by the hardware after they are dequeued,
> > > > which goes against the general idea that userspace has full control
> > > > over dequeued buffers. Explain why and document the restrictions that
> > > > this implies for userspace.
> > > > 
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-decoder.rst     | 17
> > > +++++++++++++++++
> > > >  1 file changed, 17 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > index 5b9b83feeceb..3cf2b496f2d0 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > @@ -752,6 +752,23 @@ available to dequeue. Specifically:
> > > >       buffers are out-of-order compared to the ``OUTPUT`` buffers):
> > > ``CAPTURE``
> > > >       timestamps will not retain the order of ``OUTPUT`` timestamps.
> > > > 
> > > > +.. note::
> > > > +
> > > > +   The backing memory of ``CAPTURE`` buffers that are used as reference
> > > frames
> > > > +   by the stream may be read by the hardware even after they are
> > > dequeued.
> > > > +   Consequently, the client should avoid writing into this memory while the
> > > > +   ``CAPTURE`` queue is streaming. Failure to observe this may result in
> > > > +   corruption of decoded frames.
> > > > +
> > > > +   Similarly, when using a memory type other than
> > > ``V4L2_MEMORY_MMAP``, the
> > > > +   client should make sure that each ``CAPTURE`` buffer is always queued
> > > with
> > > > +   the same backing memory for as long as the ``CAPTURE`` queue is
> > > streaming.
> > > > +   The reason for this is that V4L2 buffer indices can be used by drivers to
> > > > +   identify frames. Thus, if the backing memory of a reference frame is
> > > > +   submitted under a different buffer ID, the driver may misidentify it and
> > > > +   decode a new frame into it while it is still in use, resulting in corruption
> > > > +   of the following frames.
> > > > +
> > > 
> > > I think this is nice addition, but insufficient. We should extend the API with a
> > > flags that let application know if the buffers are reference or secondary. For the
> > > context, we have a mix of CODEC that will output usable reference frames and
> > > needs careful manipulation and many other drivers where the buffers *maybe*
> > > secondary, meaning they may have been post-processed and modifying these
> > > in- place may have no impact.
> > > 
> > > The problem is the "may", that will depends on the chosen CAPTURE format. I
> > > believe we should flag this, this flag should be set by the driver, on CAPTURE
> > > queue. The information is known after S_FMT, so Format Flag, Reqbufs
> > > capabilities or querybuf flags are candidates. I think the buffer flags are the
> > > best named flag, though we don't expect this to differ per buffer. Though,
> > > userspace needs to call querybuf for all buf in order to export or map them.
> > > 
> > > What userspace can do with this is to export the DMABuf as read-only, and
> > > signal this internally in its own context. This is great to avoid any unwanted
> > > side effect described here.
> > 
> > I think a flag should be add to tell a buffer is reference or secondary.
> > But for some codec, it's hard to determine the buffer flag when reqbufs.
> > The buffer flag should be dynamically updated by driver.
> > User can check the flag after dqbuf every time.
> 
> +1
> 
> I'm not familiar with stateless decoders where on the reqbuf time it
> could work, debut for stateful coders it should be a dynamic flag on
> every capture buffer.

This isn't very clear request here, on which C structure to you say you would
prefer this ?

There is no difference for stateful/stateless for this regard. The capture
format must have been configured prior to reqbuf, so nothing post S_FMT(CAPTURE)
can every be very dynamic. I think the flag in S_FMT is miss-named and would
create confusion. struct v4l2_reqbufs vs struc v4l2_buffer are equivalent. The
seconds opens for flexibility.

In fact, for some certain CODEC, there exist B-Frames that are never used as
references, so these could indeed can be written to even if the buffer are not
secondary. I think recommending to flag this in v4l2_buffer, and read through
VIDIOC_QUERYBUF would be the best choice.

> 
> > 
> > > 
> > > >  During the decoding, the decoder may initiate one of the special
> > > > sequences, as  listed below. The sequences will result in the decoder
> > > > returning all the  ``CAPTURE`` buffers that originated from all the
> > > > ``OUTPUT`` buffers processed
> > > 
> > 
> 


