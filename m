Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F171D441CD1
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhKAOsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhKAOsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 10:48:15 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D698EC061764
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 07:45:41 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id g25so10319970qvf.13
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NtOIHopbUlvm30a4x39XtxN50M+iVFDMrnlSbgrZxb0=;
        b=x03Z067ZF8NJ4PWxc4K3oxjQHWh8XPicOCJCHUqm3v/X7LENLTiFaDGIZssb41KTBI
         E5eMTBOaKsNtXqn4wL8yzFjoio7I7nnqjsf7AYFpcliG2oTXKLQtw/4/UvkNq0OHkWig
         CYR8ZB8Qd/PkPXm3fFw1QG8UuQXif+QHp7zFbkCy1ogArWPdnurpdavRerw3JsZ3oENC
         862zt7HcbrF02UCvIt4zoMIKiPaEkydMWslAhB4JFp3CmMULX1NDxqdZ68KlnPrfvRoO
         R0wl2ghecYBjHGq3JbIvAHDDUwWVfHg3j19gpoZW/V3j9VAHPbZBRiu6pj63IBN7fdwk
         LaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NtOIHopbUlvm30a4x39XtxN50M+iVFDMrnlSbgrZxb0=;
        b=w3dLzeJkVrtRL5eivacC6ZPSGTnV1+E1EVBApQTqsr1C6BgTnPZdRQdSFMvc9UoxSD
         SYaJ2e5hspCP/S16giipKAf+UhYS8YvaMamqJu4B/zHC8VpDNaB1CGJ5YaMMqxU9lCHt
         u4LsChjG7f27Dp/YX5axWRUQPeouRpnvCJ+bdxfJrEvocafUFcTGb1SIZuPh1NjMlDyd
         uDqmarpp9vggzPFVocgJTutNaLrF284P3/8Ac6gu7qQETq49iPEq7CAfJzdIDhbmrMIv
         UdMn3AWD4uCNHIFX3L00y+M1f5tVbI91rXZr0WoC6Z68+tLOPX7Dz0pm7iLTBysNonmo
         Ug0w==
X-Gm-Message-State: AOAM531mgzPb0dLyQyGck6bPc0CNMt6WG8TWYbEw66wstFau1VUEjhhq
        +05WiUJWWEg+wu6lu3CtpybJ+w==
X-Google-Smtp-Source: ABdhPJypIyhxKRGyjCPUFMLFuQ9SY8D6ZiOQ+iqDULrYWCxg3WDM/Aou7bOHDtFp14lulB5DL7NlXw==
X-Received: by 2002:a05:6214:246f:: with SMTP id im15mr28932347qvb.50.1635777940980;
        Mon, 01 Nov 2021 07:45:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id b5sm375977qtb.1.2021.11.01.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:45:40 -0700 (PDT)
Message-ID: <41a88606889de8f5fc8bc085e383ad43d439c45a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: add restrictions about
 CAPTURE buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 01 Nov 2021 10:45:38 -0400
In-Reply-To: <CAAFQd5BzXAO9vTm1xNmZ6iLnjnckfRC4Z2yqgxvuL+NUiHXnsQ@mail.gmail.com>
References: <20211018091427.88468-1-acourbot@chromium.org>
         <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
         <CAAFQd5BzXAO9vTm1xNmZ6iLnjnckfRC4Z2yqgxvuL+NUiHXnsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 29 octobre 2021 à 12:04 +0900, Tomasz Figa a écrit :
> On Tue, Oct 26, 2021 at 11:12 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > 
> > Le lundi 18 octobre 2021 à 18:14 +0900, Alexandre Courbot a écrit :
> > > CAPTURE buffers might be read by the hardware after they are dequeued,
> > > which goes against the general idea that userspace has full control over
> > > dequeued buffers. Explain why and document the restrictions that this
> > > implies for userspace.
> > > 
> > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > ---
> > >  .../userspace-api/media/v4l/dev-decoder.rst     | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > index 5b9b83feeceb..3cf2b496f2d0 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > @@ -752,6 +752,23 @@ available to dequeue. Specifically:
> > >       buffers are out-of-order compared to the ``OUTPUT`` buffers): ``CAPTURE``
> > >       timestamps will not retain the order of ``OUTPUT`` timestamps.
> > > 
> > > +.. note::
> > > +
> > > +   The backing memory of ``CAPTURE`` buffers that are used as reference frames
> > > +   by the stream may be read by the hardware even after they are dequeued.
> > > +   Consequently, the client should avoid writing into this memory while the
> > > +   ``CAPTURE`` queue is streaming. Failure to observe this may result in
> > > +   corruption of decoded frames.
> > > +
> > > +   Similarly, when using a memory type other than ``V4L2_MEMORY_MMAP``, the
> > > +   client should make sure that each ``CAPTURE`` buffer is always queued with
> > > +   the same backing memory for as long as the ``CAPTURE`` queue is streaming.
> > > +   The reason for this is that V4L2 buffer indices can be used by drivers to
> > > +   identify frames. Thus, if the backing memory of a reference frame is
> > > +   submitted under a different buffer ID, the driver may misidentify it and
> > > +   decode a new frame into it while it is still in use, resulting in corruption
> > > +   of the following frames.
> > > +
> > 
> > I think this is nice addition, but insufficient. We should extend the API with a
> > flags that let application know if the buffers are reference or secondary. For
> > the context, we have a mix of CODEC that will output usable reference frames and
> > needs careful manipulation and many other drivers where the buffers *maybe*
> > secondary, meaning they may have been post-processed and modifying these in-
> > place may have no impact.
> > 
> > The problem is the "may", that will depends on the chosen CAPTURE format. I
> > believe we should flag this, this flag should be set by the driver, on CAPTURE
> > queue. The information is known after S_FMT, so Format Flag, Reqbufs
> > capabilities or querybuf flags are candidates. I think the buffer flags are the
> > best named flag, though we don't expect this to differ per buffer. Though,
> > userspace needs to call querybuf for all buf in order to export or map them.
> > 
> > What userspace can do with this is to export the DMABuf as read-only, and signal
> > this internally in its own context. This is great to avoid any unwanted side
> > effect described here.
> 
> I agree with the idea of having a way for the kernel to tell the
> userspace the exact state of the buffer, but right now the untold
> expectation of the kernel was as per what this patch adds. If one
> wants their userspace to be portable across different decoders, they
> need to keep the assumption. So the natural way to go here is to stay
> safe by default and have a flag that tells the userspace that the
> buffer can be freely reused.

On the V4L2 side, this is what I am asking, a flag to signal that the buffer can
be freely reused (or secondary). The last part was an example of what userland
that cares about robustness can do with it.

> 
> Best regards,
> Tomasz


