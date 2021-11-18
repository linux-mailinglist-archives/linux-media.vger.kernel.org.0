Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C76455B28
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 13:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344481AbhKRMGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 07:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344473AbhKRMGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 07:06:37 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91896C061767
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 04:03:35 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o6-20020a17090a0a0600b001a64b9a11aeso5476452pjo.3
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 04:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YI1Lh1+u9y2Rdr5uc1zvo5rFFoVd9BpEe5RkTQkaRgk=;
        b=KOp8Ene37x19VH16WN233yfPR54BHDHYa4nb0L5nnvxvqubFe6QxQWhRSmpkMbif8s
         V+3b6m72vpyuv0BwIv20K2pcuOREx/enp1DIkzPg45sf8nOiledNOaxMgZoKhMiPzsb1
         YxueZ5VqrcZNRefvmUMg9kYOs/ilnbBA+xXQloVPEFCnI+6OOE5rS91wfnJXeqHB3N9k
         mmU341jzl1j48f8W4C+gBJmjP1pGCeP3oBIl4c8TJSy62CZ1/dLtJmCkwVP6c7Fiws8m
         Dyyd/l/kFcV5rl7HByK1ZbXJ3wpEbCCnr1abtQG0q25z5RBJEjW0ezDv0fCoyANw0PU5
         mzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YI1Lh1+u9y2Rdr5uc1zvo5rFFoVd9BpEe5RkTQkaRgk=;
        b=778AYj0rSIxxnTFmOTrah3VQ4AlgruNt5vN50nieNnJ2H9IBLf2LK2g/aaTBEIuNK7
         v8UCBArQjwW1d9dmjELBIvneMTe8pPqdAahlo0nahtf1WpndMij5WLNoiXjOOxoS9qQX
         eO0tzBYjQ6l4VcPqIFtElqnbvmFwZ4pUeaEl32LvWah7FbFzB5fmubSwiT7BnO8bu+hG
         P360/oQMIBxnvRANyYEUy0VaTCa7t1DyuCCPhvlsNOzho8N/AjFGkkSYLaHPnkAEHAwu
         Ie65/k6VyzozqNzi6SRMy8hXF5g3+ZPm8qlV0GXZKtiC+f3VCnpacfK/Z11pqbnrIXdE
         y0Sw==
X-Gm-Message-State: AOAM532xPeZ4/x90j+4n6V+y8LkS0RnjMe8F6Zq+NmNdsvUOgDXNYCM2
        ONNI14XPVikUsll2HEBs+Fvn9SojeQ/7LPkU4FlD1w==
X-Google-Smtp-Source: ABdhPJw6Gr+Smw+R053iYguuCDSumjKjHrfO8w2JPvCxw/fo3NTdSoxbKbNhybeZ7l+yAfiOSe1QU4ydx1fHuauJw0M=
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr9826965pjb.232.1637237014885;
 Thu, 18 Nov 2021 04:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20211117113800.260741-1-robert.foss@linaro.org>
 <20211117113800.260741-4-robert.foss@linaro.org> <YZT4lddeEJAOkIc4@gerhold.net>
In-Reply-To: <YZT4lddeEJAOkIc4@gerhold.net>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 18 Nov 2021 13:03:23 +0100
Message-ID: <CAG3jFyuja1OYcSK6VCoRCwQ-O_CPU8eB_mzcH-y6azNAXosrew@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8916: Remove clock-lanes
 property from &camss node
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Stephan.

On Wed, 17 Nov 2021 at 13:42, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi Robert,
>
> small nitpick: The subject would be more clear with
> "arm64: dts: qcom: apq8016-sbc: ..." instead of "msm8916: ..." like in
> your sdm845-db845c patch, since only apq8016-sbc is modified.

Will do.

>
> On Wed, Nov 17, 2021 at 12:37:59PM +0100, Robert Foss wrote:
> > The clock-lanes property is no longer used as it is not programmable by
> > the CSIPHY hardware block of Qcom ISPs and should be removed.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 --
>
> Can you rebase this on 5.16-rc1? All of apq8016-sbc.dtsi is now in
> apq8016-sbc.dts (the extra dtsi did not have any good use).

Ack.

>
> Thanks,
> Stephan
