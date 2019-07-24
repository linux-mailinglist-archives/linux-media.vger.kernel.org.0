Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B3D72571
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 05:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfGXDkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 23:40:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34397 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfGXDkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 23:40:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so45293320wrm.1
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 20:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JeknbwonJb7yvKuiDdk/VT/9NZwGxevBTk5gM7WC/2Q=;
        b=Vhs4i3yZhnVEHCs2TS0i09CS92qwHeEbf0dDjuOBmBf3zRbPhNZx1YFbXnW+Fn8nYl
         1diD8lmXPVW4XvO1cW5SOn7r2z5qtZdvueZ/k/49En1tGgVmILqH7Z8XnAUX8pCu61Rd
         8WfEVP4/lrRA+u/QSfKA9VeA+Toi0w4QT50yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JeknbwonJb7yvKuiDdk/VT/9NZwGxevBTk5gM7WC/2Q=;
        b=LB4Fwtp31kzx9+Tjbjdjsd5SXpAWERHxofd6zGq3AbBU6rrb3I1o1zzzpcED/kZWh8
         c50bOhO5h4M/tx4JtLSpB0Ccrl98fnhWoqq5he64uAQ/+NC9PPfLnv4RZlWixRHjHWxK
         EhgSRbhujYvN13TlTBS5WqRgjlWQlpScVDV+DEGcjh0Qgfi0RqtpGBEvRNa3249Boyaw
         LAGezv3mirM21dFvic+AGdeTewlsepo7QsI01LtOrs5KMvbIJrLs6vSxJsZRRNsGuFmZ
         KzRucthQ3NFr7W1AT4SIIxq+gEIv0tswrMvuUPx08SWDHO4ZxnsOSGK+GKkFjgX26EJU
         KE5A==
X-Gm-Message-State: APjAAAWmEuVZQlLPhtpVi3+e8PR50BNynSQgMegK7MLeCRqVT9Z2hx/6
        yO4vheyomU3z/377vfxObD5h7TahOGcRH1ZI57xpuA==
X-Google-Smtp-Source: APXvYqwpZKkrJ3pGQ7wkSc8RWOwUEX+O5baB1eR9/kucQqDpmom3rKpqK8dFv47tHFSh3RaC5A4YmzfppK4o8ayfHWw=
X-Received: by 2002:adf:b64b:: with SMTP id i11mr83796465wre.205.1563939606204;
 Tue, 23 Jul 2019 20:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190703122849.6316-1-boris.brezillon@collabora.com> <20190703122849.6316-4-boris.brezillon@collabora.com>
In-Reply-To: <20190703122849.6316-4-boris.brezillon@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Jul 2019 12:39:55 +0900
Message-ID: <CAHD77H=KMXbtFPAYDDv-cFNwU4tQAdneA8o3Vqp73eYWWEFLJQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: uapi: h264: Get rid of the p0/b0/b1 ref-lists
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On Wed, Jul 3, 2019 at 9:28 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Those lists can be extracted from the dpb, let's simplify userspace
> life and build that list kernel-side (generic helpers will be provided
> for drivers that need this list).
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * None
>
> Changes in v2:
> * None
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index 47ba2d057a92..237c8e8e6bca 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1946,15 +1946,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> -    * - __u8
> -      - ``ref_pic_list_p0[32]``
> -      - Backward reference list used by P-frames in the original bitstream order
> -    * - __u8
> -      - ``ref_pic_list_b0[32]``
> -      - Backward reference list used by B-frames in the original bitstream order
> -    * - __u8
> -      - ``ref_pic_list_b1[32]``
> -      - Forward reference list used by B-frames in the original bitstream order
>      * - __s32
>        - ``top_field_order_cnt``
>        - Picture Order Count for the coded top field

Thanks for the patch.

Don't we also need to remove these fields from the UAPI structs?

Best regards,
Tomasz
