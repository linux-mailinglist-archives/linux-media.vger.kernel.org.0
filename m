Return-Path: <linux-media+bounces-62853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNrcBfSmFmoOoAcAu9opvQ
	(envelope-from <linux-media+bounces-62853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BA5E0DD9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54FE5300B47D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317CE3CAE7C;
	Wed, 27 May 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOQLjLt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065A2C11F9;
	Wed, 27 May 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869415; cv=none; b=aeRRaHQkeUK+Cw5QP5jVAbkrmN2jM8WlGY5xrvK/wcGeqnyGRQVnZxIK2hN1T+hEljumqyt+sphB1AFpvFLF31xItACD6ymhI8GaQikZWlot+annA3fMh0j8+uNxm/zMTWBy0s1sf41KtiPPQKwpe085K5cLm6Z/oV6uJRiEi/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869415; c=relaxed/simple;
	bh=JyXXGr82ONuILH2HUJ86RZ3Gqwg7XcRiFuOMfbpBKy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrSfPl9Kq3CbQ3aI/pB/+ntPZiJX2154imn5jbQ9DRcSL73/+TytjXoGe+dRsgXzTHgCThuYXsNOGQj/UDyuiD5pg99l1+AsZ8KVydNOhOMcOpadc4Oqs/7YGbyGO/5aYK0bg6zsmKwMTdmWMQ6e2o/oP7ISJdlwfDkDOx8RuBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOQLjLt9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779869414; x=1811405414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JyXXGr82ONuILH2HUJ86RZ3Gqwg7XcRiFuOMfbpBKy4=;
  b=AOQLjLt9x/6TskaDm/3cpAWSmxCQ6yFF0VGD5X76R2drvDvhiWw2+0Ca
   ItHIWsePNV28DopVLzS+VhhPNfS0ufJRxxB9vDr/iFX0V1RcMYZekm/Dz
   U5GCyd1XptrOHto6N6FWpjeG0BfqgLCDtqN9QGP7FQLOm3+SYv5clqO2d
   v7vFgJZQp/cdI7EFBsn4J1ikjaZ2lA7A+0YDpBV2Sk1BoKnH5lEgtfiwG
   WXYkg9M3mvv+7VG2yZcQdrn2zUlo6Jq9P0uswhA6iGo3M4OL8RaVkTa37
   7Qoptbodr0Ce7ZPankXIO8nVRGrz4PG518cxv4dg03mPIbH1uJMu2i1YK
   w==;
X-CSE-ConnectionGUID: Kg4AK8+/TMmq34H8YhvMlA==
X-CSE-MsgGUID: 7zbJX+qkR/ybHK4mBXNyvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80879123"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80879123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:10:14 -0700
X-CSE-ConnectionGUID: 4fdlRkEETEqTJ8VOmUSSmw==
X-CSE-MsgGUID: 7fAzM3RrSLOYBb221jui2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241337353"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:10:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B9EA6120EBD;
	Wed, 27 May 2026 11:10:07 +0300 (EEST)
Date: Wed, 27 May 2026 11:10:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing Intel media maintainers
Message-ID: <aham35tbJEbDc1Ee@kekkonen.localdomain>
References: <20260526214131.51118-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526214131.51118-1-dave.hansen@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62853-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 6F3BA5E0DD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

On Tue, May 26, 2026 at 02:41:31PM -0700, Dave Hansen wrote:
> Tianshu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Both of their emails are
> bouncing.
> 
> Remove the bouncing entries and update driver status in cases where
> there are no M:'s left.

I can pick at least some of these. I'll send v2.

-- 
Kind regards,

Sakari Ailus

