Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF0D1E338B
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 01:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389156AbgEZXPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 19:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389108AbgEZXPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 19:15:30 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2C7C061A0F
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 16:15:30 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id a18so4965940ilp.7
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 16:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jySBpRhgkSp7FY1LCM2GdR3ZkT18v8dbWVMPb8KTVKQ=;
        b=jQvVZCuoZLkH0/MONjJCWdYd6HCaaSU40xZChA03I2EIwFahcBDNE9lgIU/8/hSscv
         Kkkh0A6F6G5Y/1Jr4D4RJBoDTmfu1oB6XPpCoWU46hm2rlP+4xK33JV3kJpC1SdV3cZa
         +6rMZa8qE1+kCQ8e0X1LGvkHJG6XjbZkBeYbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jySBpRhgkSp7FY1LCM2GdR3ZkT18v8dbWVMPb8KTVKQ=;
        b=qxp33wWz3ZRJ0v1K0RU8cPevEhZexul1s6cURxvSdBC/Z/HYqzZuzC6jBA4+tdrGle
         4c46Q5MXAPLn29mkm3lLHjjSN4hxmtoIOEwvSDyWicBdLu/TjlgFI8kmtPBmB7VnEjAE
         7H5TeKniNT1PcpuKaaJhdcmvsQQj/9HkFFJWbmHv2sh0VJuNd2Oeisj/uF9zHt0+JRPw
         mni5eDOud6RS9WnooaNy8wWwacLe997EMkIUGgm80j2Q8ACq6T005SdbWXf0L0vbP+WU
         VTML44kxTnvmoaqHbs1v4UrJPJ+VYxVePb+/+fruJGSPQ02sc6wvAFvkcsO//lQoOOVS
         K4pA==
X-Gm-Message-State: AOAM5316n9nUrtRRKnVqGXoH5NVMguvuN8exMPnl5mD+8E2EOYSy2Py/
        7HEtB3t5watOUdrSzybVwNK+H3RPjlKHLapxDfe8sA==
X-Google-Smtp-Source: ABdhPJzUFjqV1LEvDL6VMICWxhJEfLEXJnd1oqfCQQJcRjKaYsMndr5uwWNZ1KljJGIXDsvI2EbJiKzpjaYyIcB48p4=
X-Received: by 2002:a92:d182:: with SMTP id z2mr3490952ilz.47.1590534929915;
 Tue, 26 May 2020 16:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200509152904.26348-1-dafna.hirschfeld@collabora.com> <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 27 May 2020 01:15:18 +0200
Message-ID: <CAHD77Hksw9QmSkNs7qx7fBHWDw7gJjhZAXNZCrMLhEYFFg5e_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: staging: rkisp1: stats: don't set stats flags
 in rkisp1_stats_send_measurement
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 9, 2020 at 5:29 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The flags that indicate which statistics are read are already
> set in the functions that read them so there is no need to
> set them in the function rkisp1_stats_send_measurement.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-stats.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 8351bda0be03..0616793ae395 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -356,26 +356,19 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
>         cur_stat_buf =
>                 (struct rkisp1_stat_buffer *)(cur_buf->vaddr[0]);
>

Should we perhaps also set cur_stat_buf->meas_type to 0 here?

> -       if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
> +       if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE)
>                 rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
> -               cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;

I wonder if it wouldn't be cleaner if this function took care of
meas_type, rather than sprinkling it all over the measurement
collection functions.

> -       }
>
> -       if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN) {
> +       if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN)
>                 rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
> -               cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
> -       }
>
>         if (meas_work->isp_ris & RKISP1_CIF_ISP_EXP_END) {
>                 rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
>                 rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
> -               cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
>         }
>
> -       if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY) {
> +       if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
>                 rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
> -               cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> -       }
>
>         vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
>                               sizeof(struct rkisp1_stat_buffer));
> --
> 2.17.1
>
