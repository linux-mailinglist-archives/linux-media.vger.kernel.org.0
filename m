Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C0448F401
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 02:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbiAOBRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 20:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiAOBRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 20:17:55 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B28C061574
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 17:17:54 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id p27so23965962lfa.1
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 17:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DSUCsXvUq5CC+YLJR6sM+UncKVzG/eChv6GRiJ5ewuo=;
        b=Km7B94yItHq7aVfP1T9NUkUg0CfyYu53x8ocQbPhc+dKDkm2Z3Qdmqq6lhxvM80Pks
         16ttYCCVWt7dbiTvfB/TJxujAvsC6cSa06GEpsKkkuaeQlcM8M+t4u99s5lARvhfxInW
         Ci1oy5mNVTaPwV+2dSBlSscKmvmZ+mg0LMkcK6MV3GSRb+XMtxMOJgcgXRxQrrOziDKZ
         Bc7zRC9XKZDw0XoE+bVrA4iEkQtZ7fVhKAaqedPN8V6l0oR6BZz+wRBmSzU31XZDthCr
         spefGhSvdjB+tbrWX7EjLUw/q7lrjUel8Kaldz+FP/57vDBGGjvW2MPQW/bngKKnr/RE
         IoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DSUCsXvUq5CC+YLJR6sM+UncKVzG/eChv6GRiJ5ewuo=;
        b=CiLm/43bBDCIIPhVEujD6EkvQ8ptt8Ewhu0r7iCpJ1vq5fW9upALBxIF+473SllbXA
         YDL4+f7M2oOAs4XN79FPoRkHzh32uB4dNJrSLaie62cBV224RSp1NE19Ui3IhV7Esfk8
         foNPSLRqM86zLJUeVw224EoTa2//dttHImsVI5ny8t5xhkdHEIcqJbS1mghzk4Xctr/u
         luhkhGDJqTb+7IQO3tmrLjMHS+tXcgKbVKm3oA8d6DyszsHy3GCCGLFAlAQnUncVX9c0
         sBs875Jokl/a7/wfueC/0xrqMNYWTICLEjJ6MSAQeaWFpth0T5UUF1roloRGEXiKB6hz
         nxng==
X-Gm-Message-State: AOAM532tnX+ZPaU4W0al+CEjwVWz1Mlgo9JymZ8rtt74e0z6muczfs5G
        qYhZLMmuiHMlurKDy9c/wZz3IYatp5t/OzIeoIipKA==
X-Google-Smtp-Source: ABdhPJySDowHRxGMfXN2K9VReVwH+SUfch9JrimtyE5ccTX6eX5LjL8lOKhq1C4RF1mflvPlwsqfGtTGOZn0hxrfPFg=
X-Received: by 2002:a05:6512:3e1f:: with SMTP id i31mr4004663lfv.661.1642209473081;
 Fri, 14 Jan 2022 17:17:53 -0800 (PST)
MIME-Version: 1.0
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com> <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com> <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
 <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com> <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
In-Reply-To: <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 14 Jan 2022 17:17:39 -0800
Message-ID: <CALAqxLUSjHoLpgFLcvqmDfv7Uip2VwHS5d_5x2nzw=P3rA2NDA@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To:     "Guangming.Cao" <guangming.cao@mediatek.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
        "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "lmark@codeaurora.org" <lmark@codeaurora.org>,
        "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
        "bo.song@mediatek.com" <bo.song@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "labbott@redhat.com" <labbott@redhat.com>,
        "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
        "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 14, 2022 at 4:04 AM Guangming.Cao
<guangming.cao@mediatek.com> wrote:
>
> On Fri, 2022-01-14 at 08:16 +0100, Christian K=C3=B6nig wrote:
> > Am 14.01.22 um 00:26 schrieb John Stultz:
> > > On Thu, Jan 13, 2022 at 5:05 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > > > Am 13.01.22 um 14:00 schrieb Ruhl, Michael J:
> > > > > > -----Original Message-----
> > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > > Behalf Of
> > > > > > Ruhl, Michael J
> > > > > > > -----Original Message-----
> > > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org>
> > > > > > > On Behalf Of
> > > > > > > guangming.cao@mediatek.com
> > > > > > > +   /*
> > > > > > > +    * Invalid size check. The "len" should be less than
> > > > > > > totalram.
> > > > > > > +    *
> > > > > > > +    * Without this check, once the invalid size allocation
> > > > > > > runs on a process
> > > > > > > that
> > > > > > > +    * can't be killed by OOM flow(such as "gralloc" on
> > > > > > > Android devices), it
> > > > > > > will
> > > > > > > +    * cause a kernel exception, and to make matters worse,
> > > > > > > we can't find
> > > > > > > who are using
> > > > > > > +    * so many memory with "dma_buf_debug_show" since the
> > > > > > > relevant
> > > > > > > dma-buf hasn't exported.
> > > > > > > +    */
> > > > > > > +   if (len >> PAGE_SHIFT > totalram_pages())
> > > > > >
> > > > > > If your "heap" is from cma, is this still a valid check?
> > > > >
> > > > > And thinking a bit further, if I create a heap from something
> > > > > else (say device memory),
> > > > > you will need to be able to figure out the maximum allowable
> > > > > check for the specific
> > > > > heap.
> > > > >
> > > > > Maybe the heap needs a callback for max size?
> Yes, I agree with this solution.
> If dma-heap framework support this via adding a callback to support it,
> seems it's more clear than adding a limitation in dma-heap framework
> since each heap maybe has different limitation.
> If you prefer adding callback, I can update this patch and add totalram
> limitation to system dma-heap.

If the max value is per-heap, why not enforce that value in the
per-heap allocation function?

Moving the check to the heap alloc to me seems simpler to me than
adding complexity to the infrastructure to add a heap max_size
callback. Is there some other use for the callback that you envision?

thanks
-john
