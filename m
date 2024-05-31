Return-Path: <linux-media+bounces-12316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1261D8D5B22
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 09:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33CCB1C229D9
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 07:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CBF80C0B;
	Fri, 31 May 2024 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="IHwhBX07"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952817E9;
	Fri, 31 May 2024 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717139045; cv=fail; b=EMYEWYBdMe3k03bC+r1NUxS0SqDB1X1ss1h4mmBPiLLy+H7tIHEbZr9VTlHlcH/OmRS/yqV/U6aMQf2ehjdljXxTKjALCjY+FTIPmBWbxoXysgtTQ7C4cscr/yi1UPwdGIa+daS700ZVKlX7WQI1L628dKxitEM7in+uetg8tfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717139045; c=relaxed/simple;
	bh=Pj/Rv0YmPZS3FLJWNN+YfWGj/2VU+PEAqaNqhwOPsj0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c9PhzrVpJ7BHwtxJhwY8PEEbcn86W9t2zpww0xbK6azgN9x/83KfJEFtiD9o+jEzWiBSCYMzo6/Wm0lQkhx9qnlXzBIbBdJv3II4BfOA30XFNrEdeVzL+MbW890fHlVIPY7/WI276Yypyu16Pz+rRN1CQSlmL98xM/tFbE8XV18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=IHwhBX07; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnsrQJ1+uON1KlFyElZL2y4MyPRxqI59ofk7VucsjDTEkBSaxDkVCv8iS7HifaYWOk1jsvbkqL6tWb6+snd+dbSPzmi3WxdXYlxogxTFFqfpo/hbTWl/rEw+6ZOIVqJ0/wUj7RQ53/X88G7KGOqiWf30w2hJchPHJL8IvaYGaPc9S2l1EL8a6tJvhUHFVLc4DuPgqO9LsEy91Keg72jNW1y88Z7EUIP9Al8gU/8Yc26X6H6tiqr7Bf7jJctRTSycwwTjnIKx+aTTDhNn5R0P3JoK3uuAHQekOEecgGb5xElH4BGlKyirPJfPLnMKptWNjf0PFdOG+yKQ+wd0YOVxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNQy3suFKtXjzuj2AjddjuohYBkIdaMV8v0cpMid+fs=;
 b=dqmcuHnDL56NyZcwvoRQYMGwAw+c8ssPa4BC79vg5+s+1hl+TKfLHhYtyLnceTAkk2/NZVOkQdzl6I4DHAgMdl6648gqrCpqCbrKu68WtWb5V9TPRSNvELt3mx4hsnS/n+G2IzHuEQCnixp7HvK+xMRkXf2Rv7UdnnahVVzgJ/b/U1Ig82HsFP7SF51h57AHlAD6SgVVtysBWQs5gEXYj7iwWdEwua6xNe+QHFpJVsxmHIWpqroyARxSj40jr47iEIBWE+WrbhqfImmPlueAF/i60Ox1P2zP/prWa/8gf9jq01qououtk72QlAAcHLzyyP6FPtSi+CgFWNcB2daRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNQy3suFKtXjzuj2AjddjuohYBkIdaMV8v0cpMid+fs=;
 b=IHwhBX07/2b3H2bId3e0Z3/A8eeAnOYrbSvlXUk7+ioXBMhTvQKBVHN0gVFTAPqlpwK/ghmsmrhPcT3f9UeXjBPFGkdf94j7sjjN3vTXeeVciB+nbKyagKzbri5vGkFr2+GQZenyjXeIAq3glsrq2wanWoGhPeDOnZ+7hcaRlwo=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB2194.KORP216.PROD.OUTLOOK.COM (2603:1096:101:151::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.23; Fri, 31 May 2024 07:03:59 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 07:03:59 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "m.tretter@pengutronix.de"
	<m.tretter@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Thread-Topic: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Thread-Index: AQHasKNiVaRy5Vo9MECtK40uBvrWg7Gvl+2AgAFTcaA=
Date: Fri, 31 May 2024 07:03:59 +0000
Message-ID:
 <SL2P216MB1246D6779BDDA2C03333D549FBFC2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
 <a962e94f-a669-40e1-8b28-9ef077cf69be@xs4all.nl>
In-Reply-To: <a962e94f-a669-40e1-8b28-9ef077cf69be@xs4all.nl>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB2194:EE_
x-ms-office365-filtering-correlation-id: 56bf93ce-73c0-4c0c-93c6-08dc813fd8a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?v8UgKICNYMGhtSfJFZaS3iaJ6LKu5zYvnFEMh6nrAQfAGotJV7h+ssL532u8?=
 =?us-ascii?Q?fKCJdgSRTojtDpNIKIW4d/7rzN+4sO4Ra0/uXqwLsQyD4MkW5X2zCgCHVIWx?=
 =?us-ascii?Q?xesZqCPxNZ345S1MKUBUb71g37M85DdOYGoID/JzTcv81zbSZ7UjyBWa5si2?=
 =?us-ascii?Q?NakAirazQgHPKnL7t6d83T6w+GAGicJRL3kG0saRr6n6apoV+qbxs3tlj+CH?=
 =?us-ascii?Q?n2ToNOVqe0m8xq7xhz0AShZSaCAWm9i6/BxFbD5YV41nl5sh+zdydq+83czQ?=
 =?us-ascii?Q?7zhNzBXpHhZYnD8cNeI3Y6Xnh87dz9ATp9AzZrthQTM9EJ67QV0zG8lzbjqR?=
 =?us-ascii?Q?j8vY2EhdW03b8ROwiArIz1qs5qlVwTZKMt+nhKZrULddjjW96O7M1SUPTVyj?=
 =?us-ascii?Q?dYXnbhrEmtqCamVZ5G6fgRE9MQXwVD4x16niK0GRNfRkV7LB9Ui4h6eFImzb?=
 =?us-ascii?Q?Y3OUVsEa7oWkfMtP7rgApiZbw+Z3r+i3uwmG1c9ioXh6CRQc+wpefgj+ggzG?=
 =?us-ascii?Q?MIdZaLGsbUpBG6gvDzRjqJ2N+XpebMx5J9I/tCaq5lyunZX2dPe+qoMSgkFc?=
 =?us-ascii?Q?W/hVG8c/kchRpo1mlCUd4ARwsqc22MZajmlPJTBIXEfDl7ZJctpkrWf4/nKm?=
 =?us-ascii?Q?rdiBSA//DUJF+SYMaBgfiK+7iLTa5VB7FwAS2P4RBBOkwOIHgM/MAKugcHM8?=
 =?us-ascii?Q?FHOQVU6HXwKc1obimiWUiiML8sJTTyxbTnh0Tlw601u4E2joden6h9/+uueR?=
 =?us-ascii?Q?mDAsPfCUx4GuM9zrOF9+lFbnUnsfx9rP55LcbdgnX7JtHFMQooUc+XNt4/71?=
 =?us-ascii?Q?xt9zYGmfePDTfCqzN/GiEcKQlHZ11cyO+vXMd0S4lQ0IMeuLtzhYQGE4umTZ?=
 =?us-ascii?Q?PLTq33gYeuddV15XJhF4ZTu1MHG9AcAubCDfJP5J+ebLv9ePtkxXHu5o/1k5?=
 =?us-ascii?Q?eNkMUmWieUeyj4OhqumzCXft2IL1UGtAN0PXytDopjkdRQ+kQKlgzLpzCzBy?=
 =?us-ascii?Q?r9LHD/1FyE7uEIuyRjr2RicfQ5xCaUX1TmNNq4FP4uf4DbxJysmmgA5p5jGM?=
 =?us-ascii?Q?lQSfnFcKmebgj6SuV1rPt0RIhYMOd0n2IE8ORsGsYLADet5DEvkltQed10BA?=
 =?us-ascii?Q?L9YNkwZMuvIF4SDQ4bYWcpn+qaipelGI/WoY+XmGsoD06MQWBDk4NSjP+cWW?=
 =?us-ascii?Q?l45jQS2VUqEHtfxlJO8p+BR38y4CaggngrhyXWluLS5vFMGGEXbEif+5W3QU?=
 =?us-ascii?Q?iT734+YxO7UIT124y4rcBYSUFUGhnAOzck0bBz4YClSGdtcCxF3cv1HELBNc?=
 =?us-ascii?Q?jOm5MV64F4azMBZuBHlpWl6cnNt/bmY9cFgLhlDBgHcs+w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LkAv/tDPxOTlXlwahPqMGCx6m7xx1162DWCvi/1zM/huasl7PY/aPJAOK+QQ?=
 =?us-ascii?Q?8NkDEbVZYwjX+R4NTWCy01C3C92E+lN2E5SQA5NawEQGxPYGv4LothlrXjRv?=
 =?us-ascii?Q?b4jZo58m47laHAT0oU+pUI1W1a9xbI3/Ze4vlSk4Y7Ov5VirIAdk/4N1VKyy?=
 =?us-ascii?Q?pF+7AMNGtJz/bu5ka2JavRjacP+1/lrHBFsYC5gF4E2eeJc1ONg42DvhqSUH?=
 =?us-ascii?Q?LUTH4fNCm6YGwhCPTEKZ+7pKQeY6WkEfonSayK/6wMiyklJrHgaNUvcubO9H?=
 =?us-ascii?Q?AmHEt0wvd9cDJXKbsjMr3zBCQ6yv2rEmI1j/qreE9dfqv7I3Nrohqsh9N/5E?=
 =?us-ascii?Q?gdTkuCYdVeLNc4GpcZ0MjdrSBuu+6QpJpDAlQZhvtjJlERs4ue79PUb+vcpK?=
 =?us-ascii?Q?KnHJfHQX06H94K+8MYjbG9h1x65CRKE4FzKx2fJ6Pa0rDFE9kxt+x/gYpvq3?=
 =?us-ascii?Q?/bvY79I1wKh8tKCCYf9vsMma70TQPatg4IbevX/aFwriiUjCjSqfAKPRKsHR?=
 =?us-ascii?Q?ou5ymUdbqUETwv8NYJugWWvNneBdUpoMycp9NQLZ4JHFKcNp6bGyMBcT1mog?=
 =?us-ascii?Q?FiYfslsFjIQgSrFWuM3wNa28zwY6NmJ9RJ9oMJYKAZHjvEsW1farcbAiGtSv?=
 =?us-ascii?Q?ubIFXsf7euYUQ8Hsax1KNGFTf2SIxAjs+N0wdF5e75ClPqLz51u2c7WX5IUD?=
 =?us-ascii?Q?L4BztgevYt67l9nsxxWYh3xpqgQrrXXpuSW8WhWWHaA2gneXzo7OAF4/4aMw?=
 =?us-ascii?Q?t1L9AARIqWxlr8IoeLpempsxAmSAYC9pm1Gcu2QUnpTOAT91dgL9UEkHc/OP?=
 =?us-ascii?Q?3g+Im36UmDqBTsaJdBPGlcXu8T6rGI9l6sgooho1o53z+ouJVscoTKF/iWiQ?=
 =?us-ascii?Q?7+6GZzUt2020FQ+3st0MlTp6uvuopUZ2Zss9kQvNMRhSvVsG5579TH/V2FR3?=
 =?us-ascii?Q?PCNVORl9V4FxoTvrzE+WoLmhPvI5XQOpkq9H7JR1Dw+/4qHyI5eSHkAJpmV8?=
 =?us-ascii?Q?6EzNUxZfhjhpZTwhxzpMkUzKzvnF2RjuLXEIFWHNmDp0KBbzfed3W0F0uJZz?=
 =?us-ascii?Q?iPlDTdgu+26/vidoDH0viBe4vNDy2/DFPJjwAYWoY4uL75BOxFuaxS0vd9pV?=
 =?us-ascii?Q?KhQ+9oBuknz5F/CddtumWh4f5Gz/EMJzyP+MLrBfO+Gz2XVisCJnEbw6kDxI?=
 =?us-ascii?Q?RQ7i2fTyCjT1TLtYbxv4j/BDvoCG2jZeeSNu10u18vmr110GClHNhw8ETril?=
 =?us-ascii?Q?kNg+SOBzEkRN+rS5Y2RnHcyQ5HJilcWJzGE1RLYZ9dVXwNm8YhXE7zBRDIHy?=
 =?us-ascii?Q?uTW+/pZudbpEdf+UmmzF1c9mookcLgzcXHlvaWTjDGAGsD2jAGS949+8587D?=
 =?us-ascii?Q?6P/NvTlrO4OfQp50p5na0SC5GmXSVFFnTww2WkQGJfAggKaeTAMX1u/qHAo4?=
 =?us-ascii?Q?LPOxQFJtDGEA0weh54VJ8Z3RUZCP2lIOfEgCO9Yi2OlySmxcp1RL8XuzrnY2?=
 =?us-ascii?Q?2RSJP7pFKunnqeIgURR4u0IuGVoCw4B3g5sUL0NY+AnOf+h06TxdvoY24SO+?=
 =?us-ascii?Q?c8v9Q0+CKZHoY7499m/cf+byjO3FjznlMV+Sim0h?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bf93ce-73c0-4c0c-93c6-08dc813fd8a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 07:03:59.7068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ktcclnBclX+GpA5k9Im0hVEiE3G+QqVWbLWamSMb8FBjqntvl6KnFi8GsYBTK8+k23z1gxgZ3BuYkpMgUtaXHdlFFUXxHILvP8iP5yNaVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2194

Hi, Hans.

>-----Original Message-----
>From: Hans Verkuil <hverkuil@xs4all.nl>
>Sent: Thursday, May 30, 2024 7:32 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org; linux-
>media@vger.kernel.org; sebastian.fricke@collabora.com;
>m.tretter@pengutronix.de
>Cc: linux-kernel@vger.kernel.org
>Subject: Re: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
>condition
>
>On 28/05/2024 04:04, Nas Chung wrote:
>> Explicitly compare a buffer type only with valid buffer types,
>> to avoid matching the buffer type outside of valid buffer
>> type set.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  include/uapi/linux/videodev2.h | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/videodev2.h
>b/include/uapi/linux/videodev2.h
>> index fe6b67e83751..fa2b7086e480 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -157,6 +157,10 @@ enum v4l2_buf_type {
>>  	V4L2_BUF_TYPE_PRIVATE              =3D 0x80,
>>  };
>>
>> +#define V4L2_TYPE_IS_VALID(type)		\
>> +	((type) >=3D V4L2_BUF_TYPE_VIDEO_CAPTURE	\
>> +	 && (type) <=3D V4L2_BUF_TYPE_META_OUTPUT)
>> +
>>  #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
>>  	((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
>>  	 || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> @@ -171,7 +175,8 @@ enum v4l2_buf_type {
>>  	 || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT			\
>>  	 || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
>>
>> -#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>> +#define V4L2_TYPE_IS_CAPTURE(type)	\
>> +	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>>
>>  enum v4l2_tuner_type {
>>  	V4L2_TUNER_RADIO	     =3D 1,
>
>This patch introduced this warning:
>
>In function 'find_format_by_index',
>    inlined from 'vdec_enum_fmt' at
>drivers/media/platform/qcom/venus/vdec.c:452:8:
>drivers/media/platform/qcom/venus/vdec.c:172:32: warning: 'valid' may be
>used uninitialized [-Wmaybe-uninitialized]
>  172 |                 if (k =3D=3D index && valid)
>      |                     ~~~~~~~~~~~^~~~~~~~
>drivers/media/platform/qcom/venus/vdec.c: In function 'vdec_enum_fmt':
>drivers/media/platform/qcom/venus/vdec.c:157:22: note: 'valid' was
>declared here
>  157 |                 bool valid;
>      |                      ^~~~~
>
>This driver does this:
>
>	bool valid;
>
>        if (V4L2_TYPE_IS_OUTPUT(type)) {
>                valid =3D venus_helper_check_codec(inst, fmt[i].pixfmt);
>        } else if (V4L2_TYPE_IS_CAPTURE(type)) {
>                valid =3D venus_helper_check_format(inst, fmt[i].pixfmt);
>
>With your patch both V4L2_TYPE_IS_OUTPUT(type) and
>V4L2_TYPE_IS_CAPTURE(type)
>can return false, something that wasn't possible without this patch.
>
>In this driver the fix would just be to drop the second 'if' altogether,
>so just
>'} else {'.
>
>Since these defines are part of the public API, this change introduces a
>subtle
>behavior difference that can affect applications.

Thank you for a detailed description.

>
>That said, I do consider this an improvement.
>
>I would like some changes, though:
>
>1) Just after "V4L2_BUF_TYPE_META_OUTPUT          =3D 14," in enum
>v4l2_buf_type,
>   add a comment saying that V4L2_TYPE_IS_VALID and (for output types)
>   V4L2_TYPE_IS_OUTPUT must be updated if a new type is added. It's all
>   too easy to forget that otherwise.

>2) Add a patch fixing the venus/vdec.c code.

1), 2) I will address both in v3.

>3) Something else I noticed, but I think this change should be in a
>separate patch:
>   V4L2_TYPE_IS_OUTPUT() returns true for V4L2_BUF_TYPE_VIDEO_OVERLAY, but
>that
>   definitely belongs to CAPTURE. Nobody really uses that type anymore,
>but still,
>   it should be fixed.

3) Would you prefer this modification to be included as a separate patch
in the v3 of this patch series, or should it be submitted as a new
standalone patch ?

Thanks.
Nas.

>
>Regards,
>
>	Hans

