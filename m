Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B339B4429B5
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 09:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhKBIp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 04:45:29 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:46794 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhKBIp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 04:45:29 -0400
Received: by mail-vk1-f169.google.com with SMTP id t127so9210207vke.13;
        Tue, 02 Nov 2021 01:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7D60swm9PvWLJeNxTF4fmKkedNp+6Pn6fPP3l3+EUaE=;
        b=C9dzS3VdKeXr+EFpVfNk7H74rE6dCIajMzST9bzxJ3DbYbsF+8J7NeUjP8iSSqvbyN
         mHJjNiZPMngkbYW2ywyI50JQjEVT3VgHD7XPRVhSO6ZlGrgZk60z2EaDG84pWPLBUHjt
         uXVu1MYNd22luly0ROXVLwOaFZqwHBBPfmL/LguT2aRSfWJl8Rt/ekPcrcMoLx5gtpJk
         3LzzRBdnB9sFb42uQmcujTXTjqbd7L9NMi5tS8m0WeI9tLJbhdmsiAbHb3k+cDOhWoei
         1XmJmqJd7rt95xofTjKkLxCGAXwn9FuUZy0dUJzcJqrj0meN05LsmSjrO5DSHBpJyWp2
         lrig==
X-Gm-Message-State: AOAM531r51jNnJriBJuhMA/sQQAOn6i06gTGnHOhZjsRYf1+y8Q3RrPj
        WF7lkbS70OhV5Rl8fwfnoH9QYyLB0FFBZQ==
X-Google-Smtp-Source: ABdhPJz9qwVqWg0g5s+2DGo1Kv7Zo4JA/zTNuE2Qha+TA1QclRrGrh9o/b9tVBIYaAECPmFYom2enA==
X-Received: by 2002:a05:6122:550:: with SMTP id y16mr1430516vko.0.1635842573766;
        Tue, 02 Nov 2021 01:42:53 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id t5sm2837956vsk.24.2021.11.02.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 01:42:53 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id h133so9210426vke.10;
        Tue, 02 Nov 2021 01:42:52 -0700 (PDT)
X-Received: by 2002:a05:6122:a05:: with SMTP id 5mr5132731vkn.15.1635842572695;
 Tue, 02 Nov 2021 01:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <097d8602906e9db279728330c6cf2837be184704.1635338663.git.geert+renesas@glider.be>
 <YYBdzwshhM5fmsEE@robh.at.kernel.org>
In-Reply-To: <YYBdzwshhM5fmsEE@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Nov 2021 09:42:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvy9oVCv+3HJ_dZr6Rm4iP8FPwTETxq+j2ja_BR1=c5A@mail.gmail.com>
Message-ID: <CAMuHMdUvy9oVCv+3HJ_dZr6Rm4iP8FPwTETxq+j2ja_BR1=c5A@mail.gmail.com>
Subject: Re: [PATCH] bindings: media: venus: Drop bogus maxItems for power-domain-names
To:     Rob Herring <robh@kernel.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, Nov 1, 2021 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Oct 27, 2021 at 02:45:30PM +0200, Geert Uytterhoeven wrote:
> > make dt_binding_check:
>
> I'd say it's redundant rather than bogus.

I wrote "bogus", as the "redundant" ones typically give:

                hint: "maxItems" is not needed with an "items" list

And I didn't get that here?

> >     Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: ignoring, error in schema: properties: power-domain-names
> >     warning: no schema found in file: Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> >
> > Fixes: e48b839b6699c226 ("media: dt-bindings: media: venus: Add sc7280 dt schema")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 -
> >  1 file changed, 1 deletion(-)
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
