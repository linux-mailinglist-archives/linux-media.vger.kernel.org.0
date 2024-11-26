Return-Path: <linux-media+bounces-22092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2549D9AC1
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D374B165CE6
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 15:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B2B1DC046;
	Tue, 26 Nov 2024 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eQmvZ8Y2"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A91DB350;
	Tue, 26 Nov 2024 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732636421; cv=fail; b=iCdov8cAf78enR3p/O10RfDdKqyJpcfVO89GN6+I329xnNbwtYTTNcanUzH0kPX8SIZw+BQZOd0AMAtxRQYzCcDr6HV/KVU2yK/aFBCl2oD6VwGUspDskS1ub2uoao5lJonylBvLWfv2kz00BWAR0lMhSiUhm8XahVW8QkTZ01M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732636421; c=relaxed/simple;
	bh=kNgjrhziBgI7ik57L11x1VCtxurS8zNXc9v9GrJdGt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRWYy8Ao6t8lGGwYXDCIhcJVfA5ZRM2UiPbweuw2xIjcu4ExBj/Vju2e0SwS/vSQqhQSrm/3XXYJj0bfxCfibpSCYq5f/VmqIDtk36iU5Dqlgaw+mxZ53NjlmXEggYOTYn3kdoZERN8cE3OZM21d+u8/ofq6Jn8/W8xkZpvMGec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eQmvZ8Y2; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT58n+1LuBUXac1g74fcjAeNF3LQHcpMjdBNnxlgEdTePrIbFl/crXAg8jItSu9I8WgfloLk7qpc377Vb4XwGvc/c4T8NZlqPWlRR+fFzal5eKv/g6pMRwZOJniRBr3iVmTXfgpdhGzpMMnl8+LrU4QXs96UTfvSmiOxBjrikhynJ+XH1sSQYNB6+3mtsu7Jqy7vkBU6TTHV6B2k3M/DlQ8DkWffKmpMgMjyhVOpxrLnUqTafHHTA52+KZ0ORHLKNs1a1esVuxxuKHfad16ArsZQrCRJPdB0ASxQAegbLsS6r3tCO4M07ZaWQFRUrwM4UAqNdAwskFRV15C3JBwxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9YUEfM73TibN1rrjYSZTVPnxSn/bcD4rMCGh8+spiU=;
 b=L4q3yG8h6pliLg/C61PWkaNdXv2t0mE6ueKSOpJLrviAxl0PG+hRHQTC6eyjeIoivrHnXiyBEpBhl/f7fJvLgMUR4DqPkfBy9zxpKDAdTSzofc3fnZNB8Pq/2aOODQbq8Khz8Mm2aRbJfup9/s1KRpFaluzbQmfZ/pFqNO9M5/LVsQYuTeGAUUb8NQJS9O3Xnz355og4T3pMkWw/W4KhHu04MMynHqNnCFLXZGU0Npa6ncXuCPLDaSzQPwpbXqzeDr9zZ5jgShlxgGj+2sWod9yrSg+80OJnRETNNd/Qk5c4ZjOnX6Gp66eQUE208CpK66zk6s0cmx2JInvwkhRkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9YUEfM73TibN1rrjYSZTVPnxSn/bcD4rMCGh8+spiU=;
 b=eQmvZ8Y2FdBQxFX5tskqVjPwuV7XwF33zfOH/lsUTX5UxLh9IZmq+ZlZY+ml0O6c8s31Fj0vLK6/UJDa97KVt8ZA4+3o3eCxdzHOWPzFc+UFlzkvyNLvevPk44QBu7K5xtTkuKWt+/nwCcEtkRlYM8/5HTvc0wxTiubYm6DH/v/2Zsi3G70JjYxByvpstRCsMyiKoJdOak21Z+0pZbw1n6San2okkmtJ7JpYETTjgqzcWC+DrtolHo5Je9QOkHS+KOUdgTU93ir0nJ7a+/s9rXH9cAfM1uHJdIgHAKJ3xiKAjwpTvTLv1ns5FyzqHlLwA7/M0bJ/+CwByzF3fTlc5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 15:53:30 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 15:53:30 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH v2 4/4] media: ox05b1s: Add support for Omnivision OS08A20 raw sensor
Date: Tue, 26 Nov 2024 17:51:00 +0200
Message-Id: <20241126155100.1263946-5-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::36) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d61183-9045-4cb6-7502-08dd0e32796d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c1b7dw4Qjl6aCsaNrGU3RzKq3u8KG1DlKP6CJ85l6T+9ZyOpubzvh35jaWU4?=
 =?us-ascii?Q?bJbDIW3LZRAywf2VPjNSCVdlR0QDwfNp8Im0gpHSyfH018tyowgzhluF1O3k?=
 =?us-ascii?Q?f6fE0OtV8nlJR6L7VUafkcS7OLI40nLG9zGa2NzE49H2ZmySF7WgnIvZXk5g?=
 =?us-ascii?Q?wWk0hKDwV0IQ/X0de9+nSJgYk17vG8jr+dsnlmHrhR5FWfRj4ZEesp4HOBA7?=
 =?us-ascii?Q?C6TmHGiRZBxnf3uZwStv8IYmQVNszPNjTT6TlSKTf6OlCNu/wMc20eP8BMFD?=
 =?us-ascii?Q?v/EkT2Bu4wOxL5CIG6xp4UxBtvZCBNRnKN0TfxgVs1e+hQnJdWjTbWTBA6HJ?=
 =?us-ascii?Q?c7Y8IvIQ3FXtLMcu6UWrmTayNiMQizbQK7/RgGT1whphXWOiO8GJ6LIlG1iW?=
 =?us-ascii?Q?PPad/cbKGgdPS2PEy1LyeYtwJSJJ+FJK4sPTUs3erT/mrcAQpXgJ6B41acad?=
 =?us-ascii?Q?JbC2CouNizF2sPLD3lgrJZm3v6ib5Jh079rpPhbV7LQSx/RA9nFzmpUgZEwG?=
 =?us-ascii?Q?eocrshNa7Pb3hpQJIFVixlhBAbNPg0neEN/KoxztYytf+0h94GNPATemEnDG?=
 =?us-ascii?Q?g5ocj2s6XqkFu2J5U1T7aPUYbWvi0mUp9q9T08F0gZrj5hthI4pQgsG2xNFy?=
 =?us-ascii?Q?siXoWVind6XNJq0CO9LDAE9xPOScXhBq6wLcGXtfxz77y+qjAFPQDX+MVtup?=
 =?us-ascii?Q?hJyjOWA3Crq9RxA3vy8n8CIdTYeVe8e0sNW1Cf++h1CJNrYFTV+Wt87Naj4U?=
 =?us-ascii?Q?Rmfh2G9pctWDbmcIcLN55tK3jEwXlZ9f90WvAUv8qZIbCafBpwiGU7gFGAio?=
 =?us-ascii?Q?3NTZ5s9Kb6Dk9UZaG8FlMNHLcm4JN4EpxkG0BxVVGnAc6Txf0njEWoE8Luiv?=
 =?us-ascii?Q?NXX6Zy+OJ97LCxuiY8cm+f1vztde4HqJBJwYM9YWKF6Mln4XQ5cV38AJWYtr?=
 =?us-ascii?Q?xLJ66d9pxvZhS3uGDl6OMOI8A67kUKkqDiDbdlSSlUfS0PqeSgHGdAiZ/Cm9?=
 =?us-ascii?Q?2hPagO1l+vg5ROLwVoc2pzyb2R0/3fwXD0rNJ2YVcl72PI4fHvj6D4d6fHg3?=
 =?us-ascii?Q?8kVxWexrMFf4R2iDutEAdYB5P0pno/Fma7t7ExiONMCerBdXcwa/52vBPzqF?=
 =?us-ascii?Q?wrxwXqj9wkZeutCzIWNpjFy45BpM8VXry+Fhe5/KKEqVxa7q6XOSSOfg269H?=
 =?us-ascii?Q?i4XDoVvAV6+1i2cSSaUcxedvjaSaOceorgVfH/02/Xp/c7MMUFu+A/WCtyg3?=
 =?us-ascii?Q?RpMTJABvTFG+ikpLNAYV6wGWBQpIpz5Myw2oh8h1o4UuIBi5QDZH2lsAyNDd?=
 =?us-ascii?Q?MDEiLOVcEC9X0u0Prw409H0QeiWIyUVu12THv0iXZbQ5GkPyIvDKME6q7zx6?=
 =?us-ascii?Q?9XvntSkNt4rcu3vftzv9uGv7x++NsIK9wvoWxhqix9WxtfTGCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oskLVllu6VM4UC2LluJPyg6DCfdl6Pzqwbd6eEsAfRTdEF5jNQpJSbexz5+q?=
 =?us-ascii?Q?qpo9UPfgaBdgJQkOzIypfl7PWP6hxlcJVjMNu1zq99xKf/vMpa72PDATwDrD?=
 =?us-ascii?Q?dTbddqF8v1kAuPNp+/bvcdYCbdXbnMM0YweJy+9xB42h3Sv+TZgkQr4ebi38?=
 =?us-ascii?Q?g03gmnw3rkCG2OhzWAuKi0HJhUGQpUJ18CEKTeY264ukuMPAcW4j6OJ0uOok?=
 =?us-ascii?Q?+p70qKV18dqhufjUe51/TQt/JyzzjdS6c7VG1jYHw39UQgPIikLy+25eheNW?=
 =?us-ascii?Q?/G9Va+tVY0GYV7BWrV+F3jSMYp6T5QPnwERpYjzKrVdZWnbPNr7YqOgUSOik?=
 =?us-ascii?Q?TDQDwkx/VlcC6e0Kj0u4F45qZL4sWA61Yz689aIwR+ozMYg7k5IR4PEi0c/m?=
 =?us-ascii?Q?iC9szjuxECfXfmuqMZSpg9oNsqJBx3FimfxlFe23qnURr5p9zSGnLAgDMPCc?=
 =?us-ascii?Q?/oZdhOzzG4kuEhIcKcKq+L+X/ZGSy8SRCK7yeUsMYGAxp2C1Ir/m/mHlzGKl?=
 =?us-ascii?Q?IhPsRQui22mVgtcNnYArjVDQweBv64P2UKa9PFPDY7LiB9ShgtHhurX0QbwS?=
 =?us-ascii?Q?mIC1pNF5huI58ZTSXUDDX+Zl4P3og/rv6z/Pc4bXZRAK8r5kNH0i+vLEGITS?=
 =?us-ascii?Q?fP7a7ujOs+/TI9GV0Ygtq6UZhJMpUMmYMh0S677i7ulhIexs8/fsyFZjjktW?=
 =?us-ascii?Q?cf0NtDpjuBr8hWCp4resY4cS2JDqlQQ7OGAo67A/pJelcGwVe0fJXp6GpxLA?=
 =?us-ascii?Q?5Nz8ViPkN3yQGha1A2b6XTP42/87VAjL1mRifaF96CV8OrtptPhqUxXweDDS?=
 =?us-ascii?Q?LWUVevIVZAisijXr5oyrE0oG3ji5ULP3C3j2rYJKVNfA2Nkl8M/PQAYAOh5w?=
 =?us-ascii?Q?Bcm0JTx4K36GuqDq+lyCfrA7FCdIQpxS0F9Q1Ew75lRigdt99pj0qVV8GDcQ?=
 =?us-ascii?Q?omldPzlD++jXs22IdBCCnUVEJMyVhBHqsLlPvjEGYHCWyURKEX4Xd28OemMI?=
 =?us-ascii?Q?QZ0xDvcNQNCCNW3JpoFD8KnEtVbQU7p8kJ8lmq87qo4/iZIAY3CJZUShoiU1?=
 =?us-ascii?Q?6Opsqk0U5vCuLryINDAKVvxYLCmnzqGgefrtMvjnrnEmbVqSszA+p9eWit4A?=
 =?us-ascii?Q?PxV4QY/sQnnVQoOzRqu48pH7L1vRuy6Ne/H/lS+TwAok2uUJv21NzjhXoA+Q?=
 =?us-ascii?Q?pY0ikkJaj9d2hUtoi6fLGPmScnxlMR3FOj6IFRsomxyXJF3HP197iVovC51I?=
 =?us-ascii?Q?vY33IV6UkZRpwi9IzLJ2EczewPHo9tAoeNJuWpDvnIIeJ1T+QjQTbrrzs3P7?=
 =?us-ascii?Q?PI7SKPuCa/pJMqnco6VWDBdc59gS0VN94KplaempoTHlbXLI1HafgXEmOF1k?=
 =?us-ascii?Q?UeWYd28pviNHWfhk6oUKnZ/DTLR3m95f3Q5Sbikw+iQlYcV3bUG4PlDbTXJa?=
 =?us-ascii?Q?ewq1f4Ue6eA3awZCL5SKsOoaagsnB6mwa9g5WvnD91TLKEIAfLVuCBotiDwO?=
 =?us-ascii?Q?RsHkskjdAqG2lBpTbbIYmgIjR6wmjByysSpTNcfK+YvH0FMjc8wZROQ9sDzS?=
 =?us-ascii?Q?2Knmbj13R4kBggsQSEd70y2odFzUT5OEpStMlrsuWFVDnsGa3B16Zty70YoU?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d61183-9045-4cb6-7502-08dd0e32796d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 15:53:30.7589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h07IoSzgDPaQEoP5YhmmXiPeef2D6T6sl5xRMNAfcDo6v5FnTZxV5ugs77Jh/45ifkki+iMczG1snp03zDgyEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
HDR mode control is supported, with one hdr mode: staggered HDR with
2 exposures on separate virtual channels.
Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	Add spaces inside brackets, wrap lines to 80
	Remove some redundant initialization
	Use a loop in os08a20_enable_staggered_hdr/os08a20_disable_staggered_hdr, for that, add a register settings array for HDR enabling/disabling
	Make "sizes" a pointer
	Remove mode headers, add supported modes in the dedicated c file, ox05b1s_modes.c 
	Refactor register lists, for os08a20 use a common list for all modes, and also specific lists per mode

 drivers/media/i2c/ox05b1s/ox05b1s.h       |   4 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 196 +++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c | 326 ++++++++++++++++++++++
 3 files changed, 526 insertions(+)

diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
index a893c65894f3..38cd3438eb05 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s.h
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -17,6 +17,10 @@ struct ox05b1s_reglist {
 	struct ox05b1s_reg *regs;
 };
 
+extern struct ox05b1s_reglist os08a20_reglist_4k_hdr[];
+extern struct ox05b1s_reglist os08a20_reglist_4k[];
+extern struct ox05b1s_reglist os08a20_reglist_1080p[];
+
 extern struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
 
 #endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
index 0f5e2a946e4f..9ae0243f1c09 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -43,6 +43,7 @@ struct ox05b1s_sizes {
 	const struct v4l2_area *sizes;
 };
 
+struct ox05b1s;
 struct ox05b1s_plat_data {
 	char				name[20];
 	u32				chip_id;
@@ -55,6 +56,9 @@ struct ox05b1s_plat_data {
 	const struct ox05b1s_mode	*supported_modes;
 	u32				default_mode_index;
 	const struct ox05b1s_sizes	*supported_codes;
+	const char * const		*hdr_modes;
+	u32				hdr_modes_count;
+	int (*set_hdr_mode)(struct ox05b1s *sensor, u32 hdr_mode);
 };
 
 struct ox05b1s_ctrls {
@@ -65,6 +69,7 @@ struct ox05b1s_ctrls {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hdr_mode;
 };
 
 struct ox05b1s_mode {
@@ -105,6 +110,85 @@ struct ox05b1s {
 	struct ox05b1s_ctrls ctrls;
 };
 
+static struct ox05b1s_mode os08a20_supported_modes[] = {
+	{
+		/* 1080p BGGR10, no hdr, 60fps */
+		.index		= 0,
+		.width		= 1920,
+		.height		= 1080,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+		.vts		= 0x4a4,
+		.hts		= 0x790,
+		.exp		= 0x4a4 - 8,
+		.h_bin		= true,
+		.fps		= 60,
+		.reg_data	= os08a20_reglist_1080p,
+	}, {
+		/* 4k BGGR10, staggered hdr VC0/VC1, 15fps */
+		.index		= 1,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+		.vts		= 0x90a,
+		.hts		= 0x818,
+		.exp		= 0x90a - 8,
+		.h_bin		= false,
+		.fps		= 15,
+		.reg_data	= os08a20_reglist_4k_hdr,
+	}, {
+		/* 4k BGGR12, no hdr, 30fps */
+		.index		= 2,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp		= 12,
+		.vts		= 0x8f0,
+		.hts		= 0x814,
+		.exp		= 0x8f0 - 8,
+		.h_bin		= false,
+		.fps		= 30,
+		.reg_data	= os08a20_reglist_4k,
+	}, {
+		/* sentinel */
+	}
+};
+
+/* keep in sync with os08a20_supported_modes*/
+static const struct v4l2_area os08a20_sbggr10_sizes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+	}, {
+		.width = 3840,
+		.height = 2160,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct v4l2_area os08a20_sbggr12_sizes[] = {
+	{
+		.width = 3840,
+		.height = 2160,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes os08a20_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.sizes = os08a20_sbggr10_sizes,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.sizes = os08a20_sbggr12_sizes,
+	}, {
+		/* sentinel */
+	}
+};
+
 static struct ox05b1s_mode ox05b1s_supported_modes[] = {
 	{
 		.index		= 0,
@@ -234,6 +318,18 @@ static int ox05b1s_read_reg(struct ox05b1s *sensor, u16 reg, u8 *val)
 	return ret;
 }
 
+static int ox05b1s_update_bits(struct ox05b1s *sensor, u16 reg, unsigned int mask, u8 val)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	int ret = 0;
+
+	ret = regmap_update_bits(sensor->regmap, reg, mask, val);
+	if (ret < 0)
+		dev_err(dev, "Failed to update reg addr 0x%04x with 0x%02x\n", reg, val);
+
+	return ret;
+}
+
 #define OX05B1S_MAX_REG_BULK 16
 static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
 				   struct ox05b1s_reg *reg_array)
@@ -261,6 +357,62 @@ static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
 	return 0;
 }
 
+static const char * const os08a20_hdr_modes[] = {
+	"NO HDR",		/* No HDR, single exposure */
+	"HDR Staggered",	/* Staggered HDR mode, 2 exposures on separate virtual channels */
+};
+
+static struct ox05b1s_reg os08a20_init_setting_hdr_en[] = {
+	{ 0x3661, BIT(0) }, /* CORE1[0] STG_HDR_ALIGN_EN */
+	{ 0x3821, BIT(5) }, /* FORMAT2[5] STG_HDR_EN */
+	{ 0x4813, BIT(3) }, /* MIPI_CTRL_13[3] */
+	{ 0x486e, BIT(2) }, /* MIPI_CTRL_6E[2] MIPI_VC_ENABLE */
+};
+
+static int os08a20_enable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		ret = ox05b1s_update_bits(sensor,
+					  os08a20_init_setting_hdr_en[i].addr,
+					  os08a20_init_setting_hdr_en[i].data,
+					  os08a20_init_setting_hdr_en[i].data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int os08a20_disable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		ret = ox05b1s_update_bits(sensor,
+					  os08a20_init_setting_hdr_en[i].addr,
+					  os08a20_init_setting_hdr_en[i].data,
+					  0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int os08a20_set_hdr_mode(struct ox05b1s *sensor, u32 hdr_mode)
+{
+	switch (hdr_mode) {
+	case 0:
+		return os08a20_disable_staggered_hdr(sensor);
+	case 1:
+		return os08a20_enable_staggered_hdr(sensor);
+	default:
+		return -EINVAL;
+	}
+}
+
 static int ox05b1s_set_hts(struct ox05b1s *sensor, u32 hts)
 {
 	u8 values[2] = { (u8)(hts >> 8) & 0xff, (u8)(hts & 0xff) };
@@ -329,6 +481,12 @@ static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		ret = ox05b1s_set_exp(sensor, ctrl->val);
 		break;
+	case V4L2_CID_HDR_SENSOR_MODE:
+		if (sensor->model->set_hdr_mode)
+			ret = sensor->model->set_hdr_mode(sensor, ctrl->val);
+		else
+			ret = -EINVAL;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -391,6 +549,13 @@ static int ox05b1s_init_controls(struct ox05b1s *sensor)
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
 					0, 0xFFFF, 1, 0x80);
 
+	if (sensor->model->hdr_modes)
+		ctrls->hdr_mode = v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_SENSOR_MODE,
+							       sensor->model->hdr_modes_count - 1,
+								0, 0, sensor->model->hdr_modes);
+	else
+		ctrls->hdr_mode = NULL;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
@@ -703,7 +868,10 @@ static u8 ox05b1s_code2dt(const u32 code)
 {
 	switch (code) {
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+		return MIPI_CSI2_DT_RAW12;
 	default:
 		return MIPI_CSI2_DT_RAW10;
 	}
@@ -819,6 +987,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
 	}
 
 	switch (chip_id) {
+	case 0x530841:
+		camera_name = "os08a20";
+		break;
 	case 0x580542:
 		camera_name = "ox05b1s";
 		break;
@@ -962,6 +1133,24 @@ static void ox05b1s_remove(struct i2c_client *client)
 static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
 				 ox05b1s_runtime_resume, NULL);
 
+static const struct ox05b1s_plat_data os08a20_data = {
+	.name			= "os08a20",
+	.chip_id		= 0x530841,
+	.native_width		= 3872, /* 16 dummy + 3840 active pixels + 16 dummy */
+	.native_height		= 2192, /* 16 dummy + 2160 active lines + 16 dummy */
+	.active_top		= 16,
+	.active_left		= 16,
+	.active_width		= 3840,
+	.active_height		= 2160,
+	.supported_modes	= os08a20_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= os08a20_supported_codes,
+	.hdr_modes		= os08a20_hdr_modes,
+	.hdr_modes_count	= ARRAY_SIZE(os08a20_hdr_modes),
+	.set_hdr_mode		= os08a20_set_hdr_mode,
+
+};
+
 static const struct ox05b1s_plat_data ox05b1s_data = {
 	.name			= "ox05b1s",
 	.chip_id		= 0x580542,
@@ -974,9 +1163,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
 	.supported_modes	= ox05b1s_supported_modes,
 	.default_mode_index	= 0,
 	.supported_codes	= ox05b1s_supported_codes,
+	.hdr_modes		= NULL,
+	.hdr_modes_count	= 0,
+	.set_hdr_mode		= NULL,
 };
 
 static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,os08a20",
+		.data = &os08a20_data,
+	},
 	{
 		.compatible = "ovti,ox05b1s",
 		.data = &ox05b1s_data,
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
index 1830e9a9cc35..8aa76c03c582 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -9,6 +9,332 @@
 
 #include "ox05b1s.h"
 
+/* Common register configuration for Omnivision OS08A20 raw camera */
+struct ox05b1s_reg os08a20_init_setting_common[] = {
+	{ 0x0100, 0x00 },
+	{ 0x0103, 0x01 },
+	{ 0x0303, 0x01 },
+	{ 0x0306, 0x00 },
+	{ 0x0308, 0x03 },
+	{ 0x0309, 0x04 },
+	{ 0x300f, 0x11 },
+	{ 0x3010, 0x01 },
+	{ 0x3011, 0x04 },
+	{ 0x3012, 0x41 },
+	{ 0x3016, 0xf0 },
+	{ 0x301e, 0x98 },
+	{ 0x3031, 0xa9 },
+	{ 0x3103, 0x92 },
+	{ 0x3104, 0x01 },
+	{ 0x3106, 0x10 },
+	{ 0x340c, 0xff },
+	{ 0x340d, 0xff },
+	{ 0x3505, 0x83 },
+	{ 0x3508, 0x00 }, /* Long gain */
+	{ 0x3509, 0x80 }, /* Long gain */
+	{ 0x350a, 0x04 },
+	{ 0x350b, 0x00 },
+	{ 0x350c, 0x00 },
+	{ 0x350d, 0x80 },
+	{ 0x350e, 0x04 },
+	{ 0x350f, 0x00 },
+	{ 0x3603, 0x2c },
+	{ 0x3605, 0x50 },
+	{ 0x3610, 0x39 },
+	{ 0x360c, 0x01 },
+	{ 0x3628, 0xa4 },
+	{ 0x362d, 0x10 },
+	{ 0x3662, 0x00 },
+	{ 0x3663, 0x28 },
+	{ 0x3664, 0x0d },
+	{ 0x366a, 0x38 },
+	{ 0x366b, 0xa0 },
+	{ 0x366d, 0x00 },
+	{ 0x366e, 0x00 },
+	{ 0x3680, 0x00 },
+	{ 0x36c0, 0x00 },
+	{ 0x3701, 0x02 }, /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x373b, 0x02 },
+	{ 0x373c, 0x02 },
+	{ 0x3736, 0x02 },
+	{ 0x3737, 0x02 },
+	{ 0x3705, 0x00 },
+	{ 0x371c, 0x00 },
+	{ 0x371d, 0x08 },
+	{ 0x3740, 0x1b },
+	{ 0x3741, 0x04 },
+	{ 0x375e, 0x0b },
+	{ 0x3760, 0x10 },
+	{ 0x3776, 0x10 },
+	{ 0x3781, 0x02 },
+	{ 0x3782, 0x04 },
+	{ 0x3783, 0x02 },
+	{ 0x3784, 0x08 },
+	{ 0x3785, 0x08 },
+	{ 0x3788, 0x01 },
+	{ 0x3789, 0x01 },
+	{ 0x3797, 0x04 },
+	{ 0x3800, 0x00 },
+	{ 0x3801, 0x00 },
+	{ 0x3802, 0x00 },
+	{ 0x3803, 0x0c },
+	{ 0x3804, 0x0e },
+	{ 0x3805, 0xff },
+	{ 0x3806, 0x08 },
+	{ 0x3807, 0x6f },
+	{ 0x3823, 0x08 },
+	{ 0x3826, 0x00 },
+	{ 0x3827, 0x08 },
+	{ 0x382d, 0x08 },
+	{ 0x3832, 0x02 },
+	{ 0x3833, 0x00 }, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
+	{ 0x383c, 0x48 },
+	{ 0x383d, 0xff },
+	{ 0x3d85, 0x0b },
+	{ 0x3d84, 0x40 },
+	{ 0x3d8c, 0x63 },
+	{ 0x3d8d, 0xd7 },
+	{ 0x4000, 0xf8 },
+	{ 0x4001, 0x2b },
+	{ 0x4004, 0x00 },
+	{ 0x4005, 0x40 },
+	{ 0x400a, 0x01 },
+	{ 0x400f, 0xa0 },
+	{ 0x4010, 0x12 },
+	{ 0x4018, 0x00 },
+	{ 0x4008, 0x02 },
+	{ 0x401a, 0x58 },
+	{ 0x4050, 0x00 },
+	{ 0x4051, 0x01 },
+	{ 0x4028, 0x2f },
+	{ 0x4052, 0x00 },
+	{ 0x4053, 0x80 },
+	{ 0x4054, 0x00 },
+	{ 0x4055, 0x80 },
+	{ 0x4056, 0x00 },
+	{ 0x4057, 0x80 },
+	{ 0x4058, 0x00 },
+	{ 0x4059, 0x80 },
+	{ 0x430b, 0xff },
+	{ 0x430c, 0xff },
+	{ 0x430d, 0x00 },
+	{ 0x430e, 0x00 },
+	{ 0x4501, 0x18 }, /* R1 (default 0x18) bit[4:2]=not used */
+	{ 0x4502, 0x00 },
+	{ 0x4643, 0x00 },
+	{ 0x4640, 0x01 },
+	{ 0x4641, 0x04 },
+	{ 0x4800, 0x64 },
+	{ 0x4809, 0x2b },
+	{ 0x4813, 0x90 }, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
+	{ 0x4817, 0x04 },
+	{ 0x4833, 0x18 },
+	{ 0x483b, 0x00 },
+	{ 0x484b, 0x03 },
+	{ 0x4850, 0x7c },
+	{ 0x4852, 0x06 },
+	{ 0x4856, 0x58 },
+	{ 0x4857, 0xaa },
+	{ 0x4862, 0x0a },
+	{ 0x4869, 0x18 },
+	{ 0x486a, 0xaa },
+	{ 0x486e, 0x03 }, /* MIPI CTRL 6E (default 0x03) */
+	{ 0x486f, 0x55 },
+	{ 0x4875, 0xf0 },
+	{ 0x5000, 0x89 },
+	{ 0x5001, 0x42 },
+	{ 0x5004, 0x40 },
+	{ 0x5005, 0x00 },
+	{ 0x5180, 0x00 },
+	{ 0x5181, 0x10 },
+	{ 0x580b, 0x03 },
+	{ 0x4d00, 0x03 },
+	{ 0x4d01, 0xc9 },
+	{ 0x4d02, 0xbc },
+	{ 0x4d03, 0xc6 },
+	{ 0x4d04, 0x4a },
+	{ 0x4d05, 0x25 },
+	{ 0x4700, 0x2b },
+	{ 0x4e00, 0x2b },
+	{ /* sentinel*/ },
+};
+
+/* Mode specific register configurations for Omnivision OS08A20 raw camera */
+
+/* OS08A20 3840 x 2160 @30fps BGGR10 HDR */
+struct ox05b1s_reg os08a20_init_setting_4k_hdr[] = {
+	{ 0x0305, 0x3c }, /* PLL_CTRL_05 (default 0x3c) */
+	{ 0x032a, 0x00 }, /* PLL_CTRL_2a (default 0x00) */
+	{ 0x031e, 0x09 },
+	{ 0x3501, 0x08 }, /* Long exposure */
+	{ 0x3502, 0xe5 }, /* Long exposure */
+	{ 0x3600, 0x00 }, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
+	{ 0x3609, 0xb5 },
+	{ 0x3660, 0x42 }, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
+	{ 0x3661, 0x07 }, /* CORE1 (default 0x06) bit[0]=stg_hdr_align_en */
+	{ 0x3706, 0x39 },
+	{ 0x370a, 0x00 },
+	{ 0x370b, 0x98 },
+	{ 0x3709, 0x49 },
+	{ 0x3714, 0x21 }, /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x3762, 0x11 }, /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x3808, 0x0f }, /* X output size (default 0x07) */
+	{ 0x3809, 0x00 }, /* X output size (default 0x80) */
+	{ 0x380a, 0x08 }, /* Y output size (default 0x04) */
+	{ 0x380b, 0x70 }, /* Y output size (default 0x38) */
+	{ 0x380c, 0x08 }, /* HTS[15:8], total horizontal timing size */
+	{ 0x380d, 0x18 }, /* HTS[7:0],  total horizontal timing size */
+	{ 0x380e, 0x09 }, /* VTS[15:8], total vertical timing (default 0x04) */
+	{ 0x380f, 0x0a }, /* VTS[7:0],  total vertical timing (default 0xA0) */
+	{ 0x3813, 0x10 }, /* ISP_Y_WIN ISP vertical windowing offset */
+	{ 0x3814, 0x01 }, /* X INC ODD (default 0x01) */
+	{ 0x3815, 0x01 }, /* X INC EVEN (default 0x01) */
+	{ 0x3816, 0x01 }, /* Y INC ODD (default 0x01) */
+	{ 0x3817, 0x01 }, /* Y INC EVEN (default 0x01) */
+	{ 0x381c, 0x08 }, /* BLC_NUM_OPTION (default 0x0e) */
+	{ 0x3820, 0x00 }, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
+	{ 0x3821, 0x24 }, /* FORMAT2 bit[5]=stagger hdr en, bit[2]=mirror */
+	{ 0x3833, 0x01 }, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
+	{ 0x4009, 0x0d }, /* BLC CTRL09 (default 0x0f) bl_end */
+	{ 0x4813, 0x98 }, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
+	{ 0x4837, 0x10 }, /* PCLK PERIOD (default 0x08) */
+	{ 0x486e, 0x07 }, /* MIPI CTRL 6E (default 0x03) */
+	{ 0x3501, 0x08 }, /* Long exposure */
+	{ 0x3502, 0xe1 }, /* Long exposure */
+	{ 0x3511, 0x00 }, /* Short exposure */
+	{ 0x3512, 0x20 }, /* Short exposure */
+	{ /* sentinel*/ },
+};
+
+/* OS08A20 3840 x 2160 @30fps BGGR12 */
+struct ox05b1s_reg os08a20_init_setting_4k[] = {
+	{ 0x0305, 0x3c }, /* PLL_CTRL_05 (default 0x3c) */
+	{ 0x0325, 0x47 }, /* PLL_CTRL_25 (default 0x3c) */
+	{ 0x032a, 0x00 }, /* PLL_CTRL_2a (default 0x00) */
+	{ 0x3400, 0x04 }, /* PSV CTRL (default 0x00) bit[2]=r_psv_mode_en */
+	{ 0x3025, 0x03 }, /* PSV MODE OPT (default 0x02) not used */
+	{ 0x3425, 0x01 }, /* R ASP PD SEL bit[1:0]=stream blanking */
+	{ 0x3428, 0x01 }, /* R ASP PD SEL bit[1:0]=bpg1 N-pump1 bypass to AGND */
+	{ 0x3408, 0x03 }, /* CTRL08 (default 0x01) bit[3:0]=r_clk_winp_off */
+	{ 0x031e, 0x0a },
+	{ 0x3501, 0x08 }, /* Long exposure */
+	{ 0x3502, 0xe5 }, /* Long exposure */
+	{ 0x3600, 0x00 }, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
+	{ 0x3609, 0xdb },
+	{ 0x3660, 0xd3 }, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
+	{ 0x3706, 0x72 },
+	{ 0x370a, 0x01 },
+	{ 0x370b, 0x30 },
+	{ 0x3709, 0x48 },
+	{ 0x3714, 0x21 }, /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x3762, 0x11 },  /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x3808, 0x0f }, /* X output size (default 0x07) */
+	{ 0x3809, 0x00 }, /* X output size (default 0x80) */
+	{ 0x380a, 0x08 }, /* Y output size (default 0x04) */
+	{ 0x380b, 0x70 }, /* Y output size (default 0x38) */
+	{ 0x380c, 0x08 }, /* HTS[15:8], total horizontal timing size */
+	{ 0x380d, 0x14 }, /* HTS[7:0],  total horizontal timing size */
+	{ 0x380e, 0x08 }, /* VTS[15:8], total vertical timing (default 0x04) */
+	{ 0x380f, 0xf0 }, /* VTS[7:0],  total vertical timing (default 0xA0) */
+	{ 0x3813, 0x10 }, /* ISP_Y_WIN ISP vertical windowing offset */
+	{ 0x3814, 0x01 }, /* X INC ODD (default 0x01) */
+	{ 0x3815, 0x01 }, /* X INC EVEN (default 0x01) */
+	{ 0x3816, 0x01 }, /* Y INC ODD (default 0x01) */
+	{ 0x3817, 0x01 }, /* Y INC EVEN (default 0x01) */
+	{ 0x381c, 0x00 }, /* BLC_NUM_OPTION (default 0x0e) */
+	{ 0x3820, 0x00 }, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
+	{ 0x3821, 0x04 }, /* FORMAT2 bit[2]=mirror, bit[0]=horizontal bining */
+	{ 0x4009, 0x0d }, /* BLC CTRL09 (default 0x0f) bl_end */
+	{ 0x4600, 0x00 },
+	{ 0x4601, 0x20 },
+	{ 0x4603, 0x01 },
+	{ 0x4837, 0x10 }, /* PCLK PERIOD (default 0x08) */
+	{ 0x3501, 0x09 }, /* Long exposure */
+	{ 0x3502, 0x01 }, /* Long exposure */
+	{ 0x4028, 0x4f },
+	{ 0x4029, 0x1f },
+	{ 0x402a, 0x7f },
+	{ 0x402b, 0x01 },
+	{ /* sentinel*/ },
+};
+
+/* OS08A20 1920 x 1080 @60fps BGGR10 */
+struct ox05b1s_reg os08a20_init_setting_1080p[] = {
+	{ 0x0304, 0x00 }, /* PLL_CTRL_04 (default 0x00) */
+	{ 0x0305, 0x2d }, /* PLL_CTRL_05 (default 0x3c) */
+	{ 0x0325, 0x45 }, /* PLL_CTRL_25 (default 0x3c) */
+	{ 0x0327, 0x05 }, /* PLL_CTRL_27 (default 0x07) */
+	{ 0x0328, 0x02 }, /* PLL_CTRL_28 (default 0x07) */
+	{ 0x032a, 0x02 }, /* PLL_CTRL_2a (default 0x00) */
+	{ 0x3400, 0x04 }, /* PSV CTRL (default 0x00) bit[2]=r_psv_mode_en */
+	{ 0x3025, 0x03 }, /* PSV MODE OPT (default 0x02) not used */
+	{ 0x3425, 0x01 }, /* R ASP PD SEL bit[1:0]=stream blanking */
+	{ 0x3428, 0x01 }, /* R ASP PD SEL bit[1:0]=bpg1 N-pump1 bypass to AGND */
+	{ 0x3408, 0x03 }, /* CTRL08 (default 0x01) bit[3:0]=r_clk_winp_off */
+	{ 0x031e, 0x09 },
+	{ 0x3501, 0x04 }, /* Long exposure */
+	{ 0x3502, 0x62 }, /* Long exposure */
+	{ 0x3600, 0x09 }, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
+	{ 0x3609, 0xb5 },
+	{ 0x3660, 0x43 }, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
+	{ 0x3706, 0x39 },
+	{ 0x370a, 0x00 },
+	{ 0x370b, 0x98 },
+	{ 0x3709, 0x49 },
+	{ 0x3714, 0x22 },  /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x3762, 0x11 },  /* Sensor timing control registers 0x3700-0x37ff */
+	{ 0x3808, 0x07 }, /* X output size (default 0x07) */
+	{ 0x3809, 0x80 }, /* X output size (default 0x80) */
+	{ 0x380a, 0x04 }, /* Y output size (default 0x04) */
+	{ 0x380b, 0x38 }, /* Y output size (default 0x38) */
+	{ 0x380c, 0x07 }, /* HTS[15:8], total horizontal timing size */
+	{ 0x380d, 0x90 }, /* HTS[7:0],  total horizontal timing size */
+	{ 0x380e, 0x04 }, /* VTS[15:8], total vertical timing (default 0x04) */
+	{ 0x380f, 0xa4 }, /* VTS[7:0],  total vertical timing (default 0xA0) */
+	{ 0x3813, 0x08 }, /* ISP_Y_WIN ISP vertical windowing offset */
+	{ 0x3814, 0x03 }, /* X INC ODD (default 0x01) */
+	{ 0x3815, 0x01 }, /* X INC EVEN (default 0x01) */
+	{ 0x3816, 0x03 }, /* Y INC ODD (default 0x01) */
+	{ 0x3817, 0x01 }, /* Y INC EVEN (default 0x01) */
+	{ 0x381c, 0x00 }, /* BLC_NUM_OPTION (default 0x0e) */
+	{ 0x3820, 0x01 }, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
+	{ 0x3821, 0x05 }, /* FORMAT2 bit[2]=mirror, bit[0]=horizontal bining */
+	{ 0x4009, 0x05 }, /* BLC CTRL09 (default 0x0f) bl_end */
+	{ 0x4501, 0x98 }, /* R1 (default 0x18) bit[4:2]=not used */
+	{ 0x4837, 0x16 }, /* PCLK PERIOD (default 0x08) */
+	{ /* sentinel*/ },
+};
+
+struct ox05b1s_reglist os08a20_reglist_4k_hdr[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_4k_hdr
+	}, {
+		/* sentinel */
+	}
+};
+
+struct ox05b1s_reglist os08a20_reglist_4k[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_4k
+	}, {
+		/* sentinel */
+	}
+};
+
+struct ox05b1s_reglist os08a20_reglist_1080p[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_1080p
+	}, {
+		/* sentinel */
+	}
+};
+
 /*
  * Register configuration for Omnivision OX05B1S raw camera
  * 2592X1944_30FPS_FULL_RGBIr 2592 1944
-- 
2.25.1


