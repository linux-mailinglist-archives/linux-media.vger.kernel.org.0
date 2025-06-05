Return-Path: <linux-media+bounces-34099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711AACED19
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 11:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D84178062
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFF2211A28;
	Thu,  5 Jun 2025 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdJ8Qfhi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA7C2C3242;
	Thu,  5 Jun 2025 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116951; cv=none; b=Sn+/yAR6VI3Hh1W2U5UPNMFQ5f0O7rfpu3nEKRqPgYMFAlDaQUk9gNlV2tAZ1k81YwW5d9L2qfg8a8Ur4sFy9inJPDnmpjQv/kSicl2m7OmK6MeKJQNcn3b59PjMtVqheKEMuVqD+SeFIBweNqwxLLMmu2n87ZUxxrEOR3oQH6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116951; c=relaxed/simple;
	bh=/LdIHrVh1JcLDKPaWvUKmpJEvq93neirKTxXZQVgqLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKCRjIrZsEoGXmTyAmWqseqQkcHMiz2nzLMJeKiDg9m+QztE1W42SiYHkdlkoIup8iRHS8yJH+JCOkQ8mh/zAFADfxKh9Xxz+YB3yChk3ilobpA5x3Jog8fC/gJfNoD3dR197T0+TqDyfeE0gKCJRK404nMQFsRy8c6rbS/n1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdJ8Qfhi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749116950; x=1780652950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/LdIHrVh1JcLDKPaWvUKmpJEvq93neirKTxXZQVgqLY=;
  b=kdJ8QfhiYeDVkBX5j2NCcU6DRZ/vqFJqg5gEfWL4KfQ2z8hxww9TFDVs
   Ck/CFWNyn/NtwhMJis5zGG3lvFLbDjcLjNQgc7y83ffYxIUvKFqa5RqJj
   OJMhrjF3zo863WdMB0jYVcmN4TKmqqxIOzAB7FUVCYmFTKkUfH57gao74
   AeAJKA91pJFnGpXGtUkCZnrbseLQbh9wlRUgiYLWRHcF+LjgVqznBIAL9
   yvOT/9VYcEEzCwSpHAiHYJnjNERHrDDrOPNLdtkKG5gxp07D7Mz1Zk6zK
   xji2c4P2FiJfAq03k/6EIbaCZ92EJHCfZz7SJ/Gtk7ZEbdarFHm0Yvb7P
   g==;
X-CSE-ConnectionGUID: /dXY4cp5SseW6ZDAgYKNEg==
X-CSE-MsgGUID: v2IJnrL4TdKnUPWHwildww==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51297123"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51297123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:49:06 -0700
X-CSE-ConnectionGUID: 24mk+NbNQ+WtuLzTJaUflw==
X-CSE-MsgGUID: riKN5MFCSoq+pZ4xIw2+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="146049871"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:49:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CEFD011FBEC;
	Thu,  5 Jun 2025 12:48:58 +0300 (EEST)
Date: Thu, 5 Jun 2025 09:48:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
Message-ID: <aEFoCvPe4zE48UG7@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
 <aEC05991kEIIifDB@kekkonen.localdomain>
 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>

Hi Hans,

On Thu, Jun 05, 2025 at 11:37:54AM +0200, Hans Verkuil wrote:
> >>>> @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
> >>>>  		media_request_put(req);
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> >>>> +
> >>>> +void media_request_manual_complete(struct media_request *req)
> >>>> +{
> >>>> +	unsigned long flags;
> >>>
> >>> I'd declare flags as last.
> >>>
> >>>> +	bool completed = false;
> >>>> +
> >>>> +	if (WARN_ON(!req))
> >>>> +		return;
> >>>> +	if (WARN_ON(!req->manual_completion))
> >>>> +		return;
> >>>
> >>> I think I'd use WARN_ON_ONCE() consistently: this is a driver (or
> >>> framework) bug and telling once about it is very probably enough.
> >>
> >> Just to be sure, you only mean for the two checks above ? Or did
> >> you mean for the entire function ?
> > 
> > For the entire function. I thought that if this is user-triggerable, the
> > amount of data ending up in logs could be very large.
> 
> It's not user-triggerable, if this happens, then it is a driver bug.

If there is a driver bug, it could well be user-triggerable, wouldn't it?
Testing may not uncover all such cases.

-- 
Regards,

Sakari Ailus

