Return-Path: <linux-media+bounces-51142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAbeKzG9b2lHMQAAu9opvQ
	(envelope-from <linux-media+bounces-51142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 18:36:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A36948AA0
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 18:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D1B147A3F09
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 15:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABB844CAE6;
	Tue, 20 Jan 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFT8aE1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1440FD83;
	Tue, 20 Jan 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920565; cv=none; b=MP6oN6DGlWSaHDfX6Yy+jqnJ/1+YiEJjV9WvUBeK8LXI7K9xtXC4px2T+f+xp+amk6Wu3UNI2uQ5IWh0k4TZzw5m8NOqPXp8X609l35yvXmDCSZMkgTubIhvxkxWzgbOfZ8dTBC0F++772iMD43GX8EaknCZw2LM6ULiyk1PcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920565; c=relaxed/simple;
	bh=nULy7iP1bl6qjT9VFD0rfE4QULF0hzfHdm7VN2KfVMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwwRBOsky5KicARzwnhvXpyY9a1nGYBi/TX7+q+SahzbgEo6q5yaNSEuFiwvliwmvJopZYgsE1vNKXOyM2uwYXKXOXKkga4ObS5k77P/UVJf/ZPMF3NS/dMbJUbpS6gMNppTSeuYEITPi6Y26J/aNiXYe18rf1MQshxykcjLh2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFT8aE1L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768920563; x=1800456563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nULy7iP1bl6qjT9VFD0rfE4QULF0hzfHdm7VN2KfVMg=;
  b=KFT8aE1Le3Dpf/5rQNV0fhl/h22E/jipDf+Rknu0aY/VMskWehSrKezG
   qvi96kvSqkK3/2cjY4lSJ1hIGfqGJDleN4/Yc8y/AVSRy85QUz9Pbg8Uj
   R5pAebsjtIQLtux6bzuPYbbj/KKkxa0xyYxgHr3k6boZ8mzJsP/cTg+FS
   IrOXeER60CR921F5la7Mva3hGo0SELDLsAYL4zfTrTuG9sByW4ilagX/i
   9Qlxp6LiNDR3XOESXKAcVPUu5JAhJm6ZHJrohZKeIA/NpH+GHIqDtaBG/
   CL3Q9/9wmiA4McZlVe+rto2PImKPpHOnIHenxyys0CchgCT2XXWoRatOI
   Q==;
X-CSE-ConnectionGUID: V8orAiS6Tv2YHBaLvr4+rQ==
X-CSE-MsgGUID: sU4TfuPJQyOgPgVYsXnlOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70102250"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70102250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:49:23 -0800
X-CSE-ConnectionGUID: LewO+RjgT0WgtrthwjMNIg==
X-CSE-MsgGUID: Cmu3ZY1WSJCS6EYI+guxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="211142150"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:49:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D62C511F82F;
	Tue, 20 Jan 2026 16:49:21 +0200 (EET)
Date: Tue, 20 Jan 2026 16:49:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Richard Acayan <mailingradian@gmail.com>,
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
Message-ID: <aW-V8VTcOICLWqaU@kekkonen.localdomain>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,vger.kernel.org,collabora.com,linaro.org,ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-51142-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 5A36948AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan, others,

On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> I think reset should be asserted before regulators and power are switched
> on. i.e. before you try to switch the chip on, you should establish that the
> reset pin is in the state that the timing diagram calls for.

Indeed.

The xshutdown pin, as it is typically called labelled as "reset" in this
case, functions as both hardware reset and hardware standby mode control.
It should be asserted (i.e. be set to low level) whenever the sensor is
expected to be powered off. Typically deasserting it is the last step in
the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
(parallel) camera sensors. (There are some exceptions that use explicitly
two GPIOs for similar functions but there are very few of them.)

-- 
Regards,

Sakari Ailus

