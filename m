Return-Path: <linux-media+bounces-834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBB7F49B4
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B2FA1C20C3E
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA4F4E1DF;
	Wed, 22 Nov 2023 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CShra8iy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B80A3;
	Wed, 22 Nov 2023 07:05:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3F8B29A;
	Wed, 22 Nov 2023 16:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700665494;
	bh=8pF7Wg5LEFskYqmGH2k4O2UFRmY8lfO9msZUpnevj7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CShra8iyVGhL/seg8ngLF0omh8ppTpS6fheUMXaFeIPh35gDLO3lI9zoQ8az5KjUU
	 n55jw8XjIERadtTj31vPB8hIJ9+RAL35BjYl3dBxBaTyuFGxEagyXxj/L7+DJxGGjz
	 N+cTzMP2JWtSaeGmmbIZ5uTqRfSvxkLLTeJufE+M=
Date: Wed, 22 Nov 2023 17:05:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: imx-mipi-csis: csis clock fixes
Message-ID: <20231122150532.GG8627@pendragon.ideasonboard.com>
References: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
 <CAOMZO5AW0qft5ciGAWuX=RC0zHwAWEpLCyB5TbeE0QH3Nb+nQQ@mail.gmail.com>
 <61de2617-fdc2-4f0c-8ffc-5dfc99b825e7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61de2617-fdc2-4f0c-8ffc-5dfc99b825e7@ideasonboard.com>

On Wed, Nov 22, 2023 at 03:44:33PM +0200, Tomi Valkeinen wrote:
> On 22/11/2023 15:21, Fabio Estevam wrote:
> > On Wed, Nov 22, 2023 at 10:14 AM Tomi Valkeinen wrote:
> >>
> >> Two fixes to the csis driver: One to fix remove() another to only enable
> >> the clocks when needed.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >> Tomi Valkeinen (2):
> >>        media: imx-mipi-csis: Fix clock handling in remove()
> >>        media: imx-mipi-csis: Drop extra clock enable at probe()
> > 
> > Shouldn't both patches contain a Fixes tag?
> 
> I think the issue is there in the original commit adding the driver:
> 
> 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for 
> i.MX7")
> 
> However, the driver has changed along the way, and I'm not sure if the 
> original one had an actual bug. Nevertheless, the same pattern (wrt. 
> clocks and runtime) is there in the original one, and I think that 
> pattern is not correct even if it wouldn't have caused any visible issue.
> 
> So I'll add that commit as Fixes-tag, but if someone with more knowledge 
> about the driver can verify this, that'd be great.

Sounds fine to me. I assume you'll send a v2.

-- 
Regards,

Laurent Pinchart

