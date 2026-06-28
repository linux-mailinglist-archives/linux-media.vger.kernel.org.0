Return-Path: <linux-media+bounces-65831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DI7XNPGDQWoWrwkAu9opvQ
	(envelope-from <linux-media+bounces-65831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 22:28:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68C6D4E58
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 22:28:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=bKn7cF+Z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65831-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65831-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C0F230177B4
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 20:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF3B3B71A1;
	Sun, 28 Jun 2026 20:28:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D933930FC1A;
	Sun, 28 Jun 2026 20:28:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782678501; cv=none; b=Da3J3LHK6byqy422ldUI6h4mbIvrqePNU6iyJT5ji2SS33fdiSSozudreaKq9eJH2bzcqRb9GwHtDjU6kvoiPAi2ylChzKSOp9n/tsn9SFgg0xQs8pN756qjyaxuAoutdn76Ak/GsJ1353GQplmrMHha5jbxO8XcSE2IB0wpgi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782678501; c=relaxed/simple;
	bh=x5Vi4f0phvjV60V3TXIOIorQbkIhfFhMCJ4c7HWwdqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7qkqeUsErtHbuaD6nNdKwQ8hn8ky9WKoaHVJ000qDAAEp/0+lYw+KJG/hNAR2OGABI4nbKJsuhKLu1P8RGNbt9GjCvBpXydy/LPzuf7GXQnjna12nZ94wnMhtuGa3U4S6PIKrK2s0cqEWAsS1O8vbhFByJty/6HgG3DGTFHVso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKn7cF+Z; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782678498; x=1814214498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5Vi4f0phvjV60V3TXIOIorQbkIhfFhMCJ4c7HWwdqk=;
  b=bKn7cF+Z9KvPEAC/JgqtbVIreNirgZFH+j8KuUzh1ajj+/osD0aK/T3R
   M7SFqv1XhtAJnGkFbgF7PMP/fA/gtHLZYMlNFpZtlM/uNNID/63yI5eE9
   C8pQ1I92if9YnDWWa+SPpQsTOKO0QK8F68czPwQd64wkYUfoKp2AZ/n/p
   0VNN9M94ocJ/ArtPzIYcjtXSwpTm6EGjMUEcH8FTA3SqLuw5/XqI+uUw4
   KRxgu0G5TZHuz2tyer7ohQrLKfAaZK6K7jYj6fMdIOLVTSQMS2Nw5m591
   T8HUXiKsZcYQ9brlqdLYGvFhmyHKvlfOhngnAc9aBsTZLcFUUORf+8ccR
   w==;
X-CSE-ConnectionGUID: IbSWCcHpSpiTaM/8oRUsAQ==
X-CSE-MsgGUID: XyDHT2ouTe6qdeq0LpRtjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94860430"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="94860430"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 13:28:17 -0700
X-CSE-ConnectionGUID: 0nckVlaHRHaa9RU2NwKC9w==
X-CSE-MsgGUID: QfjrX7T9R5Wi5lax0QCKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="249152241"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 13:28:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 229E0121C1C;
	Sun, 28 Jun 2026 23:28:13 +0300 (EEST)
Date: Sun, 28 Jun 2026 23:28:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode
 endpoint in media_pad
Message-ID: <akGD3ZjW6GPHHI3D@kekkonen.localdomain>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65831-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@nxp.com,m:laurent.pinchart@ideasonboard.com,m:hans@jjverkuil.nl,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B68C6D4E58

Hi Frank,

Thanks for the patch.

On Wed, Jun 24, 2026 at 04:37:48PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Each media pad is associated with a firmware node endpoint. Capture the
> parsed V4L2 fwnode endpoint information in struct media_pad so it can be
> reused by consumers.
> 
> This avoids reparsing firmware node endpoint data every time the endpoint
> configuration is needed, reduces duplicate code, and provides a common
> place to store endpoint properties associated with a pad.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Assume 1 to 1 map between dt's endpoint to medie pad.
> Change in v6
> - new patch
> ---
>  include/media/media-entity.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d524..4a3785cd9f370 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -20,6 +20,8 @@
>  #include <linux/minmax.h>
>  #include <linux/types.h>
>  
> +#include <media/v4l2-fwnode.h>

We have dependencies from V4L2 to MC but not the other way around as MC is
(or was?) intended for wider use then just V4L2. I'm thus more than a bit
hesitant adding any references to V4L2 in MC.

I wonder what Hans and Laurent think.

> +
>  /* Enums used internally at the media controller to represent graphs */
>  
>  /**
> @@ -230,6 +232,7 @@ enum media_pad_signal_type {
>   * @flags:	Pad flags, as defined in
>   *		:ref:`include/uapi/linux/media.h <media_header>`
>   *		(seek for ``MEDIA_PAD_FL_*``)
> + * @vep:	associated fwnode endpoint information
>   * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
>   *		access this field.
>   */
> @@ -240,7 +243,7 @@ struct media_pad {
>  	u16 num_links;
>  	enum media_pad_signal_type sig_type;
>  	unsigned long flags;
> -
> +	struct v4l2_fwnode_endpoint vep;
>  	/*
>  	 * The fields below are private, and should only be accessed via
>  	 * appropriate functions.
> 

-- 
Regards,

Sakari Ailus

