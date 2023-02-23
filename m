Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A036A0593
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 11:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbjBWKFb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 23 Feb 2023 05:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbjBWKFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 05:05:30 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7F9126DA;
        Thu, 23 Feb 2023 02:05:29 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id m4so11735309qvq.3;
        Thu, 23 Feb 2023 02:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdCwJLGWDIYRp41XbM2Nna+4xZbVZgFLaw4EHMUxJtY=;
        b=brTnjo+nxo/rbREFY5z2VplOl19Mg73qxQJNWSbsLwsRNGCcEp+qz22AxyWtZK8/fo
         ZkWqY9GxnFD/wlMStl8HrhhJ9At9KzKHb8ptRfk8MiDCPcppr8RGUs2dj9hltE+ak2L3
         fxtOcUTaVdjr1JSCz89C3jBvUlsug1BJGus+qdJZfRfwlgircVE/VpJAEZIyBtQGsRVD
         kzLQlTuq6T3o6GGm4S5If/UMIPgsWjxAkZ7q63VQ5s1Ode7dUCHffUNcVHFYwKxz5xRt
         UBW0BhFWlzoyUU1Y1IJibMVTZ6kSqKnBa6ne2a3JSPYUvvs1Q0NrYimx5Kzu+3MGZUbX
         CW8w==
X-Gm-Message-State: AO0yUKX1ZldR2feAnyfXIHYuMSL0NMXOGxcINQn9hfr58zhpJNY90K4H
        1difWU0Lmia0Q9jk1IYclm5xr8+O4AgcoSqr
X-Google-Smtp-Source: AK7set+ZwLFwQoA75PblZbvFc5muH4pCTBGm7B68ltsdX+r2MBPDw7rP6iN34+U1sBFi3zB6UAJxgQ==
X-Received: by 2002:ad4:5ecc:0:b0:56c:2344:a58b with SMTP id jm12-20020ad45ecc000000b0056c2344a58bmr18597608qvb.12.1677146728157;
        Thu, 23 Feb 2023 02:05:28 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 145-20020a370397000000b0073b79edf46csm2237927qkd.83.2023.02.23.02.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:05:27 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-536bbef1c5eso173926477b3.9;
        Thu, 23 Feb 2023 02:05:27 -0800 (PST)
X-Received: by 2002:a5b:cc:0:b0:95d:6b4f:a73c with SMTP id d12-20020a5b00cc000000b0095d6b4fa73cmr1783602ybp.7.1677146727374;
 Thu, 23 Feb 2023 02:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se> <20230222221249.1324102-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230222221249.1324102-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Feb 2023 11:05:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW91bgHDTy61HMp1EhiJuEnkNM8b7KxvPbAQksGTa=fLw@mail.gmail.com>
Message-ID: <CAMuHMdW91bgHDTy61HMp1EhiJuEnkNM8b7KxvPbAQksGTa=fLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: adv748x: Fix lookup of DV timings
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Feb 22, 2023 at 11:15 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The loop to match the requested timings with the ones supported by the
> driver is incorrect. It always iterates thru the whole array of
> supported modes. The bounds check after the loop always triggers
> resulting in adv748x_hdmi_set_video_timings() always returning -EINVAL.
>
> Fix this by correcting the lookup to break the loop when a match is
> found.

Nice catch!

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Fixes: 3e89586a64dfd286 ("media: i2c: adv748x: add adv748x driver")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
