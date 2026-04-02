Return-Path: <linux-media+bounces-57938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDeGHOtEzmlQmQYAu9opvQ
	(envelope-from <linux-media+bounces-57938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:28:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FCB387BB3
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F310730850DE
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 10:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4C43E0222;
	Thu,  2 Apr 2026 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nj+VZOOS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4643DE435;
	Thu,  2 Apr 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125606; cv=none; b=JzoKURq5kHj7eY1GWzH7Q41WEB2X7F/XlegRAU7NbvIAD18OmVcahcDVM+z8cLnvzuCJOXYi/iluRR0CYbLc7S1/l2E39IOMZP153jtdhl81W/HHl2iT85oAbhq7TK2q7Rrha1Q852Wj4AH+YdX0uHmOsAPL/bhorGvk7xb5lN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125606; c=relaxed/simple;
	bh=BBeXGWhcvUJnfzqhYLOgsM1/+k2cjwgCvV0ZQ+52G+w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PuOufHtyG90dMq5AFjZUFngU2NavJGLS0LvBhQt8e1cwuPIbDZJrgEeyTyCe9t1UqJjSgsntv9xQ0xRm9p3EZtJfOdlvxS5xU4vX03YInVCkuwt6XYVUXqiMFbelSxjF3wgKF2fvLBtVKghuODLgAfoiJfpRVrQniHe7FzDA5QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nj+VZOOS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775125605; x=1806661605;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BBeXGWhcvUJnfzqhYLOgsM1/+k2cjwgCvV0ZQ+52G+w=;
  b=nj+VZOOS2jBCPKrAUuPnSu/0P/Oi+tC5F0QRNsOQytwJFQ5ysg2ujCJT
   N4GZ7MuYJcLRLFO2VNvbv2bxb1zBAY9zA9bKWeOFL8Mp09j1OUqIUKPhn
   V1VVXKkVQV4DZsMymbMGoFKMAQNGsN5B99kcVvef5u0ctRqIASm+Men8S
   AFG5ebn62bu7K7GbqkNkEkz/UW/qXK23uLF5DrRPkfOyfQLLCeXvgO2u0
   3xB3UYtDlOLp+nPpNFczrlM0aOSeYwNhorNH5A2zmmhsOvlvF8999Osyt
   rMUD1V/vkfzLehI23i3vuoPxdGtZCsJZSS8tb31ac065RnDaWMSdX8c/j
   g==;
X-CSE-ConnectionGUID: pQsNIEwDTualHDJEwzhJLw==
X-CSE-MsgGUID: LxVF4m20RLCyzSifIxP2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="79787828"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="79787828"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 03:26:44 -0700
X-CSE-ConnectionGUID: IXEcxxhJTWGN6MSot3zuaA==
X-CSE-MsgGUID: Gl88If80TL63ZnM76H/KBw==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.76])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 03:26:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 2 Apr 2026 13:26:38 +0300 (EEST)
To: "T, Arun" <arun.t@intel.com>
cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
    "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, 
    "Kao, Arec" <arec.kao@intel.com>, 
    "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v7 2/2] media: ov13b10: Support multiple regulators
In-Reply-To: <SA3PR11MB8022E9841A586040992170349D51A@SA3PR11MB8022.namprd11.prod.outlook.com>
Message-ID: <87b17e27-4aa4-485a-5a3f-c3de2ccada21@linux.intel.com>
References: <20260401122030.3955499-1-arun.t@intel.com> <20260401122030.3955499-3-arun.t@intel.com> <ac0SWIPXv6SQo2zy@kekkonen.localdomain> <SA3PR11MB8022E9841A586040992170349D51A@SA3PR11MB8022.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57938-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E7FCB387BB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026, T, Arun wrote:

> Hi Sakarai, 
> 
> Thank you for reviewing my patches and for your comments. Based on that, I added you as a reviewer.
> 
> The other reviewers explicitly asked me by email to add their Reviewed-by tags, so I included:
> Reviewed-by: Daniel Scally dan.scally@ideasonboard.com
> Reviewed-by: Hans de Goede johannes.goede@oss.qualcomm.com

There are both misformatted.

-- 
 i.

> Sorry for the mistake. If you do not want your name included as a 
> reviewer, I will remove it and send a new v8 patch series. 
> -
> Regards,
> Arun T
> 
> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com> 
> Sent: 01 April 2026 06:11 PM
> To: T, Arun <arun.t@intel.com>
> Cc: johannes.goede@oss.qualcomm.com; Kao, Arec <arec.kao@intel.com>; ilpo.jarvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@vger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Djait, Mehdi <mehdi.djait@intel.com>
> Subject: Re: [PATCH v7 2/2] media: ov13b10: Support multiple regulators
> 
> Hi Arun,
> 
> On Wed, Apr 01, 2026 at 05:50:30PM +0530, Arun T wrote:
> > The OV13B10 sensor driver currently handles a single regulator called 
> > avdd, however the sensor can be supplied by up to three regulators.
> > Update the driver to handle all of them together using the regulator 
> > bulk API.
> > 
> > Signed-off-by: Arun T <arun.t@intel.com>
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> You can't add Reviewed-by: tags that haven't been explicitly (or otherwise) given. I haven't given mine on either of the two patches, for instance.
> 
> What about the other two?
> 
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com
> 
> --
> Regards,
> 
> Sakari Ailus
> 

