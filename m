Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D461BBE29
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgD1Mt5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726787AbgD1Mt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:49:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C502FC03C1A9
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:49:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v4so2294222wme.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T0akXOU/T+phx4piiDIHlJgC6bgR8WnmW0DHmvs0oaU=;
        b=pq7NBpxAJ0utSOg3DDUGFHb3Py1QF/TuUxV3wtcBYvHUb8VThifcz9Z5awmC1SD870
         aErrSQ6QaOPEk8r23wMyT+m+5kbRUMfYUSMi2wd+Xrh7CuPUJ54W66YZ++IC4ASn+Ebb
         agjkWE2LmxPv4LzbiGz90wUMWKPR91TsYXWJlO9btYUgOmGwEe/rcmiZ1E2gWjkcMvlE
         qlaFki2OFS77Yv/YK5/gu4LwlOl05QLr5MnNfd8+o8y/lhbdOBRMOfukBXih4EDerVkY
         vKMkZQGhTVhVTh6MCCU+J/8osOYGvefcngl6bL9OLK/TceJFnFyL2LbLwNt52ktErMAf
         kM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0akXOU/T+phx4piiDIHlJgC6bgR8WnmW0DHmvs0oaU=;
        b=pm32F/QNqDQW9ykkLYU+yYW3WbKDpTJQxZBZ43uPoOxaE6dRdprQ6hPgXIpq1doi8X
         W+iF7Ur/WGb/KgNlSJTX0E/TZgp9Vt8IYJxzLZTSYzxsG4H3Z9kR77YUR5kl90cmTJcD
         6BypJzwnSRTOnG4SZQFxubNimLOu6AWD/ItYArig7iWj0jLjBaoLGoE85zl7GOSi2bri
         wSD/gopb6LWEbt05B93fe5MeokBVb8MnS/uLEshBtdo2Gft1X6qR5u+Quy3r1EpgrVyX
         jxGLwt68yJPULZJ7+0A3GgqHShwhxwsk490GX8vxLy+qfkshAn+FnhiVeYEEyLOQMGg2
         uQYA==
X-Gm-Message-State: AGi0PuYmY7PejdBcuAiyso/QJhW+mo6oS6DdwEYmiQnpse+7F3nWFHYo
        2uP/OirVqz7I7EUbd0btUEGOu35Y+UzvNbCiQvlkiQ==
X-Google-Smtp-Source: APiQypL5Wc0x3ujuYNguZCyOPZVk5rJHty3L04qHuEpcmwL7U8Ae7z4/tG0kBt5TtWeIZhIoikLM9v+63HO10iiWf8I=
X-Received: by 2002:a05:600c:1109:: with SMTP id b9mr4404814wma.116.1588078195551;
 Tue, 28 Apr 2020 05:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200413155134.250243-1-purisame@spuri.io>
In-Reply-To: <20200413155134.250243-1-purisame@spuri.io>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 28 Apr 2020 13:49:40 +0100
Message-ID: <CAPY8ntAmdpB7xNYaunzxg8ZxguAyh+41U1KnyNC_w5OODU19sQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: remove redundant writes
To:     Sameer Puri <purisame@spuri.io>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sameer

Thanks for the patch.

On Mon, 13 Apr 2020 at 16:51, Sameer Puri <purisame@spuri.io> wrote:
>
> These writes to 0x162, 0x163 already appear earlier in the struct for
> the 1920x1080 mode and do not need to be repeated.
>
> Signed-off-by: Sameer Puri <purisame@spuri.io>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

If I was going to be fussy, it would be nice to have the writes to
0x162/0x163 in a consistent place in the table, which is generally the
end (I'm aware that the 640x480 mode has it in the middle). Personally
I'm not overly worried, but others may prefer it.

> ---
>  drivers/media/i2c/imx219.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cb03bdec1f9c..53dafb7f5f2c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -253,8 +253,6 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
>         {0x4793, 0x10},
>         {0x4797, 0x0e},
>         {0x479b, 0x0e},
> -       {0x0162, 0x0d},
> -       {0x0163, 0x78},
>  };
>
>  static const struct imx219_reg mode_1640_1232_regs[] = {
>
> base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
> --
> 2.26.0
>
>
