Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E8937F3DE
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 10:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhEMIIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 04:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhEMIH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 04:07:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C68C06174A
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:06:50 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r5so20205189lfr.5
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QctHHCbUmE9SKQZkFUYr3/NvHKRxwu7+aZMbj4K6Y0s=;
        b=UrrG78ANjwlxHajiwC6dWsS3HzweOg606bt2lUOLuehAG0yrzClCg+WnQ0OA8yEZ78
         47htgMiPMZbkfnutDCbgJjY/yD2njfUY02gXJjoSBRfX8TE2VQqMxdBldwSqe75XwGoS
         WLbz2hWUhZieap36G1eSpFvx0qXG3MmxZqtUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QctHHCbUmE9SKQZkFUYr3/NvHKRxwu7+aZMbj4K6Y0s=;
        b=E5eXs5BDK0ss1u1Xlt675eLN/hcq1snoNOf7dCWr6q9nMVd+IHCrDmAiXCZ7fFR1+U
         H9bjPxuzgWSYxNmyb9JD9DrDCJC7vcLdXXsvvMpFJGtf73qLgrAe1+ObvUsq3bK6lirX
         sOoGixqIkjky8fyFKPUoo4t2CpDUFN9PswPr5/nFPUsRbNxVnbm/+cF95Ff7dpFABA8h
         t7Blexl9WTDTRmq4yv+YSkx7RgiF/vTdzsdI4cp8CHSi/nt5IbGsn2kmQHJMkNI4N4Mk
         SMLVeKd37MR8rgxvcGbqD0yxfAvDU+vrKEZbdrGF14am7cVD0WbfG1UHhrXtpogTa6ru
         YKCg==
X-Gm-Message-State: AOAM531YAW4ZSktfQxWxqK0NHGl8zCBmnmIykwu2gCZZ5GGSHKBfdNd0
        Zt7qh9L/DA15pbvSNSewvY1o4N/XYQso+A==
X-Google-Smtp-Source: ABdhPJw7oCIYEmQ8heDidIbwyJEgRR3xQ0Y1mt4BEvWgtEM258/BQeTEZqHjOhf8967HL2lDoV8yfg==
X-Received: by 2002:a05:6512:2038:: with SMTP id s24mr27999382lfs.15.1620893208466;
        Thu, 13 May 2021 01:06:48 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id a35sm349664ljq.124.2021.05.13.01.06.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 01:06:48 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id g4so7982124lfv.6
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:06:47 -0700 (PDT)
X-Received: by 2002:a19:550a:: with SMTP id n10mr14675259lfe.403.1620893207308;
 Thu, 13 May 2021 01:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org> <34782bc5-d891-8eef-d370-6cfcc547166a@xs4all.nl>
In-Reply-To: <34782bc5-d891-8eef-d370-6cfcc547166a@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 13 May 2021 17:06:35 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVykfSzXEA5_CWBpr84QduNDx24-aaf=0MUfxKcK69N1g@mail.gmail.com>
Message-ID: <CAPBb6MVykfSzXEA5_CWBpr84QduNDx24-aaf=0MUfxKcK69N1g@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 4:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/04/2021 13:15, Alexandre Courbot wrote:
> > This series adds support for the stateless API into mtk-vcodec, by first
> > separating the stateful ops into their own source file, and introducing
> > a new set of ops suitable for stateless decoding. As such, support for
> > stateful decoders should remain completely unaffected.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was
> > working for both chips, and in the case of MT8173 no regression has been
> > noticed.
> >
> > Patches 1-9 add MT8183 support to the decoder using the stateless API.
> > MT8183 only support H.264 acceleration.
> >
> > Patches 10-15 are follow-ups that further improve compliance for the
> > decoder and encoder, by fixing support for commands on both. Patch 11
> > also makes sure that supported H.264 profiles are exported on MT8173.
>
> For a v5 I would recommend that - where possible - these 'improve compliance'
> patches are moved to the beginning of the series. That way they can be picked
> up quickly without having to wait for the whole series to be accepted.

Makes sense, the current order reflects the chronology these patches
have been written, but I agree that improving compliance should be
merged first. Let me try to reorder things a bit.

Cheers,
Alex.
