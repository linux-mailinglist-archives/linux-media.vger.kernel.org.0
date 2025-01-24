Return-Path: <linux-media+bounces-25233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200AA1ADD2
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 01:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DC351885912
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 00:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A12F134B0;
	Fri, 24 Jan 2025 00:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bXivHJeG"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864874C91;
	Fri, 24 Jan 2025 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677612; cv=fail; b=f5A1cJ+FRVpPJLjPl2NfoAPcjLdQ4Qd9p6mIirT8Q4VEDW2Xn8Hs8pylLcLD//PdyzRtUnjff6pZriBzKzOj4BM83kFqf+hZh6gbe/gWzWNJody7CBbjoT0VplWWQ5X1zpywZPgP+F3hZaJa05/GAs006LImPqzA2SH9hwnPOEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677612; c=relaxed/simple;
	bh=wx9s0n4P4bgTayAUbxX3KZWPlb6gXnv06/qmlK7vr4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NKcR0o8q2h+pWYFZWSNJMLFbj5UfQIF7vRXXmSAhl1SbwTjERahPDwXRaF2cqG7Rs7diw81kBzW2mLNHFQEATmiqh78DdLvYI3VHhYla7D+i05VyIXpixp0AhqruTzUKScDl7oriMmcZyC5yZhFNIvGukxtwIGt1GwBqQjekzz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bXivHJeG; arc=fail smtp.client-ip=40.107.247.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfAlR04Lw0H0HnCRmlb1p6Yg5i8hJ649Esgx/0ZehYKM3yk+yEBujAdLtAJ8bl1ItJqE3R6+fBXamw72cmKE0BUtRaJFzuORrayMYJAoz1C+3FoznAfuuvu6HRf5B+gLJB8zja7v/MnvFjZM6FcYyaei9y5L16CdQEQ4d712F1RYfb/IAGJiEtkth9GBJ8PBjL3f4z5KKG3/G1Vn1Pmtq9UlQqKF/h7rhdD5IfL09/mwxZQisg0s5aulR664rQSrNog4vm7aDZvTbjyZd1sowXFuxpgGcJaFpb6aQ00pAWv01jjpquVVP7/7nhxUlsCFl7CUsH+ksiGVKLuGnvG/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tMjSwNiM7aTMEPorQohza+Yiu/Uuzjr/g5GkHax7S0=;
 b=hO69lE4zchbNU4wcfU2I+jp0tiIt/OV2aWQNP2HmY1qRhee2xUr9/FIm0GvT4yhEktSQX5/xW4uqzMNITuyz2NmMlt33efkttv1gi8u6T1uRv5vMiiaR+aVFGkkYJlNKMFND6YHyPTdqYfVgXwMyN0AQoKPz6VqMOSwCqIiJoRqMPT0ZoADztBm+FKHFdh8HByeDb/8oCpgJ40XAj+vpsnojYhv/azl6b4sqRkWNwENMRKzpyP8xL+4peuFXtlmTeWUwu1YF+kmpkqMwlEuaBdhzzEBFdD/Niic4dQ3GzdVT1rIwwNLSLeCtgzkl363EnoiSL3udNb+7Td2Q2MBgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tMjSwNiM7aTMEPorQohza+Yiu/Uuzjr/g5GkHax7S0=;
 b=bXivHJeGb36J3jOztkCXa6TAQHMuu6pVAdnFYgswJborMULHEJw9vPJuJyf/8PvnFAJuOVUHTZL0IOoku6vd0b5FU4GNLhci7uJmNL2ndYnr2D+bSYlHobVIgNPVycpIJ9I9BUfLr39RA61NQwNR4eKTmQBkTDzVZcbfsEnEAtBCO0lyVodoCxvMTgjbF7qy5WROXQDbzmkTwjfLAQbCslkOVBPnO/vjjf78QLLuLGsWjWI75/RXwTA22mrxNBSlgZnA5fGM+kjgiqVp7KiIIGIxGtaEDKOHPr7z+gtX4fZDRXTwBZ66zsoqoRfcM+dBHTBYilKAAuauUciZsF3uZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 00:13:24 +0000
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01]) by PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 00:13:24 +0000
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
Subject: [PATCH v3 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor driver
Date: Fri, 24 Jan 2025 02:12:41 +0200
Message-Id: <20250124001243.446511-3-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124001243.446511-1-mirela.rabulea@nxp.com>
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::12) To PAXPR04MB9231.eurprd04.prod.outlook.com
 (2603:10a6:102:2bb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9231:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c840160-1291-419c-0b0c-08dd3c0beb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5AUCrbeb9ILmUPQb3yICP7iId5l0uq5KtYXIVcM10RzmxzNNM0206QMCkSGK?=
 =?us-ascii?Q?+x+msk7hGymoSYiI1SioiqX911B1lp2iONWoddDdEKwOL9aA3+HWOM2t6poH?=
 =?us-ascii?Q?M6dHwJdiK5h4TCmyFsTw3vFbSxCVyBDfmQ/EP46Ft5bb6WcaoSNUVJJ86K2m?=
 =?us-ascii?Q?exCxNmQ9nYGUva0mCBm3eQeHVciikAMblcaOyab6h9UGzGtUzSEYqMg3ScrI?=
 =?us-ascii?Q?LQxbFCv34Vjv8muH7amdNEDcF4rht7nfQ6bQ7I23nLlFP5Ir0eTWXiYvXhPg?=
 =?us-ascii?Q?lG+nIUk50D9KYGG9KsGO6AEajn16DJt3gyvTosmMGYT8fxR4ixR1ns2FeJvk?=
 =?us-ascii?Q?mTyNQDToPCw8fe9WfqD1yU6lkoJwqFdf/8hr394CRc8ty4hg7+mH5tjEIKME?=
 =?us-ascii?Q?S6LVYPXTD6d5J19WHdh2vrRAmt+PJxYwcFAwIafN+grmYasPqzLQwB0Egt65?=
 =?us-ascii?Q?Uw4ZhYPySSwUcM8eB7FrRm+vm/xmnd3Awrm9aUJaMXB+69Wgcbxn+hQg5Juj?=
 =?us-ascii?Q?en+eblWPdC6P9BU9RiOEZgB6KIoafKi05HU5sym5dsp1eXfQbn6oJKb97lyD?=
 =?us-ascii?Q?dI1iaI8q/4zkhK0mNfgc+/mm024T1SbXl3abXqoiFcEHgxtwEv5x0y4mMpyv?=
 =?us-ascii?Q?sJJpsN7GsMzHul2g/ndKAe4/IQ2cq0pO11oKuoUEUEncrHho+2G/yyDESkAm?=
 =?us-ascii?Q?pwpscY2uZc97/vN2Rcf4XVsqINvhTAbj6afLeJNVg48ykYcwkvrx9XSux7R8?=
 =?us-ascii?Q?3E5PCNcd7ZZrReip7iccBocooaE3yFgt3vqm1Z2C4D313/mA4G24M0LMFjO/?=
 =?us-ascii?Q?y6WlGmHmkp2Q71bxk3K/PnL9ZlGLbL0UFOCroiNCAGvLCA+E/Jl5IbZ5dSen?=
 =?us-ascii?Q?Xmj21rCCFh6CZrZxmOePF0JBfJcYzxfp3W1EtR6agT9NkwSQ7tICVGOzK2tV?=
 =?us-ascii?Q?XJUZiICWE4ie4HQJMky+3dHj2DGyWbkkwqTL9bbjmPCnI/NEde3J4YV5gha4?=
 =?us-ascii?Q?WKHxPN0mxmGC6vTwAl9CKdvtNptMYh8BR0ABNekBqnaSN3O8jhsBjiDFvU5B?=
 =?us-ascii?Q?oCCYwT5UrOOV1KGTfKiGJwpfQOs8BR26uvOOnIdy84IgjScLUMT87iP/G1pX?=
 =?us-ascii?Q?WvohkjnanJTlSIQSZAkLugSjIvHZxsZGBG8OPU2KleEGnF0iklAi3RgUHICb?=
 =?us-ascii?Q?C3wxV9r/k0XHVkMdWkZKggqWmXsYo1ycFv90pGfVwOU8O3+v+4+TsbYUWEbC?=
 =?us-ascii?Q?PicNOuPB3zGco4y8JF7Nc6iXJWeXLzSa0hTuO6mQFGfvn77cmlgQVcyh8QNA?=
 =?us-ascii?Q?hpT1UXIYItbLcyQ7FdiqLyatUzZzO9hcwZA8z1tsesA8fK8F+uJE/69i09dN?=
 =?us-ascii?Q?LWzW1dhg9NJ9aok0ZnYsZfYY4ahe7VwKioYAJeu6chHfoqsKVrx/3oS2/q8a?=
 =?us-ascii?Q?RnZr2weixa1oXqZmwanBY25EtqPoXVb0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9231.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ufBBIS43RHzWRiU2Dx+iYHPFb/xd6PZeqCyWeC+yVvVoFw3P2hlG/qGv8z3?=
 =?us-ascii?Q?x6MQr1BAe7XhWOZismDNUPUv9c4OU1wN2I1qgOlvJSlzuHuGmEwfDCU22U1l?=
 =?us-ascii?Q?REktiZQ9cRlR8PgAvxVnAbc4stjJPP8N3AXZc8v8txFd7EEVgCFTie114dvB?=
 =?us-ascii?Q?3fQkcOL5UREMtc3q3GF++i69jcT+EjNNxLFfWsDN9HHdp/HSNy+2q7Gz2twd?=
 =?us-ascii?Q?MS5EeFI+U9lB2IHNOkIlhgXuEO6jGRUuRfb6GmWIa1YXKhRTvYSdyJ2qzGhv?=
 =?us-ascii?Q?N+56RrX7cpb3tcAnkQNGxEn68syKwmgaz+Gq/PwJt7Ag7ZIuvFHQw5k2qP95?=
 =?us-ascii?Q?Tl3QLVYgHiIyHcI6jWWB+Le6BhPm0SAqTGJsseOoNPtwBMXBUC/XE+jg9FBV?=
 =?us-ascii?Q?GPWdIe2fdUgj4TmoYWKV4i1eBeaQ5v+aGVenw1/5vbhqV0ZisxoDXjkNivRI?=
 =?us-ascii?Q?Nzfp6HVMl0471SjrFpqyuOtE+SYOIEsP0bcMoUSnvNk2UEcQuW/XP64DfXdF?=
 =?us-ascii?Q?FKIbUf+aQUupMP4jtQaiQCl6yxGAFwZSyVStEcqfevRLuxyNXibTdWnZmlyj?=
 =?us-ascii?Q?IkdzzGwPnFVuYONeVXQWSCJRTlzc6mV/YduA2vmnx2vxvRAYlbOK2ga4qfi/?=
 =?us-ascii?Q?PGlxr8bQv19w5ChdMzkmI6okNJzauvSxMOjHpdmY+CGV6WeE+Mnz041QfRmK?=
 =?us-ascii?Q?sqAZz8i0lWYgMkH/hJKHca+w+3nqVFo/7tdr2tzpktK+N0RZovUnSWJzgnQJ?=
 =?us-ascii?Q?15OSqyvxkfZF+0Sqs8wUTKi65CIRcUB7fLeggUh/e1Q7KCTd/M7KFySe0q7/?=
 =?us-ascii?Q?94JfN0f0fM2MQaRc4/LuQHj9n6w1UnFa8y7nyXnArZEUB6n3UPFGIUxmeb20?=
 =?us-ascii?Q?owwL+k0Tr42wRspgzUYzS9eaH3Ojkfzw47XxzHLf2KLmi3v5YFn3+YDJWrSy?=
 =?us-ascii?Q?WMZan57nh0nvy9BtE8ms5lmDXdqbdH/m6SsErNSPPRJE6li1pjPpksTYALmv?=
 =?us-ascii?Q?cccLCy8hkdxdkZh6e6x0nZCYMKmhAVnAjItvcY6jEqLW5ph/u5QcwdelK3e0?=
 =?us-ascii?Q?rrUfQViEj5umizUWTEK3eGo1JTrof7XZia4/SAbejN5+/UUunnd7+l6ckTRO?=
 =?us-ascii?Q?WfnINjdJI2QWCTDYoPHDxyqW+oScz/F8+S2+8pyX7VL2r8P91Hlhp9ZGzjRN?=
 =?us-ascii?Q?TbOUkloi/gv+V6mOw4dqECrEiSulebAylghOOJ3HlQF2k0zsBMFe8ZtN9e4L?=
 =?us-ascii?Q?RFZ0j97htotxXMW0uxVFGNBLI95ur+A78nUQtdBQocvSa9fFLCjgPO0X/LMq?=
 =?us-ascii?Q?VsrPz0eitKyaF5EdHHm6xNTjmp7N01s94iwrhTAKSqhHzm82vhBI6oVdhbT0?=
 =?us-ascii?Q?qESVuCwASkMj7aN3n6BmJcR4lLjgat/RdvjQO9ATsF8HFuDyD9BBLKRlBH7x?=
 =?us-ascii?Q?KXvFgH3CnOgossbv2WU54JLTaCQrZIjH2rtqVog7oyKSubQTvbkNzxkZbyFq?=
 =?us-ascii?Q?ICXXFJPYaVe3tzF98I6P65QSLX3ozxXyQSwo2oFtndYjKv/lQ9wAZbI/GHii?=
 =?us-ascii?Q?kYUUGFU1BWTiGTwCZrWQUU/HQnfQ6C+AmG/OJNTZ7DkGRs1kfRN+cqPjuiql?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c840160-1291-419c-0b0c-08dd3c0beb34
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9231.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 00:13:24.6896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXtC/UqTCeH4oP5u/CUXAccKsBRpS9XiKNDoJrh/Npoc74N8qXSGClezQWb5bERvsMkndcEJGIomQu51Smn0Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported for OX05B1S:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v3:
	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
	ox05b1s register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
	Use const for ox05b1s_supported_modes
	Device should be silent on success, use dev_dbg.
	Drop unneeded {}
	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for 4k BGGR12 mode was stuck)
	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev state only for _TRY, save it also for _ACTIVE

Changes in v2:
	Use dev_err_probe for missing clock, since it is now required property, and use NULL for devm_clk_get (no name for single clock), remove check for non NULL sensor->sensor_clk
	Remove dev_err message for devm_regmap_init_i2c allocation error
	Added spaces inside brackets, wrap lines to 80
	Remove some redundant initializations
	Add regulators
	Make "sizes" a pointer
		Use struct v4l2_area instead of u32[2] array
		Remove the count for supported_modes[] and supported_codes[], instead use sentinel element at the end
		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
	Remove .h files for modes, however did not move this code in the driver file but added a separate c file for all supported modes
	Refactor register lists to allow multiple register arrays per mode
	Use GPL-2.0-only instead of GPL-2.0

 drivers/media/i2c/Kconfig                 |   1 +
 drivers/media/i2c/Makefile                |   1 +
 drivers/media/i2c/ox05b1s/Kconfig         |  10 +
 drivers/media/i2c/ox05b1s/Makefile        |   2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 939 ++++++++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  63 ++
 7 files changed, 1038 insertions(+)
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8ba096b8ebca..5cda062c0463 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -700,6 +700,7 @@ config VIDEO_VGXY61
 
 source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
+source "drivers/media/i2c/ox05b1s/Kconfig"
 
 endif
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fbb988bd067a..028eb08e648c 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -114,6 +114,7 @@ obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
 obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
 obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
 obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
+obj-$(CONFIG_VIDEO_OX05B1S) += ox05b1s/
 obj-$(CONFIG_VIDEO_RDACM20) += rdacm20.o
 obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
 obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
diff --git a/drivers/media/i2c/ox05b1s/Kconfig b/drivers/media/i2c/ox05b1s/Kconfig
new file mode 100644
index 000000000000..48fcd04b20d5
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/Kconfig
@@ -0,0 +1,10 @@
+config VIDEO_OX05B1S
+	tristate "OmniVision raw sensor support OX05B1S"
+	depends on OF
+	depends on GPIOLIB
+	select REGMAP_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Omnivision OX05B1S RGB-IR sensor.
+	  This is a 1/2.5-Inch CMOS image sensor with an active array size of 2592 x 1944.
+	  It is programmable through I2C interface.
+	  The output is on MIPI CSI-2 interface.
diff --git a/drivers/media/i2c/ox05b1s/Makefile b/drivers/media/i2c/ox05b1s/Makefile
new file mode 100644
index 000000000000..0b38dbf98bcd
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/Makefile
@@ -0,0 +1,2 @@
+ox05b1s-objs := ox05b1s_modes.o ox05b1s_mipi.o
+obj-$(CONFIG_VIDEO_OX05B1S) += ox05b1s.o
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
new file mode 100644
index 000000000000..a893c65894f3
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, NXP
+ */
+
+#ifndef OX05B1S_H
+#define OX05B1S_H
+
+#include <linux/types.h>
+
+struct ox05b1s_reg {
+	u32 addr;
+	u32 data;
+};
+
+struct ox05b1s_reglist {
+	struct ox05b1s_reg *regs;
+};
+
+extern struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
+
+#endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
new file mode 100644
index 000000000000..aeea7caa6a15
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -0,0 +1,939 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
+ * Copyright (C) 2024, NXP
+ *
+ * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "ox05b1s.h"
+
+#define OX05B1S_SENS_PAD_SOURCE	0
+#define OX05B1S_SENS_PADS_NUM	1
+
+#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
+#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
+#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
+#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
+#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
+#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
+#define OX05B1S_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OX05B1S_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+
+#define client_to_ox05b1s(client)\
+	container_of(i2c_get_clientdata(client), struct ox05b1s, subdev)
+
+struct ox05b1s_sizes {
+	u32	code;
+	const struct v4l2_area *sizes;
+};
+
+struct ox05b1s_plat_data {
+	char				name[20];
+	u32				chip_id;
+	u32				native_width;
+	u32				native_height;
+	u32				active_top;
+	u32				active_left;
+	u32				active_width;
+	u32				active_height;
+	const struct ox05b1s_mode	*supported_modes;
+	u32				default_mode_index;
+	const struct ox05b1s_sizes	*supported_codes;
+};
+
+struct ox05b1s_ctrls {
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+};
+
+struct ox05b1s_mode {
+	u32 index;
+	u32 width;
+	u32 height;
+	u32 code;
+	u32 bpp;
+	u32 vts; /* default VTS */
+	u32 hts; /* default HTS */
+	u32 exp; /* max exposure */
+	bool h_bin; /* horizontal binning */
+	u32 fps;
+	struct ox05b1s_reglist *reg_data;
+};
+
+/* regulator supplies */
+static const char * const ox05b1s_supply_name[] = {
+	"AVDD",  /* Analog voltage supply, 2.8 volts */
+	"DVDD",  /* Digital I/O voltage supply, 1.8 volts */
+	"DOVDD", /* Digital voltage supply, 1.2 volts */
+};
+
+#define OX05B1S_NUM_SUPPLIES ARRAY_SIZE(ox05b1s_supply_name)
+
+struct ox05b1s {
+	struct i2c_client *i2c_client;
+	struct regmap *regmap;
+	struct gpio_desc *rst_gpio;
+	struct regulator_bulk_data supplies[OX05B1S_NUM_SUPPLIES];
+	struct clk *sensor_clk;
+	const struct ox05b1s_plat_data *model;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[OX05B1S_SENS_PADS_NUM];
+	const struct ox05b1s_mode *mode;
+	struct mutex lock; /* sensor lock */
+	u32 stream_status;
+	struct ox05b1s_ctrls ctrls;
+};
+
+static const struct ox05b1s_mode ox05b1s_supported_modes[] = {
+	{
+		.index		= 0,
+		.width		= 2592,
+		.height		= 1944,
+		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp		= 10,
+		.vts		= 0x850,
+		.hts		= 0x2f0,
+		.exp		= 0x850 - 8,
+		.h_bin		= false,
+		.fps		= 30,
+		.reg_data	= ox05b1s_reglist_2592x1944,
+	}, {
+		/* sentinel */
+	}
+};
+
+/* keep in sync with ox05b1s_supported_modes */
+static const struct v4l2_area ox05b1s_sgrbg10_sizes[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.sizes = ox05b1s_sgrbg10_sizes,
+	}, {
+		/* sentinel */
+	}
+};
+
+static int ox05b1s_power_on(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	int ret = 0;
+
+	ret = regulator_bulk_enable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
+	/* get out of powerdown and reset */
+	gpiod_set_value_cansleep(sensor->rst_gpio, 0);
+
+	ret = clk_prepare_enable(sensor->sensor_clk);
+	if (ret < 0) {
+		dev_err(dev, "Enable sensor clk fail ret=%d\n", ret);
+		goto reg_off;
+	}
+
+	/* with XVCLK@24MHz, t2 = 6ms required delay for ox05b1s before first SCCB transaction */
+	fsleep(6000);
+
+	return ret;
+
+reg_off:
+	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+
+	return ret;
+}
+
+static int ox05b1s_power_off(struct ox05b1s *sensor)
+{
+	gpiod_set_value_cansleep(sensor->rst_gpio, 1);
+
+	/* XVCLK must be active for 512 cycles (0.34 ms at 24MHz) after last SCCB transaction */
+	fsleep(350);
+	clk_disable_unprepare(sensor->sensor_clk);
+
+	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+
+	return 0;
+}
+
+static int ox05b1s_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	return ox05b1s_power_off(sensor);
+}
+
+static int ox05b1s_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	return ox05b1s_power_on(sensor);
+}
+
+#define OX05B1S_MAX_REG_BULK 16
+static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
+				   struct ox05b1s_reg *reg_array)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	struct ox05b1s_reg *table = reg_array;
+	u8 vals[OX05B1S_MAX_REG_BULK];
+	int i;
+	int ret;
+
+	while (table->addr) {
+		for (i = 0; i < OX05B1S_MAX_REG_BULK; i++) {
+			if (table[i].addr != (table[0].addr + i))
+				break;
+			vals[i] = table[i].data;
+		}
+		ret = regmap_bulk_write(sensor->regmap, table->addr, vals, i);
+		if (ret) {
+			dev_err(dev, "Failed to write reg addr=%x, count %d\n", table->addr, i);
+			return ret;
+		}
+		table += i;
+	}
+
+	return 0;
+}
+
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of(ctrl->handler, struct ox05b1s,
+			     ctrls.handler)->subdev;
+}
+
+static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	u32 w = sensor->mode->width;
+	u32 h = sensor->mode->height;
+	int ret = 0;
+
+	/* apply V4L2 controls values only if power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	/* s_ctrl holds sensor lock */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_TIMING_VTS,
+				h + ctrl->val, NULL);
+		break;
+	case V4L2_CID_HBLANK:
+		u32 hts = (sensor->mode->h_bin) ?
+			  w + ctrl->val : (w + ctrl->val) / 2;
+		ret = cci_write(sensor->regmap, OX05B1S_REG_TIMING_HTS,
+				hts, NULL);
+		break;
+	case V4L2_CID_PIXEL_RATE:
+		/* Read-only, but we adjust it based on mode. */
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_GAIN,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ox05b1s_ctrl_ops = {
+	.s_ctrl = ox05b1s_s_ctrl,
+};
+
+/*
+ * MIPI CSI-2 link frequencies.
+ * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
+ */
+static const s64 ox05b1s_csi2_link_freqs[] = {
+	200000000,
+};
+
+/* Link freq for default mode: 1080p RAW10, 4 data lanes 800 Mbps/lane. */
+#define OX05B1S_DEFAULT_LINK_FREQ	0
+
+static int ox05b1s_init_controls(struct ox05b1s *sensor)
+{
+	const struct v4l2_ctrl_ops *ops = &ox05b1s_ctrl_ops;
+	struct ox05b1s_ctrls *ctrls = &sensor->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct device *dev = &sensor->i2c_client->dev;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	v4l2_ctrl_handler_init(hdl, 7);
+
+	/* we can use our own mutex for the ctrl lock */
+	hdl->lock = &sensor->lock;
+
+	/* Clock related controls */
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
+						  V4L2_CID_LINK_FREQ,
+						  ARRAY_SIZE(ox05b1s_csi2_link_freqs) - 1,
+						  OX05B1S_DEFAULT_LINK_FREQ,
+						  ox05b1s_csi2_link_freqs);
+
+	/* mode dependent, actual range set in ox05b1s_update_controls */
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
+					      0, 0, 1, 0);
+
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+					  0, 0, 1, 0);
+
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  0, 0, 1, 0);
+
+	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
+					    0, 0, 1, 0);
+
+	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+					0, 0xFFFF, 1, 0x80);
+
+	if (hdl->error) {
+		ret = hdl->error;
+		goto free_ctrls;
+	}
+
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ret = v4l2_fwnode_device_parse(dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto free_ctrls;
+
+	sensor->subdev.ctrl_handler = hdl;
+	return 0;
+
+free_ctrls:
+	dev_err(dev, "Failed to init controls\n");
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static int ox05b1s_apply_current_mode(struct ox05b1s *sensor);
+
+static int ox05b1s_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	int ret = 0;
+
+	if (enable) {
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
+			return ret;
+		ret = ox05b1s_apply_current_mode(sensor);
+		if (!ret)
+			ret = cci_write(sensor->regmap, OX05B1S_REG_SW_STB, 0x01, NULL);
+	} else {
+		ret = cci_write(sensor->regmap, OX05B1S_REG_SW_STB, 0x00, NULL);
+	}
+
+	sensor->stream_status = enable;
+
+	if (!enable || ret) {
+		pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
+	}
+
+	return 0;
+}
+
+static void ox05b1s_update_pad_format(struct ox05b1s *sensor,
+				      const struct ox05b1s_mode *mode,
+				      struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = mode->code;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int ox05b1s_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct v4l2_mbus_framefmt *format;
+
+	/* Initialize the format. */
+	format = v4l2_subdev_state_get_format(state, 0);
+	ox05b1s_update_pad_format(sensor, &sensor->model->supported_modes[0], format);
+
+	return 0;
+}
+
+static int ox05b1s_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	const struct ox05b1s_sizes *supported_codes = sensor->model->supported_codes;
+	int i = 0;
+
+	while (i++ < code->index && supported_codes->code)
+		supported_codes++;
+	if (!supported_codes->code) /* code->index outside supported_codes[] */
+		return -EINVAL;
+
+	code->code = supported_codes->code;
+
+	return 0;
+}
+
+static int ox05b1s_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	const struct ox05b1s_sizes *supported_codes = sensor->model->supported_codes;
+	const struct v4l2_area *sizes;
+	int i = 0;
+
+	if (fse->pad != 0)
+		return -EINVAL;
+
+	while (supported_codes->code) {
+		if (supported_codes->code == fse->code)
+			break;
+		supported_codes++;
+	}
+
+	if (!supported_codes->code) /* fse->code not in supported_codes[] */
+		return -EINVAL;
+
+	sizes = supported_codes->sizes;
+	while (i++ < fse->index && sizes->width)
+		sizes++;
+	if (!sizes->width) /* fse->index outside sizes[] */
+		return -EINVAL;
+
+	fse->min_width = sizes->width;
+	fse->max_width = fse->min_width;
+	fse->min_height = sizes->height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+/* Update control ranges based on current streaming mode, needs sensor lock */
+static int ox05b1s_update_controls(struct ox05b1s *sensor)
+{
+	int ret;
+	struct device *dev = &sensor->i2c_client->dev;
+	u32 hts = sensor->mode->hts;
+	u32 hblank;
+	u32 vts = sensor->mode->vts;
+	u32 vblank = vts - sensor->mode->height;
+	u32 fps = sensor->mode->fps;
+	u64 pixel_rate = (sensor->mode->h_bin) ? hts * vts * fps : 2 * hts * vts * fps;
+	u32 min_exp = 8;
+	u32 max_exp = vts - 8;
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret) {
+		dev_err(dev, "Modify range for ctrl: pixel_rate %llu-%llu failed\n",
+			pixel_rate, pixel_rate);
+		goto out;
+	}
+
+	if (sensor->mode->h_bin)
+		hblank = hts - sensor->mode->width;
+	else
+		hblank = 2 * hts - sensor->mode->width;
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank,
+				       1, hblank);
+	if (ret) {
+		dev_err(dev, "Modify range for ctrl: hblank %u-%u failed\n",
+			hblank, hblank);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, sensor->ctrls.hblank->default_value);
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, 0, vblank * 4,
+				       1, vblank);
+	if (ret) {
+		dev_err(dev, "Modify range for ctrl: vblank %u-%u failed\n",
+			vblank, vblank);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.vblank->default_value);
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.exposure, min_exp, max_exp,
+				       1, max_exp / 2);
+	if (ret) {
+		dev_err(dev, "Modify range for ctrl: exposure %u-%u failed\n",
+			min_exp, max_exp);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.exposure, sensor->ctrls.exposure->default_value);
+
+out:
+	return ret;
+}
+
+/* needs sensor lock and power on */
+static int ox05b1s_apply_current_mode(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	struct ox05b1s_reglist *reg_data = sensor->mode->reg_data;
+	u32 w = sensor->mode->width;
+	u32 h = sensor->mode->height;
+	int ret = 0;
+
+	cci_write(sensor->regmap, OX05B1S_REG_SW_RST, 0x01, NULL);
+
+	while (reg_data->regs) {
+		ret = ox05b1s_write_reg_array(sensor, reg_data->regs);
+		if (ret)
+			goto out;
+		reg_data++;
+	}
+
+	cci_write(sensor->regmap, OX05B1S_REG_X_OUTPUT_SIZE, w, &ret);
+	cci_write(sensor->regmap, OX05B1S_REG_Y_OUTPUT_SIZE, h, &ret);
+	if (ret)
+		goto out;
+
+	/* setup handler will write actual controls into sensor registers */
+	ret =  __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+
+out:
+	if (ret < 0)
+		dev_err(dev, "Failed to apply mode %dx%d,bpp=%d\n", w, h,
+			sensor->mode->bpp);
+
+	return ret;
+}
+
+/* similar with v4l2_find_nearest_size but filter for mbus code, needs sensor lock */
+static const struct ox05b1s_mode *ox05b1s_nearest_size(const struct ox05b1s_mode *supported_modes,
+						       struct v4l2_subdev_format *fmt)
+{
+	u32 error, min_error = U32_MAX;
+	const struct ox05b1s_mode *best = NULL;
+
+	if (!supported_modes)
+		return NULL;
+
+	for (; supported_modes->width; supported_modes++) {
+		const u32 w = supported_modes->width;
+		const u32 h = supported_modes->height;
+
+		if (supported_modes->code != fmt->format.code)
+			continue;
+
+		error = abs(w - fmt->format.width) + abs(h - fmt->format.height);
+		if (error > min_error)
+			continue;
+
+		min_error = error;
+		best = supported_modes;
+		if (!error)
+			break;
+	}
+
+	return best;
+}
+
+/* get a valid mbus code for the model, either the requested one or the default one */
+static u32 ox05b1s_find_code(const struct ox05b1s_plat_data *model, u32 code)
+{
+	u32 found_code = 0;
+	const struct ox05b1s_sizes *supported_codes = model->supported_codes;
+
+	while (supported_codes->code) {
+		if (supported_codes->code == code) {
+			found_code = code;
+			break;
+		}
+		supported_codes++;
+	}
+
+	if (!supported_codes->code) /* code not in supported_codes[] */
+		found_code = model->supported_codes[model->default_mode_index].code;
+
+	return found_code;
+}
+
+static int ox05b1s_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &sensor->i2c_client->dev;
+	struct v4l2_mbus_framefmt *format;
+	const struct ox05b1s_mode *mode;
+
+	/* if no matching mbus code is found, use the one from the default mode */
+	fmt->format.code = ox05b1s_find_code(sensor->model, fmt->format.code);
+	mode = ox05b1s_nearest_size(sensor->model->supported_modes, fmt);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	*format = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	sensor->mode = mode;
+
+	/* update controls that depend on current mode */
+	ox05b1s_update_controls(sensor);
+
+	dev_dbg(dev, "Set mode index=%d, %d x %d, code=0x%x\n", sensor->mode->index,
+		fmt->format.width, fmt->format.height, fmt->format.code);
+
+	return 0;
+}
+
+static u8 ox05b1s_code2dt(const u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	default:
+		return MIPI_CSI2_DT_RAW10;
+	}
+}
+
+static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	/* get sensor current code*/
+	mutex_lock(&sensor->lock);
+	fd->entry[0].pixelcode = sensor->mode->code;
+	mutex_unlock(&sensor->lock);
+
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = ox05b1s_code2dt(fd->entry[0].pixelcode);
+
+	return 0;
+}
+
+static int ox05b1s_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = sensor->model->native_width;
+		sel->r.height = sensor->model->native_height;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = sensor->model->active_top;
+		sel->r.left = sensor->model->active_left;
+		sel->r.width = sensor->model->active_width;
+		sel->r.height = sensor->model->active_height;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct v4l2_subdev_video_ops ox05b1s_subdev_video_ops = {
+	.s_stream = ox05b1s_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ox05b1s_subdev_pad_ops = {
+	.set_fmt		= ox05b1s_set_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.get_frame_desc		= ox05b1s_get_frame_desc,
+	.enum_mbus_code		= ox05b1s_enum_mbus_code,
+	.enum_frame_size	= ox05b1s_enum_frame_size,
+	.get_selection		= ox05b1s_get_selection,
+};
+
+static const struct v4l2_subdev_ops ox05b1s_subdev_ops = {
+	.video = &ox05b1s_subdev_video_ops,
+	.pad   = &ox05b1s_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ox05b1s_internal_ops = {
+	.init_state = ox05b1s_init_state,
+};
+
+static void ox05b1s_get_gpios(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+
+	sensor->rst_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->rst_gpio))
+		dev_warn(dev, "No sensor reset pin available");
+}
+
+static int ox05b1s_get_regulators(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	unsigned int i;
+
+	for (i = 0; i < OX05B1S_NUM_SUPPLIES; i++)
+		sensor->supplies[i].supply = ox05b1s_supply_name[i];
+
+	return devm_regulator_bulk_get(dev, OX05B1S_NUM_SUPPLIES, sensor->supplies);
+}
+
+static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	u64 chip_id = 0;
+	char *camera_name;
+	int ret = 0;
+
+	ret = cci_read(sensor->regmap, OX05B1S_REG_CHIP_ID, &chip_id, NULL);
+	if (ret) {
+		dev_err(dev, "Camera chip_id read error\n");
+		return -ENODEV;
+	}
+
+	switch (chip_id) {
+	case 0x580542:
+		camera_name = "ox05b1s";
+		break;
+	default:
+		camera_name = "unknown";
+		break;
+	}
+
+	if (chip_id == sensor->model->chip_id) {
+		dev_dbg(dev, "Camera %s detected, chip_id=%llx\n", camera_name, chip_id);
+	} else {
+		dev_err(dev, "Detected %s camera (chip_id=%llx), but expected %s (chip_id=%x)\n",
+			camera_name, chip_id, sensor->model->name, sensor->model->chip_id);
+		ret = -ENODEV;
+	}
+
+	return ret;
+}
+
+static int ox05b1s_probe(struct i2c_client *client)
+{
+	int retval;
+	struct device *dev = &client->dev;
+	struct v4l2_subdev *sd;
+	struct ox05b1s *sensor;
+
+	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return PTR_ERR(sensor->regmap);
+
+	sensor->i2c_client = client;
+
+	sensor->model = of_device_get_match_data(dev);
+
+	ox05b1s_get_gpios(sensor);
+
+	/* Get system clock, xvclk */
+	sensor->sensor_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(sensor->sensor_clk))
+		return dev_err_probe(dev, PTR_ERR(sensor->sensor_clk),
+				     "Failed to get xvclk\n");
+
+	retval = ox05b1s_get_regulators(sensor);
+	if (retval)
+		return dev_err_probe(dev, retval, "Failed to get regulators\n");
+
+	sd = &sensor->subdev;
+	v4l2_i2c_subdev_init(sd, client, &ox05b1s_subdev_ops);
+	sd->internal_ops = &ox05b1s_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->dev = &client->dev;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pads[OX05B1S_SENS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	retval = media_entity_pads_init(&sd->entity, OX05B1S_SENS_PADS_NUM,
+					sensor->pads);
+	if (retval)
+		goto probe_out;
+
+	mutex_init(&sensor->lock);
+
+	retval = ox05b1s_init_controls(sensor);
+	if (retval)
+		goto probe_err_entity_cleanup;
+
+	/* power on manually */
+	retval = ox05b1s_power_on(sensor);
+	if (retval) {
+		dev_err(dev, "Failed to power on\n");
+		goto probe_err_free_ctrls;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+
+	retval = ox05b1s_read_chip_id(sensor);
+	if (retval)
+		goto probe_err_pm_runtime;
+
+	v4l2_i2c_subdev_set_name(sd, client, sensor->model->name, NULL);
+
+	/* Centrally managed subdev active state */
+	sd->state_lock = &sensor->lock;
+	retval = v4l2_subdev_init_finalize(sd);
+	if (retval < 0) {
+		dev_err(dev, "Subdev init error: %d\n", retval);
+		goto probe_err_pm_runtime;
+	}
+
+	retval = v4l2_async_register_subdev_sensor(sd);
+	if (retval < 0) {
+		dev_err(&client->dev, "Async register failed, ret=%d\n", retval);
+		goto probe_err_subdev_cleanup;
+	}
+
+	sensor->mode = &sensor->model->supported_modes[0];
+	ox05b1s_update_controls(sensor);
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+probe_err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+probe_err_pm_runtime:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	ox05b1s_runtime_suspend(dev);
+probe_err_free_ctrls:
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+probe_err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+probe_out:
+	return retval;
+}
+
+static void ox05b1s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &client->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		ox05b1s_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+	mutex_destroy(&sensor->lock);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
+				 ox05b1s_runtime_resume, NULL);
+
+static const struct ox05b1s_plat_data ox05b1s_data = {
+	.name			= "ox05b1s",
+	.chip_id		= 0x580542,
+	.native_width		= 2608, /* 8 dummy + 2592 active pixels + 8 dummy */
+	.native_height		= 1960, /* 8 dummy + 1944 active lines + 8 dummy */
+	.active_top		= 8,
+	.active_left		= 8,
+	.active_width		= 2592,
+	.active_height		= 1944,
+	.supported_modes	= ox05b1s_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= ox05b1s_supported_codes,
+};
+
+static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,ox05b1s",
+		.data = &ox05b1s_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ox05b1s_of_match);
+
+static struct i2c_driver ox05b1s_i2c_driver = {
+	.driver = {
+		.name  = "ox05b1s",
+		.pm = pm_ptr(&ox05b1s_pm_ops),
+		.of_match_table	= ox05b1s_of_match,
+	},
+	.probe	= ox05b1s_probe,
+	.remove = ox05b1s_remove,
+};
+
+module_i2c_driver(ox05b1s_i2c_driver);
+MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
+MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
new file mode 100644
index 000000000000..1f3b822d4482
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Register configurations for all sensor supported modes
+ * Copyright (C) 2024, NXP
+ * Copyright (C) 2024, Omnivision
+ * Copyright (C) 2024, Verisilicon
+ *
+ */
+
+#include "ox05b1s.h"
+
+/*
+ * Register configuration for Omnivision OX05B1S raw camera
+ * 2592X1944_30FPS_FULL_RGBIr 2592 1944
+ */
+struct ox05b1s_reg ovx5b_init_setting_2592x1944[] = {
+	{ 0x0107, 0x01 },
+	{ 0x0307, 0x02 },
+	{ 0x034a, 0x05 },
+	{ 0x040b, 0x5c },
+	{ 0x040c, 0xcd },
+	{ 0x3009, 0x2e },
+	{ 0x3219, 0x08 },
+	{ 0x3684, 0x6d },
+	{ 0x3685, 0x6d },
+	{ 0x3686, 0x6d },
+	{ 0x3687, 0x6d },
+	{ 0x368c, 0x07 },
+	{ 0x368d, 0x07 },
+	{ 0x368e, 0x07 },
+	{ 0x368f, 0x00 },
+	{ 0x3690, 0x04 },
+	{ 0x3691, 0x04 },
+	{ 0x3692, 0x04 },
+	{ 0x3693, 0x04 },
+	{ 0x3698, 0x00 },
+	{ 0x36a0, 0x05 },
+	{ 0x36a2, 0x16 },
+	{ 0x36a3, 0x03 },
+	{ 0x36a4, 0x07 },
+	{ 0x36a5, 0x24 },
+	{ 0x36e3, 0x09 },
+	{ 0x3702, 0x0a },
+	{ 0x3821, 0x04 }, /* mirror */
+	{ 0x3822, 0x10 },
+	{ 0x382b, 0x03 },
+	{ 0x3866, 0x10 },
+	{ 0x386c, 0x46 },
+	{ 0x386d, 0x08 },
+	{ 0x386e, 0x7b },
+	{ 0x4802, 0x00 },
+	{ 0x481b, 0x3c },
+	{ 0x4837, 0x19 },
+	{ /* sentinel*/ },
+};
+
+struct ox05b1s_reglist ox05b1s_reglist_2592x1944[] = {
+	{
+		.regs = ovx5b_init_setting_2592x1944
+	}, {
+		/* sentinel */
+	}
+};
-- 
2.25.1


