Return-Path: <linux-media+bounces-25232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B2A1ADCA
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 01:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91EBA16BCF7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 00:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63C579C8;
	Fri, 24 Jan 2025 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HfSs6oyi"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB4217E0;
	Fri, 24 Jan 2025 00:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677609; cv=fail; b=br55PL6XNPwNXfKNxIvkhIdm0QtXJ6PRaTmGhb6f40CEVxSGuJtTpQWTebaPoaaPopTGgGeFH365Fs3mwjMJzUm6sVmHbiT79PKegclxVlW5OOrbaHfG1/Or+8DyeGZdHh4JOuKO51aLUxfXmgZnxO/z9givacLiYX87X3osr+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677609; c=relaxed/simple;
	bh=udWy57/yMikxTbEDtQZa9hSzVL7eG4ZLgsYkg5p5NDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sWBG1WSZJrU97pTmfpbX+qyz/LGGa3cu5ZVXDJO8jX/yyIl/5ieEwjDfkttovGAReCmH6hL+pdjwdkQqajiZWJyUGez8ZSYMbobhyNFJQSnXyjfP5zHtTN2hZxmO8tQ9fGXYNooWvxwYSrRYpyAcOfCKLj2YnPdixrpVrZUh5nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HfSs6oyi; arc=fail smtp.client-ip=40.107.247.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpNgUEyGgtWGKJiXIpDeG1tiXVfUKsiHBziaAFzaqYGv0uJsssGgWhlU1edYAHr2MWNLgNsIygBI5nVy1WLuMdNh9vixHXlPBps+pb0zQJBlpW1sxE41JsjKzE/feSWWtUsUmsZYUqmfFkl5CIQ3VfS0rLZzc/p7y54DZcETTVXVRTSN/Q5UbL3CA4hddQEP5tDgVAGaq1bfwg4QTr9PTcP6BtDqC/GFX6DqU4/wMkAVze6bOg4EWB8TM1mlslfATyC/YD2OAtz+aTxNoeLzMiCURFzuvpAu2otyyyDUA5vPMrr1GvGdRic07UFk3BRp8fpx/5Qt0eBXif0h2tmj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHIWasp8SiOZ3zxQuGXMl3OkhBt6p7Hcw2aqnzjd1Fo=;
 b=M2KS5U+DLNVkOfCIg7vjRbgWhYTKgNev2k3vfNbhe8PBmmSx5i1wgxZt1UbDCeYWe0tnA094PfHaeyMdEUPjTE+GxsPzKQoS2kSeGzQJD/NL+ngGke5bPUOskJKNolvZX/rz/5L4ZEdddiqpp9403jG2Qvh5TWo3Wd+EAXJJ5T28J/KFFu3ffIeCeUZIHyqkZFmeJPO/IXp9kEisMKzvLeZIrKydbeB0YBNmMJMgURO3QjxBgvBsRr5RCUl783TDNMxjuQSswnKehrRroG8gHwvS0GkivJfhjieD4jHrctZObmxXMCj3+MuQjHLKmBUbMMbWW/TGdXD6+0uNtoCTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHIWasp8SiOZ3zxQuGXMl3OkhBt6p7Hcw2aqnzjd1Fo=;
 b=HfSs6oyi0x9B3XsxAzzEY1pm9J+3nILxCq4wlk1fsE857rEKBIUqmL03arKWP76UgdWGr2wVSL4AoJOG5KZk5Usu5QweuQRNO5rxk0137PqBVezgap88l8zfecCVp0UOs5zVqabOeL7yh7pLpWq51kUerD570Uj8U5uAx16M5bk1Y1fwgjRia9MUBwsQt/M0AcrDNqHzepzZjEKl/GJGcvfMF68yMzWSxAUvouXKWcPHwvVFBlRneqW4DELgt3vU/LxQnBo87Jiuh7ZwSInbTUSdJD7Kna+sEABiw1ToKQ7BpR8MLy1Obn0D1XRye/EjTsukXZcoZQgEgf5TSz8/gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 00:13:23 +0000
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01]) by PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 00:13:23 +0000
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
Subject: [PATCH v3 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Date: Fri, 24 Jan 2025 02:12:40 +0200
Message-Id: <20250124001243.446511-2-mirela.rabulea@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 696673b4-8b68-46ab-ad33-08dd3c0bea58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AkOBAYo5xFg45XM6Q1i8lmjaGh4fmVHPMHGeEHfp4eD+iK1qTw21U/iYum4Y?=
 =?us-ascii?Q?v/UQZNQeGxS20eLWr+6NEpIejBxF+JaTCvLFm1YRacVIHr030kaFNon0bsk4?=
 =?us-ascii?Q?slAGDhs3U+5f8ynQK1CRq7Q6SgOVCMuZGyY5rPb3qI5h3ED/DeBxidLv5BCt?=
 =?us-ascii?Q?Xbln4jIfOSZCQvTQn7HclA4s2rpvZFHvfEVxhgo09RYWVC9eDolMVtqV+M1F?=
 =?us-ascii?Q?6lxUuNmFe0oNQ14Jea0arjRAC4g0ixOjkyJ5PS/E7Umad14AOxN+j9NtkYd3?=
 =?us-ascii?Q?N/lrlnjG8eB2WnK+Vm0zm0hd7qCZvG5Pgij5R1CPfQmmL1snyqSyrxgWKSDJ?=
 =?us-ascii?Q?6CLaTwVKCoc5Xb5T/K4OLU3rNYa2aHYhXeoLI6DVwffJq80wDotvt8DJsv/V?=
 =?us-ascii?Q?2LAHc+HZmGxisYY9t4yiQbS0bNjaCi8id+c+9kOggLJxNIxTycwFwORyiGN5?=
 =?us-ascii?Q?4tbUPo+mjNXylKV8pV3b1cZr0qSP3QWATYz8eS57fMhxWqzPxIx5ULTpVXwl?=
 =?us-ascii?Q?KjyD9OqAlyV54wsqTeL9EowATJwicviq9GWDPhJUvnc/OtuF3tZRUUNrvHUB?=
 =?us-ascii?Q?DJARXqTDhSPtJZpskGjXsEQ34hlVVAjBUFyo1dpUUx6VSaiR/yKJSnKkvJjL?=
 =?us-ascii?Q?bNmLFKyidmcUULIKfNCo0lPF+Y+P2xBjAvHWKMVThgddGfRPG6sDEzi0KAAG?=
 =?us-ascii?Q?a3ckRu5jfZIv18StrRJQXfMYNi1iW9Vjtb9oORPstjjVIfoFIhtEm6Rhhb00?=
 =?us-ascii?Q?Hzx33Ca4OOEVG8dRu/9tGHNhQJkamULjAxx41teImxrWixr9RwpHmQm2w5mM?=
 =?us-ascii?Q?UAhgC2Q1EopQHDz4GCkMmoGtJRJ5xOh9vEjfvJSqkf7PsgvZzyfap4JpDd73?=
 =?us-ascii?Q?YV31ppOdR1uoZ/pQxfBKhjsABGlKmWMVYRfvjaWvfSnilLszWxRbWVVf8wu6?=
 =?us-ascii?Q?Iq4cuadSNmnFecCFpf2aiv8MT0iAgrCQ4cEce+pz/TQq3WqljRYujbYjp+L1?=
 =?us-ascii?Q?Tqv81anIVcxJdqRhGXguEnuZ/sOXCCnWFT5EdhxTk4Wmksz2IlJemeAP8mJ4?=
 =?us-ascii?Q?4dfPCKTEd6B6xAuyqWKG2NnA8/p3LXoxs9VNaIcY4H6faY2ge7T2nUMGorel?=
 =?us-ascii?Q?7U8dAPUqcKVQ0v4SM3EYix1rUSp/9PoGP9niqIyY5+rQR08QwBWgXfIh1coN?=
 =?us-ascii?Q?QC58X3E2Ntjt+Vzc7TL9mDQGfu1jBf9psLPZmiwnTDOnV1BJr4xhEcXxJDZ5?=
 =?us-ascii?Q?DjmgfW02dgMSJZz0cCoJNz1R7n8pJtso72KRlo/WXXjaEIn8xYRyo8c2kjcv?=
 =?us-ascii?Q?hlOEKfJ6mCYG513zcv9Q0yDMaxvavuw/OuGSmC+FiR1yUZFi4VkZvbrc/6Su?=
 =?us-ascii?Q?nsEyFLSovw5WkQw14RVW7baikMqY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9231.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lFy5yV06xwsK9WXL+oy8kKTGPKw7UXossRoIyBRbUuzgpg4jT9V9v5YZ6cRY?=
 =?us-ascii?Q?UpwTpvIzwY4cGqjmaOhNOKLx0dcjzqtZw3lTvbXWpT3osdKeipVC2vRZQz9y?=
 =?us-ascii?Q?bq4KXOmdgUYxTLuvDKJG8z9HDeJr4oEpuELNBiRVEXExOkV7mwcZ2HXDYIEl?=
 =?us-ascii?Q?mNN8HHMCG2Nmnffi7NSaLPrrrIo9qvegzZoC19dhxKRXk+2Q81iGP569H0p9?=
 =?us-ascii?Q?5/ml8ggnkS0qI98Pi8536/yP5JE338cF5FsBaZOYhzarZjmYmi25TQqBvgea?=
 =?us-ascii?Q?8bAKhVBV0tiNnqWB9t/mYwPRPXxNFEO0TiqE4+RYcx0AkVrr/EKhoT3aKX47?=
 =?us-ascii?Q?PTJmg3Uln7MGZPD9i5rwRMVDJfhMTbLN9UNLqU2WH+x4KDcnGWuVACOkTgpT?=
 =?us-ascii?Q?fyV+MVWop1Rg9moidU0M1o97z+vAVJnAqi3pgSfo6kmEhNUFm7kw42NKe1UE?=
 =?us-ascii?Q?MdodNZ+uB9t9xIQMvg9gTGFhfNdw1uVKJGuQNVudYj+nh4etcD9GfNGRcqPN?=
 =?us-ascii?Q?0bee41HIMivW/xMU9AfZZ2CiA7NrT01gaGglyqDA5r9xgOwWKF/4IntlOpZR?=
 =?us-ascii?Q?iCWJyG3wUtKSwo4kboT0sebOJ4GbZpKSFb9TBY28Yw8XLrIB9p4yga3pBiz/?=
 =?us-ascii?Q?opHoUW+fEjpEW4W+f6CyLA8qMJXYHMrj8s38iaw1bdGZkU6xQTShtjlmPP/t?=
 =?us-ascii?Q?mZwVopSRdzDuzwyQcWVWHFUACcQnvd31Red53GE78hXzT8x7l++NHfLS7k3/?=
 =?us-ascii?Q?ersomdcgyQmvppd5GR0rx5x+U7fkSeEH0P71jJwVgN8kQBbwVCXk8MiNV/aQ?=
 =?us-ascii?Q?5ED/nk8ANJNSYMKgFXuuQ/DJJ/2/TnEyDiOi9QWaIKxMyJJ8yQ+rVv1kBtku?=
 =?us-ascii?Q?m5YhYyHM5l4trpiXpWytpO6QfDJBb4YrUdXz4wM6iZ4ZbxMnGo6JyW6SjHV6?=
 =?us-ascii?Q?SRIxYF/6Gx0u72+jkpj0McyvbkK7zIk1+doUsCzdyL3efSBLAIFiWhBKFKu2?=
 =?us-ascii?Q?FpdZvHU/yW3e41qzJsaRJkTBn0SnPODZ5TBK1MiNTKu0myCfVaOtkGk/NkSE?=
 =?us-ascii?Q?SD3ZzWOn3RdyAwNBQrqrc8T56p9C1IddNMRhuHI3tDbc0rTaMnSu271nFQgp?=
 =?us-ascii?Q?ZED6yrEWKrKZvbOT0ATnmP9/zwZX0plQuOP3QPSfWNAzz0JP/4ktnOPEBxCQ?=
 =?us-ascii?Q?EeCbcPptyMxvrzu/E1X07nr4jewKKPIlQv1EI0eB+M3W1haDQM6rCMu/EzqJ?=
 =?us-ascii?Q?URb0Zsd1q0OjVsMp86YTuCDlaxoKjjIpx1uJEfn6p2umJFIp71YeYRGrdA+h?=
 =?us-ascii?Q?TK4eocv3KpCxSbAEKhhi1unr0JZJD2q5m3mscKfqXu8ldZpuwvVcsQGN0MGm?=
 =?us-ascii?Q?WvaScEJdD8YabvAefx1qbd7HoSsu8kcpGmuDhD3YKpf2lxI2eA0LGGpmINDF?=
 =?us-ascii?Q?FC/pgwY8FxGJ752zpjTar8xqisBDq8laPqWRK81Tp1rcE9wdrDaRf8ZkXyJS?=
 =?us-ascii?Q?+KOzMFfBTf6UjnqTqJKRdcX1CbEoF3RgMmgg2yC92Mqf1vWndumFYITBRSFw?=
 =?us-ascii?Q?d796RdhLTt0/0cW+32pmBIIcw3kadvIRTTQWp0uCkX55k+3r7qzd92Exv50h?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696673b4-8b68-46ab-ad33-08dd3c0bea58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9231.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 00:13:23.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6iJ3yP16u61jWA454hbMKmBeHzJceJv8RzgVzUCTDe0GuAt+AzEVDQsm+ZyFuEjnD1nNL/5hMN93mu3jLTDqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

Add bindings for Omnivision OX05B1S sensor.
Also add compatible for Omnivision OS08A20 sensor.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v3:
	Use unevaluatedProperties: false and drop orientation/rotation
	Drop items and keep alphabetical order in compatible property
	Shorten the description for reset_gpio
	Make the supplies required.
	Use generic node name (camera instead of ox05b1s)

Changes in v2:
	Small updates on description
	Update subject, drop "bindings" and "driver"
	Just one binding patch (squash os08a20 bindings)
	Re-flow to 80 columns.
	Drop clock name (not needed in case of single clock)
	Make the clock required property, strictly from sensor module point of view, it is mandatory (will use a fixed clock for nxp board)
	Add regulators: avdd, dvdd, dovdd
	Add $ref: /schemas/media/video-interface-devices.yaml
	Drop assigned-clock* properties (defined in clocks.yaml)
	Keep "additionalProperties : false" and orientation/rotation (unevaluatedProperties: false was suggested, but only orientation/rotation are needed from video-interface-devices.yaml)
	Include assigned-clock* in the example, for completeness sake (although it was also suggested to omit them)

 .../bindings/media/i2c/ovti,ox05b1s.yaml      | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
new file mode 100644
index 000000000000..9f35b4e67bea
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OX05B1S Image Sensor
+
+maintainers:
+  - Mirela Rabulea <mirela.rabulea@nxp.com>
+
+description:
+  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active
+  array size of 2592 x 1944. It is programmable through I2C interface.
+  Image data is available via MIPI CSI-2 serial data output.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ovti,os08a20
+      - ovti,ox05b1s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (24 MHz)
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low XSHUTDOWN pin
+    maxItems: 1
+
+  avdd-supply:
+    description: Power for analog circuit (2.8V)
+
+  dovdd-supply:
+    description: Power for I/O circuit (1.8V)
+
+  dvdd-supply:
+    description: Power for digital circuit (1.2V)
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: MIPI CSI-2 transmitter port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+        required:
+          - data-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ovti,ox05b1s";
+            reg = <0x36>;
+            clocks = <&ox05b1s_clk>;
+
+            assigned-clocks = <&ox05b1s_clk>;
+            assigned-clock-parents = <&ox05b1s_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&camera_avdd_2v8>;
+            dovdd-supply = <&camera_dovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v2>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            port {
+                ox05b1s_mipi_0_ep: endpoint {
+                    remote-endpoint = <&mipi_csi0_ep>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+        };
+    };
+...
-- 
2.25.1


