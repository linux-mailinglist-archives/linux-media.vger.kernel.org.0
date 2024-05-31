Return-Path: <linux-media+bounces-12346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3C8D648E
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 16:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1875B248A2
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 14:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B1B44374;
	Fri, 31 May 2024 14:31:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577939FF3
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165861; cv=none; b=knJbXne4uolOhfl8f0flDBNNKExnF6+Qs0y+2N7KGmYigD1voInh9RlcZjkRoWVyTxy+y/WBL8lEEuYueHC7mNwSW6EO45dtTBujmVGIH7+eOpEoJIT/tOhLvb5K9iKr6FTRpVp6xqpZ4gdKzkXoOUSmCZ22Tm4sgWroNagr948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165861; c=relaxed/simple;
	bh=gofu5FPGMsYng1KRG5vVEprzMkm5VxOFN7xxMsY7neY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZCzvOLHbDSdcAB7F+df07huu70V10neIEJHeNG5TIxpguJ4hSAPsQfvRQ6HPqMjlY1r7kYwvUMAjuDjzNJR+6iK70F5qvSgGCJug4SYOEKam6disdg/mz7IRl8UlMMhPFykmDC2FAyoTrtgVUB5jJIQVhWtQ3xIsJUlAcA/TK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sD3HO-0004xZ-N7; Fri, 31 May 2024 16:30:50 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sD3HK-003jxx-DT; Fri, 31 May 2024 16:30:46 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sD3HK-001xjl-13;
	Fri, 31 May 2024 16:30:46 +0200
Date: Fri, 31 May 2024 16:30:46 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] media: rockchip: rga: fix field in OUTPUT buffers
Message-ID: <ZlnfFu-l0ivMUuf8@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20240528-rk3568-rga-v1-0-b946e55d9d37@pengutronix.de>
 <20240528-rk3568-rga-v1-1-b946e55d9d37@pengutronix.de>
 <22c65578-c3bf-44cc-a9c2-6e1e29260d3e@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22c65578-c3bf-44cc-a9c2-6e1e29260d3e@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Thu, 30 May 2024 14:47:48 +0200, Hans Verkuil wrote:
> On 28/05/2024 16:05, Michael Tretter wrote:
> > Returned buffers shouldn't contain V4L2_FIELD_ANY as field. Set the
> > field to V4L2_FIELD_NONE, if it isn't set.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/media/platform/rockchip/rga/rga-buf.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> > index 662c81b6d0b5..77c7535893e3 100644
> > --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> > +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> > @@ -119,6 +119,16 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> >  	if (IS_ERR(f))
> >  		return PTR_ERR(f);
> >  
> > +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> > +		if (vbuf->field == V4L2_FIELD_ANY)
> > +			vbuf->field = V4L2_FIELD_NONE;
> > +		if (vbuf->field != V4L2_FIELD_NONE) {
> > +			v4l2_err(&ctx->rga->v4l2_dev, "Unsupported field %s\n",
> > +				 v4l2_field_names[vbuf->field]);
> 
> This should be v4l2_dbg: incorrect userspace data should not result in
> spamming of the kernel log. It's fine to report it if debugging is enabled.

I cannot use v4l2_dbg here, as the debug module parameter for the RGA
driver is defined in a different file. I'll just drop the error message
in v2.

Michael

> 
> Regards,
> 
> 	Hans
> 
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> >  	for (i = 0; i < vb->num_planes; i++) {
> >  		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
> >  
> > 
> 
> 

