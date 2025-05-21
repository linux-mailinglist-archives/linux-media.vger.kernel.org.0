Return-Path: <linux-media+bounces-32992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA034ABEDD1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAD94A4601
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 08:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF8A2367BE;
	Wed, 21 May 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N3ri7dvI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E78B235C14
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815957; cv=none; b=KuQpSB0qFK833zkV2SBZarWFzmvJadQQCe4fq6pVHYJg9VLKcmA8K2QieNSJqKA/e5D1v40PxwuYDgRhdyQIexzNRG5StyzFXyRpH1AljTNckJGQfyasuN6th9IkOgikpmYBnfiQzhtX4FG8MokOCZY7QmjPhrhh2zq+coEbpOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815957; c=relaxed/simple;
	bh=AMl2G12zxnWMwTJEqaIidpLe9vLLLzPybi8DBuMHKQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmifZkBteZchbnGXg59pfjU207wCHvGcwvRQ5xQNuCN5utJwhIBTu1z/GsFg6ysFEIG6hIGEaFr+31p1e/epJ6UGONESUmiuZq9hZTsYiC/0eA7eHbKMiy9btzzWc6dfMZdqJvtRprUpRWLAAEo8jIsZm7FLciG80fANj9VuZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N3ri7dvI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A6EA6B5;
	Wed, 21 May 2025 10:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747815932;
	bh=AMl2G12zxnWMwTJEqaIidpLe9vLLLzPybi8DBuMHKQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3ri7dvI0HzJEAhZQlx+rOPnmp+iqEAPwiNMM1IHLuXQ8sGkT4DisfvVAWj0SsNJG
	 XU2zeN7Htk5NhLLcrAFFFpW9O9F2l7Z5NsM92f4eiNUseyAXVNgTcTgeXlwQX3m0GS
	 lefeHLYlGAAXY9aBPGbctm4TFK2PINjb3cunophQ=
Date: Wed, 21 May 2025 10:25:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [RFC 1/1] media: mc: Add "kaboom" module parameter
Message-ID: <20250521082547.GA12514@pendragon.ideasonboard.com>
References: <20250519113809.296083-1-sakari.ailus@linux.intel.com>
 <20250520153938.GE8070@pendragon.ideasonboard.com>
 <aC0Ac0cZiFqBShO3@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aC0Ac0cZiFqBShO3@kekkonen.localdomain>

On Tue, May 20, 2025 at 10:21:39PM +0000, Sakari Ailus wrote:
> On Tue, May 20, 2025 at 05:39:38PM +0200, Laurent Pinchart wrote:
> > On Mon, May 19, 2025 at 02:38:09PM +0300, Sakari Ailus wrote:
> > > Add "kaboom" module parameter for the "mc" module. Setting "kaboom" to a
> > > non-zero value will delay calling media device IOCTLs by 5 s and if the
> > > media device is unregistered and released during this time, NULL pointer
> > > is dereferenced and at least a kernel oops will happen:
> > 
> > This is useful for debugging, but do we really want to merge it in
> > mainline ? Can't this patch be carried out-of-tree ?
> 
> Rather than merging this anywhere, the problems this patch underlines
> should be fixed.

Absolutely :-) Can you clarify what you want to do with this patch ? Did
you send it to share a means of reproducing the problem with other
developers interested in fixing it, or do you want to merge it in
mainline ?

> The first one that you hit is a NULL pointer dereference
> due to lack of refcounting and the second one stems from the device
> disappearing while an IOCTL is in progress, leading to similar issues.

-- 
Regards,

Laurent Pinchart

