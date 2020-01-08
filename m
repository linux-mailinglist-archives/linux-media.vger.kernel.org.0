Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD0631339A8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 04:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgAHD13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 22:27:29 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41987 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgAHD12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 22:27:28 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so2200835otd.9
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 19:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xceLEnO3BCgE8gw6ehmf7oIvMEjYUFeqhS/nKgWDqFI=;
        b=csH6h22WfZnD1xkdgwOCne3Jv32LmlbUzVEaLBevEMe50H5rAy4ECEVfBiovZy8xDu
         b6pHK8e06WX+imuJ6fHw26HY714lCwLnbniIGh5DWXQQ+ipOUvm0uHPExjCoeL58F4te
         MCDUDMy2u+PUNUzChxap4ixBAdfsjM/rm0ovA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xceLEnO3BCgE8gw6ehmf7oIvMEjYUFeqhS/nKgWDqFI=;
        b=WudNIG7du8vS2j0sXbdijskuPzGyB/763YnFbFoq+fUmE3vbp/Pk4PpW8eNC29GHCU
         AZft4IjvBzkqnO/vvFO+agzyjW32aepd12Rn8PH39XuJPWURGlCLN+0rAfp9zjiivvo0
         SAOvH5upUEmEmXx4amDAE1shF3vANfAKniq9RuvCDK+1qBMJUtC+qJ00E2L6lv5e7tqB
         xf3g5rOJmM2qKSmy/BieQPJ3OtEsT5gqsDjDC6SvGdQCXhU5smOCBnBMdHQHzJjCnShj
         b8GXGhjXoow7W7WbKD9/EQnis1fCCiWGK+QY2CsiI4w6G7uOB/j5GAQnb5JZ1j3Pdce7
         cGsw==
X-Gm-Message-State: APjAAAVadRc89jY2vGoV+fEmbX1hnmvjUjO8sQ+sGG5i6LR6AgEtUKcq
        MbrArxSqVH2LjML/rxeZt2evKsEbwP79jQ==
X-Google-Smtp-Source: APXvYqw8pZXoSJXJfMwNSZuSVejox064OG+A2JF+lBE5P4xttYGqGeb4ysQovo/pZ79sA/VQsyDEQQ==
X-Received: by 2002:a05:6830:120b:: with SMTP id r11mr2497931otp.254.1578454047693;
        Tue, 07 Jan 2020 19:27:27 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id o101sm646420ota.69.2020.01.07.19.27.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 19:27:27 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id p125so1435889oif.10
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 19:27:26 -0800 (PST)
X-Received: by 2002:aca:d0b:: with SMTP id 11mr1457408oin.71.1578454046328;
 Tue, 07 Jan 2020 19:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20200107143402.122455-1-acourbot@chromium.org> <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
In-Reply-To: <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 8 Jan 2020 12:27:15 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWY6OEc2EbPW=k8vFU32POamNs0FHJus8fg1u5A2uxrzg@mail.gmail.com>
Message-ID: <CAPBb6MWY6OEc2EbPW=k8vFU32POamNs0FHJus8fg1u5A2uxrzg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 7, 2020 at 11:50 PM Stanimir Varbanov
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

Sure - sent a v2 with that change.
