Return-Path: <linux-media+bounces-51719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHh+IwfCeWl0zAEAu9opvQ
	(envelope-from <linux-media+bounces-51719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 09:00:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9249DF3A
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 09:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 091E83024A48
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 07:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C635032C949;
	Wed, 28 Jan 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyXUMY6b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CF32BF2E;
	Wed, 28 Jan 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587161; cv=none; b=RqCujCoOXA5rKHH8yDEO1Hvf4834eJ/c2hQAW6zW6pGQG1fQmNxo7PCbiOrUv6xGl3LWAAOUaHwq/BG2x/1bE+YW9RcO39KRKrE69votogJGBItGffcBEEgkuF/Z5A1k9hcmQk8/5P+kY2qOhIB2PT+/6H6vOZhQXFdxB+8dI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587161; c=relaxed/simple;
	bh=bLrxrtaKEb0EIqN05MhZumlDxMxzAI3JunezXZpTj3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OT0GfvPghCbduVRxwpROHVHZ2YZ7wwbuP84hTxvFYjbjtpcCShyRxQRT00u2wNql1TiSwcwoJRgNSq9YHVjgTZd5C1TaLtHaejrhoVVKvrJUPIu1aRh3KA43lwdHPOYFl3DdLud5fOpHd1wF2hckWVWiJLlx9siSZcQWrPjQ0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyXUMY6b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769587159; x=1801123159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bLrxrtaKEb0EIqN05MhZumlDxMxzAI3JunezXZpTj3E=;
  b=EyXUMY6bWQ9zgHZf9zod8yZwZlhU0YvGdVLezgYgOqcGMyqE99KCsUUP
   m9/FNJpxoHeEqEPGaVAuKFcBv1ZXCz7Mdym9NbkGZjSjDv/k4KhZmH238
   5YLT7473+kEJHVruRm3IUcYIAPWkPSgNur+/dpXS2DqTxCTYyriB/jIsj
   PpWngT7TwoksSsLEf/j4R7Oim2c8ePvCNrfucu+Witgqwcu0KIDDiDaOL
   2XoqIkbOPXDkaKZM+C0ED5R+tXma64du4b3KCzs3VetHoGAAGnMhRsKmW
   mfE+405ZL4mSRDLKn/VXnbzoOJ/LZ6n90JBA9F0WzwPR/UGzFgxRXEWEb
   g==;
X-CSE-ConnectionGUID: aMk2igRwTC+JmgmMhJgXFQ==
X-CSE-MsgGUID: PZMJOQu/R62S8qLYWkjcYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88213354"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88213354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 23:59:19 -0800
X-CSE-ConnectionGUID: 5zo4JnMQTI600qsDecQFhw==
X-CSE-MsgGUID: O2q+B3eCRc+ROdb41+pwtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208439050"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 23:59:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BF78A1207FB;
	Wed, 28 Jan 2026 09:59:20 +0200 (EET)
Date: Wed, 28 Jan 2026 09:59:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aXnB2FUgb5OlGjfn@kekkonen.localdomain>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
 <aXl6MpRB9ncCeu2M@rdacayan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXl6MpRB9ncCeu2M@rdacayan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-51719-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: EA9249DF3A
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:53:38PM -0500, Richard Acayan wrote:
> On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> > Hi Bryan, others,
> > 
> > On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > > I think reset should be asserted before regulators and power are switched
> > > on. i.e. before you try to switch the chip on, you should establish that the
> > > reset pin is in the state that the timing diagram calls for.
> > 
> > Indeed.
> 
> I think the discussion is more about whether there should be an assert
> in the same function as the de-assert.
> 
> > The xshutdown pin, as it is typically called labelled as "reset" in this
> > case, functions as both hardware reset and hardware standby mode control.
> > It should be asserted (i.e. be set to low level) whenever the sensor is
> > expected to be powered off. Typically deasserting it is the last step in
> > the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> > (parallel) camera sensors. (There are some exceptions that use explicitly
> > two GPIOs for similar functions but there are very few of them.)
> 
> This patch has the reset asserted by the time it gets to
> imx355_power_on():
> 
> - when coming from runtime PM, the suspend callback asserted it
> - when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
>   active-low also affects the initial output setting)
> 
> Should it be asserted again inside the function, or
> should the initial `gpiod_set_value_cansleep()` be removed?

Please remove it as requested.

-- 
Sakari Ailus

