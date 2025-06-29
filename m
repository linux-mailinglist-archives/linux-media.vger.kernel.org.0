Return-Path: <linux-media+bounces-36171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691FAECDFB
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2A01896128
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CAB22E402;
	Sun, 29 Jun 2025 14:37:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2721CC56
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751207821; cv=none; b=sqq3IK0GxL+hlQiDDZms/N4egrIyIXIfZ9eUMmA677dQ8bhJQttk8s9+vpAuygh8zgSGnICm+NtXd8qp01Bm+eIYna6zjnuFSPU5dNVtHHXzncQlNlHq9yS0J634UreArTlyBJnq/CsEj3Q9XQ6uxS63rUuiNsbqqATTx5TEF3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751207821; c=relaxed/simple;
	bh=83vxe8vquls1BKpFrh/gXN7tGsnJGbKVuvEnECNIa58=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZdOKkEKXYCWCEP7xgFl17LoUK1UaYKnX09tLxh6wzSBbBVd6k+fLtcvQaN7m0l+at6vl5AE4psTWJwIShTJ7Lmxq0jBioz8679VUAKDTtknlwdgo6Kf47D+k7UeThG6DKVdHRUy1vhwC+iHRgBU4jIBGgjA7gZX4TtcQ3NJY5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B985C4CEEB;
	Sun, 29 Jun 2025 14:37:00 +0000 (UTC)
Message-ID: <b92bf074-911f-4922-9878-485a1979cd40@nxsw.ie>
Date: Sun, 29 Jun 2025 15:36:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: ov02c10: Don't include linux/version.h
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
References: <7W8Gb6ShUKt2UvdZkAKqjzGHFyXU-2Sq-EOl8VSOmnHINBQYvunZol0u_AfiHEqXm93u-rqiuzPHlLMhd97eow==@protonmail.internalid>
 <20250628141520.297264-1-sakari.ailus@linux.intel.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250628141520.297264-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2025 15:15, Sakari Ailus wrote:
> linux/version.h isn't needed by the driver, don't include it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/i2c/ov02c10.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 089a4fd9627c..594bfb02da0f 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -9,7 +9,6 @@
>   #include <linux/module.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
> -#include <linux/version.h>
>   #include <media/v4l2-cci.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
> --
> 2.39.5
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

