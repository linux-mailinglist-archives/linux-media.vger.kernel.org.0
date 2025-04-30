Return-Path: <linux-media+bounces-31371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF690AA452A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4122F4C6B53
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331DD1EF38F;
	Wed, 30 Apr 2025 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3TS09Ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44100208AD
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001376; cv=none; b=H+/7nuMRjGSyfpv9sNdjo7e9XbkODxJ+rqeaW5HgyIT8a84jrBiB7H7UaZRCV6CO52YOInv56Yzcygia060xOYSKuYEUHhYX1S5J3Fe7kIhcK846o2skEac6C6XnzWIk56WuSgeJqLzGqb9nkC4CO+G/Or9KLwkT66GSH29UXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001376; c=relaxed/simple;
	bh=zKTo5dhr5mNm39/nZARzw8hP43X4hdC/SUFXb8i5TPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq1ae/lHlUydpdhswwasF0n9LOaTQ5pVNbNEbmr9PXkaF3BgjeeSRH9PLq4YkcrxjzBiOgsBRG84W/Tiu9ZYVoFGfdEhEHpeu+q6trzc2juUaSdUKNrAP8sESq9K0++9z2XPGPuMBHYaiqc504u/PgVV0vmaQvsyPtAlkArwR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3TS09Ic; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746001374; x=1777537374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKTo5dhr5mNm39/nZARzw8hP43X4hdC/SUFXb8i5TPg=;
  b=N3TS09IclQNr9myh0F1CIdmiLIvZObzFsfYMa2U8UdSHmOWUERQCv8Tr
   nCQ8XYo8E01anlzPgRAjX4HVul+ylA/HhfCNZG2ST3+3ImcsmHfg7ldyI
   Wgx2kb+bd6sg1n9cU5eRem6SRAYTeT9IZpLvls005qaEfUGDURUqI4ELn
   uKshRm3SQsbmSTXTAPpj6Ag1kcUOiaDlftKEwpls6KZW4ucWlQ6zIj4OU
   9Xx/KiUbS7lBTYqWzKIQUnC1UleG4AjuoqH4cwuAm8lqPPuSLP7lufJbD
   b5TWk5Fk3w8VC7hlscx4Q/dMijZhRzck7PCXnGHX9oTO955idXtmfexsi
   w==;
X-CSE-ConnectionGUID: TpGx4UDVQE2BSfakAsr0lQ==
X-CSE-MsgGUID: cbiS1jwCSpaDbhlAfOLJAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46897388"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="46897388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:22:53 -0700
X-CSE-ConnectionGUID: xNCnrd3JS+G5C4Kf6g0Myw==
X-CSE-MsgGUID: 70tn77ygQ5eabcx8ybVDIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134998702"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:22:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D969711F7E7;
	Wed, 30 Apr 2025 11:22:48 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:22:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [v4l-utils] [PATCH] v4l2-compliance: Don't perform blocking
 DQBUF test on MC_IO devices
Message-ID: <aBHd2FUeOCjLlnl-@kekkonen.localdomain>
References: <20250429203922.23078-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429203922.23078-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Tue, Apr 29, 2025 at 11:39:22PM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Streaming on MC_IO devices can't be tested by v4l2-compliance as it
> requires setting up a valid pipeline first. The blocking DQBUF test
> therefore fails to start streaming on those devices. Disable it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for the patch.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

