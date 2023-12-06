Return-Path: <linux-media+bounces-1776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69067807B5E
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 23:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1620E282348
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441876ABAD;
	Wed,  6 Dec 2023 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H0sw/cWM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61ACBD59
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 14:36:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871E9556;
	Wed,  6 Dec 2023 23:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701902148;
	bh=gYjzyVxIoQATrShVZeAAv2CPas5m9EdbtIMdRBgw1cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0sw/cWMfIcg38tVBmswoaVCrsilBadsETT6THqaV7+bkJde98YANDhLt1Emxnlg6
	 IG713lsGlCC7UFwboS9enM3LD04YcaLTXaACOnzLIWtLS7pZ2vAoxM9P1AvbgmN8Eo
	 a9ZM9Y5ygBeRG9CxSb+zB0XOtm9g1SvxIVtvqNAQ=
Date: Thu, 7 Dec 2023 00:36:36 +0200
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
Message-ID: <20231206223636.GE29417@pendragon.ideasonboard.com>
References: <20231206094401.491100-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206094401.491100-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

On Wed, Dec 06, 2023 at 10:44:01AM +0100, Alexander Stein wrote:
> The extended address registers are missing in the debug output register
> list. Add them.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> index 6709ab7ea1f3..3ac5685d6cc1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> @@ -66,6 +66,13 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
>  		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_V),
>  		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
>  		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
> +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),

Those registers only exist in the i.MX8MP. The i.MX8MN referenece manual
lists them as reserved and indicates they read as 0's, so it should be
safe.  The i.MX93 reference manual, however, doesn't list those
registers at all, so accessing them may lead to issues.

How what platform(s) have you tested this patch ?

>  	};
>  
>  	struct mxc_isi_pipe *pipe = m->private;

-- 
Regards,

Laurent Pinchart

