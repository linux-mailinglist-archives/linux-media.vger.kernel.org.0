Return-Path: <linux-media+bounces-582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 256177F0B59
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 05:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 307DCB20933
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 04:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2410E3C0C;
	Mon, 20 Nov 2023 04:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKyxKkli"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF310C5
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 20:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700453986; x=1731989986;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=uZZzzovgtFlKQQvvTcu8CsBWOXVVd6LYHPoxqNxDoVs=;
  b=lKyxKkliRmias97zX+kMPBvRqtXqb5YPegTaUOEsY52t7AXRik+H7OVi
   LSNRWGymp8sXaOQ6sbn8l+qKLtFgHQZe+pxCcPaVYMK21nfuWoNcEEvfa
   IfiL6eUYqv68pRYgtlW+4JZAR0A5O0jj/T7Jebci4XrOoIxi01B3poSy5
   u9AiTwsiz39SQfxI90H1gxB/Skxa1VrtfjwGpRiea4eDNGlaEZtUjCXE6
   N2dfpKZP/xnq1pI1YQMkT1FH72lix0ZjsfqwBU04kslPDnQ93z/Q8oqoQ
   B2qVNargBXT4mN0qjPNZRpUUPuktyx7nqwTa1qseoq5yhRT+OypyfW7Vd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388690498"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="388690498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 20:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097636226"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="1097636226"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2023 20:19:15 -0800
Subject: Re: [PATCH 0/4] Enable sensor's runtime PM before registering async
 sub-dev
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com
References: <20231106083516.763184-1-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <072fcb90-1888-39c4-1d19-200cf01b6289@linux.intel.com>
Date: Mon, 20 Nov 2023 12:14:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231106083516.763184-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Sakari and others,

On 11/6/23 4:35 PM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Following Sakari's patch:
> <URL:https://lore.kernel.org/linux-media/20231102090752.1418132-1-sakari.ailus@linux.intel.com/>
> 
> The sensor device maybe accessible right after its async sub-device is
> registered, so runtime PM should be ready before its async sub-device
> is registered.
> 
> 
> Bingbu Cao (4):
>   media: imx355: Enable runtime PM before registering async sub-device
>   media: ov01a10: Enable runtime PM before registering async sub-device
>   media: ov13b10: Enable runtime PM before registering async sub-device
>   media: ov9734: Enable runtime PM before registering async sub-device
> 
>  drivers/media/i2c/imx355.c  | 13 ++++++++-----
>  drivers/media/i2c/ov01a10.c |  7 +++++--
>  drivers/media/i2c/ov13b10.c | 14 +++++++++-----
>  drivers/media/i2c/ov9734.c  | 19 +++++++++++--------
>  4 files changed, 33 insertions(+), 20 deletions(-)
>

Do you have any comments on this series?


-- 
Best regards,
Bingbu Cao

