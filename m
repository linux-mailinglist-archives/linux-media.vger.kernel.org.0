Return-Path: <linux-media+bounces-64130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RaWhEJJgJmqDVgIAu9opvQ
	(envelope-from <linux-media+bounces-64130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:26:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C66531CE
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qJhUGK7x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64130-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64130-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E14053003812
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 06:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834F8387596;
	Mon,  8 Jun 2026 06:26:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476831A807;
	Mon,  8 Jun 2026 06:26:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899977; cv=fail; b=WmKwdnlJoEVk14ZiXcz45KPTdUQvIbN0bON3b/XRB3S6tXsBD+fUDKfVpl6bnyav2c6AxNj4hZ7pDFlcifcHGWPhQqOgHlOJ42EJlyBKCO8lD+YIvDTtnMCbXkRU00d4hQ2k2t/jLnpAM9EuwtV5QWE//Cng+INExovnFLO1Shc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899977; c=relaxed/simple;
	bh=iJ2qofd75PNFKKII1geu7vjYMKSzvEFbuQBW3Zh6+5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q4ejXleXv0DADX4B3HGFpgrg75ofQwLjb37vjEzjzBXdHGBIsUc7Yg+P4KNLaRogCS6pDXCfvG7aQ7eqKj8HLg4Z8+mGhU5xISHFnQObg/mBAzwmFjJHDTitbQhm4Xx+QGkdtjy5RZZa/eliI3YbkU+tqAYxRv1wEIvQIsI0QJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qJhUGK7x; arc=fail smtp.client-ip=52.101.70.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbBrB6SHv6h460OveRTrifzVmbfzXSZZb4R1nbndJZj7iG15OiQB+4SNsdtIjpuXVBkMhkpexg1rWQ6fiQWgSe2b0O2sSDdu7jO3/AhuCFN63cw1OhzqcsY7UGtffsVl+i4TVEMUBwiHkXmNT0XqdUmeH5PEIfPCIYW1gKc7tI4eMVYvKBbF025J8jkMWwNd4ZTo3twlzlBinoofykYqbxvSs56uTzb9Gikiw1dQUkrm+JnswxiGcT0gGsQJRmxYOGLzUQEEBUFaXLwbMdEK+BIsQJ6IDeTXoAchKOzUFKm8Lc1nCH4hAatUovirM/2ULVLrpeWKQP4A1yXQwI6x1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ2qofd75PNFKKII1geu7vjYMKSzvEFbuQBW3Zh6+5g=;
 b=i67G8zoReJDWksOJxiFE8ZtlrFcYj2Wixcy9WKtLm1P8c/tQES7UXYIjc52ZOypiQ1RnCtLliqOp5ziQFL+qKEUB/ndtOcGptGeEEGuzmIajXWHH7pGnac1gIvcHPKDw6j0BdiseFCDKnIw/i7THLCIdWIHtYtJfPG/Tpwrk3tgAV3h6XU/XI9y65Ct6YQvyqnMxRLlZivNCSMipdOcyrGlD1H5A1IgwpiFeMrlWPHk4OmEJ1/iwgItyvkl12AIUAgV19rEEivydHT9o9xRbafCMpdCY3C6BvkVCCsR31xCUSipSWUn0QbW1lNmUaaQcnWY6r7B39dVw+95hO5M4Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJ2qofd75PNFKKII1geu7vjYMKSzvEFbuQBW3Zh6+5g=;
 b=qJhUGK7xd5A2ojxyvLuobMd4fX/GPWJ2pAUb49XpRUsyo2Vs0UrbDWrW5E6ulKP9MJ1okpHRtAKCQMSHBigU3WDPwt11q+XINSe4Mm4r71+qAs87y2oN7jUsZWwcC0pjQcRicpUopwjfmfL7CaMotE/w94cF+NqlNAT3pbREpTFFnqw5BAjkHVGyc5KKFFLTh0telYgV3IFXPERQHyNHS9ieOzGuXQL9ArbWiE+gYtg+fToqKAutXLSdnhe18gWPZpMWHoi6ju8dBX+8h23mwajBeZjNEARPlaFXEexSe9R93Kf5psH2Ktsz3aGbH2sPiCcXPttdAGplt7HzT0eq7w==
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by DU2PR04MB9115.eurprd04.prod.outlook.com (2603:10a6:10:2f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 06:26:10 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 06:26:10 +0000
From: "Ming Qian (OSS)" <ming.qian@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>, Elliot Chen
	<elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFC 1/2] media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION
 usage
Thread-Topic: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
Thread-Index: AQHc9w+y6Bb8JEVUoE2hPHTUYf4hhw==
Date: Mon, 8 Jun 2026 06:26:10 +0000
Message-ID:
 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
 <20260608040616.1A3EE1F00893@smtp.kernel.org>
In-Reply-To: <20260608040616.1A3EE1F00893@smtp.kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8570:EE_|DU2PR04MB9115:EE_
x-ms-office365-filtering-correlation-id: 6ec2675c-d10f-4c08-89fe-08dec526d4c1
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|38070700021|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Sda5PVUDcQ/J5mBr9EHl/INSct0rtT6HDGA6jTS06klVwwN7k2tLByYXGaRLfuTgFOIx3cPCj3CNC7yP0XDcgLxtX9A4SM/08MrqOLlrZN37z9FBogew6XE5zlCMssio2TXxhp/aknE9nPypacZzS4Fl3oZbTryLhLV5/G0tQwCC5GxjEkfF/vL+svg2GeLP5TATVlJwPKgjG2vE4pz8/R0LEK4FtCZNCKXHWWXuuWOzzQ7wBK/dg8f7+/n9cCUBFh2JQm7RrXSEt3oh9dB+DARSMOJJGqS0r8inwd38GjMhCG8DrJnE9mky8mUCqBDYYO6shHloewA9b0BhZa9Pbd+pebFUDmLr8BrgPx3b+57XXKq+EJNsLvTOOTnYvh/XjJ5e+E8t7tZ0vEd/fIagEx+PH+HMoDOh6EUFAKNUDV4Bjq6pgb8Dg1eNK3/WicOSIIK3u5dcYsoOjVUIyVWekhryhD6O60iXSz+4hlHP+kyfnQGYrJk/WSolDHGV1WczzECDIJd1xoUWIEMPI9Urxv6nXEZZwTxY/AOn4SkilgAzBZYwmTYsqplrma6RkP+D0gzPYkbrGH0kVtocIw3XBeZY908OC2mD+eWx0dmCHd5ulv48xL48Xho0qfosNIU/ivgoZ2+m0+HORn0SKdWYzGfbmMxP7+RKA3tMPSLl+LHoNvEyG13IocDhEwsaK57J
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnExUWU4M1JjN3Z3VUlrcWp4SmtmbmozaE5pd1BGNnZPYlg2MGlVZUZCQlF0?=
 =?utf-8?B?R01BaEszV21pR3NFOXlQaXpGcUVrLzJIMTV2VFh5c1I3TDRuVzhRSGFDWWg0?=
 =?utf-8?B?MDRHS3EzTEdkcFNtT1hudEs1WHRIQWVOc0J5bHREb2ZtV1BDcENUakxyZkhG?=
 =?utf-8?B?bU9MTjIxTzBjZE40dHgwUmc4dWtKVlBYSjZSM250Q3hFUFRzR256a01Ma0Js?=
 =?utf-8?B?blVvTWs4M3daZXlUeEZqSTEweGJUcXdGRHRqOEtwTFlXdnpnTkZrV09wWXpJ?=
 =?utf-8?B?MytlSFpkbzJja0ROVWxIamhpWFpUZnVPakI5WmJ5YUkwdjNNOUhIU0RNSDdt?=
 =?utf-8?B?MGcyVVFNTTNtYmxCKzVMYlZ5YkMzZVdXQVJnN2FVNVJWbjVHYTdoZ1FiWHky?=
 =?utf-8?B?dDdKbGtmZjN6enkrMXYyOXR6ZEUxMmdoNWJyT3c0Qk5KVXFRdlJ4OXBBUUxT?=
 =?utf-8?B?dDdsMFhLZTQ2akdwWDdycHhCVVdiUW1CK2VVeTNWTVlhYzlNeDdRSm02enkz?=
 =?utf-8?B?SVBWQWlob2tlbk1wUUZLd0J0dHQ2YWdPOFR1Zi94UE1DSjRBemh5L3h4MDFS?=
 =?utf-8?B?YmR2VzFYcU5xL2daSlQvUWc5bUhQSXZCVVJ1QjB5Z0FnWFFFMGh6S1B0OE1x?=
 =?utf-8?B?SW9BWDJybXVIYzQyOEIrM3BLTlNBRC9iNlhmS3ZZL3lJbFl6UEcrZlM3T1I1?=
 =?utf-8?B?b0tWd1FlVi9GR1FiWUNud3orVU1tayswN1BoMVMydlgzTDcvd0ZERmtqemlY?=
 =?utf-8?B?V2NpNWxiblFzSnIwVnFUcE9WbjV6WGZMV0Y5K3A4amcvZ2w4bThNQ2VuM2RE?=
 =?utf-8?B?N3J0N1lEUVdsOWhpOWI0bVM1RS9kdHpGY25ZS3NldlB4OTN0L0x6NEUrU1VF?=
 =?utf-8?B?cmk0T24yMXdyMjE5cDhCZWN6Sko1Zm5kWWJhdkRidmJhNlQycDdoVno5KzBn?=
 =?utf-8?B?Mnk4TzJzQnJPS2I1Z3dIQ0wyQmxDeEhtbHdHYWh3Rnp4SGwvUmNsREJZUDZr?=
 =?utf-8?B?SGhTVkJoT3hHbVlpVlF0UzZNbDVwSTU0RUpBSjVldnFVSEpaYzFTN0YzYnE5?=
 =?utf-8?B?M2YzdFdDRzZ6RnVRMzBFTGJ4V3RPeSt5dGRxdFlxQUk2eWNZVGdFcS9mbGtS?=
 =?utf-8?B?V1Q1Z1BEaXRyc0xBbDc3NHpENXl5dFFDZzVzTjVwdVNtODRYOVRLUGJ1MTg2?=
 =?utf-8?B?MkNlZFdpQWlXcU16MlB3dG8wMGFieEIzNDV3dHFQcXh1SXM0S3VrSnZ2ZjJv?=
 =?utf-8?B?SjdMWHJFaHZJZU9uaFozMGN2USsxeGcrNkhEdFpSRExqZkZCVE1ZaEVZZlBI?=
 =?utf-8?B?c2hwc2NSYmFSNWlOL2pJMkJCd3d0a0xyY3lyMkF5dlpibVRPaW55eEQ1NVFN?=
 =?utf-8?B?MG81clhrbjdEblJkaFNtNU9zRC9wZ1IwNjdzRmptalFDQmJyMmd0UWd6Y200?=
 =?utf-8?B?U0UzMzF6U0Npc1l0ZWhZRXpnejF6Z3FLK2xKZzFQMENnclFQM0o2WHhFajBl?=
 =?utf-8?B?RGRiZ1JWU3pYMit5cGJ5ZVhDbkZxa3VXSFFtRkdnbFNTVzREK3gyWlBzZVpN?=
 =?utf-8?B?VXNjLzJ1Z2M3dXE2VDF3aEhLU09sZDVaOWYySmJSdVR2Y1NJMDJrQXFndzQv?=
 =?utf-8?B?WGRFcHkxc2FaS2V0ekFvWHJ1RUlmMlZ0M1FVbUY1a3RnUnlJRVNPV1o0WE9m?=
 =?utf-8?B?SmxiTlhYVHdzUXFJWEhmSDAwc2hZa0t6Y2FOdFkxZXp4aFZIVzhuV3RqUEl0?=
 =?utf-8?B?d0xQclNmdkdzMjRQaXg2bWEwVU9QMXB3V1dOTTV4bnIweDVDRTU3S1FMU2p1?=
 =?utf-8?B?N1I5UERtN3ZpcmhjbVUrRjZidnVFbG56WWNWbzZ3WWZBYmdJMGZWdkZWSzNa?=
 =?utf-8?B?QnN0M09IUFpXZmFwd0xTNXdNb1VpVCtjaHZzaGs2eE94dW84U0k0Z2tiK2V4?=
 =?utf-8?B?SjZnenRBT1Q3Y0hQVk1EUU1LNnJ2dUZMcHgvOE5IUXZBWGE0dFBtZmQ2Nk5M?=
 =?utf-8?B?eWRmQTBzOWhHeEh3VTJROWtyeTR5emY2dlMxUGwxaG03b3czVHR5ekhldjFM?=
 =?utf-8?B?KytVaWYrNEFpN3RJZnphUE94TU9ZN0hra2ltejVuQ015UFI0YlgvSWxyOGxy?=
 =?utf-8?B?citpSGE2cnc4SUwzempCK1BuNERYYUtxSFpVWERFWmdDOHBrY3pIazBZMVRq?=
 =?utf-8?B?TlE1TDVQK2MvRFNpb1ZFcER5bXlLRWlCUG1JVVFSWjlNcUQyM1dtRitEY0p3?=
 =?utf-8?B?YTRZa3Zxb2dOb3RDVUIyZFp5VGlpaXo3WDM1a0N3aGlaMDlsTVNuYysxclRK?=
 =?utf-8?B?UjNaTm5NTTNBTHdBNFFMTGRCTzJ0SEhGWjZGRkRUT0NGeUpNTDYxQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec2675c-d10f-4c08-89fe-08dec526d4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 06:26:10.1062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: on06mWaAysnjCB+pTeV58JQb8EQ+Lx7WuEJTwUE9EWhjXx9mdu1X9WicZKXlTQIesTVNnG3QULzYM2oDf2gILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:nicolas.dufresne@collabora.com,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64130-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,sashiko.dev:url,gitlab.freedesktop.org:url,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B7C66531CE

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogTW9uZGF5LCBKdW5lIDgsIDIw
MjYgMTI6MDYgUE0NCj5UbzogTWluZyBRaWFuIChPU1MpIDxtaW5nLnFpYW5Ab3NzLm54cC5jb20+
DQo+Q2M6IGlteEBsaXN0cy5saW51eC5kZXY7IEZyYW5rLkxpQGtlcm5lbC5vcmc7IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIDEvMl0gbWVkaWE6
IGRvY3M6IENsYXJpZnkNCj5WNEwyX0ZNVF9GTEFHX0RZTl9SRVNPTFVUSU9OIHVzYWdlDQo+DQo+
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykNCj50byBjb25zaWRlcjoNCj4tIFtIaWdoXSBUaGUgYWRkZWQg
ZG9jdW1lbnRhdGlvbiBjb25mbGF0ZXMNCj5gVjRMMl9GTVRfRkxBR19EWU5fUkVTT0xVVElPTmAg
KHdoaWNoIGRlc2lnbmF0ZXMgbWlkLXN0cmVhbSBkeW5hbWljDQo+cmVzb2x1dGlvbiBzd2l0Y2hp
bmcgY2FwYWJpbGl0eSkgd2l0aCB0aGUgbWFuZGF0b3J5IGluaXRpYWwNCj5gVjRMMl9FVkVOVF9T
T1VSQ0VfQ0hBTkdFYCBldmVudC4gQnkgc3RhdGluZyAiQ2xpZW50cyBjYW4gdXNlIHRoaXMgZmxh
ZyB0bw0KPmRldGVybWluZSB3aGV0aGVyIHRoZSBkZWNvZGVyIHdpbGwgc2lnbmFsIHRoZSBpbml0
aWFsIHJlc29sdXRpb24iLCBpdCBleHBsaWNpdGx5DQo+bGVnaXRpbWl6ZXMgYSBmbGF3ZWQgdXNl
cnNwYWNlIGhldXJpc3RpYyB0aGF0IHZpb2xhdGVzIHRoZSBWNEwyIHN0YXRlZnVsIGRlY29kZXIN
Cj5zcGVjaWZpY2F0aW9uLiBUaGUgc3BlY2lmaWNhdGlvbiBtYW5kYXRlcyB0aGF0IGZvciBjb2Rl
ZCBmb3JtYXRzIGNvbnRhaW5pbmcNCj5yZXNvbHV0aW9uIGluZm8sIHRoZSBkZWNvZGVyIE1VU1Qg
cGFyc2UgdGhlIHN0cmVhbSBhbmQgZW1pdCBhbiBpbml0aWFsDQo+YFY0TDJfRVZFTlRfU09VUkNF
X0NIQU5HRWAgZXZlbnQgKEluaXRpYWxpemF0aW9uIFN0ZXAgNCkuIENvbXBsaWFudCBkcml2ZXJz
DQo+KGUuZy4sIGBjb2RhYCkgY29ycmVjdGx5IGVtaXQgdGhpcyBpbml0aWFsIGV2ZW50IGJ1dCBk
byBOT1Qgc2V0DQo+YFY0TDJfRk1UX0ZMQUdfRFlOX1JFU09MVVRJT05gIGJlY2F1c2UgdGhleSBs
YWNrIG1pZC1zdHJlYW0gc3dpdGNoaW5nDQo+Y2FwYWJpbGl0aWVzLiBJZiB1c2Vyc3BhY2UgZm9s
bG93cyB0aGlzIGRvY3VtZW50ZWQgYWR2aWNlLCBpdCB3aWxsIGVycm9uZW91c2x5DQo+c2tpcCB3
YWl0aW5nIGZvciB0aGUgaW5pdGlhbCBldmVudCBvbiB0aGVzZSBkcml2ZXJzLCBicmVha2luZyBD
YXB0dXJlIFNldHVwIGFuZA0KPnN0cmVhbSBkZWNvZGluZy4NCj4tLQ0KPg0KPmNvbW1pdCBlYzlj
MDU4MzMzNGMyNDZmNzgxMzEzMmI1NTcyNGU0MjYyMmU4ZWRkDQo+QXV0aG9yOiBNaW5nIFFpYW4g
PG1pbmcucWlhbkBvc3MubnhwLmNvbT4NCj4NCj5tZWRpYTogZG9jczogQ2xhcmlmeSBWNEwyX0ZN
VF9GTEFHX0RZTl9SRVNPTFVUSU9OIHVzYWdlDQo+DQo+VGhpcyBjb21taXQgdXBkYXRlcyB0aGUg
VjRMMiBzdGF0ZWZ1bCBkZWNvZGVyIGRvY3VtZW50YXRpb24gdG8gY2xhcmlmeSB0aGUNCj51c2Fn
ZSBvZiB0aGUgVjRMMl9GTVRfRkxBR19EWU5fUkVTT0xVVElPTiBmbGFnLiBJdCBhZGRzIGEgbm90
ZSBzdGF0aW5nDQo+dGhhdCBkZWNvZGVycyBzZXR0aW5nIHRoaXMgZmxhZyB3aWxsIGFsd2F5cyBl
bWl0IGFuIGluaXRpYWwgc291cmNlIGNoYW5nZSBldmVudC4NCj5UaGUgZG9jdW1lbnRhdGlvbiBz
dWdnZXN0cyBjbGllbnRzIGNhbiB1c2UgdGhpcyBmbGFnIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHdh
aXQNCj5mb3IgdGhlIGluaXRpYWwgcmVzb2x1dGlvbiBzaWduYWwuDQo+DQo+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9kZXYtZGVjb2Rlci5yc3QN
Cj4+IGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9kZXYtZGVjb2Rlci5y
c3QNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvZGV2LWRl
Y29kZXIucnN0DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRs
L2Rldi1kZWNvZGVyLnJzdA0KPj4gQEAgLTM2MSw2ICszNjEsMTQgQEAgSW5pdGlhbGl6YXRpb24N
Cj5bIC4uLiBdDQo+PiArICAgIC4uIG5vdGU6Og0KPj4gKw0KPj4gKyAgICAgICBEZWNvZGVycyB0
aGF0IHNldCB0aGUgYGBWNEwyX0ZNVF9GTEFHX0RZTl9SRVNPTFVUSU9OYGAgZmxhZyBmb3INCj50
aGUNCj4+ICsgICAgICAgY29kZWQgZm9ybWF0IHdpbGwgYWx3YXlzIGVtaXQgYW4gaW5pdGlhbA0K
PmBgVjRMMl9FVkVOVF9TT1VSQ0VfQ0hBTkdFYGANCj4+ICsgICAgICAgZXZlbnQgd2l0aCBgYFY0
TDJfRVZFTlRfU1JDX0NIX1JFU09MVVRJT05gYCBkdXJpbmcgdGhpcyBwaGFzZS4NCj5DbGllbnRz
DQo+PiArICAgICAgIGNhbiB1c2UgdGhpcyBmbGFnIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBk
ZWNvZGVyIHdpbGwgc2lnbmFsIHRoZQ0KPj4gKyAgICAgICBpbml0aWFsIHJlc29sdXRpb24gYmVm
b3JlIHByb2R1Y2luZyBkZWNvZGVkIGZyYW1lcy4NCj4NCj5bU2V2ZXJpdHk6IEhpZ2hdDQo+RG9l
cyB0aGlzIGd1aWRhbmNlIGNvbmZsYXRlIHRoZSBWNEwyX0ZNVF9GTEFHX0RZTl9SRVNPTFVUSU9O
IGZsYWcsDQo+d2hpY2ggZGVzaWduYXRlcyBtaWQtc3RyZWFtIGR5bmFtaWMgcmVzb2x1dGlvbiBz
d2l0Y2hpbmcsIHdpdGggdGhlDQo+bWFuZGF0b3J5IGluaXRpYWwgVjRMMl9FVkVOVF9TT1VSQ0Vf
Q0hBTkdFIGV2ZW50Pw0KPg0KPlRoZSBWNEwyIFN0YXRlZnVsIERlY29kZXIgQVBJIHJlcXVpcmVz
IGFuIGluaXRpYWwNCj5WNEwyX0VWRU5UX1NPVVJDRV9DSEFOR0UgZXZlbnQgZHVyaW5nIHRoZSBJ
bml0aWFsaXphdGlvbiBwaGFzZSBmb3Igc3RyZWFtDQo+cGFyc2luZywgaXJyZXNwZWN0aXZlIG9m
IGR5bmFtaWMgcmVzb2x1dGlvbiBzdXBwb3J0Lg0KPg0KPkNvbXBsaWFudCBkcml2ZXJzIGxpa2Ug
Y29kYSBjb3JyZWN0bHkgZW1pdCB0aGlzIGluaXRpYWwgZXZlbnQgYnV0IGRvIG5vdCBzZXQNCj5W
NEwyX0ZNVF9GTEFHX0RZTl9SRVNPTFVUSU9OIGJlY2F1c2UgdGhleSBsYWNrIG1pZC1zdHJlYW0g
c3dpdGNoaW5nDQo+Y2FwYWJpbGl0aWVzLg0KPg0KPklmIHVzZXJzcGFjZSBmb2xsb3dzIHRoaXMg
ZG9jdW1lbnRlZCBhZHZpY2UsIHdvdWxkbid0IGl0IGVycm9uZW91c2x5IHNraXANCj53YWl0aW5n
IGZvciB0aGUgaW5pdGlhbCBldmVudCBvbiB0aGVzZSBkcml2ZXJzLCBwb3RlbnRpYWxseSBicmVh
a2luZyBjYXB0dXJlIHNldHVwDQo+YW5kIHN0cmVhbSBkZWNvZGluZz8NCj4NCj4tLQ0KPlNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYwOC1m
bGFnLWR5bi0NCj5yZXNvbHV0aW9uLXYxLTAtNDRkYzY1NTE2MTQ4QG9zcy5ueHAuY29tP3BhcnQ9
MQ0KDQpIaSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpZb3UgYXJlIHJpZ2h0IHRoYXQg
dGhlIFY0TDIgc3RhdGVmdWwgZGVjb2RlciBzcGVjaWZpY2F0aW9uIHN0YXRlcyB0aGUgaW5pdGlh
bCBWNEwyX0VWRU5UX1NPVVJDRV9DSEFOR0UgaXMgbWFuZGF0b3J5IGZvciBjb2RlZCBmb3JtYXRz
IHRoYXQgY29udGFpbiByZXNvbHV0aW9uIGluZm9ybWF0aW9uIGluIHRoZSBzdHJlYW0gKEluaXRp
YWxpemF0aW9uIFN0ZXAgNCkuDQoNCkhvd2V2ZXIsIGluIHByYWN0aWNlLCBHU3RyZWFtZXIncyB2
NGwyIHN0YXRlZnVsIGRlY29kZXIgaW1wbGVtZW50YXRpb24gdXNlcyBWNEwyX0ZNVF9GTEFHX0RZ
Tl9SRVNPTFVUSU9OIHRvIGRldGVybWluZSB3aGV0aGVyIHRvIHN1YnNjcmliZSBhbmQgd2FpdCBm
b3IgdGhlIGluaXRpYWwgc291cmNlIGNoYW5nZSBldmVudC4gVGhlIHJlYXNvbmluZyBmcm9tIHRo
ZSBHU3RyZWFtZXIgc2lkZSwgYXMgTmljb2xhcyBleHBsYWluZWQgWzFdOg0KDQogIA0KImh0dHBz
Oi8vZG9jcy5rZXJuZWwub3JnL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2Rldi1kZWNvZGVyLmh0
bWwjZHluYW1pYy1yZXNvbHV0aW9uLWNoYW5nZQ0KICAgIFNheXM6DQogICAgICAgIE5vdCBhbGwg
ZGVjb2RlcnMgY2FuIGRldGVjdCByZXNvbHV0aW9uIGNoYW5nZXMuIFRob3NlIHRoYXQgZG8gc2V0
IHRoZQ0KICAgICAgICBWNEwyX0ZNVF9GTEFHX0RZTl9SRVNPTFVUSU9OIGZsYWcuDQoNCiAgICBT
byBub3JtYWxseSB0aGF0IHdvcmRpbmcgc2hvdWxkIHByZXZlbnQgcmVxdWlyaW5nIGFuIGluaXRp
YWwgU1JDX0NILA0KICAgIG9yIGVtaXR0aW5nIGxhdGVyIFNSQ19DSC4gWW91ciBkcml2ZXIgZG9u
J3QgaGF2ZSB0aGlzIGZsYWcsIHRoZW4geW91cg0KICAgIGRyaXZlciBjYW4ndCBlbWl0IHRoaXMg
ZXZlbnQuIEJ1dCBhIG1lYXN1cmUgd2Ugc2hvdWxkIHRha2UgaW50bw0KICAgIEdTdHJlYW1lciB3
b3VsZCBiZSB0byBub3QgcmVnaXN0ZXIgKG9yIG1hcmspIHRoaXMgZXZlbnQuIg0KDQpATmljb2xh
cywgY291bGQgeW91IGVsYWJvcmF0ZSBvbiB3aHkgR1N0cmVhbWVyIG5lZWRzIFY0TDJfRk1UX0ZM
QUdfRFlOX1JFU09MVVRJT04gdG8gaGFuZGxlIHRoZSBpbml0aWFsIHNvdXJjZSBjaGFuZ2UgZXZl
bnQ/DQpJcyB0aGlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBmaXhlZCBvbiB0aGUgR1N0cmVh
bWVyIHNpZGUgKGkuZS4sIGFsd2F5cyB3YWl0IGZvciB0aGUgaW5pdGlhbCBldmVudCksIG9yIGlz
IHRoZSBjdXJyZW50IGhldXJpc3RpYyBpbnRlbnRpb25hbCBkdWUgdG8gbGVnYWN5IGRyaXZlcnMg
dGhhdCBkb24ndCBlbWl0IHRoZSBldmVudD8NCg0KWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9nc3RyZWFtZXIvZ3N0cmVhbWVyLy0vd29ya19pdGVtcy81MTI2DQoNCkJlc3QgcmVn
YXJkcywNCk1pbmcNCg==

