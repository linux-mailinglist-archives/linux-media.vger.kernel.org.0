Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9BC2D83D7
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 02:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437075AbgLLB0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 20:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406208AbgLLB0U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 20:26:20 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1E6C0613CF
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 17:25:39 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id w127so9769587ybw.8
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 17:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ai0BLCdtUmhlpBaSMMCx1Kob7CcfHmXEvSFoszX6oWU=;
        b=bnv/zo3JQQ4m5EVEO3R3Os8fOBYlecMyyA0Pd19ACf0XC787wXh8y06YEa2m2/RITU
         oJqiHbyEk4HL93GYWZjbCCQ3llaBcmI7kcF9YC2BGgqe6p6HxpwNaEu0oaOj+7JOmU6m
         /Jv9X1qNgtAV3CHutrI+RWk+t9Xj2jqyUkFNmqQPeXbsaW6v2y7UbJo4P9HlNhXu6GDb
         d8LxaW3RQa6fzk3c6KZVfF25X7gnEjmTDUj31oq/Trk431pjwZnAUrPrTg8BoHn+TlKI
         CusFEJbCURlRlhXHHc+IVct8/Auy8IV+hnRXd4Lso0VM3tmUv8vK+9vCiSTCokDdvoDY
         VrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ai0BLCdtUmhlpBaSMMCx1Kob7CcfHmXEvSFoszX6oWU=;
        b=YcqqADZn3JttOgcOwASMiP39svY6yN6L+1rJcyTlImcUT3e/yFP3RrefAWtIzLPK0a
         MU1wvEZl4VDWBUZ54iO2M5Fj2Jw7PwdoCp13/0kB4Cj65YANMdcxfsR0I0hpio3GdUxJ
         r/6iaECminTAvWw3tjEyqmoLTGXhdvxGTh3NpAXHE4X0FewlStnMkjtm2ZrMKPaAah1t
         5AhU0mf8EfSYAK8No3uzymm5wyOf1pbkMDVEP8LXsmilawFK4qdejZ/uf9TBAVNTEVBO
         O+hbQrzNEo9KoWuGWDh75E4kVIRRiXhrue02QbvYlaEwReH5JeOCCE4v3OK9Ng7UV9Ci
         +eSg==
X-Gm-Message-State: AOAM530Z1EcZju8owJH3hPz8iunxPvRJrqjw7fnrv3FGB8cpePNKZ7Fn
        Bd/vsG0gPaTodbvNPypZ+Lfoi/CuPBtmUxyCBcKKFWu661+Fiw==
X-Google-Smtp-Source: ABdhPJzUZyoOcprt2cBLPdRWLHrXT+FSnhAOyPtsePuiatufsWWMuev+ATrvrs2fBAyUgJVcFv84xYXUBrvcsU+ea20=
X-Received: by 2002:a25:7584:: with SMTP id q126mr22431840ybc.236.1607736338834;
 Fri, 11 Dec 2020 17:25:38 -0800 (PST)
MIME-Version: 1.0
References: <CAMfZQbyxZPENgRans0KS5sHTLCj1dXRMcE8ewyksoSNesaa+vA@mail.gmail.com>
 <3d8e7798dfe3ed96526b17fc0451862430f5a735.camel@ndufresne.ca>
In-Reply-To: <3d8e7798dfe3ed96526b17fc0451862430f5a735.camel@ndufresne.ca>
From:   Fritz Koenig <frkoenig@google.com>
Date:   Fri, 11 Dec 2020 17:25:27 -0800
Message-ID: <CAMfZQbz+YcD8D-hwu7b2K6=s4jJkE-v+L2KfQAPwR0RZP3j2LA@mail.gmail.com>
Subject: Re: Changing encoding properties
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 9, 2020 at 8:26 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le lundi 30 novembre 2020 =C3=A0 11:10 -0800, Fritz Koenig a =C3=A9crit :
> > When can bitrate, etc., be changed by VIDIOC_TRY_EXT_CTRLS?  Any time
> > during encode?  Only before VIDIOC_STREAMON?
> >
> > My understanding is that VIDIOC_STREAMON should start actually
> > processing frames, everything before then is configuration.  If
> > something needs to be adjusted then VIDIOC_STREAMOFF should be called,
> > changes made, and then VIDIOC_STREAMON again.  Is this correct?
>
> Bitrate is paticular is expected to be changeable at runtime (in STREAMON
> state). But a firmware may not support it, hence a driver is allowed to r=
eturn
> EBUSY (iirc).
>
> Changing the bitrate without producing a new keyframe (whath cycling
> STREAMOFF/ON would cause) is a highly common use case while encoding for =
live
> streaming.
>
Thanks. That makes sense.

> This of course should be documented.
>
> >
> > I didn't see anything in the documentation about this.
> >
> > Thanks.
> >
> > -Fritz
>
>
