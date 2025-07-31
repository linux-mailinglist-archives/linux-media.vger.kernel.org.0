Return-Path: <linux-media+bounces-38679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECFB16B40
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 06:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF1BF7B1415
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 04:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A84A23FC49;
	Thu, 31 Jul 2025 04:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hqy+SNXf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB481DF25C;
	Thu, 31 Jul 2025 04:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753936506; cv=none; b=SEtl1k1YmZpA5RF1/HpZN9zGwh4dd0T09WAYvq5y1YQ49WIXrFqX9v6UzlqrRnotmHKH6of7Y2S2jNKBAovLAjq/UwT2z5skw8oF80QTxbym9srnQ8Nxj5VolZemdZzUGEKguDHDfINFIcQe+vM5NucMk3nvXXrOtjN5q2haUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753936506; c=relaxed/simple;
	bh=uI2zZI3+kO9i+v00RSR3Xf9FIudIDSEoGZEukiPB+XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYMiofaR98Tjhq3HyYe65xMb0Rucfqhg9ypgMLeEI5YSBb/4TqrvLVAGkjswhviL5+4wqQ76vumaYQktz1QoihkO9MZJn3jvenyZQjKWGbvioRDJwhc8ZFnQHcNsXmoYJH37dBA+HpvgOA2rn98UZC+PDrpDcRfei2gx87xAL8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hqy+SNXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41C8C4CEEF;
	Thu, 31 Jul 2025 04:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753936506;
	bh=uI2zZI3+kO9i+v00RSR3Xf9FIudIDSEoGZEukiPB+XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hqy+SNXfAB2rBBB8ZdYZwr8profocnFCvI73hnfV2hmYLOZb9GoJwGQvSaFZlV3K/
	 XF8gYWa1//j9ShhU2L0CUlf9bDX9gIJdzhoXRBULNr27vhnj/Um9ZAg1SZwilOgKPv
	 cV8q3Y1CiR6KP6tJtUbe5tfmRHQ2NdKzmWmqNR3A=
Date: Thu, 31 Jul 2025 06:35:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver
 AtomIsp
Message-ID: <2025073142-unwarlike-shining-c534@gregkh>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
 <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
 <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
 <CAGn2d8O0TMqBR0wvBVbWzKKKqQyLWzn9Rn-8bhYTC6wR7-HwcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGn2d8O0TMqBR0wvBVbWzKKKqQyLWzn9Rn-8bhYTC6wR7-HwcA@mail.gmail.com>

On Thu, Jul 31, 2025 at 06:24:09AM +0300, Abdelrahman Fekry wrote:
> Hi Maintainers,
> I'm just bringing attention to this patch series as I have a lot of
> other patches that build on it .

It is the middle of the merge window.  Please wait for -rc1 to be
released, there is no rush.

thanks,

greg k-h

