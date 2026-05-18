Return-Path: <linux-media+bounces-62051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKhYH96DC2oZIwUAu9opvQ
	(envelope-from <linux-media+bounces-62051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 23:25:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 940CB573CBB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 23:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA4823033091
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 21:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4520139903C;
	Mon, 18 May 2026 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKJNBFPG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E33932E3;
	Mon, 18 May 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139499; cv=none; b=jKzAiiAXreiIojN2HPJ1g0PtU2dX6XviKzVf+wSaGcB8dNNUNR5ijg4wavq3BgloPuWiYyCuo+q8m8Fd5ajvzE8EwFhzHoA2miOjdG/ozKiIi1uLLhMudGj82NoNVOqmN3UPyUaxdTpdFpkZDGCuCQ6NcdnTay21pr/3sEQuSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139499; c=relaxed/simple;
	bh=c2kzgtlmuCmGBxKQy6f/nzlz7pz4BpR6cOyGsGOmzIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsHaVAi87144UzIdKG6bpJMMOIsS2iNsrraSsThbd6pPzBIvftXR2kDV4j/aFVHmWtO8XYPdLtVOkUDlv6nwehy+AGpexWosHscN3cc2VY1EG61icVA7bP56Usfn6W7bDbdsWJRyvtgQvc7V5s71d3R6PXYx2gZtL1IrKC7RQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKJNBFPG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779139498; x=1810675498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c2kzgtlmuCmGBxKQy6f/nzlz7pz4BpR6cOyGsGOmzIs=;
  b=nKJNBFPGiwscUa6nhcqUc7D+nL/eS0ed+O1n67svXgUd08ngJptRhpsl
   EgbPBRBSSna29YpRMtlMv7IFsvlnYOnDvEooP8W+yn0QrAEen8guFLKdF
   0rjYLf8c+cvzzwJ+kl4MestZrncODBAo6jpI5Qe+mxiFlNLYWrk1wcQ0K
   bl+8jUlkIDmQvSJWKnw6SB8mw78tFMP641c5LmxYejPq01swX3mmgfEQX
   bXi5/pLv3YVBq/CLxhM5E9NH0tX555k1elPNNhhSRC2e1Uhfrkh+to7MW
   jeFEdouRN6DChyWmwn8IvZcUvBxegSMjnrKrIzCe5l6P/pMAmxiK1DT5W
   g==;
X-CSE-ConnectionGUID: HQofODk1RsiohEG0C0gYJg==
X-CSE-MsgGUID: MC6kRpWZQoS0/ZGdDeCbKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79971701"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79971701"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:24:57 -0700
X-CSE-ConnectionGUID: vHo2P8J4SIeUpFshKCynYg==
X-CSE-MsgGUID: 2qCXkziwRuezElfXAOBE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="244553350"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.139])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:24:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0FE1120E58;
	Tue, 19 May 2026 00:24:55 +0300 (EEST)
Date: Tue, 19 May 2026 00:24:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95 support
Message-ID: <aguDpxP4SIcJWdcc@kekkonen.localdomain>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62051-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 940CB573CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guoniu,

Thanks for the set.

On Wed, May 06, 2026 at 04:53:59PM +0800, Guoniu Zhou wrote:
> This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
> with multiple stream support and adds i.MX95 platform support.
> 
> The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
> IDI is software transparent, only a different register map is needed.
> 
> Tested on i.MX93 and i.MX95 platforms.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

This doesn't seem to apply to the media committers' tree anymore. Could you
rebase it, please? (Or are there dependencies still out there?)

-- 
Kind regards,

Sakari Ailus

