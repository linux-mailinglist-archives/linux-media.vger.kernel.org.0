Return-Path: <linux-media+bounces-11462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A08C60D3
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 08:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 448A1B21899
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 06:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182F33BBFF;
	Wed, 15 May 2024 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJ9p9vo7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169D1E53F
	for <linux-media@vger.kernel.org>; Wed, 15 May 2024 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715754895; cv=none; b=pLXmwnfW3b9B91ODpeHH/fxf/Jqx5Xqo+hRlBDiHHeTLC2JlOlVUlbYm/+R+UOoZ66OGgJLwhUclQnVheXn8UJ40TFgtc1UIViqYeSQgxfZkpWF0uNjSVa1E+uw2g3WttE8/zvlBh0d03ItQF4yWWZyPCpP/m/BixF0oCz5nNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715754895; c=relaxed/simple;
	bh=Ne7iPQvYatBojscJmBz3CfOGUpWQ1euZVcSjxjk6wpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW/mC/bdpLJDMp2xuoJPVNiH43D9S8VnEEeRYmq2LmM657Zd1dMzu5rw3GLVJSSgawlJXkzcg0jCb4/Qd1f17qFodZSaHrkUxDDixJwiNUXLxxVAxIkBYOONMs9Pi9s2+COm9tBzQL11aBZwZvHlbZmQal8xCybSKjzibQmq9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJ9p9vo7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715754894; x=1747290894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ne7iPQvYatBojscJmBz3CfOGUpWQ1euZVcSjxjk6wpQ=;
  b=IJ9p9vo7Aq7L3QZSQZ+7bhl2EOCoTPPr9InW5yufiCk40uzvLuwy4cOF
   ytJ0nP16gu99C1FJQdm7NqjC0q1NjrkV/5DnrhD6WvitQjxYvwafGxquW
   hbZBxyBsQyyWiSPw7dSP8WXlUqfIDpg5G6jTJAY27RZD6y36NkyX9GO94
   Xv6OLnAe+LRLpVPYKWhz/LkUTxpKxI+Qj9kjWCpbHNAmwgCfryE8By3My
   uIrficexzZYtYbVdfu122l8kGBT9ESuM/0wsHKp+7+4ipehgOu3Pt9usp
   2sNDfUsVop4lokDk9wBT5LUkzY5vVvGR+9lkPOfEeMoBBQ98DaA99D+V6
   A==;
X-CSE-ConnectionGUID: /rMAx4wRS3S06Wh9LG703Q==
X-CSE-MsgGUID: HYc5U5Q4Q02iPwGfZj+i/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23181698"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="23181698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 23:34:53 -0700
X-CSE-ConnectionGUID: d93O+kSbTRuViIF0S8Jwdw==
X-CSE-MsgGUID: t5OVkcVdQoW4pVwMDF7FHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="61770943"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 23:34:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F0A611FBA0;
	Wed, 15 May 2024 09:34:48 +0300 (EEST)
Date: Wed, 15 May 2024 06:34:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, bingbu.cao@linux.intel.com,
	daxing.li@intel.com
Subject: Re: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
Message-ID: <ZkRXiPWkoEIikqF7@kekkonen.localdomain>
References: <20240429051333.1306453-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429051333.1306453-1-dongcheng.yan@intel.com>

Hi Dongcheng,

A few more comments below...

On Mon, Apr 29, 2024 at 01:13:33PM +0800, Dongcheng Yan wrote:
> +/* Analog gain control */
> +#define AR0234_REG_ANALOG_GAIN		CCI_REG16(0x3060)
> +#define AR0234_ANAL_GAIN_MIN		0
> +#define AR0234_ANAL_GAIN_MAX		0x7f
> +#define AR0234_ANAL_GAIN_STEP		1
> +#define AR0234_ANAL_GAIN_DEFAULT	0xe

Please use the same prefix here as for the register, apart from REG_ part.
I.e. AR0234_ANALOG_.

> +
> +/* Digital gain control */
> +#define AR0234_REG_GLOBAL_GAIN		CCI_REG16(0x305e)
> +#define AR0234_DGTL_GAIN_MIN		0
> +#define AR0234_DGTL_GAIN_MAX		0x7ff
> +#define AR0234_DGTL_GAIN_STEP		1
> +#define AR0234_DGTL_GAIN_DEFAULT	0x80

Ditto.

...

> +static const struct cci_reg_sequence mode_1280x960_10bit_2lane[] = {
> +	{ CCI_REG16(0x3f4c), 0x121f },
> +	{ CCI_REG16(0x3f4e), 0x121f },
> +	{ CCI_REG16(0x3f50), 0x0b81 },
> +	{ CCI_REG16(0x31e0), 0x0003 },
> +	{ CCI_REG16(0x30b0), 0x0028 },
> +	/* R0X3088 specify the sequencer RAM access address. */

s/0\KX/x/

Same elsewhere.

> +	{ CCI_REG16(0x3088), 0x8000 },
> +	/* R0X3086 write the sequencer RAM. */

-- 
Regards,

Sakari Ailus

