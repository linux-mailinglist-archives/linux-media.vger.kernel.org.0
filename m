Return-Path: <linux-media+bounces-6427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B923E871DCD
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 12:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09B11C23630
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 11:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5016C5B5D2;
	Tue,  5 Mar 2024 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="IUzVPykz"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E85B5C1;
	Tue,  5 Mar 2024 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709638170; cv=pass; b=Ae1VkUFKZKHEO5ViDUbgjIusJC3+ZvuZfsgqPt9B8mUPdccP/Qr5ZYoswhWsUeXs5sQ0gyhOoJuw4mjb+JyASw09hWQc1d8ajUXki9emIpcmhP5XsrVRih/lM8ntuuBLuUsVq7UfS09Ie8j62qzzdFXsh3xLPaah7pTQ3eBIAfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709638170; c=relaxed/simple;
	bh=jmZ8Ehp1I24xHblOTn9Z6Ha5A5gX5H1wHwLApwPnW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vi3BFHNpD0zZyDU3Fezd84xXW5FDL8AUD40BBh6PS4s+58ltZlTohqR3xJfNiPfx1tYPBlpUMh3aalVXLwoMmSR8zdsCLd3/ol+wu/DJYGDXR4wkutxqqBfpHFJbIiWAANpdER1c3F31zXBArpJH8inbgwzZMCK4JQrt8xl4Vck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=IUzVPykz; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Tptd06dlDzyTd;
	Tue,  5 Mar 2024 13:29:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1709638166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mkMNf2nshRvIW/zVzj6xc7l2+aM9dtHJMICGPDgyQc=;
	b=IUzVPykzGuWpMI0BWUrWa3NcOP9rgQ/i8xYYS+y1AFpw6l1nj4t4BtbVFmlbwJ7+4FYDLy
	IVo2HfetZFceZDJp/BrILmYHyJAPgYwpi35PBIe3K13TPXuKByPZle/qPv/NnHn7ahedch
	6Vvl2Zuaex6VnfSNnHoABfVFKL4xSoA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1709638166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mkMNf2nshRvIW/zVzj6xc7l2+aM9dtHJMICGPDgyQc=;
	b=rAZJnmQ192E5R/84l0xUjTyZFGrImfhJemeoff7fak/DjPAbbdQNNLUI3bTm83oriFOZoM
	2+KXgG96B+zXYQl7BBpeOO6cLVRkYUPbu2SsohTHPovlWmg3k/aYi1cqwioJttifyYO1ua
	ICNFFMa70WaqjzTUpBe7kHYLAmKbMPg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1709638166; a=rsa-sha256; cv=none;
	b=b2HgqHnUUfmZZC5WnnnPm73XWBvJGoB1XDP5mfBYsB1JYMXE2FIP8bpO6VAF8ky3LGDxom
	cR32w4cpPRfAilzwVakVrmW/WRjL3XTCNy9yAfTccfD/TvzCJ1ETFu34Ux/wfEXgHThht7
	n1t9W3hnHSWvKSnygbDlUc1kLT6nhes=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 12C06634C93;
	Tue,  5 Mar 2024 13:29:20 +0200 (EET)
Date: Tue, 5 Mar 2024 11:29:19 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-isp: Disallow unbind of devices
Message-ID: <ZecCD0afyzofEsq9@valkosipuli.retiisi.eu>
References: <20240131180452.844863-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131180452.844863-1-niklas.soderlund+renesas@ragnatech.se>

On Wed, Jan 31, 2024 at 07:04:52PM +0100, Niklas Söderlund wrote:
> It is not safe to unbind and then rebind a subdevice in the rcar-vin
> pipeline. Depending on what subdevice and in what order a device is
> rebound the rcar-vin driver can misbehave.
> 
> Until this can be solved suppress the files in sysfs which allows for
> this. This is in line with what is done for other subdevices exclusively
> use with the rcar-vin pipeline, e.g. rcar-csi2.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

