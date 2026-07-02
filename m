Return-Path: <linux-media+bounces-66386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmRwJnSPRmpmYgsAu9opvQ
	(envelope-from <linux-media+bounces-66386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:19:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F26FA13A
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:18:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HSYpJLjQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66386-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66386-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09CD63077F31
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5535733B6ED;
	Thu,  2 Jul 2026 16:04:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF2330C37E;
	Thu,  2 Jul 2026 16:04:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008275; cv=fail; b=uffrGf03VOZGsiURt4yBNlY0jPzMsKzJ4j+RFG12AtMdK1H+ioGafOeQH4CBk46bkn5AE86ujddb5G82iR9KWHjna3xZrKJiyX8k+4z5Xd3GPg3aeIM0ctIxPrggln7IuYuMEOhXvcaVZS22esb6baAYrFkJ7XqoTGD0+yoUtoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008275; c=relaxed/simple;
	bh=qv51o+P0cV43v7+Q2eIL78h1lXcwLz70X8fuU9TVCqQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l0H47+qauufwJdXK6ndROuh6+G3k3cO6CyFUZQusditILNkbg6s8fa27T21lB0Z96P3LIPSBora+YJ4vbJT57RaiUxL7YJADN7bx2cfTJ6tDRxi1hj7+B0me81ucmNnZFsrMfh9T+iHj56l8zpmdW0bU0P9vaw3hHQIkP8Mot4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HSYpJLjQ; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWxWf5iOlUsDlRm0sEhaGkbghOrVu7E5iJwrzlOj7k/FfxMpWMaf+G/WGSoafsVnY2zvmGiNda2wW2dp3+HMAce0NODjdnjoUxbNs+JYnW7Km9Z4N84YOmJS9ZEWSxqZGA1km67cSBJCrqB7SqLMscBeGB71Xod155wYlbQP5uc1OsAuBJQjkmdeYuwASc1C2dApL6GnKBayaz/ZbqYTjS3wBMyKIUtTWasAu1mUfTFLb2K0a9guh/u5JyCvpzX3REcYbmzcGm1Xwj4ntmE/I4Jfd9b9kvAzjTA8ZnYHXnne1TZ46eeIRX/o5Sub/wR33TduSoLI9++9VNlMi8W5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEx//abuVk+cTRZeNvqVN5MlK0yJGyp0TYy3TfpOKbw=;
 b=vMlBfcoB1AqVVXwIqrcJhR5uhXSHP9UZrxnIsOBk5PRr01VwlCnuE+gId0KmqXmbXTZ+Nj+eGwRisXSn87NJ8HIPFrFB7j3rn58TH7DY2kMTe90UigmvxwXR5YLZFmNaFKWTnZ9cATxRSetesMxM+ZDD0fsoHHi41p+uu3OSeMnWDS9I65m4Fm+3Gah5CRsfKWh9vT92Pri8CFMmnoYocRqV3vaOAlMNwJPGHW4uojfEsqk+PV+ZiOQ7rZ8/i+vf2xvOcgATasWrhodNXkJlOmtDhDI8Ar+MEHsrb5oGycC8vLRJhjfTC3uwjFrihewF+8TXR8x5gfz27uniHq4RCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEx//abuVk+cTRZeNvqVN5MlK0yJGyp0TYy3TfpOKbw=;
 b=HSYpJLjQQSDcVNIH0PqqF8+vjbKHL0y3YbU+p3DsWXclyj18ZS2Od/EJSVUidSqloPcdOvI8nHKouereBEvxHymby/u53PmlcZ6Um0hEM2dX/bXTGRAEn53AB3rLc8pct61KWbJQQhd2Rv9QuGIsv2q/s9UehE6+zfejUa6YQ0hvxmqWhPGnoxAqw7YfPiNiIPn8e6lfo/cs2tfLpPWROJvNRomMIugTF29nW7B3uMMX9/MrRBIyvRX4n8jIpz7SosjMf2+WFRqGkgiWhZ1psltYgHhXAKOkA0kPRiigj0YnwgZ+OGfmfooXo/Bjc4lVMn49QYIsrdzFyZD2awB6rA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:27 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:03:59 -0400
Subject: [PATCH v7 3/8] media: synopsys: Use
 v4l2_subdev_get_frame_desc_passthrough()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-3-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=2045;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=m73N9ywVEYQWZkEhPDcRCZT5fOu7Etzyw0cc35E2qNI=;
 b=cDmPPOYubq4/aA26z3hI+IJDZilviDGEUXdxKRO0wJi4Wo1eHT5S+skkrDXmeLsCPZvMENcz1
 TBLiH05mnAkB2tawdYj8pLGp7qG/7TD/mImca3dvOqipeFoxun2D+cA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH2PEPF00003849.namprd17.prod.outlook.com
 (2603:10b6:518:1::66) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6c4d1c-940b-4e89-366b-08ded85397ec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 mAI9Qo72cMOKMH7qYJ4QCWHirjF+w29QC+cEj5s2DPBz9H1c97deuvIUtcFVAxFUxKXw9x9JAhSC4WqjABBPKy5qJu71s9VkNHYuZibP7sc0FE8xle2k3p78KDxREf9WBuhmyZOZZFFxqmjYtYNRqoX82Vk5fVPW8nDR5bUWw30DcCjZrM/0YTEVJh9V/jbMU5tJuaBLF4NX+4MeF6Jo18rtfXc8nrRGUMcITWjJzG43ncNEhE+LlzKBrAu50/Qa8f2ANYHv2aTwCjIm2tQOg3maNTQ4SZxp6TOvv4L9vI+Ctv0TOxy3WFzsNPKnsfcEwvi2O7DHg3GY30yDvifOJ+EhOR5mycNPyngptI7hzaGnlr9A4huc2X0paFPqJz9t1Urh7Y80U//of/Pngl1/4ZaJ55UASqrwANUhTfGaisZeCrPht2x6fSeVDoSBfgKYs36HUeptabCFcdfNHh2l52CeMHhGd92MGImesAbC85/HmtgTNzJSqVesdMdv5I0gc65ytFZWeyT8qUYeScq6AMIr/JAHA17ez0UMAjFx0ZERJBcyEFy3Nj5twri+pVae5MrI9+EwiFw4ECD4hbH6IP6EF2EiRa3MFLS3dYe+wJkofeV5UFayQVwgYff/ipg6CN/wQUnfN+Jd4aLnNmKTPzyt46/Trp7Oaz0O2OBHx7DXZu4X+kCH+JrulGEry+DTB2keESwEmgeb9RXYcqkxUg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d3hWcWl0REhXSWRFbFNNUDhEckFmbjlFUlZxckl3c2tCdGdDa2dzaG1KN0lw?=
 =?utf-8?B?MEtBWVZsbnkwV29VSFpES1dWMGpYQlBndzNDK2lVT0Vzb2kwSGhlVmdkZFpv?=
 =?utf-8?B?VTZicW4rYjNGKy9jL1hOM21PUlR3WDBLemN2S01ZL2xWTmpWcHFQSHBCQkk1?=
 =?utf-8?B?NVZ1bDR4UFM3VXFVN24vZU1ienNUbnpOcnRIYm5oMXdRaGJJaG5vUWQ2SFlr?=
 =?utf-8?B?Uzd1ZTdJSVZQUHlGMWZFQTNlWDM5dHBscGNCQ25sYlB2N3VML0RFS2VJQTF5?=
 =?utf-8?B?TlhUNUZhSHB2UllMRVdzUEFjODNWaThtWFJBUVI1MjQrSWtONkxqUW5BOGp2?=
 =?utf-8?B?YWxkOUl5U0JwaGFIUGRZMUlBVjJRUlI3cHhhOEhaeDdtLy9zZjd5bjRVTnlk?=
 =?utf-8?B?NWd1RlIrMnc4bmljRHg2dENabGJTQTEzOWpmNVpvS0JWOVl2YTBhL2I5d214?=
 =?utf-8?B?Mm9WaThRT1lQZVdIdU9NOTF3MzBZUUNHdHFkbm5JaytoZ05mdFFXVVJmRWMw?=
 =?utf-8?B?TUllTlZSWENlSFpSdXJlcGY3ZEdvbHkxL3FxcklQYThWZFZZUHhkZ1gyNStV?=
 =?utf-8?B?UU9LSWZTTGZyQ0ZrT0JnVU1ZNmhzRElTL1d1LzN5R0R6ZTgvT000cGhsTzRz?=
 =?utf-8?B?NG1lR0NSbmRSd21XM1FmSDl3YmJST1BDVnJ6dVNaWHpmNDRUVmRGb3FWREF4?=
 =?utf-8?B?d1lFTkFabFQ1S1dPUFE3VjBRZWhrbmx6TzFJM2NoWEdmd0srK3FoVjBnSUtn?=
 =?utf-8?B?dlNXMWZzYlM5U3dsQjZTMnowVWd0MlMxVTdDWU9kb0Q0TTlXelpFR2ZuaXo4?=
 =?utf-8?B?V2V0VEpodHpXVjRlZmdFb0YyTnFjUmwrQ0lRakE0Q3JQRE95elV2NzdjZFhv?=
 =?utf-8?B?N1A5ZSsyWlpQNUxDWlNLQ1J1OEt6RE5rUXBSbG5PdVNYWHpucG10d3l4ZHhu?=
 =?utf-8?B?MmtrL09UZitWMmVqRmJ0UDh0ZUV0cUM2M1M0WEZKZEkycHQ5RGdHNnV3S3ZT?=
 =?utf-8?B?em1DVGZiZlJLL1BWRS9tZjlWWEZBKzJOZGhraGFSR1A5THBJSE9PRklLWFZl?=
 =?utf-8?B?RnJSdkg4VS9lK3piN2VaYTFiZHZsVVpUamZxVnFuM2NVcDJzVUdNU1d1T200?=
 =?utf-8?B?R1RFY0JZMlVHSTVOSStKN2VPQ0Y5R296cTlFWnBVdFdVRE9GT2JKQkV5VXFL?=
 =?utf-8?B?Rk1hVTBtMFV6SkwwSFUvRTJWaUhJMStNamRVamdYNWVIeGVqV29ZOUM5SDA5?=
 =?utf-8?B?M2ZISm11QmMwdXZ0UlJLdVFkd2VMam9DTFVnQ0RzUDl2cHJlWFJlYXpGQ29J?=
 =?utf-8?B?R0twUk1TT0JhdWdONmlQb29uUFcxMktVTmdHcHhQcDdFTWc0cGcrRnNHd1ph?=
 =?utf-8?B?KzNjcUxjdi8vdDJnUkY1cXIyMHZESW1QaWUyeGRUb3MwUDdqRVZuWEZ6d3gy?=
 =?utf-8?B?QXFMMWtpamozVnZvNFowSkdCSHMxMUxjQ1g5ckFLeHRKVC8zaFJIeXFuWXI3?=
 =?utf-8?B?MS9tdGR0VWpIZGhLUDdZVmovK2FBUlVrZjRqQ1ZVaGVmcTdzYmNSS2R0dVdQ?=
 =?utf-8?B?YXhYU21HL3RGS1pSYXZYQ1hJclkyclcycmNaNGZhNXNGck9yemsvaEFjZ2dJ?=
 =?utf-8?B?eXFTWXE3cE56dEQwOXRwbDIrTGZJQVByNGViTjVrTDZpajh6bEh6NGZJRzgx?=
 =?utf-8?B?alkvRnlaSHM5ZmFWNGhra1VPbjBwSmFocmRMVFBENXZicGQydzZJWGhDdDhJ?=
 =?utf-8?B?VjRzZ0pFSjI5LzhqMFZlckltTjduOTRObm5vNnp4T3lnVmNjeW5hbGdZREcz?=
 =?utf-8?B?RXpRaGVkU0p1ZC9tTHFtWFk4UDBxa0swM1lEcTllNnFCTE5GUHEzZVg2ZFlT?=
 =?utf-8?B?RHhzSk04NTY5eUdPNzNQTjE4cEtFei9BbVUzaE5rN21hZWZacFgvakVKWE85?=
 =?utf-8?B?UVRaYng4Z0I5MTFCeHhLWTFPT2docWdRK08vd3RsVndzaUQzQkFzVTBBK0RR?=
 =?utf-8?B?WW9ZTlhTbmo4NnVkM2FlWGFENkd1SmdTaEp5czJxZld6VnhxREk1RVJzZW1y?=
 =?utf-8?B?YkNORENhVm0renJvdGVIdUd1aTVlWSszeEV4ZVRvd0toMS9EQVgyMGtWMzZ6?=
 =?utf-8?B?THlLd25JK1ZMdkdJQStnZDZOUUY3TDZKNHUzNE1vbnFGcFNYUEVpb3doZG05?=
 =?utf-8?B?aGV2Qk9wWGtOU0ZTZm1VZ2R1UC9SUHdMZkxzaHBMaEdpSDh6RTZRdXhWQ21Z?=
 =?utf-8?B?TFJURzgrZTFJeGdLOHNybzI3LzFYMllCWWJIWmdDVHhDSmNwRW5PMzUwNURW?=
 =?utf-8?B?WGZYSzAwMTZ5S0g5ZWNGNjJyQVhBNzYzUGZLa1BIL2dDd2dQK01kY1lERDc1?=
 =?utf-8?Q?aHIml8r5XSOpGqwkWJ/Fvno27kTJOJIn9IdLA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6c4d1c-940b-4e89-366b-08ded85397ec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:27.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmGpZB8K7WsjK594O7twK8ytQ8oJV+YbgLfK2HvXd/ME1nKu5ZdW6YiHNtJ5542ZZ+XsKPvK8XRjZop5CxZfyWrrIqtyYwkBYktxFJO+oMvz6TkigjlIBZlr8CL4ke+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66386-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 970F26FA13A

From: Frank Li <Frank.Li@nxp.com>

Replace the local frame descriptor callback implementation with
v4l2_subdev_get_frame_desc_passthrough().

This helper provides the same functionality while avoiding duplicate
code and simplifying the driver implementation.

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
chnage in v7
- none

change in v6
- collect gouniu's review by

change in v5
- new patch
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e5..f51367409ff46 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int
-dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-			      struct v4l2_mbus_frame_desc *fd)
-{
-	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
-	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
-
-	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
-	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get remote source pad\n");
-		return PTR_ERR(remote_pad);
-	}
-
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-				remote_pad->index, fd);
-}
-
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
-	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,

-- 
2.43.0


