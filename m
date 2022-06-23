Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEBD5578AE
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 13:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiFWL2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 07:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiFWL2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 07:28:05 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582401018
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 04:27:55 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id i15so30456175ybp.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 04:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HQf7Xetq2qw6O5KGu3AbqobLNDGED8NEFyUud0J6jJM=;
        b=VEN3Qne6XvMDufDpYDjue8IlCIvivVl8JFu/jLxgngalD1/GMI3oF0ptB6V7/xOt3K
         56nk6EdjeK21hW+EgnPmUcQjhTOZu2L+nCHZ/dz7r5YcIt6BualYKr1jTrtCN6NK2GnI
         5eO64xmF1te0Lg3+balozAi+GTh2Xnjc0UewkUU8P25Xf7ad2UW656SYSbbGFnqga39u
         jccbLKVhWMro6OEjZj8SgFJXOS163jz+dK1yqRaOvVc5XCM+QHihtGx0Cz5Uq/K30XU5
         4qSphkxZC9JI9PIYLmimuvhocycPMlHijZggDOE863PMPKGvpYdJ0RsYDD21fTqWOgSH
         OkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HQf7Xetq2qw6O5KGu3AbqobLNDGED8NEFyUud0J6jJM=;
        b=7kMszGeh3unYCB/emruiUxgVhRi2Gh0kN1fdvv5wthoj5v6U1jHxV2SSTCijOA8wxt
         208oChupbYcLP9AfMxH4ByO3We3Ji4NF2ve3ROtuX+8/RQd4XsWn2aBiX0ldhsAI+7Fh
         0Mt14h74iGZHhxrylS9mNt1PLYa7igQ3i+YNWfnjebg9fdmL9c26Cn0SsQpyfQ4uKbTG
         A4QEdiUg1P/D7jn89muCSmC4bmRddxZHsB7ju85i2affLMN9fXSSxbNZUuU0CRyZPwvS
         MdLL2fKDxhTFO+85i/5bJc7Q0SnXmgO82GvDCS0ZrmRvVln+7M7YgpDbCRQS7OaVn3XK
         4m0A==
X-Gm-Message-State: AJIora+Z/p9Hd4Haf4TqcceZE8zV6dHa2cE2zvo5KJcdFWo8JcxlfFWt
        z+8NaGNOrP7xFI8X9kUwqS4yjH0QHuL+jJnWJIDrHQ==
X-Google-Smtp-Source: AGRyM1tqH9BZAOHPTjQSl2yFEhXyjX3QtI5AG18dKht12xn42EllI+c4QF+m43lD/JpEaOKNqaydDkuDMX/OPwRgqBs=
X-Received: by 2002:a05:6902:c5:b0:669:1646:b07 with SMTP id
 i5-20020a05690200c500b0066916460b07mr1220654ybs.553.1655983674521; Thu, 23
 Jun 2022 04:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com> <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com> <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com> <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com> <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com> <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com> <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
In-Reply-To: <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 23 Jun 2022 12:27:26 +0100
Message-ID: <CAPj87rOykZv7bjNhHPT4StrsPz8Y_DWqab4Ryq=Qqh77LS2e=Q@mail.gmail.com>
Subject: Re: DMA-buf and uncached system memory
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linaro-mm-sig@lists.linaro.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On Thu, 23 Jun 2022 at 12:11, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> > In fact DMA-buf sharing works fine on most of those SoCs because
> > everyone just assumes that all the accelerators don't snoop, so the
> > memory shared via DMA-buf is mostly CPU uncached. It only falls apart
> > for uses like the UVC cameras, where the shared buffer ends up being
> > CPU cached.
>
> Well then the existing DMA-buf framework is not what you want to use for
> this.
>
> > Non-coherent without explicit domain transfer points is just not going
> > to work. So why can't we solve the issue for DMA-buf in the same way as
> > the DMA API already solved it years ago: by adding the equivalent of
> > the dma_sync calls that do cache maintenance when necessary? On x86 (or
> > any system where things are mostly coherent) you could still no-op them
> > for the common case and only trigger cache cleaning if the importer
> > explicitly says that is going to do a non-snooping access.
>
> Because DMA-buf is a framework for buffer sharing between cache coherent
> devices which don't signal transitions.
>
> We intentionally didn't implemented any of the dma_sync_* functions
> because that would break the intended use case.
>
> You can of course use DMA-buf in an incoherent environment, but then you
> can't expect that this works all the time.
>
> This is documented behavior and so far we have bluntly rejected any of
> the complains that it doesn't work on most ARM SoCs and I don't really
> see a way to do this differently.

For some strange reason, 'let's do buffer sharing but make sure it
doesn't work on Arm' wasn't exactly the intention of the groups who
came together under the Linaro umbrella to create dmabuf.

If it's really your belief that dmabuf requires universal snooping, I
recommend you send the patch to update the documentation, as well as
to remove DRIVER_PRIME from, realistically, most non-PCIE drivers.

Cheers,
Daniel
