Return-Path: <linux-media+bounces-18180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16899975A7A
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 20:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC00A2873CC
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 18:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2E41B9B36;
	Wed, 11 Sep 2024 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZdboSke0";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="YOOE5Zh2"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-51.smtp-out.eu-west-1.amazonses.com (a7-51.smtp-out.eu-west-1.amazonses.com [54.240.7.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C8187543;
	Wed, 11 Sep 2024 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726080301; cv=none; b=Shm4crK1v8oZ7woWz4Ax6YcZ0TCGIvlseypLMpOChBXBhGYUmWceAJl5xJp54vgOIo6CHstE/WquCteuZXte9d28oXYq8xKuFp1UYAXQo8DYEvEarp+++h8//ZcWp+QoxJWSy6EeIu4eYhXDShyoEqWavjiZMXOykrOOtVwTX98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726080301; c=relaxed/simple;
	bh=CR2RtkO2BSHxVxQC+ucikk+G5Cf3fAmUmuV21ZYLYpo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nAxf3t1iK1eLjveIkyRNTq3tX9g/wsFwmO7iprekiwlpyIcGZEMk1zVQT10LXcR1BJRkxVd6twon+e2WHMpEif3pwQqDXqVuJuFfX9NabZbH0q1JAD57FhLNbRMWO3QTcQ0MmutHHCpUH4zPv8F8h2IaX0YW13+sQiDZCNdg0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZdboSke0; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=YOOE5Zh2; arc=none smtp.client-ip=54.240.7.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726080298;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=CR2RtkO2BSHxVxQC+ucikk+G5Cf3fAmUmuV21ZYLYpo=;
	b=ZdboSke0HhoFjztGdp5MMBrBds+Q2D4rn8RIvPzlJyYc72JFvemSvWIPnegYveWV
	kRLfsV8a9fy6IBIXLbUmKsRr5xSSLa3BhAOhhvcQp9+uu4JBKpONs+9x8vqODZGlSLJ
	FNuTX3RtY0LWK+YRTvBi0Gbo/ZWgl9kCHKlNibStQy3wwabHr0gWLckXFmb93F0KA8N
	ra+mecnSwrH47FkzPGPvHJ4Dcmm7lQ7OPcO/awrl9UebjkQJyprrYw3vcj3hj1HD3Vo
	Qrrj8czi0QuaB5IoqvCrNbdXffst+lwyb5rcdAuEKlvF/UvJbDjFVgr3qfDumsuW/VB
	jw0FL3JxTg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726080298;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=CR2RtkO2BSHxVxQC+ucikk+G5Cf3fAmUmuV21ZYLYpo=;
	b=YOOE5Zh2+tRJtL0YwyNnu02LYplS1fSY+2THCVFX3YJCkr/Gpjv1xwPbaOFM9roA
	6dKUEF7MtlPE4mrm7fF6t8KKdcq59nnGQvrmBxlD9OQooLeUZdk/iykdPPK2Q0JVSGe
	+n4xsSIZwSh70UloGWi0VKQ6Oxze0XK6gEms+A90=
Message-ID: <01020191e2672cd9-0b3804cc-def2-4dfb-aa44-8eddbd5e99fb-000000@eu-west-1.amazonses.com>
Subject: Re: [PATCH 2/2] media: verisilicon: add WebP decoding support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Fritz Koenig <frkoenig@chromium.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 11 Sep 2024 18:44:58 +0000
In-Reply-To: <1d02cbe2797053c69ba9d7adb9c666ca221407e0.camel@collabora.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
	 <20240911135011.161217-3-hugues.fruchet@foss.st.com>
	 <1d02cbe2797053c69ba9d7adb9c666ca221407e0.camel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.51

Le mercredi 11 septembre 2024 à 13:58 -0400, Nicolas Dufresne a écrit :
> Hi Hugues,
> 
> Le mercredi 11 septembre 2024 à 15:50 +0200, Hugues Fruchet a écrit :
> > Add WebP picture decoding support to VP8 stateless decoder.
> 
> Unless when its obvious, the commit message should explain what is being
> changed.
> 
> > 
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > ---
> >  drivers/media/platform/verisilicon/hantro_g1_regs.h    | 1 +
> >  drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c | 7 +++++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > index c623b3b0be18..e7d4db788e57 100644
> > --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > @@ -232,6 +232,7 @@
> >  #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
> >  #define G1_REG_ADDR_STR					0x030
> >  #define G1_REG_ADDR_DST					0x034
> > +#define G1_REG_ADDR_DST_CHROMA				0x038
> >  #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
> >  #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
> >  #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
> > diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > index 851eb67f19f5..c6a7584b716a 100644
> > --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > @@ -427,6 +427,11 @@ static void cfg_buffers(struct hantro_ctx *ctx,
> >  
> >  	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
> >  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> > +
> > +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
> > +		vdpu_write_relaxed(vpu, dst_dma +
> > +				   ctx->dst_fmt.height * ctx->dst_fmt.width,
> 
> I'm not really not fan of that type of formula using padded width/height. Not
> sure if its supported already, but if we have foreign buffers with a bigger
> bytesperline, the IP may endup overwriting the luma. Please use the per-plane
> bytesperline, we have v4l2-common to help with that when needed.
> > +				   G1_REG_ADDR_DST_CHROMA);
> 
> I have a strong impression this patch is incomplete (not generic enough). The
> documentation I have indicates that the resolution range for WebP can be
> different for different synthesis. See swreg54 (0xd8), if bit 19 is set, then it
> can support 16K x 16K resolution. There is no other way around that then
> signalling explicitly at the format level that this is webp, since otherwise you
> can't know from userspace and can't enumerate the different resolution. I'm
> curious what is the difference at bitstream level, would be nice to clarify too.

I've also found that when the PP is used, you need to fill some extended
dimension (SWREG92) with the missing bit of the width/height, as the dimension
don't fit the usual register.

More notes, I noticed that WebP supports having a second frame for the alpha,
similar to WebM Alpha, for that we expect 2 requests, so no issue on this front.
WebP Loss-less is a completely different codec, and should have its own format.

I think overall, from my read of the spec, that its normal VP8, but the
resolution will exceed the normal one. We also can't always enable WebP, since
it will break references.

Nicolas

> 
> On GStreamer side, the formats are entirely seperate, image/webp vs video/x-vp8
> are the mime types. Seems a lot safe to keep these two as seperate formats. They
> can certainly share the same stateless frame structure, with the additional flag
> imho.
> 
> Nicolas
> 
> >  }
> >  
> >  int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> > @@ -471,6 +476,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> >  		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
> >  	if (hdr->lf.level == 0)
> >  		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
> > +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
> > +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
> >  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
> >  
> >  	/* Frame dimensions */
> 


