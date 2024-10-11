Return-Path: <linux-media+bounces-19431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD6599A627
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BD27B21654
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242FC21949A;
	Fri, 11 Oct 2024 14:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rixYPlW5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF53184;
	Fri, 11 Oct 2024 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728656359; cv=none; b=HpK559sj6iEqs8v9oEARgQC7Lw6XLSM3B8HIv95kwM0/vV4p4R2Hc3EWGjNCycf2N3i5ADYe6cjqx+IlgpZZtbVCdcLUe0S98sDO1DIs5/cyQurdtGa27QWOKxmfTu/dMj6wvrR+FAfgCvrohCT5byJ/MpgR+3k2Jg6HoPTCKXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728656359; c=relaxed/simple;
	bh=fOtfbSb6mqzXBJ5C/KZ0HPYyW7bqP3gj8kx88BmpEuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+iPtvVMeSycan9XYiQWpllhFdgZbMhXMI9NaoRWRYFRO/XYLSWNwm1zZ/6xSbhCqw1YXoNrTa/6o4np3n1WyoZ/X9GpuLSlYZgWxM/TTmzxAtAX7xFNqzi5gHpGTaDrAxvjX0nvfCJdngKScSJwJuPlwjNQOgNNN93+zOfGxGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rixYPlW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117B3C4CEC3;
	Fri, 11 Oct 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728656359;
	bh=fOtfbSb6mqzXBJ5C/KZ0HPYyW7bqP3gj8kx88BmpEuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rixYPlW5qgCf+J4b0zHbEMWiXflJKTLzQFs/TMLjWmes5HlUO9JJ2gGE744vSLO+h
	 oDkNY6AYDqSfT6Bhzq6u/jRsxOEHQlw6TW8SdT8Oe0QCXDPEm51LkxJKrsjcUmZCsf
	 ZQzqm0AURQiJcECA2pdvaznkvQ9su3v/BqsBHWqv7jE7kVwCfd9DYEaioxvayY2FJV
	 zuYhMSW2yDuZtvIJsxVEWLCq5v0Q8djj0spfn97WslmjP+7GPj9iUAbjotRt0k7XQB
	 Oxpzao0GPabV8fl8cnujsm9VM1EPGzDzRjyVkRd4goVs6tsJYaS/K6Ue5eENHoXeiG
	 1HXE/9nkY/1Mw==
Date: Fri, 11 Oct 2024 16:19:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <iw5jsp5id5mrnoieouxs64algzz4v25wrneajd2fevbcunuhai@es5jqsv45qz3>
References: <20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org>
 <20241010-b4-master-24-11-25-ov08x40-v6-2-cf966e34e685@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010-b4-master-24-11-25-ov08x40-v6-2-cf966e34e685@linaro.org>

On Thu, Oct 10, 2024 at 01:33:18PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on DTS based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


