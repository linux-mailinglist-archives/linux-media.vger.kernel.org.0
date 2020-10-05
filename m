Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CB42834F9
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 13:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgJEL35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 07:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgJEL34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 07:29:56 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBECCC0613CE
        for <linux-media@vger.kernel.org>; Mon,  5 Oct 2020 04:29:54 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x62so3934432oix.11
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2020 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggA5atN6eXRjeLo7yvkHNomWP+hkWtIfIwIhYjP1RoY=;
        b=lfmbCeTLipcxNCXRSk9JM5iW0S48sRevkAiNTwMwzzjWmxq60GoNTNWIfkAnenaOB5
         DrvEfTr38jJPy93c3xrCyUT/aZr87z4leJZVuLUje7BWTJkUcXvcjHbsO/AUlcR4SbF/
         yDgDCBbxYo3HAZjc4V8xzdnZq1f4t5Z1W9PLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggA5atN6eXRjeLo7yvkHNomWP+hkWtIfIwIhYjP1RoY=;
        b=AVelr0+5bFY9rrGsjQorECaclQ4q1KcjUs7OATqZqQW37w+5F6KN5Hl2Moj+DvqGUe
         Plvxx255FzabjDnJrBTrzJAcF+pWy8xqbEfSFSJrZ8eAeFcmzLFsk+5vCA5UV91dzIvG
         wZamgmBvy0BB2cTXEmtasWXmFwiHqQFevwtX304YX2W7xrohxQQpXwA0QikcIh0CovFE
         Zxl/BfQLw74e6JzAJpeDG1rKhD4fGUiHSioByNyd6pj+VLi0j0PufDbwJU2EABz8FG2T
         NkB1jKc/CJFQ9Xw39zVgyQoBvAA64vnAAWgf0TVeEyAfgUdiTshWYQ1ITbUk7BI6nKrU
         2tBA==
X-Gm-Message-State: AOAM531Y/FPWINFLOxA9tC8PeqiSHjv3VfiU1KtfsnC6VSfA6DuBvnQH
        C2xEY3hUt14Dl51iGQOHO5jPvVca93S09W/3
X-Google-Smtp-Source: ABdhPJyxp+qopT1wl6XE7MUG+4Z+fH/F9i1MlhKbud8w8p+EJUfwY0h0mHyTPmgd2zE4I3sk8HuAqQ==
X-Received: by 2002:aca:c546:: with SMTP id v67mr5156287oif.24.1601897394043;
        Mon, 05 Oct 2020 04:29:54 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id v21sm831497oto.65.2020.10.05.04.29.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 04:29:53 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id q21so8208120ota.8
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2020 04:29:52 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr11285660otl.36.1601897392041;
 Mon, 05 Oct 2020 04:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org> <20201005084852.GD26842@paasikivi.fi.intel.com>
In-Reply-To: <20201005084852.GD26842@paasikivi.fi.intel.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 5 Oct 2020 20:29:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXujfdLaMhcW4vj2U_Ev-H74Fu-a6D1HEyhyrQ3huV8vw@mail.gmail.com>
Message-ID: <CAPBb6MXujfdLaMhcW4vj2U_Ev-H74Fu-a6D1HEyhyrQ3huV8vw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 5, 2020 at 5:49 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Alexandre,
>
> On Sun, Oct 04, 2020 at 09:22:34PM +0900, Alexandre Courbot wrote:
> > The addition of MT8183 support added a dependency on the SCP remoteproc
> > module. However the initial patch used the "select" Kconfig directive,
> > which may result in the SCP module to not be compiled if remoteproc was
> > disabled. In such a case, mtk-vcodec would try to link against
> > non-existent SCP symbols. "select" was clearly misused here as explained
> > in kconfig-language.txt.
> >
> > Replace this by a "depends" directive on at least one of the VPU and
> > SCP modules, to allow the driver to be compiled as long as one of these
> > is enabled, and adapt the code to support this new scenario.
> >
> > Also adapt the Kconfig text to explain the extra requirements for MT8173
> > and MT8183.
> >
> > Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> Thanks for the patch!
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks!

>
> I wonder if this driver suffers from similar object lifetime management
> issues than V4L2 and MC do, albeit not related to either. Say, what happens
> if you unbind the other device while mtk-vcodec is in use?

That's a question that maybe the driver maintainers can answer, but
from my experience during development I have been able to unload one
of the two mtk-vcodec-* modules while keeping the other one active.
