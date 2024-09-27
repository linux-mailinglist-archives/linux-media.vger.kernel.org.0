Return-Path: <linux-media+bounces-18726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB6A988CFE
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D69C81C21183
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4BC2FE33;
	Fri, 27 Sep 2024 23:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="On4irp6f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A91FB3
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 23:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727479551; cv=none; b=rmkKtpdQBT+n9DoQdiu7e0qYbQ1KlZIJj9sfnTdqRPbZyFzTooXxjedCZc6h+dBA4NW/TWy3sd/uVlWKjWouSLqo7Cw9ek5H3fWAHv4De84BnGBH2jj/4tuH6nn5kIIrpCrYHxdvcRXZJxNBck8fFLj06zRyGwMVlT8JzPwBGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727479551; c=relaxed/simple;
	bh=+FAztrMKMiDubUba6ATA3SK6nFW/8j5vCi0IQ1MGVwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOXo5qKtKKgFsI1szObMKTF0m5AOy06Y4tvk3RhJjW6I1O2UrpFKWK0cU2luStjSsOwyb65DBrz+qos2jrUe17nlP4albdqtX0JgdvlQJJmFW+QKQfYTFAQOsT/07pJlum7nUgZRMx3dL6mzx8A0xyTcmrWS/LJK1+ngzUNKtxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=On4irp6f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D88A6DE;
	Sat, 28 Sep 2024 01:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727479459;
	bh=+FAztrMKMiDubUba6ATA3SK6nFW/8j5vCi0IQ1MGVwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=On4irp6f7me1bJHCocKra0ZE6b4N7swQIlckAuN5+q+RrBlpUKElaEMGILDIGF2WS
	 yUkUlrMT3FqV47bOddt/vXa7/4bwppSmp0QP1+uyA/iAE5gX/Am1wgyEewWYHxoH3o
	 fq62xZwVVgyCOspPdH5YJxMzwV6JLSwAqBnc73AU=
Date: Sat, 28 Sep 2024 02:25:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Message-ID: <20240927232545.GQ12322@pendragon.ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-5-dan.scally@ideasonboard.com>
 <k6nxxivka2abylkncwrvukra5xr3wambnroop5wxe6dyg3gkci@au6kxu6oigkp>
 <20240924145101.GG20255@pendragon.ideasonboard.com>
 <OSZPR01MB70192337E9D58B6CE95049D2AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSZPR01MB70192337E9D58B6CE95049D2AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>

On Fri, Sep 27, 2024 at 12:56:21PM +0000, Prabhakar Mahadev Lad wrote:
> Hi,
> 
> > On Tue, Sep 24, 2024 at 04:21:03PM +0200, Jacopo Mondi wrote:
> > > Hi Dan
> > >
> > > On Fri, Sep 20, 2024 at 01:41:15PM GMT, Daniel Scally wrote:
> > > > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > > >
> > > > Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
> > > > data and output it into the CRU's 64-bit packed pixel format.
> > > >
> > > > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > >
> > > Maybe I'm missing something for some previous series, but I see
> > > rzg2l_cru_csi2_setup() programming ICnMC with the UserDefined data
> > > type ?
> > 
> > The function should use rzg2l_cru_ip_format.datatype << 16 (with an
> > appropriate register macro). I think I've commented on that in a previous
> > CRU patch series from Prabhakar, but I don't recall if the comment has
> > been addressed yet.
> > 
> The comments has been addressed in patch [0](the series needs to be reviewed).
> 
> [0] https://lore.kernel.org/all/20240910175357.229075-9-prabhakar.mahadev-lad.rj@bp.renesas.com/

Done :-)

A v3 is needed, I think it will be the final version.

-- 
Regards,

Laurent Pinchart

