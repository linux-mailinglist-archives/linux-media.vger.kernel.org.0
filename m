Return-Path: <linux-media+bounces-64898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uZtRIFDML2p8GgUAu9opvQ
	(envelope-from <linux-media+bounces-64898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 11:56:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123B685331
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 11:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=HN7Pe2iq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64898-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64898-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECC973008C25
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD543DB655;
	Mon, 15 Jun 2026 09:56:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239233A6E0;
	Mon, 15 Jun 2026 09:56:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517383; cv=fail; b=eK7NTe/8KDVwjNTC1F+eUuRWE4pUKvYNdkM8HekT6DaqcYrmW2ZF/Hf5U/AQ/wxZOlKev1UnLBymie97nV71r+W5FLsQG2rqX4xGlIGS5JrLG6Dd5xhPx+jJTNRn4MREbRrEl22vSsMn6XadrK3S7PzTN0aYTe6thRq7lfLDB+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517383; c=relaxed/simple;
	bh=zv5s/onEKoImi9JRWWi8VH2kX7YwMxaqm1T7viDMuDo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uaafJP5J8h4TyVg99k+Sl1kzPwYfgDQTym65YA3VfzGTS7hfPW1S4GzkzvKrEn8OmonbNJPdt8RidJbavkkJR0PJ8usnE8M3+KrcLFSKzrTIVlB9egliT1/OJUTbz7Gxi+z6zYTEpv3KD518xtzGcH+sMCk89usXCuGqgqFCeA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HN7Pe2iq; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qzvx2ueA8OGl10t7aIeJxmgG+YhTWvq1XVdBJt1l07HTqgzMuxcZfAylLkHJynljcBoge4nsMJDdpk8YJfHHHqwD3XBMowjBTI+iXYMmyd7F/V3+UXRruRF+4FvTLjG8FcI+vSxxbuy+0yT7NBFU+yA5ENI/YBG1UiPpLkpS4k3Ruk+Bje2ca0Z8wQqLnQTvdw1YD1i3aKGhCe5CA29nU33BFJQwOkqj8zqFHEQItkDgDWfRIzMEgqpY3BqhI4A2zBRncHhSFhfLPNkSNssxCEiFNiodvqPcZ1wInnH58ycFVv8vj8v0FzM150xgof5ooonCPDBy8l0cGBYs+gOFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mrmpIlZ5WJQ+KjMQIcqKCRdcc+iMtv/YlujJ3Y7vCQ=;
 b=yqqSK9GQnhs/uBHltDGYFd4jTSNpAl2+T0LdnITkupojeKkvLiqHtpBe9vW0hCZT+PlpYlRh0JJZq1DW3ch1m3Ip14K7u92wqxxghmPEW3tuwh41P9MdFmCf7s5pc7+UDLKWBi0LwrqKFJazIbW5259lFzFGfMRKpRM5Oky7GFxubazgVCE5AhcE9NIN9w+jFIOXigtfkjUYOVXV7Nr7JJCTw1CschkgCsp0XwRpnixNE3PgOyc8RJiI302pRYuwc/BTkWgioS4k4xuoH8TPJ0ZyE/JVVXCJp57XIbr+7Swy0qgEMyC0fJ+Mgc/NWKJbd1/54j6DH8gjt4zb2YWM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mrmpIlZ5WJQ+KjMQIcqKCRdcc+iMtv/YlujJ3Y7vCQ=;
 b=HN7Pe2iqVYF1pa/WsJ11Ev9BEwBXpFOCIETdup7jaDvLQetmSpQdIEbfOeZAARS4aBAuaHp8ykR8WTZC7opif/fv20hXXYU+ChEVdC554mCiYh7jP6Cp5GxUrHzF7gm40DZDOhQ2XZtitfhafWce5QNjfoOOFkEecRkdFmfEMHquvC7y7zXLEvdkuKAGM41MxYU8Sx9o/YKmpzAmts8O8YI1IPILeXMi1wJ75rsw1OMGLgnHAVBiMqp7bL914cZsMdVfSCG9nH6SAq+zkq8ZhMkUPjxjOPIEe85Brgl8mawofEgxaVp6cQWuS/01pIU+sueE11z3eORyrReveAecCg==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM0PR04MB12098.eurprd04.prod.outlook.com
 (2603:10a6:20b:743::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 09:56:17 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 09:56:17 +0000
Message-ID: <761f284a-1660-41d5-9625-9b25bf18aca5@nxp.com>
Date: Mon, 15 Jun 2026 11:56:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: freescale: imx95: Add NXP neoisp
 device tree node
To: Francesco Dolcini <francesco@dolcini.it>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michael.riesch@collabora.com, anthony.mcgivern@arm.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, ai.luthra@ideasonboard.com,
 paul.elder@ideasonboard.com, geert@linux-m68k.org,
 sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-9-antoine.bouyer@nxp.com>
 <20260614090517.GA7434@francesco-nb>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260614090517.GA7434@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM0PR04MB12098:EE_
X-MS-Office365-Filtering-Correlation-Id: c72e49df-ee1f-44c4-decd-08decac457fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 1UvPK+NFfAWPbHIZWhb3z9blYoLjxrP7sGBUtXeatGumU28KQkOLJWxlCCwhSjeJCFmSXTCKYLh4vzVHoa9AUt4FBX2O9wkhjZL3npKJV7t8noVmhwOTMXsGA5YbnEo9/E9fGOzn41/70D0F+beLVVFDaiCsDvm5wJjmAVwk4ad3ZZ/tF91S8ZnWtz621+JsXXDusubpqobuhmPNVSuKLw6+uWkEtwiv3ueDXmzJGDFE5qnx3HmKXLDXugA+Vicm6yqwzq/tOTFd32XqnsAR+grc1G8lMZudVz0wlx/AZ1ozqR4UbOFcMWJgbWYaAOPxloN3XahYFso7oD151NiOesgK3+JOsfJww2ML6V0mUklGKl9E4Saeeo+bibxjV2+3XRiOClwscwhkiySDnxMl+u7ozRaMqdlVOiT/rI9BdbM701VGG+5uSN8JmR590ewY58rIIQCBHo+fGX/MGPztJ7WdT4x5k83hpVVITjQPTvsk6bR6XT68u4sDKzSgc1DnsFCFof4RE7+Q0+C4kkb9MH4cnhl0rbpNyZ+ZF36Dz4S3DcrYuty+thzhEqENWQZGTxdBzWdQ/rjiFKcPtBbfHr5M+eKimC7P8uBzCl9xX4wb/q3JRi+/dtA7OuYoxMNmYULbCqswCOPqF4sTMTH8fBaX/fXNxIAuXXWjX8rqprQL7PfAiI9AqfyUWB/UJRKX
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WjFRbWp2WE9nWEtwZ2hZenhvSUx6VEdtdFp4Zk1rR2Vmek55SU1nY1VWN0V0?=
 =?utf-8?B?cmFjOFI3OFFFcXZLYi9yVTZuUXQzbkRlSmFRZGdDemhZd0V0S3UvVERaK3Rl?=
 =?utf-8?B?dW9CUXZVVk9XS0J1Q3VDaUNLblVHVVIwTS9qQ1hFa3hpUlcxK2lQQmtZUzlh?=
 =?utf-8?B?cDczYUwvZHluczYyNks0aDRnTmorNFNiUkFGUkhqNFgxQUlmSkVIdEFFMW1W?=
 =?utf-8?B?dW80L3N0bXhoYVd1VkRBempiL2pJcWtldzlCaUxGSEZGN0dKZUJKMzVpK2t1?=
 =?utf-8?B?bU5uNy9iVkVGUnFvcnZvM25mTnp5dEh4eUZZWFF1ZGRtYUcxQkI2YTRyc3lX?=
 =?utf-8?B?TXZzc0YyUDIzdklOT3dFOXUvSFNWZTVsQ2xpOWxaYVNCODc5by9JazRkbG5Z?=
 =?utf-8?B?dmhMRHQ3UDZDSzlFaG1kekhlSGVvZkRCdElJTzlDa0h5RzJacEF0aERwYThY?=
 =?utf-8?B?azhxVHk5RXlyVnpJbFFibS8vek52MUlaTE5iU05kb0xUYzN1NmxWbDQycHd0?=
 =?utf-8?B?ZDhIeVpoeTBKeXJtdEsyS2JqamNqdGJMMy9lOForVG9mZE8wY2ptTjhuZ1NK?=
 =?utf-8?B?QUtDMHNoWnhSNVd6aTEyUWp5MGdrNDk4bXNjWmFEWEdiRXZkRUliMURBTENJ?=
 =?utf-8?B?VVg4N0JkU2pYTUpmU2ZKVmp1ZW9EYXRoUmRCQlVRZ0dPdjhOQkFWaVVGSHp1?=
 =?utf-8?B?L1B1Z0R3anRMT0szMnZhY0I1WlozWWprdlEwYU44aElNZHdJaXJJVjBsemFG?=
 =?utf-8?B?Y0xUQksxRk5zZ2Y2UFBCNXN6RHN1ZEROa09icnhySEJGZGk1MzZLUUJwenFx?=
 =?utf-8?B?Mzl1RUpRUzlwUDdvRGJrdG0rZGNCSzhSRTMrTFRXYnVNazJDbmJFcERmdE9G?=
 =?utf-8?B?bVRFN2JEUFZ6TjZ4T050c1J4OXIrVkVoRnkyckJqc3E0eUxEL3ZLQ281UVJ1?=
 =?utf-8?B?ai8xMFBRMWxxQVNheDlmRXlUWFZWUVlBcjVia20xU2VzVndZSSt0Z1loMFgy?=
 =?utf-8?B?UldwbzdpR3dPU1MyMlUyNU1lN3B5YW15ei9pdkRsRFcrMThJdFc1ZVB2VXJr?=
 =?utf-8?B?RS9JTEVyL05OaExlckJsZEJkMXdOWmlYaVY5Z1JFeXVoU09XSHFxajZwQmNt?=
 =?utf-8?B?UkZrZUxiZTI3ZGhwNXNENmk3SmtaUzI2OXErZkllTU1RUHZ4YXlvd243bEtH?=
 =?utf-8?B?SDdaQldya09SWEEzTTRXZFMxT3REQVl5MmI2S3owcUpLK0dCWkRPWmFFb3BH?=
 =?utf-8?B?bkUrNHJIa1dlV3hON0xXRVpTeHFGWUlHcFB1Q052WTk1TlRPUkt0QXAwb3dz?=
 =?utf-8?B?TmpDSEQrU0J6Q3pnMElwbTRzVXZVZGRRMjRSQjZQbVRDYnY1ekY0VE9jVVc1?=
 =?utf-8?B?YWRxbGxqRmY5MVczbEdsR09XN3FqVGhURXJ5SGlldlVVWFhEWWcyMUFGem5S?=
 =?utf-8?B?RHMwOTl0VjMxSVF3Z3dmTUlrQ0QxWDdza0szQlMvVkovQk1KaGpBVU43bGJT?=
 =?utf-8?B?b0pBOXVMS1ZFeW9HNEdta3lYNnM5WVdYS2NpQVpQRVRxeXRZVS9pbEhGQ0dH?=
 =?utf-8?B?U3Z1aUJDSW1DMExLeEl6UjByRklvVlZlZVRpV1dEckQrWkpwSnBBajNpdEp3?=
 =?utf-8?B?RGcrdkk2cTZjUnZKRW83TlVyTGZhNlUwSTVzbnV0bGRhUHBUZHJMbXowZHFW?=
 =?utf-8?B?Y2Z0OGYwaUtUelBnajVUVG00VkNIaVd3NHNjK0U1dkVFdWZQVHJwNUZnYmZr?=
 =?utf-8?B?Y1ZidWFXZWt5NG5DV2FGR2tEMUhlOXZ2a2lyZFNvRlRXK1hueW95cGkvbk5z?=
 =?utf-8?B?VkxmTXNZemVBaGJJSUZsb3ZvNjRMV1crQ2txTW1OV3JHeXBRVDlvdzF5ZE5l?=
 =?utf-8?B?RFlxOFd4VnR1dEZQcWl3dGRZUXI1eE5Pdm5BRmt3NzkxckNyakRZRXpRckl3?=
 =?utf-8?B?emRPdkJnUkxWc25LZ241Z04yODFyUEdKU2dpbVBodjFrTGJqMisrMEtoQmRO?=
 =?utf-8?B?SFk1d3MxTXZkRENpa3lRclB6cFgxUGtBZndTQzF5SGtYbXRtTllpMnppMysr?=
 =?utf-8?B?U3FZSmx6SGNyTEZQZk5vQjZyYzFPdWpRblFzZlZTbHdZYm5leXJHL0o3Zlp5?=
 =?utf-8?B?TWprNXdYekF2NDRzNk1jWjFsRGJrM3EwYm5QVTB2Zit4T0hCWExZd1lhU0hz?=
 =?utf-8?B?ZGsrVy8wcys5UzlDbXhBeUZKeXBMUnNRcUp2MjNIOTA0eHZjR05XSUlQSDlB?=
 =?utf-8?B?MjBBeVc0T28raFN0ZS9xUS9IRFhIc0pkanl4bTFsaWlFVXJ2SGdvL25JcGFm?=
 =?utf-8?B?VEhhQ2tMTnYvNUVlY0MyOXFCRHZCRzc0OEVocVlKK3EyV3VmQlZuQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72e49df-ee1f-44c4-decd-08decac457fa
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 09:56:17.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwUhQb9uEJBiHr4WL5Mjs4rMEwOxDj33xsRfIUQhBDnAxXa5se70sZI9Wm+pD7EUNMVUmaqjTYmQ7mvGTNoEZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64898-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:francesco@dolcini.it,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2123B685331

On 6/14/26 11:05 AM, Francesco Dolcini wrote:
> 
> 
> Hello Antoine,
> thanks for your patch.
> 
> On Fri, Jun 12, 2026 at 03:20:39PM +0200, Antoine Bouyer wrote:
>> Add neoisp device tree node to imx95.dtsi and enable it by default in
>> 19x19 evk board.
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> 
> ...
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index d6c549c16047..5543a6cb1250 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -1867,6 +1867,17 @@ pmu@49252000 {
>>                        };
>>                };
>>
>> +             neoisp0: isp@4ae00000 {
>> +                     compatible = "nxp,imx95-neoisp";
>> +                     reg = <0x0 0x4ae00000 0x0 0x8000>,
>> +                           <0x0 0x4afe0000 0x0 0x10000>;
>> +                     interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
>> +                     clock-names = "camcm0";
>> +                     power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
>> +                     status = "disabled";
>> +             };
> 
> Why the node is disabled?  If the node is wholly described in
> imx95.dtsi, it should be enabled.

Hi Francesco

Thanks for your review.

Actually, all nodes are disabled in the SoC dtsi, and enabled on the 
board dts file, even if fully described on the dtsi. So I used same 
approach for neoisp.

BR
Antoine

> 
> Francesco
> 


