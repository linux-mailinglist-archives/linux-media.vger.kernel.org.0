Return-Path: <linux-media+bounces-55434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGVMIuKvsWloEgAAu9opvQ
	(envelope-from <linux-media+bounces-55434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 19:09:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1432686E4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 19:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4400A308706F
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D4E3E6DDF;
	Wed, 11 Mar 2026 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQqIYRjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA75F23C50A;
	Wed, 11 Mar 2026 18:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773252566; cv=none; b=Lj3WWzP9uwBLLeAbMWH+pXQxV35mCztpniq2q0L4iiSfpQE/QtGscpRkJ1VC5gYjZO0BIcxM90kJIcB7hgPvjqKQWrRt7UnlQjpGQqYNsGjy9rp3WHiEhXP7P4XJM9tWo4Lxd2DS9sdB7CrX8izLclzp2Op0MK/ysh6aZiDv+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773252566; c=relaxed/simple;
	bh=p4kljF+7h/WMXoMv/oWh7cct0xIvAxduOIZcEcwEq+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cK5LMdqtCswGr4hv1WFmIwWwF/KVXVbUzu4BhaXFd9+5OY4r+VKh2QkDeYwU8pUS4+4Q1+Myo+x26n59aYv9Obn9vWb7JDGpd32cxr2iVnT4Rrk7mT/0DioUuaeltbefR1YguWF1TRlujl5X1DXM8m94IHmBcuRBv5fmvXznnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQqIYRjQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773252565; x=1804788565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p4kljF+7h/WMXoMv/oWh7cct0xIvAxduOIZcEcwEq+8=;
  b=GQqIYRjQXkYjSuFg+9HMkBuq2iINA9U5wgkuHRs7Zv2vR8LBpzUtSaGZ
   hPkbobAk1ps3iu0CdY4t/ut3gUkAYbGEZbGqY2EexXKbOshGcL4Ipr+wa
   LuDHqNTIrOptg3MAYfQXtSNduXw+uFVP+Guo/3GHxTwB6YOYRtC5GF5Uj
   sOJyaceADXZXn3TZ6AUhPx/0z5HZAurnNmwGPnfOpd0336ytCItj70IWx
   /A4bt+BRr9vpp9cPVseUMWnX7Ns6ZvdffCtPqLf1Rk1mwSNagOto8Ltx0
   gAXBSJ89U7twwAxLQvS+4zcRuxdo+fiB/c2zW7J0Px3urrb+GDAhd0quX
   A==;
X-CSE-ConnectionGUID: bcs0+zUqS8mGZoA0ATv3Rg==
X-CSE-MsgGUID: zVlZy0xuRpKzLEHQde53ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78223755"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="78223755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:09:24 -0700
X-CSE-ConnectionGUID: igj96cB4QY62TEe/f8GyLw==
X-CSE-MsgGUID: JgxXakhiRAStPKdyckhu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225535449"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.36])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:09:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BAF5212185C;
	Wed, 11 Mar 2026 20:11:17 +0200 (EET)
Date: Wed, 11 Mar 2026 20:11:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough and use it
Message-ID: <abGwRZWvpv4XZKx5@kekkonen.localdomain>
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55434-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 1A1432686E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Moi,

On Wed, Mar 11, 2026 at 02:17:18PM +0200, Tomi Valkeinen wrote:
> When writing the exact same code the third time for Renesas, I thought
> we probably need a helper.
> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Can you send follow-ups to v4? V4 is already in my PR to Hans.

-- 
Terveisin,

Sakari Ailus

