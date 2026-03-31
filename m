Return-Path: <linux-media+bounces-57717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKvkCT9yy2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:05:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC8364C2E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DD6930584A3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A5C3B4E9B;
	Tue, 31 Mar 2026 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6afqY4r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DC146A66;
	Tue, 31 Mar 2026 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940575; cv=none; b=fkZX9EBg3KKdPgxjKK5uhexyFzvYAgS6EjeklqiTI5uNRgYL+37YipVoPN1aN3hJNcjD/jufVM9MgICrDOzwEMVkxu5+ftRbcnfNok3ZOqw1DgwFILiBIhdpFQAURad2OHmQUveUXc6+0lurDN79M3I5MiwQv80RnGfzJaA88O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940575; c=relaxed/simple;
	bh=yt9o+hP525Oxql1j/peL75RWbfKyVjlXzURR7373UqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ka8VQMDc0brDnqvr459TVvzrDDRmAVQGW9KEt7YnKkNhhRex/IXd/89zU4y9lSTINUYMAs+Hj4kX2SwDl/WDl0qC+t58ez0fkG3ExashiIfqJSglxHLnYogdSNe1HYPVN7uP4lHVrmJSa1zdvGucW2GhDuPKdKAlHSiqtu43mP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6afqY4r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774940574; x=1806476574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yt9o+hP525Oxql1j/peL75RWbfKyVjlXzURR7373UqE=;
  b=k6afqY4rMs/43BmdKoPcayEl2a1QYA4NMGm2V8YZV3dDCYn6A6qDH3sf
   auvLZIrpPw+75LRsTNU7Khrzs6DwjHKZSBmblc9TyHnp400T243vXf7Ob
   9Wp2db8MFHPY7Pt9stHwbxaSfqvp+SARDEKkX6OUnT7TniXiyrEdxH+Me
   JMV1JCRRqEYB7LEYEOF6jJLEvVb75AlD1NzH3rE6PCFRXd2rcQyc8T+Me
   ADAB1xXXOQKnJoLj6ZcsJ5i7oZqfOzM+EZpKkOQMwkvK9vq/Tn4/06+OU
   aCMVkJBMQP800F8hUc4xf8T8Vr6NYpDpmsXpQZun853AitZfS/31IxOHR
   w==;
X-CSE-ConnectionGUID: EqasG9K0TG6De97H1nFDNA==
X-CSE-MsgGUID: VppXuF84QCysb5aqSysJBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79545029"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79545029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 00:02:53 -0700
X-CSE-ConnectionGUID: EilyfNbITeSJwrNzdhz4uA==
X-CSE-MsgGUID: u2eMCNNLQkmmy/GQ3a7TUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249494457"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.233])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 00:02:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 536DA121CF2;
	Tue, 31 Mar 2026 10:02:55 +0300 (EEST)
Date: Tue, 31 Mar 2026 10:02:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: David Heidelberg <david@ixit.cz>,
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
Message-ID: <actxn5kvN3auqCBm@kekkonen.localdomain>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
 <acHxgIsyPiQTeqCB@rdacayan>
 <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
 <acJuN_FRqMTGgl8C@kekkonen.localdomain>
 <acsjH0tZ-jj7N7c5@rdacayan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acsjH0tZ-jj7N7c5@rdacayan>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-57717-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,intel.com,collabora.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid,1a:email]
X-Rspamd-Queue-Id: 80EC8364C2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 09:27:59PM -0400, Richard Acayan wrote:
> On Tue, Mar 24, 2026 at 12:57:59PM +0200, Sakari Ailus wrote:
> > Hi David, Richard,
> > 
> > On Tue, Mar 24, 2026 at 10:35:24AM +0100, David Heidelberg wrote:
> > > 
> > > 
> > > On 24/03/2026 03:05, Richard Acayan wrote:
> > > > On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> > > > > On 17/02/2026 01:27, Richard Acayan wrote:
> > > > > [...]
> > > > > 
> > > > > > +&cci_i2c1 {
> > > > > > +	camera@1a {
> > > > > > +		compatible = "sony,imx355";
> > > > > > +		reg = <0x1a>;
> > > > > > +
> > > > > > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > > +
> > > > > > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > > +		assigned-clock-rates = <19200000>;
> > > > > 
> > > > > Extract from #sdm670-mainline:erebion.eu discussion:
> > > > > The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> > > > > driver can operate only with 19.2 MHz.
> > > > > 
> > > > > I assume it would be worth it mention at least by comment here.
> > > > 
> > > > This might set the series back because the devicetree isn't meant to be
> > > > written for specific software, but it's included in v11 because you
> > > > already asked twice.
> > > > 
> > > 
> > > I would say node with lower clock frequency is still much better than
> > > nothing or placeholder saying "i2c camera here". Instead we'll have small
> > > placeholder that value can be bumped to 24 MHz. Important is this can be
> > > easily improved when at least one consumer of the device-tree gains support.
> > > 
> > > We have very scarce support of cameras on mobile phones in mainline, thus
> > > leaving a comment that HW can do 24 MHz is reasonable compromise IMHO.
> > 
> > The bindings could document the supported frequency range.
> > 
> > In DTS it may make sense to set the frequency the vendor uses as it may
> > affect the link frequencies (albeit I guess they're the same in this
> > case?).
> 
> Is this review relevant to v11?

I'd think so: it doesn't mention the frequency should be 24 MHz.

-- 
Sakari Ailus

