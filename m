Return-Path: <linux-media+bounces-2292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5B810BED
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7ED1F210BB
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9561C6A5;
	Wed, 13 Dec 2023 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gf1IiH6J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7592BD
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 00:01:40 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8DFF6CF;
	Wed, 13 Dec 2023 09:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702454452;
	bh=PPCPyjZiQLHwQKBtu1nMtLaaw41VR2L5Nvf+UBuWlto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gf1IiH6JqyqbrTR5qKsTTrR21scFu/7ys8JzPQcxBjA+SuCcJ9iffJaF32NkFKznG
	 eLxKSc6hoZ9aFTC0eth/QdFnFHDKKjRQfwHkCZiQ5INkBoTsv2g9TXygVi8fqocSHX
	 QFUHBpHfMdxPGEyNu/pK0aTuaq1b6hc6YtCT+KzI=
Date: Wed, 13 Dec 2023 09:01:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <xijjtvgwzpuxt7sd5wb4i6u3y774vrpoyaq7vkkz6a2smjbdfa@lp4qpalzlk6l>
References: <20231212191117.133868-1-jacopo.mondi@ideasonboard.com>
 <20231212191117.133868-3-jacopo.mondi@ideasonboard.com>
 <ZXjDTyitj5APSv6s@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXjDTyitj5APSv6s@kekkonen.localdomain>

Hi Sakari,

On Tue, Dec 12, 2023 at 08:32:15PM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Dec 12, 2023 at 08:11:17PM +0100, Jacopo Mondi wrote:
> > +static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
> > +	.init_cfg = ov64a40_init_cfg,
>
> The init_cfg pad op is gone --- it has been replaced by init_state internal
> op.
>

This patch is based on linux media master branch. I'll rebase on the
staging branch then.

> --
> Sakari Ailus
>

