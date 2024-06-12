Return-Path: <linux-media+bounces-12991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F6904B1C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DAA4B2191E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 05:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BF853E2B;
	Wed, 12 Jun 2024 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uH8jEcsm"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD2535D4
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 05:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718171888; cv=none; b=EzAvDlA52uuXkxezwNDLPCn9yjjtrWY3yQ2T5nwv0D4njfnN7d5oZcp32oFGMVYiv89LjidrzUlEaxsjSM0hcBPR883V4l4fX6yYEYxe8PNdBw1stCv4IlRj8PxLyRIr8viaiU6nwdE7830+ZRKCYa1Rn6o+OiZn0zultDv3TjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718171888; c=relaxed/simple;
	bh=N/WeydGNmiiljaKIus5viNXLAvz90UmVWg8XDt+UEdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=Ze2MZK3wKqI8xylwt2V1HF1lw7TWK9uXDVHwny+TJPZdR3zmJViLY1ZPGAGxPROEQ5TrsXVUtVXv7xWLMO/N3bRrxO/m7Fs0N1t0z+W+nzakF5qlhXtf7gZjpT4ln5iHx469KRz/OshjT9apGRd3ZtA44akTIleJJSJKq3yL79M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uH8jEcsm; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45C5vxMR113797;
	Wed, 12 Jun 2024 00:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718171879;
	bh=aHcykWNR5VfUYsb3ISFsQjsCB6R30e+Jj5fslx/gXnE=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=uH8jEcsmHMBXmOjvOmmTwD7u86tHACJCt6tlmWurMF4bokhO4pjsyr2kjt5UsP9Xz
	 eMe04HHE7QxPlYqzTb38BNfMjxYfNvvjhZEpXnwV8EVmk1gR21JgtkvdL355BCNJR9
	 Y7JSx0x5Bs1z7eQBMB6NPbe4dHKvIVSUfltB1sRU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45C5vxm2071153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2024 00:57:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jun 2024 00:57:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Jun 2024 00:57:59 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45C5vvJ1000412;
	Wed, 12 Jun 2024 00:57:58 -0500
Message-ID: <fe8c3f9a-b6c7-448d-8216-a803530b3954@ti.com>
Date: Wed, 12 Jun 2024 11:27:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL FOR 6.11] Imagination E5010 JPEG encoder
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
        <linux-media@vger.kernel.org>, <akpm@linux-foundation.org>
References: <20240611155528.mqmekz42cgs6jpdi@basti-XPS-13-9310>
CC: <gregkh@linuxfoundation.org>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240611155528.mqmekz42cgs6jpdi@basti-XPS-13-9310>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

+Andrew,

Hi Sebastian, Hans, Andrew,

On 11/06/24 21:25, Sebastian Fricke wrote:
> Hey Hans & Mauro,
> 
> Doesn't include the math changes and
> https://patchwork.linuxtv.org/project/linux-media/patch/20240607133253.3559339-1-devarsht@ti.com/
> has to be taken separately, as discussed here:
> https://patchwork.linuxtv.org/project/linux-media/patch/20240604105335.2257629-1-devarsht@ti.com/#158409
> 

I see Andy mentioned here [1] that math.h is orphaned and nobody behind it.
And I see changes in these files getting pulled in along with subsystem
specific changes [2].

So just wanted to check if it's possible to include math.h related patches too
directly in this PR itself since they were already reviewed/Acked and I guess
this be a simpler path since they need to be applied on top of current set of
patches in this PR.

So, Could you please let me know if it's possible to include all the 13
patches sent across [3] in this PR itself or some other path need to be taken
for math.h related patches?

[1]: https://lore.kernel.org/all/ZmHDWeuezCEgj20m@smile.fi.intel.com/
[2]:
https://lore.kernel.org/all/20230803131918.53727-1-andriy.shevchenko@linux.intel.com/T/#u
[3]: https://lore.kernel.org/all/20240604104001.2235082-1-devarsht@ti.com/

Regards
Devarsh

