Return-Path: <linux-media+bounces-40677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C75EBB305F2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3887E6221D5
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2362D362999;
	Thu, 21 Aug 2025 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xm21HXkA"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972633680A4;
	Thu, 21 Aug 2025 20:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807498; cv=fail; b=Fhnac8gfF0MDyGTvlXcStCkOHpET4Eoveq9vSCXK84/jgopbxTuxmBoaIT8KGDuq+dtsKIx1FLxeYrRx+CBC22PwdKf4hMthYkszW94yzFw67Uyd8dsm1UdBQG/QNJl8AOxcUZ47/42gQtHRFwCTXhrNeLpCZHcCQleJYGswAYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807498; c=relaxed/simple;
	bh=ruG2lhUDHzbRrGvdPAhuLRac1hQVOVwE3mtNG5WGA0g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=P4c2oko4Br7CxqRlYgc/p5geYkDC7gSo0kjbVNdjf2PiSAgiJNuGqYuf5VOOdyniZikq4S8jEtgbOlTBGIvMESwF4wkdCCo5ih/RFE5JTxq5vGxI8kC3xFaUSKfggZDQk8zIggc+l08bQueR2g5vT6fOKBELmqH9ou+KY1GVX6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xm21HXkA; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnZQukLfL5K1WgJ6Fu3Ee4M8vjJg2k58Q4VbFYTnr1J8l9XAN1ZUMO7pre63lSbCenfyKmTbtI1yzRvTDiSLcwLDq8Mn9WGE1r2Qq+OjIwfI7rQfi55mvpkkXg0F7385lHReurpk/dU7A4IXk9wLqDbiaS5hKue1sf/FGMHsT9IrcuIifefVSWI44sy2wVpvF7RJcvDFmeXyr/R04iGVFQ3y/dO6dGZZNp7++RWYeXe0Gb3ZJBHBDa0VdR7IFK0aWd3TlgsxTwIKmz6++d1PjSv5qS5vaXBvVjB2Fr1XSnOlh9arNmTkGmocE5dPmatCp0C/Cekf7IhJ1Leb1hfpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Psb3D+gt3jkvMGppWY0gPihInyK2SN3GQVGYGAOi9tc=;
 b=YqIpqB7gYFM069bSL7r96wUKt+2V97ljEHzI5Abpz0YqoGL5fhpEbvn1l3wcu4GVEi5UMoU1epAwauZrQMHH+38uDdQ5u2ltSSDmwIHngXKDbvHjb3jvDa+ueitmbXBL+eonuh6zWH297CGASNOwwTEBM945xj1zmNlu3orarYSSK89DJNR2TJtyvInu9rEms+IyPHbBNA3SsZffBLfTgz3DrwgoQM39ilQqAIde6bWej/BvVZll19+4vg+x5rTJdHJg0sbIFGPbY8jryDOvbilYiyEpPuV4woFvnpnnREYnAyRSNB3zJari3ZNFV1InHS7uTtp6Tx787jf7YEpm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Psb3D+gt3jkvMGppWY0gPihInyK2SN3GQVGYGAOi9tc=;
 b=Xm21HXkAn0YXdcnsLrDcgAGoDvzUNkD31CRnq+Uq6uzX+w05IKVAuXJyjLLZqhqZyly4sPVOpjG+TkEK6x4w0WuRB2Q29VwD9Gnmlz7Azb6h0MwAO1BRXa8tbNeMO6Hp0QI/0Nxg7s5ndl996v0ujxOfVGJI8ncECPJYP5zcW7nHfXOy1bO79LLHdQzC4Db4dd4H1Z42n6xE5VoQjAqYcY7LFWZcaadnM5725BJuHOb2LVOc41gSa78DBNqN3vD8tqU3jLwhHAcsiptX/SoiAfjBPhXQM59d8wrm7JQ4nhqm0fnIte2jw+eoiYUZKfHeJrVpSH3csU4f+gXQ4eHkug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:14 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:55 -0400
Subject: [PATCH v3 20/31] media: synopsys: csi2: Add basic v150* version
 register
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-20-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=2430;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ruG2lhUDHzbRrGvdPAhuLRac1hQVOVwE3mtNG5WGA0g=;
 b=2skz0IbXFPpdGvkyPOioQ+DXRfBTaVCxwVTswwuWSHCglsWSe2/GhwupIGQRYhNmdir2XVcCZ
 7d5wVIbc335DSHR1nMepW+4l12bN7HWewGdRVyzucudddGfna8djO1U
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd9c6e9-78fb-49bc-1d2a-08dde0efdb80
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VEFDWjBkQUF1YUxLWnJrVlhjSG13M2pLejFmQlcwbUk5aE0rSXRVOXNHb3ZS?=
 =?utf-8?B?bzdtZm95QWM2V0lIeENRU0xiOFdJR0xrT3BsZjRMZzU0V2ZnaDdXR0N1L2FK?=
 =?utf-8?B?RGxvN056bVZtSXptTC9nbzY3bWR5RXNoMlUxdXVIOUJhWmZTaEwxM1pCMWdt?=
 =?utf-8?B?T3Jzbmx6SEYwSjJWcyttaUdhVDlzeUpZSm5CUThlMG10MEx5d29kbys5VGJH?=
 =?utf-8?B?WWtKRVlJOFcxdGR3Tnc2SHVLYUhZeTIwb0Y5ZitGaE1rZEZJWWw1aDkrWnhD?=
 =?utf-8?B?RHZQdCsrRnhWSGNnTUxVNmJJaCswc28zVUJVeWdyN2RqUVJPalZxeXo1N3RO?=
 =?utf-8?B?OStsQXFUbGJDdUtCanQ4V21PSTA0STdnUWp6TmFuNXBSS1g4YmxiZFFWU04v?=
 =?utf-8?B?MEpiVUFiVGFoSkVrTm00aUIyNVZwWkxwMW8wWmRSQVBKVktVeE5iT3lpUW1D?=
 =?utf-8?B?azV6SldSOWhPYzUxb2Q1MTh1VzM4dXBVeG1nVUZNR3hOUTlTMkdFMWQvQXIv?=
 =?utf-8?B?M3NiVmlmSWZ5dHhiM3oxRmd3N040SVYybEhnQ3k0WHZXYUxHZXhjMlZ5UGpj?=
 =?utf-8?B?ekdUWHZXSGhMdDdYMVlpV3ZWVXdQTVdiVDVBWG5jOHM0SU41ZjIvZzR3cU0z?=
 =?utf-8?B?eklaYUI2RzB0bnJmbTZ3ZVVrbnJ6V1d3SWFIR0hmS1FUNXpMY0dENEdwSnBk?=
 =?utf-8?B?RWNEYjUvckpwK05OczBwT1BzRVozbG1xYVJKS0czZ1Q5eUxxQWo0MzJwT2Iz?=
 =?utf-8?B?Zm1lYjlzRjF6a3ZUQVdyenRSNTlwa2taWC9YNk5IdHVqTDRhU0dVNFFhODRo?=
 =?utf-8?B?Tm0vd2pCbHNpZXhmN0V6OFhzZlhrVFpzbnpmWWR4ckVobWVhZ1R3MjA1VGpZ?=
 =?utf-8?B?R2tsYXdDZXprOC9rWG10dHkxUkRiaHB5ZW1RQUZPWWp3RmFkRWdJa3pZYnpq?=
 =?utf-8?B?NlcwZ2ZCWi8zTWYzaEluWWREVkZ6Z0VGZ2c3RkVvL0ZXeW55TndKY1VxUzk5?=
 =?utf-8?B?WUt1MFYzTVFjT01wODZjZVBYd1RWbEszc1l4RlVEZGJndVhDV1VRbFRyVFk2?=
 =?utf-8?B?b0grU2pwTnMxZ2pmY0VGK0ZJUng5WlFQaHgwM2VtTjBxcnVzeWE4TVV6NFIz?=
 =?utf-8?B?dkduVG13cGlLaEtMRVlyODN2QnRnZjJKc1BpZm83YnpQdnFQMFk1KytYVk5H?=
 =?utf-8?B?VXFkbHhEWEhxeS9RQU91V1I1bXlwWXMzT1hRa0RYZXk3L1ZwclN5c0VTQ3Q1?=
 =?utf-8?B?RktkSUZnbnNKZ2d5cEFxVXpFWGNaTnl0SFlsNE1aQUIvRTB1SXdmcVFXdTlF?=
 =?utf-8?B?YlZYYW1Sc3RBcnl0MFA1ZU5jdkF3a3pjTGtnMFp1Y1Q4NE5PSkFTdnJSRHVU?=
 =?utf-8?B?UzdRVmxEVWl1OHlOMXg2UmlobWtDbm8xMHk0cUJIZnJ5RzkzMXhWN1VhL0FN?=
 =?utf-8?B?SUwvUCtQQ3cydXB2WXlLOVltTDFSUlhSNC9KRjVwcW9XZHQ1K0tMQWV3Ymc1?=
 =?utf-8?B?Z3FUd1duN0t6L01VYWdhNnFFZG9XQkt1cklGOU4wQzZOVVYwRmttNnBYYjA3?=
 =?utf-8?B?amI0M0lBQjAxVWJXWjUwTkFyWXhtQ3h5ZTFGaGFpMU5QaG9EcnhNVWkyRVBv?=
 =?utf-8?B?MXBBZVBKRFpCVngxVjBTSUZKK3RTV3RyQ2NYbHlpYVlvWEI2bGVHdHVGWEFK?=
 =?utf-8?B?RVZ4QjZ0bDlHSGZFQUxDVnRqQ212U3JPSXQvYmcvajhVYlVYcmtNVkp6K1RG?=
 =?utf-8?B?Z1VYSjROOXE3TzM5NXRoUUZoeXJBbE1rQS9UOEwvYnk2OExoZlgvSEJCWkh6?=
 =?utf-8?B?anRXRGJpL3VzLzV4MzcwbGhGUlVoOUxVZnY0VC9XMUNHWWRIWUt4cWg1VGl0?=
 =?utf-8?B?K1hvT3JreWdETjZYTVRnbjlFZVlOeXBRZ215bVRmb2VnZTE1aXBUTjliNDBF?=
 =?utf-8?B?ZjdWY0NEckQ5ckVQR3hJR21CcmwzRlBtY0Z4ZVorVGUzSFN4bkN2anZlb2VW?=
 =?utf-8?Q?BTdXmCF8J50y9fslOoXNv1eMdtVROg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SFFYZytLNWRpTi9mYzRseWkxSU9VOTYzdVZTcUVyVW4rN2I2dlA5cWhsRDEx?=
 =?utf-8?B?bHljaDM4TENWeUNJL1NsM3JVMGQyMUFjV1NnR0txaGpRSnZYMHM0UUpsbGpJ?=
 =?utf-8?B?c2trYWlGTXd5R0sydE1yNXlZekZaTExKMVN0cWd6QlYxSmlsZXlrWTZqbDQ2?=
 =?utf-8?B?R0Y0aC9HbkN0RHFBNDU5VGpIVVVJMWF4MmdiOEw0MlcxcXFta1F5bVQwMzNn?=
 =?utf-8?B?blM3UG45RU9JZmlIZjFZcC9NM3oraW5qSks4bUpvMWxnYys4U3IvSFhHSnNJ?=
 =?utf-8?B?cEJyQlovSml4MXJ5RUp4S0hlamZ3ZkxKY1RQOWJUSlBvRjJJeG5BNmlCVnpo?=
 =?utf-8?B?dkFjK01TVjJ4eXpOcHg1WG16SHRwSUJyTjcrcFhFUVlhVlBkYUpPRHpvSzZF?=
 =?utf-8?B?R2hRR29rM2F1MytVOTRnQ2VvdFlEYVdHMVhpZFM1a2JzY01WWEU2MFcreDA3?=
 =?utf-8?B?K3plM25heVhXK2NMOVVxYXZTQWZxZEdQcXZhc0JDNVVZMWppV1Q3SUVkRzBx?=
 =?utf-8?B?ZnZYK2hwZ1NqQVBPdVdpTEpXZ1p6bVdaLzZOTFFuektMcWpFWUxHUEllMHdm?=
 =?utf-8?B?a3RsbkFXbjZpOWRVZlMzbEFIVTlqOHpSM3JyU0R6dXhVK3ZvYTFBeE9DWmUw?=
 =?utf-8?B?WW00d0JtdXh4cUxWaVFOcDQzOGFrVkZERTA2RlU5YUtFbmxmcnlhODZrYWVX?=
 =?utf-8?B?ZFhNb3d5WjZLS2RvdDZtMFZzc0FHVGdiVGNBSG9JdzIwUHN5ZS9rUk5JZzQ2?=
 =?utf-8?B?K0JzS3hWUGI2WHEzd1hHTHdsOWV0RmFmS3Z6ZFFma3BzQk5zeEVCVmoyVXI4?=
 =?utf-8?B?ZlNwVnB1ZEd4MGQrWDNod0FTa0JmVUlxVzJWd1htelBVS0drSDNpQlMvUzd2?=
 =?utf-8?B?aEdoR25oaHZ5eXhMaml3K1g5UVNoWnBIT0c4Z0tmczFPckZrRWhpMWNIS0Nt?=
 =?utf-8?B?akdnTm9BVHloUjFpQ3hFTnQ1aTIrd1JGV0VqUzRZWFlzTk80Qy9vQ21BTGZr?=
 =?utf-8?B?eG5PNWVUMHlydlpPZkpKM0x6TDBFVzY2R0kvQVBVakptWGR2ZVA2SVpiZkRN?=
 =?utf-8?B?d0dQQ29TZjZTSUJGVGpQVkhBTDREQ25ZallZTUE2ZHNpc1BIZlg1TnJ4MEhz?=
 =?utf-8?B?V3RQYWNBdDJiUE9zSC9EQ2pUazZGS3FzVHNibUxOSVUzTHhXQXUwRGJxcTlJ?=
 =?utf-8?B?a1IxajFnTFhxNzZVdFYrcHlQUWZ0dmh6QjhTQmwrQTV6dWhsWFpCVEw1dS9k?=
 =?utf-8?B?SHEvOUtQMlpkVjJUcTR6REdqeUs1QUsvaGhlSmFKT25CUld2TjVTTmFkN09i?=
 =?utf-8?B?a3JGTEhocUVwZTdCc212UmErcldDY2MwS3VUWGUrT1FOcnJUUFNLb0NZT25U?=
 =?utf-8?B?OWN1c0pYNTFtRWNVS3dLeTdjUFRXSHp3OTBwSXcraTY2eEpBOE9oblYvODVX?=
 =?utf-8?B?cjI2ZGIycm13Yml2T1h5OG9iNFBVQzR5VDRPQk5QdWNGR29Cc3lxUUlCdXNy?=
 =?utf-8?B?V1h4K2llTFFpRFNDS013ZjNWT045dzcyZ0t5ekk0eU44UTNBSC92ODRWZUxG?=
 =?utf-8?B?ZVkzcFQzSnR3LzdMaFBWbjBpWVVnMDRPNHFCYmVNMFJiU01KWHBPeXhudVNa?=
 =?utf-8?B?M0lpbUxRdnd6c1E5NzZManF6TzBQTkVaVlNCWkZHd3N4Y2gvM2hWbTR4MjFD?=
 =?utf-8?B?T1BncWZ1ZU1oTjVYbzdoNitSREUxYmNUU3B5a1lKc2YxTFFZa3VYYzh4Y1Nt?=
 =?utf-8?B?SVNFKzV2N2RuMFViM1FMT1o2RW9BekxwWHE0NEZFaGt1czBPdFZFQ3ZUVXFy?=
 =?utf-8?B?NkZSeSttNkJwV0xlZG1nRHFWWU1wT0pMM2k3cUhvemR4Sk9hVVZ2NC9oMlVo?=
 =?utf-8?B?NzBMcGxwOTV0QkdYYUMvTG1QTnlXbGQvMnBDUmVFS3ZaU2ZTNXA0UXMzeHJn?=
 =?utf-8?B?eFV3SjVDWjdObExSL1BrbHlMcnZnMXM3SGE5Y1ltdU9zbVoyK1FYcTRTbXNv?=
 =?utf-8?B?dVZ3azVLeFFmUEduaHI5SmU2ZTY3Z3N3azdodWxWVWF3VDQ1dW5uQTBadllC?=
 =?utf-8?B?TCswSVpCRytvSmhLbHFtL1ovYjRJVzlOeEVua1NvcDFZNWpkd1F5RkUrL2or?=
 =?utf-8?Q?KSuY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd9c6e9-78fb-49bc-1d2a-08dde0efdb80
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:14.2393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHpO4/H+WT369p7qJWQHjhG6LPONqrYpTDikuxZ4thy1WIEw6ratrksMVkskVKbni5n5bH/0TAsqhcyS96U9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add basic v150* version register and auto detect IP version by read version
register, which located position 0 for both version.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 37 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 27d802b3c3937473c8e08defa661b55b0655f758..4d67ab978db56d8075824ba515876193499c0c97 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -61,6 +61,19 @@ static const struct dw_csi2_regs dw_csi2_v0 = {
 	.phy_tst_ctrl1 = DW_REG(0x34),
 };
 
+static const struct dw_csi2_regs dw_csi2_v150 = {
+	.version = DW_REG(0x0),
+	.n_lanes = DW_REG(0x4),
+	.resetn = DW_REG(0x8),
+	.data_ids_1 = DW_REG(0x10),
+	.data_ids_2 = DW_REG(0x14),
+	.phy_shutdownz = DW_REG(0x40),
+	.dphy_rstz = DW_REG(0x44),
+	.phy_state = DW_REG(0x48),
+	.phy_tst_ctrl0 = DW_REG(0x50),
+	.phy_tst_ctrl1 = DW_REG(0x54),
+};
+
 static int dw_csi2_reg_err(struct dw_mipi_csi2_dev *csi2, const char *name)
 {
 	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
@@ -697,13 +710,31 @@ static void csi2_nf_cleanup(void *data)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
+static int dw_detect_version(struct dw_mipi_csi2_dev *csi2)
+{
+	int ret;
+	int ver;
+
+	ret = pm_runtime_resume_and_get(csi2->dev);
+	if (ret)
+		return ret;
+
+	/* version is first register for known chips */
+	ver = readl(csi2->base);
+	if (ver >= 0x3135302a) /* ASCII "150*" */
+		csi2->regs = &dw_csi2_v150;
+	else
+		csi2->regs = &dw_csi2_v0;
+
+	return 0;
+}
+
 int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi2,
 		      const struct dw_mipi_csi2_config *config)
 {
 	int i, ret;
 
 	csi2->dev = &pdev->dev;
-	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
 	v4l2_set_subdevdata(&csi2->sd, &pdev->dev);
 	csi2->sd.entity.ops = &csi2_entity_ops;
@@ -765,6 +796,10 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 
 	devm_pm_runtime_enable(&pdev->dev);
 
+	ret = dw_detect_version(csi2);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to detect IP version");
+
 	return csi2_async_register(csi2);
 
 }

-- 
2.34.1


