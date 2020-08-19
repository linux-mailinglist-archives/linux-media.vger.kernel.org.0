Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6186249FAF
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgHSNY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:24:59 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49695 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726961AbgHSNQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:16:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8NwMkcqI5uuXO8NwNkhD1S; Wed, 19 Aug 2020 15:15:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597842943; bh=XJUjA6GhgJMPcqkxF1vR+8X4AdV6W5Jd5RTMaz80g/k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=M8aenhv6PjoRzN8MNsDrsM4kWTyImKm6UR7AQXDXpdUVHIN893XH9Uypb7Y1rnp32
         MB/7dC7Aew9TvapDmY1M5tZAt5A647yXFCVRAD+uGAsVFG6A/42R0uVkkx+1CyGdnv
         A+Aq+PSz9b2MTWhseyu8GUQJNoDeR/kY9V0sQoge7vqgaYyXP0j1F4xmA/40lzRhzj
         Treg4CdrpH3DgyIzzkIWpPo5KvU79+YJbO+xDyIclYWUDpXw5e4xCZnTZlsQrKmDC+
         DLJJQ7uFsa0k6/e0b/FEct+NsuoeOg+aNuRHEpNJMCY5xoTI5Bca3VEZqg5AKQkkVt
         SjJcRdwwhBZLQ==
Subject: Re: [PATCH 1/2] media: Revert "media: exynos4-is: Add missed check
 for pinctrl_lookup_state()"
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org
Cc:     hslester96@gmail.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com
References: <CGME20200810153301eucas1p2684476145e627ba124ba4740ef204712@eucas1p2.samsung.com>
 <20200810153240.23827-1-s.nawrocki@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bdcb0a29-8c7e-3736-9936-2b25460f9aef@xs4all.nl>
Date:   Wed, 19 Aug 2020 15:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810153240.23827-1-s.nawrocki@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCkIhUtNaVpYFQcL/3qCAdkOvGF9e/YUvgKcHKX3f126eVPkUlcDSp89i09CuIk68hCjtduB4QUQvq3gZP7Meq5HWeof8IRc9ggwqYC++sRA/5kYKzcD
 b3jz0GFnlFagsbNkMMc8mxw60JKJ9a9pCGOVLOyv0zjcuUy5ujc1zkfyvRPI6dwACSnQSeL0Jm2KTBKsDoaw4/xjqZaEkzb/FhtYklijTYBwUwSovzidJgpE
 Kf3llJzgxFhED+K/h5tD98Msfnz12C5jooH+yTGOFuQoiEgbVkvmyKN+oU6V4q/iZMTEwwIdqBekk6xOywDZknSARo3aimryTuX0h7yxkdrvoc2Kz8Ck0ewx
 f7TcxHV/2lIqkbwcWENjVhR0Gik3KjtO2z6cQowUHE/Omn1W1NrtcARu5EI/L4DXn6T+2HDKmtMmDGRvvDjdMv2JJtoTIqwRtiiFW7lzP4k9SRZfjtUpNv2d
 9Q2xLfLUmFFtk1lZ3gn6ci8YZtzhiDrzWv2RFOJSloHs1c2LXuDiioYmEq4x64SRcZzuOdygX+YJuUEgJ/jkITfv0WSfl+Z3oVRequUyRRJvubgbY1cppkNR
 eX0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sylwester,

Can you rebase this patch series on top of the media_tree master?

This series didn't apply anymore.

Thanks!

	Hans

On 10/08/2020 17:32, Sylwester Nawrocki wrote:
> The "idle" pinctrl state is optional as documented in the DT binding.
> The change introduced by the commit being reverted makes that pinctrl state
> mandatory and breaks initialization of the whole media driver, since the
> "idle" state is not specified in any mainline dts.
> 
> This reverts commit 18ffec750578f7447c288647d7282c7d12b1d969 to fix
> the regression.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 16dd660..9a57523 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -1268,11 +1268,9 @@ static int fimc_md_get_pinctrl(struct fimc_md *fmd)
>  	if (IS_ERR(pctl->state_default))
>  		return PTR_ERR(pctl->state_default);
>  
> +	/* PINCTRL_STATE_IDLE is optional */
>  	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
>  					PINCTRL_STATE_IDLE);
> -	if (IS_ERR(pctl->state_idle))
> -		return PTR_ERR(pctl->state_idle);
> -
>  	return 0;
>  }
>  
> 

