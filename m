Return-Path: <linux-media+bounces-60579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGylCPMh+2lvWwMAu9opvQ
	(envelope-from <linux-media+bounces-60579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 13:11:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACEC4D99E5
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 13:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8980301ECD0
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 11:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BEF3E275C;
	Wed,  6 May 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El/nTNhc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD904218A3;
	Wed,  6 May 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065887; cv=none; b=c9zdBHDIOG+JR5coKvmyssxvmExXfEr0PANV8OuisCTytG95l5AApoxH9b72Nfh0XtgNuWP8KY7N/wOb/ewcxF4eDY35A4njud4jqb3PGJHmTQY8xq+PqGNCLjigwsFh33LREr78UU+bQPJK9v8Ibr0AHsUwq6DChgZBaV28TUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065887; c=relaxed/simple;
	bh=27iFTjAp0VNw9LU70tpXYwdoaFu1QP5I1+xF0lWR8I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6GY4kTfAnae26BtFWOhzXEih69JYPMpLDmLcTaxTSDi+ErB24PLEsld1mhFB2InWO5o1/qXDpknh8OnmydrQsJ2+VHshOn4RWtbn9g6Zyo8YBCnvHuja2N+VvrvZjSddZY1doRmgd646m34QZj9s1q1elnk3bZmqY9iMQlz9E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=El/nTNhc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778065884; x=1809601884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=27iFTjAp0VNw9LU70tpXYwdoaFu1QP5I1+xF0lWR8I8=;
  b=El/nTNhc5gtB4/0rjJPOexVAAsEaaj+uNTb143aduYApq7+mOE1DQmN5
   Tt5gb87XuStWAaa/93m+n+93Rj7gggZn7VNMO1hOM0NT3F7t5dOKeJuB0
   l5uXM5SjcKabeqRHSlN9Lz8RXr+cvWjckpcvFFVptaO73L1NOxlv76/hA
   DMNn7EVPzv5ErjORBEXUlwDBsNFGhOASv0RyHf1y0ZCNhEt03TKEA19WF
   sMtIXg7IXK+JMT1/U4E13Rv57FOmQ0vn7LdMmYRdnvuJI+SiaxkdJGH1q
   h2EYjToovZ/yJ3X+WyfwaeYLnx63iOyxBNvvNHPgbTLwM7HdAACw1F5rK
   A==;
X-CSE-ConnectionGUID: TKGqqeT9TEiaKZ2vjRB65A==
X-CSE-MsgGUID: 5ZPhuSUoQQCYbQXSWSSjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="101665611"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="101665611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:11:24 -0700
X-CSE-ConnectionGUID: Li5uFLNCTKWdVVBkumt1cQ==
X-CSE-MsgGUID: p9884cOPRGCwBgIpF6jkyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236215257"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.191])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:11:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D4C1C11F70F;
	Wed, 06 May 2026 14:11:22 +0300 (EEST)
Date: Wed, 6 May 2026 14:11:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, stable@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: i2c: alvium: Fix controls for WB/AWB
Message-ID: <afsh2tmV5AFlMCML@kekkonen.localdomain>
References: <20260505142513.1551721-1-mhecht73@gmail.com>
 <afsJz1vVdd3o-pe9@kekkonen.localdomain>
 <37aa90a3-7909-4605-a0be-1545db1fadb0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37aa90a3-7909-4605-a0be-1545db1fadb0@gmail.com>
X-Rspamd-Queue-Id: 7ACEC4D99E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-60579-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

Hi Martin,

On Wed, May 06, 2026 at 12:16:13PM +0200, Martin Hecht wrote:
> Hi Sakari,
> 
> thank you for the comments.
> 
> On 5/6/26 11:28, Sakari Ailus wrote:
> > Hi Martin,
> > 
> > Thanks for the patch.
> > 
> > On Tue, May 05, 2026 at 04:25:10PM +0200, Martin Hecht wrote:
> > > With that patch the controls for red-balance and blue-balance were created
> > > only if the particular camera supports that. Otherwise the pointers on
> > > the control variable are initialized with NULL to prevent side effects for
> > > clustering with AWB control.
> > > 
> > > Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
> > > Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> > > ---
> > >   drivers/media/i2c/alvium-csi2.c | 37 ++++++++++++++++++++-------------
> > >   1 file changed, 22 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> > > index b62b45a4f2fc..4c6934e9e177 100644
> > > --- a/drivers/media/i2c/alvium-csi2.c
> > > +++ b/drivers/media/i2c/alvium-csi2.c
> > > @@ -2108,26 +2108,33 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
> > >   						  0, 0, &alvium->link_freq);
> > >   	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > 
> > This is a problem. Can you move setting the flags after checking the
> > handler's error status? The functions adding controls may fail and this is
> > simply a missing error check.
> > 
> > Can you submit a fix, with a Fixes: tag and this patch should be rebased on
> > the fix, please?
> 
> I'm preparing a separate fix for that issue. It's the same situation also
> for some other controls like pixel_rate and link_frequency but not only. Can
> I combine that into one patch for fix only that in alvium_ctrl_init?

Please do.

-- 
Regards,

Sakari Ailus

