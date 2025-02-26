Return-Path: <linux-media+bounces-27028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFFA45CB4
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01CF3A323C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3FE212B23;
	Wed, 26 Feb 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ItN4oEdC"
X-Original-To: linux-media@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFE20E31F
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568215; cv=none; b=KDRYyQpRAZvmqBViy5vsU6a5NRyT4MPJj5EYIUzLiwcYdcVE1PPT0y8jvtgjYEnl73R++hDDfBQblQ6+G0LtUEcqKFYW40YUBHBqD/9+NVKtoHzpZQddpSCukXAAR1DpguZYJeMEZ1rURfDZbGBICERBnoUOQVQE6gKPUaQkufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568215; c=relaxed/simple;
	bh=wv94hBbdnTRJdedj2FoMPT7G6yT2DLXVF930aiuXtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIfaZLyv1MVwlTMcB48BpSdokA/CmvOBVLjrlsbjtde9daVCNMCpSvKnTV3jXo/W0OdQmmWVappNQ3baZcZtiUEEEYkTlHLibNzrwHHN4ntoY1ujtUmv/i/tKMAlRIV065PhGC8EWSMKo58u3hpyke1iKO6P4rZYLtp4GNg0oS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ItN4oEdC; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 26 Feb 2025 12:10:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740568211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCxMw2L0Wubw3V23lW0qdnXnu1qOyK0WFsTNRlXpsds=;
	b=ItN4oEdCWWnUUsTW40UXF3qUpMv7WMDGDSEVkAL6r5rkM66XYGOQ4cMP1Cp/kmLJE55OHx
	b1BAzKE08T0ZHMqxxsG+gmTkzfrL6EH0px/UZ2FhxIr1buJQomYv00a/e7zN4wmGZy0bFG
	WVOHM0MWuLMGSY58144eXzM/0SQoKw8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
Message-ID: <7ng76j5fqwv6rz3sxw4cjcupeel3o6loydr6mr572ecigq4ano@hbzmlrayqbkb>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
 <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
 <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
 <20250225154607.GA18426@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225154607.GA18426@pendragon.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Tue, Feb 25, 2025 at 05:46:07PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 25, 2025 at 03:30:16PM +0000, Dave Stevenson wrote:
> > On Tue, 25 Feb 2025 at 13:09, Richard Leitner wrote:

...

> > > @@ -605,7 +604,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> > >         if (ret)
> > >                 goto error_release_group_hold;
> > >
> > > -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> > > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, (gain >> 8) & 0x1f);
> > > +       if (ret)
> > > +               goto error_release_group_hold;
> > > +
> > > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN + 1, 1, gain & 0xff);
> 
> Ignoring Dave's functional review for a moment to focus on the code:
> 16-bit registers should ideally use the v4l2-cci helpers. It would be
> nice to convert the driver to them.

Thanks for the feedback! I will take a look at the v4l2-cci helpers.

regards;rl

> 
> > >
> > >  error_release_group_hold:
> > >         ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> > >
> 
> -- 
> Regards,
> 
> Laurent Pinchart

