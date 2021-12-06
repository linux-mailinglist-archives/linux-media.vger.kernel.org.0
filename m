Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45071469C3C
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 16:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhLFPVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 10:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbhLFPT3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 10:19:29 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112C0C0698CE
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 07:13:43 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y7so7295236plp.0
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 07:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cnQqBSAo+K5oxr9l26dxH3RShjXf+td6E+PHuLLI4y8=;
        b=VQIiWgpFRexhnDvLc40hcuZW7IZloc67v1EO6pDc4gDJnAh0CPsQ5fznnTZhQcFJXW
         ktjxw6RbnBpLiUVoQ/VacQo/TSIwujyyBjZaLSEgclpiWnMOU0wdE/lJEBphP9+pWKl1
         MLh+Ujy0n3oE+c9MqT0iP4kmn7D/myUpNO+J5WgQ7hnBstrPn6rVBDc6ScOZQCYHYQoj
         +aICtAZrE2isxEmPRNrM5erhDnCag58kMThzQA/slIoLTYR09wAa1WJmPubjtobDJ1XZ
         9q3B9k6Z9uz/EgFWcroiQpydY7/DYNHpq0fI+n4mKDIt2+NZ47cNlDIXk/1cTE+i5Yn5
         t7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cnQqBSAo+K5oxr9l26dxH3RShjXf+td6E+PHuLLI4y8=;
        b=KguO94ScRzv4MIuHTJMW73MwNEuTuElYIWFPymV6cEaXvcdz8qzj8zQpipcedxuHXU
         J7fON660FC2D6AXl42Y59272ikOe24lcO+GnRnTZYF9MeKDyosAFo6/eRABjVgCYNjQx
         weMbp+gGzNnp0ejqStp0/Qj2yL8stuuA9oDRGAmD+xdHZ5oizoAib3e5LE4LRAgpmZQ1
         2h1HF+VFPWURrNtDn2CJSqgUT8rJff5ZQZnickgoDSFuOEzaa8YlEhYH0B3yrG1QN2oF
         EO6lkquadgbJlJEBZBJIBWd616dLKc/3P4oI3ZYFSD8Fh8UoqwDpHq0OrDOUzbwf15WP
         yxTg==
X-Gm-Message-State: AOAM53336GeEIkA5+OsOxUBBsF3JKaoNfx4T8VxaaEbdb5jziKqATmoN
        Txl4ZUMhC2ecUwMP8DjeJOAE7pfjkk4fv4mlXfxDHw==
X-Google-Smtp-Source: ABdhPJxLJ6uUWWiSZlny/JEj/mVjhmgg6C7BE3VsA338kjFc2t92GnAbloeXMtJTb10Jeu46/eWHG5/ObtlkLgQyN8c=
X-Received: by 2002:a17:903:2004:b0:142:6344:2c08 with SMTP id
 s4-20020a170903200400b0014263442c08mr44072941pla.51.1638803620589; Mon, 06
 Dec 2021 07:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20211118124819.1902427-1-robert.foss@linaro.org>
 <20211118124819.1902427-4-robert.foss@linaro.org> <Ya4nEMnZ3zQiXbaR@ripper>
In-Reply-To: <Ya4nEMnZ3zQiXbaR@ripper>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 6 Dec 2021 16:13:29 +0100
Message-ID: <CAG3jFytNQHK=dTHGzd57V_m_6YNwtD2zRYgBSjykd3whzqy9pQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: apq8016-sbc: Remove clock-lanes
 property from &camss node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 6 Dec 2021 at 16:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 18 Nov 04:48 PST 2021, Robert Foss wrote:
>
> > The clock-lanes property is no longer used as it is not programmable by
> > the CSIPHY hardware block of Qcom ISPs and should be removed.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Although I'd be happy to take the two dts patches through the Qualcomm
> tree, once the driver changes has landed.

Thanks Bjorn. I'll split the series and submit two fully reviewed v4 series.
