Return-Path: <linux-media+bounces-31367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9573AA43DB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF8B1BC82C9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 07:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD442205AD7;
	Wed, 30 Apr 2025 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoekLzk9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033981F30A2;
	Wed, 30 Apr 2025 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997945; cv=none; b=fqaBXsOQp66Uim9xrjkeJF2DnKaU36m929ZpoW2xMiF/jKVBp8rOzvPvOAUBN+zTrY+LKW4n1bfXdC+afV5YnY4cDCUH/Vev1WEU+kpq3PNqP+FEHv8kP1LrQzyo3JrvmBbYadNoXoztouvIEUFDbRh78KZCKPhuhigJYchuVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997945; c=relaxed/simple;
	bh=ubaqlVCfzznK8NA0TMC5zjpm+9ElhduUD1AiUfUvlmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPiRayjjb1NnC9CSgNXjpiknDHAYvx0RR2KHLubXvkhYwNfAPcnPl+jzXXIN2CTL5pUArDDuFrMwlOT0Gnw6oFGjC9p3G92IMlZqi5G4A8mqp5A79zN317AhE5Vr1rGKs8ztjveQ8XtGIuYUJl8kOTNHxVunLWK/XArbVLjXxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoekLzk9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689D7C4CEE9;
	Wed, 30 Apr 2025 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745997944;
	bh=ubaqlVCfzznK8NA0TMC5zjpm+9ElhduUD1AiUfUvlmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoekLzk9b3pSI3wfRQXkoK+YkC7T9GzOioy/a7VPZclg2DMn4NSy0mZTrYEsFfG6u
	 j+TVy3071KEcevi9hn+vEoWtxdh3n+nFYIUx/l4H7liz4OFiX586shc1HURUAgcMKs
	 D/YWV3L7aCN0O9KMc3/piJV1fPH/DQdkNSf1lHYYa76nKTa0rP4vmZJnOX1M4nTukm
	 aVs5mYEJee2c9fYvgA+7huqkvVELuB0pCfpqL/MjHyKHYWI25tkoeYCg43zRNjqkNn
	 gfO1a20CeMUXQzTOtUF1av8ph3zczrbwBnjVBrbYHmgOxa9jaR0m6K2tq9W9vUkv0J
	 riec7HKUrT6pA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uA1pC-0000000088Y-1Y7K;
	Wed, 30 Apr 2025 09:25:47 +0200
Date: Wed, 30 Apr 2025 09:25:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aBHQejn_ksLyyUm1@hovoldconsulting.com>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>

On Tue, Apr 29, 2025 at 08:08:29PM +0200, Krzysztof Kozlowski wrote:
> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> 
>   qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>   qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> 
> All of these messages are the same, so it makes no sense to print same
> information 32 times.

It's even worse then that (several hundred messages during use) and I
sent fixes for these regressions a few weeks ago:

	https://lore.kernel.org/lkml/20250407104828.3833-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20250407085125.21325-1-johan+linaro@kernel.org/

Unfortunately, it seems Bryan missed that this was a regression that
should be fixed in 6.15 and only included them in a pull request for 6.16:

	https://lore.kernel.org/all/20250410233039.77093-1-bod@kernel.org/

Bryan, has your PR been merged? Can you try to get my fixes into 6.15
since this is a regression in 6.15-rc1?

Johan

