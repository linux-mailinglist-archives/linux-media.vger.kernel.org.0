Return-Path: <linux-media+bounces-44014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 532EDBC6745
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 21:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1976B4E8222
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 19:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1D824503F;
	Wed,  8 Oct 2025 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FgmJk2/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C67920010A;
	Wed,  8 Oct 2025 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759951303; cv=none; b=imPYj5UGyEGSzi1tggVIayirX/NZWGqJ7i9PS4kOVcw4YnXmuQUg4RHHJUiS+sOuZs3Rlyl+NyhwMKlu7TLHnvUAn/yv/JbrxZNmLKBsVjSTnRIx5ETbNpDuU0lDShU4+z/qsAW/XT0aDkyAUzJ8fSze+xMDDd67gsCUVMkm0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759951303; c=relaxed/simple;
	bh=qQokYW/VARCWCLgR7Bc7K4ey6RBNxLIsdA5nrZ46+tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4Vmv8DI4KGeUI3mVPXcGshwNAs3+pptUGRujNnCAkb8njMspR/8IeaSSnK+Eg14RbBEcw7esT/mj6rWL7veTkOplWPfZLhSAli8buG4ih7GOYCT+AvH6HIq58SVOxzPOnDGH3imIDlcMAUEwiEsffBeyJOav/rYh+oU/axs5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FgmJk2/Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B22C11831;
	Wed,  8 Oct 2025 21:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759951203;
	bh=qQokYW/VARCWCLgR7Bc7K4ey6RBNxLIsdA5nrZ46+tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgmJk2/YEEqMsNrw8ePmdPns4OKSKs5GD97J2cZONy3e6nKAXD2s7B1NWuN9t9aEJ
	 P1cM18SZxCqMqCZ+LDBut9PSYPfkFAj0820hagqXrnFHxBZGbus9d46BgECqHzGByr
	 a+qPEkuWAbR3FMswmhzzaCoEv0Bi2mnxSGDI6U9I=
Date: Wed, 8 Oct 2025 22:21:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ming Qian <ming.qian@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Heiko Stuebner <heiko@sntech.de>, Benoit Parrot <bparrot@ti.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>, Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 00/25] media: v4l2-mem2mem: Reduce cargo-cult
Message-ID: <20251008192129.GG16422@pendragon.ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <205478244873d09cad5b77bd887f6a836c31c7ec.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <205478244873d09cad5b77bd887f6a836c31c7ec.camel@collabora.com>

On Wed, Oct 08, 2025 at 02:24:30PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 08 octobre 2025 à 20:50 +0300, Laurent Pinchart a écrit :
> > Hello,
> > 
> > The v4l2_m2m_get_vq() function never returns NULL, but many mem2mem
> > drivers still check its return value and consider NULL as an error. This
> > may have originated a long time ago from valid checks when
> > v4l2_m2m_get_vq() could return NULL, with drivers then just copying the
> > checks. This series attempts to stop the cargo-cult behaviour.
> > 
> > Patch 01/25 starts by explicitly stating in kerneldoc that the
> > v4l2_m2m_get_vq() function never returns NULL. All the other patches
> > drop NULL checks from drivers.
> > 
> > I have carefully checked all patched locations in all drivers. They fall
> > in 3 categories:
> > 
> > - Checks in the VIDIOC_G_FMT, VIDIOC_TRY_FMT and VIDIOC_S_FMT handlers:
> >   Those may have been added to ensure that the format type has a valid
> >   value, but that is ensured by the V4L2 ioctl core before calling the
> >   handlers. The checks can be dropped without a need to replace them
> >   with proper type checks.
> > 
> > - Checks in the VIDIOC_S_SELECTION handler: The only location where this
> >   is performed has an explicit type check, so the NULL check can also be
> >   dropped.
> > 
> > - Checks in other locations where the type parameter to the
> >   v4l2_m2m_get_vq() function is hardcoded: The hardcoded type is valid,
> >   so the NULL check can't have been meant to check the type. It can also
> >   be removed.
> > 
> > There's no dependency between any of those patches so they can be merged
> > in any order.
> > 
> > Laurent Pinchart (25):
> >   media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns
> >     NULL
> >   media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
> 
> Why not "renesas: jpu" to match the fdp1 patch naming ?

I tried to go with the most common prefix as reported by git log. I
don't mind changing this, I'll wait for more reviews to see if a v2 is
needed, otherwise this can be updated when applying if desired.

> >   media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
> >   media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check
> 
> I reviewed the list and it seems complete to me.

Thank you.

> >  drivers/media/platform/allegro-dvt/allegro-core.c    |  2 --
> >  drivers/media/platform/amlogic/meson-ge2d/ge2d.c     |  5 -----
> >  drivers/media/platform/amphion/vdec.c                |  2 --
> >  drivers/media/platform/amphion/venc.c                |  2 --
> >  .../media/platform/chips-media/coda/coda-common.c    |  4 ----
> >  drivers/media/platform/imagination/e5010-jpeg-enc.c  |  4 ----
> >  drivers/media/platform/m2m-deinterlace.c             |  7 -------
> >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  7 -------
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  7 -------
> >  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        |  2 --
> >  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  2 --
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c         |  8 --------
> >  drivers/media/platform/nxp/dw100/dw100.c             |  7 -------
> >  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c       |  4 ----
> >  drivers/media/platform/nxp/imx-pxp.c                 |  7 -------
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   |  2 --
> >  drivers/media/platform/nxp/mx2_emmaprp.c             |  7 -------
> >  drivers/media/platform/qcom/iris/iris_vdec.c         |  2 --
> >  drivers/media/platform/qcom/venus/vdec.c             |  2 --
> >  drivers/media/platform/qcom/venus/venc.c             |  2 --
> >  drivers/media/platform/renesas/rcar_fdp1.c           |  3 ---
> >  drivers/media/platform/renesas/rcar_jpu.c            |  8 --------
> >  drivers/media/platform/rockchip/rga/rga.c            |  4 ----
> >  drivers/media/platform/samsung/s5p-g2d/g2d.c         |  4 ----
> >  drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c  |  7 -------
> >  drivers/media/platform/st/stm32/dma2d/dma2d.c        |  5 -----
> >  drivers/media/platform/ti/vpe/vpe.c                  |  7 -------
> >  drivers/media/test-drivers/vicodec/vicodec-core.c    |  7 -------
> >  drivers/media/test-drivers/vim2m.c                   | 12 ------------
> >  drivers/media/v4l2-core/v4l2-mem2mem.c               | 12 +-----------
> >  include/media/v4l2-mem2mem.h                         |  3 +++
> >  31 files changed, 4 insertions(+), 153 deletions(-)
> > 
> > 
> > base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a

-- 
Regards,

Laurent Pinchart

