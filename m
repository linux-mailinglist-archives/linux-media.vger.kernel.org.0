Return-Path: <linux-media+bounces-56859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKuaERZwwmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:05:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3100306FB7
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 767B430D3E4B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC33E5EFA;
	Tue, 24 Mar 2026 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYYLU8j1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0651DFDA1;
	Tue, 24 Mar 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349883; cv=none; b=uowGDN0av8OlMTyXPGDyD/hNVCHM48HCM4DABv0TINYowCscrme0kECdAEZjCpjQ/byQGbz6r+XgYwnTld5FPxKEbRKDadQBOBG+4Mv3OSy6G9fFr1DJ0BE2cgyDquU2bea3IUU2pCVlQoY7dWHha7TYjuBTcrhoei8y9pMeGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349883; c=relaxed/simple;
	bh=8WjlJNtSutvMbt5nV27U6C+ZXtnMIWF3nhKNVxC6/MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMjl6GdlUAA54Gp6mWWNa7v3kwR7Os7ckID7Hl4NwP0aHUvMiNv9EJGosowDOUjLeAZR8GRs3VfOsYgRfVHB2bW3n8sYSfCyfTYIe+2cZCUehrWxQu10lV0V9RPrKlqMaFHcsAOskgsgaNjkwVKTnGRuP8Wm7T+XEtQobZgEq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYYLU8j1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774349881; x=1805885881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8WjlJNtSutvMbt5nV27U6C+ZXtnMIWF3nhKNVxC6/MM=;
  b=MYYLU8j1cwYfyqP0hDeoe6XUZWbDnZ9MQ/wLE+uXHvZ0Eg7ac1OY/7RN
   yRa76iCg/cYBNLB+zSDbo0mwJHo14UgGYMcuzq7XlKRda8Oiu76Kyr2ka
   gZSTjAmjWduPMVZi2DuZQdqcRB1rLqlOP9MSk1zCxaAgxS/SLpPKR1clo
   hEBEBp2+ujzTg7r/p2kpnEGHdxCxcrjSQl0yNDofQNw9MmL4Y6oNv1rJw
   +tMkpmxkHd1OWlcyiQLXwg6Plq0HDFnrZrOvAPq4iyEPEtLNsGhO4sgjF
   SiCgdhqlhIhxIm4yhAQ4qc/z21X93LQ6U6bEs4hPRrRPfKVW5mClowsGJ
   g==;
X-CSE-ConnectionGUID: CF6iNlaCTQeGrZdSn6sMrQ==
X-CSE-MsgGUID: FqX4aq79SB2AFgpPUcjoew==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75246615"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75246615"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:58:01 -0700
X-CSE-ConnectionGUID: kMuMgcg0QSGNJtzSedmgsw==
X-CSE-MsgGUID: elRKXxBkQviX/opiSfcydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229069864"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:57:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B9317121CFF;
	Tue, 24 Mar 2026 12:57:59 +0200 (EET)
Date: Tue, 24 Mar 2026 12:57:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: Richard Acayan <mailingradian@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acJuN_FRqMTGgl8C@kekkonen.localdomain>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
 <acHxgIsyPiQTeqCB@rdacayan>
 <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,intel.com,collabora.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56859-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B3100306FB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David, Richard,

On Tue, Mar 24, 2026 at 10:35:24AM +0100, David Heidelberg wrote:
> 
> 
> On 24/03/2026 03:05, Richard Acayan wrote:
> > On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> > > On 17/02/2026 01:27, Richard Acayan wrote:
> > > [...]
> > > 
> > > > +&cci_i2c1 {
> > > > +	camera@1a {
> > > > +		compatible = "sony,imx355";
> > > > +		reg = <0x1a>;
> > > > +
> > > > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > +
> > > > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > +		assigned-clock-rates = <19200000>;
> > > 
> > > Extract from #sdm670-mainline:erebion.eu discussion:
> > > The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> > > driver can operate only with 19.2 MHz.
> > > 
> > > I assume it would be worth it mention at least by comment here.
> > 
> > This might set the series back because the devicetree isn't meant to be
> > written for specific software, but it's included in v11 because you
> > already asked twice.
> > 
> 
> I would say node with lower clock frequency is still much better than
> nothing or placeholder saying "i2c camera here". Instead we'll have small
> placeholder that value can be bumped to 24 MHz. Important is this can be
> easily improved when at least one consumer of the device-tree gains support.
> 
> We have very scarce support of cameras on mobile phones in mainline, thus
> leaving a comment that HW can do 24 MHz is reasonable compromise IMHO.

The bindings could document the supported frequency range.

In DTS it may make sense to set the frequency the vendor uses as it may
affect the link frequencies (albeit I guess they're the same in this
case?).

> 
> I personally got confused why Android sets higher clock, thus it may happen
> to other people looking at Pixel 3a as an example for their imx363 bring-up.
> 
> David
> 
> > The frequency could also be stated as having "better software support"
> > in general without mentioning Linux as the reason.
> 

-- 
Regards,

Sakari Ailus

