Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FBC35D846
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 08:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236711AbhDMGzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 02:55:15 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:38552
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229662AbhDMGzP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 02:55:15 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AwHZfk6n4K7+29Y6IxAZYFs5SH8TpDfLd3DAb?=
 =?us-ascii?q?vn1ZSRFFG/GwvcrGpoV56TbfjjENVHY83e2RIaXoex/h3LN8/IV5B9afdSb8vm?=
 =?us-ascii?q?/AFutfxKvkhwbtAijvstNavJ0BT4FbBMfrBVZ3yeb2iTPUL/8FwN2KtJ+lnv3f?=
 =?us-ascii?q?yXAFd25XQppt5Qt4FQqXe3ceLGJ7LKE0G5aG6s1MqyDIQwVzUu2AGnIHU+Lfzu?=
 =?us-ascii?q?ekqLvaZ3c9dnwawTjLqTup7bLgeiLouisjbw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,218,1613430000"; 
   d="scan'208";a="378481933"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 08:54:53 +0200
Date:   Tue, 13 Apr 2021 08:54:53 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Subject: [PATCH v2] staging: media: meson:
 vdec: declare u32 as static const appropriately
In-Reply-To: <YHU56OM+C2zY34VP@kali>
Message-ID: <alpine.DEB.2.22.394.2104130853520.2850@hadrien>
References: <YHU56OM+C2zY34VP@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Tue, 13 Apr 2021, Mitali Borkar wrote:

> Declared 32 bit unsigned int as static constant inside a function
> appropriately.

I don't think that the description matches what is done.  Perhaps all the
meaning is intended to be in the word "appropriately", but that is not
very clear.  The message makes it looks like static const is the new part,
but it is already there.

julia

>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>
> Changes from v1:- Rectified the mistake by declaring u32 as static const
> properly.
>
>  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index ea86e9e1c447..80141b89a9f6 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_h264 *h264 = sess->priv;
>  	u32 mb_width, mb_height, mb_total;
> -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
> -	static const u32[] canvas4 = { 24, 0 };
> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> +	static const u32 canvas4[] = { 24, 0 };
>
>  	amvdec_set_canvases(sess, canvas3, canvas4);
>
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHU56OM%2BC2zY34VP%40kali.
>
