Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24AD8405AE6
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 18:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236794AbhIIQcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 12:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhIIQcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 12:32:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752C3C061574;
        Thu,  9 Sep 2021 09:31:05 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q11so3410029wrr.9;
        Thu, 09 Sep 2021 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+0jFX+c9As4mGNIOMW4VKBlVBkjOIBw3KEyFedYOaI=;
        b=bbFcCygdOWBh3I3p1p2h3+WeDK8qco4C6NmJcfldjivlawaHz7aMOiMt8tR6Ty5xYr
         vFIMdU+u7QOzp2X6Z7EGAQ/SFyr7BKtd5WYfUkWSQ2Ava5SM/tHdgE5fRjgJJxib5ke4
         9QTWO2YtVY+iq1ykq9E9y12HG20+qdvptEv8mRNmSerDF70CMHafid7rHTLd9JDZOZXB
         6poQ3PgFmrZnaIbAes1l1NiiSYSNzbSLSNRwGPZXLcF4SeIH/Gfp1VUnBYI1HTlW9398
         R1Bc3c3BGH3fmESVlZvXOO+9UdyQJ6Kh+pj1aettYb/7OahVLOuhR2ooRP2zky/oQLsZ
         TotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+0jFX+c9As4mGNIOMW4VKBlVBkjOIBw3KEyFedYOaI=;
        b=tmzxHUFMeTQ9n8BBT90xLHPWbhEC3wao2cBeNLdOp9Ti+yXh757e+BNlVm0ud8bIYW
         nZryyeMTNNUURG3fANgoZlxm62xw4opNkrhDmQPxgce60ngYaWQD4L7/9WjtYY6+5vPh
         fcL3IBs71k6+F0kgCZk1V93QJddPDhbuutpE3c3R7MVmmnRUZHKsMv3m7Vpp+WAlqPLk
         QmNce2wG5b2KT9azw7vq/YFIIsFDwVRL9vJNVLLE5g9t8cdyAtvGIodpu/Mr/e1TqE10
         VMap9fS4L9EGgutIAaaehjsD6K/2/UZCnzblVp9f0ljlJkofX56bquR8H2y8mRjDh/H8
         iB5g==
X-Gm-Message-State: AOAM530V/VPYfQI559rguYD34v7oQHDG+yhNl/4tlti1CjE/uEqFXpWA
        U7lOfFFFXvn5eVqSerpctykZlEuIvy9kDqfSCZM=
X-Google-Smtp-Source: ABdhPJziNKyewTTtSu5pziJeaODH5nE8F9cT5n7HbZ3pWAcwqx9wKwmPdZrhzS9wqwHAw5W+ht5QMcC2TK8ie1veLgk=
X-Received: by 2002:a5d:4488:: with SMTP id j8mr4732581wrq.260.1631205063988;
 Thu, 09 Sep 2021 09:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
In-Reply-To: <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Sep 2021 09:35:31 -0700
Message-ID: <CAF6AEGuD2bnFpmSWtGxU5+AFj1HVKtnOZmLKRr-pDVbLn0nPVw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] dma-fence: Deadline awareness
To:     Simon Ser <contact@emersion.fr>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
        Melissa Wen <mwen@igalia.com>,
        Steven Price <steven.price@arm.com>,
        Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 9, 2021 at 9:16 AM Simon Ser <contact@emersion.fr> wrote:
>
> Out of curiosity, would it be reasonable to allow user-space (more
> precisely, the compositor) to set the deadline via an IOCTL without
> actually performing an atomic commit with the FB?
>
> Some compositors might want to wait themselves for FB fence completions
> to ensure a client doesn't block the whole desktop (by submitting a
> very costly rendering job). In this case it would make sense for the
> compositor to indicate that it intends to display the buffer on next
> vblank if it's ready by that point, without queueing a page-flip yet.

Yes, I think it would.. and "dma-buf/sync_file: Add SET_DEADLINE
ioctl" adds such an ioctl.. just for the benefit of igt tests at this
point, but the thought was it would be also used by compositors that
are doing such frame scheduling.  Ofc danvet is a bit grumpy that
there isn't a more real (than igt) userspace for the ioctl yet ;-)

BR,
-R
