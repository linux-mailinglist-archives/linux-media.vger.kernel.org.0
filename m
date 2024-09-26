Return-Path: <linux-media+bounces-18623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72445987214
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F9B1F22484
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F591AD9F1;
	Thu, 26 Sep 2024 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bq0FqN9q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ADA1ACE12
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348093; cv=none; b=bS7WZ54gzYefVDu1vANt/e7fyie0Vq0N5jthT8zqSt87UZ6s0rOi0XoMaA4zOwNXZi/DrT81D+sNq2985296EgGFkPNdwcUNvgBMVnu84U9irw3O+x4z+pm4sCdjJEBgfmjU0KjAJ+v1KCXIyG4UHL6V50Ofyh/tefT/e5/N6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348093; c=relaxed/simple;
	bh=ZfEswr4WZPK+duFWIHBI/jd9ZyERnDLHX7L9PXX9dgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLhckE8o30gv5Q1cAO5gduDC99PQ/Y0r78DrJNHTx/etwdB2R6uwwCaZKt5TAwzduHCzo6eSNtVzrmha960NlnPEXkctCVBI+eQif6/yIlGe/SNxTatZOk6dWjCY+kkV5LSD9ynKMV7OTjmEIfvWk4ScnWoOYPoTpOAfa+qc2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bq0FqN9q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727348091; x=1758884091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfEswr4WZPK+duFWIHBI/jd9ZyERnDLHX7L9PXX9dgQ=;
  b=bq0FqN9qacc/RNjinEmNDXPdUD40ORLQGO6MVI1mJY4+CbnDR81znG9Q
   harRQ0oEGt+RSfNMogXAlOtbtVwdLX+MN6D5RXe/pXPfYKbrjgAupy3Hy
   PdGr1eMT2rOW8OlggseddHDuma1OkR7P/U1pXVfnnZLYlPYblYzNUvvCx
   KdQppKbgDCZwcg6D567JpYsijrtRENwOwiCE65/W7ZI1HXoVb90oFdQw2
   NVULDzrc0p+gY2zfLnTwPeTyE3q/enyera+ASgPQBn8CDAeuHZZpQnSzx
   LRGqpG3ePXK3/9k6T2ORxF9O9uqzTGvWITQe+7EacFc9aH6YPFvNx+zWX
   g==;
X-CSE-ConnectionGUID: l3hgXms7SS2gFBE97XlVMA==
X-CSE-MsgGUID: cxS/1XAsSsmUToQokcyAVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51849263"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="51849263"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:54:51 -0700
X-CSE-ConnectionGUID: hqYSVKwOSSeX+JsY6nJzLg==
X-CSE-MsgGUID: DNATPtt/SKyez/eNTpe4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="72109194"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:54:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 29D7911F843;
	Thu, 26 Sep 2024 13:54:43 +0300 (EEST)
Date: Thu, 26 Sep 2024 10:54:43 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZvU9c4bYhMSXbIbD@kekkonen.localdomain>
References: <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
 <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan>
 <20240926102448.GA21788@pendragon.ideasonboard.com>
 <ZvU49mrccFlKDhD0@kekkonen.localdomain>
 <20240926104022.GD21788@pendragon.ideasonboard.com>
 <CANiDSCvMmd0eQCWHj6rt0u8nu0uVnDbYT=GJsobxHGOHE74DZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvMmd0eQCWHj6rt0u8nu0uVnDbYT=GJsobxHGOHE74DZw@mail.gmail.com>

Hi Ricardo,

On Thu, Sep 26, 2024 at 12:46:49PM +0200, Ricardo Ribalda wrote:
> > > > I'd argue that even a missing SoB may not be a cause for rebase if it's
> > > > an accident, but that's not worth debating because CI will make sure
> > > > this never happens.
> > >
> > > Does it?
> > >
> > > checkpatch.pl checks should just be warnings. And that should probably
> > > stay. Sob: and From: being different isn't necessarily that far-fetched as
> > > having an address in .mailmap may change From: field but not Sob:,
> > > resulting in a checkpatch.pl warning.
> > >
> > > I wonder if checkpatch.pl should know about .mailmap actually, currently it
> > > doesn't. I could send a patch.
> >
> > We have an explicit check in the CI to ensure that both the author and the
> > committer have a SoB line. It's not base on checkpatch.pl. Ricardo,
> > could you confirm this ?
> 
> CI checks that there are at least 2 committers that agree with the
> code (SoB, Reviewed-by or Ack-by)
> https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/lib/test-trust.py?ref_type=heads
> 
> We also have a separate check for SoB:
> https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-media-patchstyle.sh?ref_type=heads#L61

This script appears to be also ignoring .mailmap.

-- 
Sakari Ailus

