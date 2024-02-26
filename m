Return-Path: <linux-media+bounces-5945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E118B8676BA
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 14:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB531C246A1
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612261292C0;
	Mon, 26 Feb 2024 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="rPELn4eS"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8784FD5;
	Mon, 26 Feb 2024 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708954638; cv=pass; b=Iqv70mWDVuE/RStSHOafKlmvzas7n0jzpl2WZ4wIOKY4TZbUq59pqgcYfdoG4/lU2Qogrx1VnJrDHytoMh2mQGjJAJNyyMw2pTqrGiALns9wOtgP7j7GW3gIhT0vpCn8WS5d9L7xOSxNXgwmXk34m6vmWu/Uc/6V0zJKXsHIw5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708954638; c=relaxed/simple;
	bh=9X0WPimBd7+YxQonIEPwecnreVRwiL9MavIFtObtiVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tv0KLNaKV/VOcuG6La3B03krff4XtzqbIENo6ooYtZ0Q9Hut/9aRcy3114QH41eYG2G5EPnl9dqxZPscL5XdulSshAD5WcDN4129HKzSvtUPiUIVxOsYSE6sl676ZeYUAk45ULJYYHZMA+9r/fk0eWULq4EAa/DStQB5d0GZ/m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=rPELn4eS; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Tk1r918mZzyR8;
	Mon, 26 Feb 2024 15:37:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1708954633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIpF/Sg4r6DeZMEmHnWTsmCravJhaXcupIIojuBrgeA=;
	b=rPELn4eS8RPLE5/+Cs2aO6RNKyLvE1t4PXXNklovD50kA+0jpODkZ4PulC+fuXCDxxDLdQ
	VQOt1PFctdMaoh0los5VxkYfRsmyvkd6IHNCagai4sjmufXaPMybRAGvPhodJPY+EnhdGH
	dUv0ZNIC0tKi7qZfn9XQHWkhpgryDLk=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1708954633; a=rsa-sha256; cv=none;
	b=qjx5dNdlHBBzxDYAdvlw1FwdzaCe9OEMdEAnklmdJcQQak8wRlplV7MvXUZbaWIUrF0Obx
	krEaag3Uwe+GfeWjBhEckLXZrh8MpMLfApJRZQaCEerXpI7DmlLcwiEJ0nmZ6VnJFYBm1E
	QSFS5HYZ4RYC4gJ1HQr+o7opF5a3SLw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1708954633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIpF/Sg4r6DeZMEmHnWTsmCravJhaXcupIIojuBrgeA=;
	b=Y4PPyJKtxv/5nCr07vT1IXJ+uCMMb9o7sK0MzugmF+RZBsIayYI2RCMD3r1K3E/O099li2
	mZ8cl4Hdqnaj6HfOtwKOOU3biGfnvsDW+jPdycftI1auhvfom6HHASKUahkiWEC4wrDcqo
	y84qor90mJUV10MkWx9azKYIiHP64Ek=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B18FA634C93;
	Mon, 26 Feb 2024 15:37:11 +0200 (EET)
Date: Mon, 26 Feb 2024 13:37:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <ZdyUB_SEx8Gfa7OP@valkosipuli.retiisi.eu>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <Zdx77nyiQn4zya3h@valkosipuli.retiisi.eu>
 <20240226120431.GA25561@pendragon.ideasonboard.com>
 <ZdyB_yHn9yImTuhm@valkosipuli.retiisi.eu>
 <20240226125818.GA26163@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226125818.GA26163@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Feb 26, 2024 at 02:58:18PM +0200, Laurent Pinchart wrote:
> > > > > +              remote-endpoint = <&mipi_out>;
> > > > 
> > > > I suppose this is a CSI-2 interface with D-PHY?
> > > 
> > > No, that's an internal parallel bus. Depending on the SoC integration,
> > > it can be connected to a CSI-2 receiver, a DMA engine, or a mux to
> > > select between different sources.
> > 
> > The name suggests otherwise. Maybe change that to something more
> > descriptive?
> 
> We could rename mipi_out to csi2_rx_out, sure.

Sounds good to me.

-- 
Sakari Ailus

