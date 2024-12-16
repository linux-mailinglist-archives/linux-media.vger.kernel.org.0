Return-Path: <linux-media+bounces-23453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB459F2B7A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A625188BEBE
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99663201262;
	Mon, 16 Dec 2024 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3pBLJpr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF391FF7DC
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336197; cv=none; b=qSxkMJgjBKmBAqze4PfoDiyW8NSMX8Jk55qtKjIdr9/tn/+pXErJ69WSyF1gcym2pxKQfq2s7I6vND/3pTBZ9t4gj2Q7fFCHJXWHp38+mSnWFIFCWbgLVhUypy9jqkRPQ677UIFsKN8AydMvP6mEisXUOWTlPnRd0dJQIfkyXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336197; c=relaxed/simple;
	bh=g/7FpQqVu9NQ49Rjd5uyFFWdwSdGNIyIwvRhD/iPe98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+tq17mK8nyyJ4cc6YzNn8uSpsGavLfkhrAAYT57e7zbKOZzpEUpMl2iXllwFPfQJdaRXZDRzx+e5BoHYDEUpGFeajJYvnWJjX3Pxm9BVViP5KSFfMjsC1aU9aICfZUvNuKN+7WvQ34w3aqOqHe1f2bxxFGWZ+PQghL9jM/3Q9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3pBLJpr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734336195; x=1765872195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g/7FpQqVu9NQ49Rjd5uyFFWdwSdGNIyIwvRhD/iPe98=;
  b=E3pBLJpr+8Sy/1kfVLcN8oC5IzDoPO1slloHyGc9iveMnYrJvH4XL8nQ
   sx9yFGFPWZsowiGuGVNDI2Pyw/jbCsqh0uDEpm9tRnu5c6H9Cf4FsRyM5
   qTeSCXh6S7MkBbtlqrIROOiLXO+bgm/tVYZiBZSnW2CwRImCFRIysotKu
   c0dDdEVbfuukObTH8dZFz18UrAAMBmSq7V7IULF3GFFn+y5+lxqRGsAq4
   xPRO8QWCB37A9dtXAqUKvCF/SfUaWKlRJxwfvJ1SyWc9Lp6/Wec0Zy3XB
   vM8zoTb47HvbxSegtBKWTgfkFwGpvU3ewYgDhV6gBEE5TADJmfYaacP5L
   Q==;
X-CSE-ConnectionGUID: HtZeO34WSC2HhnbpHkBPDg==
X-CSE-MsgGUID: y1UPGig0Tk6DqdoF5+VDsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="22293726"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="22293726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:03:13 -0800
X-CSE-ConnectionGUID: Jepbq/vBSnae1dgjX5K39w==
X-CSE-MsgGUID: olT2vUftR0a83iEGL3StBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97920747"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:03:11 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6F0F411F9F7;
	Mon, 16 Dec 2024 10:03:08 +0200 (EET)
Date: Mon, 16 Dec 2024 08:03:08 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <Z1_evC9EsHnXuj_r@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215170832.GI9975@pendragon.ideasonboard.com>

On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> I think this should come before 4/5.

Because of...? Both are needed for this to work.

> 
> On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> > Obtain the link frequency from the sub-device instead of a control
> > handler. This allows obtaining it using the get_mbus_config() sub-device
> > pad op that which is only supported by the IVSC driver.
> 
> "which is the only method supported by the IVSC driver"

Yes.

-- 
Sakari Ailus

