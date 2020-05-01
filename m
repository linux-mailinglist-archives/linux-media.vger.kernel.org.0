Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE48E1C17D3
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 16:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgEAOci (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 10:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728893AbgEAOci (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 10:32:38 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8ECBC061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 07:32:37 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id k8so7632373ejv.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dfXS7T1jgTcixqiRAyQqrxUasaJJdyLjUj1xAnvRTek=;
        b=UbYpsvrT7zfGek3rdxkaQ1tG0sNJXcpXPG8K2GJJuQ4mI7pTJhQbN6ZlA5fVCE7ArE
         Fmtfgin73cYZDF5J5KGGhlQT5YCcptpWaIWzEXPBeFy1mWkQRMlc1QdgP2pO0Lc+JW8s
         1EbVRLcc1ivOu9TAwvr7U/AufeESy37JjT2Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dfXS7T1jgTcixqiRAyQqrxUasaJJdyLjUj1xAnvRTek=;
        b=oyMrqRVIyls97cKQ6rQxY43rvsgQkHt40d0KciAxuOT7PjCCFwL84v9C/xCxX6egMu
         3HCjHnggzqkwg32M2jfX/5Ni1gxgArEzHPSiAVt6WUy8hzrBxCuMtmyvGTBxQTxGHoan
         Mutx1rq0hCZ1NEVnvcVglie2N//KzxAaMwmsT9KBJ5QURk1h/mkh4WvPwn9c3THOQD3F
         rcYJIYPkuSVnGjcnb+s4NU4jNbiWrhfCiDMoDRSqjTE4s4g1pGXLsafrr3l/QCbD4u19
         VaFQkDzyoVsCkJsi7fgbCTcT4MnHpdoBy/2nkh7NTml9G5mLbCpIzFPRRTyWrryV5azd
         1AJg==
X-Gm-Message-State: AGi0PuaZQm8H+/A/OUCt7rKtVV7eTu09Yw4DIAOn08Q9yUUQoL2EYmcw
        F/dZsMfTnRy2JAMwZDubTC80zySf7cg=
X-Google-Smtp-Source: APiQypJAofC8jdJNxsxqYbAJa+HP8bXpijIKjJvrb5L9ldMjviyaXNtUJAVUxe/4EkRbh94mqkvKLg==
X-Received: by 2002:a17:906:46da:: with SMTP id k26mr3582244ejs.106.1588343555573;
        Fri, 01 May 2020 07:32:35 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id i91sm95449edi.62.2020.05.01.07.32.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 07:32:35 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id k12so6111824wmj.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 07:32:34 -0700 (PDT)
X-Received: by 2002:a1c:7d4b:: with SMTP id y72mr4385903wmc.11.1588343554176;
 Fri, 01 May 2020 07:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org> <d97b3c8e8a838d60d2d0d6058b77e624c0ee2fe1.camel@ndufresne.ca>
In-Reply-To: <d97b3c8e8a838d60d2d0d6058b77e624c0ee2fe1.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 1 May 2020 16:32:22 +0200
X-Gmail-Original-Message-ID: <CAAFQd5C1v7r8OzMCEkyyjipO-QVL_aKDuA_syJNiGfY3t3jHMQ@mail.gmail.com>
Message-ID: <CAAFQd5C1v7r8OzMCEkyyjipO-QVL_aKDuA_syJNiGfY3t3jHMQ@mail.gmail.com>
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 1, 2020 at 4:19 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le jeudi 30 avril 2020 =C3=A0 14:38 +0300, Stanimir Varbanov a =C3=A9crit=
 :
> > Here we add two more reasons for dynamic-resolution-change state
> > (I think the name is misleading espesially "resolution" word, maybe
> > dynamic-bitstream-change is better to describe).
> >
> > The first one which could change in the middle of the stream is the
> > bit-depth. For worst example the stream is 8bit at the begging but
> > later in the bitstream it changes to 10bit. That change should be
> > propagated to the client so that it can take appropriate  action. In
> > this case most probably it has to stop the streaming on the capture
> > queue and re-negotiate the pixel format and start the streaming
> > again.
> >
> > The second new reason is colorspace change. I'm not sure what action
> > client should take but at least it should be notified for such change.
> > One possible action is to notify the display entity that the colorspace
> > and its parameters (y'cbcr encoding and so on) has been changed.
>
> Just to help with the use case, colorspace changes need to be
> communicated to the following HW or software in your media pipeline.
> Let's consider a V4L2 only use case:
>
>   m2m decoder -> m2m color transform - >...
>
> The userspace needs to be aware on time, so that it can reconfigure the
> color transformation parameters. The V4L2 event is a miss-fit though,
> as it does not tell exactly which buffer will start having this new
> colorspace. So in theory, one would have to:
>
>   - drain
>   - send the new csc parameters
>   - resume
>
> I'm not sure if our drivers implement resuming after CMD_STOP, do you
> have information about that ? We could also go through streamoff/on
> cycle in the mean time. Most codec won't allow changing these
> parameters on delta frames, as it would force the decoder doing CSC
> conversion of the reference frames in decode process, that seems
> unrealistically complex requirement.
>
> That being said, please keep in mind that in VP9, reference frames do
> not have to be of the same sizes. You can change the resolution at any
> point in time. No one managed to decode the related test vectors [0]
> with our current event base resolution change notification.
>
> [0] FRM_RESIZE https://www.webmproject.org/vp9/levels/
>

Agreed. The event mechanism is certainly suffering from some design
issues, but that's just a tip of the iceberg. I think we can only
solve this problem by adding an ability to query driver state on a
per-buffer basis, so one could query the format of a particular
dequeued frame.

Best regards,
Tomasz

> >
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Do=
cumentation/userspace-api/media/v4l/dev-decoder.rst
> > index 606b54947e10..bf10eda6125c 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > @@ -906,7 +906,11 @@ reflected by corresponding queries):
> >
> >  * visible resolution (selection rectangles),
> >
> > -* the minimum number of buffers needed for decoding.
> > +* the minimum number of buffers needed for decoding,
> > +
> > +* bit-depth of the bitstream has been changed,
> > +
> > +* colorspace (and its properties) has been changed.
> >
> >  Whenever that happens, the decoder must proceed as follows:
> >
>
