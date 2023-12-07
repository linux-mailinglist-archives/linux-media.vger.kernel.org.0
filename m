Return-Path: <linux-media+bounces-1805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63131808542
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C487BB21EB0
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72981358AC;
	Thu,  7 Dec 2023 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sd6Q7JWV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C079410D
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 02:13:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32FCD669;
	Thu,  7 Dec 2023 11:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701943993;
	bh=Q4Xaye2wzVLAE7TkTPOKqO6+4DoaA7q/+roFqfFlw3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sd6Q7JWVYa7ZTysivLCvZzCAZ4DtdNMCT6k9Yaxfy83cgZWR8vNHbe0IkquhlUvAh
	 0TfKeXoIBgm/yuvGL5h9G5qCNsNvQW7+h90LRf2Ty7A363yr6s6UaT62mvSR65lzBw
	 lmDUzEOkgJlE3ESx4iV285LMrLif9wKpf/k6vBfo=
Date: Thu, 7 Dec 2023 12:14:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] media: nxp: imx8-isi-debug: Add missing registers to
 debugfs output
Message-ID: <20231207101400.GB3681@pendragon.ideasonboard.com>
References: <20231206094401.491100-1-alexander.stein@ew.tq-group.com>
 <20231206223636.GE29417@pendragon.ideasonboard.com>
 <2915417.e9J7NaK4W3@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2915417.e9J7NaK4W3@steina-w>

Hi Alexander,

On Thu, Dec 07, 2023 at 08:52:46AM +0100, Alexander Stein wrote:
> Am Mittwoch, 6. Dezember 2023, 23:36:36 CET schrieb Laurent Pinchart:
> > On Wed, Dec 06, 2023 at 10:44:01AM +0100, Alexander Stein wrote:
> > > The extended address registers are missing in the debug output register
> > > list. Add them.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > 
> > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c index
> > > 6709ab7ea1f3..3ac5685d6cc1 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > @@ -66,6 +66,13 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
> > >  		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_V),
> > >  		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
> > >  		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
> > > 
> > > +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
> > > +		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
> > > +		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
> > > +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
> > > +		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
> > > +		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
> > > +		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),
> > 
> > Those registers only exist in the i.MX8MP. The i.MX8MN referenece manual
> > lists them as reserved and indicates they read as 0's, so it should be
> > safe.  The i.MX93 reference manual, however, doesn't list those
> > registers at all, so accessing them may lead to issues.
> > 
> > How what platform(s) have you tested this patch ?
> 
> Ah, you are right. That's something I didn't take into account. Up until now I 
> only tested this on i.MX8MP. I hope I can test this on i.MX8MN and i.MX93 
> soon.
> Otherwise dumping these registers can depend on pdata->has_36bit_dma just to 
> be safe.

That sounds like a good solution to me. Will you do so in a v2 ?

> > >  	};
> > >  	
> > >  	struct mxc_isi_pipe *pipe = m->private;

-- 
Regards,

Laurent Pinchart

