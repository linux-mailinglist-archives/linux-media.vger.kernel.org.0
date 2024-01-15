Return-Path: <linux-media+bounces-3695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5E82D7EA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196642824D9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940751E86B;
	Mon, 15 Jan 2024 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k0DLfeYK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652B1DDC1
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE636326;
	Mon, 15 Jan 2024 11:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705316268;
	bh=LSj4kaM6LSiwQrgDkgeLSAtASmAhdGk8MgrIFB2UgUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0DLfeYKGwTvWpKO/8plHaM31JoUR07BJpfSUZqyASzUBZzU1/ecR6iwXK2LLA21S
	 kxGaxvIkaegKxhQBC58gT5n0aCn6MzKk3tMEyhWTxFY1vSxlD2ZjWTWq8tS7w+RdR1
	 Pzwi1DY3qMYSl9MPF61Urnt78D1rgSoDHDEgUyQM=
Date: Mon, 15 Jan 2024 12:59:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH 6/7] media: mc: Expand MUST_CONNECT flag to always
 require an enabled link
Message-ID: <20240115105900.GD5869@pendragon.ideasonboard.com>
References: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
 <20240115103029.28055-7-laurent.pinchart@ideasonboard.com>
 <ZaUO0ygEoZ8EVMEB@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZaUO0ygEoZ8EVMEB@valkosipuli.retiisi.eu>

On Mon, Jan 15, 2024 at 10:54:11AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> A small addtional comment...
> 
> On Mon, Jan 15, 2024 at 12:30:28PM +0200, Laurent Pinchart wrote:
> > +       -  If this flag, then at least one link connected to the pad must be
> > +          enabled for the pad to be able to stream. There could be temporary
> 
> How about, instead, to make the meaning clearer:
> 
> 	  -  If this flag is set, then for this pad to be able to stream,
> 	     it must be connected by at least one enabled link.

Works for me.

> > +          reasons (e.g. device configuration dependent) for the pad to need
> > +          enabled links even when this flag isn't set; the absence of the flag
> > +          doesn't imply there is none.

-- 
Regards,

Laurent Pinchart

