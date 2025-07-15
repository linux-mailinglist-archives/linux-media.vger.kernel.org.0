Return-Path: <linux-media+bounces-37777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C17EFB05954
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4421AA2D44
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C5A2DAFB9;
	Tue, 15 Jul 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRAe5khj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26655103F;
	Tue, 15 Jul 2025 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580479; cv=none; b=AqnAJOWGRD1TToVW9tYa3CdSUkM+kJDX52qrXIhTj7cRgua7TxWGa8e7gxLAvLOlH/5zD7bzMXjgdWxAM6dKEt1DTgeqHl520TB1yii/4UFwfaQUTWCTVJOhtI4kqWrsdZBkWld1didMqK6l+tY4VS6ypHk7RaQfaTQ/XwRkxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580479; c=relaxed/simple;
	bh=Vxo2kxXmxNvRI0GL/aKT7Sr2dXRKuMCyAqmjXipuP8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6gS/wIyYzHMeB/BE58s/lqUdJ7OF8U/NLW9SomORqnpGWLECDf3CzLDdUSyfc6p7etMgpht+BLPmG12iMcC84f6mrspw8KKed7lVMwnO3N2bGdrrDkqPzyZI6c6SAqM+mAnyil5Q6v1FyC4E2QNsdpXX99jc1JbCDXBwVJ/9uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRAe5khj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C659C4CEE3;
	Tue, 15 Jul 2025 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580477;
	bh=Vxo2kxXmxNvRI0GL/aKT7Sr2dXRKuMCyAqmjXipuP8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pRAe5khjs2fbczolkYhVktkTugzSCATnicdJI5+1E1lknm01LjUSC4kuSf2dIRkrf
	 ryyK/PaNqMR1bo+FG2zqVv13fN9sP1HavaxcTxOdeq3jsVoc15YZqxOYKT4IPgkJzN
	 hKdi5m8P4ztTjXKE58kokskQD+nOoVn+OVJ0HYoiDQJzOeUskSgOYdOBwEe2jvpZig
	 qVC3bd8bh3NaAiu3YGwAoUXxgwfwbYZBa89esrVKI26ZAq3ECsgsZO0PrwktbEbSBb
	 n/aeZ9FEv5dje/Oq2weGzD9G2DYHcOwiYNt3FbmwDPzj3LjWrQb0oIOiRPf9RkTzY0
	 KeaWJphAer95g==
Message-ID: <60cf7590-4fd8-419b-a782-8bc89fb5395a@kernel.org>
Date: Tue, 15 Jul 2025 12:54:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: i2c: Add OV05C10 camera sensor driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, hao.yao@intel.com,
 mehdi.djait@linux.intel.com, dongcheng.yan@linux.intel.com,
 hverkuil@xs4all.nl, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, Phil.Jawich@amd.com
References: <20250714205805.1329403-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20250714205805.1329403-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 21:51, Pratap Nirujogi wrote:

> +	ret = ov05c10_init_controls(ov05c10);
> +	if (ret) {
> +		dev_err(ov05c10->dev, "fail to init ov05c10 ctl %d\n", ret);
> +		goto err_pm;
> +	}

I would expect to see an "identify_module()" function here, something 
similar to ov02c10.

ret = ov02c10_power_on(&client->dev);
if (ret) {
         dev_err_probe(&client->dev, ret, "failed to power on\n");
         return ret;
}

ret = ov02c10_identify_module(ov02c10);
if (ret) {
        dev_err(&client->dev, "failed to find sensor: %d", ret);
         goto probe_error_power_off;
}

ret = ov02c10_init_controls(ov02c10);
if (ret) {
        dev_err(&client->dev, "failed to init controls: %d", ret);
         goto probe_error_v4l2_ctrl_handler_free;
}

Standard practice is to try to talk to the sensor in probe() and bug out 
if you can't.

With your current logic, the first time you'd realise no sensor was 
present or is in reset etc is the first time you try to stream I think..

Definitely a good idea to probe for your sensor in probe failing the 
probe if you can't find the hardware.

---
bod

