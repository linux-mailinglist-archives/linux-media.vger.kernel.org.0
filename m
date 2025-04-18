Return-Path: <linux-media+bounces-30520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD33CA9333D
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447E47AFB0A
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEB626A0EE;
	Fri, 18 Apr 2025 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lEmc5ZaS"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2046.outbound.protection.outlook.com [40.107.241.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223226AABC;
	Fri, 18 Apr 2025 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960190; cv=fail; b=daD/sJRa1jlUFWq0Q/D72XzJVitJvlv/o37ob+yjubShrBnrNmKsA8kmwh2qrZfRBeA6PAFQmY3uFphD9WPHeHqj5CHAC1S3LPshVMEwuF2HQoGnHavTHiD/JY5HcZWgZmkaq67TzusZuqbx7lQthtsndbZlTOEFwZaGOchKmmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960190; c=relaxed/simple;
	bh=Wn8alGTUkeaybdxeNvYnv0zGe1DJI7LF9tfirkWJ80Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p7IighhaYJwJGdAXUNpgCY8ur3H1YScoKWUfwZGzkbvZqXsIaHLkcYMb39KKVAea/35pEGP+uIvFfOxijwKnH/wMDLUfdDEzp9EY0+xoM76UjPa1hvMECKSORySOVnt+vkijoTF/zI/5mroZpPXWkwvmHaReoUTErDeDbnkEkhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lEmc5ZaS; arc=fail smtp.client-ip=40.107.241.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbyWuWjBNFPMKiyHaWLWCjASPNI4lUSi5J5RGF0SgE9YRvrZ8xJ6OHGb4Nb6hkP5y23aGa1cE1JyUIP9/AyTzZSLvJZASE0CguL8zdKhkNmZ+4Nyb7HYl7aWjyIaUSjy3aB4XBoH0TB6bbxX71+pLLQ9VXlO8qpbzYw/OSXP3wC9sS/lD/GX6jJxcmVpkfcrtlly5Q9SJaUhRugDDcu3JsL0j8AiR00yOoJEKZAmOC/c/nOMNcto9inzpNCb+DvHrNJXRFP8NSMUbi0NGm7R59ChUWRMr4zkifZyUlZa7LMQ8P2uxFZfZ42mCCA6/xlHIO9K8PeaVYcVF+5C/14+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyGuoQ4PQsYSjvwIzt7RZA/K2hNku7Iwy2yKEj0nMvU=;
 b=uBFi8eo6wXal2v/cC1QsAILpdgd5zZ4maguqranqvXre3sU5L03wuolqg+ZtFpADJ5gjVS+15i+LN1YnvMoCqEdMqt4wyNtbB6YFu1z4Fvyi+JJIISYqydh27IIFHXjHtw8ISVb14x7OR9Pzt7/HvfnpqLHniDuD8RDe4VYKd9mNu+/CzvlDqlnjXDN4F6oCO8j+h0f5hV6xsktTA8p//pSXUb5td7cyoc4Ff8OVENSxwqu/8wdLmaBcUpdAf1Qf3NSyupzG3u+SP09GO9GAJn12XxSkiSwl36ka1nw/43x2gZ107HRcP+xwhc8inBcEN4kzsTPg/j601P3PzLzhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyGuoQ4PQsYSjvwIzt7RZA/K2hNku7Iwy2yKEj0nMvU=;
 b=lEmc5ZaS7jJGVAMy6SipPl521ABcESLvuxdnok3vOt63ubu/z315D7MexllCw56E0Q0dwd5upWZxhvtHt/U9Dbzn89IwqVuUv/tjk/NQ6JY3tn0LICxpiJUn8gDhrFZtAqSkgudlWctgGicpu5wSPay8Mon9S0SgsqsX8Z+JEIKqPVxRymS/R4Bki8PEeHjlLjMbpUEEK8OydAIG+x4kLmh7m5F4uJ7dTONwFE1OVbWppu2SSEYC2EXU/SJtDsbOE83Mx4yuZhtTe1b5HOOjtKOzV/zDNo4BR1WOWcx1A+M8lmoCWJyuhOE5dCkVKfDQjz+UP+dvTTjxa1/5D+r+Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:45 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:45 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/5] media: imx-jpeg: Change the pattern size to 128x64
Date: Fri, 18 Apr 2025 15:08:20 +0800
Message-ID: <20250418070826.141-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c8d5c8-5659-4f8d-3f39-08dd7e47ff68
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4HBOZ02EdCxS3k+80Zd3nUe/ZiXL11rpJaXrEaWCnfc663uSClEJhAOaJ/Wl?=
 =?us-ascii?Q?A7z/++oGd8P/PZSs9UkMfLeLhUbPM45ZpTrDVvzlMPj3+e9O2K+M3NkujcEM?=
 =?us-ascii?Q?qUdXhKgvE1hGupA6csT9GU1pnI0deEaX9JaEQqZpv6GIfahQNlMP1sAHEqHB?=
 =?us-ascii?Q?c48MQ9zVDOHHct7P85i8+X2WzKSx8jZhwGnbqfYDYNWhIWnRP9H8R+SwrZWd?=
 =?us-ascii?Q?NEW/5WKizW4c+fJp7YTRX2pJZJISdzSsRbqeIOFFzx0ltQ5RWIaDgVjj3rXQ?=
 =?us-ascii?Q?1c2rU961XT2YeltVWQ36Dh1DI8kH+XCJdWGf8fCjBObvWmty8XtC1soWltQA?=
 =?us-ascii?Q?2dD4gNrvtEirmfDMKZ9UattZ16rAibuStKSIvnytlSPIGQBKYul8CjpB3D2g?=
 =?us-ascii?Q?7u/nm9p7zqUMnjQPrSZbYQz2Z8cikgfGs4trpsJlfeWe1vY8TvzcE7XjW9lI?=
 =?us-ascii?Q?Szc5iH4d6vj2YdTAHeOIorr6uiQJF0GJG82+Ln0y6Ug7Fq90L2ewBPRfZbeC?=
 =?us-ascii?Q?+YqXL0Gmg84S2LbBWKdwf4jiMfMmYGcGZTY+LdSbqmkw1+CyGrIE2P8to32N?=
 =?us-ascii?Q?d37D5JpF8Y4a8Lhwt09oHBrESFP/dPaPML3xPWhtt3i9OMM2IGGK5lt2Iy7P?=
 =?us-ascii?Q?nRhOMzR1AP4L0VNCCDSAGjBpI8xZ32vZuO8aFU2RyKTgQFr3BhQmQ0f5k3Rl?=
 =?us-ascii?Q?MWokX6I+4hgnV/sJL0KnFpn68mqzJlaLqyvMxGe2qDkwDiP5cifQKWOESRMu?=
 =?us-ascii?Q?l5LR7ZNDDJd4lBPheGWlG3gdgFk8TmsOu44mbctxHnKTlNWFT38H6mwnY9kO?=
 =?us-ascii?Q?wOyfGnDSajx90P+cjmz+5geCxyH7Gx/gkjhmtswWcXbXlOmdmBzWyNUZw0mq?=
 =?us-ascii?Q?rM1Cnk3+PUzxyLm8bbM6iNwH8nKHShtlYKjT6MYfzSqa0ubgNvvfN7uWbPgo?=
 =?us-ascii?Q?0wF4wZyycq93+tFLQbaxldtTOhTkAw8bh002H4AjVj5sqCLmHAnoJlfjmTQC?=
 =?us-ascii?Q?603KdlyhZrbVyQHEJAeo44xuFZL645fc7gY405I9aSvCDVQ35O+WcF/uMcTR?=
 =?us-ascii?Q?mqTal3qBiCitUTIirqNSCmGi/jpUrj0Y02ctXbdmoGjS0eNrZ5ebGlzaLI6A?=
 =?us-ascii?Q?aLEygiKDR9DoZm40NoCy8Uf8R+LFOOaN9J45Os1HOtKotYdz3/UtkqtWxfpQ?=
 =?us-ascii?Q?bKmHOzOTQ9gC79ppSkQnzOYjJ0Dc1jIJs8VJGH8dAnJLCEK1sLiitJgX8qWc?=
 =?us-ascii?Q?HSjYhbioCR2IYytUoWyqwFW0j6J0MQqyOKqs7jmaIHui2SypHpJO+zOHRYl7?=
 =?us-ascii?Q?E8UbxA7sWXgiYwkjct9Ob4Cq3iduhuUAnEp6BgQntf6I0+hKWE3wG06N3DdY?=
 =?us-ascii?Q?mlIulUA5Z2ff2XUiwBYKSQEgCjSTV2Noy+Ttecojw5Gd76wzIrhxF1tUtr60?=
 =?us-ascii?Q?kvoC+AU665IFk+ElfOu0F6nQ0u2mDsPUwFZjRqrjGaDXANMDH64HaOKtS81U?=
 =?us-ascii?Q?x+GhedqeSfSfslw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f7iTnX6UXXKO0tayX3PBVXrIJGI9i3yHBvQsSsWoe112dCsZyAyoHsKd9EjA?=
 =?us-ascii?Q?3bMfXHTkdmVDU+Z0t1PcL86SR+a2VQwmkhaSxhzOBZEHPY0wJlIcgAXNHz29?=
 =?us-ascii?Q?UpIUXFzFcoCL7rDfK0zGcDLPwr9QDb31P3llpp4yFw3Zg6M9UMqGrB4Ons1O?=
 =?us-ascii?Q?1QHYqxmdvN4vBOVzApEcs436CNRbKNCDanExXfJg2XWeOFiCSRQphTKAi8yR?=
 =?us-ascii?Q?3vXOf7+Z/Po0Dm4BUOhAemtZHRk070Y9iAhcFnzU7rlTEF0vvEnL59S0nhI0?=
 =?us-ascii?Q?4Eh06NQbuDtd8Vuj4nXJBHshjJHY4I54Sl/QRomKKXFl3KGv1NgjmJ3nhqm+?=
 =?us-ascii?Q?x4YY/2eRa0nayGdn6JOTULmtwJ5HdmncaOtHtf5i+1qj4PllUE9F4UGXSeCm?=
 =?us-ascii?Q?AJr8Kc9ksTjv1fjMLXOzPXO0ZbzP6EpCLtUAOydzpZb/IlI16tBAiNliPbeh?=
 =?us-ascii?Q?vR3jEDXNOeuLwvmgOsuOR0BX6iXcY/STaiIa78LNPEGR0AS5HIGs6/k3IuIr?=
 =?us-ascii?Q?COAWYKU3n3eGmRvyvY7rsn4Tuk/i0w2iuF5KkEM6m1T/xs4/vPgosyqZB9wI?=
 =?us-ascii?Q?Pi48uHyYoM+nbSvb/qXG0YxO8Bpwd2CKoHZA0qrCTxIVCCZMaIkgKbwFjsv8?=
 =?us-ascii?Q?LTsUY1knO/6AuxeVo2Xy21lj8/US8EPkq2DG0qvER8uSi7jOZc50kyqQNnwr?=
 =?us-ascii?Q?pbXEXbADRW5Ez/2mDwS8pmhTAf4biuKYsz8nwHsebAy38GPO4rrp7ZmEN9y2?=
 =?us-ascii?Q?q+qYkkr9Sckw4UQUSGYbof5BtRUv1AokIfE+rtZPLqXIrbj3dawfJMs7lLp7?=
 =?us-ascii?Q?Ano080YUIRGh0LfNRa47EqtMH+sAG+tBBEZThhpmmwdvsXKmrm9qn9o6LjPP?=
 =?us-ascii?Q?t4jodfbgWlzDVwD49M8fhwNOgE55kg8pvZIxqnz7SFqSRsr86vTTshzJPZ6p?=
 =?us-ascii?Q?sx7/Ugnz4ulmDMpL9mDGGqWstw4/d2amJ0zvdruQuy3j5+y+LqSwWWdJ96s3?=
 =?us-ascii?Q?15EMSaxPcNRj8l8R6Wdnm1lftNwpI8kAfUqFNuXXQhNcWJTLZ8dR8wMYVorV?=
 =?us-ascii?Q?GKKPCzCSNRuH3NB0WTfA7ZtP9J9HGC41hfMVYLf6xKShOU7f02YcympKXLlo?=
 =?us-ascii?Q?W3U1NtHwt4wmsVCcjRZPLkCcgYOAcrZEW3P8E+YLgnpwyLs8KTFkJe6Bsylc?=
 =?us-ascii?Q?xqLN6jKfZQNYjulCskq78O9hHIOHL1Dj6ij7W2YEkZ0YJX1n3/xneubYvJpu?=
 =?us-ascii?Q?HlnFVnzm4NuEfIxWa8jPle47GevQrfRkZ31LtEhDnr1RCsJ4EtdtkC6hdcuc?=
 =?us-ascii?Q?EMLzVN65Zgl19SkHQQtKiDG3kWECBbY/FukHpOe2YGERjaDjfe+XbDf8Jgd8?=
 =?us-ascii?Q?jHxawrEjhUsC5xRqdx2EBeteBgq/snjSpZc6qMxhcXRDvSEzmRgoa/yBfKS3?=
 =?us-ascii?Q?JpmJS8LfL5nKTdVtklkTe3cZ9r2WQAy86/pLJZNvDZ0r3jZTE1yPwfgO9cYn?=
 =?us-ascii?Q?sL+xzQVHsuyLQfTB5NjBfoIBrF66sssFVwGna6INB4odtgGOhI7lkPpeGU6d?=
 =?us-ascii?Q?lErnCX2t9dduGQzH0HitrdlKD4wzkBAyLk7Zj77o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c8d5c8-5659-4f8d-3f39-08dd7e47ff68
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:45.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u5EILJhuGuyAZv7sbKQPWwc4OZ1kYv0wMa2DqOWGMbwgoBkbrO5DfxcfOMAgeE4j/J9xFR6K7rKl3FaZcpgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

From: Ming Qian <ming.qian@oss.nxp.com>

In order to decode a motion-jpeg bitstream, which doesn't provide a DHT,
the driver will first decode a pattern jpeg and use the DHT found in the
pattern to decode the first actual frame. This mode is called
"repeat-mode" and it utilizes linked descriptors.

The smallest supported resolution of 64x64 was used for that pattern to
not cause unneeded performance delay. This choice, however, can cause a
corrupted decoded picture of the first frame after the pattern, when the
resolution of that frame is larger than the pattern and is not aligned
to 64.

By altering the pattern size to 128x64, this corruption can be avoided.
That size has been confirmed to be safe by the hardware designers.
Additionally, a DMA buffer needs to be allocated to store the decoded
picture of the pattern image.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v3
- improve commit message

 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 12661c177f5a..45705c606769 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
 };
 
 static const unsigned char jpeg_image_red[] = {
-	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
+	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
+	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
 	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
@@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
 	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
-	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
+	0x00, 0x28, 0xA0, 0x0F
 };
 
 static const unsigned char jpeg_eoi[] = {
@@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
+	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
+			  jpeg->slot_data.cfg_dec_vaddr,
+			  jpeg->slot_data.cfg_dec_daddr);
+	jpeg->slot_data.cfg_dec_size = 0;
+	jpeg->slot_data.cfg_dec_vaddr = NULL;
+	jpeg->slot_data.cfg_dec_daddr = 0;
+
 	jpeg->slot_data.used = false;
 }
 
@@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
+	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
+	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
+							   jpeg->slot_data.cfg_dec_size,
+							   &jpeg->slot_data.cfg_dec_daddr,
+							   GFP_ATOMIC);
+	if (!jpeg->slot_data.cfg_dec_vaddr)
+		goto err;
+
 skip_alloc:
 	jpeg->slot_data.used = true;
 
@@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	 */
 	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 					      V4L2_PIX_FMT_YUYV,
-					      MXC_JPEG_MIN_WIDTH,
-					      MXC_JPEG_MIN_HEIGHT);
+					      MXC_JPEG_PATTERN_WIDTH,
+					      MXC_JPEG_PATTERN_HEIGHT);
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
-	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
 	cfg_desc->buf_base1 = 0;
-	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
-	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
-	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
+	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
+	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
+	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	cfg_desc->stm_bufbase = cfg_stream_handle;
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 86e324b21aed..fdde45f7e163 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -28,6 +28,8 @@
 #define MXC_JPEG_W_ALIGN		3
 #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
 #define MXC_JPEG_MAX_PLANES		2
+#define MXC_JPEG_PATTERN_WIDTH		128
+#define MXC_JPEG_PATTERN_HEIGHT		64
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
@@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t desc_handle;
 	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
 	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
+	dma_addr_t cfg_dec_size;
+	void *cfg_dec_vaddr;
+	dma_addr_t cfg_dec_daddr;
 };
 
 struct mxc_jpeg_dev {
-- 
2.43.0-rc1


