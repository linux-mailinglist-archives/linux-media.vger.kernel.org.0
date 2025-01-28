Return-Path: <linux-media+bounces-25335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6391A208F8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 11:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B24E3A6216
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F3219E971;
	Tue, 28 Jan 2025 10:50:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7919C554
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061421; cv=none; b=nbKmpVtxtCK4dakwjOirldZL2X0AX2EU0n3dJOfr/jIgHqHxeX3VgI9Y0xDEf/oIlS+Gn9s0gi1fKscMa0lyZwZ2LMKsfcygTJt4jcpbdYFHwYsHlpqxtRhrtgGSgxQjiuySG+hdTvilBYAc2oKcLM+qv9fvGRFcEKqj3ZKCs30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061421; c=relaxed/simple;
	bh=vgJuSwlx5yXcqlBqoK7MNAtGMv6U6mHYlcMx6AVubV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Tf3ps8Ryzd4FuOH2czxbOYzRqWTJ7d4/ALGfPir5v7X+ZztR3mGxBDiEODAL4wmzLpS2HOOS9i5SCxOkuC9/yEhnT/i/aqzQ8Tywe22MHnR34wlYWRwEF85kHV2aBJNmUdTmyPyKnQCKka9eYquJV3R9fmbzZjkOW+h8lWjjVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 28 Jan
 2025 13:50:13 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 28 Jan
 2025 13:50:13 +0300
Message-ID: <505fcc86-0175-4c9b-a743-3797328a517f@fintech.ru>
Date: Tue, 28 Jan 2025 02:50:09 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: usb: hackrf: fix device unregister order in hackrf_probe()
To: <linux-media@vger.kernel.org>
References: <20250127173112.446048-1-n.zhandarovich@fintech.ru>
 <6797d12d.050a0220.14aacb.2e43@mx.google.com>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US, ru-RU
In-Reply-To: <6797d12d.050a0220.14aacb.2e43@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

I don't mind sending v2 but I suggest that the warnings below should be
ignored.

The extra long lines only refer either to syzkaller output log (that I
already somewhat butchered to save space) or to Reported-and-tested-by:
line that also can't be shortened.

As far as I can tell, checkpatch.pl doesn't have any more issues.

Regards,
Nikita

On 1/27/25 10:32, Patchwork Integration wrote:
> Dear Nikita Zhandarovich:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-media-usb-hackrf-fix-device-unregister-order-in-hack.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #18: 
> CPU: 1 UID: 0 PID: 7854 Comm: v4l_id Not tainted 6.12.0-rc7-syzkaller-00125-gcfaaa7d010d1 #0
> 
> WARNING: Possible repeated word: 'Google'
> #19: 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
> 
> total: 0 errors, 2 warnings, 0 checks, 14 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/70052367/artifacts/report.htm .
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

