Return-Path: <linux-media+bounces-13933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A956F9125EE
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F1C1C21B29
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8C815DBA1;
	Fri, 21 Jun 2024 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Depd7Ivb"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B788D15D5C9;
	Fri, 21 Jun 2024 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973879; cv=none; b=TmHKMYYI0f04MOpAihwOuBo3EJ0nPqdtfHceXIhBlb/x5SjWgrO+GBAqqHoPZ0gg2RPXs0VzwXnRk/6PfUFnSu2a9oyu4Cp+pcr+Bt31kdfCy2duM5TTyi6wiN9oXOKjHLe6652FJbyZUhvi5/0Dp3N2tbUN/C6Pz2Br5Zv6oV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973879; c=relaxed/simple;
	bh=4disZLx9gKDKUUazkD/gKoYEP6ecgmkrNj9i5jO7sJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pJB+TRaSZDnaiwLY7K7b3nDxRHj8Np7KWLUd7F0DhPoADGGRtsUKxksWDjfUcX+obwH7oQasOU3qxcqM8+6CFO4xvX4lEadURlKNZjS6JiE1C/0j6xBtsqhzyth8ZOGHu/jZpSlv5sgp9rxNww8gTdCstNWorp/N22Zmdxebv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Depd7Ivb; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LCiNRo043480;
	Fri, 21 Jun 2024 07:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718973863;
	bh=Jh2gGIgiK54xCiQ7E9NcsKRUuNvsvP4Zw6O2vyFH2Ls=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Depd7IvbhLujjaPt7z6/ykXyHnmllcrTP7ato+QP+pKE07qqUjA9nsGr2BA8R5JRV
	 9XH5WENweoDT4ePMVXss0olFLGmya0SUNvgBMi8mf+pL10oE1PJrqCuvvLrIKELHe2
	 iX21K4xnlVHQf0m/KQ8zPLyfulqi0r082Xcj03hg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LCiNoG008737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 07:44:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 07:44:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 07:44:23 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LCiGwf097047;
	Fri, 21 Jun 2024 07:44:17 -0500
Message-ID: <8dda9d0c-3154-a7fd-1233-ca5be59639de@ti.com>
Date: Fri, 21 Jun 2024 18:14:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 2/6] media: imagination: Add E5010 JPEG Encoder driver
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
        <benjamin.gaignard@collabora.com>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <afd@ti.com>
References: <20240618193651.2771478-1-devarsht@ti.com>
 <20240618193651.2771478-3-devarsht@ti.com>
 <20240621123715.enqtdqxskdkod5ze@basti-XPS-13-9310>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240621123715.enqtdqxskdkod5ze@basti-XPS-13-9310>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Sebastian

On 21/06/24 18:07, Sebastian Fricke wrote:
> Hey Devarsh,
> 
> This doesn't compile without errors for me, curious, it probably did
> compile without problems for you right?
> 
> drivers/media/platform/imagination/e5010-jpeg-enc.c:1622:19: error:
> initialization of ‘int (*)(struct platform_device *)’ from incompatible
> pointer type ‘void (*)(struct platform_device *)’
> [-Werror=incompatible-pointer-types]
>  1622 |         .remove = e5010_remove,
>       |                   ^~~~~~~~~~~~
> drivers/media/platform/imagination/e5010-jpeg-enc.c:1622:19: note: (near
> initialization for ‘e5010_driver.remove’)
> cc1: some warnings being treated as errors
> 

Yes I think it did compile fine for me.
Did you try this on tip of linux-next ?

As mentioned in changelog, there was update in platform driver for return type
of remove function which got changed to void return type. Please check if you
have this patch [1] in your tree which got recently merged.

Kindly let me know if you still face any issues.

[1]:
https://lore.kernel.org/all/20240527083416.1177106-2-u.kleine-koenig@pengutronix.de/

Regards
Devarsh

