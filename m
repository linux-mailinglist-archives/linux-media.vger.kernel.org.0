Return-Path: <linux-media+bounces-25159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB6EA196E3
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DEE716B1A9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66EA215058;
	Wed, 22 Jan 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL+FTm/b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66A212D69
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564742; cv=none; b=VXvZTfznANos9I2MqWALbpbEPwHOfw5RYrwAhlgNd9xFAWM5blnbTJ/tvkMYS+3HLwz2uSzTcxvVyApMuyPVtYu9bdrGV49z0gqoM5mLLRHK4Onp1wayKGQmoX2Nau7f7A+M1wH5xZNbYL+n7Tzg9o0Af1p91m+/CX6dHvaHSzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564742; c=relaxed/simple;
	bh=njziuUnm5xtv8flQ2gjpITb5o3quB9tyBAAHmsMrUgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAMYnE47HCmYx4WT6N4hHVwf3qI7oC5Zi9F57w1v6naUKcjhT5yxpu6QBd5IA1VM1qrV6Xb+L0qYnNzl5P598H4IZDpS9pThIU8YIjSfzXCES931r9fGfyQv8TSBC6TBd0j2pOVK3rmIcZQ58sN/Q3mUI0Y0tWBUNjEe4dASG8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL+FTm/b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737564741; x=1769100741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=njziuUnm5xtv8flQ2gjpITb5o3quB9tyBAAHmsMrUgc=;
  b=QL+FTm/bPnIcAex2KT3pZVqBb65B9pL1VA5VdIWNaphSO3rG6e3iYDqC
   6Pqp2B64NhyvGwpYudKO+gLc3aNjZXKk4BgjtI2KFF5IKhHlMkKwBu7M+
   /dPhTxt1bkZ9rO4qJe1uQOYO5f8LDlQ8uuAclKqcHCcs5g34srhnFO0Zo
   brA3U66dZi25jA/WJ2N70qGYREFoPm/Ro3rNnL59DhJNb90oVXj3/ERjF
   4Xj5VQ/kLKbo6Z9o9BlcCUAy1xcqs3a+sKXufnRnmtXL2zYRXILbRgdCZ
   RUF+mfNw0F/K7NVGU6UYcuYjblNLdtzfxVAhbeBbIIdpg9JzXgZ3WcEjm
   w==;
X-CSE-ConnectionGUID: iQrrwplkQ8KVw4gAPk+RtA==
X-CSE-MsgGUID: 8dAfxRQCSLG+B/7qyXafLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40853288"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="40853288"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:52:20 -0800
X-CSE-ConnectionGUID: a0DJdMJMT26NWg2cOP/3/A==
X-CSE-MsgGUID: yT1rNW07RTW7Wyl5jVM+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107029667"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:52:17 -0800
Date: Wed, 22 Jan 2025 17:52:15 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, hdegoede@redhat.com,
	joachim.reichel@posteo.de,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v7] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <Z5EiP2mA0KIqIjkl@linux.intel.com>
References: <20250116232207.217402-1-heimir.sverrisson@gmail.com>
 <Z5C8G3pR1jyTyToZ@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5C8G3pR1jyTyToZ@linux.intel.com>

Hi
 
On Wed, Jan 22, 2025 at 10:36:27AM +0100, Stanislaw Gruszka wrote:
> On Thu, Jan 16, 2025 at 04:22:07PM -0700, Heimir Thor Sverrisson wrote:
> > +static int ov02c10_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	int ret = 0;
> > +
> > +	if (ov02c10->streaming == enable)
> > +		return 0;
> > +
> > +	mutex_lock(&ov02c10->mutex);
> > +	if (enable) {
> > +		ret = pm_runtime_get_sync(&client->dev);
> > +		if (ret < 0) {
> > +			pm_runtime_put_noidle(&client->dev);
> > +			mutex_unlock(&ov02c10->mutex);
> > +			return ret;
> > +		}
> > +
> > +		ret = ov02c10_start_streaming(ov02c10);
> > +		if (ret) {
> > +			enable = 0;
> > +			ov02c10_stop_streaming(ov02c10);
> > +			pm_runtime_put(&client->dev);
> > +		}
> > +	} else {
> > +		ov02c10_stop_streaming(ov02c10);
> > +		pm_runtime_put(&client->dev);
> > +	}
> > +
> > +	ov02c10->streaming = enable;
> > +	mutex_unlock(&ov02c10->mutex);
> <snip>
> > +static int __maybe_unused ov02c10_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> > +	int ret = 0;
> > +
> > +	mutex_lock(&ov02c10->mutex);
> > +	if (!ov02c10->streaming)
> > +		goto exit;
> 
> I think pm_runtime_get_sync() can call ov02c10_resume() internally so we
> can deadlock on mutex_lock(&ov02c10->mutex). We should avoid calling 
> pm_runtime_get_sync() with the mutex taken.

Actually I was wrong, code is fine. ov02c10_resume() is used
by system resume, for runtime pm resume ov02c10_power_on() is used
so no deadlock issue at all.

Regards
Stanislaw

