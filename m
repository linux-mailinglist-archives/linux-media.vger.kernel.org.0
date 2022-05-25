Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13604533EEE
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 16:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244387AbiEYOQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 10:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbiEYOQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 10:16:15 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF29CD
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 07:16:11 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2ff7b90e635so150338847b3.5
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=598sikrjYXNf9gR+bXjxuqcvriZ5gGSeCuJ05WXA9Eg=;
        b=njCb+jDlpLQHpdVWAHtRZ+6PLtnF+EvIvDeY4zRnj3fEBWZ1weE6T2dWnTfww+v8ch
         j+kiF1GzBY8J4EtAxnHfCdkFYjtfZT9lapZY4ExHd8OpMYFPhPxdyaHb7sP7tqBmA92B
         HOIeIaMUY23AzRVGbofc/MEJVc2WFxUu/mUff4zfMPCPrgJgi4F9zcjCaI4rkcqVVJlu
         n17/X44f+DheJlEkD3LZjlJFhmUP2UJkBU6V0ufRkqb9xKxQ/Gx7/DedpD4EkyXlkELr
         OqGarQtdrkheHRRwjzqaFqALT1vI5eb0Me5vsuAdBBYzV/BtE39TfxWA7/RHYtfPSmnu
         2OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=598sikrjYXNf9gR+bXjxuqcvriZ5gGSeCuJ05WXA9Eg=;
        b=df0D3W+69wZhwjvkvKesfPulfoYN5L1tYpOWRvXjzOwL4oHnFFO0lY8oFkvNloBblB
         fAzfILFhaYLT5x9aYwcZBybBsIbNM0GLO+AarEJZ/2mQm84N7vk6PQqhBEa7GiHRzJqo
         RJad2bPm/+7YQBja9UJUq5Jzc5V4ffgRoLVNQJa3u1j0Fhx3ZO0Yaq+PVvDjcsd9LQdX
         U+iu2axgEpAcnX/d8YkyxtuGPKC75/o90bB4ydSAteHPYLGYfM5Q7EMDUH2OlNm81mNQ
         dCWN2ehemYSG0wGAq3KIRWM8L8oen2y/JHS2jPUgIyilW87eQvbCQcbqRaTU81Ju5wL2
         8FfA==
X-Gm-Message-State: AOAM533rgy3aSFYt5NCInEYoEuKqDw6mwxrWqLCYFgdie8HuZhKdreJN
        Pdw8bzrUeB+8vT7RVpNE+1GU3XhkZZZxbjuAUvi/gA==
X-Google-Smtp-Source: ABdhPJxcajqaRuH443VA6TQFBYKMpaM1prIoqirimkYleEK88MLR05x6jQOk6gSrevQ8twERWeDdRawvtROXIYgDKOo=
X-Received: by 2002:a0d:d1c1:0:b0:2ff:cb6b:90cd with SMTP id
 t184-20020a0dd1c1000000b002ffcb6b90cdmr18218676ywd.385.1653488170926; Wed, 25
 May 2022 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local> <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local> <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local> <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
 <Yo40X03axFXXN9/d@phenom.ffwll.local> <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
In-Reply-To: <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Wed, 25 May 2022 15:15:59 +0100
Message-ID: <CAPj87rPW=YW8OnRyByJ_-6k3M9Oo7m7cTg88F8AF4TfudAjAJA@mail.gmail.com>
Subject: Re: Tackling the indefinite/user DMA fence problem
To:     Simon Ser <contact@emersion.fr>
Cc:     Daniel Vetter <daniel@ffwll.ch>, tvrtko.ursulin@linux.intel.com,
        daniels@collabora.com,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
        gustavo@padovan.org, Felix.Kuehling@amd.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, sergemetral@google.com,
        tzimmermann@suse.de, alexander.deucher@amd.com,
        skhawaja@google.com, sumit.semwal@linaro.org, jason@jlekstrand.net,
        maad.aldabagh@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, 25 May 2022 at 15:07, Simon Ser <contact@emersion.fr> wrote:
> On Wednesday, May 25th, 2022 at 15:51, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > You can add that to the list of reasons why compositors need to stop
> > > using buffers with unsignaled fences. There's plenty of other reasons
> > > there already (the big one being that otherwise slow clients can slow
> > > down the compositor, even if the compositor uses a high priority context
> > > and the HW supports preemption).
> >
> >
> > Yeah that's tbh another reason why I think we shouldn't do umf as a
> > transparent thing - compositors need to get better anyway, so we might as
> > well take this as a chance to do this right.
>
> As a compositor dev, I agree -- we should definitely be smarter about
> this. Note, it would help a lot to have a good way to integrate the
> waits into a poll(2) event loop.

The same holds for Weston. We're currently working through a bunch of
internal infrastructure to be able to handle this. Mutter (aka GNOME)
is also really well-placed to be able to do this.

Having pollable waits would be really useful, but I don't think it's
essential. In my strawman I'm just waking up at the usual
just-before-repaint point and checking; if it doesn't make it for this
frame then we'll wait for the next frame. If someone submits buffers
which take 4 repaint periods to clear then we'll have 3 'unnecessary'
wakeups, but given the GPU is already slammed then it's not an
efficiency problem I don't think. (I don't know if all the other
compositor people share this view.)

Cheers,
Daniel
