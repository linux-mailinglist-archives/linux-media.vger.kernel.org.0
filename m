Return-Path: <linux-media+bounces-25990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A63ABA3067A
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 09:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8BD1883508
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5C91F0E4A;
	Tue, 11 Feb 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Hh9qPU+I"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020139.outbound.protection.outlook.com [52.101.156.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540891E5721;
	Tue, 11 Feb 2025 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264151; cv=fail; b=HeMCT212l7mFf79TQVCIrhuW4WHyyAC8GRhVLIKMw8vP8HI+WIosxGmtJGtz5R/WABvzMCyMOO9pej0EyTvroaWibCMu6zIik6jtS20TnS16T1uR5W3eJR2hlopdibNPho+mjc7d0YQ+tDLXUMC8BYcxeb3KY+pBv0c/anZAUo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264151; c=relaxed/simple;
	bh=xvqx9xcUDx53ccTkTiN/m/kA/sceQGXyIj4Sly9tw84=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=puBZvHFwE28lO+2vzYo4bfLh4EaMMVGsZcyL6e3KZuZkitUJN0ofgsHOOxLBH4xCTi7DLZbBk9Ng4++OkmqT/JkblkirPHyALoLqwv8/+5aNMkXkb5TkBm3Agf658fif1MmCZteB2mzKCS4lfJ7hu/ncRbybYPOhojfyYqK7u6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Hh9qPU+I; arc=fail smtp.client-ip=52.101.156.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxIuExucNy8eZh50gzUerUaLy5wD453KUxVQql/2wtJILoRJ8QefwxzIab8MJGzPDWVq5C6BqvFXccSNkwgitVqGOCCV7/gEPcq/vePQMY1/k9QIsHBc0a9yPXfzdpS7dGC1HTigFjKXV7796ECBXPfPskSEAn8CAuo1CloZ0wvvgwRr95l8zm6jVUKWuG0Rqe0/c7JMz9vlzBt/85bAZUL2fQDGOJPgDB1oNLhgqsNIEYwaC8AQh/ey8JYQF4uYxkx1taWbxP3TIxfYCJwcXSDmzfwJnpg4Lt3WoiVFV9gBZInvKGZBb1lo6FK8gc8DMm1KUJZaCw20GcUoQFDQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXbkU7EOOtqcoRm1Ch5mfofnBRfBeS3/voENVv+WEwo=;
 b=Fi6Ugm2GlVCq0Amr4SyN4AgOMDBaIHUT7BvnOaZRlE2C4QYMopEq9Jyp4CrUBwaHa740C8321I+7pcd9rZvPH4Kx1dqqeMW0WB+SUAGcdS04ImZWgJz12K0clo31thKknJqN5lRknledt6ohkCDlw0UIPu36867yTe7Qb0vyhJU031z5RdT/YnxSF5E3sBOQ61JezRaB2NqBxKLV6UTDQTwVpt9BxghE8LcIIjm8qo0asLABHW6gxD9DLAs5+NYpMBiAWusqjgOQmE2Z+nEVdtTwtwQDIP9/WuNrkXgR2/qHeZxkS4FpUKJHdYJClaqfoBZTgB4jwZRv9kaKe7Z8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXbkU7EOOtqcoRm1Ch5mfofnBRfBeS3/voENVv+WEwo=;
 b=Hh9qPU+I0x44DeJ8vVnY5QCJvK/pjqMFMvQ2tPQpXa84+uH9bsCU6Vv9IF6312nAOgUKgi81gbecRF9ArECoEpvXlwHL/Zf0Zwgxp+3goaoK3Zhq1VAOelk06eGs6Jlyf/dqNQAuLQA/rYw/EwYrz4JCddKJraofxJhyrz0PB5o=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1409.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 08:55:45 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:55:45 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Thread-Topic: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Thread-Index: AQHbe5s7cZfX4msALk62wDljhUBtgrNAzcUAgADwDbA=
Date: Tue, 11 Feb 2025 08:55:45 +0000
Message-ID:
 <SL2P216MB12463FDAFE6EBB827D16BAEFFBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-8-nas.chung@chipsnmedia.com>
 <2c3b9e21-06fc-4108-80d7-c4e2c4ceb2fa@kernel.org>
In-Reply-To: <2c3b9e21-06fc-4108-80d7-c4e2c4ceb2fa@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE2P216MB1409:EE_
x-ms-office365-filtering-correlation-id: 370e521b-1fae-4271-efdc-08dd4a79df8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KaotMhHKpqWrqrNGMFXOX0tGRDF3Mxt9t0BwK48Tvda72FO6Xs8ofY2fr/pI?=
 =?us-ascii?Q?7CfWFma0p5BY1pbptIRWIjijSAsf0RNmkCLaHG/ImgFXnPBZUXzPo52FeGFF?=
 =?us-ascii?Q?rZVTWB9jXqISDxt1Bhc79ccbw9tXKp6Dp7MxgSwjx6416h6eTx/A+6WcMzcI?=
 =?us-ascii?Q?RjkCwODD9rhgd7oJxV2bBk/kpQTuyysOPhzsFl4ql9VeKUf9MJGo9KP6toFW?=
 =?us-ascii?Q?HheeQEgnCiztlenOivJC6AGEYgptK+G3C8g5I10wSGORRrud8eLgralxABMf?=
 =?us-ascii?Q?zBDCQEUpRPjRDTHMsktAWqB0pfb2S4okB28rPr6cFgXmU0ZJKSfn4U1oMasL?=
 =?us-ascii?Q?ORsM+GWy40uSeIDU1t9WqT4WMnSicfS0GWmZsKhVTwj38ROR0iHl/X/kGfdn?=
 =?us-ascii?Q?TSEM27Wm/jrZTJWXaMPjux6I865+/pEjug7xMtQJ5o38P3uAhTq1Uc97UKQp?=
 =?us-ascii?Q?TYJdAB9emMdeuBUkUANU9SzZxJv01i0NJthgDQntpi2mGJJHXwh3Oxl+VEvx?=
 =?us-ascii?Q?0chGL3eujAfA/BOomqbkmv3piaNXSQ/d9iEP0R7dptoVIqRcen+px7hznuDj?=
 =?us-ascii?Q?z7/wzoZh2apMOv5WY5SMUocdrzPORkTV6QLj7n41lixnUuI5sTab/ZzSldlH?=
 =?us-ascii?Q?BE3Vp+BtiN7UidAxKlJJDPq5ow1976nZoElzsEU/htiEMShmiw3HpaOnJ0CF?=
 =?us-ascii?Q?EKilcQrK9xeQ4UIUjCEyBngR4DitghuTclYdXs5pTBT5d1PyMXtTlIZ09Mtw?=
 =?us-ascii?Q?78i62kbNyjwpIkeX6Bbk6NRW+eoBSjetOGXS9etyLCU+NnohkvNm5dXK27Z/?=
 =?us-ascii?Q?yQOnTJt4frgbhhgH1xaQ7oQiNoNc25+QVcHACmZFjEKol467GxLXX305hZKD?=
 =?us-ascii?Q?vmiv1duHkeWWxkuCxQlL8JAmBwsJlH8xYck4JKZYrd4PjVkzdUzoPWNxh2gI?=
 =?us-ascii?Q?R2zk2jpX6AbL40WY/YRQEDbwmg/GP5anAfNMM9/GmPvORR7Xk0sS/yzYx7MY?=
 =?us-ascii?Q?1cMmGWf7xRIsrrEhwvpKgdvIiaar4JLm1+8dieMncJHsC1MQtl4qEUq6D3VE?=
 =?us-ascii?Q?kQce0p2ztTKEr7YBy53FPf5eDFSPUInnH02B940jYthv4OQ5guQ/n3JgQifp?=
 =?us-ascii?Q?K4koZheFBbawxCYZs5pYvy/BL8HcnN4Kt0FZYTqLzP28EF2m8PXRH54mvgPh?=
 =?us-ascii?Q?oxZRo4HjzJmzN/kkS8QR51yAmZAZFkPbGmw6c1aj1rU3gm3vj1nB19ai117L?=
 =?us-ascii?Q?cb5UDT1mwl3r8DrHb5OcBdgeuuYoIf7SXlmNa1f6DHG91YUpNyU1mpyhb6sW?=
 =?us-ascii?Q?FLuo1jB1kM+POkLJsGzHSp/YK453AL0Lewcggg2aytgM+QZl7CeWDsgX0E2a?=
 =?us-ascii?Q?44bXXcp8JaMPPzCr8BqDcYJ7TX6g76A05TT/RWfN2xvSNxU7pMSrEiLoqKtb?=
 =?us-ascii?Q?WBDsAeNmfhDGrIFeHfu1QFGRGNd65EF8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0ESJ+X95BFeoupRmb8UdiGv0SRKRPl1O8hFgLENHC/TiQdgOwnQsmYMe/UYO?=
 =?us-ascii?Q?Q1a/x3sb3u5wdjTtuHEGgUDYCixKK0KK4fdwtNI4KxNZJLj5O1VPLxtexMnD?=
 =?us-ascii?Q?G2F9yCq7SWSzA89mtNVgF2HJ6JYJtXFE65nAPoHd6DZ4oXPVLU7tKnSz++1o?=
 =?us-ascii?Q?JtbBDf07/rz1Qw+6rnVvayenqaDRrjeXp664GMvh73d30X58JzgITHlb0y2R?=
 =?us-ascii?Q?a2TAsQhJ8dUQpsY90/hQ4lD9cybe5jci6JNjtIcEZ31siePndVP391Hovxkf?=
 =?us-ascii?Q?Qv7D3HMDIoogUk8Q0ujdnN5/3S/UlrPtHshq6DtbPAtwXd9r35nurznoh26O?=
 =?us-ascii?Q?sH2cbWfMk1HlvYHcUI6pBjMbqzCRZAtg6Kr4TcchYtcaGQZbwXkE6vqgVzhd?=
 =?us-ascii?Q?CceY8xk3gi1vDHlKD5A3zYvWe663lyIJvNvmygh2eAW4NAd1n2TvteJt+y8T?=
 =?us-ascii?Q?fhrNcKNibt0c4x3ZYpWZwXKkE4xMK5WTYnxs41ajKUpcVZf5Q3ePoTKgiXyZ?=
 =?us-ascii?Q?3Lj9YJXurtg093g9g8ntczJj07+AlIps/lR+ORoWtL1lWCk4KyJNQBwviEZk?=
 =?us-ascii?Q?Kl+CiSIm/JEB24ZDMxkFSLryYH9LAMPDBTn2lvs7aLDiVWMrEHOUKM1wKGCh?=
 =?us-ascii?Q?HC6Rvw+imrh6kGkfj2XqwtAhHnp1alUa3nU7/ldoEwbZyX00rADH6JtYkWId?=
 =?us-ascii?Q?+hMbxrUSraCWCdXTWVZlVrZ14evid1cnFk5Kh1usdp/JMFpT0J69qiwxLKp3?=
 =?us-ascii?Q?jANSnjdOObEIKXGozNTe640ykKW/PyNivdLfy6uuKtKQfwW9V0LkLIP9i5JA?=
 =?us-ascii?Q?qpBSjuffYM/krdN1Q6YxCCGsm056JNVvgyq6oBAzcDwQ3qlXSp8409Z8oFhB?=
 =?us-ascii?Q?2ySBL+5nJEYuIWtr8gkidrTGcSFHF4k22fcEBddGzuqSY8W6UViUP90mmKuc?=
 =?us-ascii?Q?HHggiw9DPNLv5H671qcJblLuK1jfk5kzttS9IbW9tT7ZabGD7P/WKebtelGZ?=
 =?us-ascii?Q?ec1eWzJv6xeIv1tXLTHHL67T/J3ypLjjZL1yHUvbUhUtPKuhrB1CZLSKuaxt?=
 =?us-ascii?Q?5uc4fSpT8BBhTxOPtPcTttR+VytmXgxxqDqeQ+CaA+6cxDhJawaSqiJA7KNd?=
 =?us-ascii?Q?zyDO3P16VKlCmCU5uHGP9V94VjCj5hlEbicnP1YEnyt6hd6TeuabvTlViWal?=
 =?us-ascii?Q?SQrxSBXLgzNjvg0CJPL7ilK/TjL8QADWpxaCo89lM5D8yl+ZQTB0OYoA30qQ?=
 =?us-ascii?Q?iMYKRDOlw1dNsY7Go/4uxdOfe74Fwu6KoMruY4VakwF6HWEwrFs+3iRHWJkL?=
 =?us-ascii?Q?wUJTPG/pG1ig0cbTj+UfRnRNufZnuMIqreEsIgn3DYRlcngiC3CFohPpjeWH?=
 =?us-ascii?Q?Q23TV8nOOQ/6YbM2i3quAJQbCwM6mOzC/r4wR4Hbr2jnxPnbNxaXs/srjVH9?=
 =?us-ascii?Q?dc1PQWb/RgpgZnO0kXcrxgF9FSlV8BjqFnUBMjtI9q8s5x+cAiWRSfSvcoK9?=
 =?us-ascii?Q?Q9Hs7wIY0hvFaiFSCtvtm9IvDkvDVPNOKZcb5FArDhinj8u+MHLdSL4jdpKV?=
 =?us-ascii?Q?zwqG3xxR3PKiJFO5h4HU/hJs7o62+KwNh9s6IgqcejnrGMB0eKYkhS1XKjJK?=
 =?us-ascii?Q?sQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 370e521b-1fae-4271-efdc-08dd4a79df8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 08:55:45.7998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kI9/AfVaYpf8qWXMTIaEVr3APOl8bA7kpzFMk07NFSL3UefgFg8h4l2BonmECRHecykezoyhe/1XkTftQiOtYRmUXhUM9t4IuE7X4ub/G70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1409

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, February 11, 2025 2:38 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control
>driver
>
>On 10/02/2025 10:07, Nas Chung wrote:
>> +
>> +int wave6_vpu_ctrl_resume_and_get(struct device *dev, struct
>wave6_vpu_entity *entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	bool boot;
>> +	int ret;
>> +
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	if (!entity || !entity->dev || !entity->read_reg || !entity-
>>write_reg)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&ctrl->ctrl_lock);
>> +
>> +	ret =3D pm_runtime_resume_and_get(ctrl->dev);
>> +	if (ret) {
>> +		dev_err(dev, "pm runtime resume fail, ret =3D %d\n", ret);
>> +		mutex_unlock(&ctrl->ctrl_lock);
>> +		return ret;
>> +	}
>> +
>> +	entity->booted =3D false;
>> +
>> +	if (ctrl->current_entity)
>> +		boot =3D false;
>> +	else
>> +		boot =3D list_empty(&ctrl->entities) ? true : false;
>> +
>> +	list_add_tail(&entity->list, &ctrl->entities);
>> +	if (boot)
>> +		ret =3D wave6_vpu_ctrl_try_boot(ctrl, entity);
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_ON)
>> +		wave6_vpu_ctrl_on_boot(entity);
>> +
>> +	if (ret)
>> +		pm_runtime_put_sync(ctrl->dev);
>> +
>> +	mutex_unlock(&ctrl->ctrl_lock);
>> +
>> +	return ret;
>> +}
>
>Drop entire function.
>
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_resume_and_get);
>
>Drop.
>
>> +
>> +void wave6_vpu_ctrl_put_sync(struct device *dev, struct wave6_vpu_entit=
y
>*entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	if (!ctrl)
>> +		return;
>> +
>> +	if (entity =3D=3D ctrl->current_entity)
>> +		wave6_vpu_ctrl_wait_done(dev);
>> +
>> +	mutex_lock(&ctrl->ctrl_lock);
>> +
>> +	if (!wave6_vpu_ctrl_find_entity(ctrl, entity))
>> +		goto exit;
>> +
>> +	list_del_init(&entity->list);
>> +	if (list_empty(&ctrl->entities)) {
>> +		if (!entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC))
>> +			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		else
>> +			wave6_vpu_ctrl_sleep(ctrl, entity);
>> +	}
>> +
>> +	if (!pm_runtime_suspended(ctrl->dev))
>> +		pm_runtime_put_sync(ctrl->dev);
>> +exit:
>> +	mutex_unlock(&ctrl->ctrl_lock);
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_put_sync);
>
>Drop entire function. Dead code.
>
>... or you arranged your patches really incorrectly, but this I can't
>really judge.
>
>
>
>> +
>> +int wave6_vpu_ctrl_wait_done(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_OFF)
>> +		return -EINVAL;
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_ON)
>> +		return 0;
>> +
>> +	ret =3D wave6_wait_event_freezable_timeout(ctrl->load_fw_wq,
>> +						 wave6_vpu_ctrl_get_state(dev) =3D=3D
>> +						 WAVE6_VPU_STATE_ON,
>> +
>msecs_to_jiffies(W6_BOOT_WAIT_TIMEOUT));
>> +	if (ret =3D=3D -ERESTARTSYS || !ret) {
>> +		dev_err(ctrl->dev, "fail to wait vcpu boot done,ret %d\n",
>ret);
>> +		mutex_lock(&ctrl->ctrl_lock);
>> +		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		mutex_unlock(&ctrl->ctrl_lock);
>> +		return -EINVAL;
>> +	}
>> +
>> +	mutex_lock(&ctrl->ctrl_lock);
>> +	wave6_vpu_ctrl_boot_done(ctrl, 0);
>> +	mutex_unlock(&ctrl->ctrl_lock);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_wait_done);
>
>There is no user of this outside. Drop.
>
>
>> +
>> +int wave6_vpu_ctrl_get_state(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	return ctrl->state;
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_get_state);
>
>There is no user of this outside. Drop.
>
>Whatever export stays, must be used by a following patch. You *must* add
>the kerneldoc for it.

I realize that my patch order was incorrect.
I will fix it and include the necessary kerneldoc in v2.

>
>> +
>> +static void wave6_vpu_ctrl_init_reserved_boot_region(struct vpu_ctrl
>*ctrl)
>> +{
>> +	if (ctrl->boot_mem.size < WAVE6_CODE_BUF_SIZE) {
>> +		dev_warn(ctrl->dev, "boot memory size (%zu) is too small\n",
>ctrl->boot_mem.size);
>> +		ctrl->boot_mem.phys_addr =3D 0;
>> +		ctrl->boot_mem.size =3D 0;
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	ctrl->boot_mem.vaddr =3D devm_memremap(ctrl->dev,
>> +					     ctrl->boot_mem.phys_addr,
>> +					     ctrl->boot_mem.size,
>> +					     MEMREMAP_WC);
>> +	if (!ctrl->boot_mem.vaddr) {
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	ctrl->boot_mem.dma_addr =3D dma_map_resource(ctrl->dev,
>> +						   ctrl->boot_mem.phys_addr,
>> +						   ctrl->boot_mem.size,
>> +						   DMA_BIDIRECTIONAL,
>> +						   0);
>> +	if (!ctrl->boot_mem.dma_addr) {
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	dev_info(ctrl->dev, "boot phys_addr: %pad, dma_addr: %pad, size:
>0x%zx\n",
>> +		 &ctrl->boot_mem.phys_addr,
>> +		 &ctrl->boot_mem.dma_addr,
>> +		 ctrl->boot_mem.size);
>
>No, drop. Reasoning further.
>
>> +}
>...
>
>> +
>> +	ctrl->num_clks =3D ret;
>> +
>> +	np =3D of_parse_phandle(pdev->dev.of_node, "boot", 0);
>> +	if (np) {
>> +		struct resource mem;
>> +
>> +		ret =3D of_address_to_resource(np, 0, &mem);
>> +		of_node_put(np);
>> +		if (!ret) {
>> +			ctrl->boot_mem.phys_addr =3D mem.start;
>> +			ctrl->boot_mem.size =3D resource_size(&mem);
>> +			wave6_vpu_ctrl_init_reserved_boot_region(ctrl);
>> +		} else {
>> +			dev_warn(&pdev->dev, "boot resource is not
>available.\n");
>> +		}
>> +	}
>> +
>> +	ctrl->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
>> +	if (ctrl->sram_pool) {
>> +		ctrl->sram_buf.size =3D ctrl->res->sram_size;
>> +		ctrl->sram_buf.vaddr =3D gen_pool_dma_alloc(ctrl->sram_pool,
>> +							  ctrl->sram_buf.size,
>> +							  &ctrl->sram_buf.phys_addr);
>> +		if (!ctrl->sram_buf.vaddr)
>> +			ctrl->sram_buf.size =3D 0;
>> +		else
>> +			ctrl->sram_buf.dma_addr =3D dma_map_resource(&pdev->dev,
>> +								   ctrl-
>>sram_buf.phys_addr,
>> +								   ctrl->sram_buf.size,
>> +								   DMA_BIDIRECTIONAL,
>> +								   0);
>> +
>> +		dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
>> +			 &ctrl->sram_buf.phys_addr, &ctrl->sram_buf.dma_addr,
>ctrl->sram_buf.size);
>
>You are not supposed to print addresses. This look like fixed hardware
>mappings, so probably harmless but dma_addr not. Drop entire dev_info,
>this is really discouraged practice.

Thanks for the detailed explanation.
I will address this in v2.

>
>
>> +	}
>> +
>> +	if (of_find_property(pdev->dev.of_node, "support-follower", NULL))
>> +		ctrl->support_follower =3D true;
>> +
>> +	wave6_cooling_init(ctrl);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void wave6_vpu_ctrl_remove(struct platform_device *pdev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	wave6_vpu_ctrl_clear_buffers(ctrl);
>> +	wave6_cooling_remove(ctrl);
>> +	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
>> +		dma_unmap_resource(&pdev->dev,
>> +				   ctrl->sram_buf.dma_addr,
>> +				   ctrl->sram_buf.size,
>> +				   DMA_BIDIRECTIONAL,
>> +				   0);
>> +		gen_pool_free(ctrl->sram_pool,
>> +			      (unsigned long)ctrl->sram_buf.vaddr,
>> +			      ctrl->sram_buf.size);
>> +	}
>> +	if (ctrl->boot_mem.dma_addr)
>> +		dma_unmap_resource(&pdev->dev,
>> +				   ctrl->boot_mem.dma_addr,
>> +				   ctrl->boot_mem.size,
>> +				   DMA_BIDIRECTIONAL,
>> +				   0);
>> +	mutex_destroy(&ctrl->ctrl_lock);
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int wave6_vpu_ctrl_runtime_suspend(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable_unprepare(ctrl->num_clks, ctrl->clks);
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_ctrl_runtime_resume(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	return clk_bulk_prepare_enable(ctrl->num_clks, ctrl->clks);
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int wave6_vpu_ctrl_suspend(struct device *dev)
>> +{
>> +	return 0;
>
>Why do you need empty callbacks?

I forgot to remove it.
I will address this in v2.

Thanks.
Nas.

>
>Best regards,
>Krzysztof

