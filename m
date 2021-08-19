Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED43F3F1E3B
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 18:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhHSQoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 12:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhHSQoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 12:44:18 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C01C061575
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 09:43:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id oa17so5376016pjb.1
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hK7Fa2T5Mqb2eYP1LWjsHMo12/1vCyWC8tE5Fpg8NZs=;
        b=U135XQszfFS1KqGbh0bEdnnB2KTRgzdpLRjDs68LpPGbaUQ0b54EVzV5CRbNz8k3yR
         adWSzUVGSsz4J827hOWbTsJL9xSftlx+PDgfdSeXB5gAxKbnql3aawh9OF/HNMT+1N78
         vdmbb7ZG8rQVTDvE/B4Z2fAUi160DVvw3iXRhHmhnUU+k4R4vo5Gu4CTgqkhzWyKPlhq
         MoL8ZDtegeddWBwVK3szTdPjluy0RgpxNck0zjXlc+hPoUmTYT2gCXkihHr9TbMlLMCX
         uwrtantruP5gWs8cic1Y6XuuWNjLey3Kqvi9LCnn2qUfdq6GgLZQVcMUzNjVagk5Mr2m
         XYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hK7Fa2T5Mqb2eYP1LWjsHMo12/1vCyWC8tE5Fpg8NZs=;
        b=hW80IcxK6wAeDNRz5KmRVlWl1wbNGRDh+rJRBOmUfn3+AYLJ5SHnCeh7bd9vshi1Ov
         jd6ifz3H/PbyAYMkfBmPsHaGbf40sdXYEBGDPNiJteTtsWguoCKq/FVbnHyopLqPaHOw
         gGio7s7GlmPrAxxK04pNOE4ylya+0Mh2SRse5IdnPYQg1mOoP7s3BsGEVN7D0e/gyCVS
         uNGC0Phieq9wjymGNTZvVClNEJdJ/9yjKRDTcQ18FfJEhDip1yuoN8DdAN+5hVvvI+NU
         A2odkZ46A+3OioIOtt09Uo3UTCP4uWnzFpZ+oBWKXP+3nPcZhkmKx2seAJiTo+0GTc8y
         O3rQ==
X-Gm-Message-State: AOAM53072F5qhLCImtZfPFwRMS/d57L5LCD4KJC4b4n97FEL9iQD0x68
        7A96XRnplDs42mGGpt89H5fEGAdSkxtWL6mkhBGaJg==
X-Google-Smtp-Source: ABdhPJwm+aeYNDed28m4WVxf3MJkQl4iX1wJ7gLetztr0nwb5a6sRia0/ghG16ar66d0fDU5Jniw0loy+QJPdGcnkFE=
X-Received: by 2002:a17:90a:9a8a:: with SMTP id e10mr16069370pjp.125.1629391417706;
 Thu, 19 Aug 2021 09:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210812170043.1046669-1-trix@redhat.com>
In-Reply-To: <20210812170043.1046669-1-trix@redhat.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 19 Aug 2021 09:43:26 -0700
Message-ID: <CAJ+vNU3Z54Mbr8s6JTOtCsNorV_sYZg39o8w44mLX4d-F9=L4g@mail.gmail.com>
Subject: Re: [PATCH] media: TDA1997x: handle short reads of hdmi info frame.
To:     trix@redhat.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 12, 2021 at 10:01 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Static analysis reports this representative problem
>
> tda1997x.c:1939: warning: 7th function call argument is an uninitialized
> value
>
> The 7th argument is buffer[0], which is set in the earlier call to
> io_readn().  When io_readn() call to io_read() fails with the first
> read, buffer[0] is not set and 0 is returned and stored in len.
>
> The later call to hdmi_infoframe_unpack()'s size parameter is the
> static size of buffer, always 40, so a short read is not caught
> in hdmi_infoframe_unpacks()'s checking.  The variable len should be
> used instead.
>
> Zero initialize buffer to 0 so it is in a known start state.
>
> Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/media/i2c/tda1997x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 1e2a263be9335..0b995424cb346 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -1248,13 +1248,13 @@ tda1997x_parse_infoframe(struct tda1997x_state *state, u16 addr)
>  {
>         struct v4l2_subdev *sd = &state->sd;
>         union hdmi_infoframe frame;
> -       u8 buffer[40];
> +       u8 buffer[40] = { 0 };
>         u8 reg;
>         int len, err;
>
>         /* read data */
>         len = io_readn(sd, addr, sizeof(buffer), buffer);
> -       err = hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer));
> +       err = hdmi_infoframe_unpack(&frame, buffer, len);
>         if (err) {
>                 v4l_err(state->client,
>                         "failed parsing %d byte infoframe: 0x%04x/0x%02x\n",
> @@ -1928,13 +1928,13 @@ static int tda1997x_log_infoframe(struct v4l2_subdev *sd, int addr)
>  {
>         struct tda1997x_state *state = to_state(sd);
>         union hdmi_infoframe frame;
> -       u8 buffer[40];
> +       u8 buffer[40] = { 0 };
>         int len, err;
>
>         /* read data */
>         len = io_readn(sd, addr, sizeof(buffer), buffer);
>         v4l2_dbg(1, debug, sd, "infoframe: addr=%d len=%d\n", addr, len);
> -       err = hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer));
> +       err = hdmi_infoframe_unpack(&frame, buffer, len);
>         if (err) {
>                 v4l_err(state->client,
>                         "failed parsing %d byte infoframe: 0x%04x/0x%02x\n",
> --
> 2.26.3
>

Reviewed-By: Tim Harvey <tharvey@gateworks.com>

Tim
