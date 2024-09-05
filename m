Return-Path: <linux-media+bounces-17658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 011D696D30B
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 748C01F2283E
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 09:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7629A19755A;
	Thu,  5 Sep 2024 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggKi1uUd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41B192B94
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725528323; cv=none; b=ri0OvAzHkoN33p9oVVBs1VsSjwkhBdoExePObkyjW4vnLcHq7vsJrMRnNXKS/7056rLWI1nAADUCbL5uVtSVcLGdvidHOW+nsKr1gTw9pO4WmvtYu4s1cFc1QBrX9wOUGGNjXqQS/PBAN4z9XIZt1MCp9uu7oEs6NCsjqR05+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725528323; c=relaxed/simple;
	bh=ICnDBcTXBP7fCfmjS2mZcFD1tCUnPc5RT99xlNN7iXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2BhE6/buYomx831AOGY0U16oaz7U9C6NfleLE6ue1mZb4BQ+CN90XHxMe4/t1XznuNQMhUrG4+obaj2kEy7egvyJidbcwMD0lTwRgbcH66YvfrvE3gLArqV3kPbND+pew7MgjsHC3iRAq/bk+fmjyzrZ9jfNJA284bKSj0HtfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggKi1uUd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725528323; x=1757064323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ICnDBcTXBP7fCfmjS2mZcFD1tCUnPc5RT99xlNN7iXU=;
  b=ggKi1uUd+i+ClGnV0t5fsXBp3qTSIwPdUU6Tthz2FBfu/iRpD8uRXUsw
   aEOIj3zjmXqhcv9bP+l0DGISBm+3Gkk7t1aQi/kF0pPTLKfLdZdmTEhNn
   11PiC7ujT7IySwH0mgpd/HYd+nvTy8dN7Yw/YEY/3DMZr51eSR/1OG4ju
   vkxsmxQmaEJ6G4OyCeqtYavE0s5dSQhfZrcW6qGB/1PlEu2f5z/VP94sP
   V2cA/+SFqJ6kXumGsT9xmNaNDBUAR7V7h/CmopMoX6Sd6n4XMEHTL+F+k
   o04Gsj04511mrwM3r/9YNh+vjYPvuZd57uVUdza5PcUGeRJPYi4FjNWus
   g==;
X-CSE-ConnectionGUID: Gnvz1HCXStSYfeEU1B1k5w==
X-CSE-MsgGUID: qCfnoUzKQhCEaIVek8hHeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46763279"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="46763279"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:25:22 -0700
X-CSE-ConnectionGUID: qtZNLuxoRiiOafIv1rrV3Q==
X-CSE-MsgGUID: Jo5MKWFnS4a/GpDgS9E9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="103023218"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.9])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:25:16 -0700
Date: Thu, 5 Sep 2024 11:25:08 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sean Young <sean@mess.org>, Steve Cho <stevecho@chromium.org>, 
	Tomasz Figa <tfiga@chromium.org>, Hidenori Kobayashi <hidenorik@chromium.org>, 
	"Hu, Jerry W" <jerry.w.hu@intel.com>, Suresh Vankadara <svankada@qti.qualcomm.com>, 
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <t4ujthhuzq4mf5m2ny4e5buw7724g7oh34756d46qeauagfhsd@ke2xcqjtqdqd>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>

Hi Hans,

On Thu, Sep 05, 2024 at 09:16:27AM GMT, Hans Verkuil wrote:
> Hi all,
> 
> Here is my fifth (and likely final) stab at an agenda for the media summit. As always,
> it is subject to change and all times are guesstimates!
> 
> The media summit will be held on Monday September 16th. Avnet Silica has very
> kindly offered to host this summit at their Vienna office, which is about 35
> minutes by public transport from the Open Source Summit Europe venue
> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> 
> Avnet Silica Office Location:
> 
> Schönbrunner Str. 297/307, 1120 Vienna, Austria
> 
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> 
> Refreshments are available during the day.
> 
> Lunch is held at Schönbrunner Stöckl (https://www.schoenbrunnerstoeckl.com/), close
> to the Avnet Silica office. The lunch is sponsored by Ideas on Board and Cisco Systems
> Norway.
> 
> Regarding the face mask policy: we will follow the same guidance that the
> Linux Foundation gives for the EOSS conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
> 
> 
> In-Person Attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel Maintainer)
> Steve Cho <stevecho@chromium.org> (Google)
> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
> Sean Young <sean@mess.org>
> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
> 
> Remote Attendees (using MS Teams):
> 
> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
> Tomasz Figa <tfiga@chromium.org> (Google)
> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> Devarsh Thakkar <devarsht@ti.com> (TI)
> 
> Note: information on how to connect remotely will come later.
> 
> If any information above is incorrect, or if I missed someone, then please let me know.
> 
> We are currently 17 confirmed in-person participants, so we're pretty much full.
> If you want to join remotely, then contact me and I'll add you to that list.

I would be happy to join remotely.

Thank you for the organisation

--
Kind Regards
Mehdi Djait

