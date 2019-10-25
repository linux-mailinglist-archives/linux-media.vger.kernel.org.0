Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD51E4389
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 08:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404083AbfJYGYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 02:24:51 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35867 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfJYGYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 02:24:50 -0400
Received: by mail-ed1-f65.google.com with SMTP id bm15so930600edb.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOzjiI+aLO7L41fx0EDRa/GMGZygrXsixVCymvktvqc=;
        b=e+7+3ylohgIdiVgnG3WVbaIXOn8nO6lMJ39tK4maohWa+gFxOa035aGLwpGG5WCIYZ
         8mKRvJdW/eSzckqMquCXkIR68QFE9thFyOFa9Li3Mf8exOc6RYpa4OdaeTZNqiaw9Pad
         ip8Hwj253mxIgGSQ5BMyEbWF0Zrt/vFcDNtY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOzjiI+aLO7L41fx0EDRa/GMGZygrXsixVCymvktvqc=;
        b=Uof6SNl88Tm1YF0tJkAfCLbLBfokg3OnOdwmIFsCUzUAIXPPoEKyXlApXyU0M99zoh
         fhluyKhVGjl/LOvcRAuwvKHeYc/47H/F5LV1I1QDfI9tuRBLNRfgoogAkQc7048Ywcdg
         BPfwxs1vlxvb1CwbiJoH1SCAGJdVxFG3BdfBFNW2gvbFoXFYZgPocIfh2CRiENJXyaQN
         Eun0xiWwbmbCGtBfWB3pU1FN2lt08WMvObM3cRqVqJDeylOPF+wrlSc0F2jVo4y4FMID
         kWq5rXkkrmgujWZbPy3rST30xxaf+/UvKHkIE7f1/wMgPwUImoalUNABK5LC/Au3PsCv
         SJAw==
X-Gm-Message-State: APjAAAWsN3womsgRvmHuKwSenogDH9T6L3/ZgfmJMNIy/2raWXxf6caq
        r1l+S2lpcPrJNSlCDGcfz7zYgJwqEdXvwg==
X-Google-Smtp-Source: APXvYqzBIPvQnSobvO3mgpuQ9wm1TfMKsPdvRdkgKTxXltjxSm98hKmiDj8OmYkQu3Wye9ZTpPj22g==
X-Received: by 2002:a17:906:76c9:: with SMTP id q9mr1806702ejn.53.1571984688349;
        Thu, 24 Oct 2019 23:24:48 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id b20sm28323edx.85.2019.10.24.23.24.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 23:24:47 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id q130so733872wme.2
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 23:24:46 -0700 (PDT)
X-Received: by 2002:a1c:e404:: with SMTP id b4mr1975763wmh.90.1571984686266;
 Thu, 24 Oct 2019 23:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190905114210.9232-1-p.zabel@pengutronix.de> <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
 <20191005133920.GB19943@aptenodytes> <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
 <20191005141228.GC19943@aptenodytes> <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
 <20191016133756.GB325584@aptenodytes> <a020830817e4be787067aa82d56331979d80f53e.camel@pengutronix.de>
In-Reply-To: <a020830817e4be787067aa82d56331979d80f53e.camel@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 25 Oct 2019 15:24:34 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CfYyc8CmVix-N6XCgOJ5nTi=9VONN0WMv8iu--u=XA4g@mail.gmail.com>
Message-ID: <CAAFQd5CfYyc8CmVix-N6XCgOJ5nTi=9VONN0WMv8iu--u=XA4g@mail.gmail.com>
Subject: Re: [PATCH] media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active
 fields
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 17, 2019 at 12:08 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Wed, 2019-10-16 at 15:37 +0200, Paul Kocialkowski wrote:
> [...]
> > > > The bottomline is that we have use cases for each of the two set of fields
> > > > independently, so I feel like this is reason enough to avoid mixing them
> > > > together.
> > >
> > > What do you mean by mixing together? Hardware parsing the slices
> > > always uses num_ref_idx_l[01]_default_active_minus1 from the PPS.
> > > Hardware not parsing the slices always sets override to 1 and uses
> > > num_ref_idx_l[01]_active_minus1 from the slice header struct.
> >
> > To summarize, what I don't understand is why it's worth re-purposing
> > the slice header's num_ref_idx_l[01]_active_minus1 to contain
> > num_ref_idx_l[01]_default_active_minus1 when the flag is not set in the initial
> > bitstream instead of exposing the flag.
> >
> > There's hardware (like cedrus) which takes both fields and the flag directly
> > in-registers, so it's really not a simplification here. And even in cases where
> > the hardware only takes one field, I believe that the downside of re-purposing
> > the field of the control is much greater than the benefit of the supposed
> > simplification.
> >
> > I know this sounds quite futile, but I thought there was an implicit agreement
> > that controls must stick as close as possible to the bitstream. This is an
> > occurence where we are diverging for no particularly strong reason.
>
> FWIW, I agree with Paul on this. That drivers for codecs which do not
> parse the slice headers always completely ignore the
> num_ref_idx_l[01]_default_active_minus1 fields, but instead expect the
> num_ref_idx_l[01]_active_minus1 field to be repurposed to contain the
> default values if the corresponding fields do not exist in the slice
> header (that is, when the num_ref_idx_active_override_flag is not set),
> confused me at first [1].
>
> This seems to follow what libva does [2], and it does simplify drivers a
> tiny bit, but I'd still prefer to explicitly have the
> num_ref_idx_active_override_flag contained in the API, and to have the
> num_ref_idx_l[01]_active_minus1 fields only be used for
> num_ref_idx_l[01]_active_minus1, and not have them sometimes contain the
> values of another field.
>
> [1] https://patchwork.linuxtv.org/patch/58580/
> [2] https://github.com/intel/libva/blob/95eb8cf469367b532b391042fa0e77ca513ac94e/va/va.h#L3138
>
> > Expecting that userspace does this pre-processing of fields feels quite
> > counter-intuitive and confusing for people wishing to use the API, too.
> > One would certainly naively expect that the fields in the controls carry the
> > same meaning as in the bitstream when they have the same name.
>
> I certainly naively did.
>

Okay, I think you convinced me. :)

+Alexandre Courbot to be aware of the upcoming UAPI change.

Best regards,
Tomasz
