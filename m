Return-Path: <linux-media+bounces-21707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 631189D4668
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F35283502
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 03:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472B013A250;
	Thu, 21 Nov 2024 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GNYvIKjm"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1023099D;
	Thu, 21 Nov 2024 03:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732161587; cv=none; b=uWRdDiSbnwOaRhzqNG4T7J1SXpT7b5hk7h7HthIcfWiRtFDltZJbfZKjrjS6L4MiAbr/ZCAHp1EgWqq1F5TSVXCXjGKRpghPHoQHdDSed5K/4eaV7zDBZsKDj4srp/m5onf9kxyCz/SPlC2AUt4mTW3jUBMRkT6URbneC/1g4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732161587; c=relaxed/simple;
	bh=xRQ+NukL96XVgf0TjxScXjTeGDznVFzspHowFnHfHyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gM7jp5qqQiSc9P/UV6FUwB8DzNYOUdb3DvzRWeTWyMuJfa3H1pSkV4ymvx0+5fqfaahakf14Db0ZB14TOWdqOflnSxNZ9JOoRCICs07a4kYCYkDnccIYwrkCR0snUUliFSl7RM9Asfa0Mt4LDj7dkGYGD6twQgDjeyEYy+x+N/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GNYvIKjm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Z1G3HjME0MUpLj8hYZp8r4/+FSgSZ05odH8oiA0RgU0=; b=GNYvIKjmL9Uh3sdHrNf+aDS1R/
	TXwip7IOhCyudtu6L4x3CVedsP6BKnxZ+l5v6yaE2PQogfEauobLhocYUQJ8sEYPvUftWAw/z9Q94
	EgPsB1R8JKb6IRh2UY6G61PJptzEEOHr+LOAz/RXSoZLfXxblQXWmu8xV+XE5Hw8P9MARn2JRqcVI
	UvmCqTbT6clNDejIj5R56XTCHoM+YAUPPW0V3qRtc4ewMtjje8Qom7/SHs0hJWQuTFCc//AqKwQty
	63dKs5PqfhkIQXRKfzEzZKL0348cZtFi4ol/fpNCRITeo3jfvodcXZZhsWsbalxS7JqLasfInEzqA
	hagJxUAA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyM1-00000005vza-2wRh;
	Thu, 21 Nov 2024 03:59:43 +0000
Message-ID: <d26c4116-9ec1-44a7-bd61-a5de3ff9d257@infradead.org>
Date: Wed, 20 Nov 2024 19:59:36 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] docs: Add debugging section to process
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com
References: <20241028-media_docs_improve_v3-v3-0-edf5c5b3746f@collabora.com>
 <20241028-media_docs_improve_v3-v3-1-edf5c5b3746f@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241028-media_docs_improve_v3-v3-1-edf5c5b3746f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/17/24 11:03 PM, Sebastian Fricke wrote:
> This idea was formed after noticing that new developers experience
> certain difficulty to navigate within the multitude of different
> debugging options in the Kernel and while there often is good
> documentation for the tools, the developer has to know first that they
> exist and where to find them.
> Add a general debugging section to the Kernel documentation, as an
> easily locatable entry point to other documentation and as a general
> guideline for the topic.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  .../driver_development_debugging_guide.rst         | 223 ++++++++++++++++
>  Documentation/process/debugging/index.rst          |  65 +++++
>  .../debugging/userspace_debugging_guide.rst        | 280 +++++++++++++++++++++
>  Documentation/process/index.rst                    |   8 +-
>  4 files changed, 573 insertions(+), 3 deletions(-)
> 

> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
> new file mode 100644
> index 000000000000..10fa673f0fe3
> --- /dev/null
> +++ b/Documentation/process/debugging/index.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +

[snip]

> +
> +How to do a simple analysis with linux tools?

                                    Linux

> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

