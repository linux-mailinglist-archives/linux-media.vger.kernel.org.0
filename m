Return-Path: <linux-media+bounces-27570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F377AA4FA7F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9833A8E6C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9DE205515;
	Wed,  5 Mar 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P8IxlP95"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052651FDA6A;
	Wed,  5 Mar 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167871; cv=fail; b=IcnXfyuvrF4pMl35T22M9cCgzFmJ7E1VNwIOL7c8L6r0tedNVWj5iptAEFGiyYZ3Tmw6ekQOyr/QihNzQovtxXK+1v73tfvd6/bdnUE1njTQF/1BQYNwXRcDxELAwUS5s+IJ7bH8zROqelQhVYCFVDq5y1oCP9PdbMFLNc25Y28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167871; c=relaxed/simple;
	bh=CUm4BHD2remkl7ufhEK09MLRssDoaiyDiLdCWQPdTkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZVHT/CRfZyMsvUXEQBHobuLte/vQ++hteaGLCAX75jKKShFGlVSntapJhAfTTGFZnkBkuCmKDxi8ml30MxQ7I76D5zCbV8YyDbZ2eQkOun0wuq4UFTiKrkKSESN3yLs1MXNgGBvSWp+fhreIFvw9xuoPENePrgM7fQmn8NlwRlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P8IxlP95; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwU/U8RdCdGEqUQTz4CSod2OTdcGAkPUk08vNG+NuOSbGnwL/kZQgOCYq58EmVslzLA2zggtH2iBk1hRF0z1Jq/kwgBX1yU8RWhSvDiSErsgItNR+moAhkrR2M7FrMPK0i04E3rhmxvDPlSGhtopFaQAoC3VaLFUrZwNZkrWBalI14+pxN6KPvecEOoyp4srhwNmVrbe+ztfcmJhL8O5A7TIgVYFu4UCHRN2Uz2+AXB16O/M/6TVYCKCs4USDRfAIFEOX4V+QHMmNNBWOuy6mqh1T0sJZrBhPiH5JQ9IKd+273JqEaZg1DcWCNWExFdpMbrv/uaP82HX7y5t4dWSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExMulDbRBD3LGyyq4Q5lR9Z3G9wQleEWTQH17mxftdU=;
 b=frfqEUSSKRBNtPjBUBxssaQyHdcn84/E0S8SkfxX65BYUDjIWx+bBhlhx0BCDjzqV5l+41z0HONln868A88XpVF6XQyJsKU9GjRmvn/N/M2hyCfXl9M3TpC8Yn4HdmQMq5SIdq0RLYD+lbM4pgjalzD8uR8InkLu3Qw80f3Y2QMdvJop5cKPyzrbnSXjy2A9gcF5+tZFBuY3hxRdLtFf2bIE6s6F6MMM5VS1uAuwfsmuI24sHa6Hx37BMk22j/7MKm6S3az77oseLLk4LWalf9eM48kGEYBeasFCefivIztcc76vG3H7k39WsmoQCWAN1i3XgMnWlGBVQmkMQ5OTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExMulDbRBD3LGyyq4Q5lR9Z3G9wQleEWTQH17mxftdU=;
 b=P8IxlP95o31hxER1V/9qXHCo5F+oOiYMIVdn7t1VjrjScDNQkx4KGQKauBSKo7yj5HfkUlaeav/wRoCEvBwWNzm+HqENd2VE+kKgSA7b1SrnMe+AxHo5KGWLg8MS0bsh57L6352Pw0yj366P4l0LwB2HdVL8nmxjI0Ih4wIsMmYIqGuQ9sGv7LWlIc2T+q0FD46rZsVfVgw++8gnNfkImzOiAGeCA9vMUVeyB0nv1yBMFH9tRxg3GCphBHyPLQUf74ljseBwjFkBFgjH6/LqU//OXdvAp2bOFQ9u7XfGhNjssxax40C4f9bInWDN+MBv88uS2UigQ6k04vNMMowkvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:44:25 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:44:24 +0000
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
	julien.vuillaumier@nxp.com
Subject: [PATCH v4 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Date: Wed,  5 Mar 2025 11:43:56 +0200
Message-Id: <20250305094359.299895-2-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305094359.299895-1-mirela.rabulea@nxp.com>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::25) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b3acc0-622b-462f-1416-08dd5bca504a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?21lJ9ynejh3Y5YPrTqtj33H9DFgfjYUzMoz8jUQO6m+/LtvcFQu97WNKWoSl?=
 =?us-ascii?Q?bYuSEjDkhMyv1hRj2hB7B0lJgbqdun5fjaL/LEakDs+rlD0FkNvoGVwnhGi/?=
 =?us-ascii?Q?XS7U4LryuncgC3sp/nX6A4HqDUQr91r9H4nHfHUQF03JWXpcv2T3Ve1SN/KQ?=
 =?us-ascii?Q?z+YTi/fjCyhaXAq2X2OftwiwxqOidF8x8WvmAJrW5asFH4HUBkVOyS8B7WsM?=
 =?us-ascii?Q?UEfQjNMAJqylLSnK/QGrUpqMAxA/u4bOkr3SHy9oC9h3t9Pmn76UFMBFZ0vw?=
 =?us-ascii?Q?bTGTGzB8ZcepiO3qXdGsOMlzSS+qlcLs0XIsxCGyp7vghR/tpBk7YP2clnIn?=
 =?us-ascii?Q?jrCJTKENXXcGTjpJbkRNfIJsxD0211uS57YMG1Rz92VLWIMvzJ5EX704mY47?=
 =?us-ascii?Q?TWi1xWImhsDGtCkqY0Hi4o590PJ5009Vo/31ATj/A621GeQ7a33kIk6atg6I?=
 =?us-ascii?Q?NCrktE9IQV1Oi0VFravIhz1isTuarDuUGTrXLwpg0+9PMc1JWks8eIdY2sWe?=
 =?us-ascii?Q?39NY4i5wiMfkswq5b2QG0td+xsGsl0N+tp7stZ6DpbdaXoB3mz1lD+20N+IE?=
 =?us-ascii?Q?2O51f2Elr1TykWeQmxm0F/2Z0MW64ODSYz8EFC6GbINbdL4yfz2CJJYkgWZu?=
 =?us-ascii?Q?GfQiwuG5th+043/ewbmkra46JOOprD1tgz3vAyVBwtT3pM7Z9fqDdXqLNlib?=
 =?us-ascii?Q?ZBXeQ6C3Kr7HMRF1kSZw1cqovKm0hVyMZWJOKb4+AN+L4A8UFRZl+GIN7TmA?=
 =?us-ascii?Q?2KostsoY7Nm1DDXJSbm0iiTO8JK61HORQ/SWQdr86N91saOv6rUM+m+TWWWW?=
 =?us-ascii?Q?78bmGkKHsARW96w2P1DNWKsesmc8l0TBVV0UepFlfTdy+ghOvWlgXWDLpOew?=
 =?us-ascii?Q?IVXNasVLHoTsx2CMNOIGWs4lJ/lWathdEKev0b86OnciqTF7wW1a2h4SaRCJ?=
 =?us-ascii?Q?lMAAWrfnxRXnSTcmUDioJmQhcS4HUBuTrpbsT5c1/99UWT5mhyxCBl/ykjHr?=
 =?us-ascii?Q?IxmxbnK9s7dlvB8cAOMLj72iLxwVxcSjP3KUHvWZ076vqyNiJqwaXv22HUXR?=
 =?us-ascii?Q?9tNFXwOj6PyWBppN60OkWp6B4yONfHMKYfA5xtr4edIVDfSUJ8vvCP8qva96?=
 =?us-ascii?Q?fqT9kCeglifvjPGzW5fUpodw2b76+gUSwMggJAt19Dq3sGsDqQgkNPJFCSA7?=
 =?us-ascii?Q?/z73u2xyXEB9P9mTOtDrRtCkf8v21RElcxB1FxmbwiIuG5AoHmtl6XwIhEzj?=
 =?us-ascii?Q?Y703kHte/hanQvHt+m1GyRGDTgufQsGCuUTse9zk4e69mzBGbw/EV0g+SDFv?=
 =?us-ascii?Q?m2kMUu+0nSw3EmY2yYaS5cWfM7nzjNh0XyUov1wORqj6bv8uVEQrXI1Ss/cA?=
 =?us-ascii?Q?0CuYnZCtB7AItZmxkGvjmmGU5KxD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEczunHc/LEUZlPhyhXzPJ7LfMMzQUw2jWf9QoXmZiohN0xIDLPlcgQMexWB?=
 =?us-ascii?Q?EEr98dG7Cp9YyvYQWXgfiXXeoTc35eJqUj6EnNcenH5znMlfprUfljk2nkuZ?=
 =?us-ascii?Q?AGoRZ2zcHgh8to7JGkskkth/2QUwvLTOaskWbTGOvIaNblrRfudhNbCKjFhT?=
 =?us-ascii?Q?hvCURovV+CfN4oEKFVHVwvJBeMD7yo/hIX8JPZ+3i5ThqsOeIY6qGj3DePCo?=
 =?us-ascii?Q?YenpDdn0BTY6JZyqjFNrFTlUh6lrfSU+O0hkd2MmIpOFdZE0LkE/G4YM8PHb?=
 =?us-ascii?Q?0rgkj3yx3pXOZny/3n/lYHzSiGdndACNnGuD1q18QvIat3l5ZH9KGrSKc+N6?=
 =?us-ascii?Q?pu0acyoHlVD0sHLHp+F+o+3PBgI8n/+jTlYnni4OJFJU01hB7/C6HD/CmHGs?=
 =?us-ascii?Q?xUTWZvlvybjmNnFQfZO6+wumSsprf3hKBaqjcfH21hzxZPN2R9GD16La4CjT?=
 =?us-ascii?Q?8yuoY6UFJRWoy2SEgogsMAIxqP6kZoBe5hERAXsDPCq4fVl6ZxpD2aRg6bEX?=
 =?us-ascii?Q?c5Yfw9j6WCj5hNJFCg5a4ywNprEWK+arDqSuJ2xAwvAWRtO+kvmdThdA9DC1?=
 =?us-ascii?Q?chWf7EFg4hiLlFXa3G2jkLMIK1Zb9Odb57t7PPrX7x2gN53DhYAGwyIR29FA?=
 =?us-ascii?Q?JE3z0F+qTtAtnTRPs2B0Raed92T3BRYuUkIU6b7ugY0C8AsXlHKmbXvJLNxj?=
 =?us-ascii?Q?7brxyCDC7JXiGuOB0GE5fikvHe9HxKrCLdJHRfPuU8uf6iQhnF0Ee5f2U3Jr?=
 =?us-ascii?Q?JdKASQUjBzP0/KzgXApRualyU30a2aTBpdD3VDC5xDGhmbrfPAHYMnDJFW01?=
 =?us-ascii?Q?35RMLkZSHEnCsU8Lpi9KMGVs32iYqtU4kREsWHAvTmNXkeuUYkwty9XGAwGS?=
 =?us-ascii?Q?47Tf8sAn0TMzdPfWuYCVoLW3cOyA7twG/fG7wL5ZV3JiKcND6obTG8/UpLb0?=
 =?us-ascii?Q?dHpTxbw/pLeAc0yKvPSHwqf1/X4hba2TUcFrrTsAYjCfkiQ7tlJrsc8ARH86?=
 =?us-ascii?Q?/lSRfmwnxlchOF7XHfpD7frecf0bjSMmN1+O9hqPPvqPT4MRKPqM5nG7bPdf?=
 =?us-ascii?Q?isbIJevBSh2lcmiFSd/eb5A8oBBbo9TcWwp7pp4Aa5LQDSK+yFIyDIm7s+YN?=
 =?us-ascii?Q?Wz0lpYp9aPoStvV1x7H/oMpleJ3pjzdA15LiBM//3qdIqdtbY+e6N2fvXEMC?=
 =?us-ascii?Q?kBo1xoaAiEU0bTjK1rtHsby7elsIUOPDkZ6J/VDIq5Xv7RaMuX9RKCONamS4?=
 =?us-ascii?Q?wq7G36XR6aK69KxOUwJaN8yF8w0msueW4n3AuUE2SIkbIxWxfKFgr5N39JJ6?=
 =?us-ascii?Q?vbs/9MbCJEjebtgmO55bq+5avuDpNLTmZ9K9FFcBxgOTNYX19FCasBSCsGaj?=
 =?us-ascii?Q?m3WmP3VV6GxfmQmUp8I7GaorLVq/qNWpygxh8PmA0qMN1gRdfnK65/3vSiP0?=
 =?us-ascii?Q?x4SJIF685F+7l/NW5zypCSdE6bdcjjoMkImwdRIApGhqX+/zwaZz0naWMPMV?=
 =?us-ascii?Q?W1jAB+SqtT8fGNcnKn7yFOsCBvUmpMbo0iew9F54gRJDHcibPXfjt1mV7YEU?=
 =?us-ascii?Q?nQquf6RVr5O/z30l0+OPAUuZ+G5RTdB5sDczuK+N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b3acc0-622b-462f-1416-08dd5bca504a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:44:24.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOvAKw4hFYlui8m7sl/ev9jxIw+jVBpzQINRCVdvCSduXMXNxt64ciYOmuadOL/3AXQ3ryWfoeiQ0gRKg9EdEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

Add bindings for Omnivision OX05B1S sensor.
Also add compatible for Omnivision OS08A20 sensor.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v4:
	Collect Reviewed-by

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


