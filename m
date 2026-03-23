Return-Path: <linux-media+bounces-56687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNY8HFMSwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:13:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8012EFCE0
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D59B304A9F5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2C1389DE6;
	Mon, 23 Mar 2026 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs9cNHzr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B8A389E07;
	Mon, 23 Mar 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260426; cv=none; b=cu+JRAUaoNQXdi+K56ElV1N5+6On6XD2n14p/I284ZrU2SSEC5Zbm9frESyl6mReFlVjNiCfm+V3SO9SWSEMauXnkXAarM/n7vXaA1CUvKJFoMsQZRjmjM6130xf7pXyy6am6EkajQhSoWPXA4ahwo73EqSdyKCic4JZoXunYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260426; c=relaxed/simple;
	bh=yySN1S0XOHfQe1QlWEaf8tJOPFwXkYxkB7plS6mbTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Shcp8B9GbzQFtfSNh/KFZNjwhR2CJYEVn8PmAyeSEy3MlnHqfDIkoY1Fig1U2bRDmzv5yqAJNVQPSr3ybjAxfnQRR3gTVsl4h5tpR226TKQu5aCL32GIKezTyOi0paeHLmrYpV5rH2VLdDSfVuUM+A9fELyaidLTKSIBqp0KWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs9cNHzr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774260424; x=1805796424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yySN1S0XOHfQe1QlWEaf8tJOPFwXkYxkB7plS6mbTPQ=;
  b=Xs9cNHzri64CplqF3M8fIewlE+ebkDpr2dsAKC2Q+0ixJsonNpcIRrgS
   rji4WMilS+sRE3z0nEJsLzOAEVMJVXEBMSxu5O9x3M/kmkgPCxs1Sewvt
   /Jkbarv6+f3ZZHPxcDKxF6h8mQrshrEPvzsNCyZptcPVkLPeH+cNGdhxq
   ZnuqdIVM2q/28oF2tZwJRa+RGGL2eEIBIbtaCXQu3UEx7+qZiWziFHF06
   pcb8oA31BNknsJm/MmnRqWyTzL8XqmF5zYOrjpPC1ozD4SETdhKHEUYlO
   At1hElX2oAms3+EVc84hFe10xSxgGdPDRLA+tOpoxHYPt4IgfB68DhKbr
   Q==;
X-CSE-ConnectionGUID: oRIquYEeTEaoxHRp3XMoiA==
X-CSE-MsgGUID: X9pkGNMYSGatdtZfsBm5nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75320386"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75320386"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:07:04 -0700
X-CSE-ConnectionGUID: JqRv0AmJSX2q/+/8WHYtYg==
X-CSE-MsgGUID: gejzjzQMRDS1jYFJM92o3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228053416"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:07:01 -0700
Date: Mon, 23 Mar 2026 12:06:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix spelling mistake
Message-ID: <acEQwoiv_IxLrrJc@ashevche-desk.local>
References: <20260322113222.27488-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322113222.27488-1-med08elkadiri@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56687-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: CD8012EFCE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 12:32:22PM +0100, Mohammed EL Kadiri wrote:
> Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
> comment within system_global.h. This improves code readability and
> searchability within the atomisp driver.

Check the whole driver with `codespell`.

-- 
With Best Regards,
Andy Shevchenko



