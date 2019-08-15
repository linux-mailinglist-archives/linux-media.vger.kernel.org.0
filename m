Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7588E5F5
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbfHOIMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:12:10 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41394 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfHOIMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:12:09 -0400
Received: by mail-ot1-f65.google.com with SMTP id o101so4169344ota.8
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7Q+ky66KN8KxL6tmiwgmq2KhPMSUfrQF2f35cxOID8=;
        b=B/Zzvvl56VKN2e6C+4clP5H4mhFZwMtqcjbCxT/bvTi82mTI+svJb6qJ6G4qWDVATc
         tc1Qn/gsuYv/MOhItHKJdYAXPsfu5m4LVUHZ7Qaq4DpHfzNKqEzXSzFFqV//Cro+cuxL
         ByB+04kQ3rn3EV/Qirhrp07VSnj59uIW1kO8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7Q+ky66KN8KxL6tmiwgmq2KhPMSUfrQF2f35cxOID8=;
        b=cpF4R3mYetba4laqz88PYwf8UEcr3GUBUL23J/NePIhnDf4Ky2FzxeiAwD8nYpBpHQ
         QMXhsxAa0CLp7K3MIUPEuNGK1Cue2337rNGa1dbsXJNoMcMqm3M8PcL/DbXdRdovOtBn
         b7rewrVwyQNAdiEFtP6GMufar2yKJ9znoBMqruKwog9oYTahi02tZkU8DzVxRyfcSgQ9
         0vzTXeGfDLkU+Z8kdsUYtGiRmXqevVIFe3NnyM7Yr2ooXEtUmuE4FbCKwDOr6804x45h
         2+H02qRK6cO0WaG5/Wrkb4So3rhTW/UtJPGZ22A6oJMCe2zn7S96VqXN7e/GFohc0mfZ
         5HPQ==
X-Gm-Message-State: APjAAAV/UYW85bvNl4RGqeB92uMVlawL/yvGk/kexzRc0udwibp5SFmv
        oucw2Cg4HGc1vps6PvW440Zia7qePvk=
X-Google-Smtp-Source: APXvYqy7qAJsp8cExm5JG+AbqfWpCt4fUjj+ggfNt8dAtBCmCCytvK91FmF+61QoOgIuRKyVXIMgUw==
X-Received: by 2002:a9d:5ed:: with SMTP id 100mr2780866otd.105.1565856728427;
        Thu, 15 Aug 2019 01:12:08 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id x5sm821681otb.6.2019.08.15.01.12.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:12:07 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id b1so4209651otp.6
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:12:07 -0700 (PDT)
X-Received: by 2002:a9d:76da:: with SMTP id p26mr315078otl.311.1565856727014;
 Thu, 15 Aug 2019 01:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-3-hverkuil-cisco@xs4all.nl> <20190814125336.GB11714@aptenodytes>
In-Reply-To: <20190814125336.GB11714@aptenodytes>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 15 Aug 2019 17:11:54 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWj_03kz1pVr5ap7iwr0Li0RVuTH9rKqqh5JqX5R+83-w@mail.gmail.com>
Message-ID: <CAPBb6MWj_03kz1pVr5ap7iwr0Li0RVuTH9rKqqh5JqX5R+83-w@mail.gmail.com>
Subject: Re: [PATCHv2 02/12] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 14, 2019 at 9:53 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> > From: Maxime Jourdan <mjourdan@baylibre.com>
> >
> > Add an enum_fmt format flag to specifically tag coded formats where
> > dynamic resolution switching is supported by the device.
> >
> > This is useful for some codec drivers that can support dynamic
> > resolution switching for one or more of their listed coded formats. It
> > allows userspace to know whether it should extract the video parameters
> > itself, or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE
> > when such changes are detected.
>
> Makes sense and looks good to me:
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> The docs aren't saying that this only applies to stateful decoders, but I think
> it is quite clear that this can't apply to stateless decoders.

Even though this can be inferred from reading the specs, I think it
would be reasonable to explicitly mention it though.

I also wonder, since this flag does not make sense for encoders, maybe
we can use more precise vocabulary in the patch description and doc?
I.e. s/codec/decoder.

With that,
Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
