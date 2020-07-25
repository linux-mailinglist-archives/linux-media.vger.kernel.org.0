Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE59522D828
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 16:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgGYOeV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 10:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgGYOeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 10:34:18 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932E3C08C5C0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 07:34:18 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id y9so2365769oot.9
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wrDqlxNNVLuF8POl1GDyeWkvGNEXgQCKCSRteLM6tS4=;
        b=m/mqefN5jqg+eR2S3kGzASpiUbbyyR6SFj9m2pkRIXzdxs9BCmUDKOeq0H2RmV9p+y
         g2sB24A7EDA5B66T9zEQOagrTmm8RbfOZDLfQACKwZ9YInx2Fzxp7CWGbLkVMjB/uf+n
         1HYeToPIeOghavqiZEX1Aecbx/mqCSuMVu35A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wrDqlxNNVLuF8POl1GDyeWkvGNEXgQCKCSRteLM6tS4=;
        b=ggFqPwf2CAiJeNwpwhBxlngXyztyAgy4PlptfX0GNuEskC6icz0MFr1w0KRHoSK4pb
         RyEDpNCx63eB899wYSK0xjcgdvI5/TDRMdx3V3Np68y0CMCEsBbAlO7+gDlZBGJoF3MF
         1l5+52YhNWOsZuxm/jbm8ux95adsQzNS4n9KYIDt+nf93xY32sBGsbYyrW1aTvu+nH19
         M+AC4nxO4tht992wDlZ6qVSDOQDLOWgDQnJit7gPkChXMoF8VG8QMiuhJ3V5Mu16mZL/
         GxWcZx+coD726x4RcVeD51LvTAxFWHODziZqrdNa85ZZstUCSZkwJvMOgXu5jEixRe5p
         GObw==
X-Gm-Message-State: AOAM533OrbLCgfm6/LLXWwGFPLPDdWa75dj+m5AJRw8hAlwg2+y5VEUt
        orvk8XolaDD751q48lMlM5NkHRDFFcc=
X-Google-Smtp-Source: ABdhPJzPpbkV2mDg6SDnoxf5optE131Vm0Cmioxyeo5DWwJBl64S3DfpcE8Ol6GgGe1ypV7j390LmQ==
X-Received: by 2002:a4a:83d5:: with SMTP id r21mr14060716oog.19.1595687656452;
        Sat, 25 Jul 2020 07:34:16 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id b16sm2107595ots.76.2020.07.25.07.34.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:34:15 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id w17so9159957otl.4
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 07:34:14 -0700 (PDT)
X-Received: by 2002:a9d:5609:: with SMTP id e9mr12808433oti.141.1595687653817;
 Sat, 25 Jul 2020 07:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200715202233.185680-1-ezequiel@collabora.com> <20200715202233.185680-9-ezequiel@collabora.com>
In-Reply-To: <20200715202233.185680-9-ezequiel@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Sat, 25 Jul 2020 23:34:00 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
Message-ID: <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax elements
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> The H.264 specification requires in its "Slice header semantics"
> section that the following values shall be the same in all slice headers:
>
>   pic_parameter_set_id
>   frame_num
>   field_pic_flag
>   bottom_field_flag
>   idr_pic_id
>   pic_order_cnt_lsb
>   delta_pic_order_cnt_bottom
>   delta_pic_order_cnt[ 0 ]
>   delta_pic_order_cnt[ 1 ]
>   sp_for_switch_flag
>   slice_group_change_cycle
>
> and can therefore be moved to the per-frame decode parameters control.

I am really not a H.264 expert, so this question may not be relevant,
but are these values specified for every slice header in the
bitstream, or are they specified only once per frame?

I am asking this because it would certainly make user-space code
simpler if we could remain as close to the bitstream as possible. If
these values are specified once per slice, then factorizing them would
leave user-space with the burden of deciding what to do if they change
across slices.

Note that this is a double-edged sword, because it is not necessarily
better to leave the firmware in charge of deciding what to do in such
a case. :) So hopefully these are only specified once per frame in the
bitstream, in which case your proposal makes complete sense.
