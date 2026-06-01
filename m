Return-Path: <linux-media+bounces-63218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHSfEgtCHWpBXwkAu9opvQ
	(envelope-from <linux-media+bounces-63218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:25:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D361B6FB
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7F00300A267
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8E138A736;
	Mon,  1 Jun 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVUpgzNM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E7388E66
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302337; cv=none; b=KMVxHrZDXeWI0iTBx2TcU8YqNaBtj+dqiLF1koBzUFyWIVdJRSjQ2LoePbxTWSVfPnh50eq/UrSiNnSLIwcc43+AO5vFOpftkIyrRlSCm0GHjp4+mAZO+96pXGt46ugrqbUyaRugM+qy7MNdbzRMVyrkLFvB3uxtXABEV9o21+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302337; c=relaxed/simple;
	bh=xOiPzQG5hpo01bvySTc7sb1vRe23TGOx0iZgdr6X/oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nc200BVpofXo+xtRPI2axs6xGQZTZSD3fFqxFix/udcmBiExpvR75FZISBSD82Ajs4IrtkaEiCmF1kbEdM8lLdyskgmjC/nc87mwtpqtw9OlxBeNJCwKi4c5ZpOW8DGHPL6bYppjDn589RfQC6hFTZLdFvg7geQTH6RB9fysb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVUpgzNM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780302335; x=1811838335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xOiPzQG5hpo01bvySTc7sb1vRe23TGOx0iZgdr6X/oY=;
  b=QVUpgzNM9SPGqbkBVrmY0ouw5OYOJQep+gpZhiM88zXtAr+02WqXjaEH
   1eAIxppQUImC8oNzX1f6Ff+7Zz/VMcMB1T3QvJmYCKit6CTpGiGkFUHv6
   vSUUtTNgashbMNGxqpYKKX0pUOpZyyKW+LMGgbNdg8cWyEYPy7nvn8WgP
   RaiVkxj1J1/JKs5r2JxP5mnd0+GIwxJJ6GMQvv3xQ49Kp01sVeQAqZzyw
   5YgQSiYAzHe4pPa9NtKCn/VuGbNKbAsCii0Qzr5AFSN9/7wXoRuK7LL2U
   MBMXBCQVZXgcCfy6kjydZJlz4yAX809wf5HUm4yTr72EXE9hSSNWOyZsb
   A==;
X-CSE-ConnectionGUID: fwhcyf4lRiiZscqoyMRiCw==
X-CSE-MsgGUID: TY84Tbx8TG+5leZIEwc1VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81087004"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="81087004"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:25:35 -0700
X-CSE-ConnectionGUID: oJVBwrTUR0qRWAdKDleM4g==
X-CSE-MsgGUID: yW3UcSluQSmgHyxYpbHP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="239329691"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:25:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CF7E811FC2D;
	Mon, 01 Jun 2026 11:25:26 +0300 (EEST)
Date: Mon, 1 Jun 2026 11:25:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@amd.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, tfiga@google.com, ribalda@chromium.org
Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
Message-ID: <ah1B9h8baqGqZ8Zj@kekkonen.localdomain>
References: <20260601065555.150536-1-bingbu.cao@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601065555.150536-1-bingbu.cao@amd.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63218-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 493D361B6FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bingbu,

Good to see you're staying in the Linux media circles! 8-)

On Mon, Jun 01, 2026 at 02:55:07PM +0800, Bingbu Cao wrote:
> I left Intel and joined AMD, so update my email in the MAINTAINERS.
> 
> For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able to
> continue the code review from now, so remove me from the MAINTAINERS
> and remove the invalid email in MODULE_AUTHOR.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>

Dave posted a patch related to this:
<URL:https://lore.kernel.org/linux-media/ahiSOvQ2zQuHDHWI@kekkonen.localdomain/T/#t>;
I'm planning to post v2 based on the discussion and I can take this patch
into account as well.

That patch however is just for MAINTAINERS and I think it'd be best kept
that way. Can you post a patch to address this for the media tree? I think
I'd keep the ipu7 (staging) and Documentation/ changes as separate patches,
too. Tian Shu's e-mail isn't valid either, could you drop the address while
at it?

It looks like the ov9734 driver will be left without a maintainer, would
you be interested in maintaining it? I'd also add myself as maintainer for
the imx319 and the ov01a10 drivers.

-- 
Kind regards,

Sakari Ailus

