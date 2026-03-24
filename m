Return-Path: <linux-media+bounces-56816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MemG/JIwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:18:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057C304779
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B9A932729E7
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F79A3D3007;
	Tue, 24 Mar 2026 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk+8MxFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443433CCFBA;
	Tue, 24 Mar 2026 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339310; cv=none; b=TIghzHYIXTSPxavRlKrV7iqf/oGOMDHE5cGVl8OfYlmuUNRsiBUFMz5TMeBfYsm7Mk9kuVoWgmKbUU/eBa9Nws9XQ1S44ikdWsUs8DZpLZ0fQW7jHf3ThG3GrIhVIrE4Yt2nFQ1PDLW61Bp9J7miT3a6TVavBBQLNo8Go1foC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339310; c=relaxed/simple;
	bh=zrmpDTQR2dcwegoCA09wNc70NnhwuP4l44nvaPXk+bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqmI6VsYyUPr4OWIpQ9TC0eoBB3QB6qlwv3EC0zfIVYbmxWpOQeTUa0gecT7rzd43uyYuBkcBf/8Osfa1QQ+yg6CBM3UKmS+WBJWFY5GxQj7dxa5tpLq5Zy73BIYuAmkxj8shP0Wies7UWv5wQastxsxJhl8vv8luSGbELBScFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk+8MxFK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774339301; x=1805875301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zrmpDTQR2dcwegoCA09wNc70NnhwuP4l44nvaPXk+bM=;
  b=Zk+8MxFKpXksjpdqXyJbvv7pQrmcGLDAtqqiuiqpMxAqGdcrPKxVJgAA
   4sCOHhSm/eU9puNGXOBB4BDHbpnTnlzIu1OhNYtdgaWp4aZNHbgOXftLl
   v2H1S0yfw/yv2r/qILXoxlEHuxE+KMIs/jarGJEg2H6Pq8DsI71n9LcIR
   xJXIDcoK46WYlHvqOmbv255AjfnTx4XCwS3G4TyNBj0QFUucRLBINOnBV
   oadYaRfFFCmj0jf30onUiXGvMYs6L7cXdg3Cu2pbeeP4SG+RpLSolmXPC
   0CXM2+q23wP1z6Nrw7VY07DozJmvrK7Jqb02cR4/ot+beVLjwaW9yBoeY
   g==;
X-CSE-ConnectionGUID: mN4DXQ0eRbO83ML3F3fINA==
X-CSE-MsgGUID: /Tx74qmmR7mPga9q4IvppA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="77954384"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77954384"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:01:40 -0700
X-CSE-ConnectionGUID: wmuqJsnJRY2ZLNSQR4SiyQ==
X-CSE-MsgGUID: v9d5ioxDTnai6O7Y2ycJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219850502"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:01:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A50EE121CFF;
	Tue, 24 Mar 2026 10:01:39 +0200 (EET)
Date: Tue, 24 Mar 2026 10:01:39 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
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
Message-ID: <acJE43J9to2bP3lv@kekkonen.localdomain>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56816-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 1057C304779
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> > This 3rd time try to support DW CSI2RX support for imx93.
> >
> 
> Laurent Pinchart and Sakari Ailus:
> 
> 	I am not who will take care this patch?
> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
> by Sakari Ailus

I'll review them soonish; please cc me in the future.

Thanks.

-- 
Sakari Ailus

