Return-Path: <linux-media+bounces-62656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mo0GOreEGr2ewYAu9opvQ
	(envelope-from <linux-media+bounces-62656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:55:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4855BB454
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84BDC3010601
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CC1390985;
	Fri, 22 May 2026 22:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNkK0qXs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8236C9E4;
	Fri, 22 May 2026 22:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490528; cv=none; b=sIQpy7pOlQDleqnnl/ii601rdpG3uHxDZAAydveNkvsqbDZQq2NfOlCMCuT32JBhnsUAPDIfGjd/JZep3CvErZs/fKqUcc2UMnKq/Fr073qxtzSDUi/e4uvb7AbKU1O5UaCAeFeCedB2Dw7o2BybtBeDcZuWcZLLxlNLWBKAFpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490528; c=relaxed/simple;
	bh=D8njPhvIZgkZyGNYGGd8Ol3VN4oUyRhFQ6WHd7a05uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGv4u89wPgvfbCBjeTGk6OAE5Bvkn9XpvWA9PFmz7SFh4NwVIVmUMXeng/Xot0zQMh2FtFARUD2mxYaiJgPdqOEzCXQBHTGYbHMpK1zmwGfu6T4Hp2YtESu1DEhfHaBmLNE8Hk0t0XFprdOIdmJs5avHOrLxZL8ubNtpZxIVbak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNkK0qXs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779490527; x=1811026527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D8njPhvIZgkZyGNYGGd8Ol3VN4oUyRhFQ6WHd7a05uw=;
  b=ZNkK0qXsq3CMuljyzjC5B9F6rPgX/fyYjqVWH90oWeUPiihxdV+MzZS2
   ewR1jlnPeAL2oF+LXDKTjC8T86SqeogglgHTCbNBOZ4ec59hBmv0K7Rwt
   p1E429ZxBuah/DMwN/cB9oBFHRELu6GzlUFxI7Xc0cXX5f+QfOeOoH2Ke
   mf6H+K9VmYXkmbT92CzAqHf39nwNVfFMjHnvB37putID9MPjY/95+U8kG
   yY7iZ2zSbiPOvyHA7adnSeX7YRufBXd9cG6XAId2N50pSMhzKCK22nfF6
   6zWcU4HpVK0av2dkZzjSRZJJx0dNPsdra81nBGPYvD1ad1rDwm53d+KFE
   A==;
X-CSE-ConnectionGUID: E9RDULNtQsCppRDhReSMnA==
X-CSE-MsgGUID: ric4q0FcSruvAv8NtV/5BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80457955"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="80457955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:27 -0700
X-CSE-ConnectionGUID: 3ce1psUYSXCxgsTN6nZpIA==
X-CSE-MsgGUID: 0oN7lWqEQzaSgSyCPdC52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="240198785"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.81])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B1421121CCB;
	Sat, 23 May 2026 01:49:42 +0300 (EEST)
Date: Sat, 23 May 2026 01:49:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: i2c: imx471: Naming the register
Message-ID: <ahDdhu0Z7BQnMRq0@kekkonen.localdomain>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-4-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522031121.11968-4-hpa@redhat.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62656-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 6F4855BB454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

On Fri, May 22, 2026 at 11:11:21AM +0800, Kate Hsuan wrote:
> Name the register addresses and set up the value with correct value
> length.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Please squash this to the 2nd patch.

-- 
Regards,

Sakari Ailus

