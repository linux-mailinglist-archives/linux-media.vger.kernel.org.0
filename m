Return-Path: <linux-media+bounces-65379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vvNVFE5HOWo9pwcAu9opvQ
	(envelope-from <linux-media+bounces-65379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:31:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C096B055B
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=T6zNeg5Y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65379-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65379-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99127300BEA7
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC2828640C;
	Mon, 22 Jun 2026 14:30:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D982275870;
	Mon, 22 Jun 2026 14:30:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138645; cv=fail; b=MKhP35rYCAA39Yyb3wsTQiwnh36RnTESQyBmdB7vubbr8nF7Th06HceafJSs0UwEe8NEh5/s0DHgbW55TAzqzMh3CBM5RdOisKh00JBHNTInseHyiNZI38sut8qBWbwcbVPTt/mALd0iRRMDhzajePKedWxjj7O5L2x9VPFd79o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138645; c=relaxed/simple;
	bh=KorDxmqkKxc7xiIh/AoknL4GFd0HkkGnANle5UznWR8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Pj+eNAyB6fVj0KjOoR7jNcpsoC7hGJHljgVuCgWZyBvfBQm/6RxcV3Tr21KAqo6FrwNugmecGb/o9Bp2H1C7mQck0+chhhgPkYb6ZkenDofspIq9da3m+SIOjKlD2T1TWfsuLlqtWbg6HfnyoZpfDvj6ux1SCQJx9jzVEMSUiiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T6zNeg5Y; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqXP/ClBWBox68ec4cVT2K9SJA5iOrg4/8kR3uMThuqSzHMDqasrMLeNJi7oQ4kVWPalYeWt3mXV7uFx87mgQN+ZtHQOcCPE8ELpFFyWko+aIFFCm1iG5XU43f9qQ977IkWW9y2l2vMZFlri0uzxqqDK5ncdGNrzf1NDXmRCcJHOyoC1sBkDd0aJyLHz+8+B185ZiXjMab8Yf/cPzo37N7HHneC9r+4rSwqeJHoHOVVEZvwFHW9iot0rnC+SNkavAdQESHpYeLSauIushLPBAlTFu85jTjqhgJ4Z7dGGw5IAZcpX3nW/1n1xyEgqKkHjn66tWgVT4lWpYrViPPNGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Fj08Cc/kFDSKb4uasLe3csFwXANWgASGo0euoO3TQ=;
 b=baqcmrDrbVyGKa8aGNnJIQQpnK/uRjDjcM2OoVtr1m+BQJ78hg88QTBsV9zibN9ExkpBEE/hvdTbOMWFlYcnhfsLck5uKZbEGErsuqwLU2Pe739PMp/1FOLA4Glfw90ysTNQFAHgEQ6yDNNYOyDKzD+vTHzUXQXuJojOBXMtgKJTwd8X/phKt+1J7bCapBV/PeJo8In6C47P0cftRBeNaW884FuRrN8rqMv6v7gdDCOQPGg/Y+/Xi8GWVHd5FkG0xI5blEgxIZhcOQq16LgxmbIxoKvIJ2Iw8I+g057jRtFD82QKLV+lLVbR23J1QJiJZykcGxglyP7iwIw9S0IfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0Fj08Cc/kFDSKb4uasLe3csFwXANWgASGo0euoO3TQ=;
 b=T6zNeg5YBzpCxFa+ArLwqDO2gxIUZqFSipf8/b6GqWCsGVpckmORdaKH3bjZiYJ6KMu3PpV2E1LlY95wUMHmUfag8eZmHy8d8B4Y2vUDZ14JhN6t+sW0MFj9fJ+ZnkZVw0ZxnI4Q4jADuIwtmvbLa4XjYWjp9Uto9lr2bwRwZ82p9JnxavWMFEdUsbgW+Q5Kzes2CfUs10c6Bj5bXwEkNqFVrRftEJ+SvM1YiVUlqePM+qmRJY8rFITMNNN/Fs3aeEtoPxEItfVuMTVrMv7qDFc7LD/kcdHebGBrbTJQYtYrmGPIv+bHGiiHp9mm88zGU5v+po3mVrLGldCGmq9K9w==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12304.eurprd04.prod.outlook.com (2603:10a6:800:304::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 22 Jun
 2026 14:30:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:30:39 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 22 Jun 2026 10:30:11 -0400
Subject: [PATCH 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-fw_scoped-v1-1-a37d0aac0a68@nxp.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782138630; l=1566;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=R3JUiRs25YkRuVcpP8iC4T7dsK4yZ7gPrnP/z3nRe10=;
 b=eoBAfJ4jJN5NA4JLh3K/ieLJRPUNZzKg06BQBKFXubamXbY9nbKVyfmAA1HujsZyma8WXAPbE
 j/AbLbIgHpQBoeTnaJF4LTsBGH9u4ekCtWQs7PsqUHh4oXNEOlvCLnl
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:d3::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12304:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fa50e7-016a-4776-3c53-08ded06ad52a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|7416014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 vYdNswABfNElUk6v6n2vYbT34Xw4p4eEA9sJ00q42rd57xrz2crjG4cLNuCell2kchS7VaMuoZXkZvRiCJSrsfQfDOgKnfDkPomdoUtjWnhJ01lgPP3hTVOrQrQTl2vsgBXNC9w+j2YNrmQiwLHnxZJ8zQWGs8r5/en/X5gS/YlposQE1oP5SfrNwv6jVJYLmD2tE4aJUNoAKcv4Buflx/nwI6vJ85kR9LZyn5e/UmiGb14avKaKFYtuiv242B5NBAu15zldyjnNKVC/WQcqsb+MhIpqf+s21eSbAd5Q/PXMcHB/xDXROmeagA5ysaJPKpjZhnETyFUuAJL3Q20KgT6ygqENqv/6rX59QvBdxTIRxujau11fzexfazRvdfjWNV+8ZY1NYfN8YVfclU6Ic0/O56GO236nVAL0Tgp7re2j/eQ8LUYTKMxTcbsm6/Ld9j0zMjvRrG7zkYIKvMjUUt5ab+kLUUe7qVGVMm5xYx8oqWcVNhYrGFVgCwpI5mdqtzv1O7e0r2TcjHZLB5/Cp6BDB3JwotbgtTXn1rFruGJHc5HZFbEIL62XQlwibOykXwFhfnuMSQCyzrmYIVR3iDSB3ViNGHrJEol359tzT0Q9/v174TNW9hZCQOmc/65W/xaXZ6H6EBJ3+kyh4sgrtB0fMUzRRMFJIj4AUnLe/hoT/M9ERjddALjzgL1uj58dOOfYbTKrfMfd+cyPHNSD6w==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZjM4SUVmTU1SdmdiaGlOL2hwT3c5cEhkNTVEOWdmL3NLUnd1eDc5RWwxUC9o?=
 =?utf-8?B?RER6d0RjYmpIVWVmTW1NSmYzZHdRSDg3VnU4emdpeU9KdmRha1FQZkdWWldF?=
 =?utf-8?B?bkhYcUpGQ2ZOcHhkWGdBQ0U3aDFqYmNBWGYwNmFRdG1iM2ErNHdYelJzS3RE?=
 =?utf-8?B?djRudk9jUFpBK2FKV0ZPYnIzZVZLRGx6d29PK1ZrYUdmTzJ2VzE5OEFNTWtZ?=
 =?utf-8?B?cVU1NXh5Ni91M1F0Q01JQjIzakVKd2doYzVFcHBOZU84Y3NOOWV3dGxYWENp?=
 =?utf-8?B?amRnQTFubjYybmZYYzFWTlhwR0twaHBpREMyNWpIbUYzdTRjS2pKNFdZeGRU?=
 =?utf-8?B?dlpZeS95cW9Zc3dPMjFPdUNBcmU3KzlVTU1xTEpZdHhXT3dBVkhnbmZWWTZO?=
 =?utf-8?B?ZGNDaUNPa3pYNUNvMVZrR3RPV2ErQjdOTWRvZlltL2lnRkJWeTYyWGx0bVpi?=
 =?utf-8?B?TEFxZnhZWDZlTnZpRGovWnljcTZIYmpCYS9vWnhGMStZSUZoVVMwRitFWEw3?=
 =?utf-8?B?blhmUDdLa3FLZnBoMWVsck5HQjd5MjM5K251aWdEcm1MWEtYeHRSd0FVZUpv?=
 =?utf-8?B?WWxXNko0aTdyMHRxVUNQOVl4dXNvMllWZUpwQVBtT2ZDcWhYdkwvSjE4aGVk?=
 =?utf-8?B?aTkzZ1B1WUpyM202RDBCUUVabmlpbzE4Nm9NVW9EM1h0NTZYRjhaQm1RN1g1?=
 =?utf-8?B?Q0VBV3ZzWHN6TENWWXl4S2l2bFp0N2RVRnMxVEF0aDJSR0pBUUhSOEJsSE9E?=
 =?utf-8?B?MWllNklCUS8wU0xMdnhGTDl6K0hiTjBXSmk3TXBqaGE1TU56NmswRFdQbUZh?=
 =?utf-8?B?eFNNdFRsRE80aFRlZnZGMHk4czN4R05uT3hZemFLQWNBY0hyRm50UkxFSDdC?=
 =?utf-8?B?N2JXS3BBYVJ0VnlJNzNKWW80c1FVYlBsd0pJZjhRRDZJaW9iei82eVcwVTN5?=
 =?utf-8?B?a0JkbHA0aVYrOUdZS0dodmFZb0NjRkNxMjg0anV2cWgzekUzL1V2R21DZGJ6?=
 =?utf-8?B?UUIyVWhBeEJLR3lzeHo1QlBBcytxNURKMGs2emVyYU1IVUFIcWQ2TDM5SE9S?=
 =?utf-8?B?ZTNaNVhsMUY1enpVM0t3TGZWMG9HSFZTL3RGNThCd3JudFk3eDJhblhQMThO?=
 =?utf-8?B?QlR2TW5WMUVnZ0o5QVhGSlh4b3A3dXA1VFhoSmFWUGxhRWRMb252VXM3TkRH?=
 =?utf-8?B?RlNjNnhPTTBPdENTQWt3ekZzMkZDZHFRVHRVQzR3UTk0QzhyNUU5SzNKcWJs?=
 =?utf-8?B?bnk4SVlxcWlxUUYyUTZpZ3Z5ak9FTjA1aEhrTy9YWlRvTnl4cXlTeEhLUFR1?=
 =?utf-8?B?YTIzSVFPdVV3ZzA4cG9JcTFXVkhpVGNIdFB3RDZUVGhPM0pLWlIwdGsrR0E0?=
 =?utf-8?B?RlJQcDZiWjcrNE5lRnpPcTI0Mm5JNjhQQnNnRzVmc1haajJtL2dmNEZmMXBq?=
 =?utf-8?B?b1BVeW9ielMrMUEzRkh3a3NJSWYzbmxKT1FWWHdxRGFMMzh3N2c1YUpmbkJl?=
 =?utf-8?B?S0VwaGRHWk10dVV5TzFXRk5CUWZNZWxsTVo0bXNRbUc4cWxBODVxSmMweGFI?=
 =?utf-8?B?UndOZnZLYUtsejhMRG5KRGR0SnNKMm9VTWZWUUd0MUV3Q3p1QTNGdmlCWVBT?=
 =?utf-8?B?a3JjVHdPUUp1Vk15QXZ2dEF3UlRiUVNmOWZGcXl1L2ROaXFmUnNEdjZNalBm?=
 =?utf-8?B?bjBaUzAveG9rWFRqeHpIeXd4eHVJdElaOEM5ZUx1amcxL3RQa1JMWGk2S2Ew?=
 =?utf-8?B?OXpLZGNhaXkrdmlHSE9qSWdoVDBpSmxxcHJZREtFUGtPTjk1YmFBTXdXZEJh?=
 =?utf-8?B?R2xwdk9sZnQzajlpZzZQWUtDZ2tSbHN0SjB5aDBQcUZTUnM4UVAyZVBHMzJL?=
 =?utf-8?B?bFliQkJKZ094WlpyT1dybDFzUFB6OFhrN241Q3BZNzNWMXlXbXpWZjZUZFND?=
 =?utf-8?B?eTVMZVJKZUZwMzdwbnNyMVJ0cnNkVVN1UUV0ZmgxMEJ0Uk1BcnV5ZnZLbHh0?=
 =?utf-8?B?ZE5FUk9OUms0VDJ5L0lldW92Z2FHeVF0Wk5ic0pLRzY2c2tENzRCMUN0S1Ja?=
 =?utf-8?B?TnY0WmxhcWlvcjhBRk4zcitsMnM2ZG1qYi9VbEgyK3gzUFRyREZKSThmQnBv?=
 =?utf-8?B?TU9NaWFEYTNyUG50aUQ0RWNsWnN2VUJNNk5DakU0UzVBZzh0VEhGTmVUNUFH?=
 =?utf-8?B?QXFLT05ZaU03MGdMNkl6ODlKczVJa3hWYW9tb0J5MlFvbUtlZ2dkVzdJOUNi?=
 =?utf-8?B?UUJTem9zd3NhQzc3d0I0R1VSQURTTmV5a2Z0WmM3N3dNblJITHZhdFFaS0Ir?=
 =?utf-8?B?K1EvcjVqbngrQ2s1SXUzZXo5c25mYkZyRVRtVHpsUDNLVjAyYTV6TjZYZFlU?=
 =?utf-8?Q?RxX1KXe4k68cE/IE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fa50e7-016a-4776-3c53-08ded06ad52a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:30:39.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XldSBynuisgEaXMS4IA1HBII7M/DZ00XUWXlM4TBjOgbBfydPgkLp2w0JzQTWoxHGwov+oGK1mYO9D/L93fU7EFnbU5wpI2BqIdZPmr3FrCAutUsBkAUnNIbJs/UCpE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12304
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-65379-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79C096B055B

From: Frank Li <Frank.Li@nxp.com>

Similar to recently propose for_each_child_of_node_scoped() this new
version of the loop macro instantiates a new local struct fwnode_handle *
that uses the __free(fwnode_handle) auto cleanup handling so that if a
reference to a node is held on early exit from the loop the reference will
be released. If the loop runs to completion, the child pointer will be NULL
and no action will be taken.

The reason this is useful is that it removes the need for
fwnode_handle_put() on early loop exits.  If there is a need to retain the
reference, then return_ptr(child) or no_free_ptr(child) may be used to
safely disable the auto cleanup.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 include/linux/property.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db46648..ade194c462d42 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -545,6 +545,11 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
 	for (child = fwnode_graph_get_next_endpoint(fwnode, NULL); child;	\
 	     child = fwnode_graph_get_next_endpoint(fwnode, child))
 
+#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
+	for (struct fwnode_handle *child __free(fwnode_handle) =		\
+			fwnode_graph_get_next_endpoint(fwnode, NULL);		\
+	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))
+
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 

-- 
2.43.0


