Return-Path: <linux-media+bounces-62420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C7ZH7PHDmrsCAYAu9opvQ
	(envelope-from <linux-media+bounces-62420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:52:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 211135A1805
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2927C3036E2C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E81366079;
	Thu, 21 May 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="XOzGhyHk"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020115.outbound.protection.outlook.com [52.101.227.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B1735674C;
	Thu, 21 May 2026 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353348; cv=fail; b=m484aDw0b4kAjVXDXgpVrkqeD6OmJQ2zV/VIpGOYEWbjpy0W6DK98joB04gVw6YhbkVeXXpezg6Usq6nWUjMAh1kJS6pLveWBTC5onghxVbo57nMw3eKcPD9G+KSjQxFms4tCM/5Th2v1ToAbcc5vrnuQ0hHYuq9EqEOsV2ggt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353348; c=relaxed/simple;
	bh=LyDePNw7sysKs0/Ve/Lc3r+O7ENFrzFt0bUsy+clS3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M/FRlouv2OSS6YKQ637pN7K7leus0oqDzCAB/DJVYkuIMiVTbUR28ueN6XN3jJ7iXz/raxcrlwOn2v8dl5hkybCTiFCGxOdqs2V+KFgDi0sVTXjVp2ztosoiGhTzDOGRweJ3EE8C6IV0WkAbyWlBx889BqnkxD8S8MmKLrwnG9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=XOzGhyHk; arc=fail smtp.client-ip=52.101.227.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnpqFAmtXLBnNw4Lr2683+eNslRub5YXrjGWCaqRG3t4DcSNl4XVD0phJhcOqcRM9YOmdU4r0lCQbLEqtFRpRr4Al5J8YFDhgZS1QZyU9jUcmlPT/9EWcO8tspbDDQ+huyHsC3bN+zigsW5DRmnto4zfQhyr0S2HmXNp73lFRWszbMtPDKMllrhVEh0mSQRTPmmEd6VTyRl5/rQaIkkRb17Hn401vHcHDkJWELsHiqIGvx4n5nZq2ShYykhKclaf5Tl+BLejjAqIt/akQkeUVLZqf6VftAUatzfdT6GmmdbUuvjslMQhsVk06RnJSJsIyIU02VM9NVf5aFET95441g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvYsrcSZn5v4nlrlj91O9XBlGWp9ujXboarsv8MWCjM=;
 b=EbLCt2VF3oZiuFVIGMah3RVF8e/TJrgZDNsKMNBcQgH8Vv04VsMILTabUuOO4YuUfyH7NvyP715YunhlvwPFzmK3FwkQbbWmWi2hFRDyjzzrV6rBnwnCUZLed4Q0OgvYMulYYuGxhUDzcy5i8eBBGaDD2U9X72s2uqj98UtV11F2/x5EJmhHzTCB69i3rdja09Sbp0bkrMNa61dCJ9p8h98NSfpVbvqtKo62St4kRdTs5Rv/alNM18kAGEdfjqot94PXmhgMrHry2SWF4LivVg/sRdSn3RaWvkSnd1L2qAaYZpgnBiwIBnkx0xqTb6sDYgO8ssm+bBfSHbx6t6Xq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvYsrcSZn5v4nlrlj91O9XBlGWp9ujXboarsv8MWCjM=;
 b=XOzGhyHk/to4OOvY2JdgsX9+arStJJgJ5YuN7zfGJCyv8FbqNxckuBycJePsjRMaQL5LIRmN3aE5L6ciDh3JFv27Qevtw82THe57THNFtTarPePQ6ATe8wyuvFQAf8xkfIPjY1rx3BXFOtx9cKc9xdePtEWKAooMpxy7op9UGJ09xFm0IeIf5ihe51PJo+duLyiFhjyZjrr62xDnIS9U42oBS/CbhoDsb2zPrKYXiaN6dCsFmFjGj2ZSU9WfVo79NVbRnshUZd/Yt8uKH3BhbKjZeeNXxz8MOb8gP5am9FJsH44MEJthyOau1+s3IQUXbAJoSnO8GqkThlwdUDsKHw==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB4399.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:171::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 08:49:03 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 08:49:03 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Luca Weiss <luca.weiss@fairphone.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Thread-Topic: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Thread-Index: AQHc6E/U4dHYsFuXQk+qLRmtTqnLNLYW0+oAgAFYstg=
Date: Thu, 21 May 2026 08:49:02 +0000
Message-ID:
 <PN0P287MB20198BAD2C608DE7E0D982AB9A0E2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
 <DINHVCP2GI7N.2AJJFB3CM2DHN@fairphone.com>
In-Reply-To: <DINHVCP2GI7N.2AJJFB3CM2DHN@fairphone.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MAUP287MB4399:EE_
x-ms-office365-filtering-correlation-id: 171a49a6-839d-402d-886f-08deb715cf17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|18002099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 a0dWf7+HhosiGgjGM3bsU2rUZStuHsQwAvSqv03N9GXtTraeIAzNqVAa0L4UP503Xr9alKNkPans2I9jfVGc3+b5AnLsoFh1bTyh/eAfOjFZ2alje9PVwz0WRlkTGur0dbEP1iZB/7vyRGcoVzbY7b39eYi96T0ZURj7FRHf3jxErqigl1BU+IzhI2swgicDdyH0c4DfiEnr9NEkoTj31AqTH4XBjolXSCSog8HRT0dWyis9WPOLzxUNQ/B1gS7wCEEbyelKj5QWbQJ/YgNoNajdl4JsiAikME4M/JhuZwSMGekLNLXao16hjGUfEW+S0i3u586JSKsZNNhfaXeAX+16DRPpB3w2nk6NMw8TPyvl5ixaq98QeaIaDk0FYRC/TVOqxuU7FLjQnfYOtwjRc/g/Egvmee/TLjgWA1I/ojwYCLt0F8mFEhp9dptQMRTjSJcV+26aSFI7oDBjy757RC22sAa0hTyqkXWFGrnxCqCssGvqxV41utpgZrvyIaQ+9jEZLmtt1mIJqpLzPhNwgA1+SJFX5YMf+X2qJm9GhnsfpgmWAzt+8qOJKwWK7U6HOagp79MPfn5g66poV6bdRIgzIDoz+3bfnd75keFpNo8eG3wI5W20KqbVen6xjzMyBPDMYk0QMLd4g9jiB1A/ACxFjI2TXIZPk80dE552PbCekV7cW4njEf2BwKDEefSjSuK/wdmUD5/6Bc3Vk0llffNgQU966sM0RF6OTXaY0FOYxmznFNepH4NEEatncCUz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(18002099003)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?FiCRcTOHnwq9leosiuBZ6nZkGZCaqn195UVx2K1583STmtzztOCdZKON?=
 =?Windows-1252?Q?bb1HhD4gYa4ctgqiB1CFZ/0tK2cUR3m+ru7vHBQ+uE1pRbcFRde7PJ1S?=
 =?Windows-1252?Q?T5xDi/YrhL2HGRopw6ORXjQB/fZD7lcOd6NQl3VBUCOGkE5496pWeT9a?=
 =?Windows-1252?Q?CPAnFEKkSWnT11rbhdjFXP4yKfyCmpeJhkUSskPEIpWqScRFoaar1B6R?=
 =?Windows-1252?Q?Q0ij+5PlF17VIS07JKL2J3jJjzQY0NQdiXJJVHJpk9GMO48uckbx/oD3?=
 =?Windows-1252?Q?zN6XgduxCJfo6W8/lbbr4OFFBemk4lfqxeAHGnOCbGOXJ9EWnAEsMjVN?=
 =?Windows-1252?Q?Js9S5dwDZ+LXqjd5P9SmdktH0RPP3xdXXUTcRib/QSY+lJOkXTSR8inV?=
 =?Windows-1252?Q?Bj+7X3rIoK7zoCtLNHJyG2AMcF+78I4oaEfUTKFR4hCfmL/JgP+eQ7gz?=
 =?Windows-1252?Q?7nSwFKSr4X55RlDIgO2bvWSmMuFMcnZGoXRYIksm2DFGN3LX1p1MbitY?=
 =?Windows-1252?Q?8hqzxWDuaBKP4KIv+bSRVjlaNs2xMOz1hPpRury5X2qDNM1aZleJZfou?=
 =?Windows-1252?Q?m+Iy6dEzWOmnl/vRktgOTmPxIA7JXYIlBTLaGLtH3YSuqBtCXbugNVPt?=
 =?Windows-1252?Q?5GuZuIyfG09SRj4TRKQWJLYwH8t9r2LztkRI/JvAnxqtz0p2b22LXCeb?=
 =?Windows-1252?Q?8bSXyKTja4SKrvHcqpURRh9u1nxeXTq9d7/ZMVtgsPciD1Tdc2Spxs9j?=
 =?Windows-1252?Q?Qn948qDYQHXa9cetso23Wm9asOwleum/VVIR4rtF633xI4fOKVT+9BH0?=
 =?Windows-1252?Q?Khdx4DovxglNmB50NNAWgoyiV7lX2V1oCeZ18oNRjrCDr7gzDEqZnX8a?=
 =?Windows-1252?Q?tBhm0rd/ATE3ygALKvDhkxfHHPy9RwRynYGN0ugS9OThASZMOpDyAFk5?=
 =?Windows-1252?Q?9R0TCm2zE1/kysHiHzceltZVbmaZ0UNOHLAjrmZBSfZMbJiVpMQzC4RM?=
 =?Windows-1252?Q?p4qnn0Gs4rXkuT7Vr5eOHe7O31G1L5LQ52odE1RR0wpbCecmRPuSxyey?=
 =?Windows-1252?Q?5wok0OVyQDRpJiYtdTCs4FVGJxiHhLMT6VC/c76XPEJMQGV6Blj8lz5X?=
 =?Windows-1252?Q?mboPbFb2G+FCORT45dJwni6hBObVGhH3nSXUHA14DpBWcvRUblCU+z6x?=
 =?Windows-1252?Q?+DtsXB5S0RlZghAneAZTZa6+rzgyq5l6L0biX5aip0Vfz8IlhNGCjzJ/?=
 =?Windows-1252?Q?uhn01U7IuKjdlpmpF1UaIJIkjw8492bpBPHZ+jlLZRQHx/yVsFTtnqJe?=
 =?Windows-1252?Q?Ky1ompWp9R8DfSzEL8+Q5t3B1pTEld5TLTlUpGhJZBqWO+w4Xpat3si6?=
 =?Windows-1252?Q?meG2HRWEGJMBEGgzw1PLoXWSKgxydm62rFV9Q4weTAcSAl9KG31ZZZOV?=
 =?Windows-1252?Q?AR9advgN29Z9JnqdA5Xji6jsU37X2fJJXGlIbonHrlmVlpcZAPpB968f?=
 =?Windows-1252?Q?GwRYLnixXK51pVW2KtI7pXVG4H5iCy1l2E2Jvfcrsx8TB1FEFZGW+boR?=
 =?Windows-1252?Q?xma9rwuJ6r6k3iNNS1onELPIs4zK6GHtMWPFaKLMkQY1BS1OvKEd1I0e?=
 =?Windows-1252?Q?ipywFSNjtiOKqLMRLSa6j8ODlVEWYtucO/KLQvvUMeQfB4Y3yTBTVP4v?=
 =?Windows-1252?Q?LwhayVx0lrKI5p8+909ol2N0BzeYSnEABCayRb5R8z7wNzIp1mq9c8Ud?=
 =?Windows-1252?Q?ocgsdNzDmbMbV7X8SXcvO1nqt0G7bwI4DRKH37r1kl6clmqHH/od9fKq?=
 =?Windows-1252?Q?24yiAV4a6zdj2g9bJgzs7my6bnKl16s0uAxv29UQi+9EsEfIdoRgOSSB?=
 =?Windows-1252?Q?zLaXyPBDYLcMine5hlFkTdSV1ZQ+aaQBrxs=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 171a49a6-839d-402d-886f-08deb715cf17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 08:49:02.9382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OC8JF49v5pXDTB6wufwvbk9m/ZuLYZ+cZ8CK+PA+xAm3VVQ8Np432gQ37usJRG8aOPIDGBgLk4vGhtC9dhmCIsfRhhu10YhII5iaqTKxY+VcbnAs8s9BDXDeODxd41A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4399
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62420-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.50:email,siliconsignals.io:email,siliconsignals.io:dkim,0.0.0.3:email]
X-Rspamd-Queue-Id: 211135A1805
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,=0A=
=0A=
>Hi Himanshu,=0A=
>=0A=
>On Wed May 20, 2026 at 1:56 PM CEST, Himanshu Bhavani wrote:=0A=
>> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
>>=0A=
>> Add device tree support for the Sony IMX576 front camera=0A=
>> sensor and connect it to CAMSS via CSIPHY3.=0A=
>>=0A=
>> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.i=
o>=0A=
>=0A=
>Your Signed-off-by is missing here as well=0A=
=0A=
Noted, I will add it in the next revision.=0A=
=0A=
>=0A=
>> ---=0A=
>>  .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 54 +++++++++++++++++++=
=0A=
>>  1 file changed, 54 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/ar=
m64/boot/dts/qcom/sm7225-fairphone-fp4.dts=0A=
>> index 3964aae47fd4..5fb0f3eddf66 100644=0A=
>> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts=0A=
>> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts=0A=
>> @@ -17,6 +17,7 @@=0A=
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>=0A=
>>  #include <dt-bindings/input/input.h>=0A=
>>  #include <dt-bindings/leds/common.h>=0A=
>> +#include <dt-bindings/media/video-interfaces.h>=0A=
>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>=0A=
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>=0A=
>>  #include <dt-bindings/sound/qcom,q6asm.h>=0A=
>> @@ -547,6 +548,24 @@ vreg_bob: bob {=0A=
>>  	};=0A=
>>  };=0A=
>>=0A=
>> +&camss {=0A=
>> +=0A=
>=0A=
>random extra newline=0A=
>=0A=
>> +	vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;=0A=
>> +	vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;=0A=
>=0A=
>If you're already enabling that, please also add the supplies for the=0A=
>other CSIPHYs (0-3).=0A=
=0A=
I will add the remaining CSIPHYs supplies as well. I initially thought they=
 were unnecessary since only IMX576 is added.=0A=
=0A=
>=0A=
>But also, since camss for sm6350 hasn't been merged upstream yet, this=0A=
>patchset depends on=0A=
>https://lore.kernel.org/linux-arm-msm/20260216-sm6350-camss-v4-0-b9df35f87=
edb@fairphone.com/=0A=
>You need to declare that in the cover letter!=0A=
=0A=
Sure, I=92ll mention it in the cover letter.=0A=
=0A=
>=0A=
>> +=0A=
>> +	status =3D "okay";=0A=
>> +=0A=
>> +	ports {=0A=
>> +		port@3 {=0A=
>> +			csiphy3_ep: endpoint {=0A=
>> +				data-lanes =3D <0 1 2 3>;=0A=
>> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;=0A=
>> +				remote-endpoint =3D <&camera_imx576_ep>;=0A=
>> +			};=0A=
>> +		};=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>>  &cci0 {=0A=
>>  	status =3D "okay";=0A=
>>  };=0A=
>> @@ -582,6 +601,34 @@ &cci1 {=0A=
>>=0A=
>>  &cci1_i2c0 {=0A=
>>  	/* Front cam (Sony IMX576) @ 0x10 */=0A=
>=0A=
>Remove the comment now since you're adding the node.=0A=
=0A=
Noted.=0A=
=0A=
>=0A=
>> +	camera@10 {=0A=
>> +		compatible =3D "sony,imx576";=0A=
>> +		reg =3D <0x10>;=0A=
>> +=0A=
>> +		avdd-supply =3D <&vreg_l3p>;=0A=
>> +		dovdd-supply =3D <&vreg_32m_cam_dvdd_1p05>;=0A=
>> +		dvdd-supply =3D <&vreg_l6p>;=0A=
>> +=0A=
>> +		clocks =3D <&camcc CAMCC_MCLK1_CLK>;=0A=
>> +		assigned-clocks =3D <&camcc CAMCC_MCLK1_CLK>;=0A=
>> +		assigned-clock-rates =3D <24000000>;=0A=
>> +=0A=
>> +		reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;=0A=
>> +		pinctrl-0 =3D <&cam_mclk1_default>;=0A=
>> +		pinctrl-names =3D "default";=0A=
>> +=0A=
>> +		orientation =3D <0>;=0A=
>=0A=
>I personally like adding a comment to make clear what '0' is:=0A=
>=0A=
>		orientation =3D <0>; /* Front facing */=0A=
=0A=
I will add the comment.=0A=
=0A=
>=0A=
>> +		rotation =3D <90>;=0A=
>> +=0A=
>> +		port {=0A=
>> +			camera_imx576_ep: endpoint {=0A=
>> +				data-lanes =3D <1 2 3 4>;=0A=
>> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;=0A=
>> +				link-frequencies =3D /bits/ 64 <600000000>;=0A=
>> +				remote-endpoint =3D <&csiphy3_ep>;=0A=
>> +			};=0A=
>> +		};=0A=
>> +	};=0A=
>>=0A=
>>  	eeprom@50 {=0A=
>>  		compatible =3D "giantec,gt24p64a", "atmel,24c64";=0A=
>> @@ -1115,6 +1162,13 @@ platform {=0A=
>>  &tlmm {=0A=
>>  	gpio-reserved-ranges =3D <13 4>, <56 2>;=0A=
>>=0A=
>> +	cam_mclk1_default: cam-mclk1-default-state {=0A=
>> +		pins =3D "gpio30";=0A=
>> +		function =3D "cam_mclk1";=0A=
>> +		drive-strength =3D <2>;=0A=
>> +		bias-disable;=0A=
>> +	};=0A=
>=0A=
>I think I was told before that this can go into the SoC .dtsi=0A=
>=0A=
>Regards=0A=
>Luca=0A=
=0A=
Right, I=92ll move it to the SoC .dtsi file.=0A=
=0A=
Best Regards,=0A=
Himanshu=

