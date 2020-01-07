Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017FD132D4B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 18:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgAGRm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 12:42:28 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42418 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbgAGRm2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 12:42:28 -0500
Received: by mail-ed1-f65.google.com with SMTP id e10so270750edv.9;
        Tue, 07 Jan 2020 09:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LABArYIBTiCBqpvAc1g4DKIzzGE5BaECmo8/5rNW5Yo=;
        b=M+1tX0cdquPDQPKo8jC1NNTPB+tCcEblWSNV2c1bKgZ3cpjJ0ONl3pjcQldy9Vquss
         EoB1eoeBU4PmxwhYdLBgMbx8WY3YPTCMMS7s90WOPP8Z0aRawh4sleqHZL9tVL9G2xcw
         SYoz3GZXA+BVt/PGywXAouw1qWnA0eShAOFRS5JKxIceoO4SDW6f6eSFYPJKiHSAdAV+
         SbWhdz4oN/7BryVmheQDN73CEslkIQlbaaFizCINomHZpwxmxKsVLhkvukZYtZAHq847
         O52xju5MdDvEFBmk80sDm5BC/zp/sftjGDg8PjHjSRiie//aon4yp+7H3UZ2UaCM9/ks
         IIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LABArYIBTiCBqpvAc1g4DKIzzGE5BaECmo8/5rNW5Yo=;
        b=qfaIdDGqMcjEoYlq/dffLdmsZ4SHWFfrYMK30PiOEu6Md1fLvqkF2s9pNuF8A3fl7y
         gLwZjlJqxiAXdmqEXhkJKmzdg4RIJCoz1A7ZdJt2bDCJhl2BNLCzxu72kfek2je2lFZp
         fFaSe0LzHbxGQsjkeJIzPXUUKzUYFOd6ZMT6vb4SFx56IaZiEwy5kMvtWHbjm386msrr
         SbdDBgLhChs5X5bxlM3aZCjulj+Yp1HhYBok1NN6lVi/J8e0ob8BczYgnQ/1cV4CuUyu
         ylN+0hIhs3OlWFe2XHMlmHFqxAcoLk4RnzdLIRRxHd/DPRh5OCsaZtfHdQEi18QOu/Ul
         ZzJg==
X-Gm-Message-State: APjAAAVlRhbLQJHq2o585Y99Vvk1gsrdMaUwO85BjCez8pw+P7JSCU1q
        TG587pYOqjFAb2fQEkJ0TW8LhdRz9QDtCSdd9AiAoyez
X-Google-Smtp-Source: APXvYqzCji7o4LITZ60ec3cTESKiZHLPmYOHULS2fwrjia5OB6zJoQdN5qBmkOVxpt7ZuGVChhNpxWCz4Bj92iuh2gU=
X-Received: by 2002:a17:906:4888:: with SMTP id v8mr529477ejq.329.1578418945490;
 Tue, 07 Jan 2020 09:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20200107143402.122455-1-acourbot@chromium.org> <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
In-Reply-To: <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 7 Jan 2020 09:42:14 -0800
Message-ID: <CAF6AEGvgYB8w_GD-6_XywKk4XkS6bFFCiJHeY-CSz71Foz7JTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        linux-media@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 7, 2020 at 6:51 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Alex,
>
> On 1/7/20 4:34 PM, Alexandre Courbot wrote:
> > Cheza boards require this node to probe, so add it.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > index 9a4ff57fc877..35ba65cd9822 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > @@ -1279,3 +1279,9 @@ config {
> >               };
> >       };
> >  };
> > +
> > +&venus_codec {
>
> We have similar patch for sc7180 and call it just "venus". Do you think
> we should shorten it here too?
>
> > +     video-firmware {
> > +             iommus = <&apps_smmu 0x10b2 0x0>;
> > +     };


btw Stan, not sure if you noticed, but Bjorn started adding
firmware-name properties so we can have different device specific
subdirectories for signed fw (ie. so one /lib/firmware can work on
multiple different devices).  I'm just looking at doing the same thing
for gpu zap fw.  Afaiu the venus fw is also signed, so I guess it
could benefit from the same treatment?  Not sure if that is something
you've already talked with Bjorn about?

BR,
-R

> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index ddb1f23c936f..7b913688cc6d 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2567,7 +2567,7 @@ usb_2_dwc3: dwc3@a800000 {
> >                       };
> >               };
> >
> > -             video-codec@aa00000 {
> > +             venus_codec: video-codec@aa00000 {
> >                       compatible = "qcom,sdm845-venus";
> >                       reg = <0 0x0aa00000 0 0xff000>;
> >                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >
>
> --
> regards,
> Stan
