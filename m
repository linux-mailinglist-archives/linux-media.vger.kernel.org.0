Return-Path: <linux-media+bounces-47534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE5AC76FF7
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA89734A058
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A86B26B755;
	Fri, 21 Nov 2025 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pFRkIC+z"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4623ABA1;
	Fri, 21 Nov 2025 02:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763691691; cv=fail; b=DZe0Defxt4kcMZBM6PkNL6r9N963aUUA7qERKN7fAZ8LFyZ7/4zUWxO7qNPL4VqGP3JduXVbvETJU2HP6UgkkT4gY8RPvQUPZpgtVycU/FuGB7WwCp0KCQEIrsh95oDz5yJf1y46U0bjQqIxHB662PvTS0xia97fq+uiYpSm9R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763691691; c=relaxed/simple;
	bh=V94Qz6lgViSfBkYKwLzHc+dwfHH4O4KeqTvGcvpPp7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=km+xj2WOHuaTues7H/OnmyWHpsgOLLIZFtaLMMBkU4ps+KyBFTTp7OK2cjifnIdKO8mneSDiHEhEaUTKCb0kqA5Vd7fN0Ud10jrYQlWdfesvp8vEXg7P9nYTPkz15ufpDy4dHM7JbV/b+w5bPXxil2abz8a1qcXFgo+kyjTF/qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pFRkIC+z; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvHmQQQyk9e6EfTjTQfZm7PHn/2KvOxODukQX6uArwM1oes0SvOWaLuwsJ0MNBMdeJcjF294PuwBnR3kU6E2tZlJewMfdiIwYpfQlHvyaRUHGTl4bJOSaUhO/W48lEi5K+hn5whK7JQLsfDWY1pcI5fAPQ255GULOKu8gvuTA1kU99AXnfddYdSTU44qree6wP+OKNi/qO6TL2TDkNfk/lADTzLLTI1aDNpwrE8JZUKB91waxSNMEoBrC26JCy4afwC7/ZyZ6qau1ICJrKcmQl3kziA6FQYJWl86dOklzxioCXFMBn6HhPy8EUB9bpT6FYkcC0Fy2IcN1AzbcIio2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V94Qz6lgViSfBkYKwLzHc+dwfHH4O4KeqTvGcvpPp7c=;
 b=QhhQHsgrnbGB5/Jg9q+hdLHdH2fMLwuS59MJr2TBL+6xgtjM1lDrk3Wgzs5s4KcMjstWAy7GaoKcxr2TeivxOsGv7bahm5aAWRzOsYE5ZGAB2VNrovs6OYKnfNiMMK2NKPfmcKzkGw3Jlgm/oMrqXRAmklYc6zbnL0umuYu78aYmJ7ofIoWmzHmKq1G5UzDuK6CTs34iwddXI2yexprF7uJSmz00fQKKJoWMk7v/zdPRUhW0HKPXVzPhWK7OeTf7IhQffAgYD7b6A+Nep+8RcCpB0dhklTpSARuw6RLzo5GFTW2+GNrey/AMM30U/JFpMqaxNJWXDcvZwjmXd5xivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V94Qz6lgViSfBkYKwLzHc+dwfHH4O4KeqTvGcvpPp7c=;
 b=pFRkIC+zogDoeBCSBrRx5i7Od559G06E+Pm5pTameaSxkib2+iuvrdtRylvft9SFzJQAEfLg9rhlDdQGIsy73LWtnZJZ1yw5oKAHm/ft1EJVdoDesKFMQmlC4uXibcROzVYWtfo6opR59cFo5GN9SBHn9CaUVQWkRboeFgsWGHrNqrUyeOC/XWu8PeULayvui/N9dR9X6wtaMy4dBQbL9VmJ6f1uFT+nqtR1SgZtTsntPC/NXNWcOpeCJOLTZsyPWyjAuj602z560A2b3OEF8L+Alw8idE+YgkQumCadYI8tcUhPEx4ncQd4evQRnFz5LnZjOCk8tStzzCws1DojNQ==
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by VI2PR04MB11274.eurprd04.prod.outlook.com (2603:10a6:800:296::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 02:21:23 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:21:23 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger
	<martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Topic: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Index: AQHcWo2HVS7j1n0WlEiA2IZnSMRQAA==
Date: Fri, 21 Nov 2025 02:21:23 +0000
Message-ID:
 <PAXPR04MB9089072A62500D6C01881A38FAD5A@PAXPR04MB9089.eurprd04.prod.outlook.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-2-5ecb081ce79b@nxp.com>
 <20251027001151.GN13023@pendragon.ideasonboard.com>
In-Reply-To: <20251027001151.GN13023@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9089:EE_|VI2PR04MB11274:EE_
x-ms-office365-filtering-correlation-id: ac7c719f-8e83-463c-9d23-08de28a4aa6e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGxISHBFdWlCVkQ1QlpIcW1KVDBEZld4YmpiSGc4ZEEyK2lqa1htVnFseVpl?=
 =?utf-8?B?SGowRnBqejVta1NhRW1pVlVOemIvZHR5dStseUFLMlJGbVNWdkxjTWo2d1lS?=
 =?utf-8?B?Y1ZlZS9ZdUpkQkZ2ZjMwR0I4VnNWRno4ZUMyNmpkTjdPTEJUaTNjRXN5Qy9D?=
 =?utf-8?B?Qmd6VllGbUllNTFHTld4ZU5VbGs0T0E5L0FUQ2FDNDJHdDRPUC8rOUFLY3ZL?=
 =?utf-8?B?endFNWxML1liR3BDQkFYZmVScU1EUUVyYkhkMkJtc0RBWFQ5a1dqdEpaUzVT?=
 =?utf-8?B?OUl2RzlyZFQ5a1lvS1U4RDlDS0ZCVTErNktLeEZNd0hCWEsxd09uL3l5TFc2?=
 =?utf-8?B?TVd4b3Y5L3U0SUs3NEQ0MFQxNU02d1gzenFxMHQvR2lMMmg2YjBuVThOSVdV?=
 =?utf-8?B?UWtlZGVPNmNXcjRWOHpXZmVzNnQ2V2NvaTQzNGx0K1ViL05CSzY3YXhYV29V?=
 =?utf-8?B?WjFWdU81NkdzNjczTXpENU5WYlZGVVI4Y082dTY1RFAzRlNXYTBnR2lMY2tw?=
 =?utf-8?B?L1ZXVFlCb3J3Yk0zUC9zUmxncit1YWIyRkNMWGh2ZDk0UjZ0R1paN0MvYVJE?=
 =?utf-8?B?dlR2dUZ1aUlaemVoYlBDWlVVSzhkaVpvVXJpa3NCa1ZueW85R3JzZ24wSXpI?=
 =?utf-8?B?dE40SzNtT3RMZCtGNHJDSnFpMjlRVzBHVWI5ZG9RQUdmSmZZOUZqbURtQnpq?=
 =?utf-8?B?dGNMRUY2TGRnZnUvTlJUVm9ia2VuZE5zOVpudFBNaG9CVGtvVGczWnI3QVAw?=
 =?utf-8?B?a3ZZaXI5VUhHZGFvZGc5dGM3c0pXNnYyNG9vSVlhcGdpSlhMNkpJUERIYmg0?=
 =?utf-8?B?MWRDbFRCVkpFUDVQSjNZWFVVRjdaMnhjNjNtQWZnbEtvcUlPNjUrYlAreVVn?=
 =?utf-8?B?YUViUEhTbjhsTkFuSlc2dEU0SzNZcjFuRVdMc3dqak9wS2JHNm1YQUdVMzBl?=
 =?utf-8?B?L0lhYjN1SS8zVTNMeTA5clBZckpDdTNobnFSWGdkWUVxWmlSK0p5ekErZ0Q4?=
 =?utf-8?B?NEFSbFhQSGM2eHJKVmY5d2I0QTYxTFRGMGVlV2FCUjdRVFpSY2lodFpuUW9q?=
 =?utf-8?B?UDFoNzhWa29Zdk55Q0pyamNVSlZGVVFwaWZwMTJKSStkd2hrd002K1QxWndR?=
 =?utf-8?B?cHN5bWNPUWRSRXEreE9nWjhabm5JcVgvclIybjRvM3RlWmVnQ29jRWdvejFM?=
 =?utf-8?B?a1NScTNsRFAvT2FHOW1ZU21CQlNiWG5ITGdGVjVaSUtwOTA0UW1wZGJCMWJG?=
 =?utf-8?B?MDU3TEhqS2tIQkJEM3NJeGpkV2YyN1FMcFpSY0U5WkFMKzhWUjJiM0EzQlZx?=
 =?utf-8?B?NjZaR3J4UzBzanNxbUtBUUFFYml0K05jRTNtYmV1Y1dEa2l1Y2Q5aThTdE03?=
 =?utf-8?B?TjBZQlBYMlAvclJEbHhFMStXK2pudFEyakFaRDQzOWgxRlR0WVNwOWFaeWxX?=
 =?utf-8?B?WXZQdGtFSEgwam5tVWVIVHk3emVMY2JQejk3L1d0TmhQdXE3dGtCNW1CTHJ5?=
 =?utf-8?B?bnI0MTd2aWpMNHFFbGpvSWhkUGlad25QeVpUb3J2YzN6eW5Jb1B4SXp0Qll5?=
 =?utf-8?B?VG9FWkY0V2g4OWYxMll2bTVyeVJZa20yNmFjUjhKcWR6eTRxaDRrcWFPT1BP?=
 =?utf-8?B?ZkMvaXhxZ241Qkx5Ry84ZDhuQ21JS0wveHdjazVNcmw1RVZWZy8yMnNxc0VW?=
 =?utf-8?B?V1YzRDdEdEZRNTMySVZsaGNlUXVsR1NyYkF1QmU2dThFTzc4VkRya3o1S0Ix?=
 =?utf-8?B?YlJaMGVVUlZnd3NFUTVLb1JBNGhmeHg2cm1TKzgyK3JtMmhtazdCWjhDMGQy?=
 =?utf-8?B?TEpwZmJaTEkzREY5VHRlaEtTREw4bjVQZmVKdnVqd2RJS1lmc1lhU3NYR0dC?=
 =?utf-8?B?dDdaK2FJcGgxOVRmTU4xS2JrSnpqUUl4bE9tRFc2ZGgrRW9JaWtBWXJUV2gx?=
 =?utf-8?B?RUVwSnZvYmdkeDRUSkExaERjems3T2o2L2lqb3c5Q2VvazNNdVY1dHRxSXM1?=
 =?utf-8?B?M2lpRUpIZnBFb2x4dis4REdGZjZ6Nll4MVJGZ0xQU2dYcXRaQkhqMTNHTldK?=
 =?utf-8?Q?gPTseT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTRXdDhxVFdiWUpHTk9tSFBndWFTdkErL3ozcGpnckZNVzFvVjkxNUhZbWJy?=
 =?utf-8?B?bVBCeWp5TG1jNGZGNXJneFBWS3ArNUQxVkl4RXplWkNBRVNEeGtFTytZTlNp?=
 =?utf-8?B?NlJxSFNJdjExK01vVGt0dDVBQUcrOEl6Z2xsd1lZUndZa3R5Q1BKd3VJUmdL?=
 =?utf-8?B?T0VncytFcXd6aGFHYTZGUGFRdTd1Y1NoRE9FWDVtaStNMUpOUkdtM1RmSnJh?=
 =?utf-8?B?dzVYdWJiaFMzV3ZsaUVRUWlDc2JlOUZMdHh3Sk9PblRSUTcxcmJOL0FPVUNa?=
 =?utf-8?B?QzgrN05rcDdtNS9XbFRTeUxnSitKRkhrdzlHWlhzK2VZYjAwcyszaDJCS2tM?=
 =?utf-8?B?QkZJWG5Vb2piMi9KUDg5TVFUOVZlVkRFMGJOL0JaOGRXb0hvOC9BOFU4czJG?=
 =?utf-8?B?clkvZ2dXUlk3RGxqejgrMTBZUmp2VmpXZG1QRmdkNDl3NG1SL05RNDdlTFlS?=
 =?utf-8?B?WEU4N3ZYenVYaU1KSTRSSS9oTnR2VGtBMitjemk2cXo4eFkzSVpGcWpiM2JJ?=
 =?utf-8?B?NnZsakcrY0VqWUZFMnc2Q3ZoaktQMURVeWExL2FYL1RPRWxSalp5S3VhZk4y?=
 =?utf-8?B?eVFrL3hlVE9IL3hWT2hzbnZUSXdsOXJwZTFjWFZpWHg0T2pUN3FDK09EWFc5?=
 =?utf-8?B?WmhzRm9hbXh2cHMzekJoMUFOQWRmOHRBUFJzT2VpQlFUbGxwejk3Q3JVemc0?=
 =?utf-8?B?TzhzYTJjd3Z0RXcxUUFjcUdXMzdYYjhDTndtNGNyTDVqWTV4T2pjMXg3N3By?=
 =?utf-8?B?eTJHSDRpWktBWXVFQVJFOTZ3ZVdYekdoUVQ0SER4bS9sdEc5akp6Vlc3QjEr?=
 =?utf-8?B?QUNDOVQvbjNFS3hKVUdmK2pKSHJkckJ4K01JUGhZb1RoT0hKQmVGVkNzYUt6?=
 =?utf-8?B?NkJOMnN1K0U2VXYwMThOaTZqalZrZnBmdFozUEk3TXY3cnpHb1JxdEZiWkFF?=
 =?utf-8?B?NUpjc3B4ZW1sWnM2NEl4dGNRWWt3MUwvM0NmT3JWWEVpZklsV1lUU2g3WGhM?=
 =?utf-8?B?Y3ZFdSsrYkhtVkthT2paclBVUGtQSmh0Rk8wbTJQRVU0YkJub0RIYWVTZ2N2?=
 =?utf-8?B?MkxWQzgzc0ZackU5RE8vaVF0cUprcXRoclMxZ2pvTm00bW1QUW14eDRwamNi?=
 =?utf-8?B?YkRkNzluWnpyR2lkY3IzTWVha200NGFISys3eG5iMnVLblltU0gvL0F1N3hV?=
 =?utf-8?B?Tlp4aFBaN2MrN0g5VFIyUFQvZUZnMFNTNC9IMVZKckJKVUgyV3NIbW1HVGps?=
 =?utf-8?B?Vi9BbXo1cDBESjdqWnVHVEhZWVIySDY3QUFwcnJabitjMzV2S09HOFNHU3Zw?=
 =?utf-8?B?czlWVkhjWFpXMTBxdU1jaG5Ga2FuQ0ZZeHFFUk1UNUNMbVAzWlJ4dkZOazhs?=
 =?utf-8?B?T3REbWZOSzRKQ2IvSGNjN1hPTEg2ZndwWTczTEp6S3VCcWdlQ0wrN21BRG94?=
 =?utf-8?B?NkhkSEZycnYwZDVjM2lvM29DVGgyN1hGTWJqS3NPcUNTaU04QTlDSTMyYlAy?=
 =?utf-8?B?Y0V2WkswQzJqa2cwQkF6NEplUGphU1g5dVozUFhLU2lRM2Q4M09Ib2xXK0Ni?=
 =?utf-8?B?eUJjM2FNcklwYzlNTm5DcHoyNzMyTCtpWFV1M3NVSDRmcGdVRTY4WGRoSzdL?=
 =?utf-8?B?bW56RDBVd01YeGVhWDBRTmxySXJmV3M0bkZxdW9NQWFsbGlodk9TUjhOS1pz?=
 =?utf-8?B?YWRMeU1YTEpDdWFXVVJoRUZoM1VNM3BNVjRqWG1heHNLU0hBWHpScUYwUG5k?=
 =?utf-8?B?cWtXdjZ1cnNPazYxaWFqMitwcTR3bllJQVkxUEg5UlpzRlFSVXo4eEhGZUlj?=
 =?utf-8?B?QVF2MkFyelIyMmZQSW9ZU2ZWQ3I5YTNxOUdHVHJaeE5SeWNwWktndlM3U004?=
 =?utf-8?B?aHJzUC9jcFBacHRZbzU0WTViYWE2SW50WmpJeGFmNWwrWnlSZkFOQituNFBT?=
 =?utf-8?B?dTd1ZlIvWVd1NTJyU2I1eFB6ajJWVXFiOHFUSVFJMHpRRHhjTDJjRmx3OUdj?=
 =?utf-8?B?ZlE2MEJUZ2Z1aGFucEpJT2FkR0ZPcEZKRFZJcW1CVG84d0w3bW9PZFFCU1Zp?=
 =?utf-8?B?dmVYY3Y2ZldHejZIUmlIM2p2WkMrdnRXYnF0d1hqUWhnazEzb0VudmJlelMw?=
 =?utf-8?Q?US3jwmYxmq1HUp5SwP15Lra8q?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7c719f-8e83-463c-9d23-08de28a4aa6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 02:21:23.1696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhYVp7VdIg1XSTS2b25HUm3wN0nqLuu7ZZ0iWEpRfaDtchcbH2EKwswc/DemAJWvZy4jdMa6CNN7SW/DN5KjVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11274

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyNywgMjAyNSA4
OjEyIEFNDQo+IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0K
PiBDYzogUnVpIE1pZ3VlbCBTaWx2YSA8cm1mcmZzQGdtYWlsLmNvbT47IE1hcnRpbiBLZXBwbGlu
Z2VyDQo+IDxtYXJ0aW5rQHBvc3Rlby5kZT47IFB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1
cmkuc20+OyBNYXVybw0KPiBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
K2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBT
aGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGEgSGF1ZXINCj4gPHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1
dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGhpbGlwcA0K
PiBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IEZyYW5rIExpIDxmcmFuay5saUBueHAu
Y29tPjsgbGludXgtDQo+IG1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LQ0KPiBhcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEcuTi4gWmhvdQ0K
PiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAyLzVdIG1l
ZGlhOiBpbXg4bXEtbWlwaS1jc2kyOiBVc2UNCj4gZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgdG8g
ZmV0Y2ggY2xvY2tzDQo+IA0KPiBPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCAwNToxOTo0M1BNICsw
ODAwLCBHdW9uaXUgWmhvdSB3cm90ZToNCj4gPiBGcm9tOiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpo
b3VAbnhwLmNvbT4NCj4gPg0KPiA+IFVzZSBkZXZtX2Nsa19idWxrX2dldF9hbGwoKSBoZWxwZXIg
dG8gc2ltcGxpZnkgY2xvY2sgaGFuZGxlIGNvZGUuDQo+ID4NCj4gPiBObyBmdW5jdGlvbmFsIGNo
YW5nZXMgaW50ZW5kZWQuDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxp
QG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54
cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDhtcS1t
aXBpLWNzaTIuYyB8IDUyDQo+ID4gKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2ky
LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDhtcS1taXBpLWNzaTIuYw0K
PiA+IGluZGV4DQo+ID4NCj4gZDMzM2ZmNDM1MzlmMDYxYjhiOWNmODhhZjJjZGE4YzQ0YjNlYzJh
OS4uZmQyMDI2MDFkNDAxMTQ1ZGE4YmUyM2RmNA0KPiA0NTENCj4gPiBmNmFmNjYwNjQyYzUgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3Np
Mi5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3Np
Mi5jDQo+ID4gQEAgLTcxLDIxICs3MSw2IEBAIGVudW0gew0KPiA+ICAJU1RfU1VTUEVOREVECT0g
NCwNCj4gPiAgfTsNCj4gPg0KPiA+IC1lbnVtIGlteDhtcV9taXBpX2NzaV9jbGsgew0KPiA+IC0J
Q1NJMl9DTEtfQ09SRSwNCj4gPiAtCUNTSTJfQ0xLX0VTQywNCj4gPiAtCUNTSTJfQ0xLX1VJLA0K
PiA+IC0JQ1NJMl9OVU1fQ0xLUywNCj4gPiAtfTsNCj4gPiAtDQo+ID4gLXN0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgaW14OG1xX21pcGlfY3NpX2Nsa19pZFtDU0kyX05VTV9DTEtTXSA9IHsNCj4g
PiAtCVtDU0kyX0NMS19DT1JFXSA9ICJjb3JlIiwNCj4gPiAtCVtDU0kyX0NMS19FU0NdID0gImVz
YyIsDQo+ID4gLQlbQ1NJMl9DTEtfVUldID0gInVpIiwNCj4gPiAtfTsNCj4gPiAtDQo+ID4gLSNk
ZWZpbmUgQ1NJMl9OVU1fQ0xLUwlBUlJBWV9TSVpFKGlteDhtcV9taXBpX2NzaV9jbGtfaWQpDQo+
ID4gLQ0KPiA+ICBzdHJ1Y3QgaW14OG1xX3BsYXRfZGF0YSB7DQo+ID4gIAlpbnQgKCplbmFibGUp
KHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlLCB1MzIgaHNfc2V0dGxlKTsNCj4gPiAgCXZvaWQgKCpk
aXNhYmxlKShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSk7IEBAIC0xMTEsNyArOTYsOCBAQCBzdHJ1
Y3QNCj4gPiBjc2lfc3RhdGUgew0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICAJY29u
c3Qgc3RydWN0IGlteDhtcV9wbGF0X2RhdGEgKnBkYXRhOw0KPiA+ICAJdm9pZCBfX2lvbWVtICpy
ZWdzOw0KPiA+IC0Jc3RydWN0IGNsa19idWxrX2RhdGEgY2xrc1tDU0kyX05VTV9DTEtTXTsNCj4g
PiArCXN0cnVjdCBjbGtfYnVsa19kYXRhICpjbGtzOw0KPiA+ICsJaW50IG51bV9jbGtzOw0KPiA+
ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsNCj4gPiAgCXN0cnVjdCByZWd1bGF0b3IgKm1p
cGlfcGh5X3JlZ3VsYXRvcjsNCj4gPg0KPiA+IEBAIC0zODQsMjQgKzM3MCwxNiBAQCBzdGF0aWMg
dm9pZCBpbXg4bXFfbWlwaV9jc2lfc2V0X3BhcmFtcyhzdHJ1Y3QNCj4gY3NpX3N0YXRlICpzdGF0
ZSkNCj4gPiAgCQkJICAgICAgQ1NJMlJYX1NFTkRfTEVWRUwpOw0KPiA+ICB9DQo+ID4NCj4gPiAt
c3RhdGljIGludCBpbXg4bXFfbWlwaV9jc2lfY2xrX2VuYWJsZShzdHJ1Y3QgY3NpX3N0YXRlICpz
dGF0ZSkgLXsNCj4gPiAtCXJldHVybiBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShDU0kyX05VTV9D
TEtTLCBzdGF0ZS0+Y2xrcyk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyB2b2lkIGlteDht
cV9taXBpX2NzaV9jbGtfZGlzYWJsZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkNCj4gPiArc3Rh
dGljIHN0cnVjdCBjbGsgKmZpbmRfZXNjX2NsayhzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkNCj4g
DQo+IFRoaXMgaXMgb25lIG9mIHRoZSByZWFzb25zIHdoeSBJIGRvbid0IGxpa2UgZGV2bV9jbGtf
YnVsa19nZXRfYWxsKCkuIEkgd29uJ3QNCj4gb2JqZWN0IHRvIHRoaXMgcGF0Y2gsIGJ1dCBJIGRv
bid0IGxpa2UgaXQuIEF0IHRoZSB2ZXJ5IGxlc3QsIHlvdSBzaG91bGQgbG9vayB1cCB0aGUNCj4g
Y2xvY2sgYXQgcHJvYmUgdGltZSBhbmQgY2FjaGUgaXQgaW4gdGhlIGlteDhtcV9wbGF0X2RhdGEg
c3RydWN0dXJlLCB0byBhdm9pZA0KPiBsb29raW5nIGl0IHVwIG11bHRpcGxlIHRpbWVzIGF0IHJ1
bnRpbWUuDQo+IA0KPiA+ICB7DQo+ID4gLQljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShDU0ky
X05VTV9DTEtTLCBzdGF0ZS0+Y2xrcyk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyBpbnQg
aW14OG1xX21pcGlfY3NpX2Nsa19nZXQoc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUpIC17DQo+ID4g
LQl1bnNpZ25lZCBpbnQgaTsNCj4gPiArCWludCBpOw0KPiA+DQo+ID4gLQlmb3IgKGkgPSAwOyBp
IDwgQ1NJMl9OVU1fQ0xLUzsgaSsrKQ0KPiA+IC0JCXN0YXRlLT5jbGtzW2ldLmlkID0gaW14OG1x
X21pcGlfY3NpX2Nsa19pZFtpXTsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBzdGF0ZS0+bnVtX2Ns
a3M7IGkrKykgew0KPiANCj4gTWFrZSBzdGF0ZS0+bnVtX2Nsa3MgdW5zaWduZWQgaW5zdGVhZCBv
ZiBtYWtpbmcgaSBzaWduZWQuDQoNCkkgYWRkcmVzcyB0aGUgY29tbWVudCBpbiB2OChodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTExMTMtY3NpMl9pbXg4dWxwLXY4LTAtMmViZTM3OGY3
MTExQG54cC5jb20vKSwNCmJ1dCBNZWRpYSBDSSByb2JvdCBkZXRlY3RlZCBzb21lIGlzc3VlcyBh
cyBiZWxsb3cuDQoNCiMgVGVzdCBzdGF0aWM6dGVzdC1zbWF0Y2gNCmRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbnhwL2lteDhtcS1taXBpLWNzaTIuYzoxMDA2IGlteDhtcV9taXBpX2NzaV9wcm9iZSgp
IHdhcm46IHVuc2lnbmVkICdzdGF0ZS0+bnVtX2Nsa3MnIGlzIG5ldmVyIGxlc3MgdGhhbiB6ZXJv
Lg0KDQojIFRlc3Qgc3RhdGljOnRlc3QtY29jY2luZWxsZQ0KLi9wbGF0Zm9ybS9ueHAvaW14OG1x
LW1pcGktY3NpMi5jOjEwMDY6NS0yMDogV0FSTklORzogVW5zaWduZWQgZXhwcmVzc2lvbiBjb21w
YXJlZCB3aXRoIHplcm86IHN0YXRlIC0+IG51bV9jbGtzIDwgMA0KDQpJIGNoZWNrZWQgdGhlIHBh
cmFtZXRlcnMgdHlwZSBvZiBhbGwgZnVuY3Rpb25zIHdoaWNoIHdpbGwgcmVmZXIgdG8gbnVtX2Ns
a3MsIHRoZWlyIHR5cGUgaXMgaW50LCBzbyBJIHBsYW4gdG8gZHJvcCB0aGUgY2hhbmdlcyBpbiB2
OCBhbmQNCndpbGwgc2VuZCB2OS4NCg0KPiANCj4gPiArCQlpZiAoIXN0cmNtcChzdGF0ZS0+Y2xr
c1tpXS5pZCwgImVzYyIpKQ0KPiA+ICsJCQlyZXR1cm4gc3RhdGUtPmNsa3NbaV0uY2xrOw0KPiA+
ICsJfQ0KPiA+DQo+ID4gLQlyZXR1cm4gZGV2bV9jbGtfYnVsa19nZXQoc3RhdGUtPmRldiwgQ1NJ
Ml9OVU1fQ0xLUywgc3RhdGUtPmNsa3MpOw0KPiA+ICsJcmV0dXJuIE5VTEw7DQo+IA0KPiBUaGlz
IG5lZWRzIHRvIGJlY29tZSBhIHByb2JlIGVycm9yLg0KPiANCj4gPiAgfQ0KPiA+DQo+ID4gIHN0
YXRpYyBpbnQgaW14OG1xX21pcGlfY3NpX2NhbGNfaHNfc2V0dGxlKHN0cnVjdCBjc2lfc3RhdGUg
KnN0YXRlLCBAQA0KPiA+IC00NTYsNyArNDM0LDcgQEAgc3RhdGljIGludCBpbXg4bXFfbWlwaV9j
c2lfY2FsY19oc19zZXR0bGUoc3RydWN0IGNzaV9zdGF0ZQ0KPiAqc3RhdGUsDQo+ID4gIAkgKiBk
b2N1bWVudGF0aW9uIHJlY29tbWVuZHMgcGlja2luZyBhIHZhbHVlIGF3YXkgZnJvbSB0aGUNCj4g
Ym91bmRhcmllcy4NCj4gPiAgCSAqIExldCdzIHBpY2sgdGhlIGF2ZXJhZ2UuDQo+ID4gIAkgKi8N
Cj4gPiAtCWVzY19jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShzdGF0ZS0+Y2xrc1tDU0kyX0NMS19F
U0NdLmNsayk7DQo+ID4gKwllc2NfY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoZmluZF9lc2NfY2xr
KHN0YXRlKSk7DQo+ID4gIAlpZiAoIWVzY19jbGtfcmF0ZSkgew0KPiA+ICAJCWRldl9lcnIoc3Rh
dGUtPmRldiwgIkNvdWxkIG5vdCBnZXQgZXNjIGNsb2NrIHJhdGUuXG4iKTsNCj4gPiAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPiBAQCAtNzgzLDcgKzc2MSw3IEBAIHN0YXRpYyB2b2lkIGlteDhtcV9t
aXBpX2NzaV9wbV9zdXNwZW5kKHN0cnVjdA0KPiA+IGRldmljZSAqZGV2KQ0KPiA+DQo+ID4gIAlp
ZiAoc3RhdGUtPnN0YXRlICYgU1RfUE9XRVJFRCkgew0KPiA+ICAJCWlteDhtcV9taXBpX2NzaV9z
dG9wX3N0cmVhbShzdGF0ZSk7DQo+ID4gLQkJaW14OG1xX21pcGlfY3NpX2Nsa19kaXNhYmxlKHN0
YXRlKTsNCj4gPiArCQljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShzdGF0ZS0+bnVtX2Nsa3Ms
IHN0YXRlLT5jbGtzKTsNCj4gPiAgCQlzdGF0ZS0+c3RhdGUgJj0gflNUX1BPV0VSRUQ7DQo+ID4g
IAl9DQo+ID4NCj4gPiBAQCAtODAxLDcgKzc3OSw3IEBAIHN0YXRpYyBpbnQgaW14OG1xX21pcGlf
Y3NpX3BtX3Jlc3VtZShzdHJ1Y3QNCj4gZGV2aWNlDQo+ID4gKmRldikNCj4gPg0KPiA+ICAJaWYg
KCEoc3RhdGUtPnN0YXRlICYgU1RfUE9XRVJFRCkpIHsNCj4gPiAgCQlzdGF0ZS0+c3RhdGUgfD0g
U1RfUE9XRVJFRDsNCj4gPiAtCQlyZXQgPSBpbXg4bXFfbWlwaV9jc2lfY2xrX2VuYWJsZShzdGF0
ZSk7DQo+ID4gKwkJcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoc3RhdGUtPm51bV9jbGtz
LCBzdGF0ZS0+Y2xrcyk7DQo+ID4gIAl9DQo+ID4gIAlpZiAoc3RhdGUtPnN0YXRlICYgU1RfU1RS
RUFNSU5HKSB7DQo+ID4gIAkJc2Rfc3RhdGUgPSB2NGwyX3N1YmRldl9sb2NrX2FuZF9nZXRfYWN0
aXZlX3N0YXRlKHNkKTsNCj4gPiBAQCAtMTAyNyw5ICsxMDA1LDkgQEAgc3RhdGljIGludCBpbXg4
bXFfbWlwaV9jc2lfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAg
CWlmIChJU19FUlIoc3RhdGUtPnJlZ3MpKQ0KPiA+ICAJCXJldHVybiBQVFJfRVJSKHN0YXRlLT5y
ZWdzKTsNCj4gPg0KPiA+IC0JcmV0ID0gaW14OG1xX21pcGlfY3NpX2Nsa19nZXQoc3RhdGUpOw0K
PiA+IC0JaWYgKHJldCA8IDApDQo+ID4gLQkJcmV0dXJuIHJldDsNCj4gPiArCXN0YXRlLT5udW1f
Y2xrcyA9IGRldm1fY2xrX2J1bGtfZ2V0X2FsbChkZXYsICZzdGF0ZS0+Y2xrcyk7DQo+ID4gKwlp
ZiAoc3RhdGUtPm51bV9jbGtzIDwgMCkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYs
IHN0YXRlLT5udW1fY2xrcywgIkZhaWxlZCB0byBnZXQNCj4gPiArY2xvY2tzXG4iKTsNCj4gPg0K
PiA+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgJnN0YXRlLT5zZCk7DQo+ID4NCj4gDQo+
IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=

