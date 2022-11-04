Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6ED619AAC
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbiKDO57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiKDO55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:57:57 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528742EF48
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:57:55 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-12c8312131fso5798741fac.4
        for <linux-media@vger.kernel.org>; Fri, 04 Nov 2022 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1gVxuAF8E1wt+B0yAv3PkO74sKGbKOwH5XfGox/81U=;
        b=NfGTep0WZ282nqPfUCT1yPZnvr5+ho8fiJ/z0UpoCyVZzhrQdMNRii/8GOTt1jOwW1
         d4UXaR4Hrk7qLw+Ivht92BPiQ7Tjj0o92VDDVGfLqf81zK5btnIlC7GAz0lLHJk8fiPc
         6t5wfU1ZcdJIqNF9JK3cjS/ttqBrNIeMFeXAjwpMO11T/q7EzoNa2qrAAQsnP3ZX3EWC
         UQnxBwDeHStXRIuFSIWULamY3yMVfoFHNYt5huwSYpkkjD8MNiNzw8a6JKxgXXHMolhX
         7uqdGFCHN5rsSP7Rt2mTfjalzA/Ut7FN3KgDMSLox1NXn19GtLEgVS+t7DpzOSy8FA0e
         NB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1gVxuAF8E1wt+B0yAv3PkO74sKGbKOwH5XfGox/81U=;
        b=BvJg0HtP41tEXjZ3nX5r9qtDd4k7dXl2H41xSvI+rFVfI4lUAHrPBMVSt7lhmlRe/F
         FXBl9xQl7ZtI73Yaj4TC3hHjrE5a8i+xEjHo1y6ktGQfKlxI2FMW96lyPDVQ7q/aUwGo
         7aTviLzs4P5Vi15+GjqHZLLhgTwODRZ34YuaFV0+NUzG9nzyFF2keaPS3pNKaT2FWm/5
         /p58yL1t3ugo2kBk0AqBvRmM10Z/aXsnEA9SR3hg7wmNo8bDnChYOl1iKLl1NovPaXGH
         NpjNIUHESUBxvZ+wWjCifTmXMRqBrEE/usRY29vdjOc2Me5rJXO9kaAKJQdfeVI2weLV
         8kLA==
X-Gm-Message-State: ACrzQf2FGAWyo69cM6+Ip5fYhGibacBsyk340GSQKnv/p0JAZTfn3Kmj
        jdTof4NxBPWdi8SkUN9gbaH4qZMLU59juuEd2fM=
X-Google-Smtp-Source: AMsMyM5mz3AyGVGUjs64ztiZ8jLTD6vuWi8Q2ktVP7OaVqbvnBliCbxIy/fr43OWxh//b+OpIdMHQIq0HkRF1DOtzQQ=
X-Received: by 2002:a05:6871:6a4:b0:13b:a056:f97f with SMTP id
 l36-20020a05687106a400b0013ba056f97fmr21374670oao.38.1667573874523; Fri, 04
 Nov 2022 07:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com> <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com> <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com> <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com> <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com> <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
In-Reply-To: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 4 Nov 2022 07:58:12 -0700
Message-ID: <CAF6AEGsA_AqMm2csMv_21Y8wFdbnCiYT36AEUszGK63zJM0hqw@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Stone <daniel@fooishbar.org>, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 2, 2022 at 5:21 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Lucas,
>
> Am 02.11.22 um 12:39 schrieb Lucas Stach:
> > Hi Christian,
> >
> > going to reply in more detail when I have some more time, so just some
> > quick thoughts for now.
> >
> > Am Mittwoch, dem 02.11.2022 um 12:18 +0100 schrieb Christian K=C3=B6nig=
:
> >> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> >>> [SNIP]
> >> As far as I can see it you guys just allocate a buffer from a V4L2
> >> device, fill it with data and send it to Wayland for displaying.
> >>
> >> To be honest I'm really surprised that the Wayland guys hasn't pushed
> >> back on this practice already.
> >>
> >> This only works because the Wayland as well as X display pipeline is
> >> smart enough to insert an extra copy when it find that an imported
> >> buffer can't be used as a framebuffer directly.
> >>
> > With bracketed access you could even make this case work, as the dGPU
> > would be able to slurp a copy of the dma-buf into LMEM for scanout.
>
> Well, this copy is what we are trying to avoid here. The codec should
> pump the data into LMEM in the first place.
>

For the dGPU VRAM case, shouldn't this be amdgpu re-importing it's own
dmabuf, which more or less bypasses dma-buf to get back the backing
GEM obj?

BR,
-R
