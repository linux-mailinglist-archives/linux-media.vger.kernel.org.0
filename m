Return-Path: <linux-media+bounces-43459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C38BAFCA3
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 11:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 817CB3ACA47
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 09:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BA32D8DC3;
	Wed,  1 Oct 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FElnhEZi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF72C21D8
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309794; cv=none; b=HU8V3zgwxzjxaGE1AFrAs0H9NUqX0PPZBzCm6l61vRtZTeFuvcYPJz0OPPW4jrUFpyyAAIouyGLPH5JF4YcTswJyPF1ANFQCQeYJDzG15eGOsyyJXRCm3xPlQmRoOK9iW2Joab9Fk8dgof4whv5vOS1ctWcZbPeK+vEP+bEFmY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309794; c=relaxed/simple;
	bh=uF12lvQ7jSsLNz7BaL0wy41LeSBFmmLcTFNTLGdhZl8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cRFqDzU7nvmZAtLF+G63cmJ0tDa1ihlHn1mckrkGxcJ5nlx6mEdWUWcu3XS8DCMA9IGDwn9oocBoQWo2Yra+AC3Ssz9dNAD2YHML5qU6M0lMkgzoXuJle8H+iavhQdqXF1xN+z3RrLg/4n9MIqYunpupoYUCEfz0GY3BgyHIg1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FElnhEZi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FE7C4CEF4;
	Wed,  1 Oct 2025 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759309793;
	bh=uF12lvQ7jSsLNz7BaL0wy41LeSBFmmLcTFNTLGdhZl8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FElnhEZiMU29Q8KFl6yqo/aiFlZTab9ohHzTJqdARaFQ3AcZArrQSBPGosWfU4YFC
	 um87yzthBURZDcIx7JttDjysm+rAm7BsciLrLJOnM2VUbqk998AVPMPD9wrunEQuLZ
	 tD02sPreGuyAnSMHG7JHjJIns7Je1NrHwRJ6WFf9NlwVpv9+mv56El8T7+prE0UXSM
	 tABDzUcYyOUc/ke7BmFmJC7axvnFb5MWwnctlgoLJqM69gtZsaoq3Ih+rc3hcMuMxE
	 TEurtlV1Xz4JKyz5vpK1cA99jv4IdKJHVej2OVMancQJhNPpKOv3/FN10QT5+3/w8X
	 1CF1MnsOhadcw==
Message-ID: <8eec5b1a-9b57-48d2-94dc-0afdb3f942ed@kernel.org>
Date: Wed, 1 Oct 2025 11:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] add basic b4 config file
To: Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20250905-b4-v1-1-2cdc261fd86d@cherry.de>
Content-Language: en-US, nl
In-Reply-To: <20250905-b4-v1-1-2cdc261fd86d@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2025 14:29, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> b4[1] is a very nice tool for mail-based contribution. A config[2] file
> exists to set up a few defaults. We can use it to set the To recipients
> to always add, in our case the mailing list.
> 
> This shouldn't be necessary if we had a script that b4 prep --auto-to-cc
> could call to find the mail address(es) to send to, à-la
> scripts/get_maintainer.pl from the kernel tree.
> 
> This allows us to not have to look for the mailing list to send the
> patches to, just use b4 and you're all set.
> 
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Since that ML is also used for other repos than v4l-utils and I've seen
> a few people using [v4l-utils] as prefixes, should we add
> 
> send-prefixes = v4l-utils
> 
> to the config file as well?

Yes please.

I'm not sure I want to have this in v4l-utils, but if I do, then definitely with
that prefix.

When you post the new patch, please prefix it with v4l-utils as well.

Regards,

	Hans

> ---
>  .b4-config | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000000000000000000000000000000000000..31873a088f0b32c174363f8b56a54a976b87fb17
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,2 @@
> +[b4]
> +  send-series-to = linux-media@vger.kernel.org
> 
> ---
> base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
> change-id: 20250905-b4-1e813446afa4
> 
> Best regards,


