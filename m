Return-Path: <linux-media+bounces-39522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCCCB21FDB
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12F514E4A05
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E862DECB7;
	Tue, 12 Aug 2025 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="bZ/g2dfH"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020108.outbound.protection.outlook.com [52.101.156.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3A2DA76C;
	Tue, 12 Aug 2025 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985082; cv=fail; b=ZkReZ0yQa/lyv2KQFQ/NL/2DhxMi1QyRp5ivY3HsDL+1xA4KfQjuz8RYqu3h6GqK9AAdERsyqnjdCRczVLXrfO1qIOEusfgWwu5T2aBpFmgqH0tRo6t7VGx7s/r/8+0w5tCgcYYIeAaP9vwdJHTF2nT2cf8pQ9zEiD5jrWZvkXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985082; c=relaxed/simple;
	bh=q8LBgHwACFZfR9PjZfmR27ccsjg99qYH/2XEZNl4V74=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IB5XDk/VdVJz5PU8KsIaf4Qa3ssNvnDdBC86/dfb1jZTort282VEVcRKVTePQYwLzDAf3wzcQ2N97cvW9tP04wuLJFXdaF5ULmCRGIcoBgvrY2+TGE5csx++Oj1gGAmV42ew8sSwcxrjp3u5/Lwrl0LdPorVcrfZrf2fLLunLLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=bZ/g2dfH; arc=fail smtp.client-ip=52.101.156.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLP+yNhS0i6nQFGQDBut9rjIxKrOXpOApvvv0s+DoM974Nuf+hjgapMGsoa9/aNlEscT/0hAzFC8RyvA0UiGtSD5NPgtnTHrdIwfvrAvvpyBcxsHXMKX/zDEOp48P44JV2vt74koEVm5EqfL2DOcGMKX811CmXk+25ImMAWH/NwNavL2xdAl78BzRR45iDlIF1Y/rORigTlkVAR397MeGeXnYWnto3rUd1qIw/qEamYsrIPRFJfSigTPpJl81ZFEMaSlhKZPPqoz/SAPr4MSA+3RZulpBm04XvvZ9Hcy0LRPbGBBmcqeYsmqLr5B0CmG13zHpS+L8W42AU66RsJl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y0py7SJjvr/8q1Ous78JnJprYQqQSqDLh/aF89tUHs=;
 b=Eti8sTUxrjgTGC0J+g7aCIZoXK1l8Jy2y2VE5Ljj+ppnEKR70Ofaqxr9/V08efAabGBOBax+WpErrPmaEShAs46k1SFn/HkCBEd91xE+7Ijl6P2chVyq0hrsWXSwg2J9f4ISavlOtXHbzZOjhvZgkDWmJo2+mB1BeP8CilP2qj3VeK5MDZTsyTkXG8lk5K3iQqkGREAOBqzz0wv+B/hnS2uYjsxXoaSQiYic2wV+sY0pGV1cESki7o/lYDtbvtzbX0pSf0mGrdrInrNZXgUB+l4shqZT6C3rLf1L+gmUTF/SuUGxTLUbFLOdVCnBFopAiW0q8zjgyYhs26iq9vfspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y0py7SJjvr/8q1Ous78JnJprYQqQSqDLh/aF89tUHs=;
 b=bZ/g2dfHApdToXg9eVz0xn82cJG7JLmvNC6BbXoY+rAD0Oh66VBoyRuFFTOcyMR5Ze6rm12Lvu9SGoD/UuXskhyFK3ae/HZ+w8GK+SQnOikt+z81xF8usXmfvwD2Sb3AMAtlR4ramcRMhGJT2W5/hgWbpq/OQDzWkT1pB2b72sM=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB2148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.13; Tue, 12 Aug 2025 07:51:13 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 07:51:13 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: jackson.lee <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v3 0/4] Performance improvement of decoder
Thread-Topic: [PATCH v3 0/4] Performance improvement of decoder
Thread-Index: AQHb49TXwjYLUfVzYE+ALyQbFMjCk7Ql5KIAgDkPMPA=
Date: Tue, 12 Aug 2025 07:51:12 +0000
Message-ID:
 <SLXP216MB1148D59D42ADEE48A397ABD3ED2BA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
 <SLXP216MB11481D85FC52CE16ADA92849ED4FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SLXP216MB11481D85FC52CE16ADA92849ED4FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE1P216MB2148:EE_
x-ms-office365-filtering-correlation-id: f82d6e74-af06-4618-e447-08ddd9750252
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rQPFVxVBCaaMq9i5eC0xaN7Dt9dAPuQqRgz6HjLM/lEbnpJXxvxwi1laeTWD?=
 =?us-ascii?Q?8mEm3wdTP2/jNjY/l1keqWrYxQE/6D6P1H1rJvoZXuvUHvN9X0D9H+G1OTt9?=
 =?us-ascii?Q?gR2HNMzwDtAJrECOLwRkEdTK8USPlFRIHq4ZEIXaKdHM6AdXqUVwWKviQM+J?=
 =?us-ascii?Q?YHLDcbaFC3evNdH2RsaWfIgdKa3gL//QjmGg/zDzzTZVsKb7MMKrP7W41n3G?=
 =?us-ascii?Q?ej8+9ySNkg2CEv+DN5ZVedql6vdL2Qijrk8sT+ZqNJ85tdZjuuj5Xg7zIwkO?=
 =?us-ascii?Q?Ec1Jyylfzr5pTOBCWMjLzEUB0I3m9o3XC2gkCeBOzngrya2cDKRkxFxYqjiJ?=
 =?us-ascii?Q?aWV8Bl8RbwbdwwACDb8I82EU1+ua4fuZq77Qu/1AyRttynkARv+hj1QHtnvL?=
 =?us-ascii?Q?upjDb/5F3MzgCcTSt04gq7CfdEN3PLePvQqQHKaiHt+fe7ktLwllkibPQXzj?=
 =?us-ascii?Q?6b090bKddGHZpilDO0QMn5p4d5fk1kBYZAeeKxB+6CPFMKzXjBxXPvdtNKmE?=
 =?us-ascii?Q?gH1z3GjYkHLZDMXx7xaAHtnja+P46xyAiCu5lsVqcms8+TRWhPPhvRGKz81h?=
 =?us-ascii?Q?vxIgoERSLVJM6O1YwWFNr9CAGV2KxWLkNhOye2eK4LX2ei9clJh2ZG3rhF7l?=
 =?us-ascii?Q?JoQmLSv7z64Gg4YKS+OVg2sBpBaXcgKkla6e2urSmYUeQKZXeALXYUIdlcWa?=
 =?us-ascii?Q?cjZGQEU/6daZuRU8Sha/ofo7cy334r9I6WnuQIWEODlbQTPAu3QobfdQmclv?=
 =?us-ascii?Q?NWMAjOsTAy9doM0OJ11ErVFNwkCmJ0ndxgTb1z2sndYlQq+DnHxJ9f28TmeA?=
 =?us-ascii?Q?lN69zhxPiCyD3tJ0I2sRCy1keMR9aH3J1DxoqJoi9SbdTZ7M1Z1DySKzBiYq?=
 =?us-ascii?Q?+V946PRjklrW3qjZA/fdg226D5OUtVVsQtWsZNzCjWRul5JQNqtK+quDd38Y?=
 =?us-ascii?Q?GVr9NVn+PF332qzZEw4/qFNOzJF9bPRTpOcXMVA7ml7Js+E7CBIiCBo6Im52?=
 =?us-ascii?Q?7CUiY9I9v3j9eaCsP0EWo+WzitmemZmRnBzqYN6n9eqcK9LV9vHLvdn3dnG9?=
 =?us-ascii?Q?WwCdGG5HKWjX2wTZpmI7UKUyqImxpmd48u0fAZ6VLnQus3aT3xAlyH0DiGYb?=
 =?us-ascii?Q?6i3acvxV1wBKQTaZDeJEDAPAUwMAlrCsN4eT3mlFT0EEcqeApHgn/SNmVo6D?=
 =?us-ascii?Q?G4cTlt8j23lQtLyzn4vaIgOb9O5EB9WPxhD09bCsr7DIQxMkrw2aHV2ckD6P?=
 =?us-ascii?Q?qH41aCsrH1gzL05/psi0lb5KX4jPycBVgAjMMF/D0LIf4OCR8Bq0/bBNXr2f?=
 =?us-ascii?Q?UKf63PAgSGiHjXlmhD9YFo6YSdTZGIWnX7lxrUkDYPyfG8lEOGwmKEbjvnnw?=
 =?us-ascii?Q?vbKxsk3U0mqgjrxX6KMX6bP71Nf3aNoZA8xenQqUGdtGnwOpTYzWyoK6cmCq?=
 =?us-ascii?Q?F9xx949HXQ6zkI89Xo+orNVteLohPO6wUosdhNjB1sDCfa20FOkEmw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?R8w77Bqq32FLfoPo237fpse0OJkP7c29pW4S8f44yCqAKNpi4IWyCBf5u9kF?=
 =?us-ascii?Q?AdWlaSDKXZpNt27Xvpny4ibETgeVS/xE9RHEN8Z+9rtHPCpk9g2MCD9Tt5P+?=
 =?us-ascii?Q?OvXyekX/Yk/4B8YKBzunoVGIJUN5ASkVm5wHymPeeefnf1yPac7OvHqR0b1z?=
 =?us-ascii?Q?F3x3eIrlhebRdYUfC9qpkcmmlRgQc/MWze1k8+uxTMYXDAWzki0lJRIFJKP7?=
 =?us-ascii?Q?BDYaCpKZq6fXv3E5VvGVgeQCSlKZ1utiL9wu1LWoRlziqO7aRyNQhSBPg3hv?=
 =?us-ascii?Q?8ATzFtNVflV20RhVQRjqxB+YLy/48XYcXkXw3VqmWT50PV6DPWMQrgnWkVZI?=
 =?us-ascii?Q?zYEan4WS85ly2lJFwz0KkzgSOHQTFHqq9/a5qsLPqdHtUKS31SGUT1XBsACN?=
 =?us-ascii?Q?UzqaYHxy/BOXX7RW4EzK6Pv32jfH1xtqiMv+i9KeUc54bpozpQh4kxxrOoDO?=
 =?us-ascii?Q?9iZBMdYyYdPyKTJPv/RlOxG9pv5tJMSKYaCok636UQb3knoxV1AnEZJFp7el?=
 =?us-ascii?Q?HwxY0HEtZUssVHeBfE/8deINMgNzEP7l6K1PWVwvNXQlx32I9jwUvF06RvzO?=
 =?us-ascii?Q?Mg6WGOpR+k5zt9F5wrjEWXUCpVDe9RXmgbz0N9M2GssSEATjbXMD4PGfGFoe?=
 =?us-ascii?Q?42NYyeW7St+0RzgnZw9Lwysq08x/t9og6aEGUuhnQDD1W7YS4wabGm0MTh5B?=
 =?us-ascii?Q?EvT1b9K6j5vUoXGFqvRBiG5z9VIInkDtrcdmHnO9q0L0cHvl7kd+D17Akc8w?=
 =?us-ascii?Q?zRvvO8Bab5vypnvAS3H+RFnyXqo/Cr/7sKgf/VPsC0FqrOfIaQxXy3luIc6Q?=
 =?us-ascii?Q?eae91iCCm7Z6yteJSwK/4k8NITgSEAqS/Dt43uB3wSLF8gZNCHhiPm/dZbcD?=
 =?us-ascii?Q?AAcP9vQZNKNXsqwiFWciY7MmKPnZNH6iGtnECqZxvV8E8bKnmHCNnRho3bhi?=
 =?us-ascii?Q?RpBn7mwYClC5Wuf+Sm07qSc0OCMWTeFhNHPQNkeXdxlqPtvFRaFJNWgTL5aD?=
 =?us-ascii?Q?wgZVRAeNII6XX513dnbqXUw5CNuprjut+CyUqmHYdTyaajUIV2IOh64c31WU?=
 =?us-ascii?Q?Ehyfai3obSUm2DXRRwHdLfjTz9DRwyXmmQBzoqFr+OqCxxYB14Yxo9JML/hb?=
 =?us-ascii?Q?hyiilpjnFMd0XsuWAmuoHPkopBfxWfXq2h8aD0u3bi1zXt1zk4wdhS37a3xZ?=
 =?us-ascii?Q?1erF0CHWC83vseaukDJhOV8nOMNgO2kznC/IKetiBmD61NYxuXwixx5Ekg83?=
 =?us-ascii?Q?OM5yg+npx5h7qTWy9YsQLEVc+GOyhfK3Fzbm4gv5yE3OojtLaw1U0ZjgTsSb?=
 =?us-ascii?Q?A54omhrYxmMKbLWlwvvMvyMs8LX3LTB/vsrQM00j338WJrAvOvQRM3CdJrs/?=
 =?us-ascii?Q?qljW85sU3XnYXOotQTQVOiJM8unqZOa13AbwUzqBE0cqx5cdXkRy7VCO5ae8?=
 =?us-ascii?Q?jSQy01qvdQ0A0dVGJPpllBzuJDsqkeJ8BWYB+6SHFQXwEIfHlwiClnxxYUeA?=
 =?us-ascii?Q?VVd/fELH0myjxGVPBcYrSdtrpjNcUT7AYTfHPCNO7T65MCW+FFTQIBFz4Ma3?=
 =?us-ascii?Q?59RMEqFRCkDcE0i3kxY39nsoXr+noqOcbBfWo2CG2+OEjXLkmulv5y2MgoKa?=
 =?us-ascii?Q?2Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f82d6e74-af06-4618-e447-08ddd9750252
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 07:51:12.9610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HofLMXXi9FkS3+62AUG62DSTMQuewP5Bi/3Hk2UkCK9pwlyJUnMvMheLVF5oaNg3CwCrvXq8c3iL+rs46+vqWB+SC4pqZTMPDXPshxWWkpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2148

Hi Nicolas

Can you please review these patch series ?

Thanks


> -----Original Message-----
> From: jackson.lee <jackson.lee@chipsnmedia.com>
> Sent: Monday, July 7, 2025 9:37 AM
> To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> nicolas.dufresne@collabora.com; bob.beckett@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; lafley.kim
> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; hverkuil@xs4all.nl; Nas
> Chung <nas.chung@chipsnmedia.com>
> Subject: RE: [PATCH v3 0/4] Performance improvement of decoder
>=20
> Hi Nicolas
>=20
> Can you review these patch series?
>=20
> These patch series includes the below changes as well.
>=20
> 1. The explanation for change of Fix Null reference while testing fluster
> 2. Reducing the active loop because of overhead and explanation for chang=
e
> of Improve performance decoder 3. Making new patch set in order to check
> EINVAL and add a warn_on around it.
>=20
> Thanks
> Jackson
>=20
> > -----Original Message-----
> > From: jackson.lee <jackson.lee@chipsnmedia.com>
> > Sent: Monday, June 23, 2025 9:22 AM
> > To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> > nicolas.dufresne@collabora.com; bob.beckett@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > jackson.lee <jackson.lee@chipsnmedia.com>; lafley.kim
> > <lafley.kim@chipsnmedia.com>; b- brnich@ti.com; hverkuil@xs4all.nl;
> > Nas Chung <nas.chung@chipsnmedia.com>
> > Subject: [PATCH v3 0/4] Performance improvement of decoder
> >
> > From: Jackson Lee <jackson.lee@chipsnmedia.com>
> >
> > v4l2-compliance results:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> >
> > Buffer ioctls:
> >                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS
> > not supported
> >                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS
> > not supported
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test CREATE_BUFS maximum buffers: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK (Not Supported)
> >
> > Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
> > Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46,
> > Failed: 0, Warnings: 0
> >
> > Fluster test results:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Running test suite JCT-VC-HEVC_V1 with decoder
> > GStreamer-H.265-V4L2-Gst1.0 Using 3 parallel job(s)
> > Ran 133/147 tests successfully               in 40.114 secs
> >
> > (1 test fails because of not supporting to parse multi frames, 1 test
> > fails because of a missing frame and slight corruption,
> >  2 tests fail because of sizes which are incompatible with the IP, 11
> > tests fail because of unsupported 10 bit format)
> >
> >
> > Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
> > Using 3 parallel job(s)
> > Ran 78/135 tests successfully               in 43.364 secs
> >
> > (57 fail because the hardware is unable to decode  MBAFF / FMO / Field
> > / Extended profile streams.)
> >
> > Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0
> > Using 3 parallel job(s)
> > Ran 25/69 tests successfully               in 40.411 secs
> >
> > (44 fail because the hardware does not support field encoded and 422
> > encoded stream)
> >
> > Seek test
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 1. gst-play-1.0 seek.264
> > 2. this will use waylandsink since gst-play-1.0 uses playbin.
> >    if you don't want to hook up display,
> >    you can run gst-play-1.0 seek.264 --videosink=3Dfakevideosink instea=
d 3.
> > Let pipeline run for 2-3 seconds 4. press SPACE key to pause 5. press
> > 0 to reset press SPACE to start again
> >
> > gst-play-1.0 seek.264 --videosink=3Dfakevideosink Press 'k' to see a
> > list of keyboard shortcuts.
> > Now playing /root/seek.264
> > Redistribute latency...
> > Redistribute latency...
> > Redistribute latency...
> > Redistribute latency...
> > Redistribute latency...aused
> > 0:00:09.9 / 0:00:09.7
> > Reached end of play list.
> >
> > Sequence Change test
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > gst-launch-1.0 filesrc location=3D./drc.h264 ! h264parse ! v4l2h264dec =
!
> > filesink location=3D./h264_output_420.yuv Setting pipeline to PAUSED ..=
.
> > Pipeline is PREROLLING ...
> > Redistribute latency...
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > Redistribute latency...
> > Got EOS from element "pipeline0".
> > Execution ended after 0:00:00.113620590 Setting pipeline to NULL ...
> > Freeing pipeline ...
> >
> > Change since v2:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > * For [PATCH v3 4/4] media: chips-media: wave5: Improve performance of
> > decoder
> >  - squash v2's #3~#6 to #4 patch of v3
> >
> > Change since v1:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > * For [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
> > decoder
> >  - change log to dbg level
> >
> > Change since v0:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > * For [PATCH v1 2/7] media: chips-media: wave5: Improve performance of
> > decoder
> >  - separates the previous patch to a few patches
> >
> > * For [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
> >  - separated from the previous patch of performance improvement of
> >    decoder
> >
> > * For [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever
> > state is changed
> >  - separated from the previous patch of performance improvement of
> >    decoder
> >
> > * For [PATCH v1 5/7] media: chips-media: wave5: Fix not to free
> > resources normally when
> >     instance was destroyed
> >  - separated from the previous patch of performance improvement of
> >    decoder
> >
> > * For [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel
> > panic when closed
> >  - separated from the previous patch of performance improvement of
> >    decoder
> >
> >
> > Jackson Lee (4):
> >   media: chips-media: wave5: Fix SError of kernel panic when closed
> >   media: chips-media: wave5: Fix Null reference while testing fluster
> >   media: chips-media: wave5: Add WARN_ON to check if dec_output_info is
> >     NULL
> >   media: chips-media: wave5: Improve performance of decoder
> >
> >  .../platform/chips-media/wave5/wave5-helper.c |  23 ++-
> >  .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
> >  .../chips-media/wave5/wave5-vpu-dec.c         | 139 ++++++++++++------
> >  .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
> >  .../platform/chips-media/wave5/wave5-vpu.c    |  71 +++++++--
> >  .../platform/chips-media/wave5/wave5-vpuapi.c |  37 ++---
> >   .../platform/chips-media/wave5/wave5-vpuapi.h |  11 ++
> >  .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
> >  8 files changed, 219 insertions(+), 73 deletions(-)
> >
> > --
> > 2.43.0
>=20


