Return-Path: <linux-media+bounces-25704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B99A29D85
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 00:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0566166890
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 23:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D6521CA12;
	Wed,  5 Feb 2025 23:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQf+pgye"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2896E215778
	for <linux-media@vger.kernel.org>; Wed,  5 Feb 2025 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738798000; cv=none; b=VpII6pvm6T3IP7tXZtENDwcD+db0nkKMIDIPEAX9F1M6Zw3sbzG2h5F1Hks/O8j44rkESHkU8w4OjT7V1r2RLqKfzACOOVaiXD75xmzQpsLqUW0nly5/yTXa3Cx7vIkM+SIMVcyutDei2mlr1I4/s61UUr1pz9bveWzLMArVIro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738798000; c=relaxed/simple;
	bh=344zlsWZFLp08/79f1oeSkK+7bnjlm2pn2n6U2NbmVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnCu4LrUrOUq8OSqy01VIFKqImrWB2iify8hfuRm7BLr58kdpeh3b8iNFcHI5mGXPtZ/b7SecQp+QQ3K/8KrvKuX0WZMSfJ3eXXUGTwhMfGyivQmWsJVDEeII1Q+VFI52/ffG8VcAO7+SQn1YwFi+cjNTkvuK7rNlWEKchsgM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQf+pgye; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738797999; x=1770333999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=344zlsWZFLp08/79f1oeSkK+7bnjlm2pn2n6U2NbmVA=;
  b=LQf+pgyemjB1Wl7V7ZkjWtML1Cu5BlSL7rOQcloHDXLVxKNN1CBuTBgG
   PyLErtK4OT+FtrRRE4HdWv0KxcUqnQ8aBU/DobrXI8iF4KfmOAMNIdlCl
   pSalwZbD/uAjiu85a6hnrxXL8byTyDU9XgCwUUpCFhb/JCBzXtwqnfGTc
   BBPHLJs3lMOY9KsYcij9AJ91vbwgPT4LJUsJVrOMZc+MeGSTM91kPM4K8
   tkvRU7baGtfaAs9KUQKDt5w4xuUUxzT5RDYyt7A9A6v4d66jPluhaR5rx
   Ky+LgGZRdfD9oEq3PH7vdG3D4M4l/m7MVjVC5XICkzpMJubf8jsX1kaE5
   g==;
X-CSE-ConnectionGUID: o3l35cl/Qqi6NW5MrCQE2A==
X-CSE-MsgGUID: wxME9PgMRferNDXDaCN9PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39544471"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39544471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:26:38 -0800
X-CSE-ConnectionGUID: NNvwL6q9SfiL3RI6cCjTCg==
X-CSE-MsgGUID: MKCK50XEQCO3VX9EBybfZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148237510"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:26:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B48ED11FA93;
	Thu,  6 Feb 2025 01:26:33 +0200 (EET)
Date: Wed, 5 Feb 2025 23:26:33 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@kernel.org>
Subject: Re: [PATCH 0/2] Fix PM on imx214 error paths
Message-ID: <Z6PzqQiPdc6tq8pQ@kekkonen.localdomain>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
 <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>
 <Z5DexPyuveWLzlJm@kekkonen.localdomain>
 <19c569694ef2726172fced5a1a30ecab912553d8.camel@apitzsch.eu>
 <Z5HzVupCvL7LBhbC@kekkonen.localdomain>
 <85fe1a1ccfd446e98afd648ef70b82a95943c98c.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85fe1a1ccfd446e98afd648ef70b82a95943c98c.camel@apitzsch.eu>

Hi André,

On Wed, Feb 05, 2025 at 11:17:33PM +0100, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Donnerstag, dem 23.01.2025 um 07:44 +0000 schrieb Sakari Ailus:
> > On Wed, Jan 22, 2025 at 10:00:54PM +0100, André Apitzsch wrote:
> > > Hi Sakari,
> > > 
> > > Am Mittwoch, dem 22.01.2025 um 12:04 +0000 schrieb Sakari Ailus:
> > > > Hi André,
> > > > 
> > > > On Mon, Jan 20, 2025 at 08:57:39PM +0100, André Apitzsch wrote:
> > > > > Hi Sakari,
> > > > > 
> > > > > Am Donnerstag, dem 16.01.2025 um 13:46 +0200 schrieb Sakari
> > > > > Ailus:
> > > > > > Hi André,
> > > > > > 
> > > > > > I'm posting this separately as it seems to be backportable,
> > > > > > your set needs to go on the top. I've pushed that to my
> > > > > > "devel" branch in my git.linuxtv.org tree
> > > > > > <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
> > > > > > please let me know if you see problems.
> > > > > 
> > > > > The patches look good to me. I don't see any problems, but I
> > > > > haven't tested the error paths. That's why no "Tested-by".
> > > > > 
> > > > > Acked-by: André Apitzsch <git@apitzsch.eu>
> > > > > 
> > > > > Shall I send a new version of my patches rebased on yours or
> > > > > can my patches be taken from your "devel" branch?
> > > > 
> > > > If you're fine with the result of my rebase, there's no need to.
> > > > 
> > > I'm fine with that.
> > 
> > Ack, thanks!
> > 
> 
> What is missing to get your and my imx214 changes into next?

It'll still take a while but shouldn't be long.

-- 
Sakari Ailus

