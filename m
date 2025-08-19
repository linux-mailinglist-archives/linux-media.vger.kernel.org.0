Return-Path: <linux-media+bounces-40218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2CB2B82E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 06:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98BBA5E6C46
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 03:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CB62FF64A;
	Tue, 19 Aug 2025 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ONaiHZ4U"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9252FE06A;
	Tue, 19 Aug 2025 03:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575960; cv=fail; b=SGstDXQQJhOZGwoZQnJOV4LJlFn9GmZbPBdd82UunytE8q7gWh1Dz1USdIxqL0ojL7cjraxpqBSaPgo6tKMmxo9zTZuo6CxfQXBSnVQnsIXpWgukjIIxSalaDehuw5PriPq+Mts7EZ0/57VrgHzcuWoFz/2nZ10I0fPLlSlDsV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575960; c=relaxed/simple;
	bh=IVTSBNXpFEldLATsC7aFNG92mcl0XdMrqLAgvsSBA9M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RPZiLM6VuxYfTKk7K/ZbmV0LeL3f0X0tPqA/q7oDoPXHMjGiUIYDLC0skF7ijyBttC9azgqnsi2kcSUvK6b5yZpzLDTIqs2ug8rd64VtWrDUb2LUGWNQ0aU3dONaw6VMdHvqHN/aZH2Xy8BMQAaxpboYCA/5WohVXm9ZQUxHLDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ONaiHZ4U; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inrvRJ3dVHmLlmsqRHhwTtQFELJwWkk7zWPY2OKHPLqniTSLWa3mB62Y5ohuuQ5n660EycRbiebWPjyub8JgoP4gtnBfVIf4FPwogHa4Cv6iR7vKcM/GYFCP5V3cdPZc0zC2KqUoVgs30/dG4UNBDlbWGgQjHMNDBVj0QpEVWnsZeK5cC6fG/WL0XpLlGHLCgSXYE+IfmMiOBNjshhrPMsdrzRgR9u568wAimKH+4SfeMVI3JYW6gS53BKGtrMTiB4i0GKHOtvYc7qKsvpZ9AEd/SrOuyy3iJcVtRfAj05Y596QjCRUog45mjdEEtR2dqaw6FTbaZzbSnJJuzI8L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJpcyzQ4BIA6rDmOhZ4ZOwlmuyxpIibpT5qTrS5WABY=;
 b=EG2h3EKM767dX3rVU7CbB/1ztDPtheTLEZ7KJK//XE91JtTL7vmx6qa35s9h2XvYNljt7xjkcOFT60z39E/ltHB3/QkysAkEFJO2liIVRsGSo6wVl4mpTVMH/pOtn6sAFDAjWbdgMpF0bCUnTdm7lVKFcZ9j50NswpprKfljkvfyMQc4iFeM8kmjNyJJq2/k4Idwj01jSnAZ1J6koCu4QIfv4NmD25RPy5SK3twRatoZEd0JdLMfLxV3XlWeCI2nfc62zApDPD2vF2nHC/Bkd/3p0OhVD0xjna+/u3j8tQy4u+sSH9DQ6NhcqLdOEyfsGYoIWpLlpVjFNUySuL91Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJpcyzQ4BIA6rDmOhZ4ZOwlmuyxpIibpT5qTrS5WABY=;
 b=ONaiHZ4UATfwLPo4j+Mpelx4k7Zs4gyz00PA49yptvjxFmSBlsYkjmGTWI2aXVdSJn2BIWsm2J1HpEXc0H+rp0pJXZLZjsglw3FCxLTt/ysGXfmqLUCRL9iBybL6IR12DedxJZE0SWBx1xlXqVDtdH8RSsRZRLM1psk7CH0CjRyFhYk0rOW++FIJdhhXnhW9v3+YCBpKAjcXkQj6fP/Q/X5kKkfve2lViWA5a7uTEURVT1tgxnzAWqXF7nHl28P0POfnFYzPEifepHLywiViBoU7aWI57FnlBXRMOheFWdYUyBB/I50sUbzZ6RUPpyd6K4WIS502DevUJ+PORoDunA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 03:59:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 03:59:12 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 19 Aug 2025 11:58:02 +0800
Subject: [PATCH v4 3/4] media: imx8mq-mipi-csi2: Add RGB format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-csi2_imx8mq-v4-3-c16b1d8f88a9@nxp.com>
References: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
In-Reply-To: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755575933; l=964;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=IVTSBNXpFEldLATsC7aFNG92mcl0XdMrqLAgvsSBA9M=;
 b=V5N91t9Heklk3u+dCt7450dibiVmrMQts82Deex+xqaSwXknWJwXDuD0KIKDPaVnkxXdkoQnC
 IRRAzbZ97CsDMkTU/5JRfkbFYQN70SN+0DIMItc6MFFMiy+MgJwwzWc
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: f7956019-5827-4b12-33e4-08ddded4c20a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?djA4eVVnY1BMajdRRWVPVkUwUkExKzRSOVJ5NmNzbUM4aU8zL2ZwSDV6RFhj?=
 =?utf-8?B?dGU1blZXbmVyaG0xZVFYZWN3OER1b3NkYXl2dGR3YW5DMi9KUWc0VmFCbWkz?=
 =?utf-8?B?c2F5V0pVZ2ZCRi9BQnpCSlQvY2ZqbllaZEc3MHE1a1BsK2Zoa2RadVlrV1Y2?=
 =?utf-8?B?eHpmSG9aU2ZkZG05ZlpHM2FkRkpHS0pMTVdIbTFjOS92MWtyei83VGJLaWUw?=
 =?utf-8?B?SVdVdmV3MzAzZERRTC9HQ2t5VXVRNXErSkczQlg1eTlhMnNKYXJkQ2padU9H?=
 =?utf-8?B?eFljc212d0VlWGxvcDBTbEJEdUVIN3NxbktJNjF4YXFWOWZRbEpXYVcrYkhD?=
 =?utf-8?B?SysxaDNZN0k4YjB5Z3BJVmhQNWxNV3hOc2M2MmxMY0JtLzBnVDd6and1bHRr?=
 =?utf-8?B?R3pxUnMra0Npb2VnN2NlOFVsUllWVWxYVlB3MThjd0tHVVFPVHdBVE14NE41?=
 =?utf-8?B?NUpDNS9qR1NTVnd3WUNxUWFieEVndzB5T2lFS3JDeXFuT0d4eWlacmk4Z045?=
 =?utf-8?B?RURvVzQ2Q3Eybi9wUWp0L0ZsUG9ZbjdiYlJqTjkrMUw5UDZCTi9HekFMdWp2?=
 =?utf-8?B?NFIyQUtiUlV4VEo5K0pXK2dvUURETTY4dWJYM2YzS0pnalhmVnpwTXZqT1Jj?=
 =?utf-8?B?NWlPdGVXc0Q1MlBidkZVNEtFckRBWERTeW9FdVoyUlZzRkU5blMwRThaNmJE?=
 =?utf-8?B?WTk5dTIrelZ0R2FmVW95Uk5XdjFQUnJsYmhRRmk5RXliZjdVYnk1Z1phc3Fa?=
 =?utf-8?B?cEJwczh4aEF6VTA0N0lKdnNmR09UdzZlZUdWT0ZzKzdLQnRvbTVSYnI0QnRv?=
 =?utf-8?B?Vm81ZWpOL0NLdm9CYkd6RjAzWHJXM0VpRjVZSmdjSEVEenhvUzhPS2NZaGRC?=
 =?utf-8?B?MDZxTS83WnNvT2E3TFJaaUhxQ2xmekRrZm9ZOUltTTB1M2JUdHFOTWR4ZjdQ?=
 =?utf-8?B?K1F4a0VoMS8raGxLdWYrQTRLNVlzaWVVK3JkYVNRZHhxYzl5ZVJDcUl3Mkpa?=
 =?utf-8?B?UHIvdkVJdmZtQ2N5Zi83YU11R01sNEt5NVJvbmE1TjN3YnVyazhwTTFZaTFM?=
 =?utf-8?B?UXE5WTVGTjNFOFBjWjdNT0VwcUxlZzg3bmp2RVRid3NaaVlpcUN2V0ZvWjFJ?=
 =?utf-8?B?cGxURzJpY1hNTko1MEtKTGszNzQ3dTMyV1VHQXU2MHBDOFhCTENiK0dnbTNZ?=
 =?utf-8?B?d1pGUTl0TkVZM3R5Q2s4QXRhRTFrVXYxakVyZWR1Tkl6WnRVemk1dUZCOVFx?=
 =?utf-8?B?UEtjTGhua2dIc0VmWFh3NEYraDJhWE5MWHd5dVVLMzA1Mjd5Qzk2SUQ1MURD?=
 =?utf-8?B?NldtWFlyVlZsdjE5TFJEU3o1cFVJaXJwcWd3VFY0dGNPQ3dSWUgxQ28weHov?=
 =?utf-8?B?RkJhUjdRQXY3eXhsRjBSK2lNemFibUhIYjRqVXgzNlFIQ2ZGSVlRd0NMcDY2?=
 =?utf-8?B?NVNhQmZib2xVZVJ0dnhIMENtUzk3VVJjMlp4dytRUXJlQjJDTUdzTmZCNWY4?=
 =?utf-8?B?V1BnbGQ0dzl6cWowYm0yc2tzeEw0MGp0aUt5SDJqYTVRQ3dKYTR1andyRUFr?=
 =?utf-8?B?NDkxdnNXRUx2ZWUyMG5LVXFaUDhHS2NiRDErM0ZoK0lKZlZJbXgrYWtPS2Zy?=
 =?utf-8?B?VnIwZGFBcEs0WEJMclppYklnM3BKTm5pZml3a3c4bWt3WjdwUnpTUFczUDN4?=
 =?utf-8?B?cGhpTXVlU2d4MWFLd2lHYTd0d2F3cWlTZEVRaGgwL0g1QTN6bWpBRjBqSFAy?=
 =?utf-8?B?TFY5eW1UMDFMeXFrcEI1SlFzREJjVDErc1h1OUkxejBHVXAzbU5sOUJmS0ZC?=
 =?utf-8?B?NjRTeE9qcDdwbEFXUGlVRk8ydEdja000OVdtMGthZEFXb0Y0Mms5VDNtQTVE?=
 =?utf-8?B?VzREbFdyOUorVXNRQVJJMVh0Y1Y1Mi85bEFneE9NaFdjOTdNbGZWUkhNeFJr?=
 =?utf-8?B?VC81WS9UOUgzZ2xvWjBLNkxnQlhOTzVHa0RkRWEzUXQwdjBma3IxQzd5Z2Ir?=
 =?utf-8?B?QzNmbjRmMk5nPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UzFucldsL1c2ZUFSZjFQL2dNK1cyU1A2VGlLOE9tUHZwVGl0NTR3dVhjamhK?=
 =?utf-8?B?cEEreDF4YlFFNURnc2hkNjBqWEpSdWYydzlpYW9RazFLS2dnd044ZmhCY1Q5?=
 =?utf-8?B?QndnWXlFc292TEhqemU3blFkWkJzWDg1KzZWbmk0VTd0eGxIMnd4MjRxek90?=
 =?utf-8?B?YVJyY1J3MDJsNGZ1MVhJOEVQMFo1Y29FVVQ0NjdVY3R0Vmh3S1dYSTYvNEdI?=
 =?utf-8?B?Y2hlcmJvZUhsaFZaTDVSUldpdElEMkNSSHV5UmI1andRdEhjRjdrc2tEbmVq?=
 =?utf-8?B?Wng5dU5DaWtLVkpyeDBQT2EwaXgrb0djL1BhTW5LUi9COEhzbmhuYVJIb0U4?=
 =?utf-8?B?UGFsS0JrS0lxTWVUK1NmMmxrV2xkTlJvY2t3YWpLV2QrdE5WV1Iyc2dKZmU5?=
 =?utf-8?B?TVo0akZvMjhndzhMeitGa1ZYVzJFL0xXekgyRlpqNGdKZEN1Tmt2M3VlN1Fk?=
 =?utf-8?B?Qkk3YTEreHNXOUZQRHFVVmVLeHlTeDE2ZXgzei9mSGxqVUo5bjJKeVJKZlpB?=
 =?utf-8?B?K2FvVkdRZEt2QmpJSkpVVmUxRlhGNks3WXFNU3ZrOEpRcGJmMEJqOEc1K0Zs?=
 =?utf-8?B?aUF4enVRV3dZNzY2UGlHbDhSZUdlYUI3Nk12UFZiN3Ixd050MzNYdVBjYkdY?=
 =?utf-8?B?VXBRRGd3eHB4RlhGSVNiV25TRkRyaDZ5Y3JqaW9aWS9ya1pGZWtSeUtJZVVL?=
 =?utf-8?B?dEgrL2x3UkFQbEV2R2VjQktlL1A2UnN0VG9lVkJ6Qnc2NXNvWllUeEhoUTZO?=
 =?utf-8?B?WWdqWTBMUlR4VDVWNkxsU2JNUzZOcjRjUUdPMUwxanczdEN6aWxvSkI2czl6?=
 =?utf-8?B?Ui9aS3RpeFowTFk1K21iMjQxWkNWNGxDeWNUSEt3Y2NvUTgrbGhtdjJ4bjVY?=
 =?utf-8?B?ZThuT2owVmg2U2wybHJ6SUVCRXo4eHZ1V2p6RFZnNnpWb3BpakVvYzZtTGM3?=
 =?utf-8?B?a3NOM2hublBBZTRRUmtEVkxRQkF5S2dqd1p3NWZ4Z00rV2hvTUpRS05kK3Ex?=
 =?utf-8?B?bUU5VUQrSTJJVUJrYVBrMTJlT3R0K0t3OTh5bndaLzhiTzhDN0dEMTFvMDRk?=
 =?utf-8?B?UEd1Rk01K2p5UmZ2dXVIV24zQkVaRko3T2pwMUJIa2UzdDVQVUxUVVI3TkVF?=
 =?utf-8?B?dWlVNjBuTnlyRStmTStQMmNrcFlZTnJJdW5ScXZhZE4wbVN2VExlZFlrb2s3?=
 =?utf-8?B?alRFeEVtMFV5R0lYR2NBN01zOUE4VHMrcUV5T1ViVVNXcjJNcGJrbWJmZDBD?=
 =?utf-8?B?WEQ3WVhwUEZMK21OVUxKVmttT1kyWUk4cmhESmRBM0FtdGRJZW0zQ01EVUs2?=
 =?utf-8?B?bmJrS3NObVg3VG9pOXRFVDJQVDFMOUl5bVhDWXBsTTlZa0hjcFlEN3BCb1hw?=
 =?utf-8?B?UC9hV2pzS3EyTkIxQUlmTXc4RDFtQkU5UkQrU1o1U2RwUjhqajJUU1ZoaGFi?=
 =?utf-8?B?VklNN1FWUmdYTjRzRm5CK1pLem02MENaOWd6TWZkKzBUeFFxY0Q0bXlJQzgy?=
 =?utf-8?B?Q3FLbk14bGJPQTZhSHIxbXFNZlBTUHBXSDFjck50L0F0NU95Rkoya0dTSmZM?=
 =?utf-8?B?SnBaclVOd0dIMGRnYUFnYmNVUHBpMDlhWlFhTkJvU1QxQW5VL01YNFhvbkpU?=
 =?utf-8?B?ZVJZZjVtMktMcnpaa2EyTlFiUTlOOFZYaG5iUVp1cE5PWjM0Vi96MWR6Q0Zn?=
 =?utf-8?B?Y2xzSURSNEJIM0lET2VLeVIwVVkrUkluWUVseFNJWVdlQVlyZElQcmhzamlI?=
 =?utf-8?B?T0JCODVUT3UzbGZ5a2VuVGQxcUQ3Z3RmVW1BS1QwUDRrbDE1NzNJU21Dbzky?=
 =?utf-8?B?VytEUCt5Z2pPL09hSjF6KzZOOXJmVHBZdzR6SnRuSlNteDRHa0FBd0pacW51?=
 =?utf-8?B?bVMrMGVBOWYwZUZWVWlrYzRjRzlFZzBWKzZYSDdqOU9NM3VIWjJyUkFOd2Qw?=
 =?utf-8?B?aS9NUHVZczJYRXc5MzQ0bWw5K2pZNm1ZTGNraysrMURXOENrRWFabXo2b2w4?=
 =?utf-8?B?azhWaERhaHBTbVNYcnRpRHY0QzBiUTByNCtZVXhqamhWR09DdHFmTWJiNWNh?=
 =?utf-8?B?RXB1eW1aYlZBNHh1S3FobFJsTUl0RldoVnBaWDFvOUljYnc4UjNEKzZQZHEv?=
 =?utf-8?Q?wsz1kSr7fffarVaIEaUhUf2ow?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7956019-5827-4b12-33e4-08ddded4c20a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:59:12.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cyvdN0dHU5CW1FITl458r7KEGEjopYS5Db8ViXzLRIQM9s8Yee2RTBu72XzcGw1Jut/21E3NaNTF9xxgTB1ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

Add format RGB565 and RGB24 support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 43d766b95eb42b21be893ddfda44119101c9afe3..79c8b56c051eb96cf45bff8803041b294b8c4f89 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -327,6 +327,14 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.output = MEDIA_BUS_FMT_UYVY8_1X16,
 	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.output = MEDIA_BUS_FMT_RGB565_1X16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
+	},
 };
 
 static const struct csi2_pix_format *find_csi2_format(u32 code)

-- 
2.34.1


