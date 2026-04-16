Return-Path: <linux-media+bounces-58864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPp1IeCq4Gm8kgAAu9opvQ
	(envelope-from <linux-media+bounces-58864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:24:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FE40C45C
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D7DD3049298
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0FD39B4A2;
	Thu, 16 Apr 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPurLt4k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797EE39A077;
	Thu, 16 Apr 2026 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331250; cv=none; b=ssWd8+57cObq4D8CkazpPUrobuOB0NqNPVWGPh/e0lMPaxPJb6XqYVCKXtFYw+QlDDIRiOF7ecOT7UgaOFU+A7eryZk+7fl3hqIT3TyRJeO3kcEXo2ETfpZOgaBpHVI9JMtD9kyIWFvXyr/aqcM3aR5pvTbcOoUrMYXokjMsdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331250; c=relaxed/simple;
	bh=udiYC/LNkNflXeo6pYjFnMVROnJd6qFnN2r99vs66JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP/vCtYLX+bXawnCnTYJqNUNo83pZ0miWwuuvb8woAIc+RFo+yJJUcR3DtLGHZP4PbQy4vzsqGPf4VAlzK1ebcVHR0rbPK8wQHMvgq80UbCkh9gBazzhMSppxG4S+sGkZkyBl1PvKsBLrFDne+AJqDT2ASvvatng+0Oi4E9gZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPurLt4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2061CC2BCB3;
	Thu, 16 Apr 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776331249;
	bh=udiYC/LNkNflXeo6pYjFnMVROnJd6qFnN2r99vs66JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPurLt4kMWDBdtJqM+YZmdrjRupEFV9UMjmm8elShYTKqaiYBb0mEIqgRRR6fuJSC
	 cQwGuX0kkh9NVTdVLIgm7+x7lTfqbEVWvvZuMqQZcfflcM+Dy79/rxFYTCIrrG4LQH
	 Vb1AsRQ4AGmnZtXmiB6Qf/lMRjHMnpxTKshxO65F2tm5iK7bFhSF0wA8bhxgr1BJzT
	 tMIckRTNvDM25REHN66ZZsUSYawarL5vcWCPrch6NnyZwEuhW/MtaJAbKVvOyy4QrR
	 ePIbrl4a5nH+IzUcX0PqTDOytSfLyRnBHgB47dqWjYDc8f9fMHe+e7WSH9DRbaw7f8
	 ueBLNo+RRRgqg==
Date: Thu, 16 Apr 2026 11:20:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michael.riesch@collabora.com, anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH v1 00/11] media: Add iMX95 neoisp driver
Message-ID: <20260416-olivine-cuttlefish-from-tartarus-ad3df2@quoll>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58864-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 241FE40C45C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 06:03:20PM +0200, Antoine Bouyer wrote:
> Hello
> 
> This patch series introduces the NXP Neo Image Signal Processor (ISP)
> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
> The series also includes updates to the generic v4l2-isp interface to
> support extended statistics required by the Neo ISP.
> 
> The Neo ISP processes one or more camera streams, converting RAW formats
> into YUV or RGB outputs. Its architecture is largely influenced by the
> PISP driver. To limit the number of v4l2 devices, the driver supports only
> one context, with three sink pads (main input, second input for HDR, and
> parameter buffers) and three source pads (RGB output, IR output, and
> statistics metadata).
> 
> The driver supports the generic extensible v4l2-isp framework for
> parameters, similar to rkisp1 and mali-c55, and applies the same approach
> to statistics buffers. The generic v4l2-isp framework is modified to
> factorize structure definitions and versioning, so that both parameters
> and statistics buffers share the same mechanisms.

That's a v2, not v1.

Does this work:
b4 diff 20260413160331.2611829-1-antoine.bouyer@nxp.com

? No.

Should it work? Yes.

Also, implement previous feedback - I see no changelog, so I assume you
just ignored everything. Judging by build process errors, it's even
worse.

Best regards,
Krzysztof


