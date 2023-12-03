Return-Path: <linux-media+bounces-1511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 325748025D2
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 18:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04681F21153
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A366168BB;
	Sun,  3 Dec 2023 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="peBf9gcZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34447EA
	for <linux-media@vger.kernel.org>; Sun,  3 Dec 2023 09:00:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D23925A;
	Sun,  3 Dec 2023 18:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701622812;
	bh=2Z8acD9GFYrbpV6WtV+f+A0TzAf9TSffQgmJzV0d1kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peBf9gcZ2c2D0D5Di9xqcm33VbbFkPYWXOt409frX0gHW5eVGtew5IVsYgl8MJLeH
	 tkQym8oroFF2D3uvky9rnsz0JSNZTNrg37HlM+z/2mN22Ua3Eh1VgQWMOwTs6+/WZ4
	 /++5INXWTKy9NPPbdhE681vJl1lx181pYL5tgQzI=
Date: Sun, 3 Dec 2023 19:00:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before
 access
Message-ID: <20231203170057.GB22111@pendragon.ideasonboard.com>
References: <20231201150614.63300-1-marex@denx.de>
 <CAOMZO5BssVez71=uCYd0XhL02xd1TrUyTzCc1fq_sWfENLaoTA@mail.gmail.com>
 <890ae113-7c7f-4214-9b00-ce00fc570567@denx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <890ae113-7c7f-4214-9b00-ce00fc570567@denx.de>

On Sat, Dec 02, 2023 at 07:44:47AM +0100, Marek Vasut wrote:
> On 12/2/23 03:27, Fabio Estevam wrote:
> > On Fri, Dec 1, 2023 at 12:06 PM Marek Vasut <marex@denx.de> wrote:
> > 
> >>          pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> >> -       sd = media_entity_to_v4l2_subdev(pad->entity);
> >> +       if (!pad) {
> >> +               dev_dbg(xbar->isi->dev,
> > 
> > Maybe dev_err() here instead?
> 
> That dev_dbg() is aligned with the prints in the rest of the function 
> and it's not like kernel should do dev_err() into kernel log every time 
> userspace does something wrong.

We usually use dev_dbg() for errors that can be easily triggered from
userspace, to avoid giving unpriviledged processes an easy way to flood
the kernel log.

> > Anyway:
> > 
> > Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Thanks !

-- 
Regards,

Laurent Pinchart

