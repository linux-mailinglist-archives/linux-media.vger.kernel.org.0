Return-Path: <linux-media+bounces-17190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59307965647
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BBB1F21E6D
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 04:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EA714B952;
	Fri, 30 Aug 2024 04:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hLFdiPoN"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021105.outbound.protection.outlook.com [40.107.42.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D84204E;
	Fri, 30 Aug 2024 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724991979; cv=fail; b=GTJB8cXNO5Wiz1iNZA4XnIqJ2hLnSQIlahwbeHFPyy9uxUbsea6iL2tp/chzVQQ/LqboRQMNRO+1yYi0aYmXcTifkMM29wkMf6mOwfABWRYM795F5xpTJWqL6SjZTeroSzRjhiSPTdqbkHJ9sW9HS1ZdZNVmoIHKs7NI2c3rybA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724991979; c=relaxed/simple;
	bh=YSrAKpaXfvbA8cwfUJc0I+I9wnyvA5j/SjaGXrOUppU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UTv6tqoGxzfZxsqbumNVq+6SUO43OtAx7WD7wvXrBJaeZMjJTnSguVYxHOB8tSEYFtjXRJ53wUTSkZE24VdvDUny4lZvPAUfWub4ccWUSTXdp88E/Hu+N+1v2v+sujOzg12fU5DPOh02z0QswOHzMHHH2QOwvQ/XF44bxwFYrCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hLFdiPoN; arc=fail smtp.client-ip=40.107.42.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuWXecPmfBYgtErDRr1JFJZjlciDkFwHbSXwMq2kao3xcmw4vVLouao6TutL6y7e4Qc4RlNLF92MT5wjTDH9CEMYtlQfT7xeXetVPn97MJWpODn7tufIfog+CtLo2zAQkhMveKLj8EEoRlHCM3h0g3hFRAl9wknaM1mOhPlxIbH5E2fFBj5Cl8a/AnqW6EeMw0YEgffYarVtCLik7vi7uT+1mBzOLW93loZqMw6r6hRwZB9Xora06Rk4MSmSTUqO6o1ia5E1W8qMuTINAsB6iGyU7xokuSyuEIYZvip3xAJo+x1/jUqtVCRAJq6aY8kPmmjUMRCSKOrNyjxgY+UPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKJ9Z9ENQc9vCv8V8/UMLiK65SAHM19eabzPc6bHyr8=;
 b=fkKN/pI5GZURSWve0u9YZtDgWGLYHP56DyXVZgAZiQPG7BLDrx2rLy1wxrwLISAbch1EJRyKzSAlpSSAb2ODDn+XM5XfS+fHWf0F97cYXlqsfSddLBQEIJgxHLhdot4MuStbU1oxdPz5f34PoaiYMT4WZtxFhxBMdqRO12+brcnoQ5K8VE16YUQMfp7Z9XioEFnCi7948FOxP08oidhWAM4mIgWK+xSbdiVtA+XNIOJ3Dql6bRDno4ixEYkNAXDrGcNgfqTmOiIiazNkHJbe2HqThiQXuR39RqZZop4MvgsT+9FWTiknE5Jj5z0aPxOYNGSiOciySWpX9NuNwO68kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKJ9Z9ENQc9vCv8V8/UMLiK65SAHM19eabzPc6bHyr8=;
 b=hLFdiPoN1Ke1osezWmNipBez0RicEYc0Y/Vu5Asqttbqfxs78/g4wQTd6elTgFYEy+AIUgHqakFMnOUcHfWJjxUW0tRASw/dhew06AvMxLN3itVPNcvZobB2qlXMUiTXL4e6nbD+Xt3rvxdR0LjjJqQLQVzLFIqdGf0iHyPCQtc=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB2256.KORP216.PROD.OUTLOOK.COM (2603:1096:101:154::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Fri, 30 Aug 2024 04:26:13 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%7]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 04:26:13 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RESEND v3 2/3] media: qcom: venus: Fix uninitialized variable
 warning
Thread-Topic: [RESEND v3 2/3] media: qcom: venus: Fix uninitialized variable
 warning
Thread-Index: AQHa3llr8ErGpMr3PEaO3lEhTBkFNrI+QFSAgAEKczA=
Date: Fri, 30 Aug 2024 04:26:13 +0000
Message-ID:
 <SL2P216MB1246B8100FF5853ACD68F8EDFB972@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240725061034.461-1-nas.chung@chipsnmedia.com>
 <20240725061034.461-3-nas.chung@chipsnmedia.com>
 <918e84fa-4a07-4ca4-bd3c-a14cb0a8f3dc@linaro.org>
In-Reply-To: <918e84fa-4a07-4ca4-bd3c-a14cb0a8f3dc@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB2256:EE_
x-ms-office365-filtering-correlation-id: 3b5c8778-d9b5-4af6-1cfe-08dcc8abe216
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DBUphbzbPh6stenl6SPaky40GJSeliRFY/WDZfzTWcGIjsbl+ZsREC6O2zJZ?=
 =?us-ascii?Q?TqiTaI2/m+g7so7utbWCLZQHmSOfVif3ZVNUCoL+p+V21M+qP2RJNQYPBzTH?=
 =?us-ascii?Q?2y9uekp46lz+IHq7Ik0etB3AFcZBIpPotGzkOHR0trzREDBjRhXezkuO3CV+?=
 =?us-ascii?Q?48Q18O5f+MGaZLmsdWRsoyINsmCI15B+O9bZ5A0HwJgPPKePSA4CQ8eZWZki?=
 =?us-ascii?Q?6W4aYznpxXYwpQgoVzRndit1pEzEt/0F9puRaOfsR8n0K8y41V4wu/+GTdCb?=
 =?us-ascii?Q?4stxondowRcnXIaYCAgqmTOQI+HIt1msRzut/TV7RgfFYomDxDuIjHlyFKHI?=
 =?us-ascii?Q?BzLkTpqMJnowC+kcxmNmZ+qr1iyUXydkSOuVn2VPDpqoG4/w7fdNLH+ROqwg?=
 =?us-ascii?Q?/4mtjLi0oQsMcmfaxmT6nO3/463jRNnxL6P8Xu8fhGF6PTJcPsICzyAagJA7?=
 =?us-ascii?Q?iKqqXbq0RswanH50tp6sZohJA8AkkCVvvZu3X6x1QFUJtx+A822AI/wiDA8d?=
 =?us-ascii?Q?GngaTIKQWFAtUtjbv8BMwL4X03B+dnin0Vmz+9nbs0iWlcS/uhdwR9yTQeu0?=
 =?us-ascii?Q?O4+kJMmNtNkUzAafEqhAPe6TqAz57JHnY6dDnmN1YrUqSsCP2yBjxQCYk4C9?=
 =?us-ascii?Q?5/ZFPKXG59fOLK3e9q8gaRqrVyzh6gYfuPTb3iJOxP4sWe852OlYrTRFUWfu?=
 =?us-ascii?Q?eTBMuf1ywPbTMFSDO9NlM+cEK1ubaWtouL9z0M23Aof6JXX4xHEThufpkr2e?=
 =?us-ascii?Q?rplJ1lvlWKoZ43gIhaacYhIH5nhTdEvcGK7xFuRVgNXUkFhR7Uw/lyVyojq3?=
 =?us-ascii?Q?N8YOxWZfE+wK4/PfivUKgpNll1IkFAXYfJrMgVNHePz99Y+YOG6HXh3Fdm5a?=
 =?us-ascii?Q?4hMbLZPmhweJLUe/ZcWcyyTsfCHGWDhfhdJMZCL+qIU0b9U0BRf1dfapZq5M?=
 =?us-ascii?Q?otmtYB55WyLx7wPqGbK8WAKPuZTZwg9/b4dplIjgyCt4mMBieXJxwcNGpgs7?=
 =?us-ascii?Q?cosHDC1vxQl8uyGLGmHZPVRSQwwx8FiAME9+Yu5HLH2+5tZQW0XmXHAtu/sr?=
 =?us-ascii?Q?sAulq1VgwzjG+MLk45oBtJ1nkBH52LqbHCKeNBcialIUNhCdn+N0Ijx/57cg?=
 =?us-ascii?Q?jrSgunQbWxAuqvD64UUrn/wLptZcEO7WYIJGunx6JlH9Y22JVvKtals4pR98?=
 =?us-ascii?Q?ymsuXU0DSIbOhS8cW6UtVI3Qj1tcSQyI+3A7dl/2P2WisY32ikpcTQRhmjMr?=
 =?us-ascii?Q?EJBjer6tgZl4PulLs8lcrNrdDlzxZU4n1wcaPIMK58AUACReNI4wUfpSdAbX?=
 =?us-ascii?Q?GTny1GpLNbj6Li3jx4C72mYfm+4e4vVlKzAnGgpIgA/hJGrdviXoGpRLczdL?=
 =?us-ascii?Q?HqTzuWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zzb6r70fGZ9GFkMsHWbLCFTUokJGhIX5WtdOo0lGbS9UeyJ9Qa3kNr0XbcLr?=
 =?us-ascii?Q?BzpXgzEPU+odnr5f4zS7cusa0PV6WiBqg/jaHRecNsgkh0Cxp0MSjQFKm12U?=
 =?us-ascii?Q?vBlLzDIZYrYHZ4gGulotdqTNRtFOE+Ya6GBvT0mSmY6G0l9l8BdzYYNbc5Zz?=
 =?us-ascii?Q?4rSqpoKrJ21UTEu2Vfp3nXxjop+xE8NDXymvVH23Pxhi8R6Vu96ZlMgft9tk?=
 =?us-ascii?Q?WRWdNXpXz1zGbxK8Ja7AlLTzjWNT9bgVhhP+glF/i9FnIgvKcs+HF541UeN5?=
 =?us-ascii?Q?YH/j2tRUUf1FvflSDAfIfXCHwguPbaHVEw41pK9LmeYtExwD5Le0Mp0oyk7c?=
 =?us-ascii?Q?f4Ts9gK4hUYK6L2KpSqnWdA7O+38gbl7YdF7fRRfD4C4IN3G/RYgSnqBIjep?=
 =?us-ascii?Q?qoqTLUlyObrsPNEaMPaAl3eF4aFRMfQtNVdxqsyhEAWQDZ/yU09Mxad7QOLM?=
 =?us-ascii?Q?cIi3Uw1Z1oSTRtDriDg6HaOVvqNZ1ATIi3uS+vDJDVT11sPfMzeJLdbUQE9L?=
 =?us-ascii?Q?3QOLM1/JKnxD/WgeryzdB8h4jRhkUnLd9JXxFkCrcaRNgRfoLnRGsPNUVTOz?=
 =?us-ascii?Q?MJ6QiuYiREH41Zcc/C7du/DpdfPRoc7zdXl13unedGS7NqrTgBjbsczi/oTB?=
 =?us-ascii?Q?r7zqyzji7HsNyAA45xXx2C2efkJ7AjzwC94u9jpCTmBojFvBC4M2WGRRhct8?=
 =?us-ascii?Q?9eoKqZemDIsq4X8jVfjSerzHc+2GUEx07jKvF2lWxBXqXrfH8jdHiSwe8N+v?=
 =?us-ascii?Q?YTsRCTjI5Oza7vMBdSIvxWA3bVYk3Lv46gJ77qIyR3rUD17TPrD0mbZWsvZb?=
 =?us-ascii?Q?mvKtgHiwV66f5gmshra0tI3y4AtxuMUg6yuwrUofHWVikS4KDvNlZQTl5ze7?=
 =?us-ascii?Q?mH2k+kXgX9ekQqJrZ+vedjiMy25A3/A1VyeMqsRrK4V9WloH4YdXbaKey40w?=
 =?us-ascii?Q?n+x2DPsx8ov9Dhe3FuWR7kiGzQBi6Na8sgRDHuH+GANRZ2+a9kTue/OJqqpw?=
 =?us-ascii?Q?j7wEvXSpR0wOpjwO7NEqBcWB34s9p1HWBeKW7vTICQfqIE7xHJUbF8xdFc+c?=
 =?us-ascii?Q?30FFlfxMEnrkdo5XMV04wD1A/Uij06uJAJQAKWNcSO49xaJN2gatsQio6nyg?=
 =?us-ascii?Q?MTILcIWtdqnUptG8R73IY73T3hN5DZn2z+gjdg6GOj4EQNSZZxZokhz91s3V?=
 =?us-ascii?Q?XjJZTRHoYW/puL4NK0W2vCMlKEzTxmApAawdsy+HXWVIDZ0kHn2wnkGZItzE?=
 =?us-ascii?Q?HxLXdVAujv5Ls9pMYAEJUuSdZd1SB3uELMw5IuF3PdfihER9s/knGcBLE/Qu?=
 =?us-ascii?Q?D+lBQXYSnnkVpyBsbBBlqG/xBm9dvNx5nUSm2071pPhBBS6j2yvg/lRnyyQG?=
 =?us-ascii?Q?dOw+10CCN4ynxZ53YF0njTmMvdbYDBhkPbgH7f8yebn5QNs7PdBlkpzS6IAx?=
 =?us-ascii?Q?2Fhj9nPxJ0AEdHtmSw/PFlK9fgYdD07oRmIM7Gv62PG5x4eOfTxMPEmpD81G?=
 =?us-ascii?Q?bN/71LA+rQKImMLxd4Wi4wNcVg9BzC8CCTGpAHl9k6adqEm5Ua5PmGMPaOCa?=
 =?us-ascii?Q?BoAF4DC9USMqRvG2cTdkBKBrwi1xcvqnUJrlHkcE?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5c8778-d9b5-4af6-1cfe-08dcc8abe216
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 04:26:13.7237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Qq0g+nLEmVuRofrI/DcU3nt/k3PKrTZqcsmBMGG+WDVD+/rxIza/0wd5Y9LWmIwFUoGUqb+inJxwbQK7hItukirvYmHevE8ZHswKmizA50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2256

Hi, Bryan O'Donoghue.

I received feedback from Hans with detailed information about this error.
https://lore.kernel.org/linux-kernel/a962e94f-a669-40e1-8b28-9ef077cf69be@x=
s4all.nl/

And, you may face the following error message using the smatch and the spar=
se test.
"find_format_by_index() error: uninitialized symbol 'valid'."

"make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-none-linux-gnu- -j8 M=3Ddrivers/=
media/platform/qcom/venus C=3D2 CHECK=3Dsmatch"

Or, linux-kernel build with "-Wmaybe-uninitialized" gcc option.
"make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-none-linux-gnu- -j8 M=3Ddrivers/=
media/platform/qcom/venus KCFLAGS=3D"-Wmaybe-uninitialized"

>-----Original Message-----
>From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>Sent: Thursday, August 29, 2024 7:31 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; linux-media@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Subject: Re: [RESEND v3 2/3] media: qcom: venus: Fix uninitialized
>variable warning
>
>On 25/07/2024 07:10, Nas Chung wrote:
>> Avoid uninitialized variable when both V4L2_TYPE_IS_OUTPUT() and
>> V4L2_TYPE_IS_CAPTURE() return false.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>   drivers/media/platform/qcom/venus/vdec.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c
>b/drivers/media/platform/qcom/venus/vdec.c
>> index d12089370d91..b72b579018e3 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -161,7 +161,7 @@ find_format_by_index(struct venus_inst *inst,
>unsigned int index, u32 type)
>>
>>   		if (V4L2_TYPE_IS_OUTPUT(type)) {
>>   			valid =3D venus_helper_check_codec(inst, fmt[i].pixfmt);
>> -		} else if (V4L2_TYPE_IS_CAPTURE(type)) {
>> +		} else {
>>   			valid =3D venus_helper_check_format(inst, fmt[i].pixfmt);
>>
>>   			if (fmt[i].pixfmt =3D=3D V4L2_PIX_FMT_QC10C &&
>
>Can you give an example of the error - compile time I assume, this fixes ?
>
>---
>bod

