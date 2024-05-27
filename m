Return-Path: <linux-media+bounces-11915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CB78CFAC1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 09:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5569E1F23229
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 07:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CC947F69;
	Mon, 27 May 2024 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="mobTZUzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207646B9A;
	Mon, 27 May 2024 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716796710; cv=pass; b=msfhg1Us3lRrYakYEUxpF4SwuBPN4EmkAInO4nUypEXmnzF4Apq4iit+k6ZzxUCc6KxpkqBH4PiRq767bX1fREHJvKV+GY1IN1XRCzm+JcpEbJ0ydnpuYe6/1pDKaMlZV19gQ+0PRBtW6i628KwwwIsn4gDbbt22UQm+kTh2l18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716796710; c=relaxed/simple;
	bh=vwS+AuD8UVfLnVXDMH1Bl8rSrqLGxrRX5xZXy2fk1aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8OXIbL5fPKgYtCT90/ibJVPIXjaOVSdVI8xS4fxz48txABl+INz/lBON5lh1mE5TZgPEWoP43z+1bjdECXPQPoT8+ZPmDVgabCXR3QME+62hbrZcFVWDSG+VHPrZeVyYD+5+MYUzXaNvRm1v+nF2Uoaz6CFigEujNFMdefODwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=mobTZUzZ; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Vnp1G1H51zyTl;
	Mon, 27 May 2024 10:58:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716796706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x23DknOkOB4RXlSRdLWdfv1URkvosOteVrdvSet2Ipw=;
	b=mobTZUzZ15XSt7HuoAWzNUb+i1fJXmNR/gs6OxF5LqV/9E650i/uNpQ9SvdRxOB8fLdzan
	afVRpBl0UkoV0weNa2RiXrmLbCM6xItNiYFANbYLcf7TAqRL4kz8iHJr8qiQ0IjFYi3uQS
	g923Np2HbJOqXksQO5HzoZ2LS/EOmqw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716796706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x23DknOkOB4RXlSRdLWdfv1URkvosOteVrdvSet2Ipw=;
	b=KpJqFlmwOwyrXx034SsC8NCjE6uROGzTfBJuJAlRDO2q8izyDAimKKXNQlhGsPgfXM0vNN
	NgAFPh/YhF6AegU34aD8cyCNiOYoS8UX75WKnJuP2Nl5EnZKsD54+beq9ENnrCurAY+YoA
	i45+1L46mbEjAWtuo/fi+Fbg1oPhhEY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716796706; a=rsa-sha256; cv=none;
	b=dFgTAqntdpL85p0FWoXQDa20advQZAU0/1ZGuqeh+mrYm5BuxIq2ab4npfD2D7tZsYCzYI
	YR+aAUvPuFfbkp0CktcigGldCjimwq509l8yWlG12BD+h87eI2Me2WQt/VQJ96ArAgYOS+
	Yvl+g1HYSSwx8IkBGN4LUspAww2ZUsE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 66993634C93;
	Mon, 27 May 2024 10:55:28 +0300 (EEST)
Date: Mon, 27 May 2024 07:55:28 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <ZlQ8cOK718ha5ABw@valkosipuli.retiisi.eu>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <4ea66114-37a4-413f-b672-43ec3d4631c6@ideasonboard.com>
 <Zk-tyxjm-6R-66JO@valkosipuli.retiisi.eu>
 <8fe3bfb9-73d6-445f-bc90-d33b5c192507@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fe3bfb9-73d6-445f-bc90-d33b5c192507@ideasonboard.com>

Hi Dan,

On Fri, May 24, 2024 at 11:31:28AM +0100, Dan Scally wrote:
> Hi Sakari
> 
> On 23/05/2024 21:57, Sakari Ailus wrote:
> > Hi Dan,
> > 
> > On Thu, May 23, 2024 at 03:27:36PM +0100, Dan Scally wrote:
> > > Hi Sakari - sorry, one part I missed...
> > > 
> > > On 23/05/2024 09:03, Sakari Ailus wrote:
> > > > > +
> > > > > +int mali_c55_isp_s_stream(struct mali_c55_isp *isp, int enable)
> > > > Have you considered {enable,disable}_streams? All new drivers should use
> > > > these instead of s_stream() now.
> > > 
> > > Although named s_stream this is actually a purely internal function - it's
> > > not exposed as part of the subdev video ops. The resizer subdevices
> > > similarly don't expose an .s_stream() operation, they're simply started in
> > > the callpath of mali_c55_vb2_start_streaming(). I'll split the stop
> > > functionality into mali_c55_isp_stop_stream() and rename this
> > > mali_c55_isp_start_stream() to make that less confusing.
> > Ack. But this might require some rework, depending on based on what
> > streaming is actually started. I'm referring to the discussion elsewhere
> > in the same thread.
> > 
> > > 
> > > The TPG subdevice on the other hand does expose an .s_stream() operation,
> > > since the intention was to model it exactly like a connected external
> > > subdevice. I can switch to the .enable_streams() operation there.
> > Sounds good.
> 
> 
> Actually, not sure about this...the TPG just has a single source pad, so
> there's no _routing_ to set and as far as I can tell that means there's also
> no _streams_ to set since they depend on the routing -
> v4l2_subdev_enable_streams() checks the state's stream_configs to make sure
> the stream you're asking to enable exists, and those stream_configs get
> created when routing is created - so I  think for now that the TPG has to
> stay as .s_stream().

With Tomi's patches
<URL:https://lore.kernel.org/linux-media/20240424-enable-streams-impro-v6-0-5fb14c20147d@ideasonboard.com/>
you no longer need routes to use {enable,disable}_streams.

> 
> 
> In the isp subdevice I can switch to v4l2_subdev_[enable|disable]_streams()
> and let it fallback to .s_stream() for the tpg - that part's fine.

-- 
Regards,

Sakari Ailus

