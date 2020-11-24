Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56802C22A4
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 11:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731638AbgKXKR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 05:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731531AbgKXKRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 05:17:25 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6C4C0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:17:25 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id v14so5931910lfo.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O5+UzBR4beTn0hE4g9/wDcOfrip152qFmHxFTKaxjVI=;
        b=dTxbCA/uAquEApYucauvIzlc3Q4xb4DpJxk2KAd4XrPoxepREiv6EkR8/SB1gW9Emi
         9OPyIsg1ozWeJwcGXzq68nbolnJtzkKTq2loHvamWydeyVI97RcQ4I3pAg9QDgUd21zN
         wEPpSwQJjtrDDJHBjc17YmP5huGTxYi+h9tNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O5+UzBR4beTn0hE4g9/wDcOfrip152qFmHxFTKaxjVI=;
        b=spCH8VT8rMQWT5IvW6u0eMvB4S6twUW1OM4pS+RREWM8c/fsxb0BS+lnogBSr0ED8X
         fPJaqYw7bLFwC9Fz4N4+w/3/QrNBndiCYtn+vdkbvhdyzcR/1HCWZ2RPYAyWHlljuYuA
         jTJ0Kg7ABQ5HzilODIsHUhywkhnP5kNyIfzrM1/d/y/RgtpDsUTigRhdmZPkMjyUPA5+
         bDTCRRGpdpCrEZUdB8yFYDEndyIHHGYO+Ti4N8KB+K2Ff4Z+FM+kXit2nzMMMGnbC4V5
         oEkyQrug93a1w7lNc+agst8wbhTcCphIKXbWnA9iUJ7M7RUvrurdOgClMGsLSdfcIEvM
         KzNg==
X-Gm-Message-State: AOAM533vBfwiV8q99qltaATA1mUKoSxKbkvqiEDnbbgqVdXj1NKL3e/e
        lkCPkDwbYc/0grrpH1HCMkVojQyIaY8dXzpd
X-Google-Smtp-Source: ABdhPJzIeVdQwjJ2B60mFjGb6xhLT5ODcekyKn3ESFUHbKchScMSp+kHG3NBjtJiDuiU4+mTB4HG3A==
X-Received: by 2002:a19:228f:: with SMTP id i137mr1543678lfi.477.1606213043718;
        Tue, 24 Nov 2020 02:17:23 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id e17sm29588ljl.99.2020.11.24.02.17.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 02:17:23 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id b17so21331498ljf.12
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:17:22 -0800 (PST)
X-Received: by 2002:a2e:a554:: with SMTP id e20mr1418710ljn.276.1606213042473;
 Tue, 24 Nov 2020 02:17:22 -0800 (PST)
MIME-Version: 1.0
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
In-Reply-To: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 24 Nov 2020 19:17:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
Message-ID: <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
To:     Hirokazu Honda <hiroh@chromium.org>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hiro,

On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromium.org> wrote:
>
> Hi,
>
> According to the official v4l2 encoder driver usage description [1],
> v4l2 steatful encoder driver doesn't have a guarantee when frames fed
> to a driver will be returned.
> To make sure all pending frames are output by the driver, an app must
> call VIDIOC_ENCODER_CMD with cmd=V4L2_ENC_CMD_STOP.
> However, it is not mandatory to support the command in the current
> v4l2 stateful encoder API specification.
> An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> My question is when an app has to get all the frames of an encoder
> sequence, how we can achieve this without V4L2_ENC_CMD_STOP support.
> This demand is natural and in fact WebCodecs [2] requires this.
>
> I think there are two options,
> 1.) Ensure that a driver will eventually output frames if it doesn't
> support V4L2_ENC_CMD_STOP.
> 2.) Change V4L2_ENC_CMD_STOP support to be mandatory

Unless I am missing the part of the spec that says the contrary,
V4L2_ENC_CMD_STOP is part of the encoder specification, and thus is
mandatory. Some older drivers might not have support for it, in such
cases the correct course of action would be to fix them.

>
> Any comments are appreciated.
> Thanks so much in advance.
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#drain
> [2] https://web.dev/webcodecs/
>
> Sincerely,
> -Hiro
