Return-Path: <linux-media+bounces-39111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCEB1E5C6
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F26565D13
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8317526AAB2;
	Fri,  8 Aug 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9ZaQcsr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38493234964
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754646197; cv=none; b=KV8TkxoJVo3BoJeUppafgkB22Vx3AsHOe/eu+7L1DSJgkq4DKxTeoTGj0lzIUTNOtA06vZpeNR6z4Cbv8e+B6vIEQ/s7ihD2zrqtuy1pSRTeDTNU6IF00pbvgBHSQ3u9P1y/Y/wqV2WSLyUxzffudv0LBYo6e4uHhZ2T2ioskOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754646197; c=relaxed/simple;
	bh=jWSPyH9sdFl63ylsmmyhaJx5LKoD8x5eaweef7AmsKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN2jDEe3kwats7jyO5cfDRZks2QwFIhcaW3I97kwxF/aAlI8AW+bY6V7Gt93T9eqomTomldqqcErrL+rligGuhJep2VWs66KfRRGb9LHHhSK8rj+Mhw8lkmOj8hCOAOrbuU6azSO2R/nwwRooBA+QJCplC1hN4mcPfp4bXBVBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9ZaQcsr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754646195; x=1786182195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jWSPyH9sdFl63ylsmmyhaJx5LKoD8x5eaweef7AmsKs=;
  b=Z9ZaQcsrB4dIs7laRtt65JIzp8C+O3qEWR/WdWVU3UZnOWvaIktYL9B/
   hxzl3/afEATcfm2GslbOoKTiIkg4Lk9jW3ec2NrHg1UrcOdxtAf4lkf6q
   q8c/w73TtI5AC8jbPz6YUIBGK5Y6UjcfSEjO4BZ8c9GZBdwFxx2e6BpCL
   blWJhcd80O6Grz0veBMzsZvgVDqycaAZ8NT2hw1TZ6tpVHxzgsu+r/Dl6
   eeByjMu5ElJ5XMtSUK6vGyCe+OEy2+t8+yKtq27KHTYspsU0DvQYv+FOz
   QUnO3OOt5tEoUwyJJ5iWBUP8haADO/X0gVfSyXALyDd1PAA67o6EyrrtT
   A==;
X-CSE-ConnectionGUID: Gmkz2RpgQymdbJPHffBhxQ==
X-CSE-MsgGUID: HxAXJjk+T9Wathek3T4K2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74569351"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="74569351"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 02:43:15 -0700
X-CSE-ConnectionGUID: wMGCW6xISUihdolEEntJrw==
X-CSE-MsgGUID: 1v9b6om1SXqSpj47QT+WXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165192554"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.151])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 02:43:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D92B411FC45;
	Fri,  8 Aug 2025 12:43:10 +0300 (EEST)
Date: Fri, 8 Aug 2025 09:43:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
Message-ID: <aJXGrpbFbyxRN38u@kekkonen.localdomain>
References: <20250808083021.2113627-1-sakari.ailus@linux.intel.com>
 <20250808084738.GA7299@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808084738.GA7299@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Aug 08, 2025 at 11:47:38AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Aug 08, 2025 at 11:30:21AM +0300, Sakari Ailus wrote:
> > Mikhail's e-mail is bouncing:
> > 
> > ===========8<-----------
> > The following message to <mikhail.ulyanov@cogentembedded.com> was undeliverable.
> > The reason for the problem:
> > 5.1.0 - Unknown address error 550-"5.1.1 The email account that you tried to
> > reach does not exist. Please try\n5.1.1 double-checking the recipient's email
> > address for typos or\n5.1.1 unnecessary spaces. For more information, go
> > to\n5.1.1  https://support.google.com/mail/?p=NoSuchUser
> > d75a77b69052e-4b07f8ba752si46048731cf.823 - gsmtp"
> > ===========8<-----------
> > 
> > Assign the driver to Laurent with "Odd Fixes" status.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I'm fine maintaining the driver (for odd fixes at least, as I don't
> think I could even test the code), but Cogent Embedded should be
> contacted to see if there's an issue with Mikhail's e-mail address, if
> he moved somewhere else and would like to keep being the driver's
> maintainer, or if someone else from Cogent would step up.

I don't have contacts there. The last indication of Mikhail is from 2018 in
form of an ack so I don't think his maintenance has been very active lately
in any case, effetively the driver is abandoned independently of the status
of the e-mail account.

-- 
Regards,

Sakari Ailus

