Return-Path: <linux-media+bounces-56676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEjHG2YMwWngQAQAu9opvQ
	(envelope-from <linux-media+bounces-56676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:48:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0240D2EF510
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF01930292DE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F66338552F;
	Mon, 23 Mar 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOhOujtP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2635C181
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259099; cv=none; b=LvjKgV28XiDcw3q4J51ep4NXQCIEUlhSrzKN0TNsWWssLrmLBL6YdZsB2hws6kV/R4rOhqiW6h9DW8Oi30PHSxpRLpdIz2nw09bK8wJH6VC9ftPlKCwQzVU+ttPwOzuYHMPhM5ekzOkPhwPAXfoKH5DFcj5fixOZE27ssmFQWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259099; c=relaxed/simple;
	bh=OODlxbqPYQUXCJQEQ8iZOrfup27M/jPEjIzgMxy7G8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V34Njl/IWMBXUYu15+i2VowqRybquxQarD99JevGK9Vps6OpGdAGrosWbGqpaYmzQSlbxstqmG80BCkhEpc8riMEIhOeqGJZWxGV/+eEPjOQOcJoIJ5Ux0yY4NPdUhQjAiReYIuU9DSKR572ooDY76FoyGih97DHY5kSZY7Obnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOhOujtP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259098; x=1805795098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OODlxbqPYQUXCJQEQ8iZOrfup27M/jPEjIzgMxy7G8M=;
  b=KOhOujtPXu7yAssO2UQEwDZqdUJmEHF42QkqOZ52lrKawBvOiFME/CEL
   uhSBTgmR3QWU1U6r0fB7t82KdMzvVWcHmKuuIfhllVAGp1GsQGwJkoMV4
   B7scqNh3v1Os3cxbxJsBFZECZLYlmq/dkqyraZWQbLoufmmWzO6Xi0OB7
   8ILwy8WEGvnHND4tAKrXjlulOCaiPqw5OaFrzRwpTmO+I/OFMGyhL1fkf
   +l/e5hcDBkacCbihg/hGhAcfSN8fXPafiMuvka4DaZK9KREEn+qF2Fodz
   7sNY61FQLZ6tVFLWyLNI/Sj5tnJsEW3YZTACmgFz1OjmaON47VV0esC3i
   Q==;
X-CSE-ConnectionGUID: bxPFe/jNS9qdYgyvFUY5uw==
X-CSE-MsgGUID: l0RutI2FTrK/tdM+oYamfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79111839"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79111839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:44:57 -0700
X-CSE-ConnectionGUID: BIjxPuyuRHeb8OrSa9RyrA==
X-CSE-MsgGUID: H+VygUxfSOSGuibavPhIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223045104"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:44:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3B5DE11F94F;
	Mon, 23 Mar 2026 11:44:58 +0200 (EET)
Date: Mon, 23 Mar 2026 11:44:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lian Xiangyu <lin25001x@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com, mchehab@kernel.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: remove 'U' suffix from register
 definitions
Message-ID: <acELmu8kD-F8NCLH@kekkonen.localdomain>
References: <20260321143132.661290-1-lin25001x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321143132.661290-1-lin25001x@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56676-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0240D2EF510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lian,

On Sat, Mar 21, 2026 at 10:31:32PM +0800, Lian Xiangyu wrote:
> The ipu7 driver's TODO specifies that the 'U' suffix should be
> removed from hexadecimal and decimal values in register definitions.
> 
> This patch cleans up the definitions in the header files within the
> ipu7 directory to comply with the requirements and improve consistency.
> 
> The modification was verified by comparing the disassembly of the
> built-in.a archive before and after the change. The MD5 hashes of the
> disassembly output remained identical, confirming that this is a
> purely cosmetic cleanup with no functional impact on the binary.
> 
> Signed-off-by: Lian Xiangyu <lin25001x@gmail.com>

Could you do this just for the hexadecimals?

-- 
Regards,

Sakari Ailus

