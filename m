Return-Path: <linux-media+bounces-49896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBEECF313D
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 11:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE9E30652BF
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2A931A818;
	Mon,  5 Jan 2026 10:41:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26131A07F;
	Mon,  5 Jan 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609698; cv=none; b=d5S4aWPObcCaQMnt92JwtHAWmjjBxbA1Y17N1jw3XY/DGl6XQjC11y78JaDsHrjkpMRQgsYxYT6J1IDPiUgYlLLCf0MPoonjF7fIHQKYVQ7QioxJX3DG1WWXg0jX3lsRD/wGNal1poVwApSmSOIXYtpq0PaFHzweFkFfLc/tiKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609698; c=relaxed/simple;
	bh=O0eGpzcZBXdoUgn5aOeJ0bBOfxhqxXr16waodX4cHhQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTeRGxY0lw7OiL8AkMpqDOb0kqrg1TrjHj03Jo7LMCQyjVBSvprw904HMdrFtcuJNY/oBY5W8qSke6iTs41F9SC/1QTThdIIuAALUFQAReaU75TOEYor4rq/uA0pkL3TUnkWbGkOsHtqioIU8xj7YUS82DnbCdwx5q1TmD6jPy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9p42jYGzHnGdM;
	Mon,  5 Jan 2026 18:41:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A79340539;
	Mon,  5 Jan 2026 18:41:34 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:41:33 +0000
Date: Mon, 5 Jan 2026 10:41:31 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: samsung: exynos4-is: Simplify with scoped for
 each OF child loop
Message-ID: <20260105104131.00005693@huawei.com>
In-Reply-To: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri,  2 Jan 2026 13:49:56 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Change is fine but I wonder it it is worth going further.  See inline.
> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index 0827fdaf455a..14d84cc96831 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
>  
>  static int fimc_is_register_subdevs(struct fimc_is *is)
>  {
> -	struct device_node *i2c_bus, *child;
> +	struct device_node *i2c_bus;
>  	int ret, index = 0;
>  
>  	ret = fimc_isp_subdev_create(&is->isp);
> @@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
>  		return ret;
>  
>  	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
I haven't checked how frequently this would help, but at least in this case
I'd consider adding a
	for_each_compatible_node_scoped() following same approach as
other scoped loops.


> -		for_each_available_child_of_node(i2c_bus, child) {
> +		for_each_available_child_of_node_scoped(i2c_bus, child) {
>  			ret = fimc_is_parse_sensor_config(is, index, child);
>  
>  			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
> -				of_node_put(child);
>  				of_node_put(i2c_bus);
>  				return ret;
>  			}


