Return-Path: <linux-media+bounces-18200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FBF976A24
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7619B213B9
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0415E1ABEA7;
	Thu, 12 Sep 2024 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dX7NuG/w";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="AH1HDdvh"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-33.smtp-out.eu-west-1.amazonses.com (a7-33.smtp-out.eu-west-1.amazonses.com [54.240.7.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BE1A7061;
	Thu, 12 Sep 2024 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726146782; cv=none; b=THjHmA9HYBa3SY0NJPAqYJXDWSF9Lxod769QPuzqyv84uRr8fR6rHKb4eVNO8OpzNBCTS7epzmgOaB3JGmU/A1BwHuyeE+N1dPp8Z6RBT/7MNq+ISNPn+crSr5mqrrLbyVSnwBW++hyKyr1pqeMAkDViAGDEoT8bQe4GneSjRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726146782; c=relaxed/simple;
	bh=FCDKH+dGTne6gNIyeiiS/f4ZRvgrS/69nkalAook8Iw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DbvwTUS29BKvwkVfjCHkQ0cd139B2FCXEVqbEzYhSgje9ifUoZMtIiDBK+5udqVBpIezRYCW+P+m8/gMH1HrBFWkZx4hW07iYIQV6fpr0M+qtrm0Zw2vH75oy1n0kvwncsAuA4C7jbIt0gXhZfpUcncIrsyY5dmQWZf6pUPxKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dX7NuG/w; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=AH1HDdvh; arc=none smtp.client-ip=54.240.7.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726146778;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=FCDKH+dGTne6gNIyeiiS/f4ZRvgrS/69nkalAook8Iw=;
	b=dX7NuG/w3m2zQqH3BSd0dC7vXlvt7MFc+w6DerDMQmyMDMngk7Y2K+zO3p7Be3f8
	PGyCy9/T+Wkh+vzzglygLM7sUsoDsMw4WsXmdBx03bnD/PjTKj01u7wJQk4OKv8jAy0
	xqUsDzbSxs+WBvzqijZmxlTeLEuisApMsUtd3qWOa7j8ry8sLpLIjfi0X6VQ8t50Yjr
	cVCA7y0JX+euqSQORnOMjYtxG/Mvvfpm0JZFT9CWRvN8+dQ2FAIQVgRzZDpo0F3eDHm
	P3P8rZYn+82ijUZz9WEbKBb5HBma5fFO2H23/JXZOWRyHM9nP8p70Wm1NfUY84HWo8c
	VVPUUNBEEQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726146778;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=FCDKH+dGTne6gNIyeiiS/f4ZRvgrS/69nkalAook8Iw=;
	b=AH1HDdvhcNeJm5JK+XP26VzYc19yEQZrA39ietZ1yhs0tkglzn8WXDPqhsypXrIL
	W3YXUsa3hy3OpvIzXSkhX+vjBUszRWjYCNuvSdbkkVNQEMCuNXz66n64CoFQIeniOue
	/XyNRV35SlLzaP2Jq7R4/XopFoqFkqjJaOwK1qKY=
Message-ID: <01020191e65d93a5-448a3c64-c746-4d9b-820f-6a9413c6f0af-000000@eu-west-1.amazonses.com>
Subject: Re: [PATCH 2/2] media: verisilicon: add WebP decoding support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>, 
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
Date: Thu, 12 Sep 2024 13:12:58 +0000
In-Reply-To: <e3e4a4e6-d0ac-455e-9854-d93bdb13f272@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
	 <20240911135011.161217-3-hugues.fruchet@foss.st.com>
	 <1d02cbe2797053c69ba9d7adb9c666ca221407e0.camel@collabora.com>
	 <01020191e2672cd9-0b3804cc-def2-4dfb-aa44-8eddbd5e99fb-000000@eu-west-1.amazonses.com>
	 <e3e4a4e6-d0ac-455e-9854-d93bdb13f272@foss.st.com>
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
X-SES-Outgoing: 2024.09.12-54.240.7.33

Le jeudi 12 septembre 2024 à 14:18 +0200, Hugues FRUCHET a écrit :
> Hi Nicolas,
> 
> Thanks for reviewing.
> 
> GStreamer changes are provided through this merge request: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7505
> 
> Code:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/138ecfac54ce85b273a26ff6f0fefe3998f8d436?merge_request_iid=7505
> 
> 
> 
> On 9/11/24 20:44, Nicolas Dufresne wrote:
> > Le mercredi 11 septembre 2024 à 13:58 -0400, Nicolas Dufresne a écrit :
> > > Hi Hugues,
> > > 
> > > Le mercredi 11 septembre 2024 à 15:50 +0200, Hugues Fruchet a écrit :
> > > > Add WebP picture decoding support to VP8 stateless decoder.
> > > 
> > > Unless when its obvious, the commit message should explain what is being
> > > changed.
> > > 
> > > > 
> > > > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > > ---
> > > >   drivers/media/platform/verisilicon/hantro_g1_regs.h    | 1 +
> > > >   drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c | 7 +++++++
> > > >   2 files changed, 8 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > > > index c623b3b0be18..e7d4db788e57 100644
> > > > --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > > > +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > > > @@ -232,6 +232,7 @@
> > > >   #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
> > > >   #define G1_REG_ADDR_STR					0x030
> > > >   #define G1_REG_ADDR_DST					0x034
> > > > +#define G1_REG_ADDR_DST_CHROMA				0x038
> > > >   #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
> > > >   #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
> > > >   #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
> > > > diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > > > index 851eb67f19f5..c6a7584b716a 100644
> > > > --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > > > +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > > > @@ -427,6 +427,11 @@ static void cfg_buffers(struct hantro_ctx *ctx,
> > > >   
> > > >   	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
> > > >   	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> > > > +
> > > > +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
> > > > +		vdpu_write_relaxed(vpu, dst_dma +
> > > > +				   ctx->dst_fmt.height * ctx->dst_fmt.width,
> > > 
> > > I'm not really not fan of that type of formula using padded width/height. Not
> > > sure if its supported already, but if we have foreign buffers with a bigger
> > > bytesperline, the IP may endup overwriting the luma. Please use the per-plane
> > > bytesperline, we have v4l2-common to help with that when needed.
> > > > +				   G1_REG_ADDR_DST_CHROMA);
> 
> OK, I'll check that.
> 
> > > 
> > > I have a strong impression this patch is incomplete (not generic enough). The
> > > documentation I have indicates that the resolution range for WebP can be
> > > different for different synthesis. See swreg54 (0xd8), if bit 19 is set, then it
> > > can support 16K x 16K resolution. There is no other way around that then
> > > signalling explicitly at the format level that this is webp, since otherwise you
> > > can't know from userspace and can't enumerate the different resolution. I'm
> > > curious what is the difference at bitstream level, would be nice to clarify too.
> 
> See below WebP image details.
> 
> > 
> > I've also found that when the PP is used, you need to fill some extended
> > dimension (SWREG92) with the missing bit of the width/height, as the dimension
> > don't fit the usual register.
> > 
> 
> Yes there are additional registers to set in postproc for large image > 
> 3472x4672 and image input bitstream larger than 16777215 bytes.
> I have not tested such large images for now.
> Additionally I don't have postproc support on STM32MP25.
> Anyway I can guard for those limits in code...
> 
> > More notes, I noticed that WebP supports having a second frame for the alpha,
> > similar to WebM Alpha, for that we expect 2 requests, so no issue on this front.
> > WebP Loss-less is a completely different codec, and should have its own format.
> > 
> > I think overall, from my read of the spec, that its normal VP8, but the
> > resolution will exceed the normal one. We also can't always enable WebP, since
> > it will break references.
> > 
> > Nicolas
> > 
> 
> As far as I have understood & tested, WebP is just an encapsulation of 
> VP8 video chunk:
>   * Webp image RIFF header
>   *
>   * 52 49 46 46 f6 00 00 00 57 45 42 50 56 50 38 20  RIFF....WEBPVP8
>   * ea 00 00 00 90 09 00 9d 01 2a 30 00 30 00 3e 35  .........*0.0.>5
>   *           | \______/ \______/
>   *           |       |         \__VP8 startcode
>   *           |        \__VP8 frame_tag
>   *           |
>   *            \__End of WebP RIFF header: 20 bytes, then VP8 chunk
> 
> At least for lossy WebP.
> 
> There are two others WebP formats which are loss-less WebP and animated 
> WebP but untested on my side, I don't even know if those formats are 
> supported by the hardware IP.
> 
> > > 
> > > On GStreamer side, the formats are entirely seperate, image/webp vs video/x-vp8
> > > are the mime types. Seems a lot safe to keep these two as seperate formats. They
> > > can certainly share the same stateless frame structure, with the additional flag
> > > imho.
> > > 
> > > Nicolas
> 
> Really very few changes needed on VP8 codebase to support WebP. On my 
> opinion it doesn't need a fork of codec for that, hence just the minor 
> addition of "WebP"  signaling on uAPI see GStreamer limited changes in 
> VP8 codebase to support WebP:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/138ecfac54ce85b273a26ff6f0fefe3998f8d436?merge_request_iid=7505

If it was identical, we'd need no flag. The requirement to use the flag is not
discoverable. What I'm guessing is that anything above 1080p needs the flag. But
then if you enable that flag, you loose the ability to use references, so that
would equally break normal VP8. It seems like a VP8 decoder is compatible with
WebP, but a WebP decoder is not compatible with VP8.

I cannot accept what you believe is a simple solution since its not discover-
able by userspace. The Hantro VP8 decoder driver is not the only VP8 driver, so
the GStreamer implementation would break randomly on other SoC.

My recommendation is to introduce V4L2_PIX_FMT_WEBP_FRAME, and make it so that
format reused 100% of the VP8_FRAME format (very little work, no flag needed
since the format holds that). This way, drivers can be very explicit through
their ENUM_FORMAT implementation, and can also expose different resolution
ranges properly.

Nicolas

p.s. you should draft the required synthesis check and postproc code, I can test
it for you.

> 
> > > 
> > > >   }
> > > >   
> > > >   int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> > > > @@ -471,6 +476,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> > > >   		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
> > > >   	if (hdr->lf.level == 0)
> > > >   		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
> > > > +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
> > > > +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
> > > >   	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
> > > >   
> > > >   	/* Frame dimensions */
> > > 
> > 
> 
> BR,
> Hugues.


