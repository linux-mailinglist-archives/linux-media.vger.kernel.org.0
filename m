Return-Path: <linux-media+bounces-45865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB70C166DB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9EE3B5E31
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EA034D4CB;
	Tue, 28 Oct 2025 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTal5QFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD329B793
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675355; cv=none; b=h5SgzXFj9f4MaC4Ykp0bGciDqr6hjYcWFrgmLWjieDIFIiW1JDenK5VVE1yRkkzLy5KZ5JPImgOh+o3N9bx7cTAL3lkmM0gMTuz3MPw/XcC3u1Dse+dXkoVAEEmqGGEraQD7BG4zV/J6l68jWbS5kQtS94d+CacWTkf1aW7WAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675355; c=relaxed/simple;
	bh=KdAoYuwRJJeVNOz0xQ+KdZBrGQIcviB77dX9QukaJBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clYrIh962cWYBbA2gqjvuXMco7X5hCBALkm13qlOvQySd5yJZVyWCd88kLNYkwH1juBtcQ6rngU41sc++fkQNcLeGrZM1kMm30IvULM+R43lmsFRzKj23uKMWBhZ53g16dGOxnNgs9zDbKEIkWUuweHJquJqZzbB9vUx+7anF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTal5QFv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761675354; x=1793211354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KdAoYuwRJJeVNOz0xQ+KdZBrGQIcviB77dX9QukaJBI=;
  b=aTal5QFvPz/y8qiRPQYcA1oRfpvUeOODHT6IsxQyUa4a/pJTBiJUDss3
   wJJCTVexjsg7HBV6VWKypZW29QKfkMJ3OhuadhyTywZmEOzD3T/eEeGFZ
   6orolO5Ne/rTG5e1aKTIDZZcqRckracmPkuxAlroeaDPCRKxmPRktEIIP
   jfOSIcVb8XMSUrGjNJXArSUmzFMYjvSM6y0EI4RbRoQ7gWR6BmpPdM39l
   5whmD/b6+H9uF5ewLiqFfi37DrHWNibZaJ0PtlxqhzGd1LUYM2Lq6SMgJ
   oO9xIo+N8Zcifee9iLtTwpuE4RofdeKVmlj7OYh7So6wqpkc6tg0rkvAC
   Q==;
X-CSE-ConnectionGUID: QBdAh/nHQj2p+GAGomw+DA==
X-CSE-MsgGUID: JMesHJ12SXabmylCwVQ83Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81208260"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81208260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:15:53 -0700
X-CSE-ConnectionGUID: n5r1Ix3NRTuN1PYVAre0sg==
X-CSE-MsgGUID: wk6urtIIQtibCpu/4LeXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189739514"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:15:51 -0700
Date: Tue, 28 Oct 2025 19:15:44 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 13/25] media: i2c: ov01a10: Don't update pixel_rate and
 link_freq from set_fmt
Message-ID: <erpg4nuksou7yv52kh5vdq2cgztt5rnyy4asitj3b7hba4jyqj@pe5fsv2bh4p2>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-14-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-14-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:21PM +0200, Hans de Goede wrote:
> The pixel_rate and link_freq never change, stop updating them on every
> set_fmt.
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com> 

> Signed-off-by: Hans de Goede <hansg@kernel.org>

