Return-Path: <linux-media+bounces-65866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gqk+LHglQmrZ0wkAu9opvQ
	(envelope-from <linux-media+bounces-65866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:57:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB586D73C1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:57:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Uoz2ufnC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65866-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65866-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 336593119BF4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF4F3E3C4C;
	Mon, 29 Jun 2026 07:43:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D4D3E1D01;
	Mon, 29 Jun 2026 07:42:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718981; cv=fail; b=kO1EpMehtv+cZf4F79qocdZRPTnpJJBCVfdOGHmmc5WGY0qSyBYvDRReRQi0NCP2q6VzyCwSCiUG6f17nUMeX36d7rElUmz+4U7Ux8Jxn5xazC8QsMw2kuC38gL/4Qza52CltgXkKf9zr9V3v0OjBGyDHYa2niw12rm/SxmfL80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718981; c=relaxed/simple;
	bh=y3HlLyfdYKZ9IZOiAnU57hESRessYP93Uxv3EImBhTo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZYP2fQG2oLp7eaGJM7V2LK91Ghw+A9boct8RWp2es59OQq4lGTETIyWGw/l04dQQdxie77dU+zPt3J0nAK0cmxhul9wBqZ2tECSmMjpDe9GKd+MMuds2HFd0c05yK2f3AjTCLTkoqmb6eLRKotOlpB5h+sCN2dXlSYZ9fa7CVPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uoz2ufnC; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVVVTJ8qH8279lOKskO++CestLQ0hzfv6Hbdn/XYSPPPJU50fM9Mur/njRJzgqzI7uZ3l+q0gUR9s9TPTOmnUCBXM/yejB5Cjkftd7cx30CimJFQ6oWL8hJPbQvpzNLQWH4kjGul04+vmnZNxLMzD3C120vIETGUpv6Ze2B3Jd6rd73mGOVli5ZGHwOdGxklFajtVYNA9hlopx30loLmWY2P4g6MmIk9RyeSkaII+oDJ3MS9b7hr67QTawsvaDdaIJdfGDLToZntO3VV5yEdx4K/+cB7uTmZkUc0xegh2SJLpAJGqhWW0IHiEyYINSFqpAgjE7BxJjCqI1qg2Hx8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rITp1EdIqvHqqcflxtijdTxOeaG8OlMqVhdNWf0RwzE=;
 b=Ma4iBmoqKcFyBR+GrbLlk8lGjcK25jLizIt+qgH48Z8mtP8nbHN8lhJ2fcMKsFhc8frCZS5lr6oxraeVhNQ9IxFOueOnSvYqLY/k78VgwEt6FKQEH1Ro2aSF5FCi8tl7Rhr3Ga1UrTpRbI+qbzD0dMAEY0bRAaN9+0FqP1T0UhI/MXHDUt/RB58AzG+wGkk9WDOyTqvh3sLfPs1YZKwkVRrfNNoLmmojZZQUif4HsY/3Qr+UXT2wGsc5qDQzFOInHhqZq6ZwYo75PC01k3jzFnOe0YPeqiGuIEo2fy5g825yVgq0Bs3wbO4I8P2bod0xJh05lAFPSyuRA14C7+proQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rITp1EdIqvHqqcflxtijdTxOeaG8OlMqVhdNWf0RwzE=;
 b=Uoz2ufnCi9/1nhafjPHSbfGk6LvSYBmODhQky2vWEJh45PNQTwr6kpJWBethNQyakEQKU6LZCNVklVfhKqgTWzzeFGgeFMyuVbMPsBl0do/UnFu4CMrhJbj//wwzPjBMvtM7pb6h7cshySbWca494nPyE3l/qn773CAKDaqg2hnvMyqNdsQNozt/4bUl3i9w2tFFUTWJV9vTMJnyHIK+BwlUkb9IjTK21iZqXuZuIXP7wMHkFeXW/5pQtXF63SIr2zOf8c7w7pWH+ss/pxfJSFgPN/xEvxWpUIVDjnvVHJnBoI+BG7dmwLXHi+7RbHQI+fJS/3vuke8tdJUCH0V9tw==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM0PR04MB11932.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 07:42:47 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:47 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 29 Jun 2026 15:44:59 +0800
Subject: [PATCH 5/5] media: nxp: imx8-isi: Add additional 32-bit RGB format
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-isi-v1-5-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
In-Reply-To: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=3324;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=y3HlLyfdYKZ9IZOiAnU57hESRessYP93Uxv3EImBhTo=;
 b=crUoU84jzRb8WRzuX9Tl4IDLKoC2w5grfAOFDOLBmuantHW6aJK7cfhGvtz26jZ2HeG0OEgkL
 PRm+JX0/yFVAdwAq6fseBit+TQfY/kmH7MP/z1jgBEzwNxFq75H49Pg
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM0PR04MB11932:EE_
X-MS-Office365-Filtering-Correlation-Id: 46833a3a-8978-44ce-8c09-08ded5b20328
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|7416014|18002099003|22082099003|11063799006|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
 0rIgOsxHHNEQkW4JBfvRJFtDHPrd8iExt8u/iHcZIV3ek6jYmzM5q3vsUbYFMNYEV64zo93cA4iS9GKOx1Wz9b1h76g4IQ0sLxWTKraJCODmRdcvlwmuo5Ghv8UC9BvvefixCYXgoVRoC882RynQeCQbFE5NOv6YAmOE8wvFsrdPzorOnDbGaTGzo8G5pmsjCrC/N1YBkcg5Sbtwqd7k/TFdztxN5IuYA6e211PrTj8muZzqh53sfONZ9JzIN2rKNYaq2D20EcrQ2L9Jvw2+RpZJnnvD/HXLBxt+T+qOI/wYyEBkBzd206ca/xhaCqcN2s5wPpUXCBgyKZMy0/k+DW7hAMZs2jOyrcxpaLd9UPIjyiMREhkJxwkE2IhkONk2qhF8QAoC8VeYL7vSyYsFimY5HXivvYMZop7+QGiAUh2ymFn1kw3PF45qHasG7emJHip2kJe39UxAofybMEOwcYFSnZ02TsrJRrqLQl4/+xV+eql+bbtet/JxwLhNrWfczPlteUqs7IHX9HA5YJXqlfcbSw35ZUDvAPuNU7CWGN5QaP1DaOBtMIPzOLkNmLC7gLPp4HE9sRMk+wBRE3MoWm3/p1Q87wFYfIDWH/LFu+KPl5QwtWsEMPKpNQDkk+N2Djnb1zZDynTxMtRylKjvbmjI5CGoSOQwXyTAY5Rcp54=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(7416014)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?REgxQzZCNTdySmM5TmhETmVpV25DMU0vOGFyUWhMc1FCWXltNzFIMGltWGRn?=
 =?utf-8?B?cTVCOGhxMFZmOGN6MERUY2dkMnUzY1BIbUtyeC9TNFptcnh5RjgwajhLa3Ax?=
 =?utf-8?B?OVllN1ZKZTlHeFJGSFJjcko5N3ZURC8zVUM0RjhuRmdlL3d6dWpzcXFmVUp6?=
 =?utf-8?B?Qm1Ka0E4YkZIbDM5bG5hT3BaSXliY0orcWV2Sld0VWJNSXFDQUVyb0NybVYv?=
 =?utf-8?B?Rmw2OEVBMWt2WjdkTWJYdEFER0hkMThmMFZrZVpPMG95Q3lRTWU2RXU3UTZx?=
 =?utf-8?B?cmhhV1NydnZaT0dwK053Ui9MbVBkSWhWWWtlVlRtMkhoYzlSd1N0aXE3T2hW?=
 =?utf-8?B?aW4ySlpRbWMrS0hsVFcxVjZMWnpvSkx2Q3pPcjRYT3JLamZFL04zYWMyOHdw?=
 =?utf-8?B?Vjgwa1JWUkprRTMweUNzMXhGZ3V4VTkvcUR2MGM1d2JvM01HYnlLN0wwTGJW?=
 =?utf-8?B?VDJvemlORWc4U0ZycFBLTVBMUmkzYVVLU3Z6TVNVUkdZQ3JDV05FTk9RTzBs?=
 =?utf-8?B?enI3M1J0ZmRPUWlpckw2M3R5T2hOQ01jUnFMTXBxbE1EeWxUQ2crY3FwQ0NK?=
 =?utf-8?B?TDNocnpxQXNqRjIxSDF3azZSL1V2NWh0ZzZvUDlmYjNic25sbHdGQ3ovMmxE?=
 =?utf-8?B?R2g5Y2UzSXVjUTl0ZmpKTHdhRm5Dc211R1ZYUVZFdzd5U2VuZVpSN2htbERY?=
 =?utf-8?B?ZFljcjllU2MwdlVLck92OTZvNm1lOHIvRnRFaDBEdmdvKzg2UHV0dWNiL2ND?=
 =?utf-8?B?dWQyYkE0eUw5WlRWY1JjRU9VdnV2OFZjYmNSMURDb2J1MUpvQnRuMlk5L25w?=
 =?utf-8?B?ZXAwc01RbXVIcHkva01FZ3hKcjZvRFh5S3Y4eWVpNTcrYlpVUTBva1lhZ1Fx?=
 =?utf-8?B?N2dpS3VSbjUyZndEOTBXVnVOb2k3a2NtdnNydGpjMUJLOHRXU2t0U3lRTnlX?=
 =?utf-8?B?QysxaXRDK3FkSFphSCtrZWdQK3NpWlEwOTJ2Q3R1Q1Q3bmYzS2Y1bjdHSVh5?=
 =?utf-8?B?VGJnc2FmbmMzTjZHQjlpQkErZWVpV1N0MWlqTERCY3lxQWVXTFNLcU02bTlS?=
 =?utf-8?B?WmhQZVB6NVZPUU4rQ1gzR0U4dWg3K3VTdmY1RUhqdW42YzJtSXJ0WUJNNS9v?=
 =?utf-8?B?VzM0Zm1Dam01S2FMMlB0QUFVRFVaWEJ2ZGdxbll4bGl3b1B3TTh4cDRYbUJ2?=
 =?utf-8?B?WGh1OElBa3VTckE5ekNPMjg3bWdIODA3VVpvTUxHbG1yRGxzU1RzZGVYOUdH?=
 =?utf-8?B?cHZWY0pYVkhZK3dtdVFQTW94TTMwdTVLemYzdWhhVGlRZU1NQWl3eU9WTy9h?=
 =?utf-8?B?bWlFaEZkNUI1ZlRHVllOUjVOb2tWc2lJSnREZ1JmK1dxQm1hTmE5bGx3bEVu?=
 =?utf-8?B?b09Ecy9sekpsZmtpMXNPZFMyVUFFRTV3L3FuQ3FFRk1GWUw3c05Gbkc0ZTBv?=
 =?utf-8?B?d2FYYVdUd1BXR2tSellJcnViVnZ5QkhhQzBxcGVxZWRTUGdKODBCRUQ4WkR5?=
 =?utf-8?B?WmNaTDZZTG1mNzhrc2J0SFUyZzFMVy9yVUxybklqMktORTJCTU1YbnpvS0sv?=
 =?utf-8?B?Y3VXclQ0MkFSU2ptQnlabWw1Q2tYNE5ISEpxV3VNMElSTHdDV2FsQVY1bEtV?=
 =?utf-8?B?ZzR3WGd4WTc1VzlOd0s0V0prWm9SVTFJSmpTRGoxZCtqZXZ1QmJ1dC9ZaFU3?=
 =?utf-8?B?ZVZVYXJ0Q2JobVVtMDJLK3hoa1hGZEFZUGk4bXpDTHl4TWpNWDdDZk02bTRa?=
 =?utf-8?B?R2xYN2d2VDZGNktLaFRxUlhaTGVBS0oycVl3alB1bExHV2lRcTF5SG9DOVIv?=
 =?utf-8?B?V2IzdDZqalZaUlZiRTd1R0ZLUjAvR2pXUGFaaEpoc0E3eUR1cEVOUnZEc2p5?=
 =?utf-8?B?TlNtNDloWGpacGVVeHJnU0lYWGVnTEpZZEUzRGx6V1ZFNGNCQmZ0SHF2eUhM?=
 =?utf-8?B?TEY4SlJ1dUpPNUphZ0RudElKVXFvYitJTk5QdElMK09NTDdzU2hBVUE5cWpK?=
 =?utf-8?B?NGtiVUVreDZpbkNpMkhCOU5oMXVJcFRuZEJuaXFrL0p4MTNWb0lIODQ2Wmw0?=
 =?utf-8?B?UUN5Zy92Mjk3dVdiSHpUUjNqR0V5TURPTzFBdyt4eHdqNTNjWm5UaGhrRXI0?=
 =?utf-8?B?Z2NkeitZcTZUY2NpRGV2TzM4QTVHa3AxMVNQU1A3ejZVelh0dmFqTVhrSHNy?=
 =?utf-8?B?dGhrbmxtR3lycHM5aEdTOW5sS3hNZXFEcHlLWXFOeisreTFFU1NSRnBuY1N4?=
 =?utf-8?B?R0p1aFpGRk5UeXhaV0pPeWNRMmRHTUplcnZQZzZlMEFjN3MyM2VaaXdyZ2pE?=
 =?utf-8?B?VUtLWmx1UjZEYmxra1VtMUNtM2VUcHNvdGs5cktBeHF2REZxVi9pSTVBWEhk?=
 =?utf-8?Q?sVqAb0WEkvVl7Oj+kGy5WMG05K0byo4NETN3K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46833a3a-8978-44ce-8c09-08ded5b20328
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:47.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6KvwWLZk+p499YTZUrB1hhl+KJ4Xygf4wCIZvpflKuMdZPtuBPX4It28SkjvC6JSjAs8GKMpLkX3McDepPYTpCShpeavVhiCrFonYfka7g6MHogn/fqz5/qkGS7PYMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11932
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@oss.nxp.com,m:robert.chiras@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65866-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,nxp.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AB586D73C1

Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
BGRX32, RGBX32, ARGB2101010) and extend existing ABGR32 format with
full memory-to-memory capabilities to meet Android requirements.

All formats support capture, M2M input, and M2M output operations,
enabling complete format conversion pipelines.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 59 +++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 05b51b98344b..ef638af350fe 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -160,12 +160,69 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
 		.fourcc		= V4L2_PIX_FMT_ABGR32,
-		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,
 		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ARGB8888,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 32 },
 		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
 	},
 	/*
 	 * RAW formats

-- 
2.34.1


