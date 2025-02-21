Return-Path: <linux-media+bounces-26588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA8A3F96B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57DEE19E2C4D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D223F1DED5F;
	Fri, 21 Feb 2025 15:46:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F61DB933
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152768; cv=none; b=AkQuXSpnWK6zdlSfM3PhNIho4wW6aZTcBnh3od7hdxBzvBAFu9nxhy4LvfA81hMeYkwHiFz6j5n1ou4LVEzuysJM976x1Ny2zsWqWC+Hig/09bvce1yg9wTquLX5XdT6PjZZGLPOJBSKjXqWMv5RSt/+TVdg4vZiQCQq2BoL864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152768; c=relaxed/simple;
	bh=SwKE3r5/TuL1B9vSPWA3N17jldfwf50xPaAtCTdkKdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tuDmFM29VlGi1gP4MIWSeKNrMeavYyAtwJ3yrNhU9j7zeIAcBPaKNRIaUzmr5TrV5YEhhA/uSeFQz+LqhBMjdrPvy7xo6DwlbQ8QVYMWlLmOgji2m9qfGqvFVgJ/Yv1jPiH3eoopVxNwB71G5bvo66oCGBQd2TzJHnKg92jbTyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.15] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 32B5C32652
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 16:46:02 +0100 (CET)
Message-ID: <8a4a8aea-fdbe-4efe-8aa4-7cc216cf9f38@gpxsee.org>
Date: Fri, 21 Feb 2025 16:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/2] MGB4 CMT configuration fixes
To: linux-media@vger.kernel.org
References: <20250221120743.1703-1-tumic@gpxsee.org>
 <67b88496.050a0220.22d3c3.2258@mx.google.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <67b88496.050a0220.22d3c3.2258@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21. 02. 25 2:50 odp., Patchwork Integration wrote:
> Dear Martin Tůma:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0002-media-mgb4-Fix-switched-CMT-frequency-range-magic-va.patch checkpatch
> WARNING: line length of 113 exceeds 100 columns
> #30: FILE: drivers/media/pci/mgb4/mgb4_cmt.c:139:
> +{0x1082, 0x0000, 0x5104, 0x0000, 0x11C7, 0x0000, 0x1041, 0x02BC, 0x7C01, 0xFFE9, 0x9900, 0x9908, 0x8100},
> 
> total: 0 errors, 1 warnings, 0 checks, 9 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/71559185/artifacts/report.htm .
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

Just for the record - that long line is intentional like all the other 
tables in the file.

M.

