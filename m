Return-Path: <linux-media+bounces-24984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41704A16EB3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78741632ED
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3241E47A6;
	Mon, 20 Jan 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CmYnKP+x"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CE91E4110;
	Mon, 20 Jan 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384192; cv=none; b=I/0lWgVcY+vrkobXP0fTs6r4Q4C33MMvQAKZERI9wZCYLRmKwdJ/X7fqiXY2ahmOXgEbILPUDHC3mvJqUZ9eaa1+uZk5Lv/YYGR2l4bvFQeUXxsE5xad9S37Hy1LVFyVEti1NsR7hKR1LODjAGhIsa2k7uW6fniC4lHc+gKoQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384192; c=relaxed/simple;
	bh=moVdPJi6H3MH4JPSPbrrx0GBl26cgxCmGTLHQcNr0GY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c20p1IRalt/MSgnSN+rLe0WBUXmPoUIAKg0HOUMcd0jLppnRXZoB2kFUEF9k4h0d6r9fPfDRxhp/fMwMMlkzF0ZyFKwayHHy6BmdyCe1Alm/RG/TrNAhuoiv/nmjNr8/KeMBR4psmwOL9xHom+btsJKCkpbbjYa7N98bAAy//94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CmYnKP+x; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737384188;
	bh=moVdPJi6H3MH4JPSPbrrx0GBl26cgxCmGTLHQcNr0GY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CmYnKP+xXCmB07IEOqurAWp4Q6e0Iytl8SAiyeAblFas7KkhECXkZZWVMyEhxQ+YX
	 Zf9ytFCYmprAYJ36G1rGO/xQepErSUZUJYby1UIjUKnIOLO9+XnY5riSyYc9KeVxJC
	 n7THTG2Va9HrFa6H4UuXFfgG8rsW19dcMQcbjm8scz6yTtjvZGztjEv/lhjJ4wk1Hh
	 OagQjGoZ5vcBLJ33XzVjPyBPw9jYi55fCUU3nhbINL2gE+q8CqPfKUlQPYtTcb/cXe
	 Mw8LZfynfkfVHGOMa6U5KIW0Bzuu1zkLXk5F43VAC4ph+7Vxh4iNOl19aU80O86v9F
	 At/FA8sRl0dFQ==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:11:e976::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB0C717E0FAA;
	Mon, 20 Jan 2025 15:43:07 +0100 (CET)
Message-ID: <e307cb3980711ed9d0ad06648b127ec8f6a9ffa9.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: HEVC: Initialize start_bit field
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Adam Ford <aford173@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 20 Jan 2025 09:43:06 -0500
In-Reply-To: <CAHCN7xKySGN6wnE2FmpuLms-DyThBvx9w6vdKqJvsaWpgW6FOQ@mail.gmail.com>
References: <20250120081052.63224-1-benjamin.gaignard@collabora.com>
	 <cc3b22c9-ff98-4328-9e70-4d22c29a6b0d@collabora.com>
	 <95a8e3c6d28444750bd312ff61a3f6b0daea177a.camel@collabora.com>
	 <CAHCN7xKySGN6wnE2FmpuLms-DyThBvx9w6vdKqJvsaWpgW6FOQ@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 20 janvier 2025 à 08:15 -0600, Adam Ford a écrit :
> On Mon, Jan 20, 2025 at 8:10 AM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> > 
> > Le lundi 20 janvier 2025 à 11:00 +0100, Benjamin Gaignard a écrit :
> > > Le 20/01/2025 à 09:10, Benjamin Gaignard a écrit :
> > > > Always set start_bit field to 0, if not it could lead to corrupted frames
> > > > specially when decoding VP9 bitstreams at the same time since VP9 driver
> > > > set it for it own purpose.
> > 
> >                its
> > 
> 
> Does this impact the Fluster score?

Only if you concurrently test VP9 and HEVC at the same time. Fluster does not
parallelized across codecs, could be a nice addition to catch more issues.

Nicolas

> 
> > > > 
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > 
> > > I could add this tag:
> > > 
> > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > 
> > I have tested this on IMX8MQ board using the following GStreamer pipeline.
> > Before the change, the HEVC window was entirely corrupted. The streams don't
> > matter as long as they use both HEVC and VP9 codec.
> > 
> > gst-launch-1.0 \
> >   filesrc location=hevc.mp4 ! parsebin ! v4l2slh265dec ! fakevideosink \
> >   filesrc location=vp9.mkv ! parsebin ! v4l2slvp9dec ! fakevideosink
> > 
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > 
> > > 
> > > > ---
> > > >   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> > > > index 85a44143b378..0e212198dd65 100644
> > > > --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> > > > +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> > > > @@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
> > > >     hantro_reg_write(vpu, &g2_stream_len, src_len);
> > > >     hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
> > > >     hantro_reg_write(vpu, &g2_strm_start_offset, 0);
> > > > +   hantro_reg_write(vpu, &g2_start_bit, 0);
> > > >     hantro_reg_write(vpu, &g2_write_mvs_e, 1);
> > 
> > I've also crossed against "decoder_swreg_map_g2.xlsx" documentation, if you are
> > lucky to have access to that, and within swreg5 there is only g2_tempor_mvp_e
> > that is also shared, and its already being set in both drivers.
> > 
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > 
> > > > 
> > > >     hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
> > > 
> > 
> > 


