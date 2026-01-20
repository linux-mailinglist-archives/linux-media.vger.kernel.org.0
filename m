Return-Path: <linux-media+bounces-51170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PcME2sUcGlyUwAAu9opvQ
	(envelope-from <linux-media+bounces-51170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:48:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 659534E1A2
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BD7396E201
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C4A40B6EA;
	Tue, 20 Jan 2026 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW+fQKeP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADD3EF0B2;
	Tue, 20 Jan 2026 23:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950304; cv=none; b=PEcifx9PU7PLLaXzlzL89DK201++4VRp49AuWvKcOeA8S7saNo/x794fTmEAhgjOEGYuwHsnKAvPYXo7fm2aXriXQ0eN7L0gvsoDonDbdejxfahzYprY6HTNGOHtdAoIMqp836baVNw7NFOZqsRGNhpdQqzF7HXPKY6JwmVc0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950304; c=relaxed/simple;
	bh=/C10asdU+CskhWeQvv6lZElGi85Hl4tPtMi3dsJAszk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mi4rPy+w/zEc0uJ413cyEBSY7LT3eD9WPWMdKE2xSFRul5Se8IPf2Bh6Kk26VU/yCYEAz/qY1AbuclXThCkAYky4IeSHuP+UjsyKgg8k73jSF6PXR3dQgK9VamkHVV/JCi/Zlmc3EQtYz3Lx5TSGutp45sHfjmDezyo4d76vwQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mW+fQKeP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768950301; x=1800486301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/C10asdU+CskhWeQvv6lZElGi85Hl4tPtMi3dsJAszk=;
  b=mW+fQKePcjd5c0+JfaUTaaTBfaEbwHOTbgP2JZuQoJBxQWexC9NVZ1jO
   QP5AW0xJUGy0EcCYnaZOR1UpawVOZ5PKL9Wj5BA2dD0ffk8tq9Ea3JYVh
   0fpLSH1VM6cJA21x7ZCunECTWTrUv1YHQDlw4jphGipyvdgqyScdjNP7y
   +p4qVAa1to0Z1q76CP1vM3H8W1KpmRv0PUmKXyWB+E2UA4Bmhx3P1arId
   C5B07OMGyxgcnlvyBlsgdVQ3mB9xtIiscxOgHcNitvM0XGqltmxURXfKk
   FR5ooE3On9KULpv34GVU+iTzueT9OqKLo6IK6Y2eZ3Elcy8b4XKSVMkTA
   w==;
X-CSE-ConnectionGUID: ypOxh4sVRE6Nb4dJqojMfw==
X-CSE-MsgGUID: zQYk+2nFRnOda06KENk7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74025246"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="74025246"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:05:00 -0800
X-CSE-ConnectionGUID: Lsv2Uk+LR6aYFpYi3yjcVg==
X-CSE-MsgGUID: YVTunqWuQvWJGPPljzBMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206168836"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:04:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3AA3C121D60;
	Wed, 21 Jan 2026 01:05:00 +0200 (EET)
Date: Wed, 21 Jan 2026 01:05:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: fixup! media: synopsys: add driver for the designware mipi csi-2
 receiver
Message-ID: <aXAKHMjwVpWYUmp7@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
 <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
 <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51170-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,collabora.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 659534E1A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On Tue, Jan 20, 2026 at 08:35:17PM +0100, Michael Riesch wrote:
> Make smatch happy by adding braces around the initialization in switch
> cases.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
> @Sakari could you try the following patch? I think this should solve the
> issues with smatch/sparse you mentioned off-list.

I don't know what went wrong but this won't apply.

Instead I made the following changes:

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 29119a1a8d38..170346ae1a59 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -237,10 +237,8 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 
 	switch (csi2->bus_type) {
 	case V4L2_MBUS_CSI2_DPHY:
-		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-
 		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
-								 lanes, cfg);
+								 lanes, &opts.mipi_dphy);
 		if (ret)
 			return ret;
 
@@ -294,14 +292,12 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case DW_MIPI_CSI2RX_PAD_SRC:
-		const struct v4l2_mbus_framefmt *sink_fmt;
-
 		if (code->index)
 			return -EINVAL;
 
-		sink_fmt = v4l2_subdev_state_get_format(
-			sd_state, DW_MIPI_CSI2RX_PAD_SINK);
-		code->code = sink_fmt->code;
+		code->code =
+			v4l2_subdev_state_get_format(sd_state,
+						     DW_MIPI_CSI2RX_PAD_SINK)->code;
 
 		return 0;
 	case DW_MIPI_CSI2RX_PAD_SINK:

-- 
Regards,

Sakari Ailus

