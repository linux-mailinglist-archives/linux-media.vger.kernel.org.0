Return-Path: <linux-media+bounces-33002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA0ABF197
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5BB3B1E05
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E96F25DD1A;
	Wed, 21 May 2025 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NLlvw1/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670E242D66;
	Wed, 21 May 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823359; cv=none; b=HPjp/NB88GbmksTyaGcaQjbNiGNmnZE8502gLd3m9pS3pZbMm+8qfByKRjuR96qZJPky6ai1rZ9BqlkKQja2WEqsSkJL3/gP6MMuaY0CcYftMWvz+c8GZ3ZrCgG7QaR8A2rcyArvpCwOwlFQebG2bC3lmRodCavgijHFBsaqqcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823359; c=relaxed/simple;
	bh=BsLfk4W6hGOyAxKG4j9DTDZxtWJhOXlWv1hSc+4+WMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKUONegi+F/O6NUbj40+A+w4aPMavCyy4VH7A1NmUYCNDRVAR/+A+IOtwZbG8k4Y//XSUEzEZejAvo8vKyJ5AKxT9sXP9r0cTNrUh5qduu37HRCrDaid/Iixms8apfDXtWu4XpS7NcCx61Qe4ehz6B9KCM8mrZDJIe2aEr2C004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NLlvw1/Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5AEA6B5;
	Wed, 21 May 2025 12:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747823333;
	bh=BsLfk4W6hGOyAxKG4j9DTDZxtWJhOXlWv1hSc+4+WMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLlvw1/Y4ia1wdjBQBL+MvyXbkNjDVqVYL5E7KOxl3KbXr+r8v1HVN0ZvZjWxbs+m
	 MYwVMN7qZpxxjKgEgMWXBVL9dC8zm8T+uVnfOAOhuP2shHn/HTzMUhQx8ekUkwnHXz
	 IEJPsQoG8kjYBL367bcoLEBcz8KFa5pNsDJe6M/A=
Date: Wed, 21 May 2025 12:29:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
Message-ID: <20250521102908.GD12514@pendragon.ideasonboard.com>
References: <m3plgi9pwu.fsf@t19.piap.pl>
 <20250509091549.GD28896@pendragon.ideasonboard.com>
 <m3sekz8r7z.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3sekz8r7z.fsf@t19.piap.pl>

Hi Krzysztof,

On Tue, May 20, 2025 at 01:19:12PM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> > The goal was indeed to save memory.
> >
> >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> @@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
> >>                                                sink_streams);
> >>               if (ret) {
> >>                       dev_err(xbar->isi->dev,
> >> -                             "failed to %s streams 0x%llx on '%s':%u: %d\n",
> >> -                             "enable", sink_streams, remote_sd->name,
> >> -                             remote_pad, ret);
> >> +                             "failed to enable streams 0x%llx on '%s':%u: %d\n",
> >> +                             sink_streams, remote_sd->name, remote_pad, ret);
> >>                       mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> >>                       return ret;
> >>               }
> >> @@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> >>                                                 sink_streams);
> >>               if (ret)
> >>                       dev_err(xbar->isi->dev,
> >> -                             "failed to %s streams 0x%llx on '%s':%u: %d\n",
> >> -                             "disable", sink_streams, remote_sd->name,
> >> -                             remote_pad, ret);
> >> +                             "failed to disable streams 0x%llx on '%s':%u: %d\n",
> >> +                             sink_streams, remote_sd->name, remote_pad, ret);
> 
> It appears the current code saves (in my default build) 8 bytes of
> memory, at the cost of readability and inability to search with grep:
> 
> Current:
> Name          Size      File off
> .text         00000bf4  00000040
> .data         00000000  00000c34
> .rodata.str1.8 000001b8 00000c38
> __jump_table  00000030  00000df0
> .rodata       000001b8  00000e20
> 
> With patch:
> Name          Size      File off
> .text         00000bd4  00000040
> .data         00000000  00000c14
> .rodata.str1.8 000001e0 00000c18
> __jump_table  00000030  00000df8
> .rodata       000001b8  00000e28
> 
> Built as a module it doesn't even save that - the number of pages stays
> the same.
> 
> Just FYI.

Fair enough. I'll take the patch, with an update to the commit message:

media: nxp: imx8-isi: Simplify a couple of error messages

The error messages in the mxc_isi_crossbar_enable_streams() and 
mxc_isi_crossbar_disable_streams() functions are similar, with a single
word difference between them. The word is moved out of the format string
to a separate dev_err() argument to try and save memory through string 
de-duplication. The total savings are however small, as the .data size 
reduction is partly offset by a .text size increase, with a total saving
of 8 bytes in total on an ARM64 platforms. They also come at the cost of
making the error message difficult to grep, which outweights the gains.

Simplify the error messages to make them grep-able.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

