Return-Path: <linux-media+bounces-61361-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEq9NgI5BGoqFgIAu9opvQ
	(envelope-from <linux-media+bounces-61361-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:40:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20452FCD0
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31E493032981
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 08:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06163DEAFE;
	Wed, 13 May 2026 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LsTQYqiG"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EAB3D9DC0;
	Wed, 13 May 2026 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778661600; cv=fail; b=Q93vOE4yZV5ZBhRlPmqy0goK6CVPiuzlSenwcAFiBZFhpAaAxqzVhivaJeOsmXFfI2NwgFLfRzwaYiYodzG+i1MEVr7vA+j7J0OYPiKeL+KKOACD5r7e7OB+fc53FgIul+zvV06vnZMS9CYRR+zBaLNd0oBajSa4blEDqIx6RRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778661600; c=relaxed/simple;
	bh=z9QxDV2urD7hMQdpz/lF11+ZEpIMx2cs5l9BtNz47ac=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ejHNlqfh/K8KagyiffVcft1oNCDOeeKxaNpIix1u9KXTfBhD7YKMppuzqEKtDzCx0YvE1nXN5/ECG2mzUZc6UmqjOW2lYFbHmrW78dZJkor7udEReaJQq8u6lWUMuUC5fg09Ct9O0J1YCyj/CUzpSn62MU7pPRDDTZbd7OqOzRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LsTQYqiG; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaYDP82xKwH0CzS+97KY/vdOArEaS5xziGuSe/3sPvyWVNnnrsaPzuJn7wbn9k9RXpptC/kWQftGEFDaqIhxD6Y4NQtWGkRELNxIE/gm37TciWyElAeXccMLkiyZ2ObAij46tcKqqrcStzH7DpGLd6p2RmK9TuUQumdHqJHSFbo3r76Yb2PNigO5iYg4SaxNa6byrq++4UKKB27Xe8G2PtKxc15d0C+iTneUCxXDQCtCmbTIpPJc5AX/d4btKMiGpHg/vU21ppthgQTmdNNAJotna9IJ7lg9Tva5rRpYR0DGku4L31z+cz/cINIOq1ojy/oB/4ZKgPu2fGIieT45dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKbEaiZkjAwDOGOdJEMUSc5MRGSkWBPugrO6cjlB8sM=;
 b=Cenky3nzvNXUlFKMheo0PCPisS9TKKzN6i9Hck1LyyjWDKmqzRdbOCJqyUNMqpaJQlyB+fTG9drbNE0FTunzJPqVCKy5+gt9vInJ0K/UW83F8pdClvqgUrYCDDp5cecAhKCb8B6re9BVVeNkylCWLy+NCxhSrLkDdKdnWBcKJCXVXIUt/Wb7fssvsHhcQkVd0+BfMKauarU2w7SRdkvIF36TaAjrN4FJSerRXuR6RM1/eYgljXeM6XtNQCu7bV28nUrGGXC8oTLH6ghQ5+QFy3wKnEGxAnihxf/neGPiidORotDYSvtFpGgIMesxlLC/vSQsIs+5nrXxZsmRjjo/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKbEaiZkjAwDOGOdJEMUSc5MRGSkWBPugrO6cjlB8sM=;
 b=LsTQYqiGp4D/8tcSfi3zOLPyEqWvVwQpiqu+N3o9C+5ckESCo6QjXY5j9Xto/2C+nw4B2WHjXTv08s3ARf0drEo7DwNd46vKCrYoNs0M1h9z7HCBM5GFTXp2kLTX8miGA1ehoLTLYWzJvoLsl6CtjhmGBf/dcSTiNYeBMkeBFwKtet0ooxeDqQ7fyR9P+TMImnK3ok3Qtvl3925nQxgg69aLPx2vqogwge2QLPXuYPg9Q4PQBERc/4/0N67SUgFd/kwhFaUoDbyYopOM80Y1u2+n7dphuopuEvH+h6BfJlrfEMIhpj4RDS++OJ2vVdle6LLap23Yw7wB6L7/J2SfCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB9427.eurprd04.prod.outlook.com
 (2603:10a6:10:369::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:39:45 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:39:45 +0000
Message-ID: <33281157-4b6c-45db-b958-1df4dc05b636@nxp.com>
Date: Wed, 13 May 2026 10:39:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add nxp neoisp support
To: Conor Dooley <conor@kernel.org>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michael.riesch@collabora.com, anthony.mcgivern@arm.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, ai.luthra@ideasonboard.com,
 paul.elder@ideasonboard.com, geert@linux-m68k.org
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
 <20260511132629.1300868-2-antoine.bouyer@nxp.com>
 <20260511-aneurism-ultimate-9bc90e654274@spud>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260511-aneurism-ultimate-9bc90e654274@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b28d796-7a04-440b-ca57-08deb0cb2f4b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|11063799003|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 AQYekI1T/u8Av7MehNb7KKM/XV7Q4mPkDrr/XlLi5FVs3u0lFY9wKWWyC7MEM+lJ2gK1HehCNq+jlvuKLm18GEvCmUjA2DKWekbfCkxnHjR0xzMT5LxMLtb2U4srBSuqxXzvZ117vDJZ90WdSsFpXMPHtUXuBOUPGy9vFSULQSe4esC86ibMvNrdV/9mc+pxhbcXFYmkGgVDZXwzskhr3OLlqY7a/caYCqREVew19XFGyf7TADmZIqxzLwsf5ksETt+cU0a39UleqWWFAshH0xV01Wo7BLrU4zYYjjwpZjb0fn2wWP23vLfOZI4XULEYZeJ+4LbJo06UVAJWqz9AWc29XKOnkjguMW1OR/U1Y6rChAJELzQyM2mE2w5YUF4DC8vUGaGR4PW2PpVPUTbju23d4ZJwgxve37OQlzYf/C0J83DJ29Pdux8+G+EeAk1ECN7eC7UonlTsopPH3SEXKP/M6BOb+kI4+z/R+/eUj9pHv2oK7Ahxs1znxFpdKoUQcdLkRLNJttE1FVcYjCBU2BV0zasqweaYaJNSS9gpCsz/vQ+8HO9OLKoJwpKsz0qIyYs9kWoRN7v5ZuDjbUNWnxCYQBFuOPQbW/QmlasvwvfPruaX4SjFZ7aVKabrKGykzuXCnqfP5QqjxOdmyGudBQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OHFiQm0yVW9SZlR0bnM0dmFONzZ4RW5nVmV0cGFvdENweHkrb3ZROGFWeXJZ?=
 =?utf-8?B?cmJySVllcS9JbXliM1NkVUhUSHg2NWE5clJOeVR2d0FGODZaZDZ1eGM0UXll?=
 =?utf-8?B?aW93clp6bWU0cWkzRzVEZUU0MVRCUkpMU3lzQkQrQXkyRFVaRzBUcTc5OGdD?=
 =?utf-8?B?UUFwOTNzbFpTU3dJZUdQK2tBYXlPR1dtbEpRVXV5NnFzQ28rbUhwYXkwekpx?=
 =?utf-8?B?Wks0QUFQWm1ha2Ryd2pMWjNvSjNvRVNHb2J0a1U5b3ppK2dmUW1QOGRwdFBT?=
 =?utf-8?B?b2FydzFMaVM0N3FjeWRLUWZ2VVc4RnAyRitHeUdXQlJqa3cweVJvN3FlZFVq?=
 =?utf-8?B?Wk10S1pCWUg4YkRORFZCUGN2bnlHWkNsYUpiM3pqVFN6QWh4SzduZUZ6bW1h?=
 =?utf-8?B?OC9FZVJ2c05BN1Z2N25YK3RvTUozRFBhb1BMV1Fab0swL2xmcmJhNGdQOW40?=
 =?utf-8?B?UEZrczkrcU9nTm5FM3dEUThrUEFlVWYzaS9KTEUvZmZaWTdVNk1EWGs1SXhy?=
 =?utf-8?B?V1o3NS83ZDNuODFiVUZQS2VkSHcwZ3pvREJpQkQwemZQKzRIWGl3b1BpcmxX?=
 =?utf-8?B?MCthN2lveFlxaXZkNzZHZldaOG9kQXB0bnVSanVMVC8zZ2RLMFRMc3RwZUx2?=
 =?utf-8?B?QlMvaE9ZcHJLVnhnQ2Z4OE5jUUltakpCYkR4L1hHZ0pHVUR2ZmdvOC9jWHds?=
 =?utf-8?B?TERMbFNjZTI2WnVkckZiWkdlTkQzUUREdFozMW5zWW1QejlHVEEwQzhiRjRX?=
 =?utf-8?B?K2huNndtUlc0Sk0yc2toTnlWR3JVR0toZHlONGh1WDJJTCtZcTUzYVNtcmhx?=
 =?utf-8?B?YnQvVmhnT2hLNVJKTVdiMTZwTm5jNU5iVEZEMks3b1B5Z0VmL0Fpd1ZWMDlv?=
 =?utf-8?B?dnFFWENFZlcwSlpLSG9uNnJWeGpkN1NXdUxDUkNFY0ttRWRYV1Z6NzhzK0hq?=
 =?utf-8?B?YWw0dzNpbUtWbzVVWjMwSkduVXN0UVFYOE5veml5MUxycmJpbEthQUNWNzgz?=
 =?utf-8?B?SU9UTWZMdGwyTU1BL1F1VitPeEVwb21kb3lFOVVsbG1oVE1hdmUrNFRidVFF?=
 =?utf-8?B?cGRKMjRIUGIzTzZkY3NrMmUvSlpZVjdFQmxkNzNKQ3c4ODRDOWtsaVJYSk9J?=
 =?utf-8?B?UjNoVkdTY1loSzBtc21Rb3VMNTBBVXN1bEE5MDNWb1o2dWRyYXV6KytOa2lo?=
 =?utf-8?B?TVFtbFNzUXlVNXRGdHh5ZGZJRmdLMytZeWt5Y2hXTnV1ZUJ2RDd4YWhaZTJi?=
 =?utf-8?B?U3JNTWFwZWt6SStLVCtOOU16UzJYNndvcHFKNERqQVVFRTk3bDIzUEdZVENl?=
 =?utf-8?B?NDRZeUludTgxaEM0OGNJWk50bldJanVNTTMrcUpKMFpEcEc4UkZPMHozY1dC?=
 =?utf-8?B?RzJVMXBBSFMrS1M3bDh1a0pYbE5BckVzKy9oNkNIQnFZb0QxN2l4NVkvRDl5?=
 =?utf-8?B?SitwSklhaVBFa3BJZnBUczZGU3YzWmRqN1BjRStyR1NGRjZVMUlrWExBQnNN?=
 =?utf-8?B?UW5nYmRqcjFWTjhQOFEzZFZpK0xibmNMallySzNBdVArLzBMbE53bkl2STZw?=
 =?utf-8?B?WTY3Q0NQU3E2dmg5M1I1Mm1BaldJQS91WS9WMzh5WndpRytjY1lJSkNGVlh4?=
 =?utf-8?B?SE5GMVMyNGdpVnB1Q0d4aGRkMms2U1pOcHNQRzdSd3JLMDc1N1RDUEExMzJ1?=
 =?utf-8?B?ZVQyTU50YS84c3ZvTzBjTDNTWnhGTmRtV3NzOTN6c0lJRGJ1U1pqQi96dThv?=
 =?utf-8?B?ZC9ZaEdCSTRJNXpIN1N1NlMrd1dsdkMyV3hQVm9Rc3U2aHhNK2xlOU5KMVBY?=
 =?utf-8?B?dXFGbEJQRE5GdlVndGZEM3ZvWGpIZ2lxUjZycndJNlVjUHZBa0JCUjFNcmo0?=
 =?utf-8?B?YjI2bzQyV3FlVEltUjBjSVpkYmtQbFFVeHAvamJhY0Z1MFpUTTl2bEVDWTBx?=
 =?utf-8?B?ODdhL0FKWXJOVzFKNGNKdnRKRlU5ZVloNXpSQzE3Q3YwcGZITHVYL2lFOXpB?=
 =?utf-8?B?MGxKd2FWcjEzR1ZTeGJGb2VKVGxmN01ueGFGd3k4Q25zNUlYek5UUncweWJX?=
 =?utf-8?B?ZTJwai9NT2wzWlRJQnRYSERTbk1XZzJmUThWUU0wTW5pY04rQjFjRmViTXJQ?=
 =?utf-8?B?Y3JvT29lN3JvbGFXcHBMUkVxTzBJUkpNUEdsaWRuLzhrWS9iZVNyK3JJM0hl?=
 =?utf-8?B?N1M2aVZSVjVIKzBNMXFKRW5OUG04S0lUdDd4WUxMc253dDdjdWVpd3RQcVRy?=
 =?utf-8?B?K3B0ampWdkRycmFEalBja2NQckE3TklvY25vVzUyMTV1eHlHUVNGbVdocDR5?=
 =?utf-8?B?VWljVjlsT25VMWV3RXZEMnRJdVd5WUVXYVN0UGUvUThzM0ZGdWtnQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b28d796-7a04-440b-ca57-08deb0cb2f4b
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:39:45.3236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sB+wQgeNuO/ETJ7dTmvhZvTWA+CfCrb7UHHbRRyjjM110qd0ZKfrU14yWSpMvQkZuTgEfVdbjTpyB2etVmtrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9427
X-Rspamd-Queue-Id: 3B20452FCD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-61361-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4ae00000:email,nxp.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Action: no action

On 5/11/26 6:26 PM, Conor Dooley wrote:
> On Mon, May 11, 2026 at 03:26:21PM +0200, Antoine Bouyer wrote:
>> Add the yaml binding for NXP's Neo Image Signal Processor (ISP).
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
>> new file mode 100644
>> index 000000000000..458c4e4d640d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/nxp,imx95-neoisp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP NEOISP Image Signal Processing Pipeline
>> +
>> +maintainers:
>> +  - Antoine Bouyer <antoine.bouyer@nxp.com>
>> +
>> +description:
>> +  The NXP NEOISP performs a set of image processing tasks on the RAW camera
>> +  stream and provides RGB or YUV enhanced image.
> 
> Can someone explain to me please why there are no ports properties to
> represent the attached camera/other elements of the pipeline?
> 
> This is not a review comment per se, this is me not understanding what
> the delimitation is.

Hi Conor,

The neoisp doesn't have any port indeed. It creates a subdevice, with 
its own video devices (x6), and it runs in M2M mode.

Userspace copies RAW buffer captured from sensor(s) into neoisp video 
device(s), and let it decode and generate an YUV/RGB image depending on 
the config. The decoded image is copied from neoisp capture video device(s).

Same approach is used in pispbe driver for instance.

BR
Antoine

> 
> 
> Cheers,
> Conor.
> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,imx95-neoisp
>> +
>> +  reg:
>> +    items:
>> +      - description: The configuration registers
>> +      - description: ISP local memories
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camcm0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    isp@4ae00000 {
>> +        compatible = "nxp,imx95-neoisp";
>> +        reg = <0x4ae00000 0x8000>,
>> +              <0x4afe0000 0x10000>;
>> +        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-parent = <&gic>;
>> +        clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
>> +        clock-names = "camcm0";
>> +        power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
>> +    };
>> -- 
>> 2.51.0
>>



