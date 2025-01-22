Return-Path: <linux-media+bounces-25115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CACA18E78
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA30D1647D2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4B32046A1;
	Wed, 22 Jan 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0KoBh9d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E884A3E
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538594; cv=none; b=nQWg9pxILJP5t9GCTqtK8em0cwxc01w1NHLbGCg2RO6II/iOmNJhBhGmpaY77bcDWy2nXdXSdMrzEWPaHzAAxwtOiIR5CA/9sAHoeNtAcZ+1PHzzJkj1X52p+Z0V8QUCgv2n/Kf6beCAlohqPC0s9ETqqSg8H8B9gA3Nv0bLwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538594; c=relaxed/simple;
	bh=brERMkUE4FtwvHy4mwF5HGTB/Q42qogg6EmxzCzEb7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4vDce4Uv9Fr8R9TZ6EdXPnOLz5mOnwBBDfF0Xsk2bOv7PeopH0XV+5A1P5Pm3ezSO+XK50HuvMPKV/Te73qw/ym6UT4hIZsKyjZM98DuMWc9geyJjfg8jwoM6/wSQtbaKe1QF1QZ5V5JtSg6SPLZFjlXiemrIpocXYuvsLzQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0KoBh9d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737538593; x=1769074593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brERMkUE4FtwvHy4mwF5HGTB/Q42qogg6EmxzCzEb7c=;
  b=m0KoBh9dHYictyrqjd0LRVF3rdWtGbHgpxuFCirx0a5FO1bPYQ7oc+ri
   dgWgBIWh2uDxXmvuoQZVWqgH9MI3iKW3/0RJ1C2sCAZxCkyP5rAaSfq+8
   7NpJ2MCoESY4ABPmPZ/yxlbccxRASjshUAJs8VedyeCUTx1CYZgdEf61j
   CqzMQ6cxzVwrpd5KTrOdGWkNaIUvCvhnB7UB3/PnSVoDUSYRtbbhvm3j1
   ZJM1IHHU+qyKaA8joru0xI4PQaGwG3301L1b7zYerUStCOYyMGLzM2s3y
   JoEVzFCxIpDZUQRe/dkyU7ExBE2RB6Q4Cx5MIEUMaPlq0bopx0y+oWdzi
   A==;
X-CSE-ConnectionGUID: ba9HTi4oS0ywfaOr7ZKUkg==
X-CSE-MsgGUID: IgTBxGS8T9OE3QPKVLXg8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48650866"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="48650866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:36:32 -0800
X-CSE-ConnectionGUID: 7dE+clt7SlGWKnMeXoD6BQ==
X-CSE-MsgGUID: JC/+m3JLTvWgPXTAaGwiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106953031"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:36:29 -0800
Date: Wed, 22 Jan 2025 10:36:27 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, hdegoede@redhat.com,
	joachim.reichel@posteo.de,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v7] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <Z5C8G3pR1jyTyToZ@linux.intel.com>
References: <20250116232207.217402-1-heimir.sverrisson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116232207.217402-1-heimir.sverrisson@gmail.com>

Hi

On Thu, Jan 16, 2025 at 04:22:07PM -0700, Heimir Thor Sverrisson wrote:
> +static int ov02c10_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (ov02c10->streaming == enable)
> +		return 0;
> +
> +	mutex_lock(&ov02c10->mutex);
> +	if (enable) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			mutex_unlock(&ov02c10->mutex);
> +			return ret;
> +		}
> +
> +		ret = ov02c10_start_streaming(ov02c10);
> +		if (ret) {
> +			enable = 0;
> +			ov02c10_stop_streaming(ov02c10);
> +			pm_runtime_put(&client->dev);
> +		}
> +	} else {
> +		ov02c10_stop_streaming(ov02c10);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	ov02c10->streaming = enable;
> +	mutex_unlock(&ov02c10->mutex);
<snip>
> +static int __maybe_unused ov02c10_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&ov02c10->mutex);
> +	if (!ov02c10->streaming)
> +		goto exit;

I think pm_runtime_get_sync() can call ov02c10_resume() internally so we
can deadlock on mutex_lock(&ov02c10->mutex). We should avoid calling 
pm_runtime_get_sync() with the mutex taken.

It's not practical issue as runtime pm seems to be configured
incorrectly and in any know setup is not needed. So I'm fine 
to leave it as is and eventually work on that in incremental patches
after driver merge.

Regards
Stanislaw



