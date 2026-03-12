Return-Path: <linux-media+bounces-55458-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKztFmcjsmnlIwAAu9opvQ
	(envelope-from <linux-media+bounces-55458-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:22:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C961326C2C6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 196723013849
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 02:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE7D276058;
	Thu, 12 Mar 2026 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dpLLL1EA"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7303B33EAE4;
	Thu, 12 Mar 2026 02:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282146; cv=fail; b=T0lnLoQ6e3e+s4kY+ORHUEArojn18DEwTTkoRyIiiGHl13kGAQtg1ibDY4oucHQoUJdOVXLzW821NVNR/jNtosw985/P9ft5f5hQejgpyXsOkj9VDsLZXHM+4S6y3pAxz+gVooIUDRqFdIkiFzE50K1xEXfb3zXSll2ZCad8MWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282146; c=relaxed/simple;
	bh=0noB4RndQ6yXwsBUg3EoUQjlinlPl0vqLd1iVzRG8Pc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DbfVCnAlAVZrZL59wfGq2i/KkZ+ca+qBBa8gg5B+vypFZ79KwGPmP3KoHdoWIDxUJJe5BnNa5VdEDN3K8PHEh2yVKVpizxIlT/JCwKR/ZXrU9Nma8A9J9qa4+JIDaWx3kakuS0Jh//Gw5hkMWMkY9tESUFQW4s4ayZ2t7hHhz5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dpLLL1EA; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U44R/JrHY8bVrQjyhTdka+8HFjEZEeOQ9vU3buFHBUpqsdXb2eA91uob7QwrOWD/o+UGN+KtsEmAhXlzX5hr2KMVEIvmi+h9D8TyOaOmtLbX4BFZ/DJDvglOtMtC8e5iv0cbg3WPnYbYm6B5QJyUgLq8vF3/p/nkmGtRNm9htBuJAX9m4iWO2vrvnnPFe26pTr+xcROKZ5rV3uiOTYfjxKdiJkNi3vX6IWk1ajJJHkVCLSjiuDOuU11DVtVDTLPuU6W3c6MmFnFv+C5jytTx5yoWh67z8KufixtuSQmjwH0Kafwy3meVMxkX2vpt9u/SP8evbEOeVH79E14I8qQhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jnolAw+gPhbPiXWD26+sJUSEzna20JUOAlso4E/XiI=;
 b=f4p4TQHIVlAbLUwuUYToiGAFIXtYI9oSt2ahzPx6OihpsUTqHmBtrFC4v+//8waECTGoFcpHhiynl85bhOUCnyHK1cyu7wMGLBp1pq/1PNvB7Zp3IqaO4O+LMhEZN1DDTkXYV61XedmeKtO+mm30dqN+e5HUu7ZTWanbf87B0KgiBov/+axtBtS3qircgfs/vavPmtmf5m7vyO2VEhcmmZsFFUkf9xhFDapmhActIAM9CFIayd0/zbI0Ncwwy7PlKzB3IxzXth5ddLNSyWaLS1LlnKc9nErpA6rZbxP07uZbt2WvZ4Fuz/VaDgo/iSwAkP6JwZZu7YdBugu4g+Jc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jnolAw+gPhbPiXWD26+sJUSEzna20JUOAlso4E/XiI=;
 b=dpLLL1EABvwVIzuUgPIOju6vKCMBehWEY4ar7bKgWKuLM42jk7SMAAgzn9dTWrcc9FChU7JhZBvOlH/LbOL2JNqqRZ0zm9+L9SnI6CPJ2OxaotLbeXhD8klZAmHQo2BIK5km5HXEJ3o9Yj4pscakN/lbTEHYrNq9dEsA3hGDNZ4kLJS9yjbIHYDxeP7KkVo00iqvCSZITlbQXk4mKecvIdHPYoOQJVUOmc7C3G2R4wiA5Ga6q873aTNQWL3DeAMPuQ+FzJQHSriadbdAvWACUJA8c4Xy26Gro3/ev87uFHexTsHBnkoE5kdEYBlcai7mfyF1rgw7eCeNsEui+Ye8gg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 02:22:19 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 02:22:22 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Frank Li <frank.li@nxp.com>, "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alexi Birlinger <alexi.birlinger@nxp.com>,
	"G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Thread-Topic: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Thread-Index: AQHcsS09xxZTgBuBy061cWGEg+AH/7Wpc0WAgAC4eyA=
Date: Thu, 12 Mar 2026 02:22:22 +0000
Message-ID:
 <AS8PR04MB9080BE71AE42EC281CEE40A6FA44A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
 <abGImzSmXRUvPLm8@lizhi-Precision-Tower-5810>
In-Reply-To: <abGImzSmXRUvPLm8@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8957:EE_
x-ms-office365-filtering-correlation-id: 89c49f38-f5b0-4e04-1d95-08de7fde315f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 7DJhQHh1i+UJJkUxz/AukR9xryh/QlRMGNFN3nIh/1iubTlqYYstGo2naK5w9ZKZE/53v0xv4cMBgbBy7ia7QQYFpWZtrBJmynd67IySZiY31KY+nI0IQctLPnlkyIO4k7sSYBWxV7BxZ4/RXENtR3j+LrCRBqJ4meRunne54wX+bNUkoMWokHLhYc/dxqA0GjYECbEMXqJtNcUmtpcQbbIZx7/JLn04rFI2bjW7UocAkOKiTwcfCcqbyJClTzifx8c8I8i5a57JNjDiob7DERs+22OjaGwEHLWcX6N9j33V0v0kdu9QKv/JMzgeDWqhALgOJpSm5W86ude+3hffCTjHoZrK4J4BsHwHCt6fA6VQydA+frY66lmhsuRWRFIFWbH92jclt76A4Yl0jvGaC3XXzKXEAbSnG1bin5Qgb2MNZeezBN8YhdqX1SoIivZ5weh76RVHhm23DM5yyDR5R4FOAs6tDe+cHkLKHvRdCfVdkKxSVH0MH+Xdzf0jX6F4h9ORTtVaAGGfipKa8Op0On5OhhKxyUzbgOW5uDEV+BK7HZ0hpcxlcA/4AAmhlUmjCMxETeVCe6ZjaMsAHpscliushCMtBDnKdr3sAhO3ZKF7+8DgwazanhxHAY87BcSgdQ759UNDY95rb2mm2uYPvw0ZC/cREnuExL1tDHQNLpjTobQCN0q593qOnu3tKV1dfd9SP7ALrMFzere8HrAl5VvuxPtykQKiLDE5RfwYthzlCqaHshiuEkxUC+ZoioZwtEdAr0lWVe45dpyxNRPWQk0ZG4zYGgkU454MgV2a+DY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RqUexFPS2Y5rp0csEIufnFWaKgOfD/ByYlx+svVix70DRrKrbREthPr1E/m2?=
 =?us-ascii?Q?tPxb28d9zPuXCrEBauw71lRJiZWbFYaGI4Mlni/kucerI4xipO8hQWV9Jqgb?=
 =?us-ascii?Q?gCNhZ79T4GM729nkW/OiSbB5KhMI4YSN77pyLetcbS/g7IT4qHdyZ6PkgUMp?=
 =?us-ascii?Q?AB9SYgk1Aen/TggjnrLps0ocGEOfeidudAQBy6OH8cF+5I2fjfNdJMYESAxQ?=
 =?us-ascii?Q?C7qwugDZYsjNwhjlBsNlLcn+HlnTZieDhdyKv4h6kSTvhMtIPv8E9mQTC68n?=
 =?us-ascii?Q?pqClhyfrL08QUxCwnwdZnTMHzyvwyDhFwwRyomAGbz4FYMkbCAQ8nZU96tBP?=
 =?us-ascii?Q?x+aTJ5W/WHoYX/92vpLkauTHZZk0ErwIZGSvX5BsnCyWZMi0+zmZwnsIw4iG?=
 =?us-ascii?Q?57YiBbNLh06oiZJlKM/copO7cqr02lmFPYUlmRhdL7bRKRVg8/yL7EXvwUhC?=
 =?us-ascii?Q?pUwY+qkD3f5fUoKLbTR2KNzLZ8urQYrAyBS1UhYnvaeG7GotjkujsZpVqs7G?=
 =?us-ascii?Q?fsaXxqaOGeiXjUuCNaTyLhLNeReviBZwkLeNpMYfMXn8Kr3w2zQHN6a69/34?=
 =?us-ascii?Q?W6NMNqpmCmjZIGQQ1CFlTWEkvV3hNADsCLCUUX/oRpQi656CPBfxaSvJbIPZ?=
 =?us-ascii?Q?MWwUj+fOYRdbJ82wZ4vHO2O3U0CHRBzGJgm856XuiU6IWIXmaSFTWOmezhVu?=
 =?us-ascii?Q?rSk0vDQQc5GCYMvW0y/QujYDjhUjckgus3jvxWxH800N4wAdmuMUT9bCp0ts?=
 =?us-ascii?Q?hEN3cyQh93euhf9Ry143WDa5JIZu/L0n7m9nYUYVGTRluvzSZAADlG7kqWY6?=
 =?us-ascii?Q?3vUKiwAXldo8qb4XnSGFckZyfnfWiVQAOZ5ABbKkB1LUr/X3c5btcfMo5Y0U?=
 =?us-ascii?Q?fgl4i7Rl3MK2GZN2Z9sJXluAvUez8Fyfw/OzrAxHd3CP6CNLBo8aINPEOt5j?=
 =?us-ascii?Q?2m24u/YPFiKNdnHHgPAnrptwsU8VtCwI62lj37uZQ92lPG4Sc8rupMbCOIhD?=
 =?us-ascii?Q?7aMpSRz/XaOAjPWwL9SgQax+KKm9N8fgf2LWimqRT+Tu6vbcJ3t6yR/ynRVv?=
 =?us-ascii?Q?fVdQTszRPxIHFsO8q12DFt6og+y9fuuTCPDg+nwb3MWRGg6Kzl5uMX+b8z+d?=
 =?us-ascii?Q?TbnMkkqxASkCieJ5+fBZaVpRn5iGuyJyct9LIYwQH7HrxSxWC6DNmcDzGw6a?=
 =?us-ascii?Q?Bfe0sYGS1wwQSu/irhb2smvOCGB5dr0dMgXjRfBf2evBfUAlaWbRhnoAo5xz?=
 =?us-ascii?Q?7drDwCnPJwCjbd3+UDWc89dcJH4X4RtZXAirMz9KBE+sgtbo/xVDFfHyKuYM?=
 =?us-ascii?Q?0edOZ28rGlEoTEANKwHbpn02l8eTu157esgeQk8azPQNb6QsiMr5E9Mp/4m3?=
 =?us-ascii?Q?zEhCQ7VwnW11dX3NL7S5snk0TE1eHdOPB0OcI9mvQZ0E2vPB3zXOU/bUvYjE?=
 =?us-ascii?Q?dzCC8MFlZlS8xucqc/L1fShurZOuwLIr98zuLrXDdKOPQGut+Y4gue4a5Ioi?=
 =?us-ascii?Q?6UXIBeGi3Qr2A++jwFhos6UFi++sek2dtIqHIKmLHMB+cfMz+2lPPGAHEU+B?=
 =?us-ascii?Q?W5F46x2VlNDRVAOkQKRw+MNrWIoclFp4VycsEd2hFnk9AVhWxmnbxFv7SVAO?=
 =?us-ascii?Q?eecqYpBYH3k1tQsVJmahxqdwnvkN3upQQlLHViaiV3T9Vs1i+4GfmZRBIcnc?=
 =?us-ascii?Q?kZqqtJTo2h7mm440FuH8Pxqm9v8ZCLzI29ge0yHD3jKMMFJaTlkvEOyfqFXE?=
 =?us-ascii?Q?SU2AO90kxw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c49f38-f5b0-4e04-1d95-08de7fde315f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 02:22:22.0831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9FcOtYF+S5PeTFALKLnI707fLM6J5dW99FWQVQN9eCWZltUX9benYCgsMNJbIy0o7D2UFSFotdyHdatfyUQ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8957
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55458-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,nxp.com:email,linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,AS8PR04MB9080.eurprd04.prod.outlook.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: C961326C2C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thanks for your review.

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Wednesday, March 11, 2026 11:22 PM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; linux-media@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Alexi
> Birlinger <alexi.birlinger@nxp.com>; G.N. Zhou <guoniu.zhou@nxp.com>
> Subject: Re: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buff=
ers
> from 2 to 1
>=20
> On Wed, Mar 11, 2026 at 04:02:58PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > Fix a hang issue when capturing a single frame with applications like
> > cam in libcamera. It would hang waiting for the driver to complete the
> > buffer, but streaming never starts because min_queued_buffers was set t=
o 2.
> >
> > The ISI module uses a ping-pong buffer mechanism that requires two
> > buffers to be programmed at all times. However, when fewer than 2 user
> > buffers are available, the driver use internal discard buffers to fill
> > the remaining slot(s). Reduce minimum queued buffers from 2 to 1
> > allows streaming to start with a single buffer providing more flexibili=
ty for
> applications.
> >
>=20
> Fix tags?

Okay, will add in next version.

>=20
> Frank
>=20
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > index
> >
> 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..2405baf21594cd18cf2b3492
> 3431
> > 3c5e103b7802 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe
> *pipe,
> >  	q->mem_ops =3D &vb2_dma_contig_memops;
> >  	q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> >  	q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > -	q->min_queued_buffers =3D 2;
> > +	q->min_queued_buffers =3D 1;
> >  	q->lock =3D &video->lock;
> >  	q->dev =3D pipe->isi->dev;
> >
> >
> > --
> > 2.34.1
> >

