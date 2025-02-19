Return-Path: <linux-media+bounces-26350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A5A3BB74
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C473ABE00
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC9C1E32A2;
	Wed, 19 Feb 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="bb/mEnlt"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2125.outbound.protection.outlook.com [40.107.20.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B31E1A28;
	Wed, 19 Feb 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960220; cv=fail; b=s/jkFZCP8ONgpR4ca7haNwdzKR+aY4W7HbfWHBlpSGlVQWJs4JY01kF+my3Sj+i2V1KKpBz+KXjyqmpmT0wE/yVpRCzWYONzrJJyNHbV+fFLM6PwGG0D7KfjZpLjlVgAam5I7TLtshtWH2bwcshJyJKK35YJmg67kGDz0aAVa5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960220; c=relaxed/simple;
	bh=Xo9R1USL/z+d4IAQ/+r4od9eFDQsy0jh6o64qDS6lhQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DPGQ8Z7EpPl1wXh4tZuYZ/0oKXq5Bw7jCCatF9IaKgiDYt4F3K0cRghRFzj0UJbrcMaVFCpmz2jeAF2lENyGvfrVEq7t/92nClLxA8m7bkcWZEa5T34evWVJvANzOpEC74O0lf3SiAqNV8V7MbADri++lvvL7wQFJ31BsHcUpLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=bb/mEnlt; arc=fail smtp.client-ip=40.107.20.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PW61TxOdOs6l0M9ItN8E2EjWOr5neMj/i5W97M8Jz+ro9Ne7bgxO67Derqex4JDXk1est4yy+hnLFu2ZneZUagDbtDclKjaU4BI/fjuLpNn+RHRir+LmmVb/k8Fq2qsLc4mp8tDH7uDqfqHtRAy5ZjRdNtvOgIj9begotrb03pS27F45yHIsgDBXQmFhmj+efcopnRCCzWIayp0dHfekoyfXn9KixsXkz3lTGCMmlbPuxu9KCcnsjXzJ7t3cSL/m6Nc9cMzLymtqwkBQeuH/8K58UgOpWta19BTh/7Zqpdb9hfqxmyd8HQq4fBef/8Ty1MUCnx0qlT4JhDEHMuai3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HthD4IvHLA6stKJScMCSkGvaVS45odtvgDWcqH1Zbs=;
 b=QQUYE6+Bdrc3MIYr4isbT8F804wFELqoPBa/Y4Vt1PL8vKC1GQphAuxauoGlVF5WP3VyCAycgBajQqhbcruLYuZ1VyYpAtQG+pB0XiILZ23ER25hHIcScW8v5gPnFlBu1nRrRu5dtG2HIRFdnsmBTUo5YFN5OwAym/UubTjoR2C1mqmmAQcW3lJEwE/zGTuehKGVctrfMqyqrr/G4snSKM7vyVSfpqXhyt0o5W8vx8FXamyiA7GrKTjGXblWI/eC/n9J9/nzzYk/hxLj4749NOBMgd1X9ta6DqF9uo+HhmWOwYj7lJJ0oM2SGenZKbMgIbz63RSSPDb3HHVKerSJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HthD4IvHLA6stKJScMCSkGvaVS45odtvgDWcqH1Zbs=;
 b=bb/mEnltWN3E6ovFlYskWxxsGIQU3JkdKbuKRTtrVaYlFbVXF7XeqGEB/qLdTRf5aHrEkONk5WLXJWl4aaBsnFaucpjQ4EBYcDFh+fab0q1BoOE1VIf/FXZiiQePyoJE0bWcLNAFkmOd4UAtHv0M6DAGEkJk08g8dPYAq+FZ/0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PR3PR08MB5721.eurprd08.prod.outlook.com (2603:10a6:102:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 10:16:54 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:54 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:40 +0100
Subject: [PATCH v4 09/11] arm64: dts: rockchip: add vicap node to rk356x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-9-e906600ae3b0@wolfvision.net>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=1988;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Xo9R1USL/z+d4IAQ/+r4od9eFDQsy0jh6o64qDS6lhQ=;
 b=9lzmLX1X1WhXLP/R2DfIGZWyO+PWi/5KWZihg+PvYXWlRp/mttqgiXCjXIYfOeurBFqKPY2YH
 +Us03xR+xjsCyRs3JTdfjAg6rTcsQpR3WmeJ0Msg8Gb4QQzCBoJC0Pq
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PR3PR08MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0daf46-9451-4352-c0ca-08dd50ce88ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFBRY3pvdzVoQ2RSd241ZVAwMXU0NTBKbHRUQzR6cllXSUNRVGtvQmRmbU1W?=
 =?utf-8?B?Znk2UkhhRU1UWGlFU25uS1YxZGRFdGp1Z2RnS3ZUcnVKcHZUMjdJd0E2QWpX?=
 =?utf-8?B?cGY0M0ttSWN0b0JpRm45T1o0U2V1Um8vVkYvY244YWZrZEdlWVRTUnBQbVpv?=
 =?utf-8?B?TDIyaFBnMUxlb2hvZ3AvN1RzdlRlZGZuSUpWdlk0L01pZldQMU94a0RUaWU0?=
 =?utf-8?B?VDJyM3c0MlFTREtyNkFtSlIzdVdLYk1uemY3N1VQelF3TTF3SW9ySm1QclVJ?=
 =?utf-8?B?NGhHMk5saUZ1MUk2MFRmeTFxMmxLL2RzbDBuSUlzZ2doVU10c2x0L290N1hN?=
 =?utf-8?B?VmxjN2hRWXU2YitPVmx2UU1XMzV0d2VXSG1sb0F0QkNYV1lTSnVsWE9aSWVH?=
 =?utf-8?B?SHR6cFlhTTlBL1dXTHZ2ejQ4VGdVVWM2YUFYR010ZjJRb2Y5VUFCOUxpSFh1?=
 =?utf-8?B?alZwTzlFLzB0K0t6Vm9tcHowbWFrbS9PV2pFdXpMcXlLSy9UcWJiQWhDeWZn?=
 =?utf-8?B?RjRyelRLb1VmODlCcnRMR0tuMk5hZ0QxaitGbnZSRHdoVHRjNXkzMmRvaGNm?=
 =?utf-8?B?UDhvQ01tMmN2TVpmbEpnTDUzbEp4enNmZzAxUFRacUNSRG82bHRLaGMybkFD?=
 =?utf-8?B?Mll4aEl6QkhkNThJOUJ3MXBvd08zbmNtNGo2M1ZVK25lS1pVUFBsa0ZNc2h6?=
 =?utf-8?B?d2RTRVk0dS9rTmgrWC8rWHVWTjltbk5BY0tKdmh6NDd1ZkNyRjZ6aHFTMUpo?=
 =?utf-8?B?bVh1RUVVU2ZzZk5JcGt3TzlNNHpXeXN6ZWRjbzRZd2x5VmFXUW9iWldpcHVM?=
 =?utf-8?B?Tm9NaVZzOWsyWjExYytWd2l6OVZDNXNsb3JGOWdhYmxGcXJtcU5qVmNRU0RW?=
 =?utf-8?B?T2Z1bCtUZkErbmFDWHQyTVV5NE42Smp3eWxhellucXFiZVN3OGlHZGlnSFNM?=
 =?utf-8?B?WWNTVUVscUdzcXYrYlBiZWczb3Z4RmJqSS82R0pXVnRqUUtKb3k0eHc1VzEw?=
 =?utf-8?B?a0VYQ3Ixbnp6RXNEa0JuaU91OXQwdERGM3BuZFp5V3YxLzZsMTR1RDJLRm40?=
 =?utf-8?B?ZGZnOTR3TFdELzF4V3BwUXJINTJWRzVvN3dEQ3dyYmhpMHlxOUczOUZ5Y3ZM?=
 =?utf-8?B?OFdPRFdkL0JNNEpNbFhSVHlzenRyZ2p5OGxwYUZzRDREUS9UWFBsMXd2Sm5O?=
 =?utf-8?B?MmJRNW96eVM0NHpSQUpqNzBIWmNZSTBRUjJpNWhyZ3dzaEtNNWVCQmxZWE9U?=
 =?utf-8?B?NFlxYXhMcG9SZXlxSUlLU1EwVTJCUUlsc2dBWUtoVWtxS2hPN0ZQZVhreGRX?=
 =?utf-8?B?b0RNS0g2eU5LVGdSL2hNM3VpT3Jkais5ektPdDBsY1ovd1hxTjhPVDYrNEd0?=
 =?utf-8?B?Y2R4RW5OdlEwYUdwWTViOURGazFjQ0hmUkdqZU40ZnNRanExd2E4TVowcDU2?=
 =?utf-8?B?dFl5WmZ2T1NnNjVaTGF3aWJsMFg1K1hlL2c0dnJKeGxTUE5ST3d0bThvL3dm?=
 =?utf-8?B?WHVKRzY2b2tuWnN4OW81aXprekhKOHJHdTlmQmtqWVdGdjNZQUgrWk5Ebzl2?=
 =?utf-8?B?azlyZjl2VjRBQjMxRmQwcVhnb01DOHAveGgzQ3FEaklKQ0FWdHVuVWlBTHhu?=
 =?utf-8?B?VmxSRkFaeWtaYTNXUzhhZG0vOWtmVlFOM3RBVHVyeDJjandWNjlwTExRVG5w?=
 =?utf-8?B?YUhkR0FXR3p1YlVZU3BmRWpSWENTN29ya1FwUUxBbWNBbmtNSXVWdnptR29M?=
 =?utf-8?B?d3lJMlNHbkhFR0ZxMDFNZDUxZUE1MmNiaGc1UkdNdUl3R2JvaXpjZEdxTEZp?=
 =?utf-8?B?cFcxblNIdld6VkpGY003bWthSDRnaTdnOFB0ekFQSGsrVnZYNVV4eFNqTXJT?=
 =?utf-8?B?VVZ2UklKY2RUZ3BVMDcxbm9iZDFQKy9WTm1haU9hbUdONG52NkRRUzJ0Sm9G?=
 =?utf-8?Q?J7l5ltatnVJBPb4mD9cUP35/ACHZas8e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXY2dTlsYWdSYytlR2YzK1FZL0hseWFjWEg4TWRheVM3Qy9EQ2ducG91d0pS?=
 =?utf-8?B?b1NCWUhEdy9aZWF0SnhSdUpTU3JGcis5SmczNjRkVlAwb1o4WlVLVWNXVWY3?=
 =?utf-8?B?NW9jYUdiWXVwN0l0UndwQ2pWZEprK3V6UU03WXgzYUZuWi82U2Y0cmUxajhO?=
 =?utf-8?B?c2Ywc3lPODVuUDlhblZQS1RoS0oxdGhPYjBSYThZYTJFamZNMllUYXZIZ1dq?=
 =?utf-8?B?a0VMOElrNWFmMFBaaldnUXVOU2tIY2FDUFdBM25QOHBIREhoZTAxM01LbUd0?=
 =?utf-8?B?WlB2SXlQUkZHaWtyeEN6MU9ZUmkweTY1QUZKWUpZbENuZEczUUpKQVg5cU5M?=
 =?utf-8?B?a1hCNXAwNWRFOWk0NjUzWmcyVjQ1VmwrZUtqWU1RK1QzWTFjVTRQY2ZnNzJN?=
 =?utf-8?B?MVJVMi8zckNnd2hZUzhDc2MwbHVLa3ZTZ2RWWGpJb1VzWDhURXpBbGRLem1C?=
 =?utf-8?B?ZDVjdFFud0FhK3lYMm9nRUZXMnAyWGlkK0h2QXFEM1lTdDI0L290aTY5d3BD?=
 =?utf-8?B?dGVRV1c0RkhiUUFSUmJHUENZNXZ4TDB0aFlqcUlQVTNORERhVUhCbE9OTTcz?=
 =?utf-8?B?SWV6TE85Sm44SlZ4bi9xeE5PbzN0cVpyYWxrbFBKc1BiVGRhVndudDVXc2dK?=
 =?utf-8?B?cWZGeE1UYWx3UTkxaDJXYWh0c2F5b2t2b1lGSit0d0VyVjMwODJSZURSZXIx?=
 =?utf-8?B?ZDU0L25rWVJFMTk2Q2V5TTN4TG9SMG00U01oNEZwZnFhekJkUlRxZFFUdS8x?=
 =?utf-8?B?d0xwTG9ZMjYwMEQxdUtocUx5dVZIR3p4UUVuWmoxQ0tKVXRWS1A3NFFhUlN5?=
 =?utf-8?B?L3hjdW4wUEUzbEtpZnUreG9XZWxsTUthVXNmRmNScml0VTR0MENPVE04aHdH?=
 =?utf-8?B?ZXhma0ZrUE9xN2JMa0NzMVdWWm50MTJxVWJXMHdJRVphZE9MTVVlbFBkNE1w?=
 =?utf-8?B?bmo2N3M0dlNBb3pKbHJ0Um9nbVJEM2ZWUTl4cUFXREIxdmQ2cEhEUHpkakQ5?=
 =?utf-8?B?N09rRVZyenlGREZyemU1VDhHR3dnc2RNcXV3Z2QvTjREc0M0TUlRR2pKcVZO?=
 =?utf-8?B?ZDdGZiszQ0xmNWh4ZzNZT1pvVkFzcjRqZHJiZjVabE53bGxET3I0bkRsdDVp?=
 =?utf-8?B?a3YyWnlnc2R3UDNRQlU3QVB6eHNnMWtnRnRKSytpeGNSdGFBQktwLzh6RjdR?=
 =?utf-8?B?U3lLU1RvOU4zTGY4WGVnMCszQWdHWHRPckl0Y0tuTklKdTMyWElCTm1EbVlN?=
 =?utf-8?B?UmxBQkx6a2E4NGNJN3pBcUs1Z3dkYklySC9ETU1ZNGlsVVd1V2lQTm1ONHZO?=
 =?utf-8?B?VGUwMnhLMkhvaGZUWm54N3lCSjhjOFZ1WDBuZktaekx2cmhLTUR4QnZUdE9l?=
 =?utf-8?B?ejMyc2lkZ0pHNDZyaGxkZWtDY3ZIUlhrY0g4NnNaVWtrSjNIK3NXMjd3dHZq?=
 =?utf-8?B?K3UwNmZQZnlSVUNVMmgrckpoM1hjaDBUQUVjR0N6OTNBanptcGhuWUNJWEsx?=
 =?utf-8?B?bnJmWmMrMldKUFJ6VlY1K1JFVXpNaVpYeVlqMEs1Q0hmalFaN0RNM2Vrc3d0?=
 =?utf-8?B?b1dpL1k0RmwreGVzUkR0bmIxaDl0UEcrSUg2bmp4OC90ekN2VkFCOHg1dmJo?=
 =?utf-8?B?Qy9MSUtkTTBFSURZRUxNam5idmVERHQ4SkJiZXZkN09ZRm81blQvL3lCRGNG?=
 =?utf-8?B?MnpDRi9xd0N1YnZENzBCNUN6anRteUZTalBYWEtCWkFNOHd5Qys0WmZCd2pC?=
 =?utf-8?B?eHFxQkhkb2xkZkYveG8yNmhvWHZ5TDB6OGtYdm5tVWl3VFllZUJrSHFvbk5a?=
 =?utf-8?B?N3hhaElDdXRnOEtNMjEyR29rMVROSWUveUk0TndCa1E3NXpRNVZlRHZmcS81?=
 =?utf-8?B?TURHVE1kYXdtUm5kRmFDQS9hanAwOEJSYzZIbDlUaVYzQUZHb2cvQ3pQUFlS?=
 =?utf-8?B?RXZMZmt0UTVHdGIrbEVHTTlPajZwSGVmM0hreEd3MGx6RjBMSU9hdUxvL3Bn?=
 =?utf-8?B?MThFNzJGNDNOZVpwWDFJUTg2TTZRNnkwMXo2TGNZRkNqOUxVREl1ZEd0eDEv?=
 =?utf-8?B?dGs3U04rc1h2MlI2SWgzY2h0SzRac3c3dWxidS85bUErY0VwZ2NBdzJtSm5r?=
 =?utf-8?B?bmdWVm1peFF2NU1yeFVJOGhsMEUwcGJ1Ukl1WFlLNDBVa3hnUm11NExFYnVz?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0daf46-9451-4352-c0ca-08dd50ce88ec
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:54.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+Blgqd2WN6viPJz7uPeCzJu0JNiKlGyTB7KmRUNPPhE3nxTpsJmDvd7DEMBjSe6xFYrF3RyLjr42xdhvqheDAX8xSuxlfTc62ij3RhPFJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5721

Add the device tree node for the RK356x Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e55390629114..cba5092dbcea 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -553,6 +553,50 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	vicap: video-capture@fdfe0000 {
+		compatible = "rockchip,rk3568-vicap";
+		reg = <0x0 0xfdfe0000 0x0 0x200>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru DCLK_VICAP>;
+		assigned-clock-rates = <300000000>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+		clock-names = "aclk", "hclk", "dclk", "iclk";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+			 <&cru SRST_I_VICAP>;
+		reset-names = "arst", "hrst", "drst", "prst", "irst";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vicap_dvp: port@0 {
+				reg = <0>;
+			};
+
+			vicap_mipi: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdfe0800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdfe0800 0x0 0x100>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3568_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	vpu: video-codec@fdea0400 {
 		compatible = "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdea0000 0x0 0x800>;

-- 
2.34.1


