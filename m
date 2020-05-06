Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9FF1C6F5A
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgEFLas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725824AbgEFLar (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:30:47 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65204C061A10
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 04:30:47 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id z25so918381otq.13
        for <linux-media@vger.kernel.org>; Wed, 06 May 2020 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/mnRlrL4hTk5ZWZZBpQB+A2vYhFKnlQEEPlCkWsPZE=;
        b=ahVcX9y0875VtYAfqeLGE8/rEUacYR6cv0gOwEAGAK2TtEt3EZqIgzdUxj8+oqmEtg
         x9e9VKyqjWNyJMH3BbsQqcIEjgMedce3ldo/d88jKQw534PPBjFG3b1ecntQ/L+MSrcl
         ZSsO+EEouEiGHHSZtucCvwmF6m6HWcUfia96aiIq5kRGKvsJhToKu+3nBY4adWL1wQj9
         Zgu3L2lTon+z/3KU5UDDwaKQWxILJ9o47N4Yzpd9MGuGXRq/E0gFe5pgMh3uEVm/hpkD
         otLpeiuEMsLF4/Qq9XuYwSDdlDq6/9PsatWSJf8CRiWCWwW7t7ejcu+eVg5Gn6WRWeku
         k3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/mnRlrL4hTk5ZWZZBpQB+A2vYhFKnlQEEPlCkWsPZE=;
        b=irZrJ+fMgnW5TrXmyWITWXrS+gZl1MW13wkfKSQSBiw2j/2gMo3YoPC+Qei7yQaNfH
         H8kd0KV+2ddm1TIPGpq738/1gCNW5uRaUrn5khuwmOrryo6Yam0xmVYAyBmXyr6juTa8
         SRkF7qXaEUCBTluFNyvTQSNghH6L4fs/Apa03/HoRZd8I3EEzM8/Rg5DAAaVyE5BDoen
         AUEUzC356ULlAAQQBe23ehZ3+GDSONNyYiuQ1X6I6i2Q6YwHMz0raVVJ8FIBOjr+Bafg
         vRQlCl9XURCnqiLl7DM/MnQaBUuTVFW0nCs1z8M2Wk2KkhiMcXpMF997UcKx8qbsdUEJ
         Y3IQ==
X-Gm-Message-State: AGi0PubqSvNyY77P6BjQrbQ6LLSI+U///vs994WJSf7fexPb0F6r1kbc
        N1PAO7xpQJ6zV9x7cU2Q9JyM7WEwuvjQ+Jg748y5fg==
X-Google-Smtp-Source: APiQypI10Opg1+VL0qGtAj9swPO65KogncWTx9LO8yV8j8xz4TIqaR59fBT2pvHi/zHAbFL61M3nNSKybpyU+5oO17k=
X-Received: by 2002:a9d:7645:: with SMTP id o5mr5754004otl.272.1588764646808;
 Wed, 06 May 2020 04:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-2-robert.foss@linaro.org> <20200505154913.GA17438@bogus>
In-Reply-To: <20200505154913.GA17438@bogus>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 6 May 2020 13:30:35 +0200
Message-ID: <CAG3jFytNwG0tZJnf-qCGEzY_cXucMDYxmCn8z4QW+EHrab8m_A@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <mripard@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Rob!

On Tue, 5 May 2020 at 17:49, Rob Herring <robh@kernel.org> wrote:
>
> On Tue,  5 May 2020 12:01:29 +0200, Robert Foss wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > This patch adds documentation of device tree in YAML schema for the
> > OV8856 CMOS image sensor.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >
> > - Changes since v9:
> >   * Remove remote-endpoint property
> >   * Marco: Make port property required again
> >   * Sakari: Remove Ben as a maintainer
> >   * Sakari: Replace data-lanes with const items
> >   * Sakari: Remove clock-lanes property
> >   * Sakari & Rob Herring: Change type of link-frequency
> >     work around dt-schema bug
> >
> > - Changes since v8:
> >   * Maxime: Added r-b
> >
> > - Changes since v7:
> >   * Marco: Make 'port' property optional
> >   * Maxime & Sakari: Add 'link-frequencies' property to dt binding
> >   * robher: Improve description for 'port' property
> >
> > - Changes since v6:
> >   * Marco: remove qcom specifics from DT example
> >
> > - Changes since v5:
> >   * Add assigned-clocks and assigned-clock-rates
> >   * robher: dt-schema errors
> >
> > - Changes since v4:
> >   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
> >   * Add clock-lanes property to example
> >   * robher: Fix syntax error in devicetree example
> >
> > - Changes since v3:
> >   * robher: Fix syntax error
> >   * robher: Removed maxItems
> >   * Fixes yaml 'make dt-binding-check' errors
> >
> > - Changes since v2:
> >
> > - Changes since v1:
> >   Fixes comments from Sakari, Tomasz
> >   * Add clock-frequency and link-frequencies in DT
> >
> >  .../devicetree/bindings/media/i2c/ov8856.yaml | 142 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>
