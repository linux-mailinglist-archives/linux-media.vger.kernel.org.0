Return-Path: <linux-media+bounces-29724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89317A820A2
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 11:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750F419E313D
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 09:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9643D25B661;
	Wed,  9 Apr 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H9t9RbDo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071C1DED5C
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189247; cv=none; b=fEOuAEtrVqFXFoW3IvVc20VoNpAEP3y64T3BFeOc1XUcNE5QuBWbkh6m0MT75c8tZztC9GHSys3QykGMsjscdaXlIypUcRFpfe9Dpn+ppczjR1wu+nmCzKZsLgEapHjGOvCV+iyKvfH3/JEhL5n9CHDvyMGPSCdnySXiSUoFVN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189247; c=relaxed/simple;
	bh=2au8yPZF67dlTunKwR8XcZI7O2BLLpZEaodzeW78qQo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxyqJj52XpQKZz2TzYLFVkkoPhlJhZqfzD5Rlxb/wbzbOv4MyD4PFPZHwKsUU5Q171rAhS/7gi1dHvqinCoYMegLEleCrjl1gRomgi/WHlesS5m7V4kIp3QnU8fIR2R+6C38Elu3dhxkWkIJIR0HCCoffv9Lv50I7omRNO5POIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H9t9RbDo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4872673B
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 10:58:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744189125;
	bh=2au8yPZF67dlTunKwR8XcZI7O2BLLpZEaodzeW78qQo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=H9t9RbDoZGPiaDSqN6vrAZSrn4FPvSEO4PQzWPP/M9JUkcFBnkMY3ExrMBFNuCgX+
	 03IZfTFODBrRGfW7UpMjQFuSKSvcJRdTsjBDyxKUdN7TeUNMQM6ojjL6+gIsDCTH3x
	 8ObqRt9IlLwd5qG7TFz4+9AXqqJZbTOENpQLbUpI=
Date: Wed, 9 Apr 2025 12:00:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Subject: Re: [0/6] media: renesas: vsp1: Add colorspace support
Message-ID: <20250409090017.GF31475@pendragon.ideasonboard.com>
References: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
 <67f5d1de.020a0220.2e9703.0023@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67f5d1de.020a0220.2e9703.0023@mx.google.com>

On Tue, Apr 08, 2025 at 06:48:14PM -0700, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/74248433/artifacts/report.htm .

Those are known infrastructure issues caused by the gitlab.fdo migration
and should hopefully be solved soon. Reviewers, please don't let this
automated report distract you :-)

-- 
Regards,

Laurent Pinchart

