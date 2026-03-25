Return-Path: <linux-media+bounces-56963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB0AFUapw2nAtAQAu9opvQ
	(envelope-from <linux-media+bounces-56963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:22:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 176E7322178
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A34F304806D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA0930B533;
	Wed, 25 Mar 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFbsYQEY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C4285CAE
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430220; cv=none; b=VqcJZPMkTgcb0Qm8sNmjTBGVsA2qIup/dZyfxuhk325Fs60EsZSpB4t4BuWOWMUu3hhHKCHLJf6P+yUKU6ZV8eNJhHxVv+rDCvQe2oAq95h55W48LsIbj3mCbgvcv2AGmEkFJoHeGndPkoOla8bNFJCe6SU9JqfT+TJc99uiYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430220; c=relaxed/simple;
	bh=unR5nuB0QgzldiXpl1NpuDyzFrIzp/JxAokp/7eGypw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naIXuj/fEW8rj3M7wA5LiEx0Sjb4QngrjZlwohhe9vo4kKAMpEHbhsmYqB64/76RDQBGSEHK3ROvxpM/LQdi2LKrZe4hcYQtgBOfuQTBbjUY3ANc9XoFF4MX264H0vOSB/M1oPfmKq89Y1+0YHeBDv/95jh8oIxQ9JG7yEJp1bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFbsYQEY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774430219; x=1805966219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=unR5nuB0QgzldiXpl1NpuDyzFrIzp/JxAokp/7eGypw=;
  b=IFbsYQEYX09xW6SdmFWn0WwfC3WuXplYqhbNSRlKTCiMB4X73PY9InaW
   aItaWMbOuqKolZlzKUe+KDUOx3CJ5q5xVs/zO3dHzNIMD5yWHDOK2tfG9
   KLsrapPXaJoN7oQvKTNne8lCMHaaAPrUGPzW6X3HOoHZok3hkIWDQA1p7
   CL+PNDQ1kj8BqQU4o/RyWtm4CkptoL7ovUmb94LBRaotQXBVDHZRoySU0
   Kn7joFYmbtmEYJ+BmdBWOOYCIxgp6MNiu3GP/z0VvJTad5GyggmoOu8le
   AmCyRjX3LFT+WYrJOhFEf4q9oLsKF7H1Z0fWAaya3KerOCQM3ZBmPdqGR
   g==;
X-CSE-ConnectionGUID: /M4FcnrCTJS67AMEKQ441w==
X-CSE-MsgGUID: za+trhLcTMKJkqWKch9cRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75345621"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75345621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:16:59 -0700
X-CSE-ConnectionGUID: m3wNqTtXS0KDReBr4Z4Cbg==
X-CSE-MsgGUID: 7x5vLzifQpGsGgojRCmOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="220215284"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:16:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C1F44121CF9;
	Wed, 25 Mar 2026 11:16:55 +0200 (EET)
Date: Wed, 25 Mar 2026 11:16:55 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 09/14] media: Document enable_streams and
 disable_streams behaviour
Message-ID: <acOoB551Hs2eyhLP@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-10-sakari.ailus@linux.intel.com>
 <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56963-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 176E7322178
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mirela,

On Mon, Feb 16, 2026 at 04:03:40PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> In the subject, perhaps use improve documentation...as some documentation
> already exists. Other than that,

I'll use "Improve enable_streams and disable_streams documentation".

> 
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks!

-- 
Regards,

Sakari Ailus

