Return-Path: <linux-media+bounces-10081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF018B127F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 20:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A02851C22D74
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 18:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89936199B0;
	Wed, 24 Apr 2024 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHsWIUwT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8531864C;
	Wed, 24 Apr 2024 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713983945; cv=none; b=C8Fru+umejYcTDnlroHi4HTAOcOnuLXBnKmYp4kIGH1LwUh7vjhFg0HXOacDAYW8yyk8HanWwwYA3/kRkgHdgUgSavSpY5XCgS7ESQvDrMCwjjyxRsLOwReMxHu/+CzyqC43WMUtXmH/xB21BWEuD+gPOE0ZzvD+DVSFzjpD/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713983945; c=relaxed/simple;
	bh=a9wBfXuY8NXHfFKMORli8gTx88NGRNhhxzH6iYF3T/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tH9tC8zqTUIBBqrgww5QFkfCNv3zhKwPV3bMPSPqfVJxfQ49bHGBzHvUs2Npm7luo00byZPCW7hN57xbXnnu+3ljo03EaAnTdvmZ2KV8VCMB3NJio+IDG3inLV+3+3m+wJ1TmFgYHPE9h2tR8vvjzthNz0+P0XHzmaD9gNVrbAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHsWIUwT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713983943; x=1745519943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a9wBfXuY8NXHfFKMORli8gTx88NGRNhhxzH6iYF3T/g=;
  b=XHsWIUwTOIavQb8U6xLKdqYiPTUQG5nsdsE/t9VczMeveI1/ncBTfhK3
   3PG/g5oAXqPtcdnoFbOW61mHp7vieVnNlGNljn6G5jePhlyUHXIKep5hN
   5D3iv/sw9NBz6VJy4AOMg5Crwolpnc//f7SvkPd5tTQplYqaydAbnPw1+
   uzoMQEC3EJXeXUTNK6lX63lyqvFyG5//IKgiIum/VV5yNLalZXPRaugNA
   JzYrUBYmKhmW8xhd45uQt75EMMiLsAX2jtSEJJND18wrck4a8w05K5R2Z
   bOuk+++uJnbq2b7DdHFqkRnFNTH41TYm8+wmK9EKg9So0qXG9p4qYn7+G
   w==;
X-CSE-ConnectionGUID: P1gJhiGDQdWQT4gA7e4XEg==
X-CSE-MsgGUID: 3023iQB5R6qf12vbq8S7CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20187299"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="20187299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:39:02 -0700
X-CSE-ConnectionGUID: cWD2CDTURMS0NJ+KZ6o2rw==
X-CSE-MsgGUID: ZWTci24IQLuoS+yiyi0gTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="62268401"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:38:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 073FE11F855;
	Wed, 24 Apr 2024 21:38:56 +0300 (EEST)
Date: Wed, 24 Apr 2024 18:38:55 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>, kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 0/5] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
Message-ID: <ZilRv_SoN5C825kv@kekkonen.localdomain>
References: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
 <396eaa7c-4e7b-43cf-aec4-c1611a405ef7@broadcom.com>
 <20240424163338.GE32190@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424163338.GE32190@pendragon.ideasonboard.com>

Hi Laurent, Florian,

On Wed, Apr 24, 2024 at 07:33:38PM +0300, Laurent Pinchart wrote:
> > > Sakari, please feel free to apply this on top of your generic metadata
> > > branch and include it in your pull request for v6.10.
> > 
> > To miminize conflicts, I believe I should be taking patch #5 via the ARM 
> > SoC pull request since I already have merged patches there that are 
> > pre-requisites for patch #5 to apply. Let me know if that does not work.
> 
> That works for me. Sakari, please don't take patch 5/5 in your branch.

Ack. Thanks for confirming this.

-- 
Regards,

Sakari Ailus

