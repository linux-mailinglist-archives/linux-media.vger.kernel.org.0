Return-Path: <linux-media+bounces-30795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D49A989AD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 052193BF447
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3347A201269;
	Wed, 23 Apr 2025 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wJ+4C9jW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58391E522
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410949; cv=none; b=SAIRMk+tJFQ36E/v1ly+nO39MOzbvKaVMTkHioDibnajaQv34FDdq+ZEyCpr1AfKMYqPLqNPyFT6juEIPcq710TpPKyijAYqIq5gdkb6Oq+hIcjQZLC3Qp8RZdL+3x30LcGFERo1JbfPRGkVxzArcaUaEQdQ6hqDznCq1716af4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410949; c=relaxed/simple;
	bh=JEE+GA17dPxewkmUxUhLrXmSa4KV55aBL0iL4pUfjRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieWFggMsecW7bHL+IxnX8EFSlQOWAU5z1fJw3qR/y/+hos/pCF4HCr1yGEHmo+a/gVpAhQ6r8pyj/46ZrhkRvA5JKOp6xZiKySGl6cnoZrfyBaT5Rx77oi+9qacj5RcFk/xDYGLu+7INChWi8RLinhi3GQjg5FGDK8Yrq1ZLxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wJ+4C9jW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EFA716A;
	Wed, 23 Apr 2025 14:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745410938;
	bh=JEE+GA17dPxewkmUxUhLrXmSa4KV55aBL0iL4pUfjRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wJ+4C9jWMTXxIfFaTXnWvAPcaalpsgw2k8QNl+9hLrd6722bu3zDFxA3ZTv1Iyu/Q
	 mzQNq9I3ZUqOfjie1lvpbLaxiYYFAbu1EAwKgJq050lgZZWg5+LHpHrQ/aiP4vc9yE
	 BDtZr0JShKuc2Bu7q/km57YZJc7btd1wLZkCJMFE=
Date: Wed, 23 Apr 2025 15:22:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 06/11] media: ccs-pll: Drop LINK_DECOUPLED flag
Message-ID: <20250423122217.GE17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-7-sakari.ailus@linux.intel.com>
 <20250421200331.GG17813@pendragon.ideasonboard.com>
 <aAjXRGKmIByRd25l@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAjXRGKmIByRd25l@kekkonen.localdomain>

On Wed, Apr 23, 2025 at 12:04:20PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Apr 21, 2025 at 11:03:31PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Apr 17, 2025 at 09:53:49AM +0300, Sakari Ailus wrote:
> > > The LINK_DECOUPLED flag wasn't used by the PLL calculator other than
> > 
> > s/wasn't/isn't/
> 
> To be fixed for v3:
> 
> I presume:
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> as there were no other comments. Please let me know if that's not correct.

Indeed.

-- 
Regards,

Laurent Pinchart

