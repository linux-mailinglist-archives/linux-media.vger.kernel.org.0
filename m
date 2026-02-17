Return-Path: <linux-media+bounces-52962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHPTC6kolGlGAQIAu9opvQ
	(envelope-from <linux-media+bounces-52962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:36:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232314A060
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20184301158E
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818BD2EAB6B;
	Tue, 17 Feb 2026 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APsNHpFX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C082D3750
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317411; cv=none; b=ilqJa3E+vxIdqkAE2Tgz7G+kkMf6xv5RohaaMg5xvHNm2NSvpk9LKoknVOhUVau62Hud8AWwXTIESRDMMVtoR+hskBweDnOG82qhu85TJEgE5B8npwvNGcCETw3fLPewLHicUBkvsSrwiVjEfvNKDxqYacIlo2PSs/CVNwZIr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317411; c=relaxed/simple;
	bh=6IZLt2fGn62NtVQYYAPhH+ZZKGeGFpmxQYiP8YrdIBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW095BzawyiW10KiF6H2VDMWcy26radVHILHu8eQFuz/X+vJnNwjgI+0EjqKL9cBT/CY2s9PFyrOADrwXBEk1+SpZvKwgubTSbxaWmjEABGtI8O8A4XSj48lVW8X4n+w2rlPkUdi82+KWe7upyKs5kMPP/c2u+iJnhK3cM93X3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APsNHpFX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771317409; x=1802853409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6IZLt2fGn62NtVQYYAPhH+ZZKGeGFpmxQYiP8YrdIBg=;
  b=APsNHpFXCYLtWTHoRGnPn78tzUuHDAzvuoFIxnlzQKA0LX9ADbtCErtY
   tRooHNYmY/erve/k905W0/pJDBU6UTOPyY0UIIoXuKMF4qujEq6sW9iyo
   LIYa2UJtsFin4rnfbVv5RUeZrUH4sTqS+e7JOWdqX3Uej9NbsmZVkWCyT
   EFmwltmmWPHcsmmSk7ovdAgqtJel6Dqq17KlVHIoOXaF7q4CjzqMUIqja
   ChXHbeOV1qRuJNAazXrKwwqyXMZmGZbPpCD6fXr2Ld8rVd3ej08L+7GUT
   1ouWoe2OuMQAU5jMFatUVrZM/zlx7CjGzsJuS15ZvsdVapRTbqbo7AIa7
   A==;
X-CSE-ConnectionGUID: ibD5MPRRTGOazeOBvotlHA==
X-CSE-MsgGUID: pU7yfOkRSPOpglYbN3H5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72283422"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72283422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:36:49 -0800
X-CSE-ConnectionGUID: 2I+lDmLfQJiAqRUrdkpu8g==
X-CSE-MsgGUID: tageMruSTHu1ouGfPEedjA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:36:43 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A13E811FC4C;
	Tue, 17 Feb 2026 10:37:05 +0200 (EET)
Date: Tue, 17 Feb 2026 10:37:05 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 09/14] media: Document enable_streams and
 disable_streams behaviour
Message-ID: <aZQosbJprwTSn9aC@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-10-sakari.ailus@linux.intel.com>
 <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52962-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 8232314A060
X-Rspamd-Action: no action

Hi Mirela,

On Mon, Feb 16, 2026 at 04:03:40PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> In the subject, perhaps use improve documentation...as some documentation
> already exists. Other than that,
> 
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks.

I think this needs to be documented elsewhere, too. Generally there's
little documentation on things like this so far.

-- 
Sakari Ailus

