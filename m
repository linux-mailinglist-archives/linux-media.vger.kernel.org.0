Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AAC3E92E5
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 15:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbhHKNmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 09:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhHKNmr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 09:42:47 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11C2C0613D5
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 06:42:23 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso4962595pjb.1
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qTSWaVbeCk9kDBuSPcoRWHMShMuhgNRVM5qTKrrI18E=;
        b=hkZ8mJsmh1d7pmXI76Eh5bxrUjFbaM4KcYCfsgHfIbVqsbhgbA3npV+QuHkky9rOMD
         yNPsBk5Ou6GntRw6KK5kGUl21jqdm4v2muHgfFh2pB9BlCDsU7tTYPlwrmvAKKGGMV5H
         ESkLjWML5Lx68F2A32wTiS7UyPAt3aTyT0lHV1bAOfD1faW7vsE1Ua+fWBVMLVFHJm6m
         a7KRLWe41fAnvhvAl6MsI+P6UWm5yN4d2uAsz0gpK6TXuwrOBNuCzvjAM8RZrJWndiDh
         laW82y9BkU0+wvzUSiLBLsx3CG/rnI29xGLN152Xy5u0mmC/Vej8hKwLxFmBDpVuPaZt
         GnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qTSWaVbeCk9kDBuSPcoRWHMShMuhgNRVM5qTKrrI18E=;
        b=jROr/cHi/Ns480TFXv6zlRjd9eqZi88pbaVWr7pRtMaYFpj/M/XZC21ki9JZGjDZPr
         6ixODL9nXfuKmAKVY/mNOxO7pTNwlR6mBlp5B7ie2weZWGEP7PFN0Dzo/GwLbNrUsa0G
         R8ePO6TeXztZNCpG7Z0A1WstYTkR5+hSHd4gDudueNsLvCSNPboc6bzhAPJdo3TVmhen
         4mNgdWailPgPNfQIheD+oviI9QvnOyH8IiFwksq+pg1RNkGEYHUNBm69U6l6pAcvCEHq
         +Zb93QsFgjv2PmHXrYnS6y5AnJJNtlig/gsST1BJKkVvrKvQgEYQsckhOoHU3s+aE0OL
         t8fQ==
X-Gm-Message-State: AOAM532CgJVb2tSwl15QMKOJaL5j670R+ncHR8/jfohM1ZlZ6k9x6AMm
        2BxQdb9OLLrql9GBQnFZ7/bUWidMHon4FFXRGKy8zg==
X-Google-Smtp-Source: ABdhPJwa0qt6q8xfIUkPhYYs1kMWCSIee8KzujW+Gz6HydkP/DwEnrJtwhJrukPC+FSMH9jxMsBMvW3+GEXjH/GmIXw=
X-Received: by 2002:a62:78d0:0:b029:3dd:8fc1:2797 with SMTP id
 t199-20020a6278d00000b02903dd8fc12797mr4256520pfc.65.1628689343429; Wed, 11
 Aug 2021 06:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7@eucas1p2.samsung.com>
 <20210810103336.114077-1-robert.foss@linaro.org> <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
 <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
In-Reply-To: <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 11 Aug 2021 15:42:12 +0200
Message-ID: <CAG3jFytOQQBnnJQU9qDdQedrrcPz=SQPeXHX1HJQ8c5U94feCg@mail.gmail.com>
Subject: Re: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's assigned
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 11 Aug 2021 at 11:41, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Marek,
>
> Thanks for testing this.
>
> On Wed, 11 Aug 2021 at 09:48, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > On 10.08.2021 12:33, Robert Foss wrote:
> > > vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
> > > is incorrect and causes crashes.
> > >
> > > Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> >
> > With this patch applied on top of linux next-20210810 instead of the
> > NULL pointer dereference I get following error on DragonBoard410c while
> > loading kernel modules:
> >
> > [   18.480608] qcom-venus 1d00000.video-codec: Adding to iommu group 1
> > [   18.536167] qcom-camss 1b0ac00.camss: Adding to iommu group 2
> > [   18.600373] Internal error: synchronous external abort: 96000010 [#1]
> > PREEMPT SMP
>

After testing this patch + linux-next[1] I'm not able to replicate the
'Internal error' above on the db410c. And I don't think it is related
to this patch.

Are you seeing the same error on [1]? And are you seeing it before the
b10b5334528a9 ("media: camss: vfe: Don't read hardware version
needlessly") patch?

[1] https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_print_fix_v1


Rob
