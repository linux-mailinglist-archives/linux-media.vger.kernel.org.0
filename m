Return-Path: <linux-media+bounces-41439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A977DB3E611
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A52F3B47B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D24321F26;
	Mon,  1 Sep 2025 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DVh8OLaF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CBA226D17
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734691; cv=none; b=QgIgj03H61aKMgq3QRWwX2H2aFW/kfsejnBBfGX/F6U3WSDZDnL12MU7RJHQSYeAq3+0o6VYJCGbAGDAGLihb9rTq/r13EgHfQp1MBIVrHkpjcgj5HlxooEj/qjS0cJ23u9Q7qVyRp1i0hSVYZ5D7Trdd0ewgikojJFbbQWTX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734691; c=relaxed/simple;
	bh=U4coVzuESZGA2p1Q1KFFJpN97yMbTOLPLso7xQho1yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjsjdGL7gNpnBEwl60GATQ04uDA8byS6PnZ/gGWPc5wNfUU7c8dK9nV2ftdXG1F+dHy3ZO3cFdZEc/STV4euLEHgyUwtcp4vnFJdRqOuI3vBQGKDUoaKjL8Uvt5AkT/DjmtNY3Ub8yb8FxZSxzD99sfxWMwAs59qPkNplHQ8u9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DVh8OLaF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2C98DF3;
	Mon,  1 Sep 2025 15:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756734619;
	bh=U4coVzuESZGA2p1Q1KFFJpN97yMbTOLPLso7xQho1yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVh8OLaFRhHiGfFmR0ohr5hQ8llL4BWuCYqVytzYzdo/7y3OnWUC710TEQY2iOTMq
	 3hpPjXiDxPFcnzisreQrnbvPnaO2uqzdSKJHDKxR+aPnNVAxrKXMiAiYHb6YLHmsPM
	 mmigWXRYw+ywrj+/J0Hkdq5aUAhcupE3Msm1hvEE=
Date: Mon, 1 Sep 2025 15:51:21 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 16/66] media: Documentation: Reference color pattern
 control in format docs
Message-ID: <6ebtnjvazvjinprgp5ejdj5otknubr2lkdth7w72kybygwlowi@ejbr4ot7stum>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-17-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:17PM +0300, Sakari Ailus wrote:
> Refer to the color pattern control in the generic raw pixelformat
> documentation.

Either move this after patch #19 that introduces the control, or
squash it with #15 that introduce the generic RAW pixel format

Either ways
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> index 9fda7a36cd3a..034d4f3e0499 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> @@ -13,7 +13,10 @@ Description
>
>  These generic raw image data formats define the memory layout of the data
>  without defining the order of the pixels in the format or even the CFA (Colour
> -Filter Array) itself. See also :ref:`source routes <subdev-routing>`.
> +Filter Array) itself. These formats may only be used with a Media Controller
> +pipeline where the more specific format is reported by the
> +:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control on
> +the source sub-device. See also :ref:`source routes <subdev-routing>`.
>
>  .. _v4l2-pix-fmt-raw-8:
>
> --
> 2.47.2
>
>

