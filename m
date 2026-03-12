Return-Path: <linux-media+bounces-55457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FqNL0YjsmnlIwAAu9opvQ
	(envelope-from <linux-media+bounces-55457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:21:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC526C2B6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C877300CFC3
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 02:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BD7352C35;
	Thu, 12 Mar 2026 02:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aVn308IY"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1C345CAE;
	Thu, 12 Mar 2026 02:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282115; cv=fail; b=U2110eGNpByc1qQbVe9pc7hmMYBm/OMWMsCzpz/qqMnkhbqByR7z9sNigf977R6bUmlm5aM6SIJPQcfHwEZJlQ3uqoW5cywfW4UgznbQhDVoFEo4XLy8K1spfRPIKPE4x5Wath5cSyXmYCRpoFYdFkCMhVFpbHcKJXjCKKuDl1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282115; c=relaxed/simple;
	bh=317yuBhI4Il4azc7KSqgVo7jUrPkDnnRUzQfDfu3U1A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p0gQp6LSRRJuZ8MSkJ9IwWJo08ZLvGJwwVTovr3Z4F5rclU1q6HWpOcdmP6jG+4nVKNLnvjN3uzWpcE8uzP2jJ8geR1XUJ7QZhRrCMWPRc4UyfSzROKJPY2wMlIUz2nq9PGIskT3bmFsD2jdQSE+ZaggHxTdRHA91zXmbvI0Ccg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aVn308IY; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONbceGigJZTsl7hq4LbKM2Y5rdSo5LQMXbAhjUCPSszuFUrrsDYAWjHTbvkcsAtxBmIMlrKMYMplhTqTM2/ypQDzd2IT8gohGQ7CgKV4NYoskfOA4gGumOy7Yp4l4tpk0szEbAV1ZX6x9ez0PMlm+Lr5vwS0RxIMZNKt9InKLrpNw66nixZw4iPblVgx9tSPyeMNcsjQ7PkGWCE/vx164XrcR3S1wSdY+kKNzd4ttLMvRDDCxrU+3DO4u8WZqK3V2HsQSzUg+cRA1qc/j4ycR7JFBMzCWsOY7lK1U2pIPpGzoYz0gMvps+k2Xwgb1/wy98wXtIEO9Ri7LuzZKjizsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=317yuBhI4Il4azc7KSqgVo7jUrPkDnnRUzQfDfu3U1A=;
 b=bD7zWcHAoZnvxQqkuMpQw0z8BCTtMEP+jtuwjE4UicnPUF2A+poX8FqMZAlnAfpyxD0pdFlj8+3Ukbw4rbTAULw6Jf8IEXM4DikgbNUzslwrwcW08q/CeVjLGkBbiqkP28KB++8/NJOfzkJ73oFi1IqE+/gOEPHTCwzNH2q1h9ucO30swu05qEEm7w7D+87EsglFiYsZyYaic8R5I7V6W1nub5W5Cr/ILjaKNi3mZbG0CIjXSjxVB30yzsHnsKhADfaGIG4uYk2aI9CpVNIIrnrDlroMtzAW2NPBFjmoHAk+H2veQHTMU1h+OGmbdjtSi1AHCDT/wiXhAgp1+B0iuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=317yuBhI4Il4azc7KSqgVo7jUrPkDnnRUzQfDfu3U1A=;
 b=aVn308IY/fKmO6fMuk285St6UckCUswuaSBSvGWE3cF9FlaGfjJedIo9WXYRgAWskVnyfkwcQBT4T/hNtoVs3BjX40CBeP0s1v1upDpT4l5Nw8+WQ3PWIBcxfefPdsyVglmEVJVdyU9kjEKcw/YABZZ46/IAtV23n5kQvDl+PngSBhVCC8URVjcbA2Ii+eSef9LxR8JBC/JukrLcbCA16s1F1YIREtQUmCjcVJAH1dOxChk6RBDIpDEnCTC3FSb5/Rar0MebNdG/RDHxGHxvscnAlDT0dE0RssfeOc0Jh0RruEiAXacvg+eYvydysCDtNZ8qRgrigcithc7/Nh2RIA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 02:21:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 02:21:47 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alexi Birlinger <alexi.birlinger@nxp.com>,
	"G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Thread-Topic: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Thread-Index: AQHcscb67uwOhqrNaUyTXOCzQKeZHg==
Date: Thu, 12 Mar 2026 02:21:47 +0000
Message-ID:
 <AS8PR04MB90807A7568945AF2C96F78E8FA44A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com> <abFeguTCJQmoCLPK@zed>
In-Reply-To: <abFeguTCJQmoCLPK@zed>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8957:EE_
x-ms-office365-filtering-correlation-id: 11d73c01-eb8d-4626-f701-08de7fde1d00
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|19092799006|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 I7n5qTozjSpeeTsSoVeMZeam2+RwTHdt5EELOqEmVELe2WCUvfg0VAEqB2nVufDsNceWkOWSFSR08f7S9EcvrP6KLBLHgvO56Kegmb6lAXDTTh12UYp5luqYOeIwIdAl4vZTjPnTTf25eDxrdKdHKb07FmF2/oCd4/RzeUoFtorkpfUPWeuu1DN+SdqUuLwKDTdBQIraEo+2xR3cvRBFzKV7GpRFSiukuRXI/07imHx5kYTFe4YgoPhe1hOpYN8eUAgLSUTE/Ut9H7E1yuYIORAquqZGcmnH/RUsT3zHodKkzraeHEGELlwvZ1FQXXp3AMalV0CgzLGHO3QqsWfH2KtPGlnGePdPNo62vI5XTfxWc9vogB8duQVlv1+x1sCDrvqsq043ZTx4vcpUyKfAmkL8XMnVoHEOH2w6uPoPuSR9UnpJNjoHOARSHwiGzmOmyoEuLF7+Srn3dLCk0DPFL0aTzdEPNxfzkpxvP/voy4likr/FjyLDO8TLpAWCD0kPpdkuvx1tN8/Uwqp9gEh0h4AmobBFKDgmrmSyAT5HNq9tpiW0yTyHzM/61LymQf/own5OeYugg7etFYgvSfroQRRVR4+V0TdxqoYcCOH6tXQj/h1mMRH3Ik8PAWFjN1rCEgkSPZXpylmf3SVHWrx83wtd98YBD8oJ5Dtj89fl+dWAo2TqUL9TvGITRNbmXgCpajEp6346nBmQWeSjB+iaJEVZKD+nZXnRFEDC2/7oGiCBRvJsXX0siptQ8QYRtkQPNL1Gtstt0loXuteBHjLSOybGoEbh41248yjXxzdu6Lc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTZMeWZiYW1ZUVlkVitsSHo5RjNuMU95aUF0NE5DOHZJTmIxSEUrMk9aeDdZ?=
 =?utf-8?B?bGRvNUhQUkpTdUZTa1FsOGdYbmZ2T3RHNnpaSXdnOUo2SUIxZGd5RzFRbklK?=
 =?utf-8?B?ci9idTdUeU5SdkxLbzJLbUQrc0RmQmJST2JjTXI3cDVPY0YydU5kWTNGcDRR?=
 =?utf-8?B?UTVIckRlZ011WHdIa1VFR0dwQ3lsSTA2MFJtU2R4TzRUbG5XY25xOTh1VG05?=
 =?utf-8?B?WXNzcjBpazNFNHJnTXQvRkgxbGpmR1ZEa0RjZTdDVlllRis0bmR1WC80Yksz?=
 =?utf-8?B?MGhqL2R5Z3AzWWF3NVFIWVpZNFpRV09MYkN2SE9BQWF2UEJ0YzViQ3VxUUc1?=
 =?utf-8?B?RTFUV0R5M1VKT0c4NmdiTDZITWhjRUJ5bHRZRlhUQW8zcUlXVUFJV0p5RTZp?=
 =?utf-8?B?UUVxRWxrNlg5aVJIaHl1am9RM2V5UzIvWWxPYWhyOXZhelVTdWdJMlhSazdV?=
 =?utf-8?B?SUhzTmsyd1N0QVQvTDBFWUlXMzdJdXZSbU5HSXNnVkh2V25vdlBZVjRFQU0x?=
 =?utf-8?B?bTNzWlNVNE1jd0lFUzFuR0NuQTJlK1hzRmd5K2JCcFhRdzBsclNJWjlMelNY?=
 =?utf-8?B?aUFnVUxtM0JFSEFKdkUyeERGMCt3bm95VXM2Mm9RSWFOTVZjcWwwL1NkSlNJ?=
 =?utf-8?B?WjdCaXdWa0xOR2I3S2U5ZVZlOC9GNzdiM2VHTGZrSk55UnBteHhmTkM5eTNB?=
 =?utf-8?B?dEVubzBpNDdkclNqUGNRaHd6enVBTUVGbUhsTm14OUpiMC9HSlBueWhZR1lL?=
 =?utf-8?B?dEd3R2szcGYrbTFYUnc3bEh0RkM0Tk10d1NxSGtQRkx5RmNRSEl2OTlQY3oy?=
 =?utf-8?B?MHgwRnExc2hWc09OSENsbjNIVCtYdlZhd2RhWmlBYm14ZVBJelY5U1BrUzlh?=
 =?utf-8?B?ZTVaeFJNZlJsa3phc1pFRTRwdW4rZzlrdEE5NEU1WlIvTG44c2hRcFZUS2pQ?=
 =?utf-8?B?emRDeWR4YjdDSlRDNkpLNVhLdlRKSFlPOWtkM2xrNURoYnVHSCtDWElXSktZ?=
 =?utf-8?B?dHgrZzVwOUwyVy9RN3VVZFFVOXkrVzBmVnRHS1R4NkdIOEJLVG1zcldkb3lD?=
 =?utf-8?B?Wlc2UjlYUEFtd2JFOHpJUnBhdHE4d1FCUEpJREtIU3QwVlZ2eVNST0EwVW10?=
 =?utf-8?B?RlBGQlNpVnpTL212S041bWxYWm9FRDB5Uy9aOStVRmtaR1BxWldaY1hhbWQr?=
 =?utf-8?B?L2ZnNWl0YWtjVXNsUkd5SnFTdy9QZk1adW9qY1JIRUk2MGcxcWVaL3Q3bnRV?=
 =?utf-8?B?RGJHaUNRV2FvWWZjUUNJMkJOYy8xY0hRSEJWRzlmeXk3ei9ocmhUb00vQ3du?=
 =?utf-8?B?SHBzUjRHbGhPSWtBQTlMRVpQYzdXOU5RV0VKbEpkQlBjM3gyWmlYL2J1WHVY?=
 =?utf-8?B?T2VOVEpLc2NiRDVvSWgvRU9Dc2dmbmVPSWd6cEhTT0ZEYnJRN0x5WGhVS0h4?=
 =?utf-8?B?M3hBZnFGUlZkUTdzUmloTS94czM4c3Y5SlZtT1lqTTd2S0tNVllhUkFrNVNl?=
 =?utf-8?B?ZXYwVk85QnBIN3BwTGFsM2tFOXBZVE5nVEw2WS9LMytEOCtZd0tjbHhHNlJ3?=
 =?utf-8?B?REJQOW15STFEUk1kU0NVd1FQdEFpQU5IZTYyNXAvdHpBOENwVlBNWmpTcUpJ?=
 =?utf-8?B?YjBNRWE4aTBtRjB4YkZwaGxqL012amVVZGRDaEpZem01ZWdYRDIvOEpUaExB?=
 =?utf-8?B?dmJsS1dQUmZRSE8xQUVhcENtOXdiTXc2ZXFIRks4akVtYmpSbE9UOGZrTjd1?=
 =?utf-8?B?azM3cER6UXY2L2FJd2JLem5TZkR2bUxYKys1SC80Yk5tdm9pUVlVVnJiQnM4?=
 =?utf-8?B?N0dEMGphbzN4UHcyZSticCtEZm8rZXdoajNUU3BhdzBzY3lRM1pmV0x3NVg2?=
 =?utf-8?B?dm96dHc3Mmo5ZHUrMGtzTHIyU0M4a0Jxd0JMUzZYNk83MXpyTHZVQ1BxcEFR?=
 =?utf-8?B?Tmp0K2xrcFZuMFlScFhBYjVOWVpjcjFCd2I4cmVkVFJuWTA1TmhVRXViU1Bs?=
 =?utf-8?B?elQyNHFZZGMwSVdKWlJVc0F3ZEhnem5sYlpUamVoV2tXdW1kNnV3N3Rkb1Nk?=
 =?utf-8?B?SncxWENEaUJrYTBCUkRzQTVFano0eVo4c2I2ZWg2VlJGL20yT0pzVDhlUUlx?=
 =?utf-8?B?R25EREU1SzFoaUFWYjdXQTcySXFCcGVRTTdSczdPU3JDYlZEZ09yc01ITXRS?=
 =?utf-8?B?K0VIVXMzdmZJUStwL25oOHAyMDNXTUNKT2RFTmcwM1E1S0ZoTzNQTWxsL0Zu?=
 =?utf-8?B?YVpVdEoyR2RJakM5UC93WFR4bnRVaE1aeGdMcEtWV1REQ1Y5Z052dWRLZ216?=
 =?utf-8?B?Q0hSeHlEVVdtcFBHL2hFWUwrR05wWlZSK3NGRU9oN1BraHVYUTlnUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d73c01-eb8d-4626-f701-08de7fde1d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 02:21:47.8667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gvGM0u8cZ9eOJmSwMg5MToyxlbRQv0PrS6zoSw6HrnyUVBM24cf1gu/1ozxua+fHu4iEVoKrtBUFzlqV4oTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8957
X-Spamd-Result: default: False [1.54 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55457-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: 2EAC526C2B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFjb3BvLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEphY29wbyBNb25kaSA8amFjb3BvLm1vbmRpQGlkZWFzb25i
b2FyZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTEsIDIwMjYgODo1MSBQTQ0KPiBU
bzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IE1hdXJvIENh
cnZhbGhvDQo+IENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxp
QG54cC5jb20+OyBTYXNjaGEgSGF1ZXINCj4gPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBQZW5n
dXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0
ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgbGludXgtDQo+IG1lZGlhQHZnZXIua2VybmVsLm9y
ZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQWxleGkgQmlybGluZ2VyDQo+
IDxhbGV4aS5iaXJsaW5nZXJAbnhwLmNvbT47IEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIG1lZGlhOiBueHA6IGlteDgtaXNpOiBSZWR1
Y2UgbWluaW11bSBxdWV1ZWQgYnVmZmVycw0KPiBmcm9tIDIgdG8gMQ0KPiANCj4gSGVsbG8gR3Vv
bml1DQo+IA0KPiBPbiBXZWQsIE1hciAxMSwgMjAyNiBhdCAwNDowMjo1OFBNICswODAwLCBHdW9u
aXUgWmhvdSB3cm90ZToNCj4gPiBGcm9tOiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNv
bT4NCj4gPg0KPiA+IEZpeCBhIGhhbmcgaXNzdWUgd2hlbiBjYXB0dXJpbmcgYSBzaW5nbGUgZnJh
bWUgd2l0aCBhcHBsaWNhdGlvbnMgbGlrZQ0KPiA+IGNhbSBpbiBsaWJjYW1lcmEuIEl0IHdvdWxk
IGhhbmcgd2FpdGluZyBmb3IgdGhlIGRyaXZlciB0byBjb21wbGV0ZSB0aGUNCj4gPiBidWZmZXIs
IGJ1dCBzdHJlYW1pbmcgbmV2ZXIgc3RhcnRzIGJlY2F1c2UgbWluX3F1ZXVlZF9idWZmZXJzIHdh
cyBzZXQgdG8gMi4NCj4gPg0KPiA+IFRoZSBJU0kgbW9kdWxlIHVzZXMgYSBwaW5nLXBvbmcgYnVm
ZmVyIG1lY2hhbmlzbSB0aGF0IHJlcXVpcmVzIHR3bw0KPiA+IGJ1ZmZlcnMgdG8gYmUgcHJvZ3Jh
bW1lZCBhdCBhbGwgdGltZXMuIEhvd2V2ZXIsIHdoZW4gZmV3ZXIgdGhhbiAyIHVzZXINCj4gPiBi
dWZmZXJzIGFyZSBhdmFpbGFibGUsIHRoZSBkcml2ZXIgdXNlIGludGVybmFsIGRpc2NhcmQgYnVm
ZmVycyB0byBmaWxsDQo+ID4gdGhlIHJlbWFpbmluZyBzbG90KHMpLiBSZWR1Y2UgbWluaW11bSBx
dWV1ZWQgYnVmZmVycyBmcm9tIDIgdG8gMQ0KPiA+IGFsbG93cyBzdHJlYW1pbmcgdG8NCj4gDQo+
IERvZXMgaXQgbWVhbiB0aGUgSVNJIGNhbiB1c2UgaW50ZXJuYWwgYnVmZmVyIGRpc2NhcmQgZm9y
IGJvdGggYnVmZmVyIHNsb3RzID8gQ2FuDQo+IHdlIG1ha2UgbWluX3F1ZXVlZF9idWZmZXJzID09
IDAgPw0KDQpZZXMsIHdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiBzdGFy
dCB3aXRoIGEgc2luZ2xlIGJ1ZmZlciBwcm92aWRpbmcgbW9yZSBmbGV4aWJpbGl0eSBmb3IgYXBw
bGljYXRpb25zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1IFpob3UgPGd1b25pdS56
aG91QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lt
eDgtaXNpL2lteDgtaXNpLXZpZGVvLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXZpZGVvLmMNCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXZpZGVvLmMNCj4gPiBpbmRl
eA0KPiA+DQo+IDEzNjgyYmY2ZTlmODg5NWJiOWViMWY5MmQ1Zjc0YjBkNTk2ODU0NGUuLjI0MDVi
YWYyMTU5NGNkMThjZjJiMzQ5Mg0KPiAzNDMxDQo+ID4gM2M1ZTEwM2I3ODAyIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXZpZGVv
LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlz
aS12aWRlby5jDQo+ID4gQEAgLTE0MTAsNyArMTQxMCw3IEBAIGludCBteGNfaXNpX3ZpZGVvX3Jl
Z2lzdGVyKHN0cnVjdCBteGNfaXNpX3BpcGUNCj4gKnBpcGUsDQo+ID4gIAlxLT5tZW1fb3BzID0g
JnZiMl9kbWFfY29udGlnX21lbW9wczsNCj4gPiAgCXEtPmJ1Zl9zdHJ1Y3Rfc2l6ZSA9IHNpemVv
ZihzdHJ1Y3QgbXhjX2lzaV9idWZmZXIpOw0KPiA+ICAJcS0+dGltZXN0YW1wX2ZsYWdzID0gVjRM
Ml9CVUZfRkxBR19USU1FU1RBTVBfTU9OT1RPTklDOw0KPiA+IC0JcS0+bWluX3F1ZXVlZF9idWZm
ZXJzID0gMjsNCj4gPiArCXEtPm1pbl9xdWV1ZWRfYnVmZmVycyA9IDE7DQo+ID4gIAlxLT5sb2Nr
ID0gJnZpZGVvLT5sb2NrOw0KPiA+ICAJcS0+ZGV2ID0gcGlwZS0+aXNpLT5kZXY7DQo+ID4NCj4g
Pg0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4gPg0K

