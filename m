Return-Path: <linux-media+bounces-13929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5291248A
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 13:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3EE2832E2
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4B0173357;
	Fri, 21 Jun 2024 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uRJDSg3o"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4317278D;
	Fri, 21 Jun 2024 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970951; cv=none; b=SRLq6rR0vInalB5jPMQRWuI0OUuG1zJFoYB1k/V8zBD7WJkt+rlJUDbee4Nqe0dENyTZap4SaxQQchHC3XrL8HwV+HhcNH9f8ur15g7+WnAxpB10fKsDQwkMXdSxuQtXH12C8jiATvGHhZG9JiQA//d8QN70nq0/PyqmR+SRCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970951; c=relaxed/simple;
	bh=9EWTfhevVP6TT+S5MmRO88VX1lFmzRE/f5ndlAriqq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=of7VHU/HDHTxUEGZAjZFyI6mG5gGtir6arJknriVEafmTG50fCeLnJqmFGtzB3YOfOEimY1y/Dw9xIWD6+McIbp2QdLcPODT4z+ZDkFKWxN77jav9untDiaEnkB6zMreS+CdLZgj+8f/mpZDn24UrHVG9DQX0tqfNQSGM8mzUKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uRJDSg3o; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LBtR4H106155;
	Fri, 21 Jun 2024 06:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718970927;
	bh=N2ZE99Uz1VZASX7cXNMBkj1q/fbnzsz/c+sABmANsi8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uRJDSg3ooqlVPxSOB5UehIxqHLNJhOtMSgY2wD7JGPZWe1pma8rRWTlxa0+HZmWv2
	 rsxoRvW0WiYtVTypdsouue5yr7oNyQ6Dy29Jww2wcDZkwDDPteZ6Y1KzKlex6Wemie
	 fQ6xsnTDGyhHu/1s6IprjOTg2jiX2VTBiBWPXSNw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LBtRvu012474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 06:55:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 06:55:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 06:55:26 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LBtLXe023771;
	Fri, 21 Jun 2024 06:55:22 -0500
Message-ID: <98e52732-36fa-3e76-cd2c-fde9181bdeb7@ti.com>
Date: Fri, 21 Jun 2024 17:25:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Content-Language: en-US
To: "jackson.lee" <jackson.lee@chipsnmedia.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        "lafley.kim" <lafley.kim@chipsnmedia.com>,
        "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
        Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Aradhya <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
 <SE1P216MB13033A129DF3DF878ECD4F85EDC92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <SE1P216MB13033A129DF3DF878ECD4F85EDC92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jackson,

On 21/06/24 06:00, jackson.lee wrote:
> Hi Nicolas / Devarsh
> 
> 
> There are lots of mail thread in the loop, I have confusion.
> I'd like to make check-up list for the "Support runtime suspend/resume" patch.
> 
> 1. Profiling resume latency
> 2. after that, adjusting the time.
> 

Beyond above two points,

3. I think this patchset also breaks hrtimer polling and so the VPU operation
on AM62A which completely relies on polling, you can test with removing the
interrupt property from your dts file before/after this patch-set. With the
polling it needs to be taken care that polling is started only after device is
on power-on state and is stopped before device gets suspended.

4. There is some discussion going on between me and Nicholas on whether
delayed suspend is really required after last instance close or not. My
thought was that we should suspend immediately after last instance close, but
Nicolas mentioned some concerns w.r.t use-cases such as gapless playback so I
am following up with him.

Regards
Devarsh

