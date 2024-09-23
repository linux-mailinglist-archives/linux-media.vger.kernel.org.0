Return-Path: <linux-media+bounces-18477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F398393E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 23:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084E11C218A9
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 21:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39F285270;
	Mon, 23 Sep 2024 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LTOpdXX0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27584A57;
	Mon, 23 Sep 2024 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727128402; cv=none; b=cmzwh2DlDaiqbBOUdV45R1kWZ6EnxEsbWvTAnkntJ6pHDH7zGaefl46bshQamE02Gq02/+IZv/qjCQb287yUKSmkg4Y+5aNqkj/79K8AHHqsuFKgD78g8zPTnsnR0zgISkU7MHMxRRH8fGJlf0zSJIt8i5bZlx64a1jW/o/yzr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727128402; c=relaxed/simple;
	bh=l6nQer+dHHOoiWwOm0N4uS1KXPwEKLLJvrwz6uZ6pdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY2wyufDIg1mrgv6hfaJ1R1DWObYgaSdsG+QObdlAoZeXyZ9y5mT0rGi40qnv28vMCG1XsMwwi/cQF12NrydWavIlEmd8ggvBnG291d2pC01uxOjRJ8wlK6xhCelfXe8bzVgi5q/bnIEm5hBtxOICVJbactdGFMmsdvWwAdlNlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LTOpdXX0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B7269CA;
	Mon, 23 Sep 2024 23:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727128312;
	bh=l6nQer+dHHOoiWwOm0N4uS1KXPwEKLLJvrwz6uZ6pdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTOpdXX0DuwCDVwzNrWWiOP9ZHz7uM4PXPN8ELQNLudrP/KkV67V7iNi4ukD7uy4l
	 K6/MVehaICmzySIL4Oxlewsf0Ai6pmgg3b85IniaM3mMPNDliGVdThUryrMvYFsx4G
	 zd0+KMcBM2jbGTzp9fxK7snZPL9ybg3y/qafKQS4=
Date: Tue, 24 Sep 2024 00:52:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: add m2m usage_count check in
 streamoff
Message-ID: <20240923215246.GG8227@pendragon.ideasonboard.com>
References: <20240920142715.2246323-1-laurentiu.palcu@oss.nxp.com>
 <h74uhtfdqzhq4qgcfqonwrlvoddaspi73h2m7u6bg6akjq3ugm@vxjt5ttzfkkx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <h74uhtfdqzhq4qgcfqonwrlvoddaspi73h2m7u6bg6akjq3ugm@vxjt5ttzfkkx>

On Mon, Sep 23, 2024 at 07:50:18PM +0200, Jacopo Mondi wrote:
> On Fri, Sep 20, 2024 at 05:27:15PM GMT, Laurentiu Palcu wrote:
> > Currently, if streamon/streamoff calls are imbalanced we can end up
> > with a negative ISI m2m usage_count. When that happens, the next
> > streamon call will not enable the ISI m2m channel.
> >
> > So, instead of throwing a warning in streamoff when usage_count drops
> > below 0, just make sure we don't get there.
> 
> Isn't the whole purpose of the WARN() to highlight something's wrong
> with userspace ? I think it's expected to have the same number of
> streamon and streamoff calls, do you have any idea why it might not be
> happening ?

WARN() is much too strong to report userspace problems.

> > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > index 9745d6219a166..b71195a3ba256 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > @@ -575,6 +575,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >
> >  	mutex_lock(&m2m->lock);
> >
> > +	if (m2m->usage_count == 0)
> > +		goto unlock;

This isn't right. Userspace can still call VIDIOC_STREAMOFF while not
streaming, which will decrement the usage count when it shouldn't. The
right fix is to return from mxc_isi_m2m_streamoff() without decrementing
the usage count if the particular context the function is called for is
not streaming. You will possibly need to also modify
mxc_isi_m2m_streamon() to make sure the two functions won't race each
other.

Could you work on an improved patch ? Please let me know if you need
help, it's important to fix this issue.

> > +
> >  	/*
> >  	 * If the last context is this one, reset it to make sure the device
> >  	 * will be reconfigured when streaming is restarted.
> > @@ -594,8 +597,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >  		mxc_isi_channel_release(m2m->pipe);
> >  	}
> >
> > -	WARN_ON(m2m->usage_count < 0);
> > -
> > +unlock:
> >  	mutex_unlock(&m2m->lock);
> >
> >  	return 0;

-- 
Regards,

Laurent Pinchart

