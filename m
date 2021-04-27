Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6537F36C702
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbhD0N24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbhD0N2z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:28:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10323C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:28:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 124so12679108lff.5
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqTVJmb9A9eRq1DvEF1RE2BqQ+7GQz0NLMEFGRmcPkw=;
        b=DQmdP9qC+8sdYVsLngYvUu6mnEoYbLqZ/MFUDyz58vPUhzeBtVtLoKhFBZ692aSdwp
         ho59I7Du+h86fAw7eC/SZvGY6PYu3C/0u4CpcCTRPv8Dr1zKhm5cStnVTEE0uu0qSasf
         B20z/PHKELohstCCWaiXhRVzbeijS4uXJF3vTSCHzHQcsj6BJC5PMcTvxrn48frtFeFK
         StTQSlDzdGwPWraBFeo2pIW7hA7ktvezlcnstxPQXhzuYcFsXonWVB8yxUF31HyOpCgx
         vMen0B7JqnCyuCWX1N1T53DpiZRYeFWFbio+t0/KQey9Hpd/iknySfEWXDAcrQCR9N/0
         lLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqTVJmb9A9eRq1DvEF1RE2BqQ+7GQz0NLMEFGRmcPkw=;
        b=Smf0nRySsPd+j0m7gzQLUSWMhVVXX761lWpQRXBIrBbrakfZdiiCw9l32P3T7d6Qzn
         Taa4ZYntiFGK51wNKbSxLW9ruET/Uoep4T9IheyH6yE2+nSa2EFzOFtkkbAMcOMob+Fy
         UyTlj/IJllct3VJgQlX2IKxMCsTMCgmgoB7w/YdAWrNfuXNudOSOErv9Im67qjQJwg17
         j9rZTFOTGGezJgXlvuZdWpq/dMBjQ1GmFuBfv3ZUZe3VgAwSEnQ+IFGoFyeeLM6q9Guw
         QGcseC4yqewtqJEuuVtQ+j+zDBwNH2honfK3yDcoqX+cBUSy+qcc4NdOdLRkrueeH2tc
         z+Ag==
X-Gm-Message-State: AOAM531K1CxBiLLrdz8Qmt9RepNgvPJRZwmv+0If8OwKnIS8ZkwJTLkE
        J/n9vuzNCLCex8+uIIHG6zHpWuM0pLp7TiinRP8=
X-Google-Smtp-Source: ABdhPJxm2DJz3suucyNC3bB2YQJuq01sHP3RYWMprQPNMh6wshS81D1/X9KHLoG3dePGY1IkW8hgsrydWfVuV9k809U=
X-Received: by 2002:a19:50d:: with SMTP id 13mr16215690lff.443.1619530089558;
 Tue, 27 Apr 2021 06:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
In-Reply-To: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 27 Apr 2021 10:27:57 -0300
Message-ID: <CAOMZO5BEre9=se1yAxr7QTmfV_N=GMKZeanr+jYfRNrSO551hg@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 26, 2021 at 1:14 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> I am back at trying to get a proper image captured by the ADV7280 on
> an imx6dl board connected to the parallel CSI bus.
>
> I tried your patches against 5.4 and 5.12:
>
> https://github.com/Gateworks/linux-imx6/commit/959fbd4
> and
> https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com/
>
> ,but I am still getting horizontal scrolling images after running:

The analog camera I am using produces PAL content. If I force the
initial curr_norm to PAL like this:

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index e780969cc2f2..4ffe85ef02a0 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1346,7 +1346,7 @@ static int adv7180_probe(struct i2c_client *client,

  state->irq = client->irq;
  mutex_init(&state->mutex);
- state->curr_norm = V4L2_STD_NTSC;
+ state->curr_norm = V4L2_STD_PAL;
  if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
  state->powered = true;
  else

Then I get stable image and no more scrolling.

This patch from Steve is still needed though:
https://github.com/Gateworks/linux-imx6/commit/959fbd4

What would be the correct way to fix this NTSC versus PAL selection?

I tried passing the norm property like this, but it gives me an error:

# gst-launch-1.0 -v  v4l2src norm=PAL device=/dev/video2 ! kmssink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 800
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 480
WARNING: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Failed to set norm for device '/dev/video2'.
Additional debug info:
../gst-plugins-good-1.18.2/sys/v4l2/v4l2_calls.c(779):
gst_v4l2_set_norm (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
system error: Inappropriate ioctl for device

Appreciate any suggestions, thanks
