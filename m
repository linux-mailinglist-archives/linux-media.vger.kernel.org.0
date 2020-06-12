Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6A11F7D35
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgFLSxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLSxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:53:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A35C03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:53:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id w16so10549429ejj.5
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cr37r0pECi1XWWIaEVdMU6AtyEhg/S3ISctrijrtniI=;
        b=oW8oKJtd52cTIpIgrgznDrhmhnBKzG8PPF4+74Ug6qigFc3Y1cMJPTyXlecm/TTZDm
         7KLRvp3Mvy9DmeWgw4iBxsi/kIxtmZXKz2aN/iahIGKWEd/6g9tZDdB/r4tqdySvfjOz
         NGwz1SL6ZqndazFYq8un4xUpbtJVeVqMK4KeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cr37r0pECi1XWWIaEVdMU6AtyEhg/S3ISctrijrtniI=;
        b=mzlgMkYVmSx84BkYAGcGuvMstv/MRvqtI9RekNowm5rRXWzhntqjHNGNedutz5VD9J
         j5pIaAXqxxqDrcwfBDnu5E8RhBXbImkAcm1nt88W5zojst8S+eyR4UWrxLwnd1SbDrXx
         /hX+O5fUsqrIGivUDeqnXS19HxPw5LFsxG6Q9ZovAuIHV9tHp8xe+ERpV1FGgFa57iAo
         hHXmsRKJ5pXAMQHtgc0x8cEl2sm9LUfupuFsnnuevSLcMoUS7dFJCcq5MpVFf4hPHZwn
         g4QFFawyXlaI16ddPTbbsIYrR6IXSJSCy7Uv1JgE47DyDYMC5shc5c8UGfe6flGy3tnr
         Ohyw==
X-Gm-Message-State: AOAM530BG3pEV6J4c1IYVHcajy6l/cLUt23zIscUmX7+4JuG9asddnnH
        u3KKvXFUlqsuQS0FeXDHr+zxii8g9gbgvQ==
X-Google-Smtp-Source: ABdhPJzybcq0w1vMhJJkRXikWLBM96aec+WTMsMN3LSbUpNE3GhsEI8s+k/pkKK+Y8R4sU2ZRMqS3Q==
X-Received: by 2002:a17:906:178c:: with SMTP id t12mr13985165eje.464.1591988009033;
        Fri, 12 Jun 2020 11:53:29 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id z20sm3969156ejb.68.2020.06.12.11.53.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:53:28 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id p5so10734235wrw.9
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:53:28 -0700 (PDT)
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr337060wmh.134.1591988007853;
 Fri, 12 Jun 2020 11:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <5408d9f1-6415-7089-8069-ec36cd9eed75@linaro.org>
 <CAAFQd5ADxz-GYYiocKcB+Qxk9_tNJ_aAMxoOY6N9NLC-6ya3pw@mail.gmail.com> <7694a262-d655-427b-3baf-2f86dc76b906@linaro.org>
In-Reply-To: <7694a262-d655-427b-3baf-2f86dc76b906@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 12 Jun 2020 20:53:15 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DaKkLedFe5umLZ7oVJ7vPSDXiDavhSpq-n7z3E8nanpA@mail.gmail.com>
Message-ID: <CAAFQd5DaKkLedFe5umLZ7oVJ7vPSDXiDavhSpq-n7z3E8nanpA@mail.gmail.com>
Subject: Re: reqbuf(count=0), new vb2 op or something else
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 12, 2020 at 8:42 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Tomasz,
>
> On 6/12/20 9:33 PM, Tomasz Figa wrote:
> > Hi Stanimir,
> >
> > On Fri, Jun 12, 2020 at 5:20 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> I failed to found previous discussion on the subject, maybe it was on IRC.
> >>
> >> I stuck with fixing of issues which depends on this reqbuf(count=0).
> >> Currently I'm counting the buffers in vb2::buf_init and vb2::buf_cleanup
> >> but I don't want to rely on that implicit way anymore.
> >>
> >> If someone of you can remember let me know so that I can prepare an RFC.
> >>
> >> I can think of two options:
> >>  - change vb2::queue_setup so it could be called with num_buffers=0
> >>  - add new vb2::queue_release op
> >>
> >> More options?
> >
> > Just to make sure we're on the same page: Are you looking for a way to
> > handle some operation only when all buffers on the queue are being
> > freed?
>
> Exactly :)
>
> Presently I'm counting capture and output buffers in vb2::buf_init and
> vb2::buf_cleanup and release/reinit internal driver resources on the
> last .buf_cleanup. And this is a workaround of the problem which I want
> to solve properly.

Got it.

I suppose queue_release() could be a good idea to keep things
symmetrical, but for now, wouldn't it be still possible to hook
directly into .vidioc_reqbufs and do whatever necessary when count ==
0?

Best regards,
Tomasz
