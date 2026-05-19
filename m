Return-Path: <linux-media+bounces-62066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA6wM3nGC2qWMQUAu9opvQ
	(envelope-from <linux-media+bounces-62066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:10:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFD5764DB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39F0430B3F29
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762AC30AD10;
	Tue, 19 May 2026 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O8qbLt0u"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE6621E097;
	Tue, 19 May 2026 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156345; cv=fail; b=uMfcY1JlTr1QUbWM7jiwL9HWnJuocFujTJWjq9oir0TjcaCBj0f1f6ijuhQuigpV/fhAbNprirHeuXvxtFV+8T/HCZ1IhzRRoFf+HqHo9iRXGbidPcS0yPH+E7mGf2i22thlzReiBldR4k5qEBnx4x8IAoSfsR+fzdmUVTnJ0wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156345; c=relaxed/simple;
	bh=FEG5bYsPBxZ4dSkv2k1aIVamftOpHreA3QLGwnJexfk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pBj7Kfl1kjm6octjzNGwQz0x9ce3obBnCPvfeq92VY3B+o3o06rf7kZbVmgwdpowE+za6SWxrQBQa63h+czy7OSLZyYCW6nSWp9fI4Dx+YUGCrWd53JQJW6AOHj8maxsiz77ch0vOsyR0GGEBappjbLKG67XlRONRto738SuCOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O8qbLt0u; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9f0wltmYGDfsziW0KhCqmqLKwPaD1C5aDCcArDugtHqMnvRT4dTwBsmwCAHV/J0KREko1pcs7HPRiRwNNyoiai1i4pH7GuQ9HsWsFhJYMOua7c+qU+o3lA3bjAvpFfD/ErQG6EA5H4O8VSLpP7J8r6TDUljYdZyR6TGZmWYH3eQE8uDTG0PYdB9/OCokg87lM92ok2AgWZd5OD9ln91Irm9zqlTy3WueQ2CA3dJ+fUfnWEudYy3gkSL8b5/kljKdkUjeJhR+DME0+RBlMruViMdfWjNDULkXlcKnactsDkv+7CeGjd2xb4O/XG275lZ9w6QivCtLNf4Aa4u/H5AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVPS/YZ1oSIlrkSb8D1UOrXNB6sJr5b517OMbwu23HY=;
 b=nbUG7wW+Q0LUz0dP+7uJ25DnYYzlOBFiwS5IOlYQ5bDoz2ZRJgA7Hzkq8xb7H5uUfOa7fF3gYfIMp/0kaWGTePRe6E6+yZyTj28mqIMw3I6VhMOW3xO7xBVyroQg13OyxjVGqilF887rU3i3e9bLuBpdTsK2NpOXovi9Wahw7KMzJ9/YvdC0o5FDJUxUDqFae5bqCtPXD/M7/8VCZGV9Ay7ARl8yGTJSSX55ZR3ycZUSuZTXvfntZ2AsYb2xDla0Cid50qa4Q+qM9/rZPssCa30S6qcQH6lyphJwA9zusBzWaRbJ8VJlwvurfdodVoLtylAhJQiREnjiot/bFemQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVPS/YZ1oSIlrkSb8D1UOrXNB6sJr5b517OMbwu23HY=;
 b=O8qbLt0ufjvbBGVYQVDmjWQDDrgh0nyKkHMRdoIAhJ1uu+j6PiaPn7QFBBRl8L/Fwkypl+QqPIj6PVCtH7afIu0rdLE/WkFmUwYZjdfK5tor0zW4qTnvzxXOpEMrb+1gbEgYltkDmBNRhbzc6KvW1/VZ9abKLStm3DUdZ4RqZ6lw6BJ0hYeXfx2rrXC85MW2hhSqA1/3/whUtLg+w5MMdjXBQ9mnCPPfiNRxh13x8GT5h1LAgqtascFLo2gfLnDDIour7Kg2wogC85IMP1N9krP9oTJjKtX2Vi2do5N7DWBKw/AFz5VxauJy03i2SyfoZegqdN4vnBiDCpclj+Y9wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:38 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:38 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 19 May 2026 10:07:43 +0800
Subject: [PATCH v4 6/6] media: synopsys: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-csi2_imx95-v4-6-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
In-Reply-To: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=2362;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=FEG5bYsPBxZ4dSkv2k1aIVamftOpHreA3QLGwnJexfk=;
 b=8J+RaSWf/RzWXF1+grk+iSAnstSpSBemF6oEpWMXlUTHpleh8VpwsPX4lJBUmPh+KdMQyTQ1B
 7ZZnMMybcaFDZEF50IZptMoFtJLpolxJ1GrMW6au7d4AjSLPjRenP6h
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU7PR04MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a1aca3-4897-4a74-c97a-08deb54b1f41
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|38350700014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 L94tIORaYPDGuoNraAUwU8MP2LocQpg+uW7PpziE2F5Ty43hvOdvLJ9aDOx9QE0wZKGPZQf/u5ZeWPZjDp7ATW64NSFP6h1QzYY9s0M7rrKqbhrnuUremaRK+bLJRJgqKwUfinmRhHhqy+diN5bTHRvVdyi6EAWoBoGUKi2ZcZJQxDRkhBQn3x+SptBW5vJ+vzddZ7Xcn6RNTFWBj1mvcpmrAr5xb8kUIAVEf2kGoaBVryf9B6I+wZkKguWZz76+VyTEcxwCjvv4U/AXuQHoID6QEcgyzZwbGFE5HjLMl2aAkwYYaUSkTUrubqqllm8fLf2N/QiSxfjoraENDYNAnRYUWoC6/hiljpqhq/Vzc5lVX/VnEYxgaffAcHQychOE43wMu1l7x8crk+qrbaxZxYoMGafczYfouGLeCkZRx7ycM6oajfRLLH7RE55jgUTyGkAAc/FtC9wpnYe3nsDU4rVxoYzuNmeHD1bEzPwnZG0idZ0bIB8oH0kegxInfem2DxWVlLISYJbp+yIMd8Rg3KaJVHdVve9GMzXaW98c6gIqhXIMkd2NV2EwkNq+fMxk8bhRVBi8otALf6WrMfg/jT1wThEAdjqcu+0pr/hdpwC95Dw/5eyWCtSB5O7VZ8Pf2oqH+i2pOEAV1fytaoVmBqqv8egMIZTneoDhPuIPOZ/xJSWSQ+s27dxPXIm7/EUNq4GIBLJEgepqk38AJVKS0IZkIxVcIue4yovYo5C5nucz2BySGAZArxvXr1LRf9Oxf+CV5JML0K+g0MalTp/AIw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QkFsRmJpL0pKcFM4emxvLyswMjJ3LzNIei90aUYxdkRPUGQyb2k0V2VIL3ZT?=
 =?utf-8?B?c0pnSUpNeU1BbkVVdTI5QTNVRFJKWmo1Qkd6SWNzOW5NVFNFaUNzamFtNnI3?=
 =?utf-8?B?aVFxNDJKdkpCbWNLMmxpK3k4anF1RGFqVjJITUkvamF4cjdIMFZWVHRTNitP?=
 =?utf-8?B?QnlMeVRtcDJTT0lUV25ZZm0wckZ2Njc0NDNTYmVJWGdZT0FlVFBnRGZMRmo5?=
 =?utf-8?B?dVo1WGRXRXhIZ2FKSlNWM0UwcjEzSzQ5WkhoRmxuWHhqTXZDbVJnSURaL0RQ?=
 =?utf-8?B?R3dVT1hZdCt3bmZ5b0owWTlyWk1MQ2tmSHNkcHVPSm51RGR1bTlQVFhra1Qy?=
 =?utf-8?B?UU41cUIxTUdVYlZMbCtYdE1QZXptOG1LeWc5WEtLWE9NaTFRa25TT3AvV05P?=
 =?utf-8?B?aStnNTcwTk1iY3o3aWQ1Sm5BNW81LzF5VG5ET3pzN3NZeUdJUWs5b0ZzMWxo?=
 =?utf-8?B?WkpId1JlL0Z3SWNtVjkvR2VUOXNVMEF6Y1NtSW5JQmxKODRuZkdBTXYvTHBz?=
 =?utf-8?B?a28wbkZ5anA2aWJ6ZUgxdmgwbjZpY2NGRlFVOVZ3WFQ5ZmQ3QmZEa0k1RlFE?=
 =?utf-8?B?UDdJaVUxak1GQUhZamxSYUw4cHV3aklMV2lWTUM0LzAvMUVUL0h0SXlxVE55?=
 =?utf-8?B?N3V5WDFScm0yUGRtbEE0M1N6NFdPdTNqcm9NaWtiNzN2RDF1ZmhiNHFBUEhE?=
 =?utf-8?B?YXA2WUgyK2JXUVhKdDJCRld1Wk1JNlBNa3A1bzBOY1BGdjRxMzFFbzVpOEJk?=
 =?utf-8?B?Tk91TmxSL3V1aXZCUUJEbVJEZ2FIdGdSeEVKck4xMmMyNXM5MUhuZzdRTTRz?=
 =?utf-8?B?WVJ3SE1OZWlqdzd2aWk5WjRvclMrNlRnT1FoT1oyaHNBUklIQTFZbHlkbmZE?=
 =?utf-8?B?UEJTQUVyQWQzQjhwb3Nsa1ltNFgvTGlWb0dYWUVtczBIYk9nWCtZZXRmUjJz?=
 =?utf-8?B?bzM0VEpFM09MSjZweG85RmVmQ3RidDZmTHBRNFhGdlBtektKcXZoekNhbVF1?=
 =?utf-8?B?ZnMvd2dXeVd0U25nTzk5eDVQS0VVek5qTC9zL3kzcy9CY3ZtMUlJQ2lUb05M?=
 =?utf-8?B?SDlpQldXbFk2V3RUcDdyYzRWSkRSejNIS1dXbWxWaU5halZVcmY4MDBtczJR?=
 =?utf-8?B?L3hQWS8zdk9HMjRkZU9ta3lmUnFxRXBiRnBBNnhRT0V6TEFiUDFIeStNdUhk?=
 =?utf-8?B?TklzUkNoUXMyWFo4cndVbFQ2cGFsN2ZWUURMZjA5K2VUWmtVSVJ1MkJFMVNK?=
 =?utf-8?B?ODJpTHZVaXZKZ00xK3RNVnNkK1dIam50WUlnYVJOUjdQYlpzL3M2cmxWRTRW?=
 =?utf-8?B?WnA2Z3BGYVVOWS91TGlmOXRtRVp3am1WdGtvcFpUTXEyeS8zTytwdlp2VVh5?=
 =?utf-8?B?RHlwZm9VMWpuOTgxdkRZbW90eHdzcmFXZWdsa3Btbkg4Q0laRGZ3KzZOT0lI?=
 =?utf-8?B?T01salBHZTVzcjEvanhTMTZPS0hZSHFMZnRzZW1BbEFQSVdzQ1FBQlY2Q00y?=
 =?utf-8?B?S3dpeDNiMnVVeSs3VStJT05vWUhiSXRveE5rdWMxTUtjWlc3aUtFaE9jc09H?=
 =?utf-8?B?MUpsOUpQVnlqK25BNHRweEs1NGJqWVVrRGl2MGxld3BqQTVoV21mZnBHMHQ0?=
 =?utf-8?B?MzREaHR5MElzaGIwOWd1ZUVPU0ZUQ3oxWjVpS05zbjJTbFVJRUI4MWZQTWJL?=
 =?utf-8?B?S0FuRTI0ZFFpM0cvS21SOStVRlZ3RGJpQVVRTDN4V0hnUWlwMlNuY3lxdEJu?=
 =?utf-8?B?ank3RXhkQ21rN0pMS29uT3JFc0dQVXYra0FqOUVoWmVnWVk1VHREZUFWN25l?=
 =?utf-8?B?dEJON05YR29ld1pRblNSQmUzbWY3OCtpaDU0MjNjS0pjaGVpb0o5V1FQTFUy?=
 =?utf-8?B?Z0MwNWdxeHN6RGFyM21YUGRxck56ZTJuUm9FdGJuQWF6Q3dFUEZYREZENGl3?=
 =?utf-8?B?YmhTNnl5NmpTWUhodUZUKy9qTnRVenF4UVo3MnFML3VuQ2Z4Yk80WHQvbVhZ?=
 =?utf-8?B?NGpuSUlVeXRuMkRwL25mWGhxODgxUFZ3ZzB6WktOdk9VOVg5UDh0N1JPaTFG?=
 =?utf-8?B?V0NkVHFGam52M0cvb1NYcUE0RnlXcTcvRTNNVi8zbXB2c1ppVVp2Vk0raEZV?=
 =?utf-8?B?RGFWMzNlSDVFemovZHR1N2lEMmdoUGpUb25TZzR6RWZJVU8zWmowWWtNdnVp?=
 =?utf-8?B?SkJGVUpyVWEyTVRxSVRhbmlkcEFSaVFyQ0x6ZlBvTTM2N1UraUFDcVRHRjNs?=
 =?utf-8?B?cm50NVpyemY0aXBlbWw3ekZsNFkvdlhUbkwzOE9XSzlzZnFkcEhienV4ck51?=
 =?utf-8?B?b0NMckNxdGtUWm1NMFF5MU5HZ3lvcGRVTU9Ic2tXSVJBRzZLZ3FmZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a1aca3-4897-4a74-c97a-08deb54b1f41
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:38.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/hTCdOzOMirPNy/h991LkIBKkqwNkqJBsLnoycvhoaEvrv2U4CrvVKOva56Pvz0r3pTgf53pyWE7sEw87L+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62066-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 32AFD5764DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the i.MX95 MIPI CSI-2 receiver. The i.MX95 variant is
nearly identical to i.MX93, with the main difference being the use of
IDI (Image Data Interface) instead of IPI (Image Pixel Interface).
However, the IDI interface is transparent to software, requiring only
a different register map definition while sharing the same PHY control
functions with i.MX93.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 8a34aec550ad..41e48365167e 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -154,6 +154,17 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
 };
 
+static const u32 imx95_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
+	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
+	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
+};
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -914,11 +925,22 @@ static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
+static const struct dw_mipi_csi2rx_drvdata imx95_drvdata = {
+	.regs = imx95_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "fsl,imx93-mipi-csi2",
 		.data = &imx93_drvdata,
 	},
+	{
+		.compatible = "fsl,imx95-mipi-csi2",
+		.data = &imx95_drvdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 		.data = &rk3568_drvdata,

-- 
2.34.1


