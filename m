Return-Path: <linux-media+bounces-60112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFWJJKG+82mw6gEAu9opvQ
	(envelope-from <linux-media+bounces-60112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 22:42:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB84A7D8B
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 22:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6B4C300E5B3
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF4B3AA1A7;
	Thu, 30 Apr 2026 20:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brOTbxfl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E7A37F8C5;
	Thu, 30 Apr 2026 20:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581724; cv=none; b=cHpTbAqKqCcsNSb33AQYZIC73mWcZuxxY9KIg5gcItcSHCEg6MfXkLcHK0V1+pBrf3Ot/HnZKBxujzp2DbhuTjVxPhulGeR+9uca6HYszdaq4c3Gwxd3Y9AdmIg8YRQm1VMlsKkslDGhAdkz4rFHJoX/D7R8X1OXQU/f6/LNvSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581724; c=relaxed/simple;
	bh=SF61RjFeriGYp10aHSQ3fgkmUsJKoQcTEAr6oGybJbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnFTiz88TXiObKUaUoO3SOSS+pKmYvS1Wbk16z9EWRqT5xAMWBgrQ7ka1DvP+XhKced0E1tc0t6ieMGkH5Ry7ckF5Uc6mC2m7xjK98RdiiouWWuptFWXFKA5wEo4XAM/KrkywB6cfb7o8v33fEuaKcRBi3yAfiV0Apj+r1CD5tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brOTbxfl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777581723; x=1809117723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SF61RjFeriGYp10aHSQ3fgkmUsJKoQcTEAr6oGybJbw=;
  b=brOTbxfli+mLNiUN5tbiTXVlwnxqD+9qK1YGA0F3b9qdgJFQ70IAxfbi
   vIqwpDYp0Gw+4ZkjkOP2b/gMh1SH61fJiQ5YPshG94B2eH59xNsyf3eh+
   ZD82VAG+RECzLU5G8pESUn5uUt0F/wSUQ11HDsdmenDh7kbZ2vEPGkpwN
   /yCqAElccSIJ0ktSg5jTwMQM8F9qEYKBCHxgkrVlETXQgw92bHP3I4IZ+
   0JXLRH+5SievfLdrKpNQirU2WKoUZfxvAvHj35XpkRQyyoAL4R88qQo2X
   5Gcx9sifMcLZJU+mgBLQRhft98jNmsdYEsM+pVRXsmWVR7JCYwL6Sya4t
   g==;
X-CSE-ConnectionGUID: MC58JYhsTiu2Bf1Hqd1mLQ==
X-CSE-MsgGUID: yTzYAqwxSOWXt3aCDvOF8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="104003720"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="104003720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 13:42:02 -0700
X-CSE-ConnectionGUID: w84KkCgcQdCeWjzXnn5Csw==
X-CSE-MsgGUID: ew5vami+SIeLcBZ3z71r2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233649506"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.197])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 13:42:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EDE61121CC0;
	Thu, 30 Apr 2026 23:42:04 +0300 (EEST)
Date: Thu, 30 Apr 2026 23:42:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <afO-nOr2JUfm2dUA@kekkonen.localdomain>
References: <20260428113923.112920-1-clamor95@gmail.com>
 <20260428113923.112920-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428113923.112920-2-clamor95@gmail.com>
X-Rspamd-Queue-Id: 15EB84A7D8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60112-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Svyatoslav,

On Tue, Apr 28, 2026 at 02:39:18PM +0300, Svyatoslav Ryhel wrote:
> +  flash-max-timeout-us:
> +    minimum: 32000
> +    maximum: 1024000
> +    default: 32000
> +
> +  ti,peak-current-microamp:
> +    description:
> +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
> +      When the current limit is reached, the LM3560 stops switching for the
> +      remainder of the switching cycle.
> +    enum: [1600000, 2300000, 3000000, 3600000]
> +    default: 1600000

I missed earlier these limits are of course incorrect for lm3559. These
would need to be changed for the lm3559, too. I'd just drop that compatible
for now.

I can do that while applying the patches if you're fine with that.

-- 
Regards,

Sakari Ailus

