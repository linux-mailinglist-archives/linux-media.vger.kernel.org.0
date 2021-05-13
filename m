Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C976137F3F5
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhEMIWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 04:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbhEMIWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 04:22:35 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3E8C061574
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:21:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id e11so19300012ljn.13
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+1/k0C0U/4PbCo991QeF2hoImjtMAGcUEqpPrZUi0VU=;
        b=jvrERVq6t/rzqVFu5XXz1l714GDGaw+rZ2nZkXdo5ZA4kxNgtgacNNYTqgBq7ljbPt
         ZQzQrX1xchRvSyhS+xX5bX5e8o7ab0h1+adzpkLXYEF+bHLaoI+EAiKAvganCkziUM6g
         YF3zBMriWEJL1Py4KmP7dyRYufrukQ14QIzk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+1/k0C0U/4PbCo991QeF2hoImjtMAGcUEqpPrZUi0VU=;
        b=uKQqkE2TlEeoroCOsaDDwfJ6yRHyUWg7X6tGCGmn/0oupH57/BJ7ImFmXDeuwHyb/g
         ud6mEzOfcXlg5HPawgXDQ5Qn64VuCLv9hyvDprpMZr0pKOYDiVhXZJWWxe0EcDFNH1Ag
         6TqQsuxYQSvLgeOK1SEhu/2OwwEUKZgrckSN1wdwvTOa7HC+6KfwoKVigcRo2oPUduS7
         GRBX9TBK/5rZI6bQx6cm3H1kESRsYxnaCVSfkjl3+LVuk5Avp/esv9Rm8Tsaxl2WXqvV
         pKBP36gEX7pTEIC7d40CD3Gym34A2I8m62oEt28x4oUzc+8g4fi6ToriqkFow73KQ/IK
         Tfxg==
X-Gm-Message-State: AOAM531fL9PgfOphArpqbavKRienbSJMcVnCLHMNmW8D1Xjru9FEj60Q
        o2n2PYWKhob9sDzr/lU5r7c3YrNRpriUGg==
X-Google-Smtp-Source: ABdhPJzTLLfYgD1I2RKhPwgHhKgnMB2hdOWh+9S1OJjVLUwTPZvPfCLT8BtABeBP8QWebEIZvB1Q0w==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr2702048lja.247.1620894083939;
        Thu, 13 May 2021 01:21:23 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id u13sm219235lfg.132.2021.05.13.01.21.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 01:21:23 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id x2so37428207lff.10
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:21:23 -0700 (PDT)
X-Received: by 2002:a19:c10:: with SMTP id 16mr24165709lfm.332.1620894082924;
 Thu, 13 May 2021 01:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org> <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
In-Reply-To: <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 13 May 2021 17:21:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
Message-ID: <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Apr 29, 2021 at 9:07 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> On 27.04.21 13:15, Alexandre Courbot wrote:
> > This series adds support for the stateless API into mtk-vcodec, by first
> > separating the stateful ops into their own source file, and introducing
> > a new set of ops suitable for stateless decoding. As such, support for
> > stateful decoders should remain completely unaffected.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was
> > working for both chips, and in the case of MT8173 no regression has been
> > noticed.
>
> I am trying to test the decoder with this patchset using v4l2-ctl on mt8173.
>
> I am trying to decode an h264 file into V4L2_PIX_FMT_MT21C format.
> I am not able to do it. It seems that the driver expects each buffer to start
> with a nal starting code, and the v4l2-ctl command just read the files into
> buffers without any parsing.
>
> Can you share the command and the files you used for testing?

I have been using the Chromium test suite (aka
video_decode_accelerator_tests). I had doubts after reading your email
but I tested the series again using this tool and confirmed it was
working.

Unfortunately this test is not easy to build, but maybe if you have a
Chromium environment ready you can run it. mtk-vcodec does expect the
input buffers to be split by NAL units (as per the spec [1] IIUC), so
that would explain why v4l2-ctl failed (I assume that it also fails
without this series?).

Maybe ffmpeg can also be used to exercice this driver with properly
split NAL units, but I am not familiar with its use with V4L2. I'm
also not sure it would be happy about the MT21C format that the driver
outputs, or that it could pick the MDP to convert it to something
readable...

Cheers,
Alex.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-compressed.html#compressed-formats
