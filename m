Return-Path: <linux-media+bounces-40095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDCB29AF4
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCB818982EB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7717527BF84;
	Mon, 18 Aug 2025 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+8X/nEY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865427A914;
	Mon, 18 Aug 2025 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502738; cv=none; b=bxWyfjZtPuDOVJKJxPy5QqOq83JTfcJ6m3lPNqBSgwjMxoFQ1xRGovrhr+yKJiD4Wd89Zoaq93Av+Z5BuqxShh6powTNFafnTeUz0cyDEtJz7I8/mQjGYo1pn63weZ8HPJ186+hlBARQwYnnDNpOAiuy91J75CKi60AJVjTZ6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502738; c=relaxed/simple;
	bh=XbvqUWoAr2QiGQSEbIQRQFzPuuiG5jhKpVOMj5hzuLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTxgl/NmsHLCEjad397uVHzUMq27Df4VOdUm696zJQv8EEHUT5ZfmFTTpM8V3B4dSvJQVp2PK8K/JMJC0ysCwKVeytd5Sph9o5UgRxHqt0hHJJFEu7d6iic/5l1/cgaCNhjquunzrZHJf55S658Cs03HvlMVcENPlL8zVrcGYJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+8X/nEY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755502737; x=1787038737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XbvqUWoAr2QiGQSEbIQRQFzPuuiG5jhKpVOMj5hzuLc=;
  b=S+8X/nEYg4M8G6Gzp/8FosEB38klmjC5cZOK8hDjsW4ncpdRGV7ZxLO9
   O4L4bZR0+I7MXw96ehctbVoDPFr8YcTFf0d+Rp83fArZ11E7DbL9LJ1Rz
   4mvHfc0nCf/C0uhVnGYgPqEIPy7XnIaLQBOcxhdzq527/CCrZZv+SOM4N
   MCq2Hge4V3BmmXy2+/k7he8ZgZoshz1gbi4dE9g0U1ddU20UnXdoz9cC+
   V1liMXIw+f4qpDFNqjwHoND0MYUUGO7z7VGQzGM6U8pe7jhYZhiXDM6Op
   Jyf2zzGy9znb8ecJrKbD3vy7rxpFU0dIdo6OvvEllEaOhM5/Yz53xwh9P
   A==;
X-CSE-ConnectionGUID: 8/mCGti6ROKOAu4fAqZU3Q==
X-CSE-MsgGUID: KriLX0fPT+GDAGBUWF3rGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56748249"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56748249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:38:56 -0700
X-CSE-ConnectionGUID: A9bs3weXTJWfbitgYqUBmQ==
X-CSE-MsgGUID: wlmyt3iJQzutoEhVwwMfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171750576"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.152])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:38:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CF2FB1212C6;
	Mon, 18 Aug 2025 10:38:50 +0300 (EEST)
Date: Mon, 18 Aug 2025 07:38:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 3/7] media: i2c: dw9719: Add driver_data matching
Message-ID: <aKLYis79QnAAWUoe@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-3-426f46c69a5a@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817-dw9719-v1-3-426f46c69a5a@apitzsch.eu>

Hi André, Val,

On Sun, Aug 17, 2025 at 07:09:22PM +0200, André Apitzsch via B4 Relay wrote:
> From: Val Packett <val@packett.cool>
> 
> In preparation for adding models with different register sets, start
> assigning the model based on the i2c match data.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/dw9719.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 5ed0042fce18acd9e6ce9f6cf6c6982e36fed275..7ce66eaede5a2a1ba9c4c30c0efc5fafcca339a0 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -282,6 +282,8 @@ static int dw9719_probe(struct i2c_client *client)
>  	if (!dw9719)
>  		return -ENOMEM;
>  
> +	dw9719->model = (enum dw9719_model)i2c_get_match_data(client);
> +
>  	dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
>  	if (IS_ERR(dw9719->regmap))
>  		return PTR_ERR(dw9719->regmap);
> @@ -361,8 +363,8 @@ static void dw9719_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id dw9719_id_table[] = {
> -	{ "dw9719" },
> -	{ "dw9761" },
> +	{ "dw9719", .driver_data = DW9719 },
> +	{ "dw9761", .driver_data = DW9761 },

Does something still depend on the I²C device ID table? Couldn't we just
remove it?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
> 

-- 
Kind regards,

Sakari Ailus

