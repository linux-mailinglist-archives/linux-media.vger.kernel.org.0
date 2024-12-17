Return-Path: <linux-media+bounces-23581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF79F4ADA
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CD56168404
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99B61F03F4;
	Tue, 17 Dec 2024 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3qL/SJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5EF1D5CCC
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438028; cv=none; b=GH9fX47CXuK9D2r/sArXsSxv3/7sDI5O9ZlR5awQS2GGqnqWP7IldiLzqYIxY/Dr2KlFlCQYt16RpmeQ/HONZC27OT/1S6SHKZlw7Vtmn9eo2osReaZq6ob4Br5vLoRBDSOZ1FhNDL/gow5eLmIMwZj/A5wGoLGhLSqBCUWmz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438028; c=relaxed/simple;
	bh=pgrvOm70yaP5MhZqypdfS4TRo3mwCyEwVSURTICSpJI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MIpHWD5J2aBrFYazIWYwyA3a9G1LHetrPkqMeGPpJMA5A7nskvosb2Ra8Sl38dJnySQGw06bdjDceUrkSfDLnHrqqLVLudfxXI926iK306AkTNdULN9yz3RRgio982VOSp0ukP2q+WqcrrrxOj0/1WnlneJ8Pl9RFyu1dMu44pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3qL/SJJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734438026; x=1765974026;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=pgrvOm70yaP5MhZqypdfS4TRo3mwCyEwVSURTICSpJI=;
  b=l3qL/SJJX3b8X68HhEnZqlAzC4P7t2b7DQdIcZwYHt1Y0Q3tHV0yl+Hk
   mIXZkAiOY4grbpMMaJbUr5c8/Nn0vNuuZmyDxQ333FZh1nuNYDbFYw8c4
   ANFMWBkieB8PDKinhfxhcMnoNkbd7w6V1u4wyQTat9tf4xZAoh/tx7y1e
   aDJtAL5Bg3TQ/H41ys9iDUh1lcNqI/u6AV6eiqs0LVg3JC4x/+RpdQ2V+
   cJfFGXLVZoYA22fMHb5H2eJCn7ojWQ5UZ+MALeY/472+yUfMnF/gpU0TW
   ZOI8df3nTPBBEX2p2Q/fJGKgPeeHH8J1M6vZW1HZgkOTKYQc9dGyaDCbS
   A==;
X-CSE-ConnectionGUID: 7k3sZG19TJq9NOtB5zmpwg==
X-CSE-MsgGUID: /rmptl4QRq+qc6/nl0DMwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35008952"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="35008952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 04:20:25 -0800
X-CSE-ConnectionGUID: O6imI1tqQnauxIX0fJkmJQ==
X-CSE-MsgGUID: krQjFYYNQP66jHn+Q2upKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101660289"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 04:20:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Subject: Re: [v2] media: cec: include linux/debugfs.h and linux/seq_file.h
 where needed
In-Reply-To: <676167d0.050a0220.cae6c.5009@mx.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241217100024.1858704-1-jani.nikula@intel.com>
 <676167d0.050a0220.cae6c.5009@mx.google.com>
Date: Tue, 17 Dec 2024 14:20:21 +0200
Message-ID: <87o71aqz5m.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 17 Dec 2024, Patchwork Integration <patchwork@media-ci.org> wrote:
> Dear Jani Nikula:
>
> Thanks for your patches! Unfortunately media-ci detected some issues:
>
> # Test virtme64:test-virtme
> Final Summary: 3607, Succeeded: 3607, Failed: 0, Warnings: 2
> Warnings Found!
>
> # Test media-patchstyle:./0001-media-cec-include-linux-debugfs.h-and-linux-seq_file.patch media style
> WARNING: ./0001-media-cec-include-linux-debugfs.h-and-linux-seq_file.patch: Don't Cc hverkuil (Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>)
> WARNING: ./0001-media-cec-include-linux-debugfs.h-and-linux-seq_file.patch: Don't Cc linux-media (Cc: linux-media@vger.kernel.org)
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.

Really? Just to drop Cc's?

> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68302192/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html

Doesn't say anything about Cc's.

BR,
Jani.

>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

-- 
Jani Nikula, Intel

