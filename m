Return-Path: <linux-media+bounces-54931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP4HIcSPrmnVGAIAu9opvQ
	(envelope-from <linux-media+bounces-54931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:15:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF5235FC0
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8423E3058DEA
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DEC377555;
	Mon,  9 Mar 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR2+4DEU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3134037757E;
	Mon,  9 Mar 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047597; cv=none; b=BDjJnlkSNmLVRmgSdiJioFo3NZXNly0FNRCUB7HqePNgt6jyX6wsvyVKIXD0EuznR8HGRAlTZ5CgJVSfKfGjo/YzCaqNE9N1xs5JBFZFUgckjoz7ZuKc+yfBwkj0V5npR3rBCWmzC/GxW28A1asekhWrhoVY/TN5ZRrW/oA38Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047597; c=relaxed/simple;
	bh=DRPUogR0IQWY0r8T87R9VU7mPwvOCe+THpB967ZnVk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWJYDRWqnLwAJPO9mLYrzlUFqfEhoQ0eg+i/dByb+3JU0t2r6Hpkt4/heFQECFQKIV1czYT0T7OsLXsbmCy89tVNxey/htmQHygtJFgQcysipzXL3ZsJ+6E0yjR4RJ/r1gz4clhHblg/Vd5eFBnOCRoT+ow8psedf4mc6kWGOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR2+4DEU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047595; x=1804583595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DRPUogR0IQWY0r8T87R9VU7mPwvOCe+THpB967ZnVk4=;
  b=gR2+4DEUGZXPTR2m+0DJsA7nUEygDFE8Z+iwajVlTgAlG4ERremXLe5g
   ydmzwobCstzkjUxoCgtUACB8c7d+bNBgke0z3gRyoWvCAhN+UMEhpTQ06
   ktLU5qia5yCvSvTCRwooNwrH9S+tSG7ftw20XwGMoN3SF3P/6iLHG/4r3
   XLSoovBAi+86Suf854xF9YUibITcog5LR6yM4aaPgFpDtvLnUmuggJpSV
   sbF/NX/6rNW5RaZeUZeBIoYyt22pMmhKLRBiHr+8nM6jyeo639mtFp6kM
   9Vwaocpp6yObkUXXzwya9JOM+l+svw88yZ+1hJOVTjutFwwHtDxfYMjwY
   w==;
X-CSE-ConnectionGUID: 7ywRAoYVR1yrHjOwAiYhRA==
X-CSE-MsgGUID: sWAGIpcxQgWUe3FBLyBIjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99534434"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="99534434"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:13:15 -0700
X-CSE-ConnectionGUID: Gh950RknR4O4GwKf8LcT0Q==
X-CSE-MsgGUID: Ck6pzTqRStayoBDD0fbAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="215281817"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:13:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2657211FA60;
	Mon, 09 Mar 2026 11:13:44 +0200 (EET)
Date: Mon, 9 Mar 2026 11:13:44 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/2] media: dt-bindings: ovti,ov8856: Allow props from
 video-interface-devices
Message-ID: <aa6PSHDjSRgIRR3t@kekkonen.localdomain>
References: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
 <20260307-ov8856-v4l2-props-v1-1-7677b4c658e4@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-ov8856-v4l2-props-v1-1-7677b4c658e4@pm.me>
X-Rspamd-Queue-Id: DADF5235FC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54931-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:email,kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Alexander,

Thanks for the patch.

On Sun, Mar 08, 2026 at 04:56:04AM +0000, Alexander Koskovich wrote:
> There is no reason to restrict the allowed rotation degrees to 0 and 180,
> as the sensor can be mounted with any rotation.
> 
> Also, as all the properties described by video-interface-devices.yaml are
> allowed for the image sensor, make them accepted by changing
> additionalProperties: false" to "unevaluatedProperties: false" at the
> schema top-level.

As the relevant properties depend on the device type, I believe we should
continue to document what is relevant for a given device.

Some of the properties such as the ones that get used in the 2nd patch
could well be put into another file so we could avoid documenting each
supported property separately for e.g. raw camera sensors.

Also cc Laurent.

> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
> index fa71f24823f2..73a9d3288897 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
> @@ -18,6 +18,9 @@ description: |-
>    through I2C and two-wire SCCB. The sensor output is available via CSI-2
>    serial data output (up to 4-lane).
>  
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      const: ovti,ov8856
> @@ -94,7 +97,7 @@ required:
>    - reset-gpios
>    - port
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> 

-- 
Regards,

Sakari Ailus

