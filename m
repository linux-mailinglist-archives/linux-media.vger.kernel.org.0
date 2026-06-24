Return-Path: <linux-media+bounces-65581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n3YHDNMtPGoplAgAu9opvQ
	(envelope-from <linux-media+bounces-65581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:19:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F6A6C0FDC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:19:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=R9iPS6IL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65581-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65581-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27A83302287F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BA5382283;
	Wed, 24 Jun 2026 19:19:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51BD380FEB;
	Wed, 24 Jun 2026 19:19:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328780; cv=none; b=nw5hA0hoOnjOf1WRQY0K97/VZP3UJahIx3ifDY/VnJJTyGDkowQFGguXF115INYDkDkk5/H4DWSXK2Z2vrBxw3xwuf9gWeBaYy3W90URA87Ng9Z/7Dt3JYyVJ7fRVoLn7Ipn7UOhKfMDUaN5Bc7rypmj8/3q/C/B6d8NVoOr1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328780; c=relaxed/simple;
	bh=SygbhfMsHBXymcem7e6Zd0nKKWVHq2pp7wmjCrhnj44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E66B57+NYz90RdHwVImqWcr9bnXCLiJ1D+plc6kpJIH6bd2Hg1MLK6Y/emdS99JG12ZOnsl44+DuGuAZcS3GBNuTSxywPWKYcIu1iJEFul4QjWRE+GdHo61InifWW+dHEIrZiC3B2Ud+kAF2NHiIt3GJunKZAfrtZ9UxWDSRp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R9iPS6IL; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56D7E1049;
	Wed, 24 Jun 2026 21:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782328737;
	bh=SygbhfMsHBXymcem7e6Zd0nKKWVHq2pp7wmjCrhnj44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9iPS6IL6p0/dDAwuFkL5icB0WAA7/VF1Z2f8Muhz3zenEk89jfcpVogCPF9xqqsm
	 QPxnlkhw7Ug6s2tpdrYSAD+ZWecr8sCsX3hYxbY51skwWfYFAI00vNswoaiCKIZj+k
	 0HxXfhmL6kVxPTzsYM4hCVIu8p8C42YQ/DqNXn+k=
Date: Wed, 24 Jun 2026 22:19:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <20260624191935.GG851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65581-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com,oss.nxp.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,msgid.link:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13F6A6C0FDC

Hi Frank,

On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> simplify media code.
> 
> Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> rkisp1-dev.c only silience improvement.
> 
> Anyways, *_for_each_*_scoped() already use widely and make code clean.
> 
> Build test only.
> 
> Sakari Ailus:
> 	when I try to improve the patch
> "Add common helper library for 1-to-1 subdev registration", I found need
> camss.c pattern, so I create this small improvement firstly.

Those are nice cleanups, thank you.

After applying this series, the only left users of the
fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
They can all be trivially replaced with the scoped variant. Should we
add a patch to use fwnode_graph_for_each_endpoint_scoped() everywhere,
and drop fwnode_graph_for_each_endpoint() ?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - colllect review by tags
> - fix typo and indent.
> - see each patch's change log.
> - Link to v1: https://patch.msgid.link/20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com
> 
> ---
> Frank Li (4):
>       device property: Introduce fwnode_graph_for_each_endpoint_scoped()
>       media: mc: use fwnode_graph_for_each_endpoint_scoped() to simpilfy code
>       media: rkisp1: use fwnode_graph_for_each_endpoint_scoped() to simplify code
>       media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code
> 
>  drivers/media/platform/qcom/camss/camss.c           | 17 +++++------------
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c |  4 +---
>  drivers/media/v4l2-core/v4l2-mc.c                   |  5 +----
>  include/linux/property.h                            |  5 +++++
>  4 files changed, 12 insertions(+), 19 deletions(-)
> ---
> base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
> change-id: 20260620-fw_scoped-5dab644510a1

-- 
Regards,

Laurent Pinchart

