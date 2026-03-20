Return-Path: <linux-media+bounces-56469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPZfDlzqvGnQ4QIAu9opvQ
	(envelope-from <linux-media+bounces-56469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:34:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 891292D6427
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E014D304C0B2
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D8318EF6;
	Fri, 20 Mar 2026 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g1L+TU/U"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DF2F7ADE;
	Fri, 20 Mar 2026 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988406; cv=fail; b=Gnfg079SwgUVBVvA6BzViSecBYGEMGTBuEV1POtrzFsBrvOqSwvDD7DzyVPPKtaRx7QXJsPdtSWlo8VCx/LEq0Y+12M5TjUuue8xZCvZ/3kKkoHDeONOPSaL+10ks5IGa5R2qMwGhX7LyXXsEVQMtBTqwjmy+dG2QJHv/A3ibDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988406; c=relaxed/simple;
	bh=sx1GxGNWMYapt6AA4kSZFMoDwQb9Sg9A2Ys6yFsDq8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HDJdc5dETOT47uTx6d4Qyvc9jkDhg9R0wlbI7LuVoTob+uE2BYopwzfzlsHIKjo4icOYtl3vBKlqgb5gFx0Y8/yE8JR/WnFDBE4O0ICcIm3bq4eFt4UFPsmE3XJzsG1e28KWLya2Pw5mRn4AN5xKSkI2iW/DpiruYpyRITYAC1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g1L+TU/U; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsfduOs+2wqJS2HWuIMQIIn3VcG6hjlM3ltYlDkTvBUyBYQj4XuA5GXnytlC02ZqLcYP4RhaIEDprTz9zksaS0GKSx4egArs9YHaTt+Z72Q4RtLQ3x19IsBDawdq8FrdMXPuIPAXOKQNvTFDPf7D3c9VohdAEkx0cHv/Z0FWRj3XTxrUZm3vL9aBea/U69BNMh/+zlF/+uymmEiFqIRKzvsjE3rbz8Fr4lbnxOCpDUiGD+xFPiVjyaxl8IYI96qNaeEXCt6VRR3eFmbRjQeQ3L/s8Aei4HR98EyYwt6h+26NrSLgePAWi6ibCa4oIZkqJHu1ad/Kl/zuLiDBCBcODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx1GxGNWMYapt6AA4kSZFMoDwQb9Sg9A2Ys6yFsDq8w=;
 b=h6Knqxv2HRfnQqcjCReBf3hlr0/wOfgNKCNSTd49DH/P7EBBB93fdNgsGS/lXfeI31/SW7isgMTJP44Hr2ax9UUPWcUc/KrSSDDTK79/LVTzDEZwekQ5LHelw9mXum6FXG30U1ah1KoecPLocl6xbomuHttlJZjDwGaynjkUvGJ1jxrCjtpbiwevXt1mqBnEFhg23jQ/nkMkU5+WfTb3E0LZD6f+1N07Brc5ZhyVBfoCtpSuGWT3WXkJjKKN9O/8uy0MxkEnOaiHPYcs+xXPZUpktjZ4MZBj2Y04oK8wOLLJhcwGdZG5oxU4H9Sq3bAGnPeIC4Qyoy+2g0UKt0xTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx1GxGNWMYapt6AA4kSZFMoDwQb9Sg9A2Ys6yFsDq8w=;
 b=g1L+TU/UfaxOROajhNUA6D8kSD1V/DgUVRknJx2n40JrUY1+UPHM/j0PBOdH2GC0DfHoWaCHDUvsK7uz3bcJA9Xh9216oKb+oCVXdAn3zHuJfE8MZvmReTquFEK4nyhc6zxQ3LnKbQ3o6OAA5fwFaH8JeXn++lQtCjw+NwJmp9I73R58iGxl7LT0USNDh2ccIErMDbMPRJ/fxFnJsMEAKaBcj+0KsQZ/wm6IB8tUsglHLUe1He4uERuo+gQNanWYtxYzKUgPl3HEO+gRi7hmgKdboCK1Jb7WyqoBf1IUIHmD1ZOyuM6vVUPn1hOQ77FLs+munyLu+5gcLZIVhpvgVA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7551.eurprd04.prod.outlook.com (2603:10a6:102:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 06:33:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 06:33:18 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	=?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <s.riedmueller@phytec.de>, Jacopo Mondi
	<jacopo@jmondi.org>, "c.hemp@phytec.de" <C.Hemp@phytec.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alexi Birlinger <alexi.birlinger@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH v2 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Thread-Topic: [PATCH v2 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Thread-Index: AQHcuDNw9fijj/0EAEK3m0SSpwAfww==
Date: Fri, 20 Mar 2026 06:33:18 +0000
Message-ID:
 <AS8PR04MB90803AEA374817F48BCD61EFFA4CA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
 <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
 <20260319215921.GC950375@killaraus.ideasonboard.com>
In-Reply-To: <20260319215921.GC950375@killaraus.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA4PR04MB7551:EE_
x-ms-office365-filtering-correlation-id: 3823ba76-8c05-4749-b056-08de864a9311
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Ow1uNpQcjRnH7igK0t3BpTdbSXq1X6m4Ig+8moUV7lj4yiZvBkLETBLofTjCoc1e3JoYy2uy/h431lpri6ANm7CczerpSAE33IrOy9CB5IkmwMYLmDc6RKPTuVosz7Exi/+y2IUoQ2oRJkdXyGiPFUBuWrb+EHyneDHgywWtl14UgN0AzrW//K7/JpwP1hk9RQkolz7W+3H4U2DkMfPzN+OTySnRfN1jLOcXiw7SL7whkSaRLACLf3aAyWkgBmOGr4kn9ExW3wpX9SFvTwmOHI8dWQkLso6LYQHWJE6GxNeif4UPTGgcozhXz746o6UR9eMe6VgFCp4E9y6vBkI+b8JB+MZlvt3rjc2ARQM61TntnWDLpmpmphJh0uBdAOUJSsbUmWyZf2yp1Hn9ttf43GR5TEURA57eI+q6M6KaaMPGDsgZ2a2Yq85IgsDNAKiXid5tKikMaVZ+M5ZmKlOxz7/cCgEVi2h7sBWBxyzEmvVTNmjJ7PFWEUriZ5GwFEnziZKbZmsvN7NVjA+eDtO4NhEk2FsKvbtb1+a4kKB8HiBOM6BueuRJeanUH+KD2HzTrIBZzRs1PBaTsABR/6D9kR1/7CXVHJzTpxiS+U4tjwb++fxL96Ysc7fZWJ25o0g5/PAvz4ETTAEvl5sqiG3pbbspwuFizQRDUHvc02W0JfCKqiEMTE+6hHfz2Arc3jsdK/4hmL0jcocpfHMRcTqGBO2Ff9jqMeqISfUc3PPMoWT1VO1YU4+hLxnZC4TZ4+0Y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0FTTnpyQ2lTMEErNit1NmZOUy9oMVJpMXg4dEJ4cGZkcnY5ZTloTFE0RFdW?=
 =?utf-8?B?TElDb2JGRk5xUzRheU5HdFk2NGdNTjE3amY0M3ZyNFJmRWJwOXBtRnN5QXRS?=
 =?utf-8?B?YmVpaTZpYWUwaTNPT3N4bTJiYzNoTWVaWnBrZDNsclpNeUsxblNsVW5WNGtE?=
 =?utf-8?B?L1RBQlA3cEtLM09HbllHWTdrLzNiaUZ5SlFzeEZoSWc3eWtsZ0JNeWczbjdO?=
 =?utf-8?B?WkxSNTZUQlBFdVY0anVkUG5rN1JlWkZyUUw3M3NPZEJpQStzcUVWRWZEakgz?=
 =?utf-8?B?VGdwa00xRkRtSXZ4VXBZK2E0UzRLbms3allXNkk3cGVvZ3Y3eExQTnZpZk10?=
 =?utf-8?B?WmMyaExja1JQeWFlVGVZVWt6cVJvWjdBcnNPK3hLOXk1QXhYem51bW0wOEtt?=
 =?utf-8?B?c3RIcy9wTUFrR1hhaHhFNE9oMTlYYzVOL3lEUHgyY0FoZ1laTG04c0pCSTdj?=
 =?utf-8?B?eHdoeGd4WUtZVGZMbVVjTE9VM1NvMUpaUlpsSm43eVlCQk42ZXNiMlM4ZUNU?=
 =?utf-8?B?ZkNlTDNVY1JCZFR0dHh6dW9IaHlacGwyUFBwV1B5dGFIVHI3cVYweDFmeEtE?=
 =?utf-8?B?YVhnUDRHZFk2NENteFpZNXhneXNHR2tESnNQRGF0R1dJUnVJd01Rd2l0QWh3?=
 =?utf-8?B?ci81LytmRmdZWTJkOGJXY1Y0cHAwTUdLcSs0M3dDRkNkQm1QcUN1WXFYaitX?=
 =?utf-8?B?cWdLb3JXREZtcVo1c3Foa1FKRGJ4VE5IQno3bEUwTjNTckhjckhTcVBVTVpU?=
 =?utf-8?B?dTZIZDNSd1QwM2VRVmVoSVNRN000MFN3VHgvdGVyUGU4VzY2RnZKOUVoM3l6?=
 =?utf-8?B?bVFqczJuY1JUODhVRHdvQzE4bGM2eTMvRWsxOFVhY3hvaGRvOEVNZFVkT0VD?=
 =?utf-8?B?RDJ1R3J5T0NtZDlJRXhkblZsV2pYdFJIcGxaU0FubzFsb1YyRURHQTY2Tm5m?=
 =?utf-8?B?T2l5TGhMK1haSjFJd045d2U5cUdBbzZhZnVLdjFIZzFFUXN4WWdpdEpPN2VH?=
 =?utf-8?B?SmJSZEhjU1d3REpiSDhvYUMvY0g5QnRMaU52S3I4ZllkRng3Y2tUUXRZM25w?=
 =?utf-8?B?Z0xoSnY5a3NRdnRlNXVsaFovaGE3VGJHL3ZxVVFhYzBKeDcrMzBuV3pJbFdI?=
 =?utf-8?B?SzYxUFl6RUduUE9adFBhTkdMejV4THZlYWZQZ1czNGFNRVFiR0dTVEdJclJs?=
 =?utf-8?B?RUh5Um92dG0wMnRPeEJWL0NDM1dsTHN0cjRIZ2pCZTZBeVA5UnhBMm5LNmxR?=
 =?utf-8?B?R3dPcytsR0NKSjhnanE1K0crMVlpWWtQVktUS3luQ1FKU2ZYYlpDOEFpcTZh?=
 =?utf-8?B?RW80MDdqdXUxMTVGMExVYk9IMGpIYjU5NXo5cDhYMmRRUWplZjdKeW40QjZt?=
 =?utf-8?B?MnhUaGhENWtONGpCOXFwaGRreVFGS3d0cUZPSTFWMm1ITWNOME9NUGNrTXEr?=
 =?utf-8?B?QUp1WnNMNlVPYjRCalV5dzhmUEo2VloyeXBBa01TVjVrVExsd2VOU09GZjhn?=
 =?utf-8?B?dEgwTERuOUR5S1NjMHJZa2tkMFNtaFdMWVVwMTNiQ2c1QXRqeGM4OXNpZ3I3?=
 =?utf-8?B?Wm9ZZjEzMXZ2UzIxd0wxZkM0eWhKSi9mMkxFdVJQKzEwYktERG5QczJBNzAx?=
 =?utf-8?B?L05wbUZ1UWN5NlFPV3dWTDRoUm0yNUsrUUMvZGZzeDJtOTNKa1NWRURqclFm?=
 =?utf-8?B?U0loOUVDUmllK09OTXhkTnNrVTZjS2xoYVNLN3BXdzBSb0lGMDNHbVdEYUpW?=
 =?utf-8?B?a0NNaXVLQWtOaFdWUUtyTjVqWjhMRzdvRzdPbTc5T0wzT0JtUGIrY3dGUkRH?=
 =?utf-8?B?aFdOTERGNHFhU0VucktpVTNKdU5CdDdsY1dqNFpHWXpzV3VaTHZIZFRUNFRw?=
 =?utf-8?B?dTBBdFVrK1gxdVJWR09ielFzdDE5QkFQL0RxZmUwenVNSFJDQjhpRWZFa1ZE?=
 =?utf-8?B?TEJYb3pZSHg0eFV2VWt1aTdiQzBtdlRaY2QrRzM2QWJOWmpORnZSTjRtMHVn?=
 =?utf-8?B?N2h5TzdxQ25Za1dmUER5N3FvUWhLeWhxbk9lbytyWWNpYVNoU09UU2VwSGFN?=
 =?utf-8?B?WUNhMU56ZG9xUUpDbGtXdkhZNFVvVVJ3WldXME4rYysrWmNrSnowb2xXdVp3?=
 =?utf-8?B?Z1FSZXAzMzlLalVyRVl1Q0NweWlTWVp3c0I0dTBkdmFBNFpJcUUwamZZNHBO?=
 =?utf-8?B?VUxCR2lZOTFxdmg4QnV0bU9oQXJSWjkxOGppM2Q2V1lKK2FZaUhXeW9SZDNk?=
 =?utf-8?B?VTVKR1pjakUzdHpiQ3piRXJ5TWYwdmFWa0szb1IzaEFERzFaQ3lkVjJZMVBY?=
 =?utf-8?Q?H00W7PG4WrZ4FZcR0Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3823ba76-8c05-4749-b056-08de864a9311
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 06:33:18.5719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSos/AFMESsKis/il6DR4NMGPeu6FQ4hB/0iEbYhARPrVPVueBVW8R8qvOOCZSdXK6WAWHQdfmqiB9n+4YiqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7551
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56469-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.935];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 891292D6427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjAsIDIwMjYgNTo1OSBB
TQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6
IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgRnJhbmsgTGkNCj4g
PGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
OyBQZW5ndXRyb25peA0KPiBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFi
aW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgU3RlZmFuIFJpZWRtw7xsbGVyIDxz
LnJpZWRtdWVsbGVyQHBoeXRlYy5kZT47DQo+IEphY29wbyBNb25kaSA8amFjb3BvQGptb25kaS5v
cmc+OyBjLmhlbXBAcGh5dGVjLmRlOyBsaW51eC0NCj4gbWVkaWFAdmdlci5rZXJuZWwub3JnOyBp
bXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBbGV4aSBCaXJsaW5nZXINCj4gPGFs
ZXhpLmJpcmxpbmdlckBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNv
bT47IEcuTi4NCj4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAyLzJdIG1lZGlhOiBueHA6IGlteDgtaXNpOiBQcmlvcml0aXplIHBlbmRpbmcgYnVm
ZmVycyBvdmVyDQo+IGRpc2NhcmQgYnVmZmVycw0KPiANCj4gSGkgR3Vvbml1LA0KPiANCj4gVGhh
bmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUsIE1hciAxMiwgMjAyNiBhdCAxMTox
MjozNUFNICswODAwLCBHdW9uaXUgWmhvdSB3cm90ZToNCj4gPiBGcm9tOiBHdW9uaXUgWmhvdSA8
Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPg0KPiA+IENoYW5nZSB0aGUgYnVmZmVyIHNlbGVjdGlv
biBsb2dpYyB0byB1c2UgcGVuZGluZyBidWZmZXJzIGZpcnN0ICh1cCB0bw0KPiA+IHRoZSBudW1i
ZXIgYXZhaWxhYmxlKSwgYW5kIG9ubHkgdXNlIGRpc2NhcmQgYnVmZmVycyB0byBmaWxsIHJlbWFp
bmluZw0KPiA+IHNsb3RzIHdoZW4gaW5zdWZmaWNpZW50IHBlbmRpbmcgYnVmZmVycyBhcmUgcXVl
dWVkLiBFbnN1cmUgdXNlcg0KPiA+IGJ1ZmZlcnMgYXJlIHV0aWxpemVkIGFzIHNvb24gYXMgcG9z
c2libGUsIGltcHJvdmluZyBlZmZpY2llbmN5IGFuZA0KPiA+IHJlZHVjaW5nIHRoZSBudW1iZXIg
b2YgZGlzY2FyZGVkIGZyYW1lcyBhdCBzdHJlYW0gc3RhcnQuDQo+IA0KPiBUaGUgY29tbWl0IG1l
c3NhZ2Ugc2hvdWxkIGV4cGxhaW4gKndoeSogdGhlIGNoYW5nZSBpcyBnb29kLiBIb3cgZG9lcyB0
aGlzDQo+IGltcHJvdmUgdGhlIGJlaGF2aW91ciA/DQoNCldpbGwgYWRkIHRoZSBpbmZvIGluIG5l
eHQgdmVyc2lvbi4NCg0KPiANCj4gSSdsbCBxdWV1ZSAxLzIgaW4gbXkgdHJlZSBhbHJlYWR5Lg0K
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4N
Cj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gUmVwbGFjZSAiVGhpcyBlbnN1cmVz
IiB3aXRoICJlbnN1cmUiDQo+ID4gLSBQdXQgZXhhbXBsZSBmcm9tIGNvbW1pdCBtZXNzYWdlIHRv
IGNvbW1lbnQgaW4gZHJpdmVyIHN1Z2dlc3RlZCBieSBGcmFuaw0KPiA+DQo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyNjAzMTEtaXNpX21pbl9idWZmZXJzLXYxLTAt
YzkyOQ0KPiA+IDlkNmU4YWU2QG54cC5jb20vVC8jbTI3NzQ5MTJlZDMxNTUzZWYxZmRjYzg0MGJk
NmVhZTUzYTAzZWNjY2QNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAv
aW14OC1pc2kvaW14OC1pc2ktdmlkZW8uYyB8IDkgKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS12aWRlby5jDQo+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS12aWRlby5j
DQo+ID4gaW5kZXgNCj4gPg0KPiAxYmUzYTcyOGYzMmY4OTMzOGE3NWRkY2M0ZTk2ZTc1MDFlZDk1
NGUxLi43N2ViZmYwMzMyM2FjZTUwZmYwMzljODMzDQo+IDNkMg0KPiA+IDVhOWMzZGQ0NDg4MCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4
LWlzaS12aWRlby5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktdmlkZW8uYw0KPiA+IEBAIC03OTIsNyArNzkyLDE0IEBAIHN0YXRpYyB2b2lk
DQo+IG14Y19pc2lfdmlkZW9fcXVldWVfZmlyc3RfYnVmZmVycyhzdHJ1Y3QgbXhjX2lzaV92aWRl
byAqdmlkZW8pDQo+ID4gIAkJc3RydWN0IG14Y19pc2lfYnVmZmVyICpidWY7DQo+ID4gIAkJc3Ry
dWN0IGxpc3RfaGVhZCAqbGlzdDsNCj4gPg0KPiA+IC0JCWxpc3QgPSBpIDwgZGlzY2FyZCA/ICZ2
aWRlby0+b3V0X2Rpc2NhcmQgOiAmdmlkZW8tPm91dF9wZW5kaW5nOw0KPiA+ICsJCS8qDQo+ID4g
KwkJICogUXVldWUgYnVmZmVyczogcHJpb3JpdGl6ZSBwZW5kaW5nIGJ1ZmZlcnMsIHRoZW4gZGlz
Y2FyZA0KPiBidWZmZXJzDQo+ID4gKwkJICogRm9yIGV4YW1wbGU6DQo+ID4gKwkJICogLSAyIHBl
bmRpbmcgYnVmZmVyczogYm90aCBzbG90cyB1c2UgcGVuZGluZyBidWZmZXJzDQo+ID4gKwkJICog
LSAxIHBlbmRpbmcgYnVmZmVyOiBmaXJzdCBzbG90IHVzZXMgcGVuZGluZywgc2Vjb25kIHVzZXMN
Cj4gZGlzY2FyZA0KPiA+ICsJCSAqIC0gMCBwZW5kaW5nIGJ1ZmZlcnM6IGJvdGggc2xvdHMgdXNl
IGRpc2NhcmQgYnVmZmVycw0KPiA+ICsJCSAqLw0KPiA+ICsJCWxpc3QgPSAoaSA8IDIgLSBkaXNj
YXJkKSA/ICZ2aWRlby0+b3V0X3BlbmRpbmcgOg0KPiA+ICsmdmlkZW8tPm91dF9kaXNjYXJkOw0K
PiA+ICAJCWJ1ZiA9IGxpc3RfZmlyc3RfZW50cnkobGlzdCwgc3RydWN0IG14Y19pc2lfYnVmZmVy
LCBsaXN0KTsNCj4gPg0KPiA+ICAJCW14Y19pc2lfY2hhbm5lbF9zZXRfb3V0YnVmKHZpZGVvLT5w
aXBlLCBidWYtPmRtYV9hZGRycywNCj4gYnVmX2lkKTsNCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJk
cywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

