Return-Path: <linux-media+bounces-18741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A075698956C
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 14:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A95C285004
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 12:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962A71791EB;
	Sun, 29 Sep 2024 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EImY28Bh"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB43145345;
	Sun, 29 Sep 2024 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727613624; cv=fail; b=bgN9uqYMjjgGlL9HVqk8cJP1CtW20BBWrdefLmTeNNeWp+Ihf6TTyceggwMKCIF9qOI7ELLbtxkdROZPhnRoaBpZ4Gm7Xd0PMMuOsdSI9dIlT9LeYc+J9jmv7MvGn1+XqDuspnD2lmLuMUXXVXAJTL42IREdR2G2DAnZRbBjI1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727613624; c=relaxed/simple;
	bh=o3eQvGFsBUYGWbsvLpm2g1+cwYsDBkJsoNURlqjzwZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ecEmmG1Tc5TTpiSLg2StoOKg2vqh1ceBVFPc6rjvXnJWrnZpSijXvZq2DOcoQ1dYqxZr9KF8CF5nRh9SC18JM0ZgctzKHhLAoGBjy8g8K+GPIoqohQpltyTXE7Mk9IGmraDVDegS5Gve7hNViBHaSA2J8txjQx2Syp2oBCVtUCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EImY28Bh; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnepPwUKd6QOsQzSurW2n6x+y4seFZOSnaei5eRpnfnFFZxOZZnPxq/WdlrjSi3oT7m0LqmwzrrZDCI/Cn4CyxFx+mD1GcbbJyk9IHHcTbDauG/Pbsi/osV1oZAYmhZydm4oe+fs+B8X0caTlGSNKEmvRhRAcqU/HmXTw0qMTXjQEAWG/J9st5CUVIxsoSLH2Y+aKk0kOwn1yn6LRPHAEQqr79UAMp9WalpzaLA3O7vxntURBUEJTqxjfWes82gKJClHvfclO0IYwrodQyot0l10ZWS6kPJtfISqqJ2witD91iZ1jrBhTjA3b1hObmLqky3Vnz57e5hT71RjAuyMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3eQvGFsBUYGWbsvLpm2g1+cwYsDBkJsoNURlqjzwZc=;
 b=YFvUyVGP1xWH2kONzQBen87kQB7eORYo7S16aOfxe3sRWnc6vdT0FyR9QsLjqZ3JuqqAJ/iSiL33UQuZ2Sdz4Tiy8CGnnJ9AlQKe+osmTbi9TEjxSH7kSYJpZxZ5cmtc4nWKJ1qJSoN0aiNF4oB8Z54NESVpXGWH8X9XecM0JQjSYWwNCLi5kTLS3tYVYR1AQE0DwsbWJVejVESPYnBK5lSRcuqs43QaMOEdB6MLsBzvIn6kNvDbtUrA88qaPaV/7H0KJD1W3ISZtpLiB5B+EQvOcq1YUBKdhm/2rHF604NqFL6XaNvUIdXFIqPyeAZTpqg7fOlPK1UnOyLHMf8lMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3eQvGFsBUYGWbsvLpm2g1+cwYsDBkJsoNURlqjzwZc=;
 b=EImY28Bhy5iV6NOfZug8OfQJn5oZC3Y79UoFBIbxRXUrN3RXpKNgMbM7ktsGu5fIzCTLY9GvKoDhohV/VHZ4/3di1dTCyplhg7rFkAqwvUzVRO2Ix4tVZQXWAt3b3ZU/c6XAPwkXWzeGM5HZQvQdozK3bdktPGTFrAzCSqywTfU7PcMAv1mDiT7EXsQbk2JRwRJF5m8F81gh4S6sUap86HjIO+DSuPZXMiSjxafWqQhBOQrUKbK1zz62RenDCNWvRStR67liLYwuw6HHSVECL1skmev2Pg3ef2luN9jdmQr/EBvlTw7B7U6+hJAhgX2FfBuQHGHoiubG9bno2Cdy8w==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Sun, 29 Sep
 2024 12:40:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 12:40:17 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "martink@posteo.de"
	<martink@posteo.de>, "kernel@puri.sm" <kernel@puri.sm>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: nxp: imx8mq-mipi-csi2: Fix CSI clocks always
 enabled issue
Thread-Topic: [PATCH] media: nxp: imx8mq-mipi-csi2: Fix CSI clocks always
 enabled issue
Thread-Index: AQHbElinQYwLw3snrEadHW7jmD6VMLJuqcOAgAAK3uA=
Date: Sun, 29 Sep 2024 12:40:17 +0000
Message-ID:
 <AS8PR04MB908017B624D12189761324E7FA752@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20240929101635.1648234-1-guoniu.zhou@oss.nxp.com>
 <20240929120051.GA31662@pendragon.ideasonboard.com>
In-Reply-To: <20240929120051.GA31662@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8638:EE_
x-ms-office365-filtering-correlation-id: 6852a907-974b-42a3-4bbb-08dce083df76
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmFWR0RZb3lUWDA5aTArRmgrTy91RU9DT2JNUHFKZU05NWo1MEMrQnptVHJM?=
 =?utf-8?B?MEo3dTRWQTFBVU9Ea1czZWQ2TjFkYXkzZEh2V3JRT3poYVJWKzQ4RVZ4dElJ?=
 =?utf-8?B?K0ViTFhXK1laL3IwdmVIbGdDekpTcGoxY2dyMTZLaVNyOXRzUklBenlVNFpX?=
 =?utf-8?B?TkdzVzZyS05KTkxKMU1DTXdqYnRvemxyV0JhLythZjdPbmpUVmYrbTF6bWdD?=
 =?utf-8?B?YXIyVUNLbFZJZEZwNkI3cEFqUEt5c09abFRldWlZZ2c0dkdtdmxLZVlxb09I?=
 =?utf-8?B?TnZVTG1RQUlUYjdWN2ZQdTMyeGdBVmFlandLNUtOZno3TXJZTEdGZEtLRDZC?=
 =?utf-8?B?NGJlMnFiSUFUa3NPV3F3cUcxQzNrL0FPNzYxRGlYWmVSZ0RTbnE5UDkzazVi?=
 =?utf-8?B?TnRKYUNHMWNCOUU0d2ZxS1loaFo1ODFCc0w2bTg5UTRERDJjMjhCNHJFdGNB?=
 =?utf-8?B?RXZCZW9iaUJoa0l3U3l2Q1BVZENBbTZXWUlDTk9CSUdycS9abXRlVlhnWm9R?=
 =?utf-8?B?d0FWSUV4Nm4vN211VVNWQkJodFRUVDJOQXJtOThHd2dDM2VMdklEdEg3WWJZ?=
 =?utf-8?B?anpTc3EvTDhhdzQycWdBWVVJZHdicWR4Q295WFNEVHkrcFd1dXZzbXVhTTdB?=
 =?utf-8?B?cDV6bHRKU081RW16NzkyemNrbEd3SVZFMXd4VlNDdVRQaVZKK1czYmNVeGda?=
 =?utf-8?B?cjN3citrcjhKVVptUzltYmIxTUhDY0k5THZqbi85cjVZVTJKelpZWXBKOHRB?=
 =?utf-8?B?NUh4ZHBvNTAyYmNMaHg2N1piaGdyTzIwQWlaQWxGM0tXREdPQWpZWHQzS2xS?=
 =?utf-8?B?SlRuS09IRllTR3ZkcHAxaWw5eTdhMFVFa2xaM015NElHUm9hczRqWS81OHNk?=
 =?utf-8?B?cG1pZHhCS2JOa2hnM2J4K0draHo4YlkvbDFUcnRLNWZiZC9BMWhXcTVRRnVN?=
 =?utf-8?B?aE5JUDBrOExJTGxLUTJhMXBKbUZXVjlWM0dNUUZtUExwVVp2VlU4b2lYU1NT?=
 =?utf-8?B?UFVRNlQ3OWVsK1FFR1JUNnFyQ01WRXgwVm5NUE9mWUV6dXQyVWJpSUFFOS91?=
 =?utf-8?B?MGFKNlhaWkJyRnF2RG5WR1RtUk5TZ1V2ckJncTlib3A1RHczYmpZenB0a0h1?=
 =?utf-8?B?Y2k0V2hZSXZYZ29qKzNtVDFicTdBSmxxR3lLVzdPKzNZNndUZFVCMGdpMlhM?=
 =?utf-8?B?NTh4V1QrMHVuY0FtTlFHK2NJbUM1YnFRdE1CWllQZFBYZ3Bpc0ZoL0M0Z2ZN?=
 =?utf-8?B?RC9GRXFIOGhKekhhcEpDN0gwQ0N4VUQ1NWs3RWlSc1RhZHJyWCtVQVR6ZW9s?=
 =?utf-8?B?K1ExVkVvVnY2VUE0dzh5ZmY1NksyUnd6UHJTQ3AxOWF3UVlJV0JIeGN1RVY1?=
 =?utf-8?B?YW5pZWxRdmdjNjRZdkRGRUlwQ3A5Yms5bklVOGd1MTlvT092QnFwOHkxbHNF?=
 =?utf-8?B?OTlKdXFTMEE3NWRwUVlsT3hxMExhUW9yYjJscU9RQkJscGhyMGo4YUViaFE5?=
 =?utf-8?B?RUkrbFBNS0pXVlczYjNLMHNpbjRkTS9JalhqUnROZEtidEgyNFY2TXRPRWIz?=
 =?utf-8?B?ZU9qV05UckpmYUdOVkt1U0ZhcVFBd2RCeVBxd2ZNd0ViR0VxMEhkR3pWS1lj?=
 =?utf-8?B?Y3FuRGdMakJuN3ZWTUR0WHRXdU1TR2JmU2dzYkUySDhqQngreTZMWXQwaTkv?=
 =?utf-8?B?OHBVU0hNSXpiaXpPdUQyaVNPL2ZTOVR5NEI4UGxsS3JvTGQ4djROc1NEKzlS?=
 =?utf-8?B?YmpjcXVlcC9INnFrYktHRmxkUjVzK052RWJHWEsrUUc0ZHp4UUpHeTY4MVZN?=
 =?utf-8?B?QTJtekZNdDN6aTNIYnBDaGJVM0ZjeFVsRG1FYzNGQ0JWcTk0N1ZjdFhXVGVS?=
 =?utf-8?B?ZG5rTCs1ZU5QSFoyRW9GUWlsK2dUeDFMUFhvQ3BSbWdBNEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2RDa01EbENYcDlZMW1Md2tkdmVrYlp2TDVEYkpFL0kyYkZSVmtoY0lKV3Fo?=
 =?utf-8?B?NkQ4VWkvS2RtZ0tDUFNCa0NQQk80b05CZ2J1M1FEYW96OTVxZ1pEckR6OVhv?=
 =?utf-8?B?ZGMrS2Exb2JkMlpyeXBrbXhpZkRWTWpyVWpUNG5TR29uMVBRb0hPcFUrbXR0?=
 =?utf-8?B?bW4zQVh1VkJWbUxoSGdoV0dNbzVidU04dVNIcWU1em40ZkNYMEtLd2Q4SktR?=
 =?utf-8?B?Njg0OXB4UjJHbVlKOXR0MFpEZXhDSkdUQTR4SE1lb0tCSjN4cmlOVDd5dkIv?=
 =?utf-8?B?RVZBd3dQZE9WWW1UUW1XL3VYRWtzcXlkU1ZKMlpTQ2E5OWE2dXhXOXNEbWtw?=
 =?utf-8?B?Yy9QUDkxS1RWRkozV25WQjhGWUJNU3NoTElQeHVCNjllOXdVN2RGdytZNmNi?=
 =?utf-8?B?REJ5QmhiSThmUHhKam9MbzM5T3FFWmMrQldDaXp3VnJNVnFjQ3BocmphbUdP?=
 =?utf-8?B?U1BMYnlJdjFBT0FiSERLUmw0Z1E1ZzVLOGhuN2h0RXR3S1A0QjhldkZwem1I?=
 =?utf-8?B?YmZWcGI3Y2lpazNtMThnQmlrdGdYUzhLbWJ1R0laU0lsMHFJb1hFbkxibVl2?=
 =?utf-8?B?OERiRHdxSEVvOTlJZW5JcHJpbkd6SlBGRGg1azYwU0NZbG9NR01JeG41R3I2?=
 =?utf-8?B?TTB1c0QyVXBxSHNhWDlMbWVibmNEWkJVNmFOS0pNejlBSDRNdlJLODNzSHY4?=
 =?utf-8?B?RXUwaU9SaC9BQUVxUnM0K1lvSkRyNWVKdXJkQU40UGJwRG9wOGFLRzFrSXpp?=
 =?utf-8?B?aDFXN094djZwcnRHNTdXY3Z0OEJPTXUvNDl5WXFtdkNRa3hDNUhWVC8vbytZ?=
 =?utf-8?B?R1VyRkVzR1h5am5YQ0VFWFZDdWNCTm85SzkyY1duT2l2UGx2ZDJLWUg4Ykwz?=
 =?utf-8?B?YTMxb1o0TUxwODVqUDl6enhoRldpb2JzQmZKd0IrVy9CK1ZpWGl5Z20xeERU?=
 =?utf-8?B?RjBranBsU2ZnazdIM2ROWVZzL2J2aEI0d2NVMVdSbm9aVW4wNmY3V3NqRGk5?=
 =?utf-8?B?a3pxdFlqanEzYXZKQ2M2ZU51RmNDWVNMR0pVUXhsZStWOU5Jck1TdnZRNzRV?=
 =?utf-8?B?WW5XZXV5UzhKd0I4TWZtaHBSZ1lBMzl6OXo1T3h1UXMyU0ttL1hZNVZIcVN1?=
 =?utf-8?B?S2hnaGdCbjdFbnFwT3YvMkV3TXlYNWNxeFZrR0NSWHUvQkRsZkdUcVlBMmN6?=
 =?utf-8?B?RVdQUVVvQnNkVGN2eE9QVVdHMG90L1JxaDA5K0FwTGlMM09vQzFuK2x5a3RE?=
 =?utf-8?B?RHBsWWNzQjJwUGx0dUNsdjd4eE8wdDFNNi9WOGh1M0FhaGpNYnltR0ZYaXdB?=
 =?utf-8?B?TnVLbHQrcytuSTQrVG1WNHFhaU5jblZsSDAvajR2WHRHWXFkL0tNTWs5VXlS?=
 =?utf-8?B?bFVuSWlsR3YwUHo2ei8zQW5Hd3ZUc3I2MlRXQTVreUYwQ1B5a2ZNRURjajF6?=
 =?utf-8?B?aGVtSnFxcDR4T2grUk55VUVFQnNyQ1VOdHdDL3Z2cGFkRkFPUXZYRG01N284?=
 =?utf-8?B?KzFDU1RzeVFnUDE3dit0azNnYWVqL0VSZFdiY2VmSHJrYjcyaUovc2VsQUl3?=
 =?utf-8?B?SzRVYmJ5R2lsaFE2K2xyMjBJaC9YbFo0MkFyQ3Y4MzNpcnJZLy85OHk2K0hn?=
 =?utf-8?B?aEVGWGNENGY1OG51SFJhOUdUOFBKRzJFTHA1Vlh5Tit0NHFXKzhzUTAzT1Yw?=
 =?utf-8?B?T0paQXJDSzdZZFR2UjVXOWx2cmp1U0xYNUV2RnlEbHh6N0dZTUJtcGhHcUE5?=
 =?utf-8?B?ZnRuKy80MmlkMEJpY0JnVDB4YXl2U3dzNjl0Vjhkd0UzR2FYQUZBSzl5dm5G?=
 =?utf-8?B?SjYrTS9jS1ZoRElSZWduUFRKUm1BTUVPUGl2NnhCbkJDMnRPTkpYWi9BZER1?=
 =?utf-8?B?RUZEcHROdDRIQkpEMmtNWW9PeW83TjkrcENUUk95WHI2MFpYNjhnV0ZGTUt2?=
 =?utf-8?B?V3NhK1FlNXVIZ2h2aWxTODBNaFJIRjlXa1VNZ0Q1T2JzbW1ycW9JTkhCak8x?=
 =?utf-8?B?d1JnWEtzbHZsMUx0RUUzWFBhMUxQMHdQNzMzdGp5WE1oUCt6QUY1aWZzWWNh?=
 =?utf-8?B?S3JJbXpZdVNQZkUvTlhvaU9RSFRiOXhyMGpQRnphdWpIUTA5RXV2NzFaRGxl?=
 =?utf-8?Q?ul+XjoiX6zK0MGx9Y87MEAJ6P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6852a907-974b-42a3-4bbb-08dce083df76
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2024 12:40:17.3663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rOSHNhDPKLOhwybnj6Pld/ZgJh6PLtc6b9S237GeigKh/urSOEjR3CZoAWTJK6+YVAzkupQpBuDy7YEV03uljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFN1bmRheSwgU2VwdGVtYmVyIDI5LCAyMDI0IDg6MDEgUE0NCj4gVG86IEcuTi4gWmhvdSAoT1NT
KSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+IENjOiBybWZyZnNAZ21haWwuY29tOyBtYXJ0
aW5rQHBvc3Rlby5kZTsga2VybmVsQHB1cmkuc207DQo+IG1jaGVoYWJAa2VybmVsLm9yZzsgc2hh
d25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4ga2VybmVsQHBlbmd1
dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4
LQ0KPiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gbWVkaWE6IG54cDogaW14OG1xLW1pcGktY3NpMjogRml4IENTSSBjbG9ja3MgYWx3
YXlzIGVuYWJsZWQNCj4gaXNzdWUNCj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLg0KPiANCj4gT24gU3VuLCBTZXAgMjksIDIwMjQgYXQgMDY6MTY6MzVQTSAr
MDgwMCwgZ3Vvbml1Lnpob3VAb3NzLm54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogIkd1b25pdS56
aG91IiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPg0KPiA+IEZpeCBDU0kgY2xvY2tzIGFsd2F5
cyBlbmFibGVkIGlzc3VlIGFmdGVyIHJ1biBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUuDQo+ID4NCj4g
PiBUaGUgY2xvY2tzIGZvciBDU0kgd2lsbCBiZSBlbmFibGVkIGluIGlteDhtcV9taXBpX2NzaV9w
bV9yZXN1bWUoKSB3aGVuDQo+ID4gc3lzdGVtIHJlc3VtZSBhbmQgdGhlIHN0YXRlIG9mIENTSSB3
aWxsIGJlIHNldCB0byBTVF9QT1dFUkVELg0KPiA+IEl0IG5vdCBvbmx5IGNhdXNlIGNsb2NrIGFs
d2F5cyBlbmFibGVkIGlzc3VlIGJ1dCBhbHNvIHN5c3RlbSBoYW5nDQo+ID4gaXNzdWUgb24gaU1Y
OFVMUCBwbGF0Zm9ybSBzaW5jZSBpbXg4bXFfbWlwaV9jc2lfcG1fc3VzcGVuZCgpIHdpbGwNCj4g
PiBhY2Nlc3MgQ1NJIHJlZ2lzdGVycyBpZiBydW4gc3lzdGVtIHN1c3BlbmQvcmVzdW1lIGFnYWlu
LCBidXQgdGhlIENTSQ0KPiA+IHBvd2VyIGRvbWFpbiBpcyBub3QgYWN0aXZlLg0KPiA+DQo+ID4g
SW4gb3JkZXIgdG8gZml4IHRoaXMgaXNzdWUsIHVzaW5nIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVu
ZC9yZXN1bWUNCj4gPiBpbnN0ZWFkIG9mIGNhbGxpbmcgaW14OG1xX21pcGlfY3NpX3BtX3N1c3Bl
bmQvcmVzdW1lIGRpcmVjdGx5Lg0KPiANCj4gSSB0aGluayB5b3UgY2FuIHNpbXBsaWZ5IHN1c3Bl
bmQvcmVzdW1lIGhhbmRsaW5nIGluIHRoZSBkcml2ZXIgYnkgZHJvcHBpbmcgdGhlDQo+IHN5c3Rl
bSBzdXNwZW5kL3Jlc3VtZSBoYW5kbGVycy4gQXQgc3lzdGVtIHN1c3BlbmQgdGltZSB0aGUgZGV2
aWNlIHNob3VsZA0KPiBhbHJlYWR5IGJlIHN0b3BwZWQsIGJlY2F1c2UgdGhlIHRvcC1sZXZlbCBk
cml2ZXIgKHRoZSBDU0kgYnJpZGdlIGluIHRoZSBpLk1YOE1RKQ0KPiBzaG91bGQgaGF2ZSBzdG9w
cGVkIHRoZSBwaXBlbGluZS4gU2ltaWxhcmx5LCBhdCBzeXN0ZW0gcmVzdW1lIHRpbWUsIHRoZXJl
IHNob3VsZA0KPiBiZSBubyBuZWVkIHRvIHJlc3RhcnQgc3RyZWFtaW5nLCBhcyB0aGUgdG9wLWxl
dmVsIGRyaXZlciB3aWxsIGNvbnRyb2wgdGhhdC4NCj4gDQo+IEknbGwgc2VuZCBhIHBhdGNoIGFu
ZCBDQyB5b3UsIGNvdWxkIHlvdSBnaXZlIGl0IGEgdHJ5ID8NCg0KU3VyZS4NCg0KPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW9uaXUuemhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jIHwgNyAr
KysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14
OG1xLW1pcGktY3NpMi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEt
bWlwaS1jc2kyLmMNCj4gPiBpbmRleCBkNGE2YzU1MzI5NjkuLjE1MDI5YmI4MWIzNSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2kyLmMN
Cj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2kyLmMN
Cj4gPiBAQCAtNjk3LDggKzY5NywxMSBAQCBzdGF0aWMgaW50IGlteDhtcV9taXBpX2NzaV9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UNCj4gPiAqZGV2KSAgew0KPiA+ICAJc3RydWN0IHY0bDJfc3ViZGV2
ICpzZCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICAJc3RydWN0IGNzaV9zdGF0ZSAqc3Rh
dGUgPSBtaXBpX3NkX3RvX2NzaTJfc3RhdGUoc2QpOw0KPiA+ICsJaW50IHJldDsNCj4gPg0KPiA+
IC0JaW14OG1xX21pcGlfY3NpX3BtX3N1c3BlbmQoZGV2KTsNCj4gPiArCXJldCA9IHBtX3J1bnRp
bWVfZm9yY2Vfc3VzcGVuZChkZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJcmV0dXJu
IHJldDsNCj4gPg0KPiA+ICAJc3RhdGUtPnN0YXRlIHw9IFNUX1NVU1BFTkRFRDsNCj4gPg0KPiA+
IEBAIC03MTMsNyArNzE2LDcgQEAgc3RhdGljIGludCBpbXg4bXFfbWlwaV9jc2lfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgCWlmICghKHN0YXRlLT5zdGF0ZSAmIFNUX1NVU1BFTkRF
RCkpDQo+ID4gIAkJcmV0dXJuIDA7DQo+ID4NCj4gPiAtCXJldHVybiBpbXg4bXFfbWlwaV9jc2lf
cG1fcmVzdW1lKGRldik7DQo+ID4gKwlyZXR1cm4gcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2
KTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgaW14OG1xX21pcGlfY3NpX3J1bnRpbWVf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
TGF1cmVudCBQaW5jaGFydA0K

