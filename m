Return-Path: <linux-media+bounces-56949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLtnFtx4w2lOrAQAu9opvQ
	(envelope-from <linux-media+bounces-56949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 06:55:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBA320013
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 06:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45177301D05C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F7B321445;
	Wed, 25 Mar 2026 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ace3hGz0"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4423BF9B;
	Wed, 25 Mar 2026 05:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417882; cv=fail; b=DuT+fopkrzOSC+IkawTOJBhddZm6YwLUVClLWqOaW9VgA+xAJ8YJuNYetF9RQdD+MuGVbl5YkhRbbZMhUwvlRv6RNQZ28rH87qSy7Kgyo/y6ki8iRgKns6ezAjrJGya93fo0eK3lMXVgjVGXIZaRi+Cf0YJOxthkjc12Ee4LIHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417882; c=relaxed/simple;
	bh=SLVksFvveLgA/gdsEKXXYnJETpa50SrNILlwF8wkAlo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M5kXgXQo28SINHmOAGxl/2Syy2+JOKjfa/W0d3KJjs9ob5x0LRUWnWfWFlD5YDP+kTRA1IUOqZvfNlOWlaLelBTelqeM6epWsMLqINrTK5vwHv0LnArk0cyfIRz2Bvp5GexkuefbkK1idnwvZ68TWlBB6vrpPcu5waB+jrK18iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ace3hGz0; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBgchX9XTpmWnRl+XXXPPefp2Mh9kEGqoepGyWs3FiHIIAiSEJ9u6qzO9oc+jOQ2slZS6B/zluASK8CcR3rIhVQLZOG8FQQmNnNIZUCmfoDq0vnSXu0OQJlm+tIxfM42Kg1sitc2gUgj2IbQ0/U6qQJVgz2JeNIxyuB8a6sUxfc1QoHBmg9aHxnO5pldxu6hngNRFxtjjX1AME1lB64ed5RA8FETaj0//SlovvU99nytQpBeoLUjNNsfZxJ6UzvxMI0b2gQnFJGYL3q469zhNLEe13DwnPXPG7v752y9A1PIrMwOTuO3sp9hk9udjP60KLkt9l5QS+CNAGsml10rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLVksFvveLgA/gdsEKXXYnJETpa50SrNILlwF8wkAlo=;
 b=vSJFP/yP5y1JR+NEPAWjkPEciJRe8ASEUZ1jTx8fSJM7TbQlLQOWwnum9LbZMZeeAEl2q0Vlmhk7JhAJon97Xm1st8LWR2WJD2+1X2qWPPoPO5fMAY7l8+Fz9CXyaHB9eqWcEAEDq3CqvleQv5nE5TtNjRqFxiKaTefuYqQ2qLbRXQ5CprFNNRQE4vR8p8mYP4tYyTqLnkOidtUgk/CA0s6ChiXW4aIsstMeoRHa63GEUQCpNmjOdQ+CQJusdIOlltZt94YFGvzVXY/Rd4GHFQPAygKXAPuo/f0jRxS2J/iO7wDeFAzogGYOnYp9KORxWHrC7q15tfk/TmToSQD+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLVksFvveLgA/gdsEKXXYnJETpa50SrNILlwF8wkAlo=;
 b=Ace3hGz0yB9GBtcCHZmtLf2gxTltlJ06rfVuiOcv+eIxSHbyIN8tXv1/+seHj3BcZShDM4JpFQKyVzwbHbxF39mSLZmJFiYWXjBQKO2J0ipjltjmQ1CrgG+AIcobV4fGumpMcMwY8gQlReYsbVEgcLOkbYkGTTSVhNNvfo2Xek9m7uhZi/sWGODkDzBqofhHzMdEriAtHWuw6Iyd39et2uY3IWLHestf2+R9KOvy1Rw3IAyPLNzP4OO1lR2QnY2sn8i7xw8W5B7199Msik1EXgzOwRHA+sKzXWaVt02f38g/JkAzSmlLLRsMmAiRjfwMLyCs0oFqtRNvLIMXXWazeg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB9999.eurprd04.prod.outlook.com (2603:10a6:20b:67f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:51:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 05:51:16 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH v2] media: nxp: imx8-isi: Add virtual channel support
Thread-Topic: [PATCH v2] media: nxp: imx8-isi: Add virtual channel support
Thread-Index: AQHcvBtloFOnkLoToUKyfxNL/p127Q==
Date: Wed, 25 Mar 2026 05:51:16 +0000
Message-ID:
 <AS8PR04MB9080A2D3BBC21E1E453B8848FA49A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com>
 <20260319224641.GA962817@killaraus.ideasonboard.com>
In-Reply-To: <20260319224641.GA962817@killaraus.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS5PR04MB9999:EE_
x-ms-office365-filtering-correlation-id: 22a40119-33f4-46e6-1459-08de8a3287a7
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 HUo45V/MTA4jdEOFKZIEuhDyZpVZgHqX3ldd4uAFHAFbdNv3VksS68vzVMkzd9RwggJm/SLj2cFQy7BSU+oNbWzLSG8BtJODqHONTxNzV9l2uw9zWtKUKzRyM5QAyYvn/kiDDDOwwDfEI3HJrB4IOx5H5PP2GUyUa6d37Nh8bhThJhDaWlJQQM9uXNDTtkKQ+riRAyyfhMfUckrcSMSGNlZ/OwyRuCDmQq2x0phZ5z4xCVajeT8sqkM7Chg3rjpqMmEISwNY0opojO64pBjMZ6H/IYwwiNwY8ghjdliCwyONCErZX+lRWzEKTcoKQYG5XVyWWIllueybfYhlt9zinK9TtzSQVDq2Jdiv6y0/6CXJYL5BmqUksD2KdSGPDUtkaHsSRO7NvFlerslUQQLUDTVHt3iYUjVzoL52+BmMB172bUYDYmXtAEwozQidbhd7PiXPN4H0h/dSIMMcPcDGF3e3UvYyGBGanGxFYY16i3QvQxQbp1hQ3sFRDrN3eaz3D4jQqkQ3H8FT6XQDA7j6fsemr71KCD8DsAJvOx7HeGuPe6MbtYOXOctGjZZ2E88fmTKZoPGEfq9FjaJIlXjka07epya3fEazylwe9iw+uY5vhfhpuRDKyPlQH0LsbnDrHbb5+3X88SZhgEVqIwqtQeDuu6OqFbSlCJ+/sOJEQ36KappNuYU2W3UT9tFMtyzlhvjt412ADK4rk3RX782Jrov4b3qpjW3/MZkt0loCjn1nvET/LY01xmxrD4OXMA4n6WtciN6aU7r9Q5c5YjlcjyXJzWAlpaTqwgHyHZlddxc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enVHTC9ZVW5mYnV4aGkrdHEwcWtBRmt0MkMzNUplYjNDY005TW5ueUxIS2Mr?=
 =?utf-8?B?Z25mU2tmOC9yTGdCaGRGRDlYRzZxSlo3c3hOZEJUc3hVWU45WEtzV0dDQlFm?=
 =?utf-8?B?S2dBQjYxb3hPOVAwcGc2bFZOd1J1aS9GYjJ5cVl3bG5PZ1liNU1QZUNwdVB1?=
 =?utf-8?B?b0dxTzkwYTJ2MU85bDFsOEszQVUyZFcveWlFYXphV1RPekREZWF1SWhjNDYv?=
 =?utf-8?B?UElPWmFrcTQ4NUNkenRKMmpaR1JHYWp2Wms2aTNGUFlWTytRMFVqanlGZ1RI?=
 =?utf-8?B?cFdZTksvMW9DcjVnVFROYmR4Q2R1NDhmdmxzRHQ1ZHM3WDNaUXNPTXdVTEhR?=
 =?utf-8?B?L3AwMEpaWDNPaTUzMHJzVlJhenpRV21IM05FOS83aHNYQkhPV09ER1gyYytD?=
 =?utf-8?B?K21LQmZWbXNHYW5aZXNDVzhrV1dISnY2eXY1ZlVSeEZhL091Wi9kdXMxeWx6?=
 =?utf-8?B?TmpLREkzWk40UG9yUnVLbGhKUlhSaFU4NDJCVzFhbW5LQzhmV0QyWUtoUTNK?=
 =?utf-8?B?cEtKOHVsVi9PUHY2UnU2U3pjRldZZGp2RzBYT0RaSEF6Q21wWW9TVkRFcFpl?=
 =?utf-8?B?NURpTkhqM3Z2WENGVjhDTkhTTmxNRW1qVEtmb1ptd2lIL01ia1FEZWVwQ0Yy?=
 =?utf-8?B?NGlqVUdMcDdhWXk1WUhScTFlSjY4NzRYR0JxQTVoM1RhY0FDVkRYUk1lVWNn?=
 =?utf-8?B?ZHpJeXV6LzAvM3BhNml1emRTUnZtMWl0dUhtVE4xMWpWTE9Fbjd2d1JKWSsx?=
 =?utf-8?B?V0NGeTJOZXdWQjFic2pQcnZWQ2NNN0k0ZDFqU1N4ZU1ldHlKK3JGWU9XRmZ5?=
 =?utf-8?B?VHFQbzJBbVJyd0RjaGNOZzNPU1FQa2xqUUdEYmtkZ09zREpMSkNFSXg3Q1Q5?=
 =?utf-8?B?bkNXbWZlbVptenhxRkNZN3lXbmltSy9yWEZuSWpGNkYzNHg3eFpVNHZmeUs5?=
 =?utf-8?B?Ymk4VE5YK2NPVmlIYkZwYzBKaUcrRkdtdnAzK0RyWWpsQ0VBNXdCTUdDeE9r?=
 =?utf-8?B?bTZNV1FKOFQreisrQ04zNmRpcExSMDROMkxyOWFkc1A2TWdpb2FSK1hleXNJ?=
 =?utf-8?B?ZmlURDZMczlIVjhQVTY5YlA5OUNEMzIvWmhrbXRrd1o5bmRKSVk2UXM2UUVF?=
 =?utf-8?B?dXBZUlExUmJIZWxQLytZZEVKRmdWY2ZNVUI0WGtvUmtQMjBGYXpjU2ZtZjFO?=
 =?utf-8?B?SWV4dGd6Y0ltOW1kRUYxVnUxUFd4Vk1ILzNJMjNVek5QeVhwcXlzOGxZWVVQ?=
 =?utf-8?B?aEZYeWNKZ2hIZDdSckd6VkR4ekt2QzBZbDMrZUVYYzhmN2Y4MU4wVTEzenVu?=
 =?utf-8?B?L0srTkZFZnd4eTdtQTJNRkp0MXlWcFF3VnRpbklucGkrbXhOd3dHRnBTQnV3?=
 =?utf-8?B?ZmZ3WDFwVXlQaWhWSHFTeitBeXZlTFdBSkhyaGlNeUVDaURGMlRqQ0cwcytZ?=
 =?utf-8?B?bmtRNUExVjB5WUU5b09lQ3lZeXhZSG5FS1V5akJqL3VTeVZJcjIyeVZFOURG?=
 =?utf-8?B?UGtZMmowdk00ODlmZ05jMzNaYUgyZk16N2Y1aGVHMkpyZWFacXdJLzZWaXBk?=
 =?utf-8?B?a2pXeng2ajlLVjEzdU9MRzcxclRwWGRIWDVwT0hkdnJ4NzFnejFld3VQN3dL?=
 =?utf-8?B?MlgvNEJQQkN4cjNqNEo5ekRiMjAzUDNRVk1xS0ZWQm9kd0l3Y3ZtTG1PWUJE?=
 =?utf-8?B?cXB5N3VRV3Yyalg5VTc1Q2pPRmE2czRPTHFsRmhBY0RwcWwraXhZTitRcUxJ?=
 =?utf-8?B?SW9CY1ZTV2dGS0ZDTmZoZlYralFQbThvYzAyYU1QendVbUFncm5MQTFlL3Zn?=
 =?utf-8?B?RzM4M0gvZlNVRzRNdU1uZFBSYmdoMGF1N0hkR1ZOMGk4ZlE1UWlLM09CemxG?=
 =?utf-8?B?c29taEtUSlpIQkFwcnVMeGNMS3JJRktmaDNIVlZiMVlQTktWMk8vek96RXV4?=
 =?utf-8?B?UldwcVp2cUcvakx3NWxJcGN5L3NTTXpNRUJwVzU0aEZFNDJONmFLaS92SEpK?=
 =?utf-8?B?Z0pORThROUhHZzczQWRFMHMranhWams3b3haNmFtZEZpeXp2NnMreDVEMmhY?=
 =?utf-8?B?UDhKVjNRZTlNczdta3VGK1NxdG9rZ2ovS2dldzlZS3E1UG1UaTlhY3lRZTZ3?=
 =?utf-8?B?MkV5Qm0wWlNHaE9FVjRoSFF4dWpveHZJU2ZEVDY0TVhZMlhQc0ozODVGTDRz?=
 =?utf-8?B?MVVVTEVVVG0xaTZrbnRzVTAra2lKWlhxN3dRYVM2YXI2NGdzZ1YycitOUmZ6?=
 =?utf-8?B?WU1USmhoa3c3SUd3MGVsNndYMERtV0NPSGMxY3RtUXJtV1Z6OXZPQ0czNGJB?=
 =?utf-8?Q?ghoXWm5mlA15tZCWOz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a40119-33f4-46e6-1459-08de8a3287a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 05:51:16.1548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCDoKCqodU0UUUIRl6ylcNUulJ79cTfiahFwvMZ072xX2UB1apRtwwPifwt72LV/Gy1FiNgIxxJLm3rlKIplVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9999
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56949-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: B1EBA320013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjAsIDIwMjYgNjo0NyBB
TQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6
IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgRnJhbmsgTGkNCj4g
PGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
OyBQZW5ndXRyb25peA0KPiBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFi
aW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEcuTi4gWmhvdQ0KPiA8
Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gbWVkaWE6IG54
cDogaW14OC1pc2k6IEFkZCB2aXJ0dWFsIGNoYW5uZWwgc3VwcG9ydA0KPiANCj4gSGkgR3Vvbml1
LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUdWUsIE1hciAxMCwg
MjAyNiBhdCAwMjo1MzoxMFBNICswODAwLCBHdW9uaXUgWmhvdSB3cm90ZToNCj4gPiBGcm9tOiBH
dW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCB2aXJ0dWFsIGNo
YW5uZWwgc3VwcG9ydCBmb3IgSVNJIGRyaXZlci4NCj4gDQo+IFlvdSBjYW4gZHJvcCB0aGlzIGxp
bmUsIGl0IGR1cGxpY2F0ZXMgdGhlIHN1YmplY3QgbGluZS4NCj4gDQo+ID4gVGhlIElTSSBzdXBw
b3J0cyBkaWZmZXJlbnQgbnVtYmVycyBvZiB2aXJ0dWFsIGNoYW5uZWxzIGRlcGVuZGluZyBvbg0K
PiA+IHRoZSBwbGF0Zm9ybS4gaS5NWDk1IHN1cHBvcnRzIDggdmlydHVhbCBjaGFubmVscywgYW5k
IGkuTVg4UVhQL1FNDQo+ID4gc3VwcG9ydCA0IHZpcnR1YWwgY2hhbm5lbHMuIFRoZXkgYXJlIHVz
ZWQgaW4gbXVsdGlwbGUgY2FtZXJhIHVzZQ0KPiA+IGNhc2VzLCBzdWNoIGFzIHN1cnJvdW5kIHZp
ZXcuIE90aGVyIHBsYXRmb3JtcyAoc3VjaCBhcw0KPiA+IGkuTVg4TU4vOE1QLzhVTFAvOTMvOTEp
IGRvbid0IHN1cHBvcnQgdmlydHVhbCBjaGFubmVscywgYW5kIHRoZSBWQ19JRA0KPiBiaXRzIGFy
ZSBtYXJrZWQgYXMgcmVhZC1vbmx5Lg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdSBaaG91IDxndW9uaXUu
emhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBBZGQgUmIg
dGFnIGZyb20gRnJhbmsgTGkNCj4gPiAtIEZpeCB0eXBvIGluIGNvbW1lbnQocy9zdXBwb3J0L3N1
cHBvcnRzLykNCj4gPiAtIFVwZGF0ZSBjb21taXQgbG9nIHRvIGluY2x1ZGUgbW9yZSBkZXRhaWxz
IGFib3V0IElTSSB2aXJ0dWFsIGNoYW5uZWwgc3VwcG9ydA0KPiA+ICAgb24gZGlmZmVyZW50IHBs
YXRmb3JtDQo+ID4gLSBJbmNsdWRlIGJpdGZpZWxkLmggZmlsZSB0byBmaXggZm9sbG93aW5nIGJ1
aWxkIGVycm9yDQo+ID4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4
LWlzaS1yZWdzLmg6MjM6NjU6IGVycm9yOg0KPiA+IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmEZJRUxEX1BSRVDigJkNCj4gPiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0NCj4gPiAtIExpbmsgdG8gdjE6DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI2MDMwOS1pc2lfdmMtdjEtMS1mZDBiODAzNWQxY2RAbnhwLmNvbQ0KPiA+DQo+ID4gQ2hhbmdl
cyBpbiB2MToNCj4gPiAtIERlcGVuZHMgb24NCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1tZWRpYS8yMDI1MTEwNS1pc2lfaW14OTUtdjMtMi0zOTg3NTMzY2NhDQo+ID4gMWNAbnhw
LmNvbS8NCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4
LWlzaS1jb3JlLmggICAgfCAgMyArKw0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9p
bXg4LWlzaS9pbXg4LWlzaS1ody5jICB8ICA0ICstDQo+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9u
eHAvaW14OC1pc2kvaW14OC1pc2ktcGlwZS5jICAgIHwgNDMNCj4gKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXJlZ3Mu
aCAgICB8ICA2ICstLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmgNCj4gPiBpbmRleA0KPiA+DQo+IDNjYmQz
NTMwNWFmMGY4MDI2YzRmNzZiNWViNWQwODY0ZjhlMzZkYzMuLjExYTVlMzk1NzkyZjExNzUyYzQ0
ZDczOA0KPiAxOGM4DQo+ID4gMjVmMmYxNzVhYTFkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0KPiA+IEBA
IC0yNTYsNiArMjU2LDkgQEAgc3RydWN0IG14Y19pc2lfcGlwZSB7DQo+ID4gIAl1OAkJCQlhY3F1
aXJlZF9yZXM7DQo+ID4gIAl1OAkJCQljaGFpbmVkX3JlczsNCj4gPiAgCWJvb2wJCQkJY2hhaW5l
ZDsNCj4gPiArDQo+ID4gKwkvKiBWaXJ0dWFsIGNoYW5uZWwgSUQgZm9yIHRoZSBJU0kgY2hhbm5l
bCAqLw0KPiA+ICsJdTgJCQkJdmM7DQo+ID4gIH07DQo+ID4NCj4gPiAgc3RydWN0IG14Y19pc2lf
bTJtIHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktaHcuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktaHcuYw0KPiA+IGluZGV4DQo+ID4NCj4gMDE4N2Q0YWI5N2U4ZTI4ZmNhOTAx
M2Y2ODY0YTA5NGUwOGYyYzU3MC4uMmJhYmI4NTczMjI3ZGU5ZTFhYTM2ZDkNCj4gYTM5YmUNCj4g
PiA0MWIyODZjZjBjNTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9u
eHAvaW14OC1pc2kvaW14OC1pc2ktaHcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWh3LmMNCj4gPiBAQCAtMzM4LDcgKzMzOCw5IEBAIHN0
YXRpYyB2b2lkIG14Y19pc2lfY2hhbm5lbF9zZXRfY29udHJvbChzdHJ1Y3QNCj4gbXhjX2lzaV9w
aXBlICpwaXBlLA0KPiA+ICAJfSBlbHNlIHsNCj4gPiAgCQl2YWwgfD0gQ0hOTF9DVFJMX1NSQ19U
WVBFKENITkxfQ1RSTF9TUkNfVFlQRV9ERVZJQ0UpOw0KPiA+ICAJCXZhbCB8PSBDSE5MX0NUUkxf
U1JDX0lOUFVUKGlucHV0KTsNCj4gPiAtCQl2YWwgfD0gQ0hOTF9DVFJMX01JUElfVkNfSUQoMCk7
IC8qIEZJWE1FOiBGb3IgQ1NJLTIgb25seSAqLw0KPiA+ICsJCXZhbCB8PSBDSE5MX0NUUkxfTUlQ
SV9WQ19JRChwaXBlLT52Yyk7DQo+IA0KPiBZb3UncmUgbm90IGFkZHJlc3NpbmcgdGhlIEZJWE1F
IGNvbW1lbnQsIHNvIGl0IHNob3VsZCBiZSBrZXB0IChvciBpZGVhbGx5DQo+IGFkZHJlc3NlZCA6
LSkpLg0KDQpPaywgd2lsbCBhZGQgaXQgYmFjay4NCg0KPiANCj4gPiArCQkvKiBQbGF0Zm9ybSBs
aWtlIGkuTVg5NSwgSVNJIHN1cHBvcnRzIDggdmlydHVhbCBjaGFubmVscyAqLw0KPiA+ICsJCXZh
bCB8PSBDSE5MX0NUUkxfVkNfSURfMShwaXBlLT52YyA+PiAyKTsNCj4gDQo+IFRoaXMgc2hvdWxk
IGJlIGRvbmUgZm9yIGkuTVg5NSBvbmx5LiBZb3UgYWxzbyBuZWVkIHRvIGNsZWFyIHRoZSBiaXQg
YWJvdmUgaW4gdGhlDQo+IGZ1bmN0aW9uIGp1c3QgYWZ0ZXIgcmVhZGluZyBDSE5MX0NUUkwgKGZv
ciBpLk1YOTUgb25seSBhcyB3ZWxsKSwgb3RoZXJ3aXNlDQo+IHN3aXRjaGluZyBiZXR3ZWVuIGRp
ZmZlcmVudCB2aXJ0dWFsIGNoYW5uZWxzIHdvbid0IHdvcmsuDQoNClllcywgeW91J3JlIHJpZ2h0
LiBXaWxsIGZpeCBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gIAl9DQo+ID4NCj4gPiAg
CW14Y19pc2lfd3JpdGUocGlwZSwgQ0hOTF9DVFJMLCB2YWwpOyBkaWZmIC0tZ2l0DQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1waXBlLmMNCj4gPiBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXBpcGUuYw0KPiA+
IGluZGV4DQo+ID4NCj4gYTQxYzUxZGQ5Y2UwZjJlZWI3NzllOWFhMjQ2MTU5M2IwZDYzNWY0MS4u
Y2M0MzQ4ZWE2MDA2ZWUxOTI0M2FhZTMNCj4gYWJjZWINCj4gPiAyMzVkMDBiZWVhNGQgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2kt
cGlwZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14
OC1pc2ktcGlwZS5jDQo+ID4gQEAgLTIzMiw2ICsyMzIsNDUgQEAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgbXhjX2lzaV9waXBlICp0b19pc2lfcGlwZShzdHJ1Y3QNCj4gdjRsMl9zdWJkZXYgKnNkKQ0K
PiA+ICAJcmV0dXJuIGNvbnRhaW5lcl9vZihzZCwgc3RydWN0IG14Y19pc2lfcGlwZSwgc2QpOyAg
fQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgbXhjX2lzaV9nZXRfdmMoc3RydWN0IG14Y19pc2lfcGlw
ZSAqcGlwZSkgew0KPiA+ICsJc3RydWN0IG14Y19pc2lfY3Jvc3NiYXIgKnhiYXIgPSAmcGlwZS0+
aXNpLT5jcm9zc2JhcjsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHBpcGUtPmlzaS0+ZGV2
Ow0KPiA+ICsJc3RydWN0IHY0bDJfbWJ1c19mcmFtZV9kZXNjIHNvdXJjZV9mZDsNCj4gPiArCXN0
cnVjdCB2NGwyX21idXNfZnJhbWVfZGVzY19lbnRyeSAqZW50cnkgPSBOVUxMOw0KPiA+ICsJdW5z
aWduZWQgaW50IGk7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IHY0bDJfc3Vi
ZGV2X2NhbGwoJnhiYXItPnNkLCBwYWQsIGdldF9mcmFtZV9kZXNjLA0KPiA+ICsJCQkgICAgICAg
eGJhci0+bnVtX3NpbmtzICsgcGlwZS0+aWQsICZzb3VyY2VfZmQpOw0KPiANCj4gSSBkb24ndCBz
ZWUgdGhlIHhiYXIgaW1wbGVtZW50aW5nIGdldF9mcmFtZV9kZXNjKCkuIEFtIEkgbWlzc2luZyBh
DQo+IGRlcGVuZGVuY3kgPw0KDQpHb29kIGNhdGNoLCB0aGFuayB5b3UuDQoNClRoZSB4YmFyIGdl
dF9mcmFtZV9kZXNjKCkgaW1wbGVtZW50YXRpb24gd2FzIGRldmVsb3BlZCBzZXBhcmF0ZWx5IGFu
ZCBJIA0KbWlzdGFrZW5seSBkaWRuJ3QgaW5jbHVkZSBpdCBpbiB0aGlzIHNlcmllcy4gWW91J3Jl
IG5vdCBtaXNzaW5nIGFueXRoaW5nIC0gDQppdCdzIG15IGVycm9yIGluIHBhdGNoIG9yZ2FuaXph
dGlvbi4NCg0KSSB3aWxsIGluY2x1ZGUgaXQgaW4gbmV4dCB2ZXJzaW9uIHRvIG1ha2UgdGhpcyBz
ZXJpZXMgc2VsZi1jb250YWluZWQgYW5kIGNvbXBsZXRlLg0KDQo+IA0KPiA+ICsJaWYgKHJldCA8
IDApIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgc291cmNlIGZyYW1lIGRl
c2MgZnJvbSBwYWQgJXVcbiIsDQo+ID4gKwkJCXhiYXItPm51bV9zaW5rcyArIHBpcGUtPmlkKTsN
Cj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkg
PCBzb3VyY2VfZmQubnVtX2VudHJpZXM7IGkrKykgew0KPiA+ICsJCWlmIChzb3VyY2VfZmQuZW50
cnlbaV0uc3RyZWFtID09IDApIHsNCj4gPiArCQkJZW50cnkgPSAmc291cmNlX2ZkLmVudHJ5W2ld
Ow0KPiA+ICsJCQlicmVhazsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKCFl
bnRyeSkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGZpbmQgc3RyZWFtIGZyb20g
c291cmNlIGZyYW1lIGRlc2NcbiIpOw0KPiA+ICsJCXJldHVybiAtRVBJUEU7DQo+ID4gKwl9DQo+
ID4gKw0KPiA+ICsJaWYgKGVudHJ5LT5idXMuY3NpMi52YyA+PSBwaXBlLT5pc2ktPnBkYXRhLT5u
dW1fY2hhbm5lbHMpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIlZpcnR1YWwgY2hhbm5lbCglZCkg
b3V0IG9mIHJhbmdlXG4iLA0KPiA+ICsJCQllbnRyeS0+YnVzLmNzaTIudmMpOw0KPiA+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXBpcGUtPnZjID0gZW50cnktPmJ1
cy5jc2kyLnZjOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIGludCBteGNf
aXNpX3BpcGVfZW5hYmxlKHN0cnVjdCBteGNfaXNpX3BpcGUgKnBpcGUpICB7DQo+ID4gIAlzdHJ1
Y3QgbXhjX2lzaV9jcm9zc2JhciAqeGJhciA9ICZwaXBlLT5pc2ktPmNyb3NzYmFyOyBAQCAtMjgw
LDYNCj4gPiArMzE5LDEwIEBAIGludCBteGNfaXNpX3BpcGVfZW5hYmxlKHN0cnVjdCBteGNfaXNp
X3BpcGUgKnBpcGUpDQo+ID4NCj4gPiAgCXY0bDJfc3ViZGV2X3VubG9ja19zdGF0ZShzdGF0ZSk7
DQo+ID4NCj4gPiArCXJldCA9IG14Y19pc2lfZ2V0X3ZjKHBpcGUpOw0KPiA+ICsJaWYgKHJldCkN
Cj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiAgCS8qIENvbmZpZ3VyZSB0aGUgSVNJIGNo
YW5uZWwuICovDQo+ID4gIAlteGNfaXNpX2NoYW5uZWxfY29uZmlnKHBpcGUsIGlucHV0LCAmaW5f
c2l6ZSwgJnNjYWxlLCAmY3JvcCwNCj4gPiAgCQkJICAgICAgIHNpbmtfaW5mby0+ZW5jb2Rpbmcs
IHNyY19pbmZvLT5lbmNvZGluZyk7IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXJlZ3MuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktcmVncy5oDQo+ID4gaW5kZXgNCj4gPg0KPiAx
YjY1ZWNjZGYwZGE0YmJjM2E3N2M5MWUwNmZjY2MzNWQ2YzdlMDIyLi5hNDAzNmRhNzJmMDA1NzI2
NWU5OTEwODcNCj4gZjIxYg0KPiA+IGMwNzliZDZjNjU3MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1yZWdzLmgNCj4gPiArKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1yZWdzLmgNCj4g
PiBAQCAtNiw2ICs2LDcgQEANCj4gPiAgI2lmbmRlZiBfX0lNWDhfSVNJX1JFR1NfSF9fDQo+ID4g
ICNkZWZpbmUgX19JTVg4X0lTSV9SRUdTX0hfXw0KPiA+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9i
aXRmaWVsZC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvYml0cy5oPg0KPiA+DQo+ID4gIC8qIElT
SSBSZWdpc3RlcnMgRGVmaW5lICAqLw0KPiA+IEBAIC0xOSw5ICsyMCw4IEBADQo+ID4gICNkZWZp
bmUgQ0hOTF9DVFJMX0NIQUlOX0JVRl9OT19DSEFJTgkJCQkwDQo+ID4gICNkZWZpbmUgQ0hOTF9D
VFJMX0NIQUlOX0JVRl8yX0NIQUlOCQkJCTENCj4gPiAgI2RlZmluZSBDSE5MX0NUUkxfU1dfUlNU
CQkJCQlCSVQoMjQpDQo+ID4gLSNkZWZpbmUgQ0hOTF9DVFJMX0JMQU5LX1BYTChuKQkJCQkJKChu
KSA8PA0KPiAxNikNCj4gDQo+IEknbSB0ZW1wdGVkIHRvIGtlZXAgdGhpcywgaW4gY2FzZSB3ZSds
bCBuZWVkIHRvIHNldCBpdCBsYXRlci4gV2UgY2FuIGFkZCBhDQo+IGNvbW1lbnQgdG8gaW5kaWNh
dGUgdGhlIGZpZWxkIGlzIG9ubHkgdmFsaWQgb24gaS5NWDhRTSBhbmQgaS5NWDhRWFA6DQo+IA0K
PiAjZGVmaW5lIENITkxfQ1RSTF9CTEFOS19QWEwobikJCQkJCSgobikgPDwNCj4gMTYpCS8qIGku
TVg4e1FNLFFYUH0gKi8NCj4gDQo+IG9yDQo+IA0KPiAjZGVmaW5lIENITkxfQ1RSTF9CTEFOS19Q
WEwobikNCj4gCUZJRUxEX1BSRVAoR0VOTUFTSygyMywgMTYpLCAobikpCS8qIGkuTVg4e1FNLFFY
UH0gKi8NCj4gDQo+ID4gLSNkZWZpbmUgQ0hOTF9DVFJMX0JMQU5LX1BYTF9NQVNLDQo+IAlHRU5N
QVNLKDIzLCAxNikNCj4gPiAtI2RlZmluZSBDSE5MX0NUUkxfTUlQSV9WQ19JRChuKQkJCQkJKChu
KSA8PA0KPiA2KQ0KPiA+ICsjZGVmaW5lIENITkxfQ1RSTF9WQ19JRF8xKG4pDQo+IAlGSUVMRF9Q
UkVQKEJJVCgxNiksIChuKSkNCj4gDQo+IFBsZWFzZSBhbHNvIGFkZCBhIGNvbW1lbnQgdG8gaW5k
aWNhdGUgdGhlIGZpZWxkIGlzIHZhbGlkIG9uIGkuTVg5NSBvbmx5Lg0KPiANCj4gI2RlZmluZSBD
SE5MX0NUUkxfVkNfSURfMShuKQ0KPiAJRklFTERfUFJFUChCSVQoMTYpLCAobikpCS8qIGkuTVg5
NSAqLw0KPiANCg0KU291bmRzIGdvb2QuIEkgd2lsbCBhZGQgYSBjb21tZW50IGluIG5leHQgdmVy
c2lvbiB0byBjbGFyaWZ5IHRoaXMuDQoNCj4gPiArI2RlZmluZSBDSE5MX0NUUkxfTUlQSV9WQ19J
RChuKQ0KPiAJRklFTERfUFJFUChHRU5NQVNLKDcsIDYpLCAobikpDQo+ID4gICNkZWZpbmUgQ0hO
TF9DVFJMX01JUElfVkNfSURfTUFTSw0KPiAJR0VOTUFTSyg3LCA2KQ0KPiA+ICAjZGVmaW5lIENI
TkxfQ1RSTF9TUkNfVFlQRShuKQkJCQkJKChuKSA8PA0KPiA0KQ0KPiA+ICAjZGVmaW5lIENITkxf
Q1RSTF9TUkNfVFlQRV9NQVNLCQkJCQlCSVQoNCkNCj4gPg0KPiA+IC0tLQ0KPiA+IGJhc2UtY29t
bWl0OiA2ZGUyM2Y4MWE1ZTA4YmU4ZmJmNWU4ZDdlOWZlYmM3MmE1YjVmMjdmDQo+ID4gY2hhbmdl
LWlkOiAyMDI2MDMwOS1pc2lfdmMtMjg1ZmQ4MTUxNDBlDQo+ID4gcHJlcmVxdWlzaXRlLXBhdGNo
LWlkOiA2ZjEzOWExZDU0ZmEzZTA2MzJkYjliOGE3MzZhZTI3MDM3YzVmNDVhDQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

