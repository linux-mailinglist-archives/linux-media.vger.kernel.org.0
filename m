Return-Path: <linux-media+bounces-35698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68368AE4CE1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 20:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 589863ACBF7
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E68E2BDC35;
	Mon, 23 Jun 2025 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5v695LA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B2139D;
	Mon, 23 Jun 2025 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703501; cv=none; b=qNA71Qc94WG4QeoLoAapO6J+hqfq1y4jDGDK445HUgMQoCi4b0RDEVRX4u7k3GKWcp3562cP3SkP+PlXCyJ/1vBICYyUpNsXl45KOCKidZm1xB5vQiVQjJt+KdG4xmrNfC+7a1cdd7v5PJsThNAEpA7wXuYPw1AQD05+qFicrHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703501; c=relaxed/simple;
	bh=pIAKt0mo2QJg6RZ/HaTWayaYZm/T1dbYJzk9s50QWK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqzDYE/bcc8mRQM5uR97HYANNdVnSlSRRtn90Lnybxjt0WY0csSN7hi/V06by+aR+NU0WjZJEp+h6VcFD9gUp7xkW6Zdexb92LD/ZOWeMDoEK3Az9oqPwCYhcLuNvE+7gBLpRXIOP6whptTfSyvFw9iiDyvtUy4wdzXLtip7bRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5v695LA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4AEC4CEEA;
	Mon, 23 Jun 2025 18:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750703501;
	bh=pIAKt0mo2QJg6RZ/HaTWayaYZm/T1dbYJzk9s50QWK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P5v695LAJHKKfLs9TIMbUstzth6jW7LKjgRplbbGuC5nMLc1K/1VYAwsyalAYYClr
	 yl0efTcz9DWHXPswgiZrIfrB1EGhVnW28394ph+tLx19BVkPoO4BJKqTifOJ2Y9o5c
	 YcBUkCD92lJw6kAdB0fBU2e2s5JaBXMD7+W5WFxPvZpeE+9U/uoaUCbsVWMtESK5NT
	 h3lAvS80TvMWiLsvTmgo86uoEA6wkNVYnL3XrQ37wygTOJGD+pZ4FT4Ba/ZpKmrt5W
	 1LGuW09ZeMNqs/txwjQE0gIXi8/gkQ1Xv40xH3DzmAqRvgmJTfNly0H+KnL1vV3aOu
	 knmx6krb9XRtA==
Message-ID: <7852d6ac-95f0-41ec-8365-d23a2b16b208@kernel.org>
Date: Mon, 23 Jun 2025 20:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Jun-25 8:29 AM, Abdelrahman Fekry wrote:
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.
> 
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 24 ++++++---------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 84102c3aaf97..cae1fccd06af 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -37,51 +37,41 @@ static const char hmm_bo_type_string[] = "pv";
>  static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
>  		       char *buf, struct list_head *bo_list, bool active)
>  {

<snip>

As Andy already mentioned you really should try to first better understand
the code before changing it.

In this case this code is used for 2 custom sysfs attributes called
"active_bo" and "free_bo".

sysfs attributes are custom userspace API and we really want to remove
all custom userspace APIs from this driver before moving it out of
drivers/staging

Instead everything should be done through existing standard kernels
API, mostly the standard v4l2 API.

Note this is already mentioned in drivers/staging/media/atomisp/TODO
although these specific sysfs attributes are not named:

"""
TODO
====

1. Items which MUST be fixed before the driver can be moved out of staging:

* Remove/disable private IOCTLs

* Remove/disable custom v4l2-ctrls

* Remove custom sysfs files created by atomisp_drvfs.c
"""

In this case the "active_bo" and "free_bo" sysfs attributes seem
to be there for debugging purposes only and they can simply be removed.

So instead of replacing scnprintf you should write a new patch
removing everything starting at:

<--- start removing code here --->
/*
 * p: private
 * v: vmalloc

...

static struct attribute_group atomisp_attribute_group[] = {
        {.attrs = sysfs_attrs_ctrl },
};
<--- end removing code here --->

and then also remove the sysfs_create_group() and
sysfs_remove_group() calls.

After writing that patch maybe you can also take a look at tackling
the "Remove custom sysfs files created by atomisp_drvfs.c" TODO
list item?

Regards,

Hans






