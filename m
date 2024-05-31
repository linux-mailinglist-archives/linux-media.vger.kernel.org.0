Return-Path: <linux-media+bounces-12320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 348D78D5C2F
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6545F1C21D61
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 08:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C27768EF;
	Fri, 31 May 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="MN+/BMED"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC101865C;
	Fri, 31 May 2024 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717142643; cv=fail; b=l/9wgo+I0viOKSJKC1Q3cyWfkB9io+UVmeFto/AoWkLav8oA53dsRcLyzZhldNNw+3gfOxwIdF18htyg9vZQI6nUhkqTerV8kx19T9vxMFY9YcPT5+vlLWmTyYTFBS9TdP6xq1LyzTX4twOERu88OCqZI+WippW+oVI3Z8SgLYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717142643; c=relaxed/simple;
	bh=6Qqdm9u+0x1UdRCY0muspdkBV9EA/a5qkgH7uufoa8E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tReKcjSXCKc9UiRzoyki9fQzXnLtbJdogpXLHEkINV8Tmm9qBPrZCEVcKwZ8ljjHs23CEhuP0PkVtdmwUdcyKhrgnz7oQ05YK1X+TaNXwT56mQM2kvIdEVQC9Kq46npHd3vt+QuwmX4ihP6cw8gEzOXo7lKQwTpbEvZcXZDpGYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=MN+/BMED; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljfIqPSyYu6WMoEGIe/Uv2fJmlb4LZ5KDxqOPb/5SJh5YPc1fE6FzGuUSK5QvF9/YzE6325BgOlquhv9SFY/TN16AmALqMGgtqFhcTPUIn4ONJvzN1/4qCfMwoh3POcO2S3avT7XIMWEgbHgD2zII1e8WX6be339hDs8qhsH6xiMPqHpzZUBEIcSRrfg/m3p/VHfPJYyxThTy9/deC6PIYbr47WjLoJzW/QlsRPimnUk49rtvvFywm81b8C++ZNeegLqR/JKrSp5trs7owJfnj9shSk8Mfx3OuZaYm+c4kM99Vd5rnsbWogqJNpgg037uHJhyox6zPUw7G+xb205KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo05vcbGPhvnRwzYqNf0Mga1Xz5Ows0UCllu3grSwZA=;
 b=lUfsuPcxQkr0xG31sQev0XPFq4wl0478eOpUV+NmozA2L+CLBp7HtrHhDJlLo0K2UZGOwhMNUa9kB/uxp6ybfHumU2z5UHcsV0+7DGYHlphyp1u2jgAUpOaAvz5IC9NnAVg7efvzuLtVOzzFvH6GCVP1Vr6/sCd2Fk5ZUlXxQDtH4wJHoKfUo8xCVtmdRS/ABofyIDSaGB4cR4u/ldZ5Tni4skdo16xA7N77ZpXCVt/afOeRa2PIuu+QCuuqom9xKxMHq4rHyJGfXWwOcRIITTrFfjWwrhTGsAh1Zq+36KS6Ivsjh0sXdQ5e4Pr+qUKOWQmKAzb0312O2Ew540WVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo05vcbGPhvnRwzYqNf0Mga1Xz5Ows0UCllu3grSwZA=;
 b=MN+/BMEDIFot/4EJwMTo1OBsev4jh8H6w3hcWkCWJ11iDK6Wgevn6g2HLJwQlxH4g4eQRB4hf1s3FnGwcWyXlm1DAWpVv+nHY6faqSovWTDMAVE2NLaRYEKXU9X3L09mglAlpP26T2AFXJ1zeSx444n7neE/WBz9HsFfYq7+bOM=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB2909.KORP216.PROD.OUTLOOK.COM (2603:1096:101:286::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.23; Fri, 31 May 2024 08:03:58 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 08:03:58 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "m.tretter@pengutronix.de"
	<m.tretter@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Thread-Topic: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Thread-Index: AQHasKNiVaRy5Vo9MECtK40uBvrWg7Gw9jgAgAAHCQA=
Date: Fri, 31 May 2024 08:03:58 +0000
Message-ID:
 <SL2P216MB1246BD404CD7450CD35C0D2EFBFC2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
 <20240531072544.c3tw2uy25zctgs2j@basti-XPS-13-9310>
In-Reply-To: <20240531072544.c3tw2uy25zctgs2j@basti-XPS-13-9310>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB2909:EE_
x-ms-office365-filtering-correlation-id: b3918748-2f23-47f7-513a-08dc81483984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mVwcEHpB3Wxy3CfvYqVgtoucoUXAy6Bz7Yy4Y1pmMQweg6gIMZVQ++qCWHv1?=
 =?us-ascii?Q?ntaMAuOTC7eLW4gqmo2v/8LAv9OhWQ7azpN0HmhPv5ceZfYrPyKevymTDLk9?=
 =?us-ascii?Q?zFgsUyn0itHBT5JU1MykZqiG9SbwycQFzrPXmi3aIaS919bqO/iA5olV6HIU?=
 =?us-ascii?Q?dyvq45/Btz6j73XQesfhICEn4T5RCLILSV52MT+v0LS3yQTTTNXljeKhKv//?=
 =?us-ascii?Q?bT3D4BZRrg023FbX/ZEP5Z9/DNgWlcpo779SowPPKkPHiGPElHAN/OedsDDF?=
 =?us-ascii?Q?wKtIOM3FICK1YNjzFL1L/h5KWcIQqMBYbgYN6fI3w5M5mj9PiwJj+ZAMeV93?=
 =?us-ascii?Q?/PiORZDLlw4y3mM9DOsveNtAoBUDg0uvEyGTg1DEcNAxdJfpKEZWihkdwbpw?=
 =?us-ascii?Q?7X8A6kyKswx8qrlFwuAD+HS20Mgzyc+hzcjm2K1E4eupjCeI/n2DuodUdRp2?=
 =?us-ascii?Q?HuhiKFGhFK3fdDbwpJGMstfefr8aruOFSiQ3aUSwrZbFqlXXHpeqP9ok9Xj9?=
 =?us-ascii?Q?G3LQOAoAy7OHZQ1jUhC8o9hVKXnoyf5Ke4fa8Md18pwLztadTMUJKLvZdboF?=
 =?us-ascii?Q?Laod5BiSlUTVjM+vLf3MI8ysI7XwqnU7Y3v/KFsrXOHl09q4X998AbqPYIGg?=
 =?us-ascii?Q?Tz96IiM3hSotib82XdfeGk6DyYZjMQPqB0boOdtkohncyesOHH7NYLOv9Aov?=
 =?us-ascii?Q?Ob7kunGzxWqfvnIussr6A7r1PWAEesopmamSR6JagTJATzQk9tEt8WOXVQQy?=
 =?us-ascii?Q?cIytph/9jXjFpLlvzBtvo6x+5UrRw4ymJfh076zxGYe+Ewa1CwaZmSP6e0fM?=
 =?us-ascii?Q?0uXo93GdZnpofTjtqY8YHNuKgmXxOP4jPi1NaKr9Es2FkHvgPPuWNG/GzPeK?=
 =?us-ascii?Q?rBft3DkuvLsOgBhhgl2kVmReivlCkhUQgICn/VFbSHrUw4YH6GTun2Ob9Tp7?=
 =?us-ascii?Q?ySM1po8Y/HsgtXdXBX9PaLXXQBdgB+l7qmGg1uyKGs5EkYsuweASZxo0LT7Y?=
 =?us-ascii?Q?IjXgSrpmdULRpnppodiDMhlm2H58nq7xplbVwFZ9eIldfWUgFxVv7vx+Yz+7?=
 =?us-ascii?Q?N2nscNBiAZVwBcdBTaSHekgYFchlUzGU0zcQprGXj0w0ySW8EC6cA+4psQZi?=
 =?us-ascii?Q?WcaoAm4hRNpk8AKcPlsUbG+K0CMkZgfSZM9LcoV6nfFPKJT7aOe0t3mZ0Z6R?=
 =?us-ascii?Q?qx2v9wQuCSTAehngjQMN9X4WhcusiXNhCR1aoU9+W+p3L+m2LwNVIcYxW9jA?=
 =?us-ascii?Q?P0ReWjRa85MTLzFMCDEgyRAGMeE4ZN/ZVvqUk7LSu9uKDsQXW2Askr98sJmt?=
 =?us-ascii?Q?tyvZV087g5pvseRADrYNt7cjPrwibCimVoKST6TBDoSWSg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ws6nV8CJ8u3lEAbYXU2I/hgjUzw5/yEKevsp54EhfyhN7ZrIa4tdUzyKE2cO?=
 =?us-ascii?Q?Zj1Ur21VrmUkR9993+4G3FF7Zt1xftRVJ5I7hTAjVpLg09q7+tHXPYUYTB+j?=
 =?us-ascii?Q?Tg31HThql5goxPeNYbaLUg15pjf7KNjItvy/GrUrPNAzgO9PhrP3J8LnJniE?=
 =?us-ascii?Q?psHSyLi4IclWlxc/xvSJsgULfwLvHBHSXtceL6Gq4+sHBMzOf4yLIAttDTRy?=
 =?us-ascii?Q?kPjrgF/AXzZiTFoV5nbzM9sX85soc+Y/A5Gl9xvt7wOEplLJ9FRZSJ+FVzrL?=
 =?us-ascii?Q?QaFqbHKeTnPu5x84EGkXbYoZq9kgtVVUpcf9F8ee9aNG4Lqx2pphORki7vTg?=
 =?us-ascii?Q?0Ulz5A5Fprbm3kYciCAtDAYJLcWNnBtBhcUDtberCsAbDAcLeOi70VZ2aXQJ?=
 =?us-ascii?Q?NDGpAbUiK7YYVtVEcwiLhSjLYBJYAybHIjAV1QQse3E4zS6NDtAwhzmDWnyO?=
 =?us-ascii?Q?sV8dG080ZOYKSMCFang8vAt3ANGs7d4pRHmNDkEF3YughtAWopfxTunK31MO?=
 =?us-ascii?Q?CP8hrg/wz8VT7E6lqu1rBdV0xR7JvNiOOIpzRq3B+0Emq4YRL78FkCNW9eyf?=
 =?us-ascii?Q?ydA7e10rqeuiBS6CzhSQ0e0Ki7q7D/jNFKX53TyFnWp02TxoVJNMAep+LlWT?=
 =?us-ascii?Q?upeBj6S0YjUeg5BB6W1ygdo9Kl7XptAeBZoODen6IjsBaIVcElrlXVvoN0rh?=
 =?us-ascii?Q?tQvVLh9N5GM4z14YirOwh40xTY2/C8qaW4sz1HaJP30cV7wMorWAHVFJkQJK?=
 =?us-ascii?Q?+UlOZibj5qn9qp03DcvQXEvmStuwz/QRDeW4PBSEwoFrYBR/KtQy2Lwrodh8?=
 =?us-ascii?Q?IjUHE8g9LlcBbHKxyTDDzqualuQom7GrCDfe59BE1OMlU6Omkkv8eXq/pcbd?=
 =?us-ascii?Q?3pVD186y9Er/+LMOza9Okn6/t36UtPXWFg/SJvSk40ymNrbZPTKk89R1PvkN?=
 =?us-ascii?Q?NL+QUcPpgFmZ3WScAJZQkbbAlfN1Rl2icUyc00V1lBhgVXWHh1girXWIjakQ?=
 =?us-ascii?Q?yQjiXqR82GnUSOQ4Wn9xod4M9jYGvEmpqnZR19t1MlE7/yzSYzzRBwHL5i0z?=
 =?us-ascii?Q?wAyjwZnElLfhtI/rFvnJ2/bbNHTPLxnZfnA5sH/GRFUwDAhmzyh6SVfUfZxy?=
 =?us-ascii?Q?HCBao4ASfzdTh4lRKYn+ZszMVPgqlr51/kaPzRjZwjbXmdAIgCI14lR/O2Hb?=
 =?us-ascii?Q?/mYYXdoXQrcpOgCbCQlwh9XZuC5ywRSj5RNvu8JSwLnRPdNDqPseUBMz2qBx?=
 =?us-ascii?Q?Ub4XREblqxWuE5Jgd9aagIp4iQCLrv2WAythwfP06n7SqWW+ti6Bb4cHUfEQ?=
 =?us-ascii?Q?ji42X+q4FwqiNliD8n5vX+km1st2MkH0n+N7PvAlEbUN+EHqfAuPpbg8O80h?=
 =?us-ascii?Q?0rJ6tProtj1AEUfcuFXEbXyK2SjlMOK3UJnDep4Kozyn29cs0OSxGKICC8nQ?=
 =?us-ascii?Q?SsEKNxg8dPdTDpiSvzNmkvhYvFpn7m9d0IUN++VwA9+LWiZgBzMRwVB/cGDb?=
 =?us-ascii?Q?pJZEq6k2CsfiJuqfvkwtedr0+P0Seh83jx8JWAlK4Vur96QAG9zxkcqg7gAe?=
 =?us-ascii?Q?ZB+4+HoLrzL7pKPKEq4605Vz7XM/p37N9vtBWuT2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b3918748-2f23-47f7-513a-08dc81483984
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 08:03:58.1874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3AhAuA7YEO1CeYCmvzVryF7C1UCVz6ZtlL27m1zQTrUBEeLKubHS3WO0+E5UZQw4pZ0YfgPUnuXgtgf5NZ1coWhRUgdFK42o73ry3UAzGnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2909

Hi Sebastian.

>-----Original Message-----
>From: Sebastian Fricke <sebastian.fricke@collabora.com>
>Sent: Friday, May 31, 2024 4:26 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; linux-media@vger.kernel.org;
>m.tretter@pengutronix.de; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
>condition
>
>Hey Nas,
>
>just before you send out V3 ...
>
>On 28.05.2024 11:04, Nas Chung wrote:
>>Explicitly compare a buffer type only with valid buffer types,
>>to avoid matching the buffer type outside of valid buffer
>>type set.
>
>s/matching the buffer type outside of valid buffer type set/
>   matching a buffer type outside of the valid buffer type set/

Thank you for the review!
I will fix it in v3.

Thanks.
Nas.

>
>Regards,
>Sebastian
>
>>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>>---
>> include/uapi/linux/videodev2.h | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>>diff --git a/include/uapi/linux/videodev2.h
>b/include/uapi/linux/videodev2.h
>>index fe6b67e83751..fa2b7086e480 100644
>>--- a/include/uapi/linux/videodev2.h
>>+++ b/include/uapi/linux/videodev2.h
>>@@ -157,6 +157,10 @@ enum v4l2_buf_type {
>> 	V4L2_BUF_TYPE_PRIVATE              =3D 0x80,
>> };
>>
>>+#define V4L2_TYPE_IS_VALID(type)		\
>>+	((type) >=3D V4L2_BUF_TYPE_VIDEO_CAPTURE	\
>>+	 && (type) <=3D V4L2_BUF_TYPE_META_OUTPUT)
>>+
>> #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
>> 	((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
>> 	 || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>@@ -171,7 +175,8 @@ enum v4l2_buf_type {
>> 	 || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT			\
>> 	 || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
>>
>>-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>>+#define V4L2_TYPE_IS_CAPTURE(type)	\
>>+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>>
>> enum v4l2_tuner_type {
>> 	V4L2_TUNER_RADIO	     =3D 1,
>>--
>>2.25.1
>>

