Return-Path: <linux-media+bounces-55047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJmLD7jQr2kfcgIAu9opvQ
	(envelope-from <linux-media+bounces-55047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:05:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A974246EB5
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60B83305A225
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31633E959E;
	Tue, 10 Mar 2026 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFxWxnkX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23832AABC
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129778; cv=none; b=cuQClnW4w2pu67Lor2iiwmrC3WgjLfJBq/SpmPbRGu77ycUY2ECmMI5J0minIc/v0DsCBibxKIHi2ZyrXU8lNNcTT0zgR862HuvQeozb85WxfNYRpeCHO79Nbo7tmFC5JRdlWb7VWsvpk1xgqqBCeJdD048CIXoHCQBgAVwMYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129778; c=relaxed/simple;
	bh=UIkyHk0Xrpb3nFwgxB8b4vrx0AE4vy0V2h46frvq3QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRR5OAHcbueLRzWkkedbkIy+hoh0xGgYDaTbg+NZAV3hCclzQLIXDOJH2iK8aZdevfM4orKUP78Z/4aoPw+qqaTTOhRIGm0d1oAXgrpG8jYHLMjBoM4QLPcrMzswoBd+mS39wtJ1m/XKLCcUin18ZpskoiXQ6cm06KCkp+Qaipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFxWxnkX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773129777; x=1804665777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIkyHk0Xrpb3nFwgxB8b4vrx0AE4vy0V2h46frvq3QU=;
  b=gFxWxnkXKYcK1ojRoYVbPtGqyT6hv1MgooKuKS5HIn7MmqcpEd78L+Xr
   mTBPWIWzbLOwfZuUG1+nH/UeTm0ulNgPyY2CGNHZfZuHsyU4PQa/E2Pg6
   e/CPttyudztxDlgTSRnTY8AMaRBse3AgNSUJlBGdfjQshRT7EbFdVhQ0c
   E/VnG466O7A040AJGWhuUmnFsvdlF0nvOrdC7B7ghsEXh0tPHDDtb2spN
   vDQLXVRQR1qRJXG04PfPwgGduPhrqKo4j5Qx8GXCWAECtNxR16GERQK1I
   pPFRkiPshQHufqjDA422FBQIYRarRt7Mc1DqhVD37wMuHH6jWr6+cDF6d
   A==;
X-CSE-ConnectionGUID: f59zXEVQSKOpyV5RT+xz+Q==
X-CSE-MsgGUID: lifUZVo4Sb6A92AJ7gz5RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="61739370"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="61739370"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:02:57 -0700
X-CSE-ConnectionGUID: IkDmMhYmT5iW9OHqtQ++qQ==
X-CSE-MsgGUID: vufHmMbPT/uVZPYoZv0zPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224193223"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:02:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8FDD91206B6;
	Tue, 10 Mar 2026 10:03:26 +0200 (EET)
Date: Tue, 10 Mar 2026 10:03:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 6/6] media: i2c: og01a1b: Add support of 8-bit media bus
 format
Message-ID: <aa_QTps_Ft3zsgWY@kekkonen.localdomain>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
 <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
 <aa61R5mcCE1zu125@kekkonen.localdomain>
 <aaea7acb-87d9-4cfc-8af2-fe630c3c0095@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaea7acb-87d9-4cfc-8af2-fe630c3c0095@linaro.org>
X-Rspamd-Queue-Id: 8A974246EB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55047-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Vladimir,

On Mon, Mar 09, 2026 at 11:56:03PM +0200, Vladimir Zapolskiy wrote:
> Hi Sakari,
> 
> thank you for your review.
> 
> On 3/9/26 13:55, Sakari Ailus wrote:
> > Hi Vladimir,
> > 
> > Thanks for the set.
> > 
> > On Thu, Feb 26, 2026 at 03:37:39PM +0200, Vladimir Zapolskiy wrote:
> > > @@ -627,6 +632,14 @@ static int og01a1b_enable_streams(struct v4l2_subdev *sd,
> > >   		return ret;
> > >   	}
> > > +	ret = cci_write(og01a1b->regmap, CCI_REG8(0x3662),
> > > +			(og01a1b->code == MEDIA_BUS_FMT_Y10_1X10 ? 0x4 : 0x6),
> > 
> > Does this configuration have a human-readable name? It'd be nice to use
> > that instead of a plain numerical value.
> > 
> 
> If it has, it's not known to me, unfortunately, I cannot add a meaningful
> symbol name here...
> 
> The 0x3662 register is one of many analog control registers, the upstream
> OmniVision OV9282 sensor driver shares a hint that BIT(1) of the register
> changes the media bus mode from Y10 to Y8, and due to my tests it's right
> the same for this one OmniVision OG01A1B sensor, thus it allows me to add
> Y8 support to the driver.

Could you post a patch that adds a comment along the lines above? I'll take
this set now.

-- 
Kind regards,

Sakari Ailus

