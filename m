Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177DD7300E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 15:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfGXNkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 09:40:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35312 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfGXNkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 09:40:04 -0400
Received: by mail-oi1-f195.google.com with SMTP id a127so35001175oii.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3d6ssC5f4WWJRwGDNIV/dz/cD9cDgvCqu1WVfecFLyc=;
        b=W2am4WrmrhYtyb664zBUM8rxf2q9Og4cdM99m98JUkCw3o5F9CIlBGsY/1YvvPzbcQ
         4VT8ZB0PfB8jtOFh+BACFQvs0G0NM1YZlpaiR/6CDIrxbIy9sAkhrM58JhL/Tu04Ge86
         eqhiaS5nRzKbUezn59YAW/Jo1Bn6u5GVbHRO5G/JRHu4WD/kmo5gWzMTmSUyf1MROcjx
         OqZf8kfWVyZlxb8TZFrQJsfPtM4g5BDCAEqXF4K3l1qkTRB1LdYfSgWKVFTrhmCyb3KL
         qkV2G5piIWhWfoeIl3pxiWWfefU4ovmULQDZYZpG9p+j3W0LTniNGZiqgArDuintavaA
         LTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3d6ssC5f4WWJRwGDNIV/dz/cD9cDgvCqu1WVfecFLyc=;
        b=owgAYg3rEuVf/OBUk/xFMypGvVXaZp8Y02gYT7zgd5wmTLf3RK31SwoR/IgsOWl+mD
         pr30kAHLwf9yOhLMHyuB2D/AH7zX9i9DhywgI7JlXjaqirBqsSAdyjITURbROKed3hzW
         njciVlgFkfm74xE+tg4LTmlhD9VKckdkUDPdJA0E3yX9txpIIIzxOh03wDIRtmHVutwm
         1AVXLVOnMhE8fD7ISQXxzc3ZMdJwgk/C3Qx/WNDhYTLcIPRxqd3SyXCb5yQ5ztsTarG7
         13AbVYjEuEO3Taz7Hi3XmfTsqz+ugaCy1ypDpGgy00UCb9G3s7YTc/bWDivXgduHKC6K
         ug+g==
X-Gm-Message-State: APjAAAXJuXZ8x5LxrilpdWymLojAOIQ/AI//GG6BeBSGBzHo3dcGgXqf
        ehz6mISFrVkGCiM27hAIKWi+WlC+7UOB4klwLpyCzc/lfk4=
X-Google-Smtp-Source: APXvYqx7tEjSs8z4kIyICMQiFrgj0ophkeCnu8DdSRdCgVZz1OvOuyinSc+pz6bRlYRdnHwQmWM/eoOWAlXsayefplA=
X-Received: by 2002:a54:4109:: with SMTP id l9mr41508231oic.93.1563975603134;
 Wed, 24 Jul 2019 06:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <b29844e0-4dee-a6a5-913c-59c40f8ab77a@xs4all.nl>
In-Reply-To: <b29844e0-4dee-a6a5-913c-59c40f8ab77a@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 24 Jul 2019 14:39:36 +0100
Message-ID: <CA+V-a8tdcyLFFPfr+K3xR-oNtORJaDD=AAcR-mBwERhEeAWBtA@mail.gmail.com>
Subject: Re: [PATCH] am437x: remove unused struct vpfe_pixel_format
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jul 23, 2019 at 1:59 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> struct vpfe_pixel_format was defined, but never used. Remove it.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
> index 17d7aa426788..4678285f34c6 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.h
> +++ b/drivers/media/platform/am437x/am437x-vpfe.h

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Regards,
--Prabhakar Lad

> @@ -65,12 +65,6 @@ struct vpfe_hw_if_param {
>  #define VPFE_MAX_SUBDEV                1
>  #define VPFE_MAX_INPUTS                1
>
> -struct vpfe_pixel_format {
> -       struct v4l2_fmtdesc fmtdesc;
> -       /* bytes per pixel */
> -       int bpp;
> -};
> -
>  struct vpfe_std_info {
>         int active_pixels;
>         int active_lines;
