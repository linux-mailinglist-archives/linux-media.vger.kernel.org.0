Return-Path: <linux-media+bounces-23851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B28729F8DC0
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 09:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C54D1680C6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 08:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7191A0BCF;
	Fri, 20 Dec 2024 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DrbLgP4e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A008A31
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682438; cv=none; b=JgpBdNJrsrfH1Ffp0vIpcPdOFVjnfoSOIxYsb7l+vkqizgc0IOv4eKmPCFi60f4WHcT1/ATVUlQ+WSQQHquudToeZFT1tyMEHJWkJgiBEPlupHS8dT08FqrcSbfk9e83yxgEIGCgnDwfeug3K+jcCEBGOO2I4HFND/mzpuh0LlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682438; c=relaxed/simple;
	bh=lZ5nn/2wxmWzxjQd3fmLt6x/bSPVVbKOfYoweYAQ3Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFtiL3pr05DUXvKnpaVd+SrNz8F66wVZ13NYhdISc1Vk58lqoCL5cGbKHAmD4qEx9KdjVgWfZgiVlN7rCkGZ8vzyv3AF2emznTg0xmJdy1V2ws+WteJSAutlyqTvpto5cQREFvBifwddITmuwtOiwTt/+VzxZ0bYKfZLMo/GsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DrbLgP4e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 045AE7E2;
	Fri, 20 Dec 2024 09:13:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734682395;
	bh=lZ5nn/2wxmWzxjQd3fmLt6x/bSPVVbKOfYoweYAQ3Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrbLgP4eDI+yXGASVMEmpCVg1446ZMlpMBw4i9WkQ96K2ysuJ9GTOnHFFnwwwGFZw
	 m4+L+zj1z7DOjp1bJSg2ygtWcBgCZOXU3ZQHEIBglVZF73F3h2CmZwi835Cz5TU6Of
	 j3fOptmuTngiZQer+Y6t11V3Z2ZrjPQ1N0sMc16Q=
Date: Fri, 20 Dec 2024 09:13:50 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [0/2] Add support for soft reset
Message-ID: <cn47osp7jzafevobztjb476vfy2sdyifrhs6i4hek2ulz2hyrt@7v7leulw3p77>
References: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
 <67648382.050a0220.3cc719.1515@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67648382.050a0220.3cc719.1515@mx.google.com>

Hi

On Thu, Dec 19, 2024 at 12:35:14PM -0800, Patchwork Integration wrote:
> Dear Jacopo Mondi:
>
> Thanks for your patches! Unfortunately media-ci detected some issues:
>
> # Test virtme32:test-virtme
> Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
> Errors Found!

The reported error doesn't seem related to this patch

Cannot open device /dev/char/81:20, exiting.
FAIL: the vivid module failed to load

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/68463424

Am I mistaken ? I would re-run the job to make sure it's not a fluke,
but I don't seem to have permissions to do so.

Do you prefer I open an issue to track this ?

Thanks
  j

>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68463425/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

