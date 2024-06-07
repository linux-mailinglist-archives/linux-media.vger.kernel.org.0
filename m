Return-Path: <linux-media+bounces-12749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7890053C
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA71F2829F9
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA913194A42;
	Fri,  7 Jun 2024 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fRcEbCtO"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB035187354;
	Fri,  7 Jun 2024 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767753; cv=none; b=JVbXDmXPvo8OkPvIz7CVljXZJ6reT6DrGGozy2WcTQWRv9Ew73w7ha4RykLXy89hGl+yeRTCRYdT+wLp66RqtVX2/gQQNVLEosWu7xz27nU6xhacDB3EOv+D08B7Lk2f2e8Cq3S4NSbWLC7AzRpFpEDLfVr9Gcm5Tw+0QTYAiS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767753; c=relaxed/simple;
	bh=REmr8gRL5fCzI1CnEPiyzHJinuYDDoFR05g1kfvGDeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dS3Krr+vfUebVz8hv+N6j+gMc2yuoBwlNgCC7tWbRiB9DNGYU37EJyZJpFCeivuiQjW3iiuA9Qm+H0TRF8wfX5mnCdG9V5YAHSjfnEE1p47hhv+41ZduSiMAZqDNwoTVTL+bRc/dUVd0VuiuqOjJOPZzcH4kcupcXMM09IGYhac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fRcEbCtO; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DgMct123662;
	Fri, 7 Jun 2024 08:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717767742;
	bh=CvDrkn7chnYdqDbadf2hCMD/PyrckQqI/zXquTAVr9U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fRcEbCtOseL3XLb0DULaAWbd+KPEjwSpO78Abd5H67EqSmm4su7XrT5mBUYmxolcK
	 OVeHeoprB5caZ2rvoaWqxjsxWILiCdi+oJJsVBdfOIFuGd6/LAlLWAhp1XAFFXt/c/
	 iLtQ4Ah5jmMFgqzKmh/3kbqUQ+8kIJLIrV+B9Ruo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DgM15077238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:42:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:42:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:42:22 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DgFSD002578;
	Fri, 7 Jun 2024 08:42:16 -0500
Message-ID: <10ccfd56-eef6-4b13-ea89-d0df1c432d40@ti.com>
Date: Fri, 7 Jun 2024 19:12:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 02/13] media: imagination: Add E5010 JPEG Encoder
 driver
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
References: <20240604104001.2235082-1-devarsht@ti.com>
 <20240604104729.2247253-1-devarsht@ti.com>
 <20240606154234.xfrgi3un667qcjqq@basti-XPS-13-9310>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240606154234.xfrgi3un667qcjqq@basti-XPS-13-9310>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Sebastian,

On 06/06/24 21:12, Sebastian Fricke wrote:
> Hey Devarsh,
> 
> please see below a warning that I found.
> 
> Otherwise I think the patches are ready, so if you can just send a quick
> fix for that, then I can send the pull requests.
> 
[...]

>> +
>> +static void e5010_stop_streaming(struct vb2_queue *q)
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(q);
>> +    struct e5010_q_data *queue;
> 
> drivers/media/platform/imagination/e5010-jpeg-enc.c: In function
> ‘e5010_stop_streaming’:
> drivers/media/platform/imagination/e5010-jpeg-enc.c:1331:30: warning: variable
> ‘queue’ set but not used [-Wunused-but-set-variable]
>  1331 |         struct e5010_q_data *queue;
>       |                              ^~~~~
> drivers/media/platform/imagination/e5010-jpeg-enc.c:1331:30: warning: variable
> ‘queue’ set but not used [-Wunused-but-set-variable]
> 
> Regards,
> Sebastian
> 

Thanks for sharing this.
I have fixed above (and other reported) warnings in V13 series [1]. I have
also shared the delta w.r.t previous series here [2].
Kindly let me know if it looks okay to pull in now or any other comments.

[1]: https://lore.kernel.org/all/20240607131900.3535250-1-devarsht@ti.com/
[2]: https://gist.github.com/devarsht/0bd2e90b7352ed4831252a7962fff65d

Regards
Devarsh

