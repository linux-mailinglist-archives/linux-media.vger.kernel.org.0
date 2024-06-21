Return-Path: <linux-media+bounces-13894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4855D911CF4
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1FBA281D78
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 07:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3181B16B3B0;
	Fri, 21 Jun 2024 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FXTThvze"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-SE1-obe.outbound.protection.outlook.com (mail-eopbgr810117.outbound.protection.outlook.com [40.107.81.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F15F14038F;
	Fri, 21 Jun 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.81.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955421; cv=fail; b=CGs18DfZ3lkv37XR2A/Dfl3O1HUvLbHhsCoe3aIRKmeb+Mh1AkFuPhZBwDns+KHN3T2jNEnKlvB3BTKmDrjp2q8O7Lw50G7E5VjKehX10HWqp150r9gtUJuasQ40Wbwxm9anA8ak0i1NpqYa9Yibr6AWzW0tWeQnLPPTP4yZun0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955421; c=relaxed/simple;
	bh=SOWdhHUBF//SbWPvJybKcq9Q2k+5Q2rBr/Vy3rvh7hE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kgo7RGKshFR95wOAdqEBe2Y5OXMDDb6QEF5piDQGFoVYzbeX6/c/qKDUDvy9bIcPlGaXY2kAE1i6XiTwWYIiA9ggfq4QBjKXz+JrFaeCgaOhEC97RLu54Rc+7HRFYBoUvIfwb++Hsw3YRXoUdIjFai+4xqy6B1zWQEOQPS6nPE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FXTThvze; arc=fail smtp.client-ip=40.107.81.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IunPEnAtk9z2/Sn6bfhhbrLmvWWV3/p+Jd2zgbF/GYfRpps0U5RZai2M7rbf0DRlNkCceGlrREJYz9hIaOAym9dZQo3dnMXSGCT3+Zrl1Wl1LMwMVLXvrCLdmhvxxTnvtQmNkuloB+lXeDtn39FAkwWc+IP2xBaP+b930OcQmQcEV75Mwsl8WR2DS9eyK+/cGp1sC9CobBfTeS2yZbJlcBEGsEtyrCWzP9I92N9V9nE3Fi54GPjgn4tHZcoAtoLejzWn39fld2ay1idd20OvvTQFiYjR6CH2o7oB1yCiUTz4F04QkGSoyryeU03o7NKipuZgQUgKCZFo4paZuBvvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOWdhHUBF//SbWPvJybKcq9Q2k+5Q2rBr/Vy3rvh7hE=;
 b=gXC3CfVOzFyUGDlFmmqBw2qil1S0X9jA+dZ9+gwCh4L1j/f15v3IawlxWTLXpSanvgO542zq598tZkQvyb7stvm1g1N0gLofgGxKZBAxY5HYxnfmHZ/nEBoRn+vuE9bqFDzNAOW7Kh4McXVS+LgJ1+vJ3TUKi2S7SghVL33FLLctEjFe6b0K8CR/gihZM71ZZnbDtMoNt/Jvlll/Pp3CoAA3Bg1sc/hnC4gS/IxpCegluwmfBhPIJnAeOrnfG7clR0A+J/VD6r+/2l4cEe5585VcZPkdHwEr9yKbxPMs3LhCTS5Xbjz17oePtMt+K1ky3iR6eS6Mzz6D7ZdMPYGhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOWdhHUBF//SbWPvJybKcq9Q2k+5Q2rBr/Vy3rvh7hE=;
 b=FXTThvzee5O9lPaLvVM+A+jBe+Bcw3ZULIEHt08bNKMggy5FM9hI9CFEGLR/x99QJwdatf2VJUTVMKII2QX49CDxeEJEdSRMsUh/o0VUUMEnFNLC9q2e8v7GEff3dyibKQ5qkVzUBIjnktpGH6/nxry+dlZwzpqW4WvL+fktD3Q=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1802.KORP216.PROD.OUTLOOK.COM (2603:1096:101:103::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.22; Fri, 21 Jun 2024 07:36:55 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 07:36:55 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Devarsh Thakkar
	<devarsht@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index:
 AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbCAAO+vgIAADcmAgAAIyoCAAQ1FcA==
Date: Fri, 21 Jun 2024 07:36:55 +0000
Message-ID:
 <SE1P216MB13035CA964E69CD4BDCB95BCEDC92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <bc8796ef8107507e99df079f6d7ce2575ead3cab.camel@collabora.com>
	 <1cefd686-2eb2-e0b2-0b24-2c4efb0c41a1@ti.com>
 <0b84bd4640c4c7ff52d1452d73e1ba46f6cedd7d.camel@collabora.com>
In-Reply-To: <0b84bd4640c4c7ff52d1452d73e1ba46f6cedd7d.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1802:EE_
x-ms-office365-filtering-correlation-id: 6a3d8d03-0242-40e2-a40d-08dc91c4ecf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWJWSnNaRWF1OXdmaG1yZ2QwUWdSVlNXMnVXa29KYVcxNFIrRW40Q09kRlFs?=
 =?utf-8?B?ekViVUphei9FQ05EZHcvOUY0bkdOQnpDYUVVSlNTQldkZHdlR1hndy8zUXl6?=
 =?utf-8?B?S1lvcjIvTkk0K2FVQ2dmeDFhd0FraVAwaEQwMDRFc3dlOGxvQU9CSjRUMlZw?=
 =?utf-8?B?bUlXd0FCQ2RvOG50MW0xOThyaTdDQ0tlN3FjblRBLzlNYkRaWlpPRnNoS3h5?=
 =?utf-8?B?eG1hUk50d2pTSUFGN0NBYzRKVDRMU2FQUTBYczVCVEY4V0QwdStPU0tNK3Ni?=
 =?utf-8?B?UG02RGRqTDZSb2NqbFNWb1E1Q3kwM2xOd3kxNEZsNkV1RUFTeVY2RVgxSFg1?=
 =?utf-8?B?TGJjRGFzMExNaXJUSEJFckRTelhwYTdOamQ2U0UyUmpQUHpXWGhLRmxMNDNj?=
 =?utf-8?B?a3JnbHo1WWhIYk5ZODBHbVJsL1VUcUcwdm0rUDdySUZTRkRaVzY1MG1EOExq?=
 =?utf-8?B?aTRwdDN1cUNocFBVbkdWbTcvVW1GWmhSWHlVU2I3RWsvVzFlcVpUZHRWenB2?=
 =?utf-8?B?dXVMRmZBRWJGbWYzY1N0ZlBsUXVEZHdTaE9Jb2ZBbC9pajI1cjltU3RvMGtv?=
 =?utf-8?B?V2hwZnQ5VzVWQ0lBL2s1SElGckJBRjhHYVFicDZKNzBMWEpLN2IrT2JkdzQ4?=
 =?utf-8?B?MFgzVzI3Skd4MTRpbk1ZMU9rb3l6T1M5anNlRU8yZldmMXhCNnZxRVY1S1JP?=
 =?utf-8?B?TUV2OG5CRlZkUUZMd21CdjVDdGkvcEh5UDVXcGkxMitVcGFqWE42NHJtT3Nr?=
 =?utf-8?B?cGIrSGxvcndlRm1sY3RKSWQvMEE5SFlMZXFoK3lOcUNlZXZSaVQ0MXV1SFA5?=
 =?utf-8?B?M05hVjJ3TmZmS3lUY3RBL2tHVUxKSm5rdnBCa1F3bGxRWXNDTkNHQkgyZ2I1?=
 =?utf-8?B?TGRnM1pJcGN6dHVKMFhOQk9DekFyclkwZDBIUVpMbEc5MXhDNWlaSFVGMG5N?=
 =?utf-8?B?Sm40Y05tbXVLYlA2ZTlKQzZmWWl5SmpvVFprTEJVNUlMTFdIMDhsT250YzRE?=
 =?utf-8?B?RndhRGcwNFJPUEh1cjRNVzdRM2xodExMZEU0N2h4RnJPZVMyejZ6THJtZlNx?=
 =?utf-8?B?MnhwYUJIZm5tRkQvcFlncGVtMGtyMTIwZHQyYitxTG5BRTFsTnpVRXV0Q2Zy?=
 =?utf-8?B?VUJmMngrZjdPQ09CVytnMTV2MzhSblJpSDRKYkZXT2tpL0VkY1ZGOUR4cTNp?=
 =?utf-8?B?SDExYlpHamh2Y1Y0Mis4cE1uc3psaVlkWFZhemsxYVlxZHp1UmtreW0raUNG?=
 =?utf-8?B?SmpzRmNnQ0RES2hQSzlqbFVnR2ZxS2ZDK3FFKzlDdUlLam5Jb1ZDaktkTjZG?=
 =?utf-8?B?djRTNG1nK3FuODBGTDBoYTRlQUNEZG5nVVNMZzFLbUFDaWZTV093c1dVRlA0?=
 =?utf-8?B?c2ZVRFZpdDZIcmg5bzhJOHcyaUViVHRmVkdhc1RhWjFIM1orNTlZMXgxcWh2?=
 =?utf-8?B?R3MvS2JQNlNEWHpJdWNBaGtpZm1FU0FaVGJiRXpJU1VMSFk2aktJTVJqemJI?=
 =?utf-8?B?cVZHRmgyb0dpK0U0YjA0Wk1HNjFBeEx0aktCVERSc0NJY0I0cFRUak9wVGxV?=
 =?utf-8?B?TnBOb0tIN1h3VFh3b1N4eEs0eGZEWmk1bUNNK2RoY3FVNm9CbDRDRmN6bzJ3?=
 =?utf-8?B?RjJidTh3alBzb1ZGdGhucUcvaVU5eVJsaVE4cEtGNkVDeE1TZ0Jxb0k5Tkxx?=
 =?utf-8?B?dzRTTyszYVI0eGYzRXhTM0VTR002TUV3ZC8wZnhPdDZ6SVZVZkFFWkNHNDJv?=
 =?utf-8?B?dkppcmtUTEM3WXVVdTV2RE5rV0NBTGxmb1BhRXhza0NUV1ptN0NEMFJ0b1ZT?=
 =?utf-8?Q?XpcC12xxiMNrm1wkRJrZ1FVy76S/dFs5HbEUk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3FxWTEwQkJsTG95MndZUXUybWRpb1FWUGRKblJnNEtYSkRkTHN0cDYyYTA4?=
 =?utf-8?B?S2dYdkk0NGplOGlrTHZ1TVJ5TllSOXpPQTlOYklVRTMvQmpUajVYekllSW9R?=
 =?utf-8?B?M29MRTE4T2xPTEZkdklKcXJrYVJVbXVlN21qcTJyU212aEh6OWIvUTgwSUN6?=
 =?utf-8?B?Z1pJMVNpaHRRSm82OWpORXEyRk5oYVAxV0FwWS8xKzkzNHhpR2t2UXNPM2F4?=
 =?utf-8?B?UEZydFlEZWhoWmRxbC9UV0dxMGt4SmNjSTBadDVYbEkrOVJTRnFVSFpPK1gz?=
 =?utf-8?B?RnhGSC9rV3ZwYTVtb2ZWRkhnR3BocWduaXFLbzBneUNicFdYYWVKRmhVRzZs?=
 =?utf-8?B?WVl4RHlVLzVGdmFVV2V1c1lwL29qWVc5cEcwc0w5dkpvMU9aWkVKZjdaRzdT?=
 =?utf-8?B?MEdNbkxJY09BZVdCc1ZwN3Q0K0hRVlVxZkRSYVVLVlQ0cWkrMmI0dUxZaHNB?=
 =?utf-8?B?NXlzNjQ5TDhza2lnaWFseHl1TjFZVm9INEJ6OHQyb28wU1VsQVhUWGVLRXpn?=
 =?utf-8?B?dmZPRlFyYnFSMzgxR2JlS0U0R00wL2pLQ2Z4WXhIWkkvZHl2L1pXMVpWdisy?=
 =?utf-8?B?VDY0d3NYMnF2S1BuUlBHRFpyZW9PSWxpczFvV0huY3JOREFqTXNiNWU5Rkxm?=
 =?utf-8?B?RWNFVlpHd29CQmVlcXVkS1o5aVJNczBqbzlQMDNna1A3UjBhUTJVODJWcEdE?=
 =?utf-8?B?U2VMSWhtR0IzT05kV2k4ekRqSk52VXgvRk51UU1hbHBsbmhKeFBpSTBjdC9u?=
 =?utf-8?B?UzZndWs5UWVKMTVWekdVNStPS1BMOWtXaHBWcldwVU9VMXdRTE9odjNPLzRs?=
 =?utf-8?B?NU1KSnp3T1hIcnRlbkJ6TW9sSXREdnExREtQZmthUHhzb2xVc1JwMlY1OGMz?=
 =?utf-8?B?UnErcEtla2RGWjBiaExBVGhUVnQvRmxNRStyekJwenhGM0lXOVgvY1k0Nysy?=
 =?utf-8?B?U05aZzhsYWViazg3ajFSb09WYzNJZ1JlYTJWUVV4Y3RNdG4wdEVjN1JIaVF5?=
 =?utf-8?B?L0t1M0Y2TXZJeTlFN1lScWRuZS84ZWdmZytsVGpERW5zSzZIVGlDYWp1cUtC?=
 =?utf-8?B?WUp5ZDA2a3FHVnRnWjF5RFp2aWF0MFpOMTJCb2pudS9hRjZHNUM2ZlBicHFC?=
 =?utf-8?B?eVNzdGtVQnVOblFrbVdGdXUwZHljWStBMm9wMzE2RUE5dVJ6bCtoMTNjb0hR?=
 =?utf-8?B?WHE2aWx3azRGZkFSZncyWDJoeVRIR3h2VCtWV3gvNmFWb0pSUGMwby8xZEZG?=
 =?utf-8?B?TFBYNVIyNklHM2hJUXJBVzRycXU4SlBBTW9NSVVTazIrcVN5SUd6VkZyZjBB?=
 =?utf-8?B?ZmVucmlFZHdQQkpabkJHYTRFSTVKL0o2V3VUeVJDektzMU1JNFpENkhpMFlW?=
 =?utf-8?B?SS9PT3BDTU1JbE1sMmpRZGxoSER4ZDV6dkV2eFpINUsrWlI4OWxTMk1MRFgy?=
 =?utf-8?B?ekN1SmdNS0lUMkg4RlNuOEdlTUxidm9KK2d2c2VtQW5jOC80eEpoVFZGU2xG?=
 =?utf-8?B?RXpNZnRVVGQxOWdFUlRESEhyT2VONWhhSVJqb2o0WFdZTEI2MS9GYmxqQnoz?=
 =?utf-8?B?RGoxeHlyV3VzV2pVODJZTzZCSHhuUnhnTEFlQ1VFa2VIRUlSRlJRZTlVcDZo?=
 =?utf-8?B?M3ZzTkI3bThhL2F0ZU11ZjR0ck0zbEpMUTBTNDVOSXFITUZ1c2hlbmtMSzlG?=
 =?utf-8?B?MS9KUGN0RGlLYnlXVWpqcG1aOTYyTFovcjVVUDZEbUx1OHVkU0x2M0NpU29r?=
 =?utf-8?B?UDFwdWJKRVJLWWJOUXRzR1JVUDgyWS8rUGE0YUVROXZ4aWVEY01TdEs3dUk2?=
 =?utf-8?B?UEZndHJ3R08vNm1pZ1puUVN5ZU40Wi9JU3VnRVQ4UXdBb0wrQ1pyd1psWExp?=
 =?utf-8?B?NmhSNHl6N2J4ZTRPVHJHeHBEb0xjcGFrZVJzd0ZDTWcvRnUwd2o5UVJMY1FR?=
 =?utf-8?B?Zm9YQzBKMUc5UWdVRk9hY3lEdWpOLzBhZ0lEWXROYVgzWi8yL05TOWdJNnZx?=
 =?utf-8?B?a0ZKWjkwemRVdXIxdGZGVFdlaGxpMlFzU1NFNXBDY2xtYjh3RGZEelBkelVR?=
 =?utf-8?B?UWwwcDd6QVJ5VkJmbUxPelFWQXZOdVFOUHdwb0pBT3VDTjVuZXlFRU9IeTFR?=
 =?utf-8?B?bXN5cU9CZzJnUGsybjBhdVNiWElEM0lhcFN3QllVNi9GMkFHWGJvWDExZ1Bx?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3d8d03-0242-40e2-a40d-08dc91c4ecf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 07:36:55.4599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQ5o7E6jgr9Cqeu4/WAlrYzwD5Q6YrONPl7bIewHGJCg6ZEAk6LjS1Dmku5GM3ZB7/a4dk+eW/rNqBNp+FgIZDUKsIYSiAnD1IdZq467hTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1802

SGkgTmljb2xhcyBhbmQgRGV2YXJzaA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4N
Cj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0IDEyOjI0IEFNDQo+IFRvOiBEZXZhcnNoIFRo
YWtrYXIgPGRldmFyc2h0QHRpLmNvbT47IGphY2tzb24ubGVlDQo+IDxqYWNrc29uLmxlZUBjaGlw
c25tZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IHNlYmFzdGlhbi5mcmlja2VAY29s
bGFib3JhLmNvbQ0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiBodmVya3VpbEB4czRhbGwubmw7IE5hcyBDaHVuZyA8bmFz
LmNodW5nQGNoaXBzbm1lZGlhLmNvbT47IGxhZmxleS5raW0NCj4gPGxhZmxleS5raW1AY2hpcHNu
bWVkaWEuY29tPjsgYi1icm5pY2hAdGkuY29tDQo+IFN1YmplY3Q6IFJlOiBbUkVTRU5EIFBBVENI
IHY2IDIvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBydW50aW1lDQo+IHN1
c3BlbmQvcmVzdW1lDQo+IA0KPiBMZSBqZXVkaSAyMCBqdWluIDIwMjQgw6AgMjA6MjIgKzA1MzAs
IERldmFyc2ggVGhha2thciBhIMOpY3JpdMKgOg0KPiA+IEhpIEphY2tzb24sIE5pY29sYXMsDQo+
ID4NCj4gPiBPbiAyMC8wNi8yNCAxOTozMywgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gPiA+
IEhpIEphY2tzb24sIERldmFyc2gsDQo+ID4gPg0KPiA+ID4gTGUgbWVyY3JlZGkgMTkganVpbiAy
MDI0IMOgIDIzOjU2ICswMDAwLCBqYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+ID4gPiBIaSBE
ZXZhcnNoDQo+ID4gPiA+DQo+ID4gPiA+IElmIHRoZXJlIGlzIG5vIGZlZWRpbmcgYml0c3RyZWFt
cyBkdXJpbmcgZW5jb2RpbmcgYW5kIGRlY29kaW5nIGZyYW1lcywNCj4gdGhlbiBkcml2ZXIncyBz
dGF0dXMgaXMgc3dpdGNoZWQgdG8gc3VzcGVuZGVkIGF1dG9tYXRpY2FsbHkgYnkgYXV0b3N1c3Bl
bmQuDQo+ID4gPiA+IEFuZCBpZiB3ZSBkb27igJl0IHVzZSBhdXRvc3VzcGVuZCwgaXQgaXMgdmVy
eSBkaWZmaWN1bHQgZm9yIHVzIHRvIGNhdGNoDQo+IGlmIHRoZXJlIGlzIGZlZWRpbmcgb3Igbm90
IHdoaWxlIHdvcmtpbmcgYSBwaXBlbGluZS4NCj4gPiA+ID4gU28gaXQgaXMgdmVyeSBlZmZpY2ll
bnQgZm9yIG1hbmFnaW5nIHBvd2VyIHN0YXR1cy4NCj4gPiA+ID4NCj4gPiA+ID4gSWYgdGhlIGRl
bGF5IGlzIHZlcnkgZ3JlYXQgdmFsdWUsIHdlIGNhbiBhZGp1c3QgaXQuDQo+ID4gPg0KPiA+ID4g
T25lIHdheSB0byByZXNvbHZlIHRoaXMsIHdvdWxkIGJlIGlmIHNvbWVvbmUgc2hhcmUgbWVhc3Vy
ZW1lbnQgb2YNCj4gPiA+IHRoZSBzdXNwZW5kIC8gcmVzdW1lIGN5Y2xlIGR1cmF0aW9uLiBXaXRo
IGZpcm13YXJlICh0aGlyZCBwYXJ0eSBPUykNCj4gPiA+IGxpa2UgdGhpcywgdGhlIGNvc3QgYW5k
IGR1cmF0aW9uIGlzIGZldyBvcmRlciBvZiBtYWduaXR1ZGUgaGlnaGVyDQo+ID4gPiB0aGVuIHdp
dGggbW9yZSBiYXNpYyBBU0lDIGxpa2UgSGFudHJvIGFuZCBvdGhlciBzaW5nbGUgZnVuY3Rpb24g
SFcuDQo+ID4gPg0KPiA+ID4gWWV0LCA1cyBtaWdodCBiZSB0byBtdWNoIChidXQgY2xlYXJseSBz
YWZlKSwgYnV0IGdldHRpbmcgdHdvIGxvdyBtYXkNCj4gPiA+IG1lYW5zIHRoYXQgd2Ugc3VzcGVj
dCAiYmV0d2VlbiB0d28gZnJhbWVzIiwgYW5kIGlmIHRoYXQgaGFwcGVucywgd2UNCj4gPiA+IG1h
eSBlbmR1cCB3aXRoIHZhcmlvdXMgcmFuZ2Ugb2Ygc2lkZSBlZmZlY3QsIGxpa2UgcmVkdWNlIHRo
cm91Z2hwdXQNCj4gPiA+IGR1ZSB0byBzdXNwZW5kIGNvbGxpc2lvbnMsIG9yIGV2ZW4gd29yc2Ug
cG93ZXIgZm9vdHByaW50LiBTb21lIGxhYg0KPiA+ID4gdGVzdGluZyB0byBhZGp1c3QgdGhlIHZh
bHVlIHdpbGwgYmUgbmVlZGVkLCB3ZSBoYXZlIHZlcnkgbGl0dGxlIG9mIHRoYXQNCj4gaGFwcGVu
aW5nIGF0IHRoZSBtb21lbnQgYXMgSSB1bmRlcnN0b29kLg0KPiA+ID4NCj4gPg0KPiA+IE9rYXkg
SSBzZWUgdGhlIGludGVudGlvbiBoZXJlIGlzIHRoYXQgaWYgdGhlcmUgaXMgYSBwcm9jZXNzIGhv
bGRpbmcNCj4gPiB0aGUgdnB1IGRldmljZSBoYW5kbGUgYW5kIHRoZSBpbnB1dCBmZWVkIGlzIHN0
YWxsZWQgZm9yIHNvbWUgc2Vjb25kcw0KPiA+IGR1ZSB0byBuZXR3b3JrIGRlbGF5IG9yIENQVSB0
aHJvdWdocHV0IHRoZW4gYWZ0ZXIgYSBzcGVjaWZpZWQgdGltZW91dA0KPiA+IHNheSA1IHNlY29u
ZHMgd2Ugd2FudCB0byBzdXNwZW5kIGV2ZW4gaWYgdGhlIHByb2Nlc3MgaXMgc3RpbGwgYWN0aXZl
DQo+ID4gYW5kIGhvbGRpbmcgdGhlIHZwdSBkZXZpY2UgaGFuZGxlID8gSSBhZ3JlZSB0aGVuIGlm
IHdlIHdhbnQgdG8gc3VwcG9ydA0KPiA+IHRoaXMgZmVhdHVyZSBhIHNhZmVyL3NsaWdodGx5IGxh
cmdlciB2YWx1ZSBpcyByZXF1aXJlZCB0byBhdm9pZA0KPiA+IGZyZXF1ZW50IHN1c3BlbmQvcmVz
dW1lIGR1ZSB0byBuZXR3b3JrIGppdHRlciBvciBhbnkgb3RoZXIgYm90dGxlbmVjayBhbmQNCj4g
bWF5YmUgNXMgaXMgYSBnb29kIHZhbHVlIHRvIHN0YXJ0IHdpdGguDQo+ID4NCj4gPiBCdXQgaWYg
bGFzdCBpbnN0YW5jZSBpcyBjbG9zZWQvc3RvcHMgc3RyZWFtaW5nIGFuZCB0aGVyZSBpcyBubyBw
cm9jZXNzDQo+ID4gaG9sZGluZyB0aGUgZGV2aWNlIGhhbmRsZSBhbnltb3JlIHRoZW4gSSB0aGlu
ayB3ZSBzaG91bGQgc3VzcGVuZA0KPiA+IGltbWVkaWF0ZWx5IHdpdGhvdXQgYW55IGRlbGF5Lg0K
PiANCj4gT3VyIGVtYWlscyBjcm9zc2VkIGVhY2ggb3RoZXIsIGJ1dCBzZWUgbXkgZXhwbGFuYXRp
b24gYWJvdXQgZ2FwbGVzcyBwbGF5YmFjaw0KPiB0cmFuc2l0b24sIHdlcmUgdXNlcnNwYWNlIG1h
eSBkZXN0cm95IGFuZCBjcmVhdGUgYSBuZXcgdmlkZW8gc2Vzc2lvbi4gSQ0KPiBiZWxpZXZlIDVz
IGlzIHdheSB0b28gbG9uZyB0byBiZSBob25lc3QuDQo+IA0KDQpJIGludmVzdGlnYXRlZCB3aHkg
aXQgdGFrZXMgNSBzZWMgdG8gZ28gdG8gc3VzcGVuZCBldmVuIGlmIHRoZSBsYXN0IGluc3RhbmNl
IGlzIGNsb3NlZA0KVGhlIHJlYXNvbiBpcyBpZiBhdXRvc3VzcGVuZCBpcyB1c2VkLCB0aW1lb3V0
IHNob3VsZCBoYXBwZW4gdG8gZ28gdG8gc3VzcGVuZCBldmVuIHRob3VnaCB0aGUgcG93ZXIudXNh
Z2UgY291bnQgaXMgMCBhZnRlciBhbiBpbnN0YW5jZSBpcyBjbG9zZWQuDQoNCg0KU28gSSBtYWRl
IHRoZSBiZWxvdyBtb2RpZmljYXRpb24sIHdoZW4gdGhlIGxhc3QgaW5zdGFuY2UgaXMgY2xvc2Vk
LCBhdXRvc3VzcGVuZCB0dXJucyBvZmYsICBhbmQgd2hlbiB0aGUgZmlyc3QgaW5zdGFuY2UgaXMg
b3BlbmVkLCB0aGUgYXV0b3N1c3BlbmQgdHVybnMgb24sIGFnYWluLg0KV2hlbiBJIHRlc3RlZCB3
aXRoIHRoZSBjaGFuZ2UsIGl0IHdvcmtzIHdlbGwuDQoNCkNhbiB5b3UgcmV2aWV3IHRoZSBiZWxv
dyBjb2RlPw0KDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1l
ZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMt
bWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRlYy5jDQppbmRleCAxYWE1YjY3ODgyNjYuLjg3OTMyZDE1
NTBjZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2
ZTUvd2F2ZTUtdnB1LWRlYy5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1l
ZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYw0KQEAgLTE3MTQsNiArMTcxNCw4IEBAIHN0YXRpYyBp
bnQgd2F2ZTVfdnB1X29wZW5fZGVjKHN0cnVjdCBmaWxlICpmaWxwKQ0KICAgICAgICBzdHJ1Y3Qg
dnB1X2RldmljZSAqZGV2ID0gdmlkZW9fZHJ2ZGF0YShmaWxwKTsNCiAgICAgICAgc3RydWN0IHZw
dV9pbnN0YW5jZSAqaW5zdCA9IE5VTEw7DQogICAgICAgIHN0cnVjdCB2NGwyX20ybV9jdHggKm0y
bV9jdHg7DQorICAgICAgIGludCBpbnN0X2NvdW50ID0gMDsNCisgICAgICAgc3RydWN0IHZwdV9p
bnN0YW5jZSAqaW5zdF9lbG07DQogICAgICAgIGludCByZXQgPSAwOw0KDQogICAgICAgIGluc3Qg
PSBremFsbG9jKHNpemVvZigqaW5zdCksIEdGUF9LRVJORUwpOw0KQEAgLTE3OTksNiArMTgwMSwx
MiBAQCBzdGF0aWMgaW50IHdhdmU1X3ZwdV9vcGVuX2RlYyhzdHJ1Y3QgZmlsZSAqZmlscCkNCiAg
ICAgICAgICAgICAgICBocnRpbWVyX3N0YXJ0KCZkZXYtPmhydGltZXIsIG5zX3RvX2t0aW1lKGRl
di0+dnB1X3BvbGxfaW50ZXJ2YWwgKiBOU0VDX1BFUl9NU0VDKSwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEhSVElNRVJfTU9ERV9SRUxfUElOTkVEKTsNCg0KKyAgICAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5KGluc3RfZWxtLCAmZGV2LT5pbnN0YW5jZXMsIGxpc3QpDQorICAgICAgICAg
ICAgICAgaW5zdF9jb3VudCsrOw0KKw0KKyAgICAgICBpZiAoIWluc3RfY291bnQpDQorICAgICAg
ICAgICAgICAgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoaW5zdC0+ZGV2LT5kZXYpOw0KKw0K
ICAgICAgICBsaXN0X2FkZF90YWlsKCZpbnN0LT5saXN0LCAmZGV2LT5pbnN0YW5jZXMpOw0KDQog
ICAgICAgIG11dGV4X3VubG9jaygmZGV2LT5kZXZfbG9jayk7DQoNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWFwaS5jDQpp
bmRleCBiMDkxMWZlZjIzMmYuLjA1YjgzNDQ1YzY1MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMNCisrKyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMNCkBAIC0x
OTcsNiArMTk3LDggQEAgaW50IHdhdmU1X3ZwdV9kZWNfY2xvc2Uoc3RydWN0IHZwdV9pbnN0YW5j
ZSAqaW5zdCwgdTMyICpmYWlsX3JlcykNCiAgICAgICAgaW50IHJldHJ5ID0gMDsNCiAgICAgICAg
c3RydWN0IHZwdV9kZXZpY2UgKnZwdV9kZXYgPSBpbnN0LT5kZXY7DQogICAgICAgIGludCBpOw0K
KyAgICAgICBpbnQgaW5zdF9jb3VudCA9IDA7DQorICAgICAgIHN0cnVjdCB2cHVfaW5zdGFuY2Ug
Kmluc3RfZWxtOw0KDQogICAgICAgICpmYWlsX3JlcyA9IDA7DQogICAgICAgIGlmICghaW5zdC0+
Y29kZWNfaW5mbykNCkBAIC0yMzksOCArMjQxLDE0IEBAIGludCB3YXZlNV92cHVfZGVjX2Nsb3Nl
KHN0cnVjdCB2cHVfaW5zdGFuY2UgKmluc3QsIHUzMiAqZmFpbF9yZXMpDQogICAgICAgIHdhdmU1
X3ZkaV9mcmVlX2RtYV9tZW1vcnkodnB1X2RldiwgJnBfZGVjX2luZm8tPnZiX3Rhc2spOw0KDQog
dW5sb2NrX2FuZF9yZXR1cm46DQotICAgICAgIG11dGV4X3VubG9jaygmdnB1X2Rldi0+aHdfbG9j
ayk7DQorICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoaW5zdF9lbG0sICZ2cHVfZGV2LT5pbnN0
YW5jZXMsIGxpc3QpDQorICAgICAgICAgICAgICAgaW5zdF9jb3VudCsrOw0KKw0KKyAgICAgICBp
ZiAoaW5zdF9jb3VudCA9PSAxKQ0KKyAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfZG9udF91c2Vf
YXV0b3N1c3BlbmQoaW5zdC0+ZGV2LT5kZXYpOw0KKw0KICAgICAgICBwbV9ydW50aW1lX3B1dF9z
eW5jKGluc3QtPmRldi0+ZGV2KTsNCisgICAgICAgbXV0ZXhfdW5sb2NrKCZ2cHVfZGV2LT5od19s
b2NrKTsNCiAgICAgICAgcmV0dXJuIHJldDsNCiB9DQoNCg0KDQo+IE5pY29sYXMNCj4gDQo+ID4N
Cj4gPiBSZWdhcmRzDQo+ID4gRGV2YXJzaA0KDQo=

