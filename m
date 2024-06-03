Return-Path: <linux-media+bounces-12488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1D8D8A41
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 21:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B334D1C223FF
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 19:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBF3139CEF;
	Mon,  3 Jun 2024 19:36:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744463E49E
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717443369; cv=none; b=o5BotNS5ghYLA4g5x5yO2xYGy9MfTy3Dpde9CJq1gkrmbf9WKlGAu9zk2jcP14AIxDAl9uF+yI/HtJNW1BeLna1pezMtTQa3IQPm7kse2bX/qF0aOiksEpKoI1yAwR4Ke0WYYMf8MABRTk2OC+BWojUgKygFvIacO66MUo3tmmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717443369; c=relaxed/simple;
	bh=f0IksoUlSvBawwaSs4J4hxad8qufYFUfpPuMEMc7A7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMWeHmTQoJ3fns7xNk7uvBRxlOdZnORQmTnbMJYfqxunzMwaXQhneNKk0LxwTzhItbcT8QQsi/ea61a8z7/3+vPz6Sw1PdMBtOgNzx3TCI0onZ/AarJcRHmzxrOfRzOYHBUbOsWDOEMdN2wtuqD7HlMG/1krP1ODyvn2OWLoi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Hy0K9ChiRseT4WqAdmxgrQ==
X-CSE-MsgGUID: lhubTV5wTVGI0gs2MpHsPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14074753"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="14074753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 12:36:08 -0700
X-CSE-ConnectionGUID: Fmi1pWMMROuqZrxVOK0wpQ==
X-CSE-MsgGUID: EMDeZdItSMGQ1eLyrSDk8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37006190"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 12:36:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1sEDTO-0000000DN5f-2g1U;
	Mon, 03 Jun 2024 22:36:02 +0300
Date: Mon, 3 Jun 2024 22:36:02 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/5] media: atomisp: Prefix firmware paths with
 "intel/ipu/"
Message-ID: <Zl4bIoxczvKt03bF@smile.fi.intel.com>
References: <20240603132057.255917-1-hdegoede@redhat.com>
 <20240603132057.255917-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603132057.255917-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 03, 2024 at 03:20:55PM +0200, Hans de Goede wrote:
> The atomisp firmwares have been added to upstream linux-firmware
> under intel/ipu/ add this prefix to the firmware name passed
> to request_firmware().
> 
> Fall back to the old location if this fails to avoid breaking existing
> setups.

...

> +	/* Fallback to old fw_path with "intel/ipu/" prefix */
> +	if (rc)
> +		rc = request_firmware(&fw, strrchr(fw_path, '/') + 1, isp->dev);

Perhaps kbasename() ?

-- 
With Best Regards,
Andy Shevchenko



