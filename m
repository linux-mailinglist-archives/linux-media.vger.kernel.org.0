Return-Path: <linux-media+bounces-48459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 991FCCAF882
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 11:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7172F308B59C
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 10:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001092FD7D3;
	Tue,  9 Dec 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="knuOZo4J"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020086.outbound.protection.outlook.com [52.101.227.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE0285073;
	Tue,  9 Dec 2025 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274472; cv=fail; b=hGr2ScWkh9MxwAsnMOzNqrCU4XYOWUZNHBg8EIYSmN3V8ABUmSsL8fTJSWtmlvKJ9jFKbNAf6AVNH0F6TzyXgSrHdwDJDJvp1bjowGEafkc54iCifhnYJT1u19iYxFTqUT0sFou4UxwrfD7ZnPXEMSV/FEsyAgN13PVkT8MZ2og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274472; c=relaxed/simple;
	bh=h1EOjUt/+4D+Aa5DHjM0SkpNzHdzvN0ImBgSLd6kw8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XWOA3Zp2rFjmxAm4TCjpPtubJf5rd/EL7H4u//cDgFM4BNR//NZoVwKnnEFCn84bE6t65JQcGlcUuTiqiXPqtCh8Yfu5kPrm1JX7H2pnCZRbrACMLkz7mI7a59KxXKxyo/cBwmlpiXvim70jkJJdnZQba0qRmnrxGady1x+zbWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=knuOZo4J; arc=fail smtp.client-ip=52.101.227.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSvHznZ3leq756QLJh7MQJHt/RxnBlzcbGoZWtcdbvLxSD182Pc/dIe04ruiGrW/RHmIreOAJGXwGN7g3bp/1pBQQo3DYVprxl4t7aE9aRfEwKBMUCVdSX5I3i19ZjIR3k0gi2JydUOI/U1DKGCSbgHF9LqgrNhzgcxqm2GqLQ0wwnrpfUukH3splIJKGDJ1OZ5qc/GMnW8HjbhondwUo1Tte3Goskoh0blU13ExtuISnA1kvi3YvgwIzExWNyT1yOJaLtur6AMUc0+sQcrLfWDk/PQr5JRCRM/65UPtQG3G0u6BP24rD1kBeSCzvuL7PsUEkyx5xBPRpIVySVBYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/Gz41iCriUlPiOmDTTLVRuM/WaOIuNZrMhIQim6+nQ=;
 b=JTlk9+vqUSSylwsc+30KYCKrdlqLZ6zzE0UkToHbX2Ipgw703B3rzoDi4bJXIcrvfgM1+YPDshJWQHjB55iSDh/MW4KopbVqDArRWMGjvDF++bV0H3pKleSWqzRwA1vDcq+8MF465OWbpiMfRnQmNAOzVgKZPwcnPAGzTzHDPmGyXnvOIn7ttbCgYAKPbAH9H5ObDFwE9bIt4Wxw+B/9Eu0ccVw+web2dFrKQd2bzCyjKgXDLbt/ydKqNduOGFDQfIBuU0VK6JHRENQBVLAglAxNbxhXpwhohQMxgXOd6psBbx565AHNM25SibgadTcoiQgOyIrCNsmf96mUonTOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Gz41iCriUlPiOmDTTLVRuM/WaOIuNZrMhIQim6+nQ=;
 b=knuOZo4JQftSoVOBfCmUWFNEotdeQhOpOBZwyFu80vWZhPniIzAWs/ipw1ySYK1zdJegxhxCOX8hxK1A4jhROE2VkVgzwv3Oyj2QhQZoTu1IodU2U7WRQS9+OUS0VEkOzMXra4teDo0cthEDKqWAvAIQGPLkFIQQauDSn9D+YvyUGnrVWfiGeZJ1EbwyKwuM01slPn8fPTKPNoCU4P4uva+DO8nvnac2NSXUK8UP3m5q83I2Nm509nL6DnO9ILtqKoIej162LnApy6S3I11EFjjRQh8auLtxE2mvzWdqC9Yir+2yiFjNiP1gyF2SWTWyMfo0Zg8zQXNFvtCa0pqHyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1960.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:01:06 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 10:01:06 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Tue,  9 Dec 2025 15:30:05 +0530
Message-Id: <20251209100017.302518-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
References: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::28) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN3P287MB1960:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e2360d-e9ed-400e-d96e-08de3709def3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6tyb2FkW+zKHgS3z2GQvwFggdeZC9oxWIlfk2gAt2vIux8dotxeZxrIzKEX0?=
 =?us-ascii?Q?sUght8C6pIr7Du2h1R4E1F+GZrVlfWAjn5jeSp5xocE+RuMErSMg3Mm0a/7J?=
 =?us-ascii?Q?jq4hLujTo0wIFsz4zlyuErxqzbXhQrxHIVnWssAfUGtp7rwnfQCSys8qYzjo?=
 =?us-ascii?Q?K69UFqdxCxd8frf3dGWakFuvWZhhp4b/jbE5shQMOxnODXMTPoLIHj3wr20+?=
 =?us-ascii?Q?7L6SE1a9dxX9AE2VBcI1/lb/dpRN3bTlfDdYIynpFDQuw9IqklN8LYfmcwwm?=
 =?us-ascii?Q?knd0z9Kgs1YNqYEY1e2ur6+UiqMNvFUvoXlMA423msW1r9UQ+zmWx7gFamEx?=
 =?us-ascii?Q?idGLljyX+sHN87aZCyBqle21PJO/iRqUX532UodmZsXclhiih65cxhAmwTtD?=
 =?us-ascii?Q?K9Kk3S7/evuSJldpWhbu/Bw9WYSS6C6JKAracmQGZdMryRLAK10F7fcjX1v6?=
 =?us-ascii?Q?YlGexjgdtgad0W+ZMEYPsd1zHzKdHzl0N3TkrYNHB02elod28ZeOQ+AcPT0x?=
 =?us-ascii?Q?2rOUsCfTkkv/ErPKrxLhPkqEVJgR9vu3KKjdZSliK2TwwrfpaEnW1QUpW+YG?=
 =?us-ascii?Q?euvO539Geqxd+dUX+FbGOVOSYOvU7bYLE5glbaabcbOKPHc4nd4SDzjHWSWx?=
 =?us-ascii?Q?/nsGkzNdUCyXyc00O91BVlfNP/DWsbGBJjpJtga+dypVBR/MmJjETcedl1oj?=
 =?us-ascii?Q?3fl4tvJGUIv7BMKQAajWZRqHmTikV6LIEZ/QTIjX8c564TanO9aRLAX6CZli?=
 =?us-ascii?Q?0He1DSKFtx77YXA9krj4tSKka9sFEE5uoXIMQ/Llw2jOn6yM3hQUyRLFcvli?=
 =?us-ascii?Q?ee4pFsqzYJ6sZUCDVR7Rt8wdWpC1CTrSU3yx/zwQ7COLXbf46So/8k7RevXc?=
 =?us-ascii?Q?qWPOqL9+hQhfHiBaXYUnC+63KAWrMLCEAGzqEoQ+uYVdp8upQ1lafMCGNmlm?=
 =?us-ascii?Q?rJfgQ5Uexm7lHcco+e9RA4Zj71moOzxLUwZZDTsWUCtncZDC3lE1DKL/ae6Z?=
 =?us-ascii?Q?MXDm6E4x8kmDuqhX3DH9H3LmOXL2wzaUp+BWaUd24ZxZCtPLIEEIF2AWFCBe?=
 =?us-ascii?Q?+2Q3odBYFQuHTVON2NhmRhnUMvUu8SQKXIcqf02JHbw8LJqOX4LnGXybLzBv?=
 =?us-ascii?Q?ZCETMH5Z7aTMPVg1+GZg8FAEo1SeXno4aOaVgb69P2cECJnrlv8yJTbZ+h1F?=
 =?us-ascii?Q?SNTW41+m3g4r+b6qYLuwkHWwfbIuoIrjpvQRNXDjc/Xib0YYkrsjnPZHDfk6?=
 =?us-ascii?Q?CrlCjKLUXR8Z9HIXJPNOqMM++a7d1L7/El4+fZFvO3j1wmmO9+E7BRA3DqbZ?=
 =?us-ascii?Q?r+f/HRiAdwQla/ld4TSdHw73faFELVQ2AnkowjjuJqnQB3llgiQVRXUPCyBs?=
 =?us-ascii?Q?P1yx0Slt0vZjNWMl+MBl6Kwhx9BaHCnu5+z63bZ0QAJDVvo7uX/LLaSWlI+9?=
 =?us-ascii?Q?6Ed4hUsiz96bVeUcwGBjbg383RfGagnU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EBFuzhTBerDSA9/9m1pcdo9HjX3K8U8WsS6jbujUKFro5LKx8p1HlTT8cDxE?=
 =?us-ascii?Q?13DkXLNjqBZA6AWeHgCbRdijDNvSZMYM/MpuuqCLf/QTuRaT0KRs9DVRQFg4?=
 =?us-ascii?Q?YbWf0HOaFdFHMhiZq42Nirdkog67TAZfK8O1SU5N2vwlPXOEWBzsMLXTd/D0?=
 =?us-ascii?Q?gtE2mxUXE+nfZrV7UPStPfhMRTiCDGNnOUmAeyRIcQM7JKPFvGsjdSjGfNJv?=
 =?us-ascii?Q?WMp6Q3GoPIXABgkLEVC3W9ucg0HZLPKNxnwecZM+Hj+nMmoiaw8kzRKn/LiU?=
 =?us-ascii?Q?RUKkzGqMf6IyGJA1HONmiiIG3BTpOxvt/t6Y6KFUpLY7jW1dSxx/XvD/E5P+?=
 =?us-ascii?Q?YqPpKIbYc9ItUVf/iMO8Kbk0BcTUXp4cDnWW3CVz8RE57Lig2sIiwXnr57l7?=
 =?us-ascii?Q?x4KYh4Lbk6c/pA7/m8Mr6tPQIPuERg4Owgc8zlfu/t46GbRSTBtAdk1eUQ5Q?=
 =?us-ascii?Q?IjMH1dnCyINkoRpN/r/PbRDtl8T/kn7gbS61pSULLwEEsTmgdAd3m3f7Na6F?=
 =?us-ascii?Q?mnONlO1oGHe/bYuUJMeDL5vzbjryz7SmyGdumfyQVm+jh/SUv6D/GQNOurRz?=
 =?us-ascii?Q?oBQb7qwjJQ3x7DOL3Tzpf66Vzl6A7Xl3lIGm3wD8C1Lj1mZVjpa9lfGYKx7N?=
 =?us-ascii?Q?2KgeyMDkMrQutqZOCubVk8KoayxZrG60mxtiv+ydSoUWTKdbbgGmqEm5sCvl?=
 =?us-ascii?Q?5yWR1d1bRZGDFuRBQuYNxv2gu1pNObGqgBlp5hjsWJWi6CWq0IY8S8x0eWAu?=
 =?us-ascii?Q?9tHPu9M495l0MdRA9GFL9ln2iaVpTFd3DSMRfH7l3smykl2rqbwHu/miIX1s?=
 =?us-ascii?Q?kH8eEUlCDpZIAaYvn1EHb2aGXjjDPbNXDAOjc3gZ8hS3Mow54pAhg/cn5QjI?=
 =?us-ascii?Q?lq0f2/TausSTyP8tVk4QBEYjGP5FXH9oFnC4aL+P1fe4Pou4RB3BpbNHSzd3?=
 =?us-ascii?Q?lEU9IsBbAILefyZ+Xb47omTjSadXi3nZysTP8ueJLv6y3tVlMaVF7tSxshry?=
 =?us-ascii?Q?zLq9lz3JSWog64wPZamWPs+bAXIQnpw68iFPW1utfCxcq9QQflQyHz4AURoV?=
 =?us-ascii?Q?7n8bLsDCkjuQ07BYHs0Vx+Imf30kEgDaSUYOys/KrdxpWvvPk3YCgMpeofZ0?=
 =?us-ascii?Q?PzLTJA4K6TsDb/ralEGIWyJSZsSZbMytvUDZ44+XAlXDQyVIK/BUSkPItspg?=
 =?us-ascii?Q?tfek6UAJppstenhmn7CL1t61drZbR0k8dsiXVvlpmUAnCuw5LpWZk9NyLLME?=
 =?us-ascii?Q?ovbZpxIZGQdnF7FnY77k9rygY0L9B6NBxHzs8WfTWRcLj27mLUfJ+w1k44av?=
 =?us-ascii?Q?ZliiOjm63YTEYQ1QxtYGkerNysYGsyroYg/SgzvDyUDHkLUcMMPP3c85x5ai?=
 =?us-ascii?Q?ia+yBe0wAochxIhc9xVJiw6ZdSuepClOXWPYZChByt51Gzwufg4qiIc1JZB4?=
 =?us-ascii?Q?5eI5yeOlRi6UyOfhLo6KUQOSlEfvjAMG/C63FY1vbfOibyxMNUTo85610fHc?=
 =?us-ascii?Q?lXM03m7CbwR82EeJ1qTqJS/7ybB3mUCLIJQ+0MsEGgpD7R/duGYq6K4a6Wsp?=
 =?us-ascii?Q?xGQNr8AGQcQdgc3J5UuTAEdFuym4OmfLLC/oDW1N46IAgYj4VQIrM94IArt1?=
 =?us-ascii?Q?wW+tuY75oB08forMiAkYTiY=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e2360d-e9ed-400e-d96e-08de3709def3
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:01:06.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9s0ZqEXvHfYka1EgcBBjD6dFfjZKpowiI9VQFbPBBk6bT/jSbg9ThFeZXzDMj3zolWu3pwaTewpX9A/D022NP/hoPea/zzbh1zyb/CAVv0VUqzN4+Y2Okh2cZw/7Sq0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1960

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..fabe01cc7003
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78"optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active high)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                 };
+             };
+        };
+    }
diff --git a/MAINTAINERS b/MAINTAINERS
index 9c92d43af5e2..f29afff9d139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19049,6 +19049,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


