Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2234874F83
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387683AbfGYNbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 09:31:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45660 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387657AbfGYNbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 09:31:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so47933117lje.12
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lRofjpGVnPdkvHjT1abpzFvdhqRUdMtCwITS9XC9FqY=;
        b=WKwOxX6KPDQIRmCgJAKTRU8nyTVTibB5C1TnIuihKcSV5lNt9QF4vT4B5iz0FMTva1
         X+7McxEoaoHiZtop26NDtdsbRmzb/o4oqU+CfFw5lOJcRcmxL8HDtEfX54kpPakjiubz
         MUTRw3XXFYfdTUeK+go0VcL/q1AxSnTaPZfY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lRofjpGVnPdkvHjT1abpzFvdhqRUdMtCwITS9XC9FqY=;
        b=EoKxMGDGCOnKGnH4jxjam+gFag+80ae6siO62Ujl5LIGoI8bGviS3N1SC9SdLt6mtn
         p5isXi4hpedMc2emUFyHyokKRnmbQ+LBA/cuI56VoAkXX4Ktbc076VdOpQPUvr47Efr3
         0VCzm1aiGbmtlEv1FCuZLwNY+0bENaniksWI+mCZKnc/kkproih5zN+TPfFnL9TBMDmc
         zaQ4IBIyJKA/HNtjcF/McLbg8KUtoMgxHEJKkggjZ0GAhfbYeEw+iIZyqBvQosl0YFAh
         6Cz7XgqpzcasH7gjO7qX/WTpxtmONVk2JeOS06+PlX0gy8aG6JjcASWP/EzFU/Rl9pdo
         KCLA==
X-Gm-Message-State: APjAAAUku00t2HKaP2AzqvEl65Y3Zg/XJmSuIRWwF+5tKsimMhcmWeJJ
        +yTFQNEXYE7osopYLUYLAb0=
X-Google-Smtp-Source: APXvYqz/F986DupauyPnWK3++D6Z9b8wSPFEQgtug6IFVchRI8stLut7ttlybhQferFVWVbypQXzzQ==
X-Received: by 2002:a2e:3013:: with SMTP id w19mr46339678ljw.73.1564061503937;
        Thu, 25 Jul 2019 06:31:43 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id l22sm9051754ljc.4.2019.07.25.06.31.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 06:31:43 -0700 (PDT)
Subject: Re: [PATCH 7/9] media: hantro: Add core bits to support H264 decoding
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hertz Wong <hertz.wong@rock-chips.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
 <20190619121540.29320-8-boris.brezillon@collabora.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <25cc2826-fc8f-570a-07fa-8cbdb11830a7@rasmusvillemoes.dk>
Date:   Thu, 25 Jul 2019 15:31:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190619121540.29320-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/06/2019 14.15, Boris Brezillon wrote:
> From: Hertz Wong <hertz.wong@rock-chips.com>
> 
> Add helpers and patch hantro_{drv,v4l2}.c to prepare addition of H264
> decoding support.
> 
> Signed-off-by: Hertz Wong <hertz.wong@rock-chips.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> +
> +	/*
> +	 * Short term pics in descending pic num order, long term ones in
> +	 * ascending order.
> +	 */
> +	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
> +		return b->frame_num - a->frame_num;
> +
> +	return a->pic_num - b->pic_num;
> +}

Pet peeve: This works because ->frame_num and ->pic_num are u16, so
their difference is guaranteed to fit in an int.

> +static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
> +{
> +	const struct hantro_h264_reflist_builder *builder = data;
> +	const struct v4l2_h264_dpb_entry *a, *b;
> +	s32 poca, pocb;
> +	u8 idxa, idxb;
> +
> +	idxa = *((u8 *)ptra);
> +	idxb = *((u8 *)ptrb);
> +	a = &builder->dpb[idxa];
> +	b = &builder->dpb[idxb];
> +
> +	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
> +	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
> +		/* Short term pics firt. */
> +		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
> +			return -1;
> +		else
> +			return 1;
> +	}
> +
> +	/* Long term pics in ascending pic num order. */
> +	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +		return a->pic_num - b->pic_num;
> +
> +	poca = builder->pocs[idxa];
> +	pocb = builder->pocs[idxb];
> +
> +	/*
> +	 * Short term pics with POC < cur POC first in POC descending order
> +	 * followed by short term pics with POC > cur POC in POC ascending
> +	 * order.
> +	 */
> +	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
> +		return poca - pocb;
> +	else if (poca < builder->curpoc)
> +		return pocb - poca;
> +
> +	return poca - pocb;
> +}

Here, however, poca and pocb are ints. What guarantees that their values
are not more than 2^31 apart? I know absolutely nothing about this code
or what these numbers represent, so it may be obvious that they are
smallish.

Rasmus
