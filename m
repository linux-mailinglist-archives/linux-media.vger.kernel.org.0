Return-Path: <linux-media+bounces-26484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B4A3DE07
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20E119C44C4
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE0F1D7989;
	Thu, 20 Feb 2025 15:12:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED61CEACB;
	Thu, 20 Feb 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064365; cv=none; b=nMQJwwprtJZ/FtcSJkaWmB7ApgWDsBhiKuSWKvb416qo8tpb1Glj/sM+b/WzQI9hi9ZHDC4Tg7PvsUn0MmPbVTE15kRN7rkr7fQllEFNsMy3g4dvQfF2so8a1strMp8EZm6qaIl+8fComQgsiQEvGPW9y6LhjoG+L9Xr1+vGsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064365; c=relaxed/simple;
	bh=YPIkUGlQFnZXPZsqT++8YQKXFl3MC3rlg5EhJD5fdpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D67a0+LwYXrTLLySj8ayK9ZugNGe1szGIQBSaMGkCGBUw7vS4zLQ79SbiW5587/3HMyAOvXCWBINwifF//qDjtpbV8djKwvvW+teItbxeKLEzyC0YhwpppoVdG7Hf9buaelQcTRV9rwaZuAK8c9PjUeqTOXgO8s+1ZsqHOLi73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2AAC4CED1;
	Thu, 20 Feb 2025 15:12:39 +0000 (UTC)
Message-ID: <55389b80-9f0e-4423-8e92-c486de058720@xs4all.nl>
Date: Thu, 20 Feb 2025 16:12:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
 <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
 <Z7c252IKhXdysjAi@smile.fi.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Z7c252IKhXdysjAi@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/20/25 15:06, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 02:55:42PM +0100, Hans Verkuil wrote:
>> On 12/3/24 09:31, Mauro Carvalho Chehab wrote:
> 
> ...
> 
>> ORing enums is really not a good idea: you would normally never do that, and
> 
> I think you missed a keyword "different", so "ORing different enums ..."
> which I totally agree on, but the same enum values are fine.

While the compiler might be happy with that, I think ORing enums regardless
is weird. It's not what enums are for.

Regards,

	Hans

> 
>> the compiler warning is IMHO appropriate.
> 


