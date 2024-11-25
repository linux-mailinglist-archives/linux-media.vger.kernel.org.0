Return-Path: <linux-media+bounces-22034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 535AF9D8B67
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 18:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9C0F1669D9
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 17:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F05B1B85EC;
	Mon, 25 Nov 2024 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lpXsQtce"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46114D43D;
	Mon, 25 Nov 2024 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732556186; cv=none; b=rksB12gOiEeoyjm+pj6xbnvVzKKupzhnOD9EkLK8RyyZ/Q/iBOJqQR1cWA8DwsYpoK+HQ3K6oZ/S8KfJ49s2ra3i2qZRIF3igfr2KyjiuSogbA7Kz8xIvLW+ea3e+9NMQaBmdJX9MDobYuIHjT+bx5HCgeUfLTDqSPmgF3lRxNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732556186; c=relaxed/simple;
	bh=AvqfISnEDH0te3fGy14dfdBmQ7eZEZWEwQrKZrCufAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvF7VinaBdWiyEfuomWbMXdiVOZlmz/ARqDaPLneTPZqbM4MVrvIJEqtPFTRoiSqB36y+qd6O/fYvjR/SkDXDzijsmvQaTpmsZESTZsQ201W3NlfQmcaFSS/xONjcvEBU83srfrGsVqCXQNEwLwieW8NnICi9XcgTaPrwIGM93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lpXsQtce; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 361FA229;
	Mon, 25 Nov 2024 18:35:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732556159;
	bh=AvqfISnEDH0te3fGy14dfdBmQ7eZEZWEwQrKZrCufAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpXsQtcehsBKeIPR/t0GFL1Spk29mYTN2DpzDrvfrsaTG0tpx+FkcV46i1pex5m4C
	 n4vQIzzZo8rm67ISwhxBdD39v6oDN9F7inxwBcKLfS/9X68wZMsgYMdVUDuf2otj6y
	 h9kYCCM/Y+bznP0f2uQK9DAV0tsUu7c0e0NTNhKo=
Date: Mon, 25 Nov 2024 19:36:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241125173611.GS19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <d17dfb29f60bfa1889aa554ef16c9ddec272520d.camel@mediatek.com>
 <CAEHHSvbScBhn=6rSOApQ=K9JEpwL6JPpJnJy929mLXHhxQ=3FQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvbScBhn=6rSOApQ=K9JEpwL6JPpJnJy929mLXHhxQ=3FQ@mail.gmail.com>

On Mon, Nov 25, 2024 at 03:40:18PM +0100, Julien Stephan wrote:
> Le lun. 25 nov. 2024 à 09:14, CK Hu (胡俊光) <ck.hu@mediatek.com> a écrit :
> > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > >
> > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > >
> > > This driver provides a path to bypass the SoC ISP so that image data
> > > coming from the SENINF can go directly into memory without any image
> > > processing. This allows the use of an external ISP.
> > >
> > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > [Paul Elder fix irq locking]
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> >
> > [snip]
> >
> > > +static void mtk_camsv30_update_buffers_add(struct mtk_cam_dev *cam_dev,
> > > +                                          struct mtk_cam_dev_buffer *buf)
> > > +{
> > > +       mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_BASE_ADDR, buf->daddr);
> > > +}
> > > +
> >
> > [snip]
> >
> > > +static void mtk_camsv30_fbc_inc(struct mtk_cam_dev *cam_dev)
> > > +{
> > > +       unsigned int fbc_val;
> > > +
> > > +       if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
> >
> > I think this pm_runtime_resume_and_get() is not necessary.
> > mtk_camsv30_fbc_inc() is called only in mtk_cam_vb2_buf_queue().
> > But when buf_list is empty, mtk_camsv30_update_buffers_add() is called before this function.
> > But mtk_camsv30_update_buffers_add() does not call pm_runtime_resume_and_get() and it works normally.
> > So this function is not necessary to call pm_runtime_resume_and_get().
> 
> Hi CK,
> 
> This one is actually needed because .buf_queue can be called before
> .start_streaming in case a user requests to prepare buffers before
> streaming.
> But you are right, if a user requests to alloc buffer before streaming
> mtk_camsv_update_buffers_address will be called without pm. Streaming
> still works because in start streaming we call
> mtk_camsv_update_buffers_address again.
> So maybe I should put the pm stuff in mtk_cam_vb2_buf_queue ?

mtk_cam_vb2_buf_queue() should only touch the hardware if streaming has
been started, otherwise it shhould just put the buffers in a queue and
return immediately, and the initial hardware setup should be done when
starting streaming. There should be no need to handle runtime PM in this
function or in mtk_cam_vb2_buf_queue().

> > In other register setting function, please also check this pm function is necessary or not.
> >
> > Regards,
> > CK
> >
> > > +               dev_err(cam_dev->dev, "failed to get pm_runtime\n");
> > > +               return;
> > > +       }
> > > +
> > > +       fbc_val = mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
> > > +       fbc_val |= CAMSV_IMGO_FBC_RCNT_INC;
> > > +       mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
> > > +       fbc_val &= ~CAMSV_IMGO_FBC_RCNT_INC;
> > > +       mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
> > > +
> > > +       pm_runtime_put_autosuspend(cam_dev->dev);
> > > +}
> > > +

-- 
Regards,

Laurent Pinchart

