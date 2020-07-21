Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A042283DD
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 17:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgGUPcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 11:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgGUPcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 11:32:42 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F733C061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:32:42 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n22so19135832ejy.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuoRboIrDtHdHoQidzkzoSwQMk1s3aFFSZEM0pDEqow=;
        b=Znk3eLr23Z/ICXVBqyXBqBCwMcIQjNOi/+KSWFZKEerLUTzA28fLYJI9vubtQlDkQT
         gTwXaoT3oyrkTx+lW6RVtmToC2oMMy7kyRnDvm/whPcckSPE41komV4dtZRovS4mEx9N
         MfnVmrqQAcemFMLI1F6eijGyW4qV/yFJV9u8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuoRboIrDtHdHoQidzkzoSwQMk1s3aFFSZEM0pDEqow=;
        b=Lb7z/onyAzTO061ogy8Vvuo697CMtdpPmEH7FkGdi+/AyF0WZ4abYrNp4+DFnXGafK
         Anso0G1nFRxsmnGA42SsUICkE7IYCh0B8XER43wpxaAl+EZ1p47wBsOgGXAjFyJLjy4x
         CE7iTeukvX+33RiHSMHMeIUyhZRvn9xBj7K+qmlUn/H/MXdO16YSYf12TOQPA6tlkkCp
         JrZU+hpjWq/rk/GFoNMLNjAkqx1SgNCA7B9PeSP+Hy39e24Zo+UeF8bBW08fTb184RL+
         A5e9pmPSYwA2h3VdHBJiJpNMCa+NEUZk3s4F/A5vIKw25YCJOYvzUYfnuTtic7tO3NmK
         qwZw==
X-Gm-Message-State: AOAM533F9aFElDWs481eeefSuUVmX0fU7d1g29s5cawhugLfXH2u3k5A
        Yn3zYTIskYOrm2fQDf0Jt3dIjOeumDY=
X-Google-Smtp-Source: ABdhPJz0fGTJkNes+j1iW9ULhs6uxLNAUDrrWWZiNe2+BQS4hjzBeJ2LOud3a4yPZujgdCizrM1u/g==
X-Received: by 2002:a17:906:7d86:: with SMTP id v6mr25251816ejo.542.1595345560499;
        Tue, 21 Jul 2020 08:32:40 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id jw3sm1722697ejb.32.2020.07.21.08.32.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 08:32:39 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id f139so3304017wmf.5
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:32:39 -0700 (PDT)
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr3051296wmg.55.1595345558904;
 Tue, 21 Jul 2020 08:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
 <20200718145918.17752-6-dafna.hirschfeld@collabora.com> <d8475ade-94a3-48ad-02d7-f03810ddf6dc@collabora.com>
 <114a3242-88e9-46a1-c8c8-f5bfd424d05a@collabora.com> <CAAFQd5BLuwfnQfYbaWmtre5YCx-_YG4E10cZxeL+6pESap_U0A@mail.gmail.com>
 <fa457a47-4005-8c64-d135-96b321ddd6a6@collabora.com>
In-Reply-To: <fa457a47-4005-8c64-d135-96b321ddd6a6@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 Jul 2020 17:32:26 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ATRvBapupZaBf6TkWcVwOy7C9+A95+vLHJiwuUca4LQg@mail.gmail.com>
Message-ID: <CAAFQd5ATRvBapupZaBf6TkWcVwOy7C9+A95+vLHJiwuUca4LQg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] media: staging: rkisp1: add a pointer to
 rkisp1_device from struct rkisp1_isp
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 5:30 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> On 21.07.20 14:36, Tomasz Figa wrote:
> > On Tue, Jul 21, 2020 at 2:26 PM Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> >>
> >> Hi,
> >>
> >> On 20.07.20 21:25, Helen Koike wrote:
> >>>
> >>>
> >>> On 7/18/20 11:59 AM, Dafna Hirschfeld wrote:
> >>>> The code in rkisp1-isp.c requires access to struct 'rkisp1_device'
> >>>> in several places. It access it using the 'container_of' macro.
> >>>> This patch adds a pointer to 'rkisp1_device' in struct 'rkisp1_isp'
> >>>> to simplify the access.
> >>>
> >>> What is wrong with container_of?
> >>
> >> I remember Laurent suggested it a while ago.
> >> I also feel container_of is a bit cumbersome and other entities already have a pointer to rkisp1_device.
> >>
> >
> > Do we even need the rkisp1_isp struct? Could we just pass rkisp1_device instead?
>
> pass to where ?  You mean to the function rkisp1_mipi_csi2_start ?

Yes, all around the driver, where rkisp1_isp is passed.
