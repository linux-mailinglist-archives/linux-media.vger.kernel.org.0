Return-Path: <linux-media+bounces-62121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GwWIsRBDGq4bwUAu9opvQ
	(envelope-from <linux-media+bounces-62121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:56:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 092AA57CF67
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5298532B3194
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16963F4DE8;
	Tue, 19 May 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSH1Ejl+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFD33DDDAE
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187237; cv=none; b=KU1WUNo78erNxhvyGXnCcMsJo6Z4TVVwt1/6YZU08uG7qPqNzNDm0q96JePYi+v06KmMVd9nyFzh5boH2np61JZgtPEB9ZfvETkRGAqSpD/7jupaoRE5W26Lo21Wn1JX4fi4EShC3J4IjhSsM/qFQm/Z4LbJxP5CGX8LAZXeTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187237; c=relaxed/simple;
	bh=Pjhp4WSR3W2pV67WKsFBUqMBt4Oce8Sw4jBcSGpzcBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V41MgunwQ32kIGRwJCOgjG2HTtqThahw7/Gkd4R7Htxj64IErGJgF5tqB8UXXAST2AvOt0dtIr60MhUUzRDVuSuC+Nk691luWE2JBAl5jtLZIDgF4SsZFrFUq2x7/8ZvIIrNGGRoGPzHY6iNKIJBrtxM63mr4ZNy2BS1Ftqk4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSH1Ejl+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779187236; x=1810723236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pjhp4WSR3W2pV67WKsFBUqMBt4Oce8Sw4jBcSGpzcBM=;
  b=GSH1Ejl+bUg1ul8scSeyhTwzjvo1ALCLexzcfIxyt9yvoQZ05t6ZiYob
   /pms7QF2cLJqjD7MSLeYwTCU8STnmCIif11+PtzBrctaFHF1PGpwpj8xO
   CrUU/lR4aODtrbCtvNXaNXEWFecnVnb8RpaHnY59/cVQmVsWt3idCKitg
   kGiksthnbpraj6DoVQnRkYSo49LKGFxjiYVyrAqTYQl3hRpH4w/ntxICC
   ZT5JaKBIn9ObvbtPLpmNMjKlVZnWqbLieepbvkntdGju5gCkiXrP7dIUM
   PPJCs04O5OAn/X1gtLz7Xp5t/Nz+KVcmYCQ47pzNygI+oukw4rQDNRKy0
   g==;
X-CSE-ConnectionGUID: rrHI6dCQT82utDzftS+AHA==
X-CSE-MsgGUID: au6qhBGzTV+IIIA+CqmemQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91527094"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91527094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:40:36 -0700
X-CSE-ConnectionGUID: axI6mwZiTW2yz3tRYXaVCg==
X-CSE-MsgGUID: kIZeYygnTHGZpu/DkU9eSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263513569"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.217])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:40:33 -0700
Date: Tue, 19 May 2026 12:40:27 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH v2 0/2] media: i2c: cvs: Add Intel CVS driver
Message-ID: <agw84jsC6hrAduxX@mdjait-mobl>
References: <20260514184431.288353-1-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514184431.288353-1-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62121-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 092AA57CF67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

Thank you for the patch:

On Thu, May 14, 2026 at 11:44:29AM -0700, Miguel Vadillo wrote:

[..]

>  MAINTAINERS                          |    6 +
>  drivers/media/i2c/Kconfig            |    2 +
>  drivers/media/i2c/Makefile           |    1 +
>  drivers/media/i2c/cvs/Kconfig        |   21 +
>  drivers/media/i2c/cvs/Makefile       |    4 +
>  drivers/media/i2c/cvs/core.c         | 1007 ++++++++++++++++++++++++++
>  drivers/media/i2c/cvs/icvs.h         |  495 +++++++++++++
>  drivers/media/i2c/cvs/v4l2.c         |  618 ++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c |   13 +-
>  9 files changed, 2165 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/i2c/cvs/Kconfig
>  create mode 100644 drivers/media/i2c/cvs/Makefile
>  create mode 100644 drivers/media/i2c/cvs/core.c
>  create mode 100644 drivers/media/i2c/cvs/icvs.h
>  create mode 100644 drivers/media/i2c/cvs/v4l2.c

Is this series missing this patch ?

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 530547cda8b2..3a6ff694047e 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -848,8 +848,6 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
 static const char * const acpi_ignore_dep_ids[] = {
        "PNP0D80", /* Windows-compatible System Power Management Controller */
        "INT33BD", /* Intel Baytrail Mailbox Device */
-       "INTC10DE", /* Intel CVS LNL */
-       "INTC10E0", /* Intel CVS ARL */
        "LATT2021", /* Lattice FW Update Client Driver */
        NULL
 }

--
Kind Regards
Mehdi Djait

