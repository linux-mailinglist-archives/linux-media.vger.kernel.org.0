Return-Path: <linux-media+bounces-66954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zx/PLNUGTmp7BwIAu9opvQ
	(envelope-from <linux-media+bounces-66954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:14:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D672305C
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:14:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=iLqV6ggh;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66954-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66954-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A72304C105
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 08:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0223FADFD;
	Wed,  8 Jul 2026 08:00:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC9A3E0C4C;
	Wed,  8 Jul 2026 08:00:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497624; cv=none; b=Q0vTaCBdT5AgQAe93hYL94gqOus/vq53JdB3S4wo+dxVH9ZVOptzWdnaMnA+b3DQfzrvDK0MuY0azUvQdYzYlEm5dFsrJze+ySBfF3yEQjRB4/Cjw5ystpW7ttwWDAcX2kytqAR/afP8PpIN4ec8RshwAlt3PrSmbS+zWx/9Tqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497624; c=relaxed/simple;
	bh=nRGza4Sc0YOcCy4AzAZup761YMetwR27gyX3jxhc7M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgZWAihHc5NZIbHOBydQWQZirWGBqiLOymb0f38RZ2EOcTq5hHOwXExu/NlOmoj2wp+gN5Dg5fZEnTqhjafou7euZuIYifTm1Hs7fhBz9xBE2CzPodW4BDRvQ9kasOjym7CMeyQu3XaRiRltnURnPoqKVq6v+1L5VjKyL152HnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLqV6ggh; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783497617; x=1815033617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nRGza4Sc0YOcCy4AzAZup761YMetwR27gyX3jxhc7M4=;
  b=iLqV6gghxrn3qLuUfJ9iFA0KSimvdrNiewEGuIIAhDoXKOksQtbztVh6
   zKPB8raDYrLxl5L67qQycdiwonYS4Kn5WLKLrFv0wpMr2X4NNc4YhXTlL
   pI4ZriX9lVHdL3pWyeS10TJz/XV9epoQyoiV3qiqUL9j6WFm/GG9GptO/
   QMQOMmGFk+k5O3WSecMl6VCS60Adri0DD8XDPLjnZo0Uy76tgZdRYySGW
   hNoaWRo8j96IGv+YIXKYePOvIaZB8gkD9SO3obSUMqC/O+7QIVQDVb1Jp
   1jDLnwyQT68plvyW9YfGsezLXa7KCtLQej2mHT0EpIM+dVGET9ERc4K58
   w==;
X-CSE-ConnectionGUID: WD2wmYoGSBGc7STh8Zmmtw==
X-CSE-MsgGUID: ono5PSxrTtil1H21HUix1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83931656"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83931656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:00:09 -0700
X-CSE-ConnectionGUID: VcILiA6VQJSQf3hMPwqW1g==
X-CSE-MsgGUID: +iEUHChsTC2crytZtIPzXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253726411"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 00:59:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 122D211FB4A;
	Wed, 08 Jul 2026 10:59:58 +0300 (EEST)
Date: Wed, 8 Jul 2026 10:59:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
Message-ID: <ak4DfkbDlIvsGY_u@kekkonen.localdomain>
References: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
 <20260702-hm1092-driver-v3-2-85faa7ff4fec@gmail.com>
 <akkRRCaZMRyoWDt7@kekkonen.localdomain>
 <CAJTcUFQ3CJQhEv_N7L22FmQSJsGpfMvKO1F5wiEarNca5VmV5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJTcUFQ3CJQhEv_N7L22FmQSJsGpfMvKO1F5wiEarNca5VmV5g@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	INTRODUCTION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66954-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[libcamera.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,vger.kernel.org:from_smtp,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B7D672305C

Hi Ramshouriesh,

On Sun, Jul 05, 2026 at 01:01:13AM +0530, Ramshouriesh R wrote:
> Hi Sakari,
> 
> Small correction: my name is Ramshouriesh. You can address me as Ram.

My apologies for that, there apparently were quite a few letters missing. I
hope that wasn't the case with the review.

> 
> Thanks for the review. I’ll address the comments in the next revision.
> 
> However regarding the mode names, there is no proper datasheet for
> this sensor released publicly.
> I will add the proper mode names based on what the camera does in each mode.
> 
> And regarding the driver supporting single data lane, I will make
> data-lanes optional and
> will initialize the endpoint parser with a default of one data lane
> and configurations
> explicitly specifying anything other than one lane will be rejected.
> The binding will retain an optional constraint permitting only <1>, so
> an explicit invalid
> value will be caught by schema validation, but data-lanes will be
> omitted from the example.

Please just drop the data-lanes property altogether: the DT is intended to
convey the board, generally what's not discoverable or otherwise known, to
software, and there's nothing to configure here.

And one more thing. Could you add the selection rectangles and possibly
other API elements required by libcamera
<URL:https://docs.libcamera.org/master/sensor_driver_requirements.html>?

-- 
Kind regards,

Sakari Ailus

