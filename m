Return-Path: <linux-media+bounces-47073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E0C5CDEE
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4E8C4EEE27
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81059314D0F;
	Fri, 14 Nov 2025 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0L69Dv6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD252313E2C
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119494; cv=none; b=YAZgfe0gXlzlUB9nQCyEARMrZzATdMlgTQKVuGFnBXXWbKsO1ugcQPX8fCE1swKv4KrVGqZdI0+9A5U7rZdAjdsofVdYuJP1xa+OJoERtdk9j6mr1rWTfBmFy0pt+YzKs0Qzz3NS+wCYzUL5p3ImcUX/Kic7aGqhKPyoUnA/ALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119494; c=relaxed/simple;
	bh=UQvXS8YF7gzUoLegqd+5+ndxqzHuFnvi+GbFGefJJ2A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HO/9JUD/wnbn0a/VYysondins6+POkmsoOMtWmJzSfjazANSHJx8Ae4V3CEPdsYIlL4Dlp8vWZkgg6yX6w5UB3T/ydE2Shr3CGojKV/2bIOLADrgfsS13ZQPkTE07MQEyTlTRpwPSqLuA7isAl/D4eQ4p3DnqWT/fjilN9tlyK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0L69Dv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA7DC4CEF1;
	Fri, 14 Nov 2025 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763119493;
	bh=UQvXS8YF7gzUoLegqd+5+ndxqzHuFnvi+GbFGefJJ2A=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=P0L69Dv6tpzuNTfI23WitgLqWHKr52lXpx62fX9D/L5yFDfkK+Orc8xC3VupjRs+Y
	 NXy5czogL3PjRI2yz1kShAqGPRhYBizT+2UFg2RQIrEEYbTOHVP60+FjHPZ62KSqzO
	 X39BdFn6IANVV/DpPINEFMUHFsqC2snKoRqWfaAtvFCyewerF98fbO3+B6f8NQQoF6
	 FkNSrTZ1HbGoHi8zv6RNIDATzt+Csvv0A+UsU7ntoLIgyOP31g9zByS7g1nOkc8ng5
	 95OVJlNDBErFwwHK5NxSiu/ZS+lbE8x9gztXGhCKT2XVcYzdq9fZHTo913mkVheaaj
	 J3QDn+KvSCffQ==
Message-ID: <8a7c955b-8d19-4da1-9287-6ebaa6b0f0c6@kernel.org>
Date: Fri, 14 Nov 2025 12:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/2] Mali-C55, v4l2-isp late fixes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2025 12:02, Jacopo Mondi wrote:
> As suggested by Hans, 2 patches to be applied on top of the Mali C55
> pull request.
> 
> The first addresses Hans' review comments on v4l2-isp and updates its users.
> The second one is a drive-by change that brings Mali in par with RkISP1 and
> C3 and asserts the size correctness of the ISP blocks handlers and type info.

Thank you!

Sakari, Laurent, others, please review today if possible. I'd like to add this
to the Mali PR and get it in tomorrow. Everything else of that PR looks fine,
so this is the only pending issue.

Regards,

	Hans

> 
> Jacopo Mondi (2):
>   media: v4l2-isp: Rename block_info to block_type_info
>   media: mali-c55: Assert ISP blocks size correctness
> 
>  .../platform/amlogic/c3/isp/c3-isp-params.c   |  9 ++++---
>  .../platform/arm/mali-c55/mali-c55-params.c   | 10 ++++---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  9 ++++---
>  drivers/media/v4l2-core/v4l2-isp.c            | 16 ++++++------
>  include/media/v4l2-isp.h                      | 26 +++++++++----------
>  5 files changed, 38 insertions(+), 32 deletions(-)
> 
> --
> 2.51.1
> 


