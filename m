Return-Path: <linux-media+bounces-56957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCUXKoegw2kbsQQAu9opvQ
	(envelope-from <linux-media+bounces-56957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:44:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425D3218F9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF3D43012BC4
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D0E30F540;
	Wed, 25 Mar 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+kmQFwb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCEC330B01
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428215; cv=none; b=sJ6FC4bTXxcWiU4sqUKaGrZPYsPWtIXJ8vAonxBYKXlm4wrH2K9BwSd3bYpHTdwQ1x8AASHUAVF8uGGCQzuVaZU9ncam/EkQO8+GD1aPPfaQJtabC/ldHhpnw+q6Af0HVNoHCs/EneEBrGq0zVke6Qv7lzOdfOoC4bdQAuFeYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428215; c=relaxed/simple;
	bh=ncrO6JQUjK3dUOugqaArO5iN/w0R0RtmMEPaaBuunm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr08RqmwrCdmqBefXTVCsqO6Lt7c+Vw/QrCpRj18ean/2fE+qy7U6MxtfyVQ5b9hZ+fYZbyg0j/6PXaEUXdz6DqEyWq6UcUdwFolZBmhZwZtVoPDRgmpGxDLm8AsqKZiGLOryy1iuwb0qEDBSobhPt2ThBiyHNcTT/Wucy4DYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+kmQFwb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774428214; x=1805964214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncrO6JQUjK3dUOugqaArO5iN/w0R0RtmMEPaaBuunm4=;
  b=Q+kmQFwb1aG3bY67B8rxGjhS+hBcBKZBdTJG2m1IW314jpr90YDgsY7H
   ox5eFInS/bM16ZaT+8QvRj6MxU+PkAnOyerFf+HT/k5RwJ0MSQorHvSF2
   ZyH8K/OwJtqKebA+vpHs67Xm0QWi8/kxKmtnN4iBbxMBk2UbFn53NB0xb
   u7ai7sysuxbsYFK8dNJWdiNTfD+/gcf5vS3fyzwJSpSgg9Zh9L49pUtIE
   GeFR63/x95GI+sTc8ytllJeEbjJFva+qccI2ZiQGoOiWmqhV8QxxQQFpr
   2DgWEuguJ8HordttAJOKgwkn++45SvXiGAOHs8ua4wqGhjd6xHhxrRKPy
   w==;
X-CSE-ConnectionGUID: O1ADa3eURayMoxOviCahyg==
X-CSE-MsgGUID: 1O+5ewANTK+44a9F6VjTkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75428081"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75428081"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:43:30 -0700
X-CSE-ConnectionGUID: 9IdeZU3OQf2ZgJMrHnV5XQ==
X-CSE-MsgGUID: CSWPfrS7R1+5T6MLof0wqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229390068"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:43:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C0E8F121CF9;
	Wed, 25 Mar 2026 10:43:30 +0200 (EET)
Date: Wed, 25 Mar 2026 10:43:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lian Xiangyu <lin25001x@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com, mchehab@kernel.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: remove 'U' suffix from
 hexadecimal literals
Message-ID: <acOgMi9Ww0MjPAnq@kekkonen.localdomain>
References: <20260323173140.993436-1-lin25001x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323173140.993436-1-lin25001x@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56957-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 4425D3218F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lian,

On Tue, Mar 24, 2026 at 01:31:40AM +0800, Lian Xiangyu wrote:
> The ipu7 driver's TODO specifies that the 'U' suffix should be
> removed from hexadecimal values in register definitions.
> 
> This patch cleans up the definitions in the header files within the
> ipu7 directory to comply with the requirements and improve consistency.
> 
> The modification was verified by comparing the disassembly of the
> built-in.a archive before and after the change. The MD5 hashes of the
> disassembly output remained identical, confirming that this is a
> purely cosmetic cleanup with no functional impact on the binary.

How did you come up with the patch, is it manually written for instance?

-- 
Regards,

Sakari Ailus

