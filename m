Return-Path: <linux-media+bounces-54031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOn3IGTxpGlTwQUAu9opvQ
	(envelope-from <linux-media+bounces-54031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 03:09:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C081D26A1
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 03:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB5C03013780
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 02:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241772857EE;
	Mon,  2 Mar 2026 02:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NOtO+vGb"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C61DD889;
	Mon,  2 Mar 2026 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772417365; cv=fail; b=kIQv5L5WiNnC7N7KAZWkSJlhxpWAUCB1FEVstgQOVnPYpWSpeHBRwGXbP8vyZLAtoH2ZxX8RxcNlIZEmIRyOdEDhPxyj0C7/o66FabNpHWxyYFP1fdIaSA0gzTLAMKSWQ+nG5ukY0fKbQfksN03AbJQVIxt6Sm3wRhz9rC85lb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772417365; c=relaxed/simple;
	bh=XvgyriYLrNOWp/SX/0FWU4Ue9CzRHuWZAD3A894u9yw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C8Dd3ZoRjIDUgZLSzltOcOJX7g31IkRXJE6v6jwv86NEh3KLWUGpMbEeUwn43gM8UMS5RFkEdBUHIQG6ssqQd6XegGrq50o+8BQjlIRD99o5L4UpV7YQ5Ma4rblNHGbxTpSXHrAqxXJQtsLYSQf534ppc/6y6pxdeas/xBhu/Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NOtO+vGb; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEnvjuT4A5Pb3u/vgZvdLGyJwv3q531/rFzMR4jSXjp9SglFOwphCmTHV3rNOC+vDxsWL7n8xOic6RNI6yKWcI1/corKwEZt/rxD1xxZ7uw06dk+bRRA9X4+4jTjmA1DiS5UHKpYr9KiLzSSLKmXh48wR9jETfC7ONgbECNdjSrdJrXUtS30r0ftMuqYKcxfz6z4tkF6HoWqr+9O0NNlIYUxoaQYxQH9yBsd98Py9fkS406pmfHoO7IhYWp+565BRF81o1fw8pkCF5Jo0glHUR7vcT4LyXN/yD110Hq0cZ23RkkHzWLQ5A6XovGtZVsSdmZbZ7ayYhVwpL625vzMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvgyriYLrNOWp/SX/0FWU4Ue9CzRHuWZAD3A894u9yw=;
 b=uABqgQvScIKHifRt3F96fDFNeF291q/C9Ao/zeXEuyaJtUsU8S2N3nDirHGS1HWaqTgLgR4RMR7CpkMh0sczdEyIbUsfvW7KysSJKCbGwjkwJpYX/wuYx34Hg+I2AQGgPXF+eHchpbt0B6HRa9jhpMjrQctApRg9zs+CUMF5EqKrgn0HB8gZyJl6bREwtWfOqMe23oUc0XOvR9fIelQU2Q5biHcevoGCLjlzvMCWrPrp6iDCE9tGeaHLwuDri2t2RRbnAU6CDmNwAoF7+/P2SDPJKQVuavJjtgHfOj2dA6lNWz/Gujw0jy5yxa7EqAtXb5E4S1lEt8iKnJsi2zFBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvgyriYLrNOWp/SX/0FWU4Ue9CzRHuWZAD3A894u9yw=;
 b=NOtO+vGbKsMqG/udOlVQWE/ObneKfZ+DLACdaZDfbCh66+Y/7zKxvHGDgrUqwygBhr6RyY26JB8r2qX37t2TiUc64oXvMFy1P9Z4XsrwFNgusD3Pp2SwsWa99yR2lzQvT0OePoIfI0S+YEuhm/tus3A38NF3fT8dq9iOcjDKLeoC3VrzhR0DpiWnWzHtaDVLNwvkqjivca+jiiYks4teRUV2QKMjQ3O756TojWT0+bk+XX+qhjZLDjTBwIXdqiETN68qiO3XtCRi8dJI5BSfE3TvaMJuo8GAT78BfX79YtflhoH5KN7y3OOgGrQU1euiDB4/RvFQhj4vAdX0cDIYJw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7711.eurprd04.prod.outlook.com (2603:10a6:102:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Mon, 2 Mar
 2026 02:09:18 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 02:09:18 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, Rui Miguel Silva
	<rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Frank Li
	<frank.li@nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH v10 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Topic: [PATCH v10 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Index: AQHcZcYcb/17jej+0Ee6rMVl5pG+jrWbB5Zg
Date: Mon, 2 Mar 2026 02:09:18 +0000
Message-ID:
 <AS8PR04MB9080AF73C1DB172488153901FA7EA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251205-csi2_imx8ulp-v10-0-69b5c4cebcf8@nxp.com>
 <20251205-csi2_imx8ulp-v10-2-69b5c4cebcf8@nxp.com>
In-Reply-To: <20251205-csi2_imx8ulp-v10-2-69b5c4cebcf8@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA4PR04MB7711:EE_
x-ms-office365-filtering-correlation-id: 7777c56f-01df-4a27-ddae-08de7800b613
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 0YOp0jVOJI6XJk2M82ukSv4aHuBDrQn6PwruWjdbZ8/a63RX/eU9RS831MZT4OV231YUW07xtXApbha32bGy/BJ+gOxFhr71d33V+Cjn/DEeqCFvMJjyfsT+3E2r4N6FyGtDF1FOIqqf8yY1l34FgTOeaWnDm9d/PJOWDGaDPnvl5V/ffb8IgMqvql4w5tQ+RNkHiCtW8MEC+XtSYbF97bo0CG0q+Zvd9wAkI6/yJDiu1PbsWCYyUuwabrrTYAjw7zuDov6MWwMkEbyhDZor++HBJ8iHF3M6uP40zt+GTngNF4f6FKr4nflOrVO/ZtCBcThHSpzeHf1QGV/5ZR117raZFc5EIwRk4zBcUPF0tg8pafqefjUf7Nnki89GZzRKmORgkM5ZKOq+iEsbGe+HkLEUaIBKOlxdU7mH7zbn92JycE9eg0q08ZuPr6tRJYxSUGKhPhNlKs4yNxk+Hq8JvWt1NV+nRSaR75fcg9WrvYkQSjPyoRuNNHlp7JOobDX1Lug6i5pNFz735XaYwgWZm19eYkzlbqkuiKxIhq2eUrvWDuoUpQEsl9i6Y0DmLOENeFmq1B32xcoDHc3knXPDcSq3wQhQJ6/CyiyRgLYLLsfDKiQy/dkWby20az0OhBVi1TbO/WWtoVin9PBxFTxG/R9IQyD7TswAZAFISrdTuSzvnFtIZuTNJJ0seeFmt15YYJErmjFpC8tu00olGoxkIDhMDEuYJNHKSzh3PtDYYBr0JdzbqwPEquN22YEitErWfnyXIFPTxLDvOAYb1kqStZ1wuHq6Q45SLgTKJZwAuh+s/ds7uwcu0xfaF2XswJ05
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXJlelVIOGNOaFhDZ3djYXA1cFE1anZ6dWxMY05IOVoxMzFxWkE5QW40L1V4?=
 =?utf-8?B?c3o3UTYrTGd0UHM1bkpJbG83MzljVHVocnJxVE10U1JqNDJyQms0aTc3YXFy?=
 =?utf-8?B?dDdDSkorSWRITHNLZkNFeEh6NDZnbldGakI2VmNsYTlDVjFnTlpDcDZISWJY?=
 =?utf-8?B?UmhSSmpEcms1d09ncnJlSEhNVnBJbGZaK1pCSnl6bG1HMTU2YlBzeUtGclFZ?=
 =?utf-8?B?V0UrbWFZS3NDZFVvcmE4Q1BYa1MrNkkySWdXMHhYYTBIejEwd0pFY1k1aThx?=
 =?utf-8?B?TkxUSk1xZ3RuWjRSblcrWFVVdU9lWEl3RkVXOXNQeXF0L0lpdEJRR21vcDlK?=
 =?utf-8?B?RTVSSytKQ0lsTnVPK0VEbWFMdk9rNFZCY1cySE5EZ3dNMVJLSXdJc1dNVTRL?=
 =?utf-8?B?YldOL1RQZHVuVTRzMmFCTVJ2UGhxeGd4TWx2K0w2TnNNano2ZmlvaXF2anE3?=
 =?utf-8?B?Y1FOcXllREJoR1dRRXNIbEdlS1RLZmF0UzVTbWJsZXV0QnpLdy92bHVEekJp?=
 =?utf-8?B?YXVUMVVDaFI1a1h5ZGgrQkRueW1wRnlDS2NheE45TzhsSTlTVUZUZlYycHUy?=
 =?utf-8?B?elhsMUFGNW9VZFRPYTMydDM4MzFtSXEyYzZKVFMyMlR1bytzUDVhYkRZWXpM?=
 =?utf-8?B?WGhpdy9obzlQK1UvRWpsT2pheTBnNWFncHdQTmVmdHlJelZLS2pQVEVuNG1q?=
 =?utf-8?B?OWxvSE92VXl1RFJuL2llVVZlYkdRYVVyMlVGV3Bxbi9sVERoOXA4a2Q5SVMy?=
 =?utf-8?B?MUtGTmtkMjNZamVLeXJqbzduK01xSWVraVFtQnFYMXVqd2M5TUFZb3l1NmtW?=
 =?utf-8?B?NkEzVzYyU0tDUXkwQU8vblFmN2ZWcXJsMVBKUDJTaThJMWFBRGFFbS9MQ05i?=
 =?utf-8?B?SytFNDFua29mV3lzTS9pUFRuMnJNb2ZSZDdmcHZkRVQ1SlRpaTBPeGNmKzZU?=
 =?utf-8?B?U0hlWVhEOE9PNHR1ODRvZURSbjlIRzRaN2M0TGlkSDhDODFBa3MvelBuclJu?=
 =?utf-8?B?QUk4STN2bHE0TFFuaVBXemRnaUZid1BkV2ZvWTlnckl2Zi9qU1lWOWRyY3Mv?=
 =?utf-8?B?Y0hZb0t4OFNLNGtYVkZJK0FMdDNMcFQyaHdFc25ES1RvNjZKMGVLRzE2S3Jn?=
 =?utf-8?B?eVZ0UkJqTjJZc1RVdTBvUmVVUkxjVG5XQ2hUUVFDMnE1elZrZ09nTUxDWEJa?=
 =?utf-8?B?Zm1KQ0EzUDZNOTJQQ3hucDl1aVpZWlpjYnhuTzJlWmR5WFVZeW1Ib2pvR3Vp?=
 =?utf-8?B?WkZSMGhxRW80c0RhWkxQTURmdUxMSXE5ZWdYYWFxK0pwaHBGUzYveFFqYThG?=
 =?utf-8?B?UmRiUlN2OXB1cDRnd0lxUVNuWWlyc2h1UDhpNzdnWTQ5dEh2Z2RiTFpuczRz?=
 =?utf-8?B?a2FEWWpaMExwSE9Rd2ZRTW9HTHNIZkR3Wkp5am5Md01vc1pHWmhGRUhQZU1o?=
 =?utf-8?B?R0hJWUduS2lack9VczhaK2JrbmVQK3czT0tqYXErNVVlU3kzU2pBYXNWNExK?=
 =?utf-8?B?Z1FYMzhwTVpaWXlrL0FlUGNJZlJaeHV6WXlwWjlGd1oyZi9QNWVaL0tBb2E2?=
 =?utf-8?B?QVd4VHNYcnNHTWpkN1pPZ2J5NlloUUtQVkxhbTN6UGdzRmxpVEdYWlRhaDZD?=
 =?utf-8?B?ZExZd0JnNnVIa2xjYjB2Ni95OUVlZ2FlNG0wbWUyN2YrM2I4R2VrU2dldDhS?=
 =?utf-8?B?MFA3VGxjZlRxVVVQbGhGU1Y2Q3F0YkJLekk0ZjZCaUtiL1d2ZS8zMkh1MnNT?=
 =?utf-8?B?NHA5Z0tNbHRiV0MwWk4wUW5uOG8xaXBjQTdLUm1GWWpKdEttbi95VFh6TjdL?=
 =?utf-8?B?R3hmblJMdU5jbm4vTXRNREY4SVd1TVdpL1RDUFlsT3RmejV3VGlIVU1sb2I4?=
 =?utf-8?B?RlNmN3hwbW1UMmlXTlVwT2pmYVFaQUUvKzFJREd4R1o5ekFVbXRnRHc3dVdz?=
 =?utf-8?B?UTBPVWRjUGdkbzhTZmpGK0tQYjNCdXhvTWpkQjMwRU5yd3QydkJuT3Rhb1FX?=
 =?utf-8?B?TUxjYWw2M3dpV21sWXU2aUNURm1rY2VrUnhkK0g4SkJpS2x3dlJTdjM3K1lK?=
 =?utf-8?B?dFYxS0EyYm9TZjdnNTBaUmhEMVZLbkowM244eUZ1VnYyZEFJU3Rla2x6YzJU?=
 =?utf-8?B?cWJTVUozbU13RXRnWTkrQ3Btd2pCbnhFNUROMXFjbVU4TzJ3VVR3dWR1M0Fv?=
 =?utf-8?B?bkN1REdTWkJhVVhWODhYbjUxQjNmQzBqbmQrTGpxR0JNcEdPRUllWDhpeDZK?=
 =?utf-8?B?WU5oRUFDbWZTeTZ1WjNsdXQ0NUs3MEdzTUJySHB3NXJ5ZXVmazRMbldXUzdJ?=
 =?utf-8?Q?/lYTDGeauDScVg2a4u?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7777c56f-01df-4a27-ddae-08de7800b613
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 02:09:18.2809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mvh/bNzPqVC67iVo8hBjqVa9E8yQhtHBmk9T6WFc37TH0UzZV9EnElA7dyFV4f+ISK9NrM5EkpRe0ZXbfnU+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7711
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54031-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,gmail.com,ideasonboard.com,posteo.de,puri.sm,kernel.org,pengutronix.de,nxp.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7C081D26A1
X-Rspamd-Action: no action

SGkgTGF1cmVudCwNCg0KU29ycnkgZm9yIGJvdGhlciB5b3UgYWdhaW4uDQoNCk1heSBJIGFzayBp
ZiB5b3UgaGF2ZSBhbnkgb3RoZXIgY29tbWVudHMgb24gdGhpcyBwYXRjaCBvciB0aGUgc2VyaWFs
cz8gSWYgbm90LCBjb3VsZCB3ZSBtYWtlIGl0IGZvcndhcmQ/IFRoYW5rcy4NCg0KQmVzdCBSZWdh
cmRzDQpHLk4gWmhvdQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEcu
Ti4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgNSwgMjAyNSA1OjA1IFBNDQo+IFRvOiBSdWkgTWlndWVsIFNpbHZhIDxybWZyZnNA
Z21haWwuY29tPjsgTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPjsgTWFydGluIEtlcHBsaW5nZXINCj4gPG1hcnRpbmtAcG9zdGVvLmRlPjsgUHVy
aXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT47IE1hdXJvDQo+IENhcnZhbGhvIENoZWhh
YiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47DQo+
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleQ0K
PiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47
IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4IEtl
cm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIDxmZXN0
ZXZhbUBnbWFpbC5jb20+OyBQaGlsaXBwDQo+IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBpbXhAbGlzdHMubGludXgu
ZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBHLk4uIFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCB2MTAgMi81XSBtZWRpYTogaW14OG1xLW1pcGktY3NpMjogVXNlDQo+IGRl
dm1fY2xrX2J1bGtfZ2V0X2FsbCgpIHRvIGZldGNoIGNsb2Nrcw0KPiANCj4gRnJvbTogR3Vvbml1
IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+IA0KPiBVc2UgZGV2bV9jbGtfYnVsa19nZXRf
YWxsKCkgaGVscGVyIHRvIHNpbXBsaWZ5IGNsb2NrIGhhbmRsZSBjb2RlLg0KPiANCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpo
b3VAbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEt
bWlwaS1jc2kyLmMgfCA1NSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAtDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jDQo+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jDQo+IGluZGV4
DQo+IDM3MWI0ZTgxMzI4YzEwNzI2OWY4OWRhMjM4MThhYjBhYmQwMTc5ZGEuLjBlM2E0MWNkMzVl
ZGZlZmM1MWI1NjMxDQo+IGUyYzM2ZmQ3NmUzZTE0ZDgzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2kyLmMNCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jDQo+IEBAIC03MSwyMSArNzEsNiBA
QCBlbnVtIHsNCj4gIAlTVF9TVVNQRU5ERUQJPSA0LA0KPiAgfTsNCj4gDQo+IC1lbnVtIGlteDht
cV9taXBpX2NzaV9jbGsgew0KPiAtCUNTSTJfQ0xLX0NPUkUsDQo+IC0JQ1NJMl9DTEtfRVNDLA0K
PiAtCUNTSTJfQ0xLX1VJLA0KPiAtCUNTSTJfTlVNX0NMS1MsDQo+IC19Ow0KPiAtDQo+IC1zdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IGlteDhtcV9taXBpX2NzaV9jbGtfaWRbQ1NJMl9OVU1fQ0xL
U10gPSB7DQo+IC0JW0NTSTJfQ0xLX0NPUkVdID0gImNvcmUiLA0KPiAtCVtDU0kyX0NMS19FU0Nd
ID0gImVzYyIsDQo+IC0JW0NTSTJfQ0xLX1VJXSA9ICJ1aSIsDQo+IC19Ow0KPiAtDQo+IC0jZGVm
aW5lIENTSTJfTlVNX0NMS1MJQVJSQVlfU0laRShpbXg4bXFfbWlwaV9jc2lfY2xrX2lkKQ0KPiAt
DQo+ICBzdHJ1Y3QgaW14OG1xX3BsYXRfZGF0YSB7DQo+ICAJaW50ICgqZW5hYmxlKShzdHJ1Y3Qg
Y3NpX3N0YXRlICpzdGF0ZSwgdTMyIGhzX3NldHRsZSk7DQo+ICAJdm9pZCAoKmRpc2FibGUpKHN0
cnVjdCBjc2lfc3RhdGUgKnN0YXRlKTsgQEAgLTExMSw3ICs5Niw5IEBAIHN0cnVjdA0KPiBjc2lf
c3RhdGUgew0KPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gIAljb25zdCBzdHJ1Y3QgaW14OG1x
X3BsYXRfZGF0YSAqcGRhdGE7DQo+ICAJdm9pZCBfX2lvbWVtICpyZWdzOw0KPiAtCXN0cnVjdCBj
bGtfYnVsa19kYXRhIGNsa3NbQ1NJMl9OVU1fQ0xLU107DQo+ICsJc3RydWN0IGNsa19idWxrX2Rh
dGEgKmNsa3M7DQo+ICsJc3RydWN0IGNsayAqZXNjX2NsazsNCj4gKwl1MzIgbnVtX2Nsa3M7DQo+
ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsNCj4gIAlzdHJ1Y3QgcmVndWxhdG9yICptaXBp
X3BoeV9yZWd1bGF0b3I7DQo+IA0KPiBAQCAtMzg0LDI0ICszNzEsMTYgQEAgc3RhdGljIHZvaWQg
aW14OG1xX21pcGlfY3NpX3NldF9wYXJhbXMoc3RydWN0DQo+IGNzaV9zdGF0ZSAqc3RhdGUpDQo+
ICAJCQkgICAgICBDU0kyUlhfU0VORF9MRVZFTCk7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBp
bXg4bXFfbWlwaV9jc2lfY2xrX2VuYWJsZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkgLXsNCj4g
LQlyZXR1cm4gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoQ1NJMl9OVU1fQ0xLUywgc3RhdGUtPmNs
a3MpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgdm9pZCBpbXg4bXFfbWlwaV9jc2lfY2xrX2Rpc2Fi
bGUoc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUpIC17DQo+IC0JY2xrX2J1bGtfZGlzYWJsZV91bnBy
ZXBhcmUoQ1NJMl9OVU1fQ0xLUywgc3RhdGUtPmNsa3MpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMg
aW50IGlteDhtcV9taXBpX2NzaV9jbGtfZ2V0KHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlKQ0KPiAr
c3RhdGljIHN0cnVjdCBjbGsgKmZpbmRfZXNjX2NsayhzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkN
Cj4gIHsNCj4gIAl1bnNpZ25lZCBpbnQgaTsNCj4gDQo+IC0JZm9yIChpID0gMDsgaSA8IENTSTJf
TlVNX0NMS1M7IGkrKykNCj4gLQkJc3RhdGUtPmNsa3NbaV0uaWQgPSBpbXg4bXFfbWlwaV9jc2lf
Y2xrX2lkW2ldOw0KPiArCWZvciAoaSA9IDA7IGkgPCBzdGF0ZS0+bnVtX2Nsa3M7IGkrKykgew0K
PiArCQlpZiAoIXN0cmNtcChzdGF0ZS0+Y2xrc1tpXS5pZCwgImVzYyIpKQ0KPiArCQkJcmV0dXJu
IHN0YXRlLT5jbGtzW2ldLmNsazsNCj4gKwl9DQo+IA0KPiAtCXJldHVybiBkZXZtX2Nsa19idWxr
X2dldChzdGF0ZS0+ZGV2LCBDU0kyX05VTV9DTEtTLCBzdGF0ZS0+Y2xrcyk7DQo+ICsJcmV0dXJu
IEVSUl9QVFIoLUVOT0RFVik7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBpbXg4bXFfbWlwaV9j
c2lfY2FsY19oc19zZXR0bGUoc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUsIEBAIC00NTYsNw0KPiAr
NDM1LDcgQEAgc3RhdGljIGludCBpbXg4bXFfbWlwaV9jc2lfY2FsY19oc19zZXR0bGUoc3RydWN0
IGNzaV9zdGF0ZSAqc3RhdGUsDQo+ICAJICogZG9jdW1lbnRhdGlvbiByZWNvbW1lbmRzIHBpY2tp
bmcgYSB2YWx1ZSBhd2F5IGZyb20gdGhlDQo+IGJvdW5kYXJpZXMuDQo+ICAJICogTGV0J3MgcGlj
ayB0aGUgYXZlcmFnZS4NCj4gIAkgKi8NCj4gLQllc2NfY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUo
c3RhdGUtPmNsa3NbQ1NJMl9DTEtfRVNDXS5jbGspOw0KPiArCWVzY19jbGtfcmF0ZSA9IGNsa19n
ZXRfcmF0ZShzdGF0ZS0+ZXNjX2Nsayk7DQo+ICAJaWYgKCFlc2NfY2xrX3JhdGUpIHsNCj4gIAkJ
ZGV2X2VycihzdGF0ZS0+ZGV2LCAiQ291bGQgbm90IGdldCBlc2MgY2xvY2sgcmF0ZS5cbiIpOw0K
PiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gQEAgLTc4Myw3ICs3NjIsNyBAQCBzdGF0aWMgdm9pZCBp
bXg4bXFfbWlwaV9jc2lfcG1fc3VzcGVuZChzdHJ1Y3QNCj4gZGV2aWNlICpkZXYpDQo+IA0KPiAg
CWlmIChzdGF0ZS0+c3RhdGUgJiBTVF9QT1dFUkVEKSB7DQo+ICAJCWlteDhtcV9taXBpX2NzaV9z
dG9wX3N0cmVhbShzdGF0ZSk7DQo+IC0JCWlteDhtcV9taXBpX2NzaV9jbGtfZGlzYWJsZShzdGF0
ZSk7DQo+ICsJCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKHN0YXRlLT5udW1fY2xrcywgc3Rh
dGUtPmNsa3MpOw0KPiAgCQlzdGF0ZS0+c3RhdGUgJj0gflNUX1BPV0VSRUQ7DQo+ICAJfQ0KPiAN
Cj4gQEAgLTgwMSw3ICs3ODAsNyBAQCBzdGF0aWMgaW50IGlteDhtcV9taXBpX2NzaV9wbV9yZXN1
bWUoc3RydWN0IGRldmljZQ0KPiAqZGV2KQ0KPiANCj4gIAlpZiAoIShzdGF0ZS0+c3RhdGUgJiBT
VF9QT1dFUkVEKSkgew0KPiAgCQlzdGF0ZS0+c3RhdGUgfD0gU1RfUE9XRVJFRDsNCj4gLQkJcmV0
ID0gaW14OG1xX21pcGlfY3NpX2Nsa19lbmFibGUoc3RhdGUpOw0KPiArCQlyZXQgPSBjbGtfYnVs
a19wcmVwYXJlX2VuYWJsZShzdGF0ZS0+bnVtX2Nsa3MsIHN0YXRlLT5jbGtzKTsNCj4gIAl9DQo+
ICAJaWYgKHN0YXRlLT5zdGF0ZSAmIFNUX1NUUkVBTUlORykgew0KPiAgCQlzZF9zdGF0ZSA9IHY0
bDJfc3ViZGV2X2xvY2tfYW5kX2dldF9hY3RpdmVfc3RhdGUoc2QpOw0KPiBAQCAtMTAyNyw5ICsx
MDA2LDE1IEBAIHN0YXRpYyBpbnQgaW14OG1xX21pcGlfY3NpX3Byb2JlKHN0cnVjdA0KPiBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJaWYgKElTX0VSUihzdGF0ZS0+cmVncykpDQo+ICAJCXJl
dHVybiBQVFJfRVJSKHN0YXRlLT5yZWdzKTsNCj4gDQo+IC0JcmV0ID0gaW14OG1xX21pcGlfY3Np
X2Nsa19nZXQoc3RhdGUpOw0KPiArCXJldCA9IGRldm1fY2xrX2J1bGtfZ2V0X2FsbChkZXYsICZz
dGF0ZS0+Y2xrcyk7DQo+ICAJaWYgKHJldCA8IDApDQo+IC0JCXJldHVybiByZXQ7DQo+ICsJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOw0K
PiArDQo+ICsJc3RhdGUtPm51bV9jbGtzID0gcmV0Ow0KPiArDQo+ICsJc3RhdGUtPmVzY19jbGsg
PSBmaW5kX2VzY19jbGsoc3RhdGUpOw0KPiArCWlmIChJU19FUlIoc3RhdGUtPmVzY19jbGspKQ0K
PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3RhdGUtPmVzY19jbGspLCAi
Q291bGRuJ3QNCj4gZmluZCBlc2MNCj4gK2Nsb2NrXG4iKTsNCj4gDQo+ICAJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgJnN0YXRlLT5zZCk7DQo+IA0KPiANCj4gLS0NCj4gMi4zNC4xDQoNCg==

