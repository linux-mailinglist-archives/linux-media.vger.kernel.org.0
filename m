Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A68A1C5ADC
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 17:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbgEEPSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 11:18:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:45018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729261AbgEEPSp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 11:18:45 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA10420661;
        Tue,  5 May 2020 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588691925;
        bh=Qb+bFTrIW/turrfytG4Xj+vuZ0yQCBJTHqIHLSzr85Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vgkcg/8OufOHNA/2a7yMDXATx+PzttSLb25/eJdAKF635garePY8s8lLNraw1LRv6
         VXNNiWfiOPCm7i6BI2TzgXY3EDcLnB6o/GKh+xT4o5gbbPmo4irXC6kU8wvHp0jtZL
         SiRllWraLVhN0ZoS77AmMUO3RZWimOB35NegYes4=
Date:   Tue, 5 May 2020 17:18:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCH 2/3] media: meson: vdec: fix another case of VP9 buffer
 shortage
Message-ID: <20200505171840.48d89ccc@coco.lan>
In-Reply-To: <20200428125036.9401-3-narmstrong@baylibre.com>
References: <20200428125036.9401-1-narmstrong@baylibre.com>
        <20200428125036.9401-3-narmstrong@baylibre.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 28 Apr 2020 14:50:35 +0200
Neil Armstrong <narmstrong@baylibre.com> escreveu:

> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> - Redo the logic where VP9 gets fresh CAPTURE buffers. The previous code
>   could lead to a hardlock.
> - Reserve 4 margin buffers instead of 3, as apparently there are corner
>   cases where 3 is not enough.
> 
> Fixes: e9a3eb4819ca ("media: meson: vdec: add VP9 input support")
> Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

> +static struct vb2_v4l2_buffer *get_free_vbuf(struct amvdec_session *sess)
> +{
> +	struct codec_vp9 *vp9 = sess->priv;
> +	struct vb2_v4l2_buffer *vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
> +	struct vb2_v4l2_buffer *vbuf2;
> +
> +	if (!vbuf)
> +		return NULL;
> +
> +	if (!codec_vp9_get_frame_by_idx(vp9, vbuf->vb2_buf.index))
> +		return vbuf;
> +
> +	vbuf2 = get_free_vbuf(sess);

Huh!!!!

Never use recursive functions inside the Kernel! Kernel stack is too
limited.

Also, even if Kernel stack would be unlimited, the above logic
would endlessly be calling get_free_vbuf(sess).

Thanks,
Mauro
