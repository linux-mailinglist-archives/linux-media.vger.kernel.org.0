Return-Path: <linux-media+bounces-66327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gsmAHiEwRmqPLQsAu9opvQ
	(envelope-from <linux-media+bounces-66327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:32:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA76F549A
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:32:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="SL/0VEPc";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66327-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66327-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D805B304809E
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 09:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681B047AF71;
	Thu,  2 Jul 2026 09:12:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5BE477999;
	Thu,  2 Jul 2026 09:12:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983548; cv=none; b=cHEcyAjncKs1u6PnC1Pnrp+w3L+CJJmSOxBRGrMNDEeSq5XgkM2tVCqDsafFcI/+Vs9pC3D7Vkww6dpOR0lj13hZLzfqvZEs6V2Lizp+o154B/SUc+Qd96dA7zCz94j+ytRoU/mkz0Cm/yCKbdSp7VP8OfcHs9l07H4WYmopBFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983548; c=relaxed/simple;
	bh=Re1pebt/H4sHm958IImha/A4UIlkgi79BYxbPtjPdEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ0mvi7xXloZjWpsqitmmu3PHG4HH+0XUctPaIjPba0ixrMX/5jwNX4D77zNL4ISPLfp654immwoPHLg/THmNyD8n5hQGWjns7Dnc41jHOkxGc6bW7Z+G0oaN73ShjqX+PkAjgC6LX+aPTQU4ZdSSk7mCaiT8RUSglkxzw5OARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL/0VEPc; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782983547; x=1814519547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re1pebt/H4sHm958IImha/A4UIlkgi79BYxbPtjPdEc=;
  b=SL/0VEPcH3q81CKLtK0HR0SCc7ZenXQrH41To7g8ILhqeJ/Jt5ZEpuNA
   vGAXTG485zxBp0LBacmPi+/lCdL8sfFwyB76Hoaa8pMecPPabCUini9Q3
   BTzkyFPeAhrTAS+Z80nvCv8lKE1NRY0avLV85obmUnjH7WkVyS3kuMWbW
   BqsxPsRJPF1FAkR+zuN87oZz/4EkW11ua6IVg6NQv02WyGqY5gXzwZHy+
   ywZlyZ6XrGWBDoLBa31lmJLjXXxeyMSFc49v3mmORpYZ07KvLyzsViXW3
   mRVi9jR/mVgeIErdTZwhUM1G2YFwsue+WDqOwxEVFa2cZt1N4Nl0rTO6N
   g==;
X-CSE-ConnectionGUID: As/yJg0oTHCsWIQREeCItg==
X-CSE-MsgGUID: WduCaLWqTnWF9dG9k1hIjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="86274241"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="86274241"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:12:27 -0700
X-CSE-ConnectionGUID: Gxe05u50QzWOZB9vpoljGg==
X-CSE-MsgGUID: X9J6+rLwQnaHPP924CYuVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="246455572"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:12:25 -0700
Date: Thu, 2 Jul 2026 12:12:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: error27@gmail.com, gregkh@linuxfoundation.org, hansg@kernel.org,
	mchehab@kernel.org, andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: fix block comment formatting style
Message-ID: <akYrdxIXmGbCxEV3@ashevche-desk.local>
References: <20260701161451.5442-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701161451.5442-1-bohdandmarcus@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66327-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bohdandmarcus@gmail.com,m:error27@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEAA76F549A

On Wed, Jul 01, 2026 at 07:14:51PM +0300, Bohdan D. Marcus wrote:
> Fix a block comment formatting warning reported by
> checkpatch.pl in atomisp_cmd.c to conform to the
> Linux kernel coding style.

This is too condensed commit message, use up to ~72 characters per line.
Also try to find more issues of the kind and fix them altogether.

-- 
With Best Regards,
Andy Shevchenko



