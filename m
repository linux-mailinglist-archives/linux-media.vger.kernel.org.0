Return-Path: <linux-media+bounces-13695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DA90EBC2
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D301C23EE8
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F261F145B31;
	Wed, 19 Jun 2024 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wVNgBQbO"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917C4C74;
	Wed, 19 Jun 2024 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802031; cv=none; b=q7OLLJJkIU+rSQvyRSub+yqRkYW9+tToZEXjvWy8JjzjSPopLb6Alv3GvHSUdEPaxwoI5JP5+DQIu7kxnnGp8cZFeelidl1d7eek04D+QNrSeHQHxuaeow5KYAz8YDScBqjdfZUJT/pxbG+SYFTsEdW1PJ29UYDl4HBpDrSyYCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802031; c=relaxed/simple;
	bh=ZML/omZPOzO6XxV1ymhvnEzUu9ZJCda0d53e3et/c5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GZ54HLZXc/n/YbV96kCfkXocsTJkzu+NGX/umB8jASG5KlYDVsP6rXMVG7F+e6du3rQyxn4xswpe9GbV87mU9gSq3b6K4RGdNeIoAP+q5SqjsPW2aTmF7uZUBrViocdcOoKG/rbZSaLtfmZ5KvbbORhnsOBNkM2H4NYrPTPhRbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wVNgBQbO; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JD0Cri121258;
	Wed, 19 Jun 2024 08:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718802012;
	bh=CtL3hdspEWnH/ANp92A35C0CEx6xIW0omb+hsSqOJLs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wVNgBQbOvcFRWclb+rmfnL0ZULNTaX/9OmqHw4Zz/ffP6Rxx/qI9Tv+9LA48A47gA
	 luMEnrV6d/IeODBxFg3IrvyiqIjMfS5niYzC6NZyNO+Vp4YEIWmk5qAixAUuNDz6wY
	 9e6gHuuBVgFgvDVJsJXmE7xUL7IX86Nk1qrR3dTY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JD0Civ041085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jun 2024 08:00:12 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 08:00:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 08:00:12 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JD08GW125241;
	Wed, 19 Jun 2024 08:00:09 -0500
Message-ID: <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
Date: Wed, 19 Jun 2024 18:30:07 +0530
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
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
        <nicolas@ndufresne.ca>, <sebastian.fricke@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <hverkuil@xs4all.nl>, <nas.chung@chipsnmedia.com>,
        <lafley.kim@chipsnmedia.com>, <b-brnich@ti.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240617104818.221-3-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jackson,

Thanks for the patch.
On 17/06/24 16:18, Jackson.lee wrote:
> From: "jackson.lee" <jackson.lee@chipsnmedia.com>
> 
> Add support for runtime suspend/resume in the encoder and decoder. This is
> achieved by saving the VPU state and powering it off while the VPU idle.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

[..]
>  static int wave5_vpu_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -268,6 +301,12 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
>  	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
>  	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);

Why are we putting 5s delay for autosuspend ? Without using auto-suspend delay
too, we can directly go to suspended state when last instance is closed and
resume back when first instance is open.

I don't think having an autosuspend delay (especially of 5s) bodes well with
low power-centric devices such as AM62A where we would prefer to go to suspend
state as soon as possible when the last instance is closed.

Also apologies for the delay in review, this didn't caught my eye earlier as
commit message did not mention it either.

Regards
Devarsh

