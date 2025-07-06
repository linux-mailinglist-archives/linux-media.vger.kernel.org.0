Return-Path: <linux-media+bounces-36908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D58BBAFA68A
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 18:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BD3D169D60
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 16:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAC528852B;
	Sun,  6 Jul 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caKjmjNo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68973165F1A;
	Sun,  6 Jul 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751819583; cv=none; b=u9/fgaRDHGhEqbGzGo+dTVIEBUwysnEFzxsLhPSUU+kqda/Q5pTwaLizWez1POmUS4JQxEYXRS9JeqrKJxEDdYusKYZpfTV0NrG41CxRo9khSyAc1v/XN1wKjgPt1sN2bnY84MNpIVWWDDdkGzzBpaPoZ1FhX2j1OwYxrdxK74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751819583; c=relaxed/simple;
	bh=D3csnNiWzV+4H8jKc6H3AANx0qZiRfy9ICHeopQoqUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIfJB3+sQnBF1B3QqcVeKTp0dHV2IHpv26jU6NNWSFXGBdRDhGw13EIGiyvy5aacWTl1zI8tJsoVz4gA0L1zACrdzkTLfSuav1atVeq/XHDjLuLkHUaVGWrulOZnEsfKH8acAkqFbcygl2ZTRLY3tRl65C+lgCwHRVyFvPui3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caKjmjNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7433C4CEED;
	Sun,  6 Jul 2025 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751819582;
	bh=D3csnNiWzV+4H8jKc6H3AANx0qZiRfy9ICHeopQoqUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=caKjmjNo3TtFswOeaowun5Tzf1O6QYV2asbNjhArS3WeYX3isz5K0RlNReCrrRdgt
	 CX8SLXOFN58G5ffmHocgwHLyXwfjvL6K+s9JseXyyfWWpNH6z7cdGPsZBhSgjMuN22
	 mSwso4k9Uix41z2SpMxPzD8geKz7X5jlGSonqWL0dGCikIwnJppZ+Anmo90HgB2ESM
	 hxpS8GjVWM64GjtW4vG0zkwzEIJlBcEmRTripjS5u47XYywbIUkY+KjlRoRLv6RWtW
	 SbAmPBAVfNCHjOEGUkioocDeUhc1xNZtZHyCodlc7VsOxoJOELge4GgXweyyFWHi1H
	 0FC+g+J27n/dA==
Message-ID: <878c2301-7c3e-4325-917f-cc1d7ce4191a@kernel.org>
Date: Sun, 6 Jul 2025 18:32:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: media: atomisp: Remove custom sysfs
 attributes from atomisp_drvfs.c
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org
References: <20250704161051.16733-1-abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250704161051.16733-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 4-Jul-25 6:10 PM, Abdelrahman Fekry wrote:
> Continue the cleanup of the AtomISP driver as discussed with Hans and Andy
> in [1].
> 
> Tackle TODO item: "Remove custom sysfs files created by atomisp_drvfs.c":
> - Remove the sysfs attributes `dbglvl`, `dbgfun`, and `dbgopt`.
> - Delete their associated show/store handler functions.
> - Remove the corresponding attribute group definitions.
> - Keep `dbg_attr_groups[]` as an empty array to preserve compatibility.

That is the last bit left over in the atomisp_drvfs.c file.

Instead of pointing atomisp_pci_driver.driver.dev_groups to the empty
`dbg_attr_groups[]` the initialization of atomisp_pci_driver.driver.dev_groups
can simply be removed (making it NULL, which is allowed).

And then the entire atomisp_drvfs.[c|h] files can both be removed.

Since I'm about the send out a pull-request with atomisp changes
for kernel 6.17 I've made this change myself and squashed it
into your patch (keeping you as the author of course), see:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=532fd10da0f58e7f313ff576bb1e6cab1f758bbe

And I've also dropped the TODO list item for this :)

Regards,

Hans



> 
> Link: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org/ [1]
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
> v3:
> - fix style warning
> v2:
> - modify the reference link line.
> 
>  .../staging/media/atomisp/pci/atomisp_drvfs.c | 138 ------------------
>  1 file changed, 138 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> index 31c82c3c0d33..c25fd3ff003d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> @@ -1,9 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/*
> - * Support for atomisp driver sysfs interface
> - *
> - * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
> - */
> 
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -16,140 +11,7 @@
>  #include "hmm/hmm.h"
>  #include "ia_css_debug.h"
> 
> -#define OPTION_BIN_LIST			BIT(0)
> -#define OPTION_BIN_RUN			BIT(1)
> -#define OPTION_VALID			(OPTION_BIN_LIST | OPTION_BIN_RUN)
> -
> -/*
> - * dbgopt: iunit debug option:
> - *        bit 0: binary list
> - *        bit 1: running binary
> - *        bit 2: memory statistic
> - */
> -static unsigned int dbgopt = OPTION_BIN_LIST;
> -
> -static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
> -				    unsigned int opt)
> -{
> -	int ret = 0;
> -
> -	if (opt & OPTION_VALID) {
> -		if (opt & OPTION_BIN_LIST) {
> -			ret = atomisp_css_dump_blob_infor(isp);
> -			if (ret) {
> -				dev_err(isp->dev, "%s dump blob infor err[ret:%d]\n",
> -					__func__, ret);
> -				goto opt_err;
> -			}
> -		}
> -
> -		if (opt & OPTION_BIN_RUN) {
> -			if (isp->asd.streaming) {
> -				atomisp_css_dump_sp_raw_copy_linecount(true);
> -				atomisp_css_debug_dump_isp_binary();
> -			} else {
> -				ret = -EPERM;
> -				dev_err(isp->dev, "%s dump running bin err[ret:%d]\n",
> -					__func__, ret);
> -				goto opt_err;
> -			}
> -		}
> -	} else {
> -		ret = -EINVAL;
> -		dev_err(isp->dev, "%s dump nothing[ret=%d]\n", __func__, ret);
> -	}
> -
> -opt_err:
> -	return ret;
> -}
> -
> -static ssize_t dbglvl_show(struct device *dev, struct device_attribute *attr,
> -			   char *buf)
> -{
> -	unsigned int dbglvl = ia_css_debug_get_dtrace_level();
> -
> -	return sysfs_emit(buf, "dtrace level:%u\n", dbglvl);
> -}
> -
> -static ssize_t dbglvl_store(struct device *dev, struct device_attribute *attr,
> -			    const char *buf, size_t size)
> -{
> -	unsigned int dbglvl;
> -	int ret;
> -
> -	ret = kstrtouint(buf, 10, &dbglvl);
> -	if (ret)
> -		return ret;
> -
> -	if (dbglvl < 1 || dbglvl > 9)
> -		return -ERANGE;
> -
> -	ia_css_debug_set_dtrace_level(dbglvl);
> -	return size;
> -}
> -static DEVICE_ATTR_RW(dbglvl);
> -
> -static ssize_t dbgfun_show(struct device *dev, struct device_attribute *attr,
> -			   char *buf)
> -{
> -	unsigned int dbgfun = atomisp_get_css_dbgfunc();
> -
> -	return sysfs_emit(buf, "dbgfun opt:%u\n", dbgfun);
> -}
> -
> -static ssize_t dbgfun_store(struct device *dev, struct device_attribute *attr,
> -			    const char *buf, size_t size)
> -{
> -	struct atomisp_device *isp = dev_get_drvdata(dev);
> -	unsigned int opt;
> -	int ret;
> -
> -	ret = kstrtouint(buf, 10, &opt);
> -	if (ret)
> -		return ret;
> -
> -	return atomisp_set_css_dbgfunc(isp, opt);
> -}
> -static DEVICE_ATTR_RW(dbgfun);
> -
> -static ssize_t dbgopt_show(struct device *dev, struct device_attribute *attr,
> -			   char *buf)
> -{
> -	return sysfs_emit(buf, "option:0x%x\n", dbgopt);
> -}
> -
> -static ssize_t dbgopt_store(struct device *dev, struct device_attribute *attr,
> -			    const char *buf, size_t size)
> -{
> -	struct atomisp_device *isp = dev_get_drvdata(dev);
> -	unsigned int opt;
> -	int ret;
> -
> -	ret = kstrtouint(buf, 10, &opt);
> -	if (ret)
> -		return ret;
> -
> -	dbgopt = opt;
> -	ret = iunit_dump_dbgopt(isp, dbgopt);
> -	if (ret)
> -		return ret;
> -
> -	return size;
> -}
> -static DEVICE_ATTR_RW(dbgopt);
> -
> -static struct attribute *dbg_attrs[] = {
> -	&dev_attr_dbglvl.attr,
> -	&dev_attr_dbgfun.attr,
> -	&dev_attr_dbgopt.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group dbg_attr_group = {
> -	.attrs = dbg_attrs,
> -};
> 
>  const struct attribute_group *dbg_attr_groups[] = {
> -	&dbg_attr_group,
>  	NULL
>  };
> --
> 2.25.1
> 


