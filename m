Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9383D1EFEA5
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 19:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgFERQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 13:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgFERQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 13:16:38 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0C6C08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 10:16:38 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g18so9057281qtu.13
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mKwEVWcuU9C/nuiwJL6rIyPwKlGow9qq7XqSXfkexXo=;
        b=JW744sp/ZMjgMWxCbk1XkfcVNgxRtWJfRjXsMlGfic0he3IcOG6TbcxkuoS6aVv+t8
         kDDT5uGYJ5bjzaOwha4LHAMoOg6Lc3du03KhN9t/isduEood6I/Cd4VVWfqG/AR5aqRQ
         wHLEAUjBttw/BNHBpoZnVQwf0JU9LF//utPqtTRBcVqB4gVrBNzRsRhqt+aZeb6ljsKR
         91ZwfT3zsbqz3vAFDlgJzxFOMtHOxedLf2wfwdvbjTDkDsqo7Pq3FIt8qNYvO34vWM6r
         XYnk3HQGO9F3lI3Y2P9upf3S/zZx/j+5pluLh1M3B+eeB7PDjz55IADa/ghUI3Tj+b3z
         zywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mKwEVWcuU9C/nuiwJL6rIyPwKlGow9qq7XqSXfkexXo=;
        b=mvuOQdJbMvJtBDOB+C3hYaean13mDk0ltjrHHEE5+TX2RwU9sxvfeznB9FQxrlIj5a
         kQDAUlG0hIEGlX2i1+QNmtuLDM5/eM1DY+gEcTTfXpTVggBFdSHATJxpDfRYZkQNwnoM
         o5hVXY9TF4nDtsyI7I05tCCQjY6zptTrB3fmGyh20jatqEuMtH5bJ1q6vy5+tk1l9Z91
         z7mfSReQvqkwMcxpHd76jICTNiIneIgDCzXVtJEQJv75sYZJ5ohuvCoVz9IOtBr744hk
         VUciEH8CbNFklzvlnQbH5YO0p3Mo+j+ibU8seWAi9QU7MBH2GfbykmB9x+mQUmAcrHKH
         1n3g==
X-Gm-Message-State: AOAM533CwzD7p746ObIvprEj8NnSTLPK94MsbqQt462p2iYatlzIe3WG
        NtJYruLbh3a7befTzjYbXOyKVg==
X-Google-Smtp-Source: ABdhPJz14TforE3jgSwXfr9lStxyBFF1sjMdKoGyrBGGeSClYBkD8DrTRaHF2oSD9Cx42KVrs/3p2w==
X-Received: by 2002:ac8:42ce:: with SMTP id g14mr10938312qtm.117.1591377397661;
        Fri, 05 Jun 2020 10:16:37 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id z4sm330982qtu.33.2020.06.05.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 10:16:36 -0700 (PDT)
Message-ID: <7e74e15b7b3f9fc765182f1a43cfcf1e0e9602fc.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] media: cedrus: h264: Properly configure reference
 field
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     mchehab@kernel.org, wens@csie.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, jonas@kwiboo.se,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Date:   Fri, 05 Jun 2020 13:16:35 -0400
In-Reply-To: <20200604185745.23568-3-jernej.skrabec@siol.net>
References: <20200604185745.23568-1-jernej.skrabec@siol.net>
         <20200604185745.23568-3-jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 04 juin 2020 à 20:57 +0200, Jernej Skrabec a écrit :
> When interlaced H264 content is being decoded, references must indicate
> which field is being referenced. Currently this was done by checking
> capture buffer flags. However, that is not correct because capture
> buffer may hold both fields.
> 
> Fix this by checking newly introduced flags in reference lists.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Perhaps an additional patch could cleanup the miss-leading comment in
v4l2_h264_dpb_entry definition.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index cce527bbdf86..c87717d17ec5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -183,7 +183,6 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  	for (i = 0; i < num_ref; i++) {
>  		const struct v4l2_h264_dpb_entry *dpb;
>  		const struct cedrus_buffer *cedrus_buf;
> -		const struct vb2_v4l2_buffer *ref_buf;
>  		unsigned int position;
>  		int buf_idx;
>  		u8 dpb_idx;
> @@ -198,12 +197,11 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  		if (buf_idx < 0)
>  			continue;
>  
> -		ref_buf = to_vb2_v4l2_buffer(cap_q->bufs[buf_idx]);
> -		cedrus_buf = vb2_v4l2_to_cedrus_buffer(ref_buf);
> +		cedrus_buf = vb2_to_cedrus_buffer(cap_q->bufs[buf_idx]);
>  		position = cedrus_buf->codec.h264.position;
>  
>  		sram_array[i] |= position << 1;
> -		if (ref_buf->field == V4L2_FIELD_BOTTOM)
> +		if (ref_list[i].flags & V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD)
>  			sram_array[i] |= BIT(0);
>  	}
>  

