Return-Path: <linux-media+bounces-62275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONPwK62qDWox1QUAu9opvQ
	(envelope-from <linux-media+bounces-62275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:35:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8958DC95
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C3930FD193
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116893DD518;
	Wed, 20 May 2026 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XE9FAzUS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D93D4137;
	Wed, 20 May 2026 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280119; cv=none; b=slQno4e8qzgSQ2UuA+UPRFb7yeCXMHRMNqHkly1jsdfEVva0DN7CmZtjr6JAwd//kQlCg6ZueFH9CrR0jW4M9XeSjsclJQ+uRcN0vJ8ObXsL0e0grK4+VymR7N0P/RfToYkjPU56/jd5JdxUGw8qXmJSBdaS7nijD2tInVKfK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280119; c=relaxed/simple;
	bh=ZMIgseo9xUmLgOULtnzwyJP4V5EhQ5LcKhQlZKXDCGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6zpBUCly3Vhfj4nRLubssT4Ox2MZ3VjhRKpQrwZwjwqgzBByPZcjmwJTULJY7Tross8pr5VXq1/St156Vn9srMZgS+GqIoicqTAEknf2It3AHzT/rL/FvghObhUPW40I7s9P/XbYzz7aOGeYJkKPgb7hl+rcu2hFx1HUfTQR2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XE9FAzUS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779280118; x=1810816118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZMIgseo9xUmLgOULtnzwyJP4V5EhQ5LcKhQlZKXDCGY=;
  b=XE9FAzUSJtc0w0inqrgWT9s9s5Irz1pCW8c1Z5aHVnAeNzbGj0VOEiG0
   VyUva7kzIrM4i9VkiexkOlZ15PHSaI/lNh2Q1zDTlXGG9RSSniL7OJhc6
   4yLHPpRvykIXibxPiGc38D+Vih2lTLr5N4dTce432mUCpzgkXOnQ/SGBY
   kDmAV9AE4nUxDI3q9uMpJ4jFT7Z6q6tod7PwkM+Iw1lSutgwfypehZ2JZ
   BiYaunSDnKJaTD3gg24OS/NE1IQMPiGy+wuLwmy9VPOpR72p0fFREEAYl
   wJP9iP0gFcvewwXbjjtfSEiSUtDR50Hu/VHjJjRvxbZ29W+r5qlksizL0
   g==;
X-CSE-ConnectionGUID: eV8QhIdhSui5FQXKAIkq8g==
X-CSE-MsgGUID: Uq13KINeR0KVpaMy4yIiXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97604813"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="97604813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:28:25 -0700
X-CSE-ConnectionGUID: md0cLJo2R1ydSkafxo6geA==
X-CSE-MsgGUID: tIz25TIYTWa6j9U0JSZ8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="270513233"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:28:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E87B911F851;
	Wed, 20 May 2026 15:28:16 +0300 (EEST)
Date: Wed, 20 May 2026 15:28:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v13 06/17] media: ti: j721e-csi2rx: add a subdev for the
 core device
Message-ID: <ag2o4AaXKNTN7twV@kekkonen.localdomain>
References: <20260520120022.539913-1-r-donadkar@ti.com>
 <20260520120022.539913-7-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520120022.539913-7-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62275-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 51A8958DC95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

On Wed, May 20, 2026 at 05:30:11PM +0530, Rishikesh Donadkar wrote:
> @@ -447,8 +485,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  
>  unregister_dev:
>  	i--;
> -	for (; i >= 0; i--)
> +	for (; i >= 0; i--) {

You could replace this with

	while (i--)

as well. Feel free to post a patch on top instead of the entire set (see
the other comments, too).

-- 
Sakari Ailus

