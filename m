Return-Path: <linux-media+bounces-40431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD97B2DEE0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0992B7B13E6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18BD275AF2;
	Wed, 20 Aug 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v8PeiQWJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DF26E179;
	Wed, 20 Aug 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755699307; cv=none; b=JdrfhAYdGs6hOq+YGd7WG9tHrRH0baEEJwd5AnWieDpUylYV98iymo67A5kjgSyGb3/Fr7n8gs2N5Sft0sNoDhI9G3kH6cMyQSeMmvE2p2CCQNaO1ick6+LbgJINeJ1MaZyrrOzABlwmXXR9js2AmA81FmYnKTzaKMvxmMKRt90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755699307; c=relaxed/simple;
	bh=g/rGbdSPbqrHGAoJ1YXWtvncYfbQMQU0610yMszQsao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dh9vJgNjKtQuBys3/ocHNQhK4vNCFjkj8zYn4dBpIkXyDsw61S5nBtj220OQns9uK6rcszeSl61Acz7IMH4/TxyqgUfyS6O9maYwoJhDliRKpaN87WQTSfCNrT4NEH6Bu9boexVfXJotd0Y0PH1Ev4WQalEuIhaJYfc+EXETlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v8PeiQWJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ED109606;
	Wed, 20 Aug 2025 16:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755699244;
	bh=g/rGbdSPbqrHGAoJ1YXWtvncYfbQMQU0610yMszQsao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v8PeiQWJ5magojmvPcL8N9BMO1Nw4Od86lgD6VmPaPtyQrmtJTBVG0t+Ne+qTg52g
	 5FjWp8TZqeu3Bz6oVKlAE9v5ajtYX6LeKfsTSMpxzQVMsuiIgdesWAKEFe6MfFbMT1
	 0HEvzrk9Z1DepufHLl2XdR1mOKefL+vxnI+4dLPs=
Date: Wed, 20 Aug 2025 17:14:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
Message-ID: <20250820141439.GA10547@pendragon.ideasonboard.com>
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
 <20250820140154.GB6190@pendragon.ideasonboard.com>
 <a9283349-c58d-47e6-ac33-77b5a6b893fe@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9283349-c58d-47e6-ac33-77b5a6b893fe@gocontroll.com>

On Wed, Aug 20, 2025 at 04:07:55PM +0200, Maud Spierings wrote:
> On 8/20/25 16:01, Laurent Pinchart wrote:
> > On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay wrote:
> >> From: Maud Spierings <maudspierings@gocontroll.com>
> >>
> >> media_pad_remote_pad_first() can return NULL if no valid link is found.
> >> Check for this possibility before dereferencing it in the next line.
> >>
> >> Reported/investigated in [1]:
> >>
> >> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/ [1]
> >> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >> ---
> >> I'm not sure if this should be a dev_dbg(), just following the pattern
> >> around it for now, also not sure if EPIPE is the correct error.
> > 
> > I've submitted
> > https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
> > which should fix this issue in a more generic way.
> 
> Saw it, but I think my patch technically is still correct as the 
> function documentation states it can potentially return NULL right? [1]

The function documentation states

"returns a pointer to the pad at the remote end of the first found
enabled link, or NULL if no enabled link has been found."

The MUST_CONNECT flag ensures that there is an enabled link, so the
function can't return NULL.

> Link: 
> https://www.kernel.org/doc/html/latest/driver-api/media/mc-core.html [1]
> 
> I will test you patches tomorrow.
> 
> >> ---
> >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04a8752747f556bd1fc5a9 100644
> >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
> >>   	}
> >>   
> >>   	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> >> +
> >> +	if (pad == NULL) {
> >> +		dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n",
> >> +			sink_pad);
> >> +		return ERR_PTR(-EPIPE);
> >> +	}
> >> +
> >>   	sd = media_entity_to_v4l2_subdev(pad->entity);
> >>   	if (!sd) {
> >>   		dev_dbg(xbar->isi->dev,
> >>
> >> ---
> >> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> >> change-id: 20250818-imx8_isi-954898628bb6

-- 
Regards,

Laurent Pinchart

