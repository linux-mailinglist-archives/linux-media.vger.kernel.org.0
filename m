Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463E32FBABC
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 16:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388973AbhASPGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 10:06:09 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45345 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387894AbhASPAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 10:00:55 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1sUFlPa4uyutM1sUIlbygq; Tue, 19 Jan 2021 16:00:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611068407; bh=3OuqhX0fKb5Rnnw4IYeJ75pOR3gDxev3dlWAVofDOeQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Gz6GeNPCFQv+xwMwBZyw5TePirWbSa3QrX/ZwdYV2CszxJ33vP6N9FbG4RwQOPrvq
         +bss3VRPFVO24RDJ+mPVUSTRjGGNHIRySNrq0zOmYuWdDpki39wFLe7eo8OOyrHZ1g
         1sYvVTK0wMV02WUWGaw73UDbEe2FcdXioBOvwFg6qyFTFysEqXml182tyjQfeCkjS6
         tNq158Ppyiv3jKXhuYwtfOvl+lXlPwFuVLrCTea3B7lWnNE2lXFunhpA0MJ01TDiqN
         k5q7+ihB9/TIXhO4OE598m4uChgBZj8n1RiN290i9irDsDdtMBqOb0meUs4zfYZGeK
         DltK6yrsvEOKg==
Subject: Re: [PATCH] media: rkisp1: uapi: change hist_bins array type from
 __u16 to __u32
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        heiko@sntech.de
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a8f8d9e9-30b1-b594-a9bc-f4a11924bf56@xs4all.nl>
Date:   Tue, 19 Jan 2021 16:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPWzEw0Wkw4hqjhvm7Ynu4zg2W37OjbDYCUfHN/8TwvtlSueANiCt8E2tsvp+7+oD1cJvAz/ALt3AeMVg53PRTx61SLfeHnTlzowe301BCqSs9D8YmMp
 h9fy1tmkiunFmx4CkmssW4vEjr3s7B2aSJBYCbYaF3S73FEauadDPF53gmOhe0em8CKXJBmp7p1Uy6Z51GBFKr6tGJg/auQ0TTxQTTg8NToAhDuYom5E7Yhz
 kloM5iFJq18o1I62FPTyW8diVQCTx/mog0tw53D0MWHVsVGqWnkE8V2gfr2sYt0N3XPUceHOXHw8ZvMbfPDB/HMlWT/XNlmxUsj60KOR2c5BEL3kGouyLWas
 GrBTFZaB6aHzYQhWNOtiojPtwt2Q8Xv+930UTzVM2Zf4Z1duxE0FsoqfByLZPgVkRUwVLou1TTPSLmjD4834TUi9yTKojWscrESvZXqZ/weaHKulyE8Kj+jF
 CMzzJx4F+ZCgtF4POFRHFAmONrag3Ut2nnmQ8EKhNO3jTvFhWLytosJVia11QXMTvradKMyfj8nvo8zWURV+ONDhL1k/YxDwYLwl+GH1OxvwcKdHLbPKcQoy
 8GdOxe73LFwOPGuMOlfLQnod
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/01/2021 15:53, Dafna Hirschfeld wrote:
> Each entry in the array is a 20 bits value composed of 16
> bits unsigned integer and 4 bits fractional part. So the
> type should change to __u32.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> This patch is applied on top of v6 of the patchset
> "Fix the rkisp1 userspace API for later IP versions"
> 
>  include/uapi/linux/rkisp1-config.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 57ca3eea985f..47f6b84d7c56 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
>  /**
>   * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>   *
> - * @hist_bins: measured bin counters
> + * @hist_bins: measured bin counters. Each bin is a 20 bits value
> + *	       composed of a 16-bit unsigned integer and 4 bits fractional part.

So bits 0-3 are the fractional part and bits 4-19 contain the integer part?
What goes where should be defined!

Looking at rkisp1_stats_get_hst_meas() I see this:

        for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
                pbuf->params.hist.hist_bins[i] =
                        (u8)rkisp1_read(rkisp1,
                                        RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);

Here this is cast to a u8, so how does this work?

There is something fishy here...

Regards,

	Hans

>   *
>   * The histogram values divided into 16 bins for V10/V11 and 32 bins
>   * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
> @@ -909,7 +910,7 @@ struct rkisp1_cif_isp_af_stat {
>   * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>   */
>  struct rkisp1_cif_isp_hist_stat {
> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>  };
>  
>  /**
> 

