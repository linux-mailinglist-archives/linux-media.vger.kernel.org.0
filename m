Return-Path: <linux-media+bounces-2250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C92880EFA4
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 16:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F4E281490
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 15:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E42745FF;
	Tue, 12 Dec 2023 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qq/6QFBI"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAECAEA;
	Tue, 12 Dec 2023 07:07:07 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BCF6qhH107908;
	Tue, 12 Dec 2023 09:06:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702393612;
	bh=Me9oORsxMQopPTecPbF4yvuVAtNhCNVx6k/ba0DvjgI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qq/6QFBIIqtHVx9grsfxeHMz8di6Q3bi/lyF8yrp/GLz5BlB7vGkbVwmz1FQt300G
	 qLLta5lEa9z6rtjsLsXfdDdeEmpRO2+hki8PZHdyoH6SC9zZiWi7zsJdct+asX2Zkb
	 UpUAdzWZFRBZG6DwTy89A18VVF/WNsMTipzVunGs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BCF6qs0011032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Dec 2023 09:06:52 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Dec 2023 09:06:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Dec 2023 09:06:52 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BCF6qWV103574;
	Tue, 12 Dec 2023 09:06:52 -0600
Date: Tue, 12 Dec 2023 09:06:52 -0600
From: Nishanth Menon <nm@ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nas
 Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Dafna Hirschfeld
	<dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v3 2/2] media: chips-media: wave5: Remove K3 References
Message-ID: <20231212150652.54exlr52x2odqxr5@false>
References: <20231211205920.698939-1-b-brnich@ti.com>
 <20231211205920.698939-3-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231211205920.698939-3-b-brnich@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 14:59-20231211, Brandon Brnich wrote:
> Change compatible string to match dt bindings for TI devices. K3 family
> prefix should not be included as it deviates from naming convention.
> 
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com/
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index bfe4caa79cc9..0d90b5820bef 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -272,7 +272,7 @@ static const struct wave5_match_data ti_wave521c_data = {
>  };
>  
>  static const struct of_device_id wave5_dt_ids[] = {
> -	{ .compatible = "ti,k3-j721s2-wave521c", .data = &ti_wave521c_data },
> +	{ .compatible = "ti,j721s2-wave521c", .data = &ti_wave521c_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, wave5_dt_ids);
> -- 
> 2.34.1
> 
Reviewed-by: Nishanth Menon <nm@ti.com>
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

