Return-Path: <linux-media+bounces-1772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB513807A95
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763222824F2
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 21:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC66F70986;
	Wed,  6 Dec 2023 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fFTNT17y"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DFD98;
	Wed,  6 Dec 2023 13:37:48 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6LbVZN045079;
	Wed, 6 Dec 2023 15:37:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701898651;
	bh=IvKZvpYmCdZR4nsbxRooUpGtL1Pq2TlAhgyaL7KzBzg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fFTNT17yiR8zaS/oUeWnOwRrNx4gjdehIvlGeok2FhBqMDP7A22DOMKYyxjq+2Ed2
	 jwsPmTrKoByBGDioHySieJSt3xVrqFy+o8u2m9NZS5Y7ySPUJdXKNA1Q0AJxNEsLhm
	 4LJ57fR9zO+KqQ5R+1t9/LVqCy4X0SfEsn6GIA6g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6LbVIm075731
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 15:37:31 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 15:37:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 15:37:31 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6LbVTr092962;
	Wed, 6 Dec 2023 15:37:31 -0600
Date: Wed, 6 Dec 2023 15:37:31 -0600
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Remove K3 Family Prefix from
 Compatible
Message-ID: <20231206213731.swxamycv6yhvgss2@denial>
References: <20231206185254.1748473-1-b-brnich@ti.com>
 <20231206185254.1748473-2-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206185254.1748473-2-b-brnich@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 12:52-20231206, Brandon Brnich wrote:
> K3 family prefix is not included in other TI compatible strings. Remove 
> this prefix to keep naming convention consistent.
> 
> Fixes: de4b9f7e371a ("dt-bindings: media: wave5: add yaml devicetree bindings")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com/
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
> 
>  Bindings currently reside in linux-next, meaning that the ABI will not be
>  broken with the removal of K3 prefix. Important to get this merged in
>  prior to being moved to master so that K3 prefix does not need to be
>  permanately included.
> 
>  Documentation/devicetree/bindings/media/cnm,wave521c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> index 6d5569e77b7a..471840e858c9 100644
> --- a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> +++ b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> @@ -17,7 +17,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> -          - ti,k3-j721s2-wave521c
> +          - ti,j721s2-wave521c
>        - const: cnm,wave521c
>  
>    reg:
> -- 
> 2.34.1
> 

Reviewed-by: Nishanth Menon <nm@ti.com>
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

