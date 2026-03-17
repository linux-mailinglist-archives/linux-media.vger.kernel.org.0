Return-Path: <linux-media+bounces-56002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJhoHYERuWmFowEAu9opvQ
	(envelope-from <linux-media+bounces-56002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:32:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 186AE2A5B2F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E93E330234CC
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494B13914E2;
	Tue, 17 Mar 2026 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxGUakoX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0553345724;
	Tue, 17 Mar 2026 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736313; cv=none; b=TIh9fKzeGcYcIl/HPHJg7P02LgXpm+zi81Ydw3gdc/mZtathElcE75UN77BqIqNwGuexOWg3+TIItNLYhh+HcUZMDAvQjyjQNBQ83vA+fbzTUpSVitaJA2IHgkNTnnf7+HZXdMlBxXRW9L3ommPLiDvYpK3PISg+XxvIA6m4M5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736313; c=relaxed/simple;
	bh=V22S6tcbWuhZ2YPdpQRYNiMLkbvffQdLG1VFnhBc/d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOu0qrUk/I1LSdO0Odj3eVV7Iva5Pjft6fDlROFELWJ4+TkxdwpGPO1AFkNEg76CmSpgqUdhyuBvL4Sjuu/vqb7waVPANIL4xYVW9M1TUoba34zF0R8G/47Nus1bzCaRJSUFYAMOMA17OQW4vSd1BWjYvzxqK348Wvy+eCBGimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxGUakoX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773736312; x=1805272312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V22S6tcbWuhZ2YPdpQRYNiMLkbvffQdLG1VFnhBc/d0=;
  b=YxGUakoXyOyz2vOw9YUGEHlHOuBuUO7IgnddxG8RD6nSXRhmPBpO4Xfs
   D3HTvoEHXXL4Hl/CdRENFBa2bX9knQ5MThI4SDk/ovXGfl/YhPaaDPGMA
   zqhMx+u1aZftYxNRTPCFGYE81f4+SBlCNWBuw6mMGVtRs2YP9vdmS5ehf
   XFZUMTXgnj1Y7qIAK0Wbb4vjkjmPCj1GUbw/IDg2DTOFVeJbgpSsYU3fj
   vMNJgILRvjZhYA3lmGjtGhYRVkXgzLW1Zz5dHfRq9/LZIeaPAfN+Xp73o
   cHKE7W7nhfVvsYB6ZmIu5Sly2cOKC3V1047OSWsobEJsn1/fmZBU0BV+6
   w==;
X-CSE-ConnectionGUID: 5lcWvIyfRhWw3SMYHBq5Vg==
X-CSE-MsgGUID: QSejC+gLSgSdQTHmDavanA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74945340"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74945340"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:31:52 -0700
X-CSE-ConnectionGUID: yAGIY3SBRWCmMK0mGfChVQ==
X-CSE-MsgGUID: PQI4iqgXRfi0q82Crh/pSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221429170"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:31:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8E3C6121D04;
	Tue, 17 Mar 2026 10:31:48 +0200 (EET)
Date: Tue, 17 Mar 2026 10:31:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kalyani patra <kalyanipatra2003@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
Message-ID: <abkRdID5NGk2mkOF@kekkonen.localdomain>
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
 <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
 <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56002-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 186AE2A5B2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kalyani,

On Wed, Mar 11, 2026 at 08:52:20PM +0530, Kalyani patra wrote:
> Hi Daniel,
> Thank you for the review and for the clarification about patch versioning.
> I will keep that in mind for future submissions.

Applied this one... please use "media: staging: atomisp: " prefix in the
future. It's usually a good idea to check what others have used in git log.

-- 
Regards,

Sakari Ailus

