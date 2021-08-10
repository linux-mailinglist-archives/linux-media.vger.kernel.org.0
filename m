Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D0D3E5513
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 10:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbhHJI0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 04:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233230AbhHJI0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 04:26:53 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD597C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 01:26:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z20so2722599lfd.2
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=djm4DWbOF22GhsSvHwwgQ4MO8NZc/LJRB+Vb97tWuW0=;
        b=QtQSkDYS9w7avyA8UUAyR1p5yorxliXuFlS5AocLoZh8RLzymJJOhaznYtkRR1WTD5
         j0niLWf+G96pJbeqX2YyGUDJYSG2qwUgtzbhNIku7WnBVHtO0tXJcICn4+zeXuIcaVXD
         bENk6TgC1mpKQN/tMKlIEtmY6eWttigESp5KeiPIq2Fu6hrtyzz6vap2z7gtt3Nxzz7R
         bMlE5Kz4+ywpLvucwqdHorJd2b0uV/PvoQLrI5gSxvGXK1+yiGLSfLDqCpBDEqPSRzWP
         LtVW+VrAP/RKPjh+yxi0J30EbAP0w113KgYXaAjfM7j5dEo7FS/4XSaamI+59oW6Yc08
         Expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=djm4DWbOF22GhsSvHwwgQ4MO8NZc/LJRB+Vb97tWuW0=;
        b=Qux+S/8UwzOHjhlSYdAHfDnE6mFkdm08GXPLpuJTGw9phAxQtXa1F8FkcgTIlwRvr8
         SXE8cAbnzpViC8HNGAmA/rv/VAFsydDQXhi85x9a7NXLQKHGGEgTH1hirC+OzyLH6YNB
         TY8NZxOfWthdwVIqBz+0W2Gw/VepvBOBORyvs4kRt2OzrRiwHrZLk9sCbNIirradU8aD
         5m/Lrk4LrkPD2ln831J2ZjQ/BKncMsJ/MUV97ytwHJb4BinaqkujYoUmkcDruOKMsVKu
         kTvXgDCvNbapgLJgAuR1Uke7D1ShcpapRLl4DcS95exAlOndMFG2idQ5EsJydADRt8B7
         Luig==
X-Gm-Message-State: AOAM531MZqzGuHxRHoD4YI+u9QxzxEMfk8+yYrLQQISHZ69Wskk32nK8
        r/aoH8e6c8F4Y/CZzPHbLR7oHQd6Rq20TxXTjIe5gg==
X-Google-Smtp-Source: ABdhPJy+8bv0DEw5D+Cldh+36uB+ypSXDqcR8YNnjehpz758RYuy1Hyme5gswVLwUSfvXz0sBmBXuqjPuDWoFcXT1Lo=
X-Received: by 2002:a05:6512:1141:: with SMTP id m1mr20542919lfg.492.1628583990192;
 Tue, 10 Aug 2021 01:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com> <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
 <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
In-Reply-To: <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 10 Aug 2021 13:56:19 +0530
Message-ID: <CAO_48GG_=zA39iUzzHD-2b1ktqrTCZ3k8z8V12x48u4SS30_TQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To:     Hridya Valsaraju <hridya@google.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hridya,

Apologies for the delay in responding;


On Wed, 4 Aug 2021 at 03:09, Hridya Valsaraju <hridya@google.com> wrote:
>
> On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote=
:
> >
> > On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com> w=
rote:
> > > This patch limits the size of total memory that can be requested in a
> > > single allocation from the system heap. This would prevent a
> > > buggy/malicious client from depleting system memory by requesting for=
 an
> > > extremely large allocation which might destabilize the system.
> > >
> > > The limit is set to half the size of the device's total RAM which is =
the
> > > same as what was set by the deprecated ION system heap.
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >
> > Seems sane to me, unless folks have better suggestions for allocation l=
imits.
> >
> > Reviewed-by: John Stultz <john.stultz@linaro.org>
>
> Thank you for taking a look John!
Looks good to me; I will apply it to drm-misc today.
>
> Regards,
> Hridya
>
> >
> > thanks
> > -john
Best,
Sumit.


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
