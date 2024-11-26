Return-Path: <linux-media+bounces-22088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BFC9D9AC8
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1106B2675F
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 15:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409A81D90AE;
	Tue, 26 Nov 2024 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bgRLAXbf"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700CE1D5CEE;
	Tue, 26 Nov 2024 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732636410; cv=fail; b=sJPk957inka1KSoxQrTXcdKWwE8BydwRP4r4TXAwR3IZCIt+uV607/7Rq5DSWhX3OGJ8NTI/jMqFp2wzQ+PyA6TU78tevNCvMvIzFppx1eQjospJlLfrV3O4OMtR1H6JuRA1mZ8erlG0m3+TxUlnLCFQMf1d17bnAL6ourBVR1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732636410; c=relaxed/simple;
	bh=jxdypJg2IwFUFYK/uBtQkxbkFBgiVCm0T3Wq9mC6Ruk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=E8dRqTkbZKtuC5YzlZZT782jd5s+r9U49RjVzpZFap1kwifs15cRAAKId/1UeAAGslVc3Mn9XfsiZwHR6o4/k775YhFppTQC0kKWPbxiOSyfuDBdsdibq7IZ48pdG2xwH4vCraUnttSc7VXsv9GlJ23CMKfbStQqwBG7wNNA5Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bgRLAXbf; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6Gk6VQqjGzFVra0DCctEEbXz9AJRvQKBt3GObvQAC6IS8cGl68KZOJ8d20yg6eQaSeUXN67kmMRmWX5ztemZfjAm2rzFEiBWz6KsGxzrPq/LjZwpN0j/uTfz0A8CCksRmevvjUXGzFhBKDuZigWDXFkoiy6F3lEwSBQOlCvx0UlfKlqCQLkBm38ayp47KNu2DUv22s9uqEHANpYMzgdkhNV3cDUKNALleO9ZgVRiaMTRd3CC+/8xcwZhlys6viS8MAbtQDHPHE3aXvk7cupnxQe4unz1sdBA/4N9n+tbbqR5TYmQLkrWv1htHStk8K/zE73aHNVwHeC0scnEFa5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+7hlmEwKifd8VXFmUxC/M4gH6P4uNMZqA0gnstUn/c=;
 b=nNPAB8Q9ueLecmsY7nxUhsnKLLiYFTpMiZFoEFbb6I7M4BFJnYAWLQnjWiePb1aUQRwx0m4k5rXMe7KEa+JvViMIfO4/1kaR05NTs4NxYYHjirz11mmB4meCn37nASYq7N3/PFinUHIWTeurvzJF02bP/0jT20evraAwbxIW5SJb15JUlnpCaUGn3bjL6ZuG6oJUrKzq8yxG2v+1wKUstI94i1Oxxx0sOSS+AgMRPNLknAANwJorwVMkVbXiHwrQrwYggMTsdd/ByMH8Bj++wKyo/VnpAlLKMSKFf52pWYOWXUtRQ8NiXdPv5AOEsDLo8Nxf3LXXgAyYV2FO984XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+7hlmEwKifd8VXFmUxC/M4gH6P4uNMZqA0gnstUn/c=;
 b=bgRLAXbfttClkML06ocCGeAFS3B6VeAuupIWHBXNc9tHcN8e9TjCuGFPfvPDMESNEhK4PRnGvGqc8OzpM9ZI3twZnbd2sZWxVmcYO98C9ctjXlyVuna8P+z9bD41d4rw60JlBF2jtsCpJ8nz8NZb9kkv5m+frdErUu9C7TB4cMQ/tCqCDIAFDBV6Sot2YiUGv9dNeJA4/FESP3m2YO2YZxsKdvZlXdzk2M3vC7LR3YHZ4OzaPkZ7IosEw37w0maO9Zrm/OQ4bLgpZC3oC02aOm6Fhccsr418lYZ2Fdz6OYLD1n8WYFWXmScIfXTmqfugPqAI7e8Lf9VjoJ3X3Hg+Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8485.eurprd04.prod.outlook.com (2603:10a6:20b:418::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 15:53:23 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 15:53:23 +0000
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
Subject: [PATCH v2 0/4] media: i2c: Add OX05B1S camera sensor driver
Date: Tue, 26 Nov 2024 17:50:56 +0200
Message-Id: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3d7cbc-67fd-42b9-0d50-08dd0e327551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dyhiJ8uYHIlhT3Jvj+U8lLbsg7f5UthIMMcf8Kt+pH/EnL2za2ScBV1axzoS?=
 =?us-ascii?Q?sZzlZQQngTDUtGejnGFUYtQ2/kXuAwgeSe6mXPlR50USyILXTB4mkeqTKq5r?=
 =?us-ascii?Q?N4cOPUC7mBM3aktqPsvcm5F/XEFs655rLgA9vFj8V0/GmPPl6UTxAtaPkwVE?=
 =?us-ascii?Q?MlIAYUZ5RfztgjQhWFQukEDY1pEgEHBnIp0Gi8JELXXdEBTV1Pp3QdiqPGlQ?=
 =?us-ascii?Q?jLvuiOhKBdYS9dD8ap2LCtUXjT3J82nXKvWWWsRMVNcGkpYkMtejTrpI0Y/U?=
 =?us-ascii?Q?TLgIFf0MTQYfkTswaWenbLh6ZghNRELWzqn4jZt57RszzSGtGCJITj4xT0Bt?=
 =?us-ascii?Q?zkL+YgdgO/XnICk2tTgLnSMzbARtY6IUAOJS2hryT7E8nfl5uSBlAcFeeawV?=
 =?us-ascii?Q?VPcJUg3ovdriilNPYWhZBez7SXPCvyHOatOm9yg3d+4DpyNUaFwDroYcXq1d?=
 =?us-ascii?Q?e39H+0AqAu9WjVqZ7tix0Qhi9Oz5o8trh4gnBmVHGXB+ucK22WQXHPe3Uv0T?=
 =?us-ascii?Q?b9qvgzIJ6n1RO3n0oRpL074LeR03pxJRS+44DqXpHSphr0ih0KmvdAyXh7tP?=
 =?us-ascii?Q?LpFMzGaoEGYlZURvjZccNGAKH7AeCZAIaAs8A30PMM0d/W1/iHuqEmIwkw0L?=
 =?us-ascii?Q?/ImVe+Y7EwQ5nPNznxbXAxfgmvsye8FwlOwpNxmqNEDF2WM9h03OB9Hz9zWh?=
 =?us-ascii?Q?XZx/6l9CrqhUPSCxcDalBVz7rIXM8LJKVxK1xUNqcAGgP/7iyvY8pfHCxMMQ?=
 =?us-ascii?Q?zWjqQS91+2VWOvc1UkdokaBKE8c/y4MN2Q+4MPz4GvXq3dPGwtrUBWYFPx7C?=
 =?us-ascii?Q?EuDKcUg/qgn7FTQChXopHGPK4XjqYMlMd5VLBaFKXeXsZ5Swcdsp5k3NOjyq?=
 =?us-ascii?Q?EPuCmxRLZstHGqKva23xDGHtIAXCSGpDXOTD1g9suw30a25wzPN1nLlgGBPf?=
 =?us-ascii?Q?eiiTBa2bxvO9FNqZN2cqWU5zLqIYohI2GQ1vGQIUBFbaZmrZNhqrBA+/rqyM?=
 =?us-ascii?Q?UxKSKMj5ndlEYBI5faxF33/q2Jtj+9dK/zqvDxpueFF49/SMcJeFsX3pjA/e?=
 =?us-ascii?Q?w8qquX9YBgb80Wwe0hM4wpbw0hr5In6igRqMW3ZxcLqEllFP7RARrbBHN+hp?=
 =?us-ascii?Q?oYza0zqYaMYNISrGXx6usPJrFw0mnRc1C/RyIR2XEuYUrPD8Cb+gHl23D7Wc?=
 =?us-ascii?Q?g3TMxrLE+6zwicMdnDtMchBlOEU/KCVV8jMFK+YAXiG+RJrb3tIgODDZBcut?=
 =?us-ascii?Q?Mg7fWpz8FmFRia+Ba1LpZDcIY2FpgqjO9BtnEMhuDFOLl+5esRHuxQAhrigo?=
 =?us-ascii?Q?qKY7xPB0HwO7JoKf5SkiPloCGSX5+vTOMULZBqz3nL24/Ah0ME9Hm0Vy4TMh?=
 =?us-ascii?Q?UTVF6Rif0T5jnRApX+ytL5ggrYPk6JCwe15QW3tuwdmiLPOvXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EX5Of9MbK0GUHxMAYV9MsZiDGoFNj4fe3i1B4FvifH9NGL6qhpRzEy3RFbU8?=
 =?us-ascii?Q?n5C2URqnUoq/I/gxJOjB0axWVvBWdtT4hGbK22Yw3dNs9cdW4Vm6aCqfHIfL?=
 =?us-ascii?Q?GmWkSYqDCeiK7LJiSFiQPH8oLH+FUNuAnx6PM0OlWDJsSL2dFlKk5XyCuhrS?=
 =?us-ascii?Q?G0mhp3o/NtfIcyfESf2L5uU8G+BdoLve/MOGZ36OaFIRjbVZIIcZXx7XGawB?=
 =?us-ascii?Q?4Ijcq3JN4m96vb/t5Cjv06kzO5W4/xhK13drbKCX1bBggK1yNnNZeaaAD98R?=
 =?us-ascii?Q?ys7/NW/MWnZpEH8o8cU1H20MWUO0Kr6XH8gio5MyiyMKHZaG3vqpgy3e6tM3?=
 =?us-ascii?Q?bl74Tc2LcdUGTYxryQo0dItbsbTXaFqYRU4QUwWlSNj2wMcp3mVhG8WYjdut?=
 =?us-ascii?Q?+GRxy69Ht/rVphivvCRHRgLmK1ieNuDymz3j+7q+ejLVVhCEOBG9FGx47kcr?=
 =?us-ascii?Q?Qj6UAsQroqlZO9XrU9ii8iWf9n7DTa6RHo9yHynPofowTawij5Ju7/TXRLEe?=
 =?us-ascii?Q?1U2D5bv2+cK+uPXxBihAbqFp9wlNjM6l5HMDQmDG7D4EQkgcJyvCXlCdG00N?=
 =?us-ascii?Q?sLX5b5rPYBYX72wI5awCWFPfcl1cb3G1exPR8ptVGdJf9eqLZY/ZyE8SlEc4?=
 =?us-ascii?Q?+8jwbN0s0RgaxQMsmt24mDXq2FeC6XXVwOPEF/rJw4GWznrvVpeUIT39yuTN?=
 =?us-ascii?Q?BDpZYS6Ild2CY4mDx09ziPzk98oU9Jcs/0f6JbB4mRVVx//le3yKjKH0uCRe?=
 =?us-ascii?Q?SmNbxSYStuSc7lTtZUk+UkeMvTFFQEnee+TDESrkwEDYbtFSeR4x2vsLBZWm?=
 =?us-ascii?Q?cVdDn3mlJ7YP5GJNDr7P0ynW8st/iRW4BRChP+as786urU2MVYRVOW476deH?=
 =?us-ascii?Q?pK3hdxf/d6nlKzY3nVkqbSV8kjScggnFmCQ8dS43foZzZuHoX937Nx+nSt8k?=
 =?us-ascii?Q?N3EUxcV0QeCaLtasfk1qr23xhKBehL/CM9Exx3qj9G6GBO+6UrMbHG8Dx5oj?=
 =?us-ascii?Q?Y/y8AEJZR/PkRcdGypvsmeIR8AnvlicIEyruitRs56C4mdnEQL1ZT2tsxArr?=
 =?us-ascii?Q?4d/TqBTrlDKaWVtLVgihjAm2LsojdAzJKjGzxbNCYrpfwURAEsuBd5p8TlsY?=
 =?us-ascii?Q?9FtjS57Tpb09MRPjT4tknZ6i+61ll+WGffn5vIdOySkbVyjSF66m6M9W4/PU?=
 =?us-ascii?Q?0c9fpTrVUZQWfGovvob/qODDylptYlVCv0/M4Hx808cXmXVkzVpok2ISIoJ/?=
 =?us-ascii?Q?TNC3rPV8pnkOdXI1D4TPFYRv9A3TKDjJnTyLHR/8CGiaGCQNpcBaVioeE9EG?=
 =?us-ascii?Q?scG50oilHJSV9ZTVdNw41NOGaQ2/KI+ww507Ov8Im3rp+/E8df7J/lQ48/nY?=
 =?us-ascii?Q?U6DEgT4J4l1YG5bxpbPKvFDbas2hpE7ZN06WpAYvEzkeyoUhnIDbDeNSQ3Tt?=
 =?us-ascii?Q?T9d8Ba2GWPEGYOEzu6H03NhOetQ3tDHCYcHetvgx6gKb7zdVylCgtc00Nm0r?=
 =?us-ascii?Q?XOwfnJkOQjOpHpvLYQ6YWKBzw1P4V/QcovwagOm22ZOk9y+GuZMAV/0GQrBL?=
 =?us-ascii?Q?e5q7ibLi2Sw39ZOQ0xivmygB+K0GeiOiW1Hzf7pSRf1hIfVJ4uxzX9GavEyf?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3d7cbc-67fd-42b9-0d50-08dd0e327551
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 15:53:23.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajwkkAZKSGfwzcDwcYZRq6bJFG6d7V7tWB4a9EoV/aXylGD/OOx64v+jmWpNE/poe3j7p3oDn/fa6EP0CtJOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8485

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size
of 2592 x 1944.
    
The following features are supported for OX05B1S:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution:
   - 2592 x 1944 @ 30fps (SGRBG10)

Support for another sensor, OS08A20, is added as a separate patch, using another compatible.
For OS08a20, HDR mode control is supported, with one HDR mode: staggered HDR with 2 exposures on separate virtual channels.
Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)

The driver was tested on upstream 6.12-rc7 on imx8mp-evk, but also on nxp tree based on 6.11-rc7 on imx95-19x19-evk.

The results of v4l2-compliance test:

root@imx8mpevk:/unit_tests# ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5251, 64 bits, 64-bit time_t
v4l2-compliance SHA: 2e7492386e6e 2024-10-03 13:49:10

Compliance test for mxc-isi device /dev/video0:

Driver Info:
	Driver name      : mxc-isi
	Card type        : mxc-isi-cap
	Bus info         : platform:32e00000.isi
	Driver version   : 6.12.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mxc-isi
	Model            : FSL Capture Media Device
	Serial           : 
	Bus info         : platform:32e00000.isi
	Media version    : 6.12.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.12.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mxc_isi.0.capture
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Sink
	  Link 0x0200000e: from remote pad 0x1000009 of entity 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mxc-isi device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0



Mirela Rabulea (4):
  dt-bindings: media: i2c: Add OX05B1S sensor
  media: ox05b1s: Add omnivision OX05B1S raw sensor driver
  MAINTAINERS: Add entry for OX05B1S sensor driver
  media: ox05b1s: Add support for Omnivision OS08A20 raw sensor

 .../bindings/media/i2c/ovti,ox05b1s.yaml      |  121 ++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ox05b1s/Kconfig             |   10 +
 drivers/media/i2c/ox05b1s/Makefile            |    2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h           |   26 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 1197 +++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c     | 1497 +++++++++++++++++
 9 files changed, 2865 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

-- 
2.25.1


