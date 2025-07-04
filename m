Return-Path: <linux-media+bounces-36817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1788AF8EC0
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497BE1CA38EB
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AC72BD583;
	Fri,  4 Jul 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRY4C7VY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83943136E;
	Fri,  4 Jul 2025 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621709; cv=none; b=n2LkD6gWfN/uZUHMHAlxgwSBDOTw4TcOfpIwsWzqs7lZ8Vc4VT8BSu+189lKUntx1jCih/YB4FwN2IhT9AgUwjTSOgLStxL6RMq/QlQoh7xyoslLdl+UaHHfStrq9AQwKJZy7XXWzdZqnYpsYSMGQ6a9/7IcyS+gEuvqy9eQFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621709; c=relaxed/simple;
	bh=sjpQwerkTSQSJ+5HxNnZjENx+8Sv2h18wFJ0NJTMlhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7Wdq3pfmrV7giYdpbpPoR4G1ujRhmADkr/9UqeSAOHt90eZe2TPKzile6Nvemqxi0X92ivBLtPrDW13I6Gcm0GxOH4nQOJQpofpRoON3j70waidQS2D4fTHZFcPJwoIGtxL1Zodcz6MqT09kbtp6GWjv1bAmAYbmHxaMaMqaG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRY4C7VY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6668C4CEE3;
	Fri,  4 Jul 2025 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751621709;
	bh=sjpQwerkTSQSJ+5HxNnZjENx+8Sv2h18wFJ0NJTMlhI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRY4C7VYBp9/VJJRC5krO5+jAS5oNGGj13jEdy/NJGyIhQkPHhd/rC61zsb06PiN4
	 wganjydgi4YmjQs3HGMMB4uEOfYpWSai3LERwAxY0KmigDEX7x0hSK6lsV2NDcA/vw
	 +bz6ckY8TMkwbCRgFeOTIo2dBW+nLglXj3yc4fmHn4d77zr+rHPouDmMaN9WhFzGCl
	 m0h/gTSEay62YTHhB80Vq0OyByE877Qt0e4unGf/caZ9c2yzvoUIjmXUfXp3oT8ngC
	 kWqP1TI9DC2zIihUG80yxBEJhBMx2UxAQSZ2NB0PwPWfgQKZ+mg7TrYb1W+ibyHu81
	 lbThbQJF5ATjA==
Message-ID: <1f23d819-bb6d-4905-9fd6-fe25bd8e00f6@kernel.org>
Date: Fri, 4 Jul 2025 11:35:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: atomisp: stream start/stop error handling
 improvements
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250505210008.152659-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 5-May-25 11:00 PM, Hans de Goede wrote:
> Hi All,
> 
> While working on the mt9m114 driver I introduced a problem where
> the sensor's s_stream callback would fail, which turned out to be a good
> test-case for the stream start/stop error handling in the atomisp driver.
> 
> This series is the result of fixing various error-handling issues which
> popped up using this (and other) test-cases.
> 
> Regards,
> 
> Hans

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this series will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> Hans de Goede (5):
>   media: atomisp: Move atomisp_stop_streaming() above
>     atomisp_start_streaming()
>   media: atomisp: Properly stop the ISP stream on sensor streamon errors
>   media: atomisp: Stop pipeline on atomisp_css_start() failure
>   media: atomisp: Always free MIPI / CSI-receiver buffers from
>     ia_css_uninit()
>   media: atomisp: Fix "stop stream timeout." error
> 
>  .../media/atomisp/pci/atomisp_compat_css20.c  |   2 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |   5 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 129 ++++++++----------
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 -
>  .../staging/media/atomisp/pci/ia_css_pipe.h   |   2 -
>  .../pipeline/interface/ia_css_pipeline.h      |   1 -
>  .../pci/runtime/pipeline/src/pipeline.c       |   2 -
>  drivers/staging/media/atomisp/pci/sh_css.c    |  27 ----
>  .../staging/media/atomisp/pci/sh_css_mipi.c   |  11 --
>  .../staging/media/atomisp/pci/sh_css_mipi.h   |   2 -
>  10 files changed, 62 insertions(+), 122 deletions(-)
> 


