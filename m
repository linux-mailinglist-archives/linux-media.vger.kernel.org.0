Return-Path: <linux-media+bounces-61539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENufH17qBGrOQQIAu9opvQ
	(envelope-from <linux-media+bounces-61539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:17:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF653AEB1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E519330363A2
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD69B3B1034;
	Wed, 13 May 2026 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/F7nPKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD73AE196;
	Wed, 13 May 2026 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707020; cv=none; b=lkz33GXoh4IJyVwboPcTQcw4SXld4cVFuQbYOakXeSu9bRF5uSZPRBEHeduDlOKiSOMU0dGWor1dfSjRKGGS9q9Q0QIdaXrwzL8E+RJlxhf49rBNEujPIvpwwSAVF2il3hgd4gWQiitI2FKUgWOYbCgQ6AKCm39FdqDFOXo9bgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707020; c=relaxed/simple;
	bh=oNCMpz1+wkcqR/Q/RXQVKGjlHVNtc7bGj+adK4KEPFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiGqPBH/WPrurpWv5BLPW4VTTWHrr1o6ZVcSZq0uScyWQH+s+fYEfklURjm4Jt7adiLzK7/pQoFV42Yg5MFLLQ+W2q0LQN4tgl1ugI5divosxzOXq1QOYsBvLlsgtbQBCZz4M4u+CWK8b94VGssGwY0uko/E4kQ4ev/Y0mZAn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/F7nPKa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778707019; x=1810243019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNCMpz1+wkcqR/Q/RXQVKGjlHVNtc7bGj+adK4KEPFk=;
  b=F/F7nPKaBQq0jLKqDi4k+L5LTKLCuIUJdwC+j/g+VJO+q4UJNKQGuZS3
   IweEmkKkSD9tB037AEfaOi0f5qCuV54KPnE/6gdJld3MZXW21gWRRsqX5
   CUEeDogULUjoDM5e34yTijZwZr1Wu80ITdZXfhjhe8oMfL+ud67dXmrQv
   XY1MW9CtEjWwLENMniKl7gHe6alpunouomxK62t3QSz1+CwFEB1sMdRjP
   fT6DexfCOcyyi+e8LDLba+BFE+dKTeDkC6eWiz5bZb+Q36aW6S7YNy/W6
   Ma7CttTCrePE6F76WPe6HUUTSLaoIgOk5LtRKxWrbBylmjv84iNmh+I85
   A==;
X-CSE-ConnectionGUID: RYdOcT1fTYGlcYXjtzX4eQ==
X-CSE-MsgGUID: P5qXRJ7gSdO6CqqdPrT/VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90220855"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="90220855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:16:55 -0700
X-CSE-ConnectionGUID: OxM4iUwdR6aluZ+l2bzF0A==
X-CSE-MsgGUID: yCTir8lwQEO41Bpm46uLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="235130277"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.188])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:16:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 285F2120813;
	Thu, 14 May 2026 00:16:50 +0300 (EEST)
Date: Thu, 14 May 2026 00:16:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <agTqQo8rbuI6S14c@kekkonen.localdomain>
References: <20260513205949.105444-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513205949.105444-1-Frank.Li@nxp.com>
X-Rspamd-Queue-Id: E2EF653AEB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61539-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Frank,

On Wed, May 13, 2026 at 04:59:47PM -0400, Frank Li wrote:
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->dt : MIPI_CSI2_DT_INVALIDATE;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->bpp : 0;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);

Regarding the return values -- could we use int for that so we could use
standard error codes, e.g. -EINVAL?

-- 
Regards,

Sakari Ailus

