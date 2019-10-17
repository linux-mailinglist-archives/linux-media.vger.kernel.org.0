Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F28DA52D
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 07:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394225AbfJQFnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 01:43:32 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:12320 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731603AbfJQFnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 01:43:32 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9H5fC25008085;
        Thu, 17 Oct 2019 07:43:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=p/09wq1PSfYWS92X0S6/XOyJP24Y6whlcb1O9OKmBdU=;
 b=dXj8TVEYxlk2drKDKCEXJ+ewUYFx0mWN2Z/kG3vHixT7mjvvht8Lxa4qO4monsFFbG+E
 t37RQEWR242vxPbfsTvqhFlBGxuFwcHjnGCWO5dlwYe0X7erjdWXUpONUgU0OSMpQbK8
 7RS8lTxxK8rXDtp/xpz6xUZReTsDLhUJ8PRjH/ZZt/uzceUgJeWTvsUtgv/p1dgDe32+
 F/c5mOuR/EsLbSjygQwHiCUrhAk1QXbs8B/KKUP0zVAiTEey/m/lw7Yktrwa3HwK/FRV
 coISWEgSUUF6pMyDCRIJR9QXeRyEwHV/65sne7d4yZLeFllX3ITrk5Ie1YFrJIFSIK8X 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vk4a1ht4j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Oct 2019 07:43:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCEF1100038;
        Thu, 17 Oct 2019 07:43:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C26B02A44A0;
        Thu, 17 Oct 2019 07:43:24 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Oct
 2019 07:43:24 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 17 Oct 2019 07:43:24 +0200
From:   Mickael GUENE <mickael.guene@st.com>
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: st-mipid02: add a check for
 devm_gpiod_get_optional
Thread-Topic: [PATCH] media: st-mipid02: add a check for
 devm_gpiod_get_optional
Thread-Index: AQHVhBBYvH4VqO4jG0ud7QMMFFTos6deMe0A
Date:   Thu, 17 Oct 2019 05:43:24 +0000
Message-ID: <8de93390-ae04-4278-bb34-aa175c659c23@st.com>
References: <20191016105604.8036-1-hslester96@gmail.com>
In-Reply-To: <20191016105604.8036-1-hslester96@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <A4E988153FB2A14DB32FDD3556453D02@st.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_02:2019-10-17,2019-10-17 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Chuhong,

 Is this check necessary ?
since looking into code it seems to me devm_gpiod_get_optional() can only
return NULL in case of error due to following check in devm_gpiod_get_index=
_optional()
	if (IS_ERR(desc)) {
		if (PTR_ERR(desc) =3D=3D -ENOENT)
			return NULL;
	}
 And in that case reset_gpio is not used

Regards
Mickael

On 10/16/19 12:56, Chuhong Yuan wrote:
> mipid02_probe misses a check for devm_gpiod_get_optional and may miss
> the failure.
> Add a check to fix the problem.
>=20
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/media/i2c/st-mipid02.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid0=
2.c
> index 81285b8d5cfb..d38e888b0a43 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -971,6 +971,9 @@ static int mipid02_probe(struct i2c_client *client)
>  	bridge->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
>  						     GPIOD_OUT_HIGH);
> =20
> +	if (IS_ERR(bridge->reset_gpio))
> +		return PTR_ERR(bridge->reset_gpio);
> +
>  	ret =3D mipid02_get_regulators(bridge);
>  	if (ret) {
>  		dev_err(dev, "failed to get regulators %d", ret);
> =
