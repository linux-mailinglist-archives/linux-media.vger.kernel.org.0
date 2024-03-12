Return-Path: <linux-media+bounces-6901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF387934E
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 12:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CECDC281258
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F032279DA4;
	Tue, 12 Mar 2024 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="sLNn3Ssh"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822078662
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244245; cv=pass; b=i7n8RuLJnAyqgeMMiW6EKW/X4bxGf9PZeLDtG0Z4ub1PEXxQJ0FAdOd4LZl4KL3CssFSCHugUDXFR2B9yxtAc+r8VFjBXNY0b2IO2UXIdQuquegMkxExAO3/WFBtcIDZQWXsVjAIkX1paZli6Wx1w356Z6VUDJwcqLkOa6SqqT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244245; c=relaxed/simple;
	bh=Ic8A8gI/Mb4TpAM5rjQTlzMsTJlbwY3YUttV+l+K7qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEsFQNxBMOudM8TkUmyZu2Puj+RfrcETfiAhAxNltHQYTRsfH/VaBMGw/djwagrEVaqI206cReWYtxiGn2Cf0rFh88JecutVewgxsfd59Pcu7LUIu7ZQNhsafsiYEnpQGyUVjQ73iOjUF8/lA5eHl51jeBk+3izAW3ema18cocM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=sLNn3Ssh; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TvBmB4tBrzyVX;
	Tue, 12 Mar 2024 13:50:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1710244235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pABBVvYiaZaRftvCRjRV+xywBHqyN7PanV1KshN2vjw=;
	b=sLNn3Ssh5ID4fsx46q4hRihr435dEwNf1IGEuCyI0MNsWcy/b0ZoJ++gBPC52DN/XzkwZo
	fsNS88vBL8t/4XSvntW7HIrYWx48pemDC3zkc8thRLbLTEK31iP1b/OxnSMthJ/aw6ysNW
	XTwHtqfONmhugPuCndZmLsrZF8Rn/S8=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1710244235; a=rsa-sha256; cv=none;
	b=gX76bsL/FfKHlP3jsSqoIbNdYevUAIMG7AAm7iYG+K8piQJ8Al/tioV1xBuT7YamIQ0pEE
	xAuXOvO/Q6+zTa8M9lh9xCJou9Z8qssCwgQhqY/ECkldBmyW6nBIC0CKKf5FKdLMIZjsDy
	Xc5loU8aTD/A9P7mXMp6KHh7rR2aWLk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1710244235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pABBVvYiaZaRftvCRjRV+xywBHqyN7PanV1KshN2vjw=;
	b=fWVPExwA84Kh72RoTYI0bPKNpm0HGYZuT5DKEIj8w1/p9D+YL80n7IgqkanWR6ES6S1d1k
	fWuaRBM6U/G7GS/uH/uCQ5eILzgOfkWAawSGJ3Xp0/qgyFgsotzOEWZKh00ImnJSlsdj44
	0E5AfhgX1pt9rutnVT3mSvyWh2/MyiU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E3E2A634C93;
	Tue, 12 Mar 2024 13:50:32 +0200 (EET)
Date: Tue, 12 Mar 2024 11:50:32 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: Re: [PATCH v3 00/26] Media device lifetime management
Message-ID: <ZfBBiPa2PQarjEvD@valkosipuli.retiisi.eu>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>

On Tue, Mar 12, 2024 at 12:33:56PM +0200, Sakari Ailus wrote:
> Hi folks,
> 
> This is a refresh of my 2016 RFC patchset to start addressing object
> lifetime issues in Media controller. It further allows continuing work to
> address lifetime management of media entities.

The patches are on top of my linuxtv.org tree's master branch. All of them
can be found here:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=media-ref>.

-- 
Sakari Ailus

