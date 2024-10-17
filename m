Return-Path: <linux-media+bounces-19775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E69A1A5F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 08:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0A7AB25325
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 06:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411ED1791EB;
	Thu, 17 Oct 2024 06:01:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19406BFC0
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729144891; cv=none; b=KM62sy8d7zlOWczYo+8Fc6oVJFUQgj2JE2arMvGyR/IGrlLU5B0plUeMZUHKulxergY/85YP+6f8TRdMePLVRYLvtjwUfDCx4LA8sp5Ys9zPdyCebyOYSjSTUzHEcAomLlcn20baxpo3E0GBegDut0RMsAlzpBdnnhblAw7kr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729144891; c=relaxed/simple;
	bh=sObuPPiqlZKBTrMoEyK3MC66GhROffXY/oFabOo6T1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2jbgpic+xDauS6x7wqScetidrTJvbuQwBhd16OZofYEw37/p5GLLYkfEr1vxc7GUvG0ifRzH5lzgTSUYEhzaBIsA62st3zdfDiMTOCCjFO8jz/gsQvluPwIgaBo31gRJMpfarD90xvq8QZp2TXeTZxNHTTTm1LgP7ZOTncGfSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EFADA227AAF; Thu, 17 Oct 2024 08:01:21 +0200 (CEST)
Date: Thu, 17 Oct 2024 08:01:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hch@lst.de,
	andriy.shevchenko@linux.intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2 1/5] media: ipu6: not override the dma_ops of device
 in driver
Message-ID: <20241017060118.GA22902@lst.de>
References: <20241016075305.508934-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016075305.508934-1-bingbu.cao@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks a lot for doing this work!

Reviewed-by: Christoph Hellwig <hch@lst.de>


