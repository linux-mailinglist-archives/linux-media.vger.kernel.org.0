Return-Path: <linux-media+bounces-49365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09970CD6A20
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 17:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 581183039775
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF36E32E738;
	Mon, 22 Dec 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM6dykp0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DBC2D738E;
	Mon, 22 Dec 2025 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419753; cv=none; b=fPp2Oazpr8xrXnuVDaaLrGQUUR275ArGXHyl3rwaUzDbsiYCjCvmwFKRsUGeyNziaEFJv79VgjSvJAjhEKduc1kPY1WhzRHBnteQSNeyJtH8ydSmdLy/CIAH51M4/4CjcrM50nF4GTd40MCzC8PDGjfe/idu5uAS/4/PruC2gdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419753; c=relaxed/simple;
	bh=YRRJl3r7nubr/gZvWBfmQO5L5902vmk5zfQskYHp9cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKgS6fzmykhBg+gJjIDt4e0iLzCfSov4DM99D7Uat/9mpK5yYkmsumxQ5TkNcuhur+zGuLENgBviK1KcktiUrsThRM+VC+cBTpW1scorW/E/8nHHirWKer+SRolnnsypj6oaEHldvphxYJnnuvevmbLU5FYh/jX+spUOwhYM3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM6dykp0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766419751; x=1797955751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YRRJl3r7nubr/gZvWBfmQO5L5902vmk5zfQskYHp9cU=;
  b=RM6dykp0ZUY8n5L+Ra2Tddcg/8nicF/YEG7hKedG5M6QtBEhIkDgL2ej
   tNCQDIMrzuFNLDJcZPGlnQhFTp2rvULamX4M9ZbdoZdB/6qIXBuMUQaIs
   yiT1GKEZOEfOviGc7Fcie28Vsi2lU1k0RwMe1pvLFtT5eErnbGc31ncEa
   vCsfFoiF4PBGpXxlelswRDTkonAcYekdj0zyTFV28ciCLvBxsIrF5oZcX
   OloTiGzRhzfy7gZfXD3ebLCQUiUskG5/to6UYwKlAjHoamCC7n+XXThgs
   aNnGUrUXCs158vkdkZoGuU8D/kH3pniOcMemavYbPQhbTqYqm8Q6zarku
   Q==;
X-CSE-ConnectionGUID: egoffsdqRLKt+Stnf6zhiQ==
X-CSE-MsgGUID: SYjvRWVoQc+OQM+RwBAKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78909944"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="78909944"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:09:10 -0800
X-CSE-ConnectionGUID: YDcCXh6DSs69r7XZZ/nsEA==
X-CSE-MsgGUID: w+PiDWgVRym8/2DMC6Dprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199587485"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.232])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:09:05 -0800
Date: Mon, 22 Dec 2025 17:08:58 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <ndagbg3vtiunj4bzx3dti56vnu7i6savr3qoz236vnvzutukcc@rxrvgnyng3rk>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>
 <7p46ga3lc5ky2234q6c222gz5ftpcaqfvax5ouysr4cj5sczlf@47ukejyhblbq>
 <PN3P287MB1829A7B4AA56CBF22F758AAC8BB6A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829A7B4AA56CBF22F758AAC8BB6A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Sat, Dec 20, 2025 at 06:01:43AM +0000, Tarang Raval wrote:

> > If you can go the extra mile and document some of these registers like in the
> > imx219 driver, that would be nice!
> 
> we are planning to add two more modes and also work on enabling HDR mode, and 
> I will be sending a separate series on top of this driver for that. In that 
> series, I also plan to split the register array into common and mode 
> sections, and document all known registers.
> 

This sounds good!

> For now, if it is okay with you, I would prefer to proceed with the current 
> implementation as it is.

Ack.

--
Kind Regards
Mehdi Djait

