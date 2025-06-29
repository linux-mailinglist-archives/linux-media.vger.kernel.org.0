Return-Path: <linux-media+bounces-36237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9AAED522
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1D8318934AE
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5151221A437;
	Mon, 30 Jun 2025 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drnoSktv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D12080C8;
	Mon, 30 Jun 2025 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267195; cv=none; b=mBnJcJ66UJby6j7MwLuacsLY5zlukdW+h7Bw9Wg1ZwyRYJtLUSAYF0u35mPrSL7TYo3W/MhYd07GyeRNhVCV2LFpGKxvH/px1zrzBu74N8JrzYIxjrX74rJFbCJTsNhsUlKE0CXOg9kswrHLNTFNITNDH7ygot44iOxQCCDrtxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267195; c=relaxed/simple;
	bh=wllN8t+w1pW4Y3pzRl8hQh6vUCgWQ0nNy9reVORuNqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrkTmPwAmdeWJk/VniwtXzhUgsQI2oo6Hg6LB+DTGmPdc+HWQjmWPvV36KrbGOpH9iRbktjxf1Vv51RupJMTi1vxofpZvlAAbIh9C7ReM18WI6p+xxuSmXJRk8CHxB4fyK2xZpJfX5AU4lv9IDO3u0hsCVaGHetUDSF9fdOh7Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drnoSktv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267194; x=1782803194;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wllN8t+w1pW4Y3pzRl8hQh6vUCgWQ0nNy9reVORuNqw=;
  b=drnoSktv/XCPDmrPHYDx3aphf9patgbrhUjbO5Lb58A+safzwcrGn1d2
   nZdxBefkNADBin4RPtMBVcnDazO8mMkCuWdp+VlwIQ3fO9BqjgdonJYAE
   fZQRLDiFv5mg6uE9n5QatCLeozNrhMdivKGIhD9/iUxbmO+geOuyEZoOl
   5mcSZSWuO7wyN/hHgjrG6XaGZVdQ88gpwI/bnsuEHo/cO9ZSow9v/+htn
   +wjSHClHcfxPkp4EfFdV/EGc7HYCMMPyyF71+k1FZseaLTNoE/63UN12F
   WHzwaJfCbtaHB+bI/ifUpbgrzeBJAWymHUwjYip+wspsYGZOHtTseHCM0
   w==;
X-CSE-ConnectionGUID: ud1M9yaaRDyN3aOWLZVnxw==
X-CSE-MsgGUID: JrW4u5ClQByxgwhx3Z5zRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52600137"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52600137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:33 -0700
X-CSE-ConnectionGUID: CX4JkTxEQg2iywO4aH5ZDg==
X-CSE-MsgGUID: LpgIKwFGQhauP3hS2zFHZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177046689"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:27 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 4DDAE4436B;
	Mon, 30 Jun 2025 10:06:25 +0300 (EEST)
Message-ID: <7c4379dd-e004-4e0d-85db-139c3f671edc@linux.intel.com>
Date: Sun, 29 Jun 2025 11:30:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Content-Language: en-US
To: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250305094359.299895-3-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mirela,

On 3/5/25 11:43, Mirela Rabulea wrote:
> +struct ox05b1s_reg {
> +	u32 addr;
> +	u32 data;
> +};

Could you use struct reg_sequence instead, please?

-- 
Sakari Ailus

