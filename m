Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B24392B74
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 12:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbhE0KLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 06:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbhE0KLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 06:11:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7555C061574
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x38so5158136lfa.10
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=It703JKz/+Tb0hP6nAjPyrUgpmKATOgV+pJiiFvJ1fY=;
        b=YTFjcU/H6G9VcHV0gx9/RP72YTs7DGoos6iEnjKMPoRymcEzunk9qCm4JR8h7WM2f0
         lYzTGIvTcHVIDO8CEJiGmnWGvJwlRzqOvSBuMk24SZ756vtw6UpbfAKrhPXN9+20nA9m
         v3O5PgQY6OfnaNm5LX5j1FqfyeqUlQYlVYWqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=It703JKz/+Tb0hP6nAjPyrUgpmKATOgV+pJiiFvJ1fY=;
        b=M2X0xo5UGSwZUzko/Bt8gAtCi1nH6bp2ZltpD6jH+ew6kZ26S0BEdQAS0rjjzFAFsn
         z4/IOLvGkizXcTqxoaRpqPf2acJd3dY+C7a0IqJnkILXkzjQsR+AM8TlYELQ/SFrB7kn
         Nb/PQAFjI0k9epZvOTNMNzTu8uda8dy3B2E5zcZ+PxcpYsVlfnW1xZnQfKGqzcKXLm3B
         tuxS9Oy6Qe1dtCqy8WeDoP8jn0xemvQieGfvPx+0ex6+McDMkhtszyTUcaF7ft4ILqzn
         qHYRPZbWwb5z9X/G6MaKhmec96NiDjhdKHCSmByMZCn39IUtU2dJroL2Fu6WqH3C+zdS
         RHew==
X-Gm-Message-State: AOAM533f11s1PSOybMqhEUKeXIiFVVIwkmJjm8oLbjsV4pVG0zjz/fUe
        txoW89+LImj15ADcEfsGSxRPg9pTcnJGSw==
X-Google-Smtp-Source: ABdhPJzLLrJOsRNmBsceBUiT2yk7yBZHOF1f8mwuZdftOTv/b5NmI0j5br5M/XyOOeezPElhe8/0PA==
X-Received: by 2002:a19:85c5:: with SMTP id h188mr1834460lfd.121.1622110216891;
        Thu, 27 May 2021 03:10:16 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id p28sm98895lfa.74.2021.05.27.03.10.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 03:10:16 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id f30so7196826lfj.1
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:16 -0700 (PDT)
X-Received: by 2002:a19:6a0f:: with SMTP id u15mr1949848lfu.614.1622110215899;
 Thu, 27 May 2021 03:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <ed6610cb-5164-4185-f7c9-6d872ea16ec7@xs4all.nl>
In-Reply-To: <ed6610cb-5164-4185-f7c9-6d872ea16ec7@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 27 May 2021 19:10:03 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUFmwxaP_11kx2FNAeieOiMCV9W2WGgweuuL8z6ZWeSng@mail.gmail.com>
Message-ID: <CAPBb6MUFmwxaP_11kx2FNAeieOiMCV9W2WGgweuuL8z6ZWeSng@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] media: mtk-vcodec: support for MT8183 decoder
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
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

On Thu, May 27, 2021 at 5:08 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Alexandre,
>
> On 19/05/2021 16:29, Alexandre Courbot wrote:
> > This series adds support for the stateless API into mtk-vcodec, by first
> > separating the stateful ops into their own source file, and introducing
> > a new set of ops suitable for stateless decoding. As such, support for
> > stateful decoders should remain completely unaffected.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was
> > working for both chips, and in the case of MT8173 no regression has been
> > spotted.
> >
> > Patches 1-5 fix a few compliance issues with the decoder and encoder, most
> > notably by adding support for the START and STOP command for the latter. These
> > patches were last in the previous series but have been moved to the beginning so
> > they can be applied sooner.
> >
> > Patches 6-9 separates the "stateful" part of the driver into its own file and
> > add support for the new firmware and pixel format used by MT8183.
> >
> > Patches 10-14 add support for H.264 stateless decoding and MT8183.
> >
> > Changes since v4:
> > * Moved compliance fix patches to the head of the series.
> > * Select MEDIA_CONTROLLER_REQUEST_API.
> > * Properly capitalize MM21's format description string.
> > * Reorganize stateless code as suggested by Hans.
> > * Fix compilation errors when DEBUG is defined.
> > * Merge double-free fixup patch into the patch that introduced the issue (was
> >   a separate patch coming right after the one introducing the issue).
> >
> > Changes since v3:
> > * Stop checking that controls are set for every request.
> > * Add V4L2_CID_STATELESS_H264_START_CODE control.
> > * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
> >   nal_ref_idc field instead.
> > * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
> > * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
> >
> > Changes since v2:
> > * Add follow-up patches fixing support for START/STOP commands for the
> >   encoder, and stateful decoder.
> >
> > Alexandre Courbot (8):
> >   media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
> >   media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
> >   media: mtk-vcodec: make flush buffer reusable by encoder
> >   media: mtk-vcodec: venc: support START and STOP commands
> >   media: mtk-vcodec: vdec: handle firmware version field
> >   media: mtk-vcodec: support version 2 of decoder firmware ABI
> >   media: add Mediatek's MM21 format
> >   dt-bindings: media: document mediatek,mt8183-vcodec-dec
> >
> > Hirokazu Honda (1):
> >   media: mtk-vcodec: vdec: Support H264 profile control
> >
> > Yunfei Dong (5):
> >   media: mtk-vcodec: vdec: move stateful ops into their own file
> >   media: mtk-vcodec: vdec: support stateless API
> >   media: mtk-vcodec: vdec: support stateless H.264 decoding
> >   media: mtk-vcodec: vdec: add media device if using stateless api
> >   media: mtk-vcodec: enable MT8183 decoder
>
> Running scripts/checkpatch.pl --strict over this patch series gives
> a lot of warnings and checks. A lot of these look like they are easy
> to fix and reasonable.

Apologies, I forgot to use --strict. It's not pretty indeed. I've
fixed most of the problems reported ; a few are more tricky or would
require extra cleanup patches like converting e.g. uint32_t to u32
when adding a member to a struct, which would make sense if we convert
all members of the struct (or better, the whole driver) separately.
Hopefully these can be overlooked for the time being.
