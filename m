Return-Path: <linux-media+bounces-11755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5B38CCA79
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 03:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 670E61F21E56
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 01:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA81D4690;
	Thu, 23 May 2024 01:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="KemuNqjF"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD5A34;
	Thu, 23 May 2024 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716428920; cv=fail; b=FlnkzWxsuiJxczpp1CNUBlWfCz+b9hK4dBxGqYR+1sTSSv4/MWYsRhzf4aatOFAOYlVJNnIP6Phz/4BpN6/zG9q1DrfII+J421vJoD6TmXk/6Xh5rpxz22p0rLJ7K3VRHQU96AZ5nobajEFGcE3+HjD8bRcKKLbvRciAFs0Zaoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716428920; c=relaxed/simple;
	bh=oHFwQD8PyhHhgm8vBlat0Wo+6EZ8MOGJ3JfX+XVvje0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nKQ/Ge6T1adPBrhvI9FCexDBfGHX0HebOE2Qhz3q7nc+451wo5VZ/M1w2hFe2uuFyO2uTSJnv0YyUgYX+ztrv3/v1QXzpkEbDywfAZS6Jg5BSknKgJ73ihB0s+geKK1REQRqFqVODonoOkymNKP6HoWqxeISaZsWwhTeQREph6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=KemuNqjF; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzXEhdsxzvjhkyK4fBoZ7FnKfPk2G8dqyuu4KXRpbK1w+Kw9jYSXjWwY1NaP8dovO9UNNUMSi2L52AmVuULleH81yYwhw/Dsyk5PtQG1ve6rYvT9ew6w9biSqnboDWYLMhzZA1SO1azpvwpfRZXd1m+RugTKFMnIX+hrAIbwTOjtoylnZEXq8VHcmyitWuTruP7wPkWog9WCXovKb7UeB75op0reaf4L4qlTBoTw65/knOPKnXFR+HdLWHbhYLuZITDHAQRrkdvWdZdvl9VwCTCVwbUGupnuzRJ8AoVfq1+cn8tSj6HRuXMaDh7wB14elut16cbrFM7Xb4+HUTlQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6sj+PUVqgxLlk55bG64X6t7Xhod5z0F9VktPbwk0xY=;
 b=DVM/IAZne5XrGV/EMlAABNHaAV7/mvCt+HRq/HLyAUiQt/jhHBEje+6WyiPQC+74voCSAK6VKbruCp/BbGANH++ChQMW17SIvjGYYOKdXAMXhY9j9Sn1O77u3LCfw68nFUdyrFbnGCtzvakuZaIg4ES5Njds9ngt5X9W3OGlgMWahOjA4iJEMctvwwuK8SREwT3j7Skh/DbLQEMJH5HY7rIY7BpKFlofrRvejqPJb19jl9al5eZJY3pbv1Zget/Ybt2Co48m3l9Ucknqzac+50tWm96m1xmSxyIgVZgOOssRTg2SAsL6Vu1vQ3ls3xwyrTu5FCC7OQ/QdjsHl2iXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6sj+PUVqgxLlk55bG64X6t7Xhod5z0F9VktPbwk0xY=;
 b=KemuNqjFj0HEvzxi5a5x00sqbN8Y02lDSOrISsOlbLUNGgQgHd0aHQygVusEaOZb/DTY+moIc4hRHQjBEsNRPs0/2sMvDHTeGd6Xng1I96B6Jij5E8ufs6JVFsBdGdMLkl0+AIqOHefC9Ae2zGVIJo769aW2cVuirlM4EQ58SUY=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB2190.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Thu, 23 May 2024 01:48:35 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 01:48:34 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Michael Tretter <m.tretter@pengutronix.de>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Sebastian Fricke
	<sebastian.fricke@collabora.com>
Subject: RE: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Thread-Topic: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Thread-Index: AQHaqD+OBWQuNlhl8EqlSzXRSkJlr7Gi6hIAgAEnynA=
Date: Thu, 23 May 2024 01:48:34 +0000
Message-ID:
 <SL2P216MB12467C08314BA4B314A8EED6FBF42@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240517094940.1169-1-nas.chung@chipsnmedia.com>
 <Zk2kunIzL0ylxHiH@pengutronix.de>
In-Reply-To: <Zk2kunIzL0ylxHiH@pengutronix.de>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB2190:EE_
x-ms-office365-filtering-correlation-id: d6d1e5b2-ff66-474f-cdbe-08dc7aca7542
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rks6WF4lBaWtfPYyyYleB17snovh7ScaKk7guBkXFuzpaF/Q8nb8Jf+7jXLZ?=
 =?us-ascii?Q?CyDSNe0qwTUBxCM2cnsN+Wdnn8/l5pJYKo/ZNGPt3GKX9HJPSTE/I4aGbC/B?=
 =?us-ascii?Q?55J23lwA2ia/EMYhv7cnQlxXFMRCsdVWjuamE89TUcuOWvFQ013Zef1kI+Te?=
 =?us-ascii?Q?QWya62P/96dZZPJV7YIuY1knylXhaKl/fjp28ZKjXgKKM72DPtUAMcTXEw0g?=
 =?us-ascii?Q?UVhA+fLxRYdstmehDuQZD1lHJmn4jrCt0ekjCSscUeKa3dI629CbEs9U9Ldv?=
 =?us-ascii?Q?CS6mmAQ2+ueAmDMWjSn/6LjcKQ3oxrFhOJJg4h8YeWrPVNt1HCsp8lHwm/fw?=
 =?us-ascii?Q?eo8n0BqbtZTMN5tlWbj5lL4DYkMxXh93i+s2ZXeHB7gxzRJ7bADQJW2AL0Ky?=
 =?us-ascii?Q?wzbW6q4d1n+bysFd6Zz/qIYE035pdPuaX9oyemL4ZILzIhyRbga5AAPDT5dr?=
 =?us-ascii?Q?mdAYhXMNoou/tjpbN132OiXSgPh+l/NIwL5NMsJS1ciLR1JjesHtP3aqXH2k?=
 =?us-ascii?Q?aaChnkmqzeoONyoEaGisgUxbnYoFYBxJojH0IWYmmr7/a4hMpmydFZagAPGT?=
 =?us-ascii?Q?eHE5WBIh9whh7Fplucn/z8qVhgEU5MDwsxJlMaF4ICmWXgZcIjdbEBDmZ56c?=
 =?us-ascii?Q?D4to9cWhOvuEiniYLu/hdkzWqlNuq9/sIz30GT4vdRT6m2/M0jYROBDAsoA2?=
 =?us-ascii?Q?5XMhG75/f0Lh4ohHEHoJUYpwg4vyW93YI1McYjf4C7CZGkcBdlK2WNjkh28C?=
 =?us-ascii?Q?WOcHbX4M3/0ElAKF26Arh9KHZZY+3HtzJ0NgWlBvo+VatZxms3uYr6nrL3UP?=
 =?us-ascii?Q?j4R+wC4bsh2TMu9TgROqy/9yK5sqK/dFsSIqyry5o8OvsKF+E6Pfnw1axrlj?=
 =?us-ascii?Q?GYh3LaBLvj6NH8zvLkcGNeXl+FyLaXxkJZ7Zf9q2l4OoD3g0SfSI/AcAVxwv?=
 =?us-ascii?Q?YKEVuUlaXBw2U6tAZSY2txTsytjCXY3IKDtmNOomlfXJi6rUbjU5SuEDOWTH?=
 =?us-ascii?Q?0mQ4ip5x8485kdDfHDA8FJ9mI4zh39+dhL4pe8qhrVKgNBvThONJKSTiftTV?=
 =?us-ascii?Q?peo8/ooK54Ia1C438H5quMFURYgGJwOnofZzqB/0Oida4YlgkJhIasaIcEe6?=
 =?us-ascii?Q?JYd8sfLLjrHKd8K2owxQE5L2GP3UzCZz6n9WCALvGu9Fbvk5f54zy4YOYenc?=
 =?us-ascii?Q?/fpVOImt1Z5BbNuKM+MMZBZNtJba9MDhlAOpg6tRXRgdO7yIZKovFeqviYgc?=
 =?us-ascii?Q?rR7l5kEcG54Z2lYorOXYVIWY+2WSoIll3oIEbzpvNkDbskrWRR1R9VxuIgIY?=
 =?us-ascii?Q?vt3RPIRC7nkTLra4oXUqTAsjbfGOKi+WvwtG04WqFoDBWg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?s5Z5zK76voRgwtR1Cxs7Vek2RkvBzcmut7unzVCYLZ1ErV5e5beRJ9yOjpbF?=
 =?us-ascii?Q?TDkIppRqpGlnO+wSyb3pF/0uOb4oR/CWBBoIwSeYIqOOMXDthmwAU8/eyyeL?=
 =?us-ascii?Q?i/C4N4eoggOAVpwhY1qhllTcnF2yeX2h6QS/S+UogQNkk/T5g4isEspOAhjM?=
 =?us-ascii?Q?gmoQh23biTLAMUVzjdmly7nyXkpyPCu0e4wWyC3Jn+oeyWXxVd0UP0d/a+WQ?=
 =?us-ascii?Q?pj/Zg6RIbPJPkFaTLKxv6TTdNWnBO7ArqrEOHkErk4C4JRHrE+d2i9IZk5xK?=
 =?us-ascii?Q?z58HuxDTjLjLuaWTWCfG56ypycNCrF20omAPH2uMo0UiUcWJDcflVueVl1CQ?=
 =?us-ascii?Q?92Et/yBFheutShkaDkxpDPjJYV68X37okQ2kVMotFl+B/8707+8xK8qu9bnB?=
 =?us-ascii?Q?peVSdqVYinRhVoLskwvfX/+PiKVlevMgxVFXHcjA5r72rEVT6PZcy/7PuVHF?=
 =?us-ascii?Q?8jHfaGZUbcAQaPKFuM4H8HefLJN37AXGsJHwIA4h7g74JBcPCZOc6W05erMR?=
 =?us-ascii?Q?x1s8JZ7P5XEJ3FooClq/ws6646O1pGxyKIYW5csjSy34jABOMXD/kZKhihR9?=
 =?us-ascii?Q?ca1SoQfT21mWokk49cD5PSWe4DVtYFDsSu1XBA4S/rkVeilwMtQW5itrcfdI?=
 =?us-ascii?Q?UOu8NYxLg0NkArIU8fQgHRYs6RQkV6FAHdfc3R/npIhczuF9iybepCF4XNBk?=
 =?us-ascii?Q?0YpN7RYNsRiMpxWYzit1R5Rff+FhaekN0k/AToQiym5nX7lirDxPrDXHHBy3?=
 =?us-ascii?Q?KBhtOrv3kBL00V1YD4ERd3ElY7gJl09UoelKzpGSkjFrmA67lPEOve92/QJP?=
 =?us-ascii?Q?MW7MHqw7HM1m1VMkAJLJ08QetwQObBMGXXa1Y3FEfwg0IHgrwGxI24bcyxJn?=
 =?us-ascii?Q?19kgv0RKWzJdRyfYDjnYbBjps5d3Z6WRTy0IrOLhJhtFEwaHYuBAPND59KmT?=
 =?us-ascii?Q?KgNRODZP4GPC1YOT1TmhGObRPEyqNGmXKOKez8OIkxL6WY75MWoRiV2vRc/s?=
 =?us-ascii?Q?bQ/vNC/g0wmRzqlQY594q8KzeDphLmjVyGpCh94q3T9WZyvfS3ijniykRLO9?=
 =?us-ascii?Q?sczd7VydmNu1mRgV3En1W0jiJIO+LYHdw/L9r9zbmE94rNwYZ3J7yHkmPgXi?=
 =?us-ascii?Q?8uaU56ENjNWrw9r7U4XdmMPnVPOIzCe4dArKO+gxu8qGs1lCx1qRjQy7iR9O?=
 =?us-ascii?Q?dtsIInYTu8DniIz1oluNzrcqqSu4NIAK92ihU9X4JPyo+VZ1ckYwJpLCaPVq?=
 =?us-ascii?Q?S+j/q/6llATqAzujpftzLiI1/iaScoWVTdzqjmQ/KYEj0ByJPCayk1z2dwei?=
 =?us-ascii?Q?lAdRppKzJ4mbvXJPcGA7p51O3PcEsrNH5LzHpKyh9G8BS9IzQcivpz+/a8Ze?=
 =?us-ascii?Q?6LIyLkUlwZ5aHAGraaHU55EmchBF5siNWx9BkSexPTjMpWdRGfMAhBn3hjIR?=
 =?us-ascii?Q?EFMs1O6Zd8rpTvhKwNGHOvENjWsaaSgwc54QmgVA7FrH7qKVcsVd5Z2XZLaX?=
 =?us-ascii?Q?KEq+8qA0SDb+QIXxnMbMiAmfxUyOT49niq5bjNi2mBoP946lz07frmwEauQ2?=
 =?us-ascii?Q?rOnNeRYqMe23jmXKxGSbHMYOdIJbUYunq2vN05fY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d1e5b2-ff66-474f-cdbe-08dc7aca7542
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 01:48:34.8700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3R+eKDRojeCJTnDHRB98Q7vzHZ5PRNQuALNp5JniCrmD3KRidRk73a+5md8N0LfDCSJ4J3TyRBex70WXJiCz1T26byljfebuZqgf0P1GNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2190

Hi, Michael.

Thank you for the feedback.

>-----Original Message-----
>From: Michael Tretter <m.tretter@pengutronix.de>
>Sent: Wednesday, May 22, 2024 4:55 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; linux-media@vger.kernel.org; linux-
>kernel@vger.kernel.org; Sebastian Fricke <sebastian.fricke@collabora.com>
>Subject: Re: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
>condition
>
>On Fri, 17 May 2024 18:49:40 +0900, Nas Chung wrote:
>> We expect V4L2_TYPE_IS_CAPTURE() macro allow only CAPTURE type.
>> But, Inverting OUTPUT type can allow undefined v4l2_buf_type.
>> Check CAPTURE type directly instead of inverting OUTPUT type.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  include/uapi/linux/videodev2.h | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/videodev2.h
>b/include/uapi/linux/videodev2.h
>> index fe6b67e83751..32b10e2b7695 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -171,7 +171,13 @@ enum v4l2_buf_type {
>>  	 || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT			\
>>  	 || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
>>
>> -#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>> +#define V4L2_TYPE_IS_CAPTURE(type)				\
>> +	((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE			\
>> +	 || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
>> +	 || (type) =3D=3D V4L2_BUF_TYPE_VBI_CAPTURE			\
>> +	 || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_CAPTURE		\
>> +	 || (type) =3D=3D V4L2_BUF_TYPE_SDR_CAPTURE			\
>> +	 || (type) =3D=3D V4L2_BUF_TYPE_META_CAPTURE)
>
>Maybe adding a V4L2_TYPE_IS_VALID(type) macro would be helpful to define
>TYPE_IS_CAPTURE as all valid types that are not OUTPUT:
>
>	#define V4L2_TYPE_IS_VALID(type) \
>		((type) >=3D V4L2_BUF_TYPE_VIDEO_CAPTURE \
>		&& (type) <=3D V4L2_BUF_TYPE_META_OUTPUT)
>
>	#define V4L2_TYPE_IS_CAPTURE(type) \
>		(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>
>This would avoid keeping the two explicit lists of OUTPUT and CAPTURE
>types.

I agree that it's better to add a V4L2_TYPE_IS_VALID(type) macro.
I will address this in V2.

Thanks.
Nas.

>
>Michael
>
>>
>>  enum v4l2_tuner_type {
>>  	V4L2_TUNER_RADIO	     =3D 1,
>> --
>> 2.25.1
>>
>>
>>

