Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229572C8AFA
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 18:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbgK3R24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 12:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbgK3R24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 12:28:56 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10C3C0613D2
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 09:28:15 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id y4so17219364edy.5
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNJtXeIQ4f3R+VvAdqoPimuHtvgktQwuiAbQpV/HFWE=;
        b=nnD8YalHuDD166RYZ7ZmNsq84+NXsmwg6T/7MDxEnhlfxG4rh9jUy4xcWgiSfZk27C
         eB3r3mmzY+kwTQ8VYdoV/nHd6ek0ozoHWXqTEA+IcyUwzIBjoB5wud/vDD3i0SrNd+Wc
         LuiYSF6xTNWIaexrVY7ur/r7WghcatYI1Wfsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNJtXeIQ4f3R+VvAdqoPimuHtvgktQwuiAbQpV/HFWE=;
        b=Et9fSTmFf7Oh+G+iwipO0xjGqjTywSUydd4IUHqJsGYEp5j9felRYM29zNI+VnfScm
         DBneDOwgUT8KjB0sFV/Zc/uh4YStCo82cZgG+Cjl+h7AOI5aqli3IDI/ySzkeRqR5WEh
         OCjN7mXRYtgQlkvqhFi6fo+XFITC9fr09jxQ4Kt17LEwKjQR6w/OYAjItt2hMM4SHWDu
         Lf5GNnScxI7OkekxpKOaopdeU/9cwSTtUVjZ8Id+KdAu2TGAorYCCYi7kRKfaQqeE1z/
         Ngyu0WksL55ULqehOYXCTh6eimDi3VwRYfeSXsLr6JN+f+wxW7xw/b2gpdztKeVE3HKS
         047A==
X-Gm-Message-State: AOAM533YgsxeNbdP13liH41iPBe6S1Kkballw+GzPdsRi6mfzMJRgpfk
        9K8c+0SgR2tyonHn9MLnmUmt6+kUvyWw0g==
X-Google-Smtp-Source: ABdhPJzTN/wRNckT6tM/+RV5fuo7pzPIOxrdBWbkvl7YxeSDp7AynmpSGT/4wTxTWHGORqYej7PVaw==
X-Received: by 2002:a50:e882:: with SMTP id f2mr21685444edn.76.1606757294265;
        Mon, 30 Nov 2020 09:28:14 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id j64sm858564edc.62.2020.11.30.09.28.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 09:28:13 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id e7so17265686wrv.6
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 09:28:13 -0800 (PST)
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr28993514wrn.320.1606757293076;
 Mon, 30 Nov 2020 09:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
 <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com> <d539ab91-da28-e8b3-6b39-d5564eb6f22a@linaro.org>
In-Reply-To: <d539ab91-da28-e8b3-6b39-d5564eb6f22a@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Mon, 30 Nov 2020 09:28:00 -0800
X-Gmail-Original-Message-ID: <CAMfZQbyZcS_fygWKBOr1xxUdfM-KsuTEt=VucPGf-JkM5+YzxA@mail.gmail.com>
Message-ID: <CAMfZQbyZcS_fygWKBOr1xxUdfM-KsuTEt=VucPGf-JkM5+YzxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Venus stateful encoder compliance
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 29, 2020 at 11:55 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Fritz,
>
> On 11/29/20 9:17 PM, Fritz Koenig wrote:
> > Since this patchset adds support for V4L2_ENC_CMD_STOP and
> > VENUS_ENC_STATE_ENCODING it should also add support for
> > VIDIOC_TRY_ENCODER_CMD so that those commands are discoverable.  I've
>
> 6/8 is adding it:
>
> +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
>

Ahh, thanks.  I need to work on my reading comprehension.

> > made an attempt at that here:
> > https://www.spinics.net/lists/linux-media/msg182319.html
> >
> > On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Hello,
> >>
> >> Here is v2 of the subject patchset.
> >>
> >> The patchset starts with few small preparation and fix patches, 1/8 to 5/8.
> >> 6/8 is redesigned Dikshita's patch and 7/8 add Reset encoder state handling.
> >> The last 8/8 just delete not needed helper function.
> >>
> >> The major changes are:
> >>  * An attempt to reuse m2m helpers for drain and reset state in 6/8 and 7/8.
> >>  * Use null encoder buffer to signal end-of-stream in 6/8.
> >>
> >> Comments are welcome!
> >>
> >> regards,
> >> Stan
> >>
> >> Dikshita Agarwal (1):
> >>   venus: venc: add handling for VIDIOC_ENCODER_CMD
> >>
> >> Stanimir Varbanov (7):
> >>   venus: hfi: Use correct state in unload resources
> >>   venus: helpers: Add a new helper for buffer processing
> >>   venus: hfi_cmds: Allow null buffer address on encoder input
> >>   venus: helpers: Calculate properly compressed buffer size
> >>   venus: pm_helpers: Check instance state when calculate instance
> >>     frequency
> >>   venus: venc: Handle reset encoder state
> >>   venus: helpers: Delete unused stop streaming helper
> >>
> >>  drivers/media/platform/qcom/venus/helpers.c   |  65 ++---
> >>  drivers/media/platform/qcom/venus/helpers.h   |   2 +-
> >>  drivers/media/platform/qcom/venus/hfi.c       |   2 +-
> >>  drivers/media/platform/qcom/venus/hfi.h       |   1 -
> >>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   2 +-
> >>  .../media/platform/qcom/venus/pm_helpers.c    |   3 +
> >>  drivers/media/platform/qcom/venus/venc.c      | 232 +++++++++++++++---
> >>  7 files changed, 226 insertions(+), 81 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
>
> --
> regards,
> Stan
