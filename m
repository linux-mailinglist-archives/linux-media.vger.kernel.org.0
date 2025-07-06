Return-Path: <linux-media+bounces-36906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B8AFA65C
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 18:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30A73A88A7
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 16:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7282288520;
	Sun,  6 Jul 2025 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTrvN2uT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB115D1;
	Sun,  6 Jul 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818388; cv=none; b=kevQVBHy/LBp30pqgZr5NY99ONjVV41Qt/oi4/jNFBj3hZ1ba3jomTDzio5gxL7yev4JSDh92Cmzrz+Q//Is6PQ4Y9JuFFk2enUSVyPcLjWrk3SQJ7FhwlfHE2Q2L2bMnU9X4cU9W1Bk9WCHBwQ5jR4WVERIy/Zlj+CxDlhFr/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818388; c=relaxed/simple;
	bh=zDCLYT9ltxWJE6HZNfeuQPUYSB2SXgBeXCHKX7wTHpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1YCLZ9X3Unrn4PsgFf8lnKhcR75CT+l2m12tXZZ3UtZFDO6Nz9VhITLjHAnZgcYZMrAJxodch9GJ8UJHnuIDQabnd9ORZuw6QaIEn5MLOWAUmIaItQ58RlouoNNPq47HLUJ2RJ5SHqh0Au266rnCEIbgrY1ZrxdIloMajI+3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTrvN2uT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E3C4CEED;
	Sun,  6 Jul 2025 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751818387;
	bh=zDCLYT9ltxWJE6HZNfeuQPUYSB2SXgBeXCHKX7wTHpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DTrvN2uTCtZIL1z52MUhpOaZUXvvP4ffRd37nzXKgrKxZFCTElmU/x7qTdVuss1F5
	 3JbkjXifZW+4Hjb1LKTYJ8cvFnirVXmWf+VPMLrqJPoAYOPlmz5S9emfbOcd4nkkc0
	 vMXgcgUDhiQF840CeLFFCI102sDMlK0XsH0hHf8VLcUrXNFWaIah9EzHEqfao5DY+d
	 Rtwj+GT1ra4Dj/k5JYm7X9o4QBLj5Fh7nbNhL0TtcwhE1v+lrMvJ5oQSu/LVIo55jY
	 rT4yYuLLzBzu7CJ20Vt+/9uke+xJjbRRuLO7ep4J31N895Nwz8y0eGwZRyeRKDLov9
	 gcmN+1KxV42rg==
Message-ID: <d5982c46-6353-4ffd-8a7a-126ac795f751@kernel.org>
Date: Sun, 6 Jul 2025 18:13:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.com, dan.carpenter@linaro.org
References: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Jun-25 12:06 PM, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> v5:
> - remove stray change
> 
> v4: https://lore.kernel.org/all/20250627072939.21447-1-abdelrahmanfekry375@gmail.com/
> - fix typos
> 
> v3: https://lore.kernel.org/all/20250624170746.47188-1-abdelrahmanfekry375@gmail.com/
> - remove blank line
> 
> v2: https://lore.kernel.org/all/20250624144943.39297-1-abdelrahmanfekry375@gmail.com/
> - add Suggested-by line
> - remove unnecessary comments
> 
> v1: https://lore.kernel.org/all/20250624130841.34693-1-abdelrahmanfekry375@gmail.com/
> 
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 91 ---------------------
>  1 file changed, 91 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 84102c3aaf97..f998b57f90c4 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -28,88 +28,6 @@ struct hmm_bo_device bo_device;
>  static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
>  static bool hmm_initialized;
> 
> -/*
> - * p: private
> - * v: vmalloc
> - */
> -static const char hmm_bo_type_string[] = "pv";
> -
> -static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
> -		       char *buf, struct list_head *bo_list, bool active)
> -{
> -	ssize_t ret = 0;
> -	struct hmm_buffer_object *bo;
> -	unsigned long flags;
> -	int i;
> -	long total[HMM_BO_LAST] = { 0 };
> -	long count[HMM_BO_LAST] = { 0 };
> -	int index1 = 0;
> -	int index2 = 0;
> -
> -	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> -	if (ret <= 0)
> -		return 0;
> -
> -	index1 += ret;
> -
> -	spin_lock_irqsave(&bo_device.list_lock, flags);
> -	list_for_each_entry(bo, bo_list, list) {
> -		if ((active && (bo->status & HMM_BO_ALLOCED)) ||
> -		    (!active && !(bo->status & HMM_BO_ALLOCED))) {
> -			ret = scnprintf(buf + index1, PAGE_SIZE - index1,
> -					"%c %d\n",
> -					hmm_bo_type_string[bo->type], bo->pgnr);
> -
> -			total[bo->type] += bo->pgnr;
> -			count[bo->type]++;
> -			if (ret > 0)
> -				index1 += ret;
> -		}
> -	}
> -	spin_unlock_irqrestore(&bo_device.list_lock, flags);
> -
> -	for (i = 0; i < HMM_BO_LAST; i++) {
> -		if (count[i]) {
> -			ret = scnprintf(buf + index1 + index2,
> -					PAGE_SIZE - index1 - index2,
> -					"%ld %c buffer objects: %ld KB\n",
> -					count[i], hmm_bo_type_string[i],
> -					total[i] * 4);
> -			if (ret > 0)
> -				index2 += ret;
> -		}
> -	}
> -
> -	/* Add trailing zero, not included by scnprintf */
> -	return index1 + index2 + 1;
> -}
> -
> -static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, true);
> -}
> -
> -static ssize_t free_bo_show(struct device *dev, struct device_attribute *attr,
> -			    char *buf)
> -{
> -	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, false);
> -}
> -
> -
> -static DEVICE_ATTR_RO(active_bo);
> -static DEVICE_ATTR_RO(free_bo);
> -
> -static struct attribute *sysfs_attrs_ctrl[] = {
> -	&dev_attr_active_bo.attr,
> -	&dev_attr_free_bo.attr,
> -	NULL
> -};
> -
> -static struct attribute_group atomisp_attribute_group[] = {
> -	{.attrs = sysfs_attrs_ctrl },
> -};
> -
>  int hmm_init(void)
>  {
>  	int ret;
> @@ -130,14 +48,6 @@ int hmm_init(void)
>  	 */
>  	dummy_ptr = hmm_alloc(1);
> 
> -	if (!ret) {
> -		ret = sysfs_create_group(&atomisp_dev->kobj,
> -					 atomisp_attribute_group);
> -		if (ret)
> -			dev_err(atomisp_dev,
> -				"%s Failed to create sysfs\n", __func__);
> -	}
> -
>  	return ret;
>  }
> 
> @@ -145,7 +55,6 @@ void hmm_cleanup(void)
>  {
>  	if (dummy_ptr == mmgr_EXCEPTION)
>  		return;
> -	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> 
>  	/* free dummy memory first */
>  	hmm_free(dummy_ptr);
> --
> 2.25.1
> 


