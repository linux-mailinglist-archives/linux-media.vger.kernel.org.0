Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3194D2DA9B6
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 10:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgLOJHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 04:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbgLOJHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 04:07:04 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF0BC06179C
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:06:23 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ce23so26561811ejb.8
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ArCseHHFaIue4Wjj3pQ1Srq4wJIELQJ4KMGl7w3vqwg=;
        b=n5zjVjlcSOIvUcmczqMTSW4CbWaRmHvofrgsa7VSKXIKhaus97huLwi4WVHxrPEakA
         6npY8CJE4i3eOJhEksb5/c4gBvtrDKXkMM6Kd/NIGJYCjxJsb/TFyU7sPqcV9jHz14Mc
         nR1j0v1VzjNKCGdJylEJfL8cKobO4C8MM2Tts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ArCseHHFaIue4Wjj3pQ1Srq4wJIELQJ4KMGl7w3vqwg=;
        b=TB/ol56Q856indrEewHJyJShdKmBRI/IQ1GdKE04AEY8+0NPjKqkasfdi9GeNWoxXU
         O8IBHik5b7oq3qn/0yNsVxwSlIpt7WHuCNGSzX1RCjj8SuIpvITIvV8GFOSvHUQgM0nb
         /NTbqvW34bgluEhDrvBv+ooJcGW7ieXlY5FAvNZJOU2vuffuuViv5i8xufRr2JLNw3cU
         EVQNkjegDQI40mUP+yYhuga3m8lTN4tIZQOmqjaTbmnyoMXn9ZS3rdfuUx7tFERXuCul
         O0j7135Ne8FSKRKehdvrrCiLZxectyjCcELzIiZGPuCHyQGm5AAaCvpB2aC0nLEmIITF
         KRPQ==
X-Gm-Message-State: AOAM531v8GNCGTfVvv6Pxa51aHcnQp2yGlBy4btvrPGxNIsuC6MNGdZ5
        iB70kbu7RXXqR7HVLHb/FF6kwCVAAki7pg==
X-Google-Smtp-Source: ABdhPJwzHWmXLauqPj6XV+tmjezixGNTFQ7u6bJegKDv/NSgq0t+Ct/bqkpiFMF6TsMg+KRnyzyOtg==
X-Received: by 2002:a17:906:604e:: with SMTP id p14mr26750571ejj.515.1608023182238;
        Tue, 15 Dec 2020 01:06:22 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id qp16sm890067ejb.74.2020.12.15.01.06.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 01:06:21 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id x22so16145593wmc.5
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:06:21 -0800 (PST)
X-Received: by 2002:a1c:63d4:: with SMTP id x203mr30814522wmb.28.1608023180811;
 Tue, 15 Dec 2020 01:06:20 -0800 (PST)
MIME-Version: 1.0
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
 <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
 <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
 <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
 <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
 <210906667a4f582c81ec8375a586a5ba47b93881.camel@ndufresne.ca>
 <CAAFQd5AraF6sf79=q848VO1tWTWj6VaeG5sa38u_k4avkTPBGA@mail.gmail.com>
 <366ab6d001fd2f2db41e011d7348b0b54d4a8be1.camel@ndufresne.ca>
 <CAAFQd5BzLXnv7FY8BRi+45KrJ1Ph3PZeDS0SQe4Wkg0OYVbsxg@mail.gmail.com> <2c149355d8bde35098d03c9e1f72777d5a40eb80.camel@ndufresne.ca>
In-Reply-To: <2c149355d8bde35098d03c9e1f72777d5a40eb80.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 15 Dec 2020 18:06:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Diajypih_Tiou6US59hqVoPXaeeDe2ut9-FtBfPBqgAg@mail.gmail.com>
Message-ID: <CAAFQd5Diajypih_Tiou6US59hqVoPXaeeDe2ut9-FtBfPBqgAg@mail.gmail.com>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 15, 2020 at 6:12 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le vendredi 11 d=C3=A9cembre 2020 =C3=A0 12:18 +0900, Tomasz Figa a =C3=
=A9crit :
> > A lot of the hardware encoders implement only the basic codec
> > features, e.g. they would only encode in-order (no B-frames), have at
> > most 2 reference frames, etc. In that case, it's as simple as waiting
> > for dequeuing a CAPTURE buffer with a timestamp matching the OUTPUT
> > buffer being waited on.
>
> To me this is not a justification to allow not implementing that drain pr=
ocess
> with CMD_STOP. Having a single drain path ensure the userspace will work =
for
> both non-featured and full featured encoder. In the end, recommending to =
not
> implement CMD_STOP seems like giving vendors a short cut, which I don't t=
hink is
> beneficial to the users.
>

Fair enough. I think we've been looking for some definitive opinions
like this. :)

Best regards,
Tomasz
