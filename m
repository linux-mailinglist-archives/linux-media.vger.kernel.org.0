Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B0A28088F
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 22:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387407AbgJAUkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 16:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgJAUkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 16:40:31 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDF5C0613E3
        for <linux-media@vger.kernel.org>; Thu,  1 Oct 2020 13:40:30 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j3so65113vsm.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2020 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CpqtefYRObu1FEKmxeMO9SEOBqtBM7OcMS8gCbom+4g=;
        b=NuSBvqifaloJ9Izw7NJIfbEVsg1AENReTiyPJpqc7CgU+rYJLsh7SsQhSQQY0DRaiE
         iP/X+xTTtJU9vw13M9iQt0cSV2eolmnDwf6GbmJvcUZwJjVl9z4D5w9VwINIZBAgW1hv
         kWY+FH9GyKNDnbpqe/r7USGJ2XJtaVyQXKVfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CpqtefYRObu1FEKmxeMO9SEOBqtBM7OcMS8gCbom+4g=;
        b=NcUGKzm6KjM7BY9tG0ns/xOexIsyDLc8iDMyMck5s7zT/G4Om61OoCKjypI163igMO
         saJj9jK0Ajwq/UKP6ZVP+s8NBl+z/z1ogOEmiGwcrqGc+Z9GZT/cMW5ERVo4rEaMOhyh
         C83ZqPhYxhofv7y5NhQFkVF2Dk4Pf4UQIsmlXsIA23eA+fRaGtqT7KTu8iEuNANe6OVZ
         CkN9BHEWoDYnbB77OKUNaIxOFpmC1++gLUihZYxEwNceNLvkNtvxz6VQ+drLphM5iGKs
         oxJ+IfB2C7EMV6PObO1hWrOBkblhyUzl+Lfy51d3D2qXkKG6wIjAdGw0u6NxlblSL6k5
         oCMg==
X-Gm-Message-State: AOAM5318LZMSDzWCTWrcdFi63SktuTrcDKdaZqH2iIC0oZzP7PpJGCwz
        PEmkqqbSDYOvht2IF/pJi0qAA9SiYt5LkQ==
X-Google-Smtp-Source: ABdhPJz0MldYJvsXXXoj6s6XR9FO/6nlT0mSmu4GaLc9D4MavI+cPDa4QHxnMR8dH+qVbdyKrW9QXA==
X-Received: by 2002:a05:6102:1cb:: with SMTP id s11mr6818556vsq.7.1601584828562;
        Thu, 01 Oct 2020 13:40:28 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id n197sm936596vkn.30.2020.10.01.13.40.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 13:40:26 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id r24so44765vsp.8
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2020 13:40:26 -0700 (PDT)
X-Received: by 2002:a67:8bc2:: with SMTP id n185mr7285582vsd.49.1601584825983;
 Thu, 01 Oct 2020 13:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
 <34ed34bd-90fd-0e84-6020-c487d612ad2f@codeaurora.org> <aec87de2-500d-763c-df01-c0daec56b1e2@linaro.org>
In-Reply-To: <aec87de2-500d-763c-df01-c0daec56b1e2@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Oct 2020 13:40:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=OCQpVL6VOVd4B6rW7HFC5S-wGauMAsOdvzwjLzKLuw@mail.gmail.com>
Message-ID: <CAD=FV=U=OCQpVL6VOVd4B6rW7HFC5S-wGauMAsOdvzwjLzKLuw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] DVFS support for Venus
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Sep 16, 2020 at 12:26 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi,
>
> On 9/16/20 8:33 AM, Rajendra Nayak wrote:
> >
> > On 9/1/2020 7:50 PM, Rajendra Nayak wrote:
> >> Rob, can you pick PATCH 1 since its already reviewed by you.
> >> Stan, Patch 2 and 3 will need to be picked by you and they both have
> >> your ACKs
> >
> > Rob/Stan, any plans to get the patches merged for 5.10?
>
> 2/5 and 3/5 are queued up for v5.10 through media tree.

Normally I'd expect device tree bindings (patch #1) to go through the
same tree as the driver changes.  Does the media tree work
differently?  If you're expecting Rob Herring to land the device tree
binding change, is he aware?


-Doug
