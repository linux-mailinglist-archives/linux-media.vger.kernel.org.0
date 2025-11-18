Return-Path: <linux-media+bounces-47312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC1C6B021
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1F4D82A8A1
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 17:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6442034D906;
	Tue, 18 Nov 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OscFgN6k"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4B36C0C6
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487610; cv=fail; b=fJu7BJELnrtKEMsbDNQs5PfTUYd0VSPLOeQA2MFUY5VCha4pznHliYb91kKfnkDFyLbQeciaFuTJIVtPX8gwSlIHwTPAVnWzAkXAUD5ebewza7ODBeAJM5FLioDoKL4zMG9jwmwC3G2W0DscOOI2r3HIjz6QfBb7H6iB+Iqx29E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487610; c=relaxed/simple;
	bh=H523SbInR/0f1exQrhQnSkjXLIZtEM1dm08EhZLXQ3Q=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=Mhclicf90T4rCFvSjfgfBrOdZ76f1/S65dBuw0MQ3d77BxztHJ+cr7AJ3Ah61NS+aoJlk+Z5NrBkGn4ENARF4GGJH4YyoBNcZqlB3hd6awtRsSQPNRXvNl30hAZDnLRy78SFOnT65r4fCMXMMY/IVKLQOmEKWQXqxPFXFspkV7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OscFgN6k; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAXpV+fyZlaN1j64KZ21kwdBDdkTAwB4/Bv/2A57MfYfqoK0PYo0lPitLlwXuk/zD46T0U1RHDNeeeJJyQKPXMUSLme6j6CiHFcvuGpQSIU3aYcbM/2nR7rDj1AJPWWqlXIv8MxYxRTUNyqpN12QAyPxvPDy71KP35wGEYDJTGFxZt6Z6GK9dvzBaojWw6lZ6vP2P85lCcq+nFhWLyBjJtzqbIwB5KLMy74wxKG0/TlzKRpzyN6MNUVXopdw3MWO/EZT9AgiBdYoRaw9F9823FkP7HEnN1iiRGAiZ1+GuhNp6HmOgs0Auf08uhZvP22gpiIgkiftL1n+BuUYEd7BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN1W21voqr/JhF5omch/pN5HKAeXWiITGvikyh7t4WQ=;
 b=kQPM39KLZA2VUnItmbEl46oKc9ZYP0zw6lEIAtPV+p28bgWmB0RpwnIdou4a+rpCfr5XtGVBIosOOumVWsZs+dgrrl5lkmfeZ8jsu0aXd5ri4j/0brISBLWaiDrS8MjLvdiQ7Xc00mhNyzcr+xcnyG6vzr11o0Tms8aRN4uS7C4M0vdY9iQypS7GT+rj4sJIlhmymNUuyuBsEMHoXQKL1PQqcmNB1h9iWzWixuK3LWdEGDutFPWCBRTKQe59IT/Gou7WkT04ldSMQYtm6iwJI9fVcMgHQ1Dx9ixhxoJjvv1B92Ddcbg1yvuYX2pif08yBkTn1L8009h0xCIlFsbGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN1W21voqr/JhF5omch/pN5HKAeXWiITGvikyh7t4WQ=;
 b=OscFgN6kRzloMOMxpU/DiG8bgPOOvfqa3q5a3Lq3sCE8Z2e6TJFPhMTQUDgU2T5otIxcwXv7YVJubOvU9hDQF3fAMFxCQmYH7C4jL1lLPGDKhUtqHzUs1xIoDjBcN/SZ+1TtFFRH48E7zRwToBlm3LsCIoeYmwi16e4+J8+gHXEb/KQ0rPCmgzjcvhv7XeAfCJqUr5qiyIoJJSJyRfxKy1Th5vF8dauxaY03GNaDt+xocqDDMEzc3MNZ5UIL4CfeoZbQo7CAr8b09Fnb/yt8DLINKSLdQq5H9vvb3poUadIxgw6sX0QITFR1ptzG054oNymJRaThf8AuH2VwIyuSiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB10612.eurprd04.prod.outlook.com (2603:10a6:150:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:39:59 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:39:59 +0000
Date: Tue, 18 Nov 2025 12:39:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: rmfrfs@gmail.com, imx@lists.linux.de, linux-media@vger.kernel.org,
	sakari.ailus@iki.fi,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: DWC CSI2 drivers
Message-ID: <aRyvaE8q4Hrg0DY5@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: db7c3250-906d-412b-9956-08de26c97f01
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?I7+covSQkoMF+vbWmiEzilKklMaZYDIJ9YZWSkkfHJQ5aK1XjFjZTQh2n437?=
 =?us-ascii?Q?SaE3fYNfLZ798TVPEgW8QC2wLavOkdgDbD+yHCgRcqeR2dXA4SfMU8HFmC7K?=
 =?us-ascii?Q?u6cQLYcz9yZa9qogR4lepyBHOUPb9DBLw0elj++P37yjZ2HIMIvOro7p42yv?=
 =?us-ascii?Q?fsJxju0EErYL3wvNX9FGz4szaRfhQx0Kb9mRGLZwOOr7P7mcRr8pVtVU3TN4?=
 =?us-ascii?Q?7fjel6IIF98sDBrtz62uZP0Ww94kNZnnHo9BM0ENtiRfRMGDmtVuZrZ1vloI?=
 =?us-ascii?Q?LMKtgDc4Z9q5REd6FXH71Xv/86ohDv8+WXlBQGweW5mZkTwn/DhQTSas0fc4?=
 =?us-ascii?Q?IPTP3Vhz5Kyw9NeaxdmYOg4lGe26iKVV8W0SyEmfMZUDWlDIezbDp9t+iCOs?=
 =?us-ascii?Q?Cmzo9C7e0KHVwdcKqGmkii5grUsFiJtzGMUIhH+MQzKTqe3TN+gK55CXlTpb?=
 =?us-ascii?Q?pmduqdAauKbzeNH4/9XuunVSSTAeKTsKuVvPaH5fqxbZSsZ/97K0/PjIAdn6?=
 =?us-ascii?Q?0qiBhjN6wBgcHV2/T515XDYkekr6mWkECKhZ/kW9w7uW6SGnO6nQ7zLcn/uW?=
 =?us-ascii?Q?HI2Vw4wmectWiVOdXswqoKO94KZ0LjErw1YG8vJKeFrnvP6aR9vEeK6VfzCx?=
 =?us-ascii?Q?dKwbJyiU/Z+t93RlG/CghXN32ina/wUXdp20vn/CThcYo4ygOeLks+YpWQJ2?=
 =?us-ascii?Q?I07jTb+Y0vZxs+P+d7j69e+jzTrakh1Yuv4XpmA3GOE26kxZ9IIpIh6yVynh?=
 =?us-ascii?Q?6R66CcNKOVlBFdbEgqYkIvgXbA0YXN8V2A4B6n9W1grd+35++NZFZyQ75dQR?=
 =?us-ascii?Q?mO84Y2zgZpCimdfFNsMVXlhuM/k2kxsMb7IZel0IWTUPHnKrwEDyPkuR0yJV?=
 =?us-ascii?Q?gHMAXrLAXnq5Qj6qWx1g14zA9b53/SG1cumC8V9H0p7CiupqlA4/JJnCnqSZ?=
 =?us-ascii?Q?U3YIDTLUaF6W/YVEyD8wgiyZKQpYLbVCAaOGvgs5pvqwTy7f5fPNPoEnG6ha?=
 =?us-ascii?Q?lko3UGppH0u5wwJDbuv4HZ8XpkTB6+zS1eWQUNybHajp2aVSiryy/Ge8keMk?=
 =?us-ascii?Q?PpqnD60/EwuXJQbeYht4lgP6eh7cA22MVc2wkC1QHbBdADNirjvq94IlO434?=
 =?us-ascii?Q?3sxDnqNZDOL1pY+4P3aaFtBt8uT11qYbO0+/m7n/6qWQT7eQjUHd6cnsUK3g?=
 =?us-ascii?Q?fERo0ePSqC3PQVbSMvlf4lTEVNT7q0Fw0bE6vaIQ2Ijdk11xIH+Dvexr3vRb?=
 =?us-ascii?Q?uY8jseg9DXiM/0PhjUSFKO2lcvw0jBhU2rSdMeSVAX9nEYcA52eHQJRunhBg?=
 =?us-ascii?Q?raSowp+Am3m/SKLpjQf3xsFZclVFQLGyZJGsJXJNrbxB4aKspIFUeCgvrUvN?=
 =?us-ascii?Q?auPVD/IZx6K3aXyubRnga34ph8M5j/gYjkQBIBBojro3QSFuxzArah9AjJHN?=
 =?us-ascii?Q?8rkumO9z1cJEYVKJzQUG9nkbNSklI8lqldMBhHAg0gIYtbdsjwqdd/GPaUqE?=
 =?us-ascii?Q?SAf/Og4DZ1zHg6Z1dPhV7IdZACNist8jgLwi1PxozD3gON+J/V7qxGtjYg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fYCpDZdLo7ghza8OYT0LK8csuE/bm6sM0RiUjDigUYAnv/8e2gNGweM0DeDZ?=
 =?us-ascii?Q?7JZ3faiOgwkZO+tQUlQ83Wxz3s1QgiPWPF8XzI4zsCgP397ApkA3Ht6v8IIa?=
 =?us-ascii?Q?sdG7pzHQsSnG3YwIv3YAp5yRn74kMMC8ghuwFrROwjODdxozGPICa4ipySdR?=
 =?us-ascii?Q?1f6n0FldX357HLJ5SQObd+WCInkSQfbPPf0RVuZEsTlo/UieutTmmLhFTZHa?=
 =?us-ascii?Q?MnVyhLkvChZf3bVlJC9R/9e9HqdqLwaH9jVlizMhJKJS5Nm7FkU/zBlL5fmL?=
 =?us-ascii?Q?jZEHET9v/A/icGhLjIGttfw/iNiT6xSElT9I+18GUvF/f75WHhmOQ8T8T9mq?=
 =?us-ascii?Q?rdcx+70jSIO21EdmKFkEREXXbWqBRuCM21riSj3qA/r1gD4N5GwBuDlYAdcS?=
 =?us-ascii?Q?R3LofC9+dKG+EaXXJ5HaI9DljBq23Tvh0dXnA0FQEaD7P7wkA3XgZGr8NHuG?=
 =?us-ascii?Q?y5HOwngE9wrkMWBh5aJFTAIXG0MuFWqh0JxqJmQB1KKQRc0HwqRRpBocJDnd?=
 =?us-ascii?Q?JzoW3mSnPrZtAR4czE+jXaB3pdZM679IDH3/tmUxnl5ev10Pyg4VJ0xkmFBy?=
 =?us-ascii?Q?qDwg9VP/Y4pj4NwTjlrKzUkcpyaCotB3W67g7aE5vZkv4sNVgcc0biZ4GSoq?=
 =?us-ascii?Q?c0ORsMmyrDKy38Rvd+Dn9ydTp81Qrjd7vytnaD8Li9PFRXlLOGZUNrpW/6l+?=
 =?us-ascii?Q?BTzG+/mA0ZVv26L6/jmKmzvg557Sv/P2P0LN4tJnE9/0TfoSSSB/Y123gA70?=
 =?us-ascii?Q?thKc/NyGmwoX3rcq5dTFGNg6nct7M1a3edtTdLO/4malX1jpydclB23nZmqj?=
 =?us-ascii?Q?Puc2pOeIxn6BuMED+qZfaL5W0fM/x/apmgLheykijAF/CJkBSImrmoW3ng8Z?=
 =?us-ascii?Q?m7KxnDXzGpg+jOEsOhk4cOvvkrNNUrNbA3Xro9zmlAsEUi9yn1zkYM1rJd03?=
 =?us-ascii?Q?0YN/Ugen1Jp9JlTPRn0Lh5n3NMN4ZdKn9JI4lkeDHP3qgrKeea4LKcDTmM56?=
 =?us-ascii?Q?nNdTle0mTIDpqUC3qUVIPBv1mepOC9p790SyzVnU20Gc6h73ExB8bxXhpbBs?=
 =?us-ascii?Q?qZNckWrwAGpXSkufpICbG1BZTbfHzFbLd+xTZTXigwcg8ja1naXETW6ojijw?=
 =?us-ascii?Q?ZLZ5h5eb7eUUtusUWulh1AtuSWfBjpW+eYcvE5QR7J6SkYrWFiqnqKYPdv8B?=
 =?us-ascii?Q?CwjFf9CVbRGLxhMd6a94xYSLSClfwRXzg82f3+p0+WdzlnxN/T+hwg65Bj77?=
 =?us-ascii?Q?HPFZATBchtIKmJGgUBrR7fastG111hdtyGRbn3nhcXRvwYDgqWJ6XCKZqZ91?=
 =?us-ascii?Q?2mDYsW+MLBXLC4uffTl7XqDnveQ4b7iHV9WrMJnKiaeb8nJWk1kL+T7sXmyE?=
 =?us-ascii?Q?11uEk1Ygh69QPT97iiRanXG+Nl0POIWO3niX+TpT88W78PI/uNor2C/C4Nlf?=
 =?us-ascii?Q?pi61J/+q2WnJutZ9pJHaJ69seaTNpoGpCqq8gfV5rbRiUDuhvWDzCo9B01M8?=
 =?us-ascii?Q?iDhDTaO3zVE682YZ/wMcNNJPuLWDBKvd8Mruu72+D8/TadD+ghKJZhLAxnj6?=
 =?us-ascii?Q?a5JeKCxSAIfujB3Yndjlvp6d1GPYlZ42zAT044yX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7c3250-906d-412b-9956-08de26c97f01
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:39:59.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/r423uxXpfTHOGw4A1YM0K0gcMPf3NJX2XS3wpgPZbo/x7DmA2W0hHBKH5fvVyjpHTSdrir2sn6JkhnFEvj0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10612

Sakari Ailus, Laurent Pinchart and Rui Miguel Silva

	There are many vendors use DWC CSI2 driver beside NXP.

	Rockchip: https://lore.kernel.org/linux-media/20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com/
	Toshiba: https://lore.kernel.org/linux-media/20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp/

	I worked on to build a common library for it.

	https://lore.kernel.org/linux-media/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/

	This one base on stage's imx6 csi2 driver, try to convert it to
one common library, but above serise is too big, there are 32 patches.

	I plan split into some small patches.

	The first clean up patches
	https://lore.kernel.org/linux-media/20251111-stage-csi2-cleanup-v2-0-371bb951776f@nxp.com/

	Can you priorioty review and land for these dwc csi2 related patches?

	I can continue work on it after above simple cleanup patch land.

Frank



