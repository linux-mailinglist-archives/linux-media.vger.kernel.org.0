Return-Path: <linux-media+bounces-39075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B4B1DE45
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 22:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 580037A282B
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 20:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B0C238D54;
	Thu,  7 Aug 2025 20:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aW6JtiQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA972253FF;
	Thu,  7 Aug 2025 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754598375; cv=none; b=fU2roi/i8A2J7y6zWH628UJKe1Ql94f582vrOi3c1lBxTY8rbTKla8Y9TWWh/KZOqLsFiubKl1sPNvgKsQivTKUjSod7+Uc8a7UdXgtGafrSiIX7kjIYtNG6p1hvfaJ+2P3k/tYbek5a4QJmsT2U7fvSo63znTiqkxiw/ZER7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754598375; c=relaxed/simple;
	bh=o7LUjJMhR9kVMO0RUKgNBEeUWS6IQRa/l/xrEqZlJRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8/zDfmTNfqBdhliVFI5GNAFFzMV4oqaz8BmGkM41xd7uUpFrKBI2bfV0okjgYMKio5ANUQ4QdH+9ZZNZu7nQxHave2r6oDJupdlsbUQl+q47zH2a2jU8MU8gb3n5EG4ZWRloBJgbSvDEzhH3ZXq+HJHB5TQWaFLU2BE7p4t7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aW6JtiQ2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 40EAFAD0;
	Thu,  7 Aug 2025 22:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754598319;
	bh=o7LUjJMhR9kVMO0RUKgNBEeUWS6IQRa/l/xrEqZlJRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aW6JtiQ2/8Hfpq3R5Kl9ViTTqFaBbWQnRGDqk2G/G2RnJfHu6Pt/0jkrXy1vWhYFF
	 rW2JzUMUG1eq+u0S3BS8urig9CSDZiqXutOKIKblGLko41IDQcwQOwFNODkRGwRix6
	 gxhAuEzBuWlII8bO++3bbYIixr3rqneaI1t4QCzY=
Date: Thu, 7 Aug 2025 23:25:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
	Hans de Goede <hansg@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 27/65] media: Reset file->private_data to NULL in
 v4l2_fh_del()
Message-ID: <20250807202553.GB28610@pendragon.ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
 <e9aaf929-5e0d-4379-996b-a564acd3e331@kernel.org>
 <20250807085003.GE11583@pendragon.ideasonboard.com>
 <20250807170004.GG11583@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250807170004.GG11583@pendragon.ideasonboard.com>

On Thu, Aug 07, 2025 at 08:00:06PM +0300, Laurent Pinchart wrote:
> On Thu, Aug 07, 2025 at 11:50:07AM +0300, Laurent Pinchart wrote:
> > On Wed, Aug 06, 2025 at 02:45:14PM +0200, Hans Verkuil wrote:
> > > On 02/08/2025 11:22, Jacopo Mondi wrote:
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > 
> > > > Multiple drivers that use v4l2_fh and call v4l2_fh_del() manually reset
> > > > the file->private_data pointer to NULL in their video device .release()
> > > > file operation handler. Move the code to the v4l2_fh_del() function to
> > > > avoid direct access to file->private_data in drivers. This requires
> > > > adding a file pointer argument to the function.
> > > > 
> > > > Changes to drivers have been generated with the following coccinelle
> > > > semantic patch:
> > > > 
> > > > @@
> > > > expression fh;
> > > > identifier filp;
> > > > identifier release;
> > > > type ret;
> > > > @@
> > > > ret release(..., struct file *filp, ...)
> > > > {
> > > > 	<...
> > > > -	filp->private_data = NULL;
> > > > 	...
> > > > -	v4l2_fh_del(fh);
> > > > +	v4l2_fh_del(fh, filp);
> > > > 	...>
> > > > }
> > > > 
> > > > @@
> > > > expression fh;
> > > > identifier filp;
> > > > identifier release;
> > > > type ret;
> > > > @@
> > > > ret release(..., struct file *filp, ...)
> > > > {
> > > > 	<...
> > > > -	v4l2_fh_del(fh);
> > > > +	v4l2_fh_del(fh, filp);
> > > > 	...
> > > > -	filp->private_data = NULL;
> > > > 	...>
> > > > }
> > > > 
> > > > @@
> > > > expression fh;
> > > > identifier filp;
> > > > identifier release;
> > > > type ret;
> > > > @@
> > > > ret release(..., struct file *filp, ...)
> > > > {
> > > > 	<...
> > > > -	v4l2_fh_del(fh);
> > > > +	v4l2_fh_del(fh, filp);
> > > > 	...>
> > > > }
> > > > 
> > > > Manual changes have been applied to Documentation/ to update the usage
> > > > patterns, to drivers/media/v4l2-core/v4l2-fh.c to update the
> > > > v4l2_fh_del() prototype and reset file->private_data, and to
> > > > include/media/v4l2-fh.h to update the v4l2_fh_del() function prototype
> > > > and its documentation.
> > > > 
> > > > Additionally, white space issues have been fixed manually in
> > > > drivers/usb/gadget/function/uvc_v4l2.c
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >  Documentation/driver-api/media/v4l2-fh.rst                         | 4 ++--
> > > >  Documentation/translations/zh_CN/video4linux/v4l2-framework.txt    | 4 ++--
> > > >  drivers/media/pci/cx18/cx18-fileops.c                              | 4 ++--
> > > >  drivers/media/pci/ivtv/ivtv-fileops.c                              | 4 ++--
> > > >  drivers/media/pci/saa7164/saa7164-encoder.c                        | 2 +-
> > > >  drivers/media/pci/saa7164/saa7164-vbi.c                            | 2 +-
> > > >  drivers/media/platform/allegro-dvt/allegro-core.c                  | 2 +-
> > > >  drivers/media/platform/amlogic/meson-ge2d/ge2d.c                   | 2 +-
> > > >  drivers/media/platform/amphion/vpu_v4l2.c                          | 4 ++--
> > > >  drivers/media/platform/chips-media/coda/coda-common.c              | 4 ++--
> > > >  drivers/media/platform/chips-media/wave5/wave5-helper.c            | 2 +-
> > > >  drivers/media/platform/imagination/e5010-jpeg-enc.c                | 4 ++--
> > > >  drivers/media/platform/m2m-deinterlace.c                           | 2 +-
> > > >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c               | 4 ++--
> > > >  drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c                  | 4 ++--
> > > >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c                | 4 ++--
> > > >  .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 4 ++--
> > > >  .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c    | 4 ++--
> > > >  drivers/media/platform/nvidia/tegra-vde/v4l2.c                     | 2 +-
> > > >  drivers/media/platform/nxp/dw100/dw100.c                           | 2 +-
> > > >  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                     | 4 ++--
> > > >  drivers/media/platform/nxp/imx-pxp.c                               | 2 +-
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c                 | 2 +-
> > > >  drivers/media/platform/nxp/mx2_emmaprp.c                           | 2 +-
> > > >  drivers/media/platform/qcom/iris/iris_vidc.c                       | 3 +--
> > > >  drivers/media/platform/qcom/venus/core.c                           | 2 +-
> > > >  drivers/media/platform/renesas/rcar_fdp1.c                         | 2 +-
> > > >  drivers/media/platform/renesas/rcar_jpu.c                          | 4 ++--
> > > >  drivers/media/platform/renesas/vsp1/vsp1_video.c                   | 2 +-
> > > >  drivers/media/platform/rockchip/rga/rga.c                          | 2 +-
> > > >  drivers/media/platform/rockchip/rkvdec/rkvdec.c                    | 2 +-
> > > >  drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c                | 4 ++--
> > > >  drivers/media/platform/samsung/exynos4-is/fimc-m2m.c               | 4 ++--
> > > >  drivers/media/platform/samsung/s5p-g2d/g2d.c                       | 2 +-
> > > >  drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c                | 4 ++--
> > > >  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                   | 4 ++--
> > > >  drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                   | 4 ++--
> > > >  drivers/media/platform/st/sti/delta/delta-v4l2.c                   | 4 ++--
> > > >  drivers/media/platform/st/sti/hva/hva-v4l2.c                       | 4 ++--
> > > >  drivers/media/platform/st/stm32/dma2d/dma2d.c                      | 2 +-
> > > >  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                   | 2 +-
> > > >  drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c           | 2 +-
> > > >  drivers/media/platform/ti/omap3isp/ispvideo.c                      | 5 ++---
> > > >  drivers/media/platform/ti/vpe/vpe.c                                | 2 +-
> > > >  drivers/media/platform/verisilicon/hantro_drv.c                    | 4 ++--
> > > >  drivers/media/test-drivers/vicodec/vicodec-core.c                  | 2 +-
> > > >  drivers/media/test-drivers/vim2m.c                                 | 2 +-
> > > >  drivers/media/test-drivers/visl/visl-core.c                        | 2 +-
> > > >  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                           | 3 +--
> > > >  drivers/media/v4l2-core/v4l2-fh.c                                  | 7 ++++---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c                              | 5 ++---
> > > >  drivers/staging/media/imx/imx-media-csc-scaler.c                   | 4 ++--
> > > >  drivers/staging/media/meson/vdec/vdec.c                            | 2 +-
> > > >  drivers/staging/media/sunxi/cedrus/cedrus.c                        | 2 +-
> > > >  drivers/staging/most/video/video.c                                 | 4 ++--
> > > >  drivers/usb/gadget/function/uvc_v4l2.c                             | 3 +--
> > > >  include/media/v4l2-fh.h                                            | 5 ++++-
> > > >  57 files changed, 89 insertions(+), 90 deletions(-)
> > > > 
> > > 
> > > <snip>
> > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> > > > index b59b1084d8cdf1b62da12879e21dbe56c2109648..df3ba9d4674bd25626cfcddc2d0cb28c233e3cc3 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-fh.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-fh.c
> > > > @@ -67,7 +67,7 @@ int v4l2_fh_open(struct file *filp)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_fh_open);
> > > >  
> > > > -void v4l2_fh_del(struct v4l2_fh *fh)
> > > > +void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp)
> > > 
> > > Instead of adding a second argument, perhaps it is better to
> > > just provide the filp pointer. After all, you can get the v4l2_fh
> > > from filp->private_data.
> > > 
> > > It simplifies the code a bit.
> > 
> > That's an interesting idea. I'll give it a try.
> 
> We end up with code like (e.g. in v4l2_fh_release(), with similar
> constructs in lots of drivers)
> 
> 	if (fh) {
> 		v4l2_fh_del(filp);
> 		v4l2_fh_exit(fh);
> 		kfree(fh);
> 	}
> 
> compared to
> 
> 	if (fh) {
> 		v4l2_fh_del(fh, filp);
> 		v4l2_fh_exit(fh);
> 		kfree(fh);
> 	}
> 
> with the existing patch. I find the fact that v4l2_fh_del() takes a
> different pointer than v4l2_fh_exit() a bit disturbing. If you think
> it's better I'll drop the fh argument in v2.

I gave it a try, and looking at the function prototype, its
documentation, the imbalance with v4l2_fh_add(), and the code in the
callers, I think keeping both arguments would look cleaner. Please tell
me if you feel strongly about this, I can still submit a patch to drop
the argument. It can very easily be scripted with coccinelle and doesn't
conflict with the rest of the series, so it could also be done later.

> > > >  {
> > > >  	unsigned long flags;
> > > >  
> > > > @@ -75,6 +75,8 @@ void v4l2_fh_del(struct v4l2_fh *fh)
> > > >  	list_del_init(&fh->list);
> > > >  	spin_unlock_irqrestore(&fh->vdev->fh_lock, flags);
> > > >  	v4l2_prio_close(fh->vdev->prio, fh->prio);
> > > > +
> > > > +	filp->private_data = NULL;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_fh_del);
> > > >  
> > > > @@ -94,10 +96,9 @@ int v4l2_fh_release(struct file *filp)
> > > >  	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
> > > >  
> > > >  	if (fh) {
> > > > -		v4l2_fh_del(fh);
> > > > +		v4l2_fh_del(fh, filp);
> > > >  		v4l2_fh_exit(fh);
> > > >  		kfree(fh);
> > > > -		filp->private_data = NULL;
> > > >  	}
> > > >  	return 0;
> > > >  }
> > > 
> > > <snip>
> > > 
> > > > diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> > > > index d8fcf49f10e09452b73499f4a9bd1285bc2835a5..5e4c761635120608e0b588e0b0daf63e69588d38 100644
> > > > --- a/include/media/v4l2-fh.h
> > > > +++ b/include/media/v4l2-fh.h
> > > > @@ -114,12 +114,15 @@ int v4l2_fh_open(struct file *filp);
> > > >   * v4l2_fh_del - Remove file handle from the list of file handles.
> > > >   *
> > > >   * @fh: pointer to &struct v4l2_fh
> > > > + * @filp: pointer to &struct file associated with @fh
> > > > + *
> > > > + * The function resets filp->private_data to NULL.
> > > >   *
> > > >   * .. note::
> > > >   *    Must be called in v4l2_file_operations->release\(\) handler if the driver
> > > >   *    uses &struct v4l2_fh.
> > > >   */
> > > > -void v4l2_fh_del(struct v4l2_fh *fh);
> > > > +void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp);
> > > >  
> > > >  /**
> > > >   * v4l2_fh_exit - Release resources related to a file handle.

-- 
Regards,

Laurent Pinchart

