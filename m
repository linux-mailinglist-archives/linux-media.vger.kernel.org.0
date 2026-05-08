Return-Path: <linux-media+bounces-60981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGOFHRtW/mmupQAAu9opvQ
	(envelope-from <linux-media+bounces-60981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 23:31:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CA4FBEDE
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 23:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C4273019180
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 21:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25089224234;
	Fri,  8 May 2026 21:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf3IM3K8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5D2F8EAA;
	Fri,  8 May 2026 21:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275856; cv=none; b=mhFbmrGEbbwF0wPPuNSF+ffBhKEarorn0dNHdmiozlmQB4ctFe/n6Y2Tew0DjMAGKszxSt469X7kv4qyZeSkYL5bjAwe5X6JECI6mG6cmEeseHV5j7LPuRKeYzmS7ePZY/F9dwP7bqtga6w81KZlJB54VSFG/IjmVfPfa1psFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275856; c=relaxed/simple;
	bh=fmNVU123arkmAXgyG6MWQcKBrXV9SRxmcAVgo7wYBkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkmZPoNIAX8KUkwOuI6QNaQlht3efjqI8r4SDTYeyLL/rSzom8ieAPXHUHV9PTMSrwWZisN+HR+Kk/Ex5Yl9Hq11B5Kkj1EhbwhVvYbUSnoKVHhgnwFm1jX4HS4hgEbWX9ZMHHk4JpVLzOgxEhqUEMu+zqvalSaXiS/gk9VMEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf3IM3K8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778275854; x=1809811854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmNVU123arkmAXgyG6MWQcKBrXV9SRxmcAVgo7wYBkA=;
  b=Bf3IM3K88gvmGuFZns2yTMTpFK9kKtTp7lXE/wgIhV6dGQohGslG2YRH
   KRBzdbF4chfWtDqXqtqs+zyPi+FG2Uv2IYWhWRryt3x+WACBbmbxCEvtD
   mHvsfJqT+N2SclniX6EAElpM1EI3pPQSnJiNAAOgZR1XUjC7F3Th4A7ou
   nQo4tfJrDj+xMT9gjKTabJL8RfA6s8jNdxkUWQuetPzc6/JBKUD/Zj7WF
   EzJfqPg8f3ORAQECGqjZfMURkuDlkad1xSELL0Q/dIpCIwfBj+cfpNBSk
   JNnMqsA0+gkqLD7UVF9mTcQEBfBS639cmBFz/gS4CAR5Q7sVqXphG/FcK
   Q==;
X-CSE-ConnectionGUID: UCmWWQ/9SLWS3W44ofT+Fw==
X-CSE-MsgGUID: dOx9dDZeTvuHAFZ/MG86Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89845504"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="89845504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 14:30:54 -0700
X-CSE-ConnectionGUID: pBTPLuoUR7qr4UHHIYfXHw==
X-CSE-MsgGUID: 8tfo2Hl/TGivZ1N3O15AxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="233812811"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.130])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 14:30:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B376B122023;
	Sat, 09 May 2026 00:30:47 +0300 (EEST)
Date: Sat, 9 May 2026 00:30:47 +0300
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
	"Tsao, Anson" <anson.tsao@amd.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
Message-ID: <af5WB7z6hfuHUS1P@kekkonen.localdomain>
References: <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
 <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
 <afpSBiF8sUqulE-7@kekkonen.localdomain>
 <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
 <f68addf9-eb16-4c87-b281-b4f1dcc4cc63@amd.com>
 <afxcirtLHxeiaqF7@kekkonen.localdomain>
 <bd5ab106-e0ef-47d5-aefa-7304ad84105a@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd5ab106-e0ef-47d5-aefa-7304ad84105a@amd.com>
X-Rspamd-Queue-Id: D04CA4FBEDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60981-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Bin,

On Fri, May 08, 2026 at 10:52:55AM +0800, Bin Du wrote:
> Many thanks for the update and for merging the series, Sakari. Once the
> newer Smatch lands in CI, I'll send a follow-up patch to remove the
> workaround. BTW, do you happen to know how to check which Smatch snapshot
> Media CI is currently using?

How about posting a patch next week? :-)

Cc Ricardo, too.

-- 
Regards,

Sakari Ailus

