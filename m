Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C968B3251A7
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 15:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhBYOnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 09:43:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:59078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhBYOmx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 09:42:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53B7964ECE;
        Thu, 25 Feb 2021 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614264132;
        bh=4sHiq68F0g7bVZOgLUG764o38A+n0QBHmSbVULWttEU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NBlzBAwYS8G2iYlgShS3ec+hMTeAGBB9TqPXmfccfAhjp5G+Zon99QhzfGulHKN14
         PreBRo6QfIcjxdt7aIUPFvKua6bd22UxddCqXwxom8k2apNdY6HQ1wcTpcEvjbhO75
         +WBiwt+O1aboP6kOPzuq/eFwaelkP8ZZ1wrtZyDgL88SW7TfqUNEdPefBNO4DL9ZG6
         p+UOtiHU2iYm8duMF3TfU3nxadNwg1eX+HqYePjks3dybD9lTux5Y5f4QlGCuhdN6o
         JZWtDjxzFYHMp4JzetBfAjpmzxyD3iojFm5nAGKR8kqDDuFF0RwFwvKAop5ggRsXuI
         QtvvOQaqK1R3g==
Received: by mail-ej1-f47.google.com with SMTP id lr13so9245803ejb.8;
        Thu, 25 Feb 2021 06:42:12 -0800 (PST)
X-Gm-Message-State: AOAM533lIc2g+soPYQVUzzKpOFbKjvfkSRk5ARM/OjivPtCCM/1Pvta8
        /gaXVr/angOL3SRyW/bRhBsgqIlIDE118mQhCmI=
X-Google-Smtp-Source: ABdhPJwjKYcFVZcp83Us1hJHUD924Bpq+rxT7lvV04NHLBei/6o9SRjTc01OGGCIvp6BECo9/JbfzJvPYI5N/B1cIak=
X-Received: by 2002:a17:906:a896:: with SMTP id ha22mr2938761ejb.503.1614264130626;
 Thu, 25 Feb 2021 06:42:10 -0800 (PST)
MIME-Version: 1.0
References: <1614243836-54718-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614243836-54718-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 25 Feb 2021 15:41:58 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdyZQfJNKVpga3yw7yxwK0WvMitN51+e-YgOHHJAMkvsw@mail.gmail.com>
Message-ID: <CAJKOXPdyZQfJNKVpga3yw7yxwK0WvMitN51+e-YgOHHJAMkvsw@mail.gmail.com>
Subject: Re: [PATCH] media: exynos4-is: add missing call to of_node_put()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     mchehab@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 25 Feb 2021 at 10:04, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> In one of the error paths of the for_each_child_of_node() loop in
> fimc_md_parse_one_endpoint, add missing call to of_node_put().
>
> Fix the following coccicheck warning:
> ./drivers/media/platform/exynos4-is/media-dev.c:489:1-23: WARNING:
> Function "for_each_child_of_node" should have of_node_put() before
> return around line 492.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

Please make the reports public. Otherwise the actual credits should go
to Coccinelle not to some hidden/unknown tool...

> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 8e1e892..467bc69 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -489,6 +489,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>         for_each_child_of_node(port, ep) {
>                 ret = fimc_md_parse_one_endpoint(fmd, ep);
>                 if (ret < 0)
> +                       of_node_put(ep);

This is wrong...

Best regards,
Krzysztof
