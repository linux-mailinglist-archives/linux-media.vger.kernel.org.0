Return-Path: <linux-media+bounces-56845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ju+HVxqwmlScwQAu9opvQ
	(envelope-from <linux-media+bounces-56845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:41:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC0306986
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DCB307BF16
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9E33E5570;
	Tue, 24 Mar 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNNcTAdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86FE3E2746;
	Tue, 24 Mar 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348518; cv=none; b=suWDg97Tw1SUa57eG9QEVxQlGpS8yORkKDeQ9CK4gTOwt0RNhNzQ6iZpUfVyFTKPOa3brvFdpSlfCtvJMBRL/4EBQOJ7OrAX8JKB/CiWZq3GeOXD+Q40kzhuMfWX8CHotkaDoEFdL2qFzE+xv9Sf9NvKdGVcVPJnwRHVBAyjm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348518; c=relaxed/simple;
	bh=hAR97mSfzBsK6s2/V2lxo/QMFvGGs27xGdB50d/Icsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfPfBBQerFh+x9tkXIksVr821e8ZqckCyUoqxjftbwHty1HX6kILDWMfqgz3DYG7BoBss7C2vxXdKKNMkOrLmHc0hfU8/czcZ0XVdHaCuhtZtf2dy/GaqhCX9JUCvwXDtzbxqNIz0fibWUb3XC0lGqUQM38ojd/Q3xP2X6lRg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNNcTAdW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774348515; x=1805884515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAR97mSfzBsK6s2/V2lxo/QMFvGGs27xGdB50d/Icsw=;
  b=nNNcTAdWTxJcZjEYm0+APYUV9UyVfXFcxhg3T0rXNmCdibxvNrxmisLY
   b/Zw72FCz7uMUMmLCVJkHSTToi+MYVr1BzZxue28aAJhV1R/BRqAeCQE5
   roWjWcNqmBN2K8+eqGEqJDPDDn0t5mCU2cNgMO/Xs0Zr1pDCmKLBCp/GM
   S8Dcaiz7bI1aykf/JnjhP80vNub4WhpaWJ14sNM3BHzzRfi0VMdh0ArFp
   SKp5VdehOKrJllUFIl1Z0cA+zy3xqU4GgPVyTUltnb2qmTMdC2CdKGNYL
   6FJ9K0uPidorglbvVjSfJiqHqsCsBjL0YDTztymNfkSryUbURIlfAd6n0
   w==;
X-CSE-ConnectionGUID: H9Ds6WHoQ4WV7tvd+ahjUg==
X-CSE-MsgGUID: Lu+L0GeuSIi0A36oskHIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97978533"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="97978533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:35:14 -0700
X-CSE-ConnectionGUID: JzFhO/gaRVC88UXRsJRd+A==
X-CSE-MsgGUID: ovTG8psfRoShtwdAORxHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262239026"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:35:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2B5CC121CFF;
	Tue, 24 Mar 2026 12:35:14 +0200 (EET)
Date: Tue, 24 Mar 2026 12:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
Message-ID: <acJo4qamh9edxqb-@kekkonen.localdomain>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
 <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
 <08e6b649-61ac-4059-a914-c537b5c4da7e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e6b649-61ac-4059-a914-c537b5c4da7e@collabora.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56845-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,collabora.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1CC0306986
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On Tue, Mar 24, 2026 at 10:46:49AM +0100, Michael Riesch wrote:
> Hi all,
> 
> On 3/24/26 09:18, Sakari Ailus wrote:
> > On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
> >> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> >>> This 3rd time try to support DW CSI2RX support for imx93.
> >>>
> >>
> >> Laurent Pinchart and Sakari Ailus:
> >>
> >> 	I am not who will take care this patch?
> >> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
> >> by Sakari Ailus
> > 
> > Michael seems to have questions on the last patch, too.
> 
> I.. don't.. think so. After digging a bit in my memory and lore, I found
> a v3 of that series with my Reviewed-by [0]
> 
> [0]
> https://lore.kernel.org/all/20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com/

Message-Id <9e14d605-9419-441e-a554-432d435191b3@collabora.com>.

-- 
Sakari Ailus

