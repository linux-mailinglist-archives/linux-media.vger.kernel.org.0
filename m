Return-Path: <linux-media+bounces-60480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ErZFdVS+mkJMgMAu9opvQ
	(envelope-from <linux-media+bounces-60480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:28:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1154D3A81
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98D7930C9706
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 20:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADC93CBE7D;
	Tue,  5 May 2026 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bd30qzXF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398583BED44;
	Tue,  5 May 2026 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012685; cv=none; b=VMX3ynr9zoCdBL1554NmkdgnfEVmJEvs0d7BWZ0uFjqz6GGE8pt7Q/w2lwT8VC5LrH1FyuLnKBoL01YDL042+kJhd1p5cmO7QWZFbfdoXKqxG6FlWicusF8fB+iFLo9RJpOjmXczdNthD3E9USVX2Qvw+iTYu3/gh21sbqeit7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012685; c=relaxed/simple;
	bh=zjpAZYlprpwUIIh/iR+U647UXby/sCyGHeatL0h07XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egpQRR7GhTWtJ5hUGiXVKTEhFR4BIsVKMgKZjaT4QanS2SZVXjjaGWT+/xSQ3vc8i+WSHcqYxmaBSPHf4Up1r+TYvO05gKQ0apynJ8GrOCdUOHraV2btZCIdDQ1e/fw/cNxfCcrkndXMsSkq75qzgdoyyiIHw0bibg/7Sr9MPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bd30qzXF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778012683; x=1809548683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjpAZYlprpwUIIh/iR+U647UXby/sCyGHeatL0h07XA=;
  b=Bd30qzXFP2VkzbTpRP1YmM0e0i81C76OTic9XhHDR6Qj22nUCcIpeyjx
   fGiDHGUqjxr6PPc/HuydaaA8kvomVs9UT/DJ3gUNmYJgLAbK2QZ4POv8w
   pignUJ55ZddmBHRvMY53mBgGgrWZvNM/5ii7okyCIQUkIWTPWhtrt0NYk
   RgYei7fktu3gkjvNIriVH4dJcMIItDjtqZ1tBPcFL/VG/ev/5TsQ6C2E6
   xa1jyEtx4EpHzevrH3Y7gJBAyAHXPkTiFCumTZ3of3avKioSRLMBasDFf
   PxCC39IEupqo7t0IEdcPW4KTAyY2I/sPVjKD0wpOPvgnWALmdKoellb1w
   Q==;
X-CSE-ConnectionGUID: PBSS3UuyTzecTsjo5x+7FQ==
X-CSE-MsgGUID: F5W0ZUaSQAu68cHKKPc5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78945717"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78945717"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 13:24:42 -0700
X-CSE-ConnectionGUID: Ar2fmW10Sa6Z2460pbd/yw==
X-CSE-MsgGUID: SX+N1SmZQ+CocHOS2q0t3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="235782163"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.139])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 13:24:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8DB53120B10;
	Tue, 05 May 2026 23:24:38 +0300 (EEST)
Date: Tue, 5 May 2026 23:24:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sultan@kerneltoast.com" <sultan@kerneltoast.com>,
	"Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
	"Li, King" <King.Li@amd.com>,
	"gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>,
	"Jawich, Phil" <Phil.Jawich@amd.com>,
	"Antony, Dominic" <Dominic.Antony@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Tsao, Anson" <anson.tsao@amd.com>
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
Message-ID: <afpSBiF8sUqulE-7@kekkonen.localdomain>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
 <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
X-Rspamd-Queue-Id: AF1154D3A81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60480-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	BLOCKLISTDE_FAIL(0.00)[100.90.174.1:server fail,172.234.253.10:server fail,10.64.159.148:server fail,192.198.163.14:server fail];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid,intel.com:dkim]

Hi Bin,

On Tue, Apr 07, 2026 at 03:19:20PM +0800, Bin Du wrote:
> Hi Sakari,
> 
> Thank you very much for picking up the series and for updating Patchwork. I
> really appreciate your help and support. It means a lot to us.
> Yes, that's right. <20260303224433.87242-1-kinncj@gmail.com> is no longer
> needed.

The Media CI indeed does check there are no warnings from e.g. static
checkers such as smatch, and this lead to build failure earlier. If the set
would be merged, this same smatch warning would pop up as an error
elsewhere. So in practice it doesn't matter that the smatch warning is a
false positive, it needs to be addressed. You should check smatch is happy
with the updated code.

While you're sending a new version, can you address the new checkpatch.pl
warnings, too? They're trivial.

The best summary is here
<URL:https://gitlab.freedesktop.org/linux-media/media-committers/-/merge_requests/278>
I believe.

-- 
Kind regards,

Sakari Ailus

