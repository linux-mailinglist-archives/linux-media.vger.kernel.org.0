Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123FE34645B
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 17:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbhCWQFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 12:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhCWQFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 12:05:09 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25080C061763
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:05:09 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id e8so18234749iok.5
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V2RrZIiiAXDjTWwS4GJM76K1p957k6O4aOC5f66VrG0=;
        b=c9fONZ0pVanfBBnYSOpJiaySOx5hI94+NqD6CkppLs8GUQkeQhLzL0o3ReQ2IvDwJr
         UZdPTqwjNh470mOQMHJW4y/avc/ojoI41u/icb2EMeqhwmKKZaB6hDtS0DODD+qHRfaC
         WPciC6+yYWvSGsTj/ScLgLfSn94/6VvGLg+gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V2RrZIiiAXDjTWwS4GJM76K1p957k6O4aOC5f66VrG0=;
        b=qZVh+8x9m7ELw1XBcnZyIzEnbxELIj9VyI0IbOgJv+koC7aHP0gO/1uygV0YLzehh7
         OoLd9W54CLMuNBbmtNXC2+Ok57KeGQI4DAoginhigxF3ygC6OZQDXKwSRC+T9mS9bU4e
         EIRuPwJkCjgT16s4Bu4Zn7ZUOuzyg1SvYIDvG6n0aWLVhcB9zhRgEj0FNSomgRtQZ1WY
         0DTl+JhOusz41tP/Vqza/zSls5UEiQsW9uv/+I9vwcXuhReSLRmAqSCkcgQyvRejnD7b
         azxlOmED0FmlipV5Md8YF46kYAG+96e8ZRtDmQVT9BzS6ny2KFEkHxRsoG7BeTTIDDmc
         QwiA==
X-Gm-Message-State: AOAM5315XA6eJIKwg+4tspuxIOu59VZ/lumtz9+Ql9l12R2Zq0AOK0Ws
        S+NZLmsbDpNqPMeMwMkR5Syl3OQl1Q2UrQ==
X-Google-Smtp-Source: ABdhPJyrYVqKK0SCORoEbpM9hrBoSMOJzLjxSOkKv+4R4oNmWJ144P7mE+QwVfDalJuv/c7qR125tg==
X-Received: by 2002:a05:6638:1648:: with SMTP id a8mr5111507jat.25.1616515508412;
        Tue, 23 Mar 2021 09:05:08 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id c3sm6494240iln.76.2021.03.23.09.05.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 09:05:07 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id v26so18238478iox.11
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:05:06 -0700 (PDT)
X-Received: by 2002:a05:6602:26c6:: with SMTP id g6mr4919501ioo.150.1616515506402;
 Tue, 23 Mar 2021 09:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210319055342.127308-1-senozhatsky@chromium.org> <20210319055342.127308-4-senozhatsky@chromium.org>
In-Reply-To: <20210319055342.127308-4-senozhatsky@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 23 Mar 2021 17:04:55 +0100
X-Gmail-Original-Message-ID: <CANiDSCseJdKuPSZFDvc8VGp=PDqGEN42ZsLVGgkwhAz5hhVCQQ@mail.gmail.com>
Message-ID: <CANiDSCseJdKuPSZFDvc8VGp=PDqGEN42ZsLVGgkwhAz5hhVCQQ@mail.gmail.com>
Subject: Re: [PATCHv3 3/6] media: v4l UAPI: add ROI auto-controls flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

On Fri, Mar 19, 2021 at 6:53 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> UVC 1.5 defines the following Region Of Interest auto controls:
>
> D0: Auto Exposure
> D1: Auto Iris
> D2: Auto White Balance
> D3: Auto Focus
> D4: Auto Face Detect
> D5: Auto Detect and Track
> D6: Image Stabilization
> D7: Higher Quality
> D8 =E2=80=93 D15: Reserved, set to zero
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  include/uapi/linux/v4l2-common.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-c=
ommon.h
> index 3651ebb8cb23..34f1c262d6aa 100644
> --- a/include/uapi/linux/v4l2-common.h
> +++ b/include/uapi/linux/v4l2-common.h
> @@ -92,6 +92,16 @@
>  #define V4L2_SEL_FLAG_LE               (1 << 1)
>  #define V4L2_SEL_FLAG_KEEP_CONFIG      (1 << 2)
>

Are you sure that you do not want to start with 1<<3, there might be
some hardware that support LE/SE
> +/* ROI auto-controls flags */
> +#define V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE                (1 << 0)
> +#define V4L2_SEL_FLAG_ROI_AUTO_IRIS                    (1 << 1)
> +#define V4L2_SEL_FLAG_ROI_AUTO_WHITE_BALANCE           (1 << 2)
> +#define V4L2_SEL_FLAG_ROI_AUTO_FOCUS                   (1 << 3)
> +#define V4L2_SEL_FLAG_ROI_AUTO_FACE_DETECT             (1 << 4)
> +#define V4L2_SEL_FLAG_ROI_AUTO_DETECT_AND_TRACK        (1 << 5)
> +#define V4L2_SEL_FLAG_ROI_AUTO_IMAGE_STABILIXATION     (1 << 6)
> +#define V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY          (1 << 7)
> +
>  struct v4l2_edid {
>         __u32 pad;
>         __u32 start_block;
> --
> 2.31.0.rc2.261.g7f71774620-goog
>


--=20
Ricardo Ribalda
