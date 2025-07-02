Return-Path: <linux-media+bounces-36623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD83AF60C3
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 20:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5412D3B3879
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 18:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3789430E844;
	Wed,  2 Jul 2025 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FCg4wC7X"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981DC1C1F12;
	Wed,  2 Jul 2025 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479508; cv=fail; b=rn+dhGlauyFHJ+ZyU8nUFK8m9v8l4iNNQWVUHwgLQI+tZ8vh2PLiJeE0llZpn4ptnRuq5Wa0geuPqo26F/uQq9ARvz/D6/yDIvrx2PNErlacDycSvvftnrgQ4LJ49WjbmbiCZmKcAH6VToI1/RtPIXuqYgQK2fV7rd3wNw/jhRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479508; c=relaxed/simple;
	bh=NTykNUPFKL/ctvOYEviLEICdrz5vl7mgw9FQTAYFpzs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YY1HAYiuHeecj8veht4pgyy0yTjyCVftB1mt2y3D23+y9fdmzTJro+A6YL0/mjHb/xMR7/A4P6HSRdYp2FsoynUeNQghNNhS9sASyGPqWKbPia7bCo5Mjyqzixb2xtLD4lz7jTsyjKeosOeSrSWusN6UzXoARFwUinR5GyHIcQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FCg4wC7X; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VshaYk4dvyHXnQte4TLJiSuKSY+1dSheVZxAA8fSHGNP8kU7AJC7u9cJJtS+BU2655ybdFtrfkpM5bh1PK0QsidW5Cp9pyCr4+0jpxzLWAkRMJ1S144pvHSRuvaSkbnR4LPttqrJLIqpjXFr4VcoDnPgkoQdYk1hsibniq7rxz8kCXO4bQQlmhYI63pyTpNbZgltobyTTV5iHqpAnAe+z2wD+9lpeLbgLezKAGdJ3aK+A2xBECWkIuWFbkkEzrIgDx+nwURs81WcOc3SIIFaBM1sd5O8/4WEziMMFWUewdWjlOcYKtZsh0SHgKD9kfuRkytHd/MI0uaeQKK+aQs4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTykNUPFKL/ctvOYEviLEICdrz5vl7mgw9FQTAYFpzs=;
 b=AORmpUqiVKKMptFbkuuTddnoaTGF+uPiu1GQP0fK/k6lKMdHHEHzi6uM4//9r798jfWv5HmIKumpAGF+WEiZ2nBCGo4kKM5V60s3LaumC2AC+Ym+YsF1UmwX5tLhbLj9QKv6CO0jXifdMoe9Oc/LZ0pDVNu5MndsQVTvPvOc1QWRGRbfJoqoq9pcLBtHSqCRobOf/34kV/igGQSVubtX8j/QyEV3ZgvcBAp9god3ZUOq6oqDev9e3FFWCI/AZODffGIYOvLREgZaxU1V6gnk65LoRHLl726YTLi+8np5rDAyf8m3fmhqudfXS4Wma0q1C/bZEx8dq7Odh19mgkFL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTykNUPFKL/ctvOYEviLEICdrz5vl7mgw9FQTAYFpzs=;
 b=FCg4wC7XjY0F7A8/xTidvZBYP4YFjyu1ze4eEVVVZxnmgBlOceTQArhdqLgyZQhh1o0x0lgEQWquZf6a6jkJVhSRvU2txr6Qa1gTv9vewYZ+dY4noLYIFluEl2iGTa+hvULfLaMScloKzHznvMblGQA/2urrbYInJwJpEubp2KGymhsbB1sdv61Lbw3rHwti5fRPPa7WMt6nNUm+gjZ8vRmVhTiR4Fy4iOSjeDUTccMxNRMDndXkNT6Ledp4dcUJlSIPfWVIcSEtHLBXgXJl+AEu4wTKGEsn1A7dmZuTH2REn9kRKEJIenFO5IlXVqlglxn4VP+AQJ+YPZ0tLlGtJA==
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 18:05:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 18:05:03 +0000
From: Frank Li <frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Alice Yuan <alice.yuan@nxp.com>, Robert Chiras
	<robert.chiras@nxp.com>, Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH 3/5] media: nxp: add V4L2 subdev driver for parallel CSI
Thread-Topic: [PATCH 3/5] media: nxp: add V4L2 subdev driver for parallel CSI
Thread-Index: AQHb63vV/1c7mxJBJEmTQhrUAFBAZg==
Date: Wed, 2 Jul 2025 18:05:03 +0000
Message-ID:
 <PAXPR04MB96429290E00019EDF5EFFE7E8840A@PAXPR04MB9642.eurprd04.prod.outlook.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-3-eccd38d99201@nxp.com>
 <d0e70c51-57ab-44cd-9930-d4ce2cd06109@kernel.org>
In-Reply-To: <d0e70c51-57ab-44cd-9930-d4ce2cd06109@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9642:EE_|DB8PR04MB6780:EE_
x-ms-office365-filtering-correlation-id: 806b3993-2991-4ee3-4c27-08ddb992f7f5
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXhVZ1B3cWREeWdMMFhMU2t3OGNGZ1hmM0JZc290SGJUSG9YaWdVMlZ2NjIx?=
 =?utf-8?B?dzdVS3huU0dCTXhZWm54Z1pPTUlqTkFyaHhiWnhnNjJYbzFnOGNvUExibktm?=
 =?utf-8?B?b1JONmNtejJXQktNVzRMeCs4cWlrM2dPTzZWbUZUbm5XeEQxOG9Hbm9YTklT?=
 =?utf-8?B?M0VwMWtOTzNsT2dpYmlLbmdJaWJJb1kybS9UMTdKMk52L0E4RTZPcVFsSS81?=
 =?utf-8?B?S2ZvYktCQmdHdjFnaXZUWWJQM2p0Z0dENkZVb3hKbXhOb2NnRklXS09pcVIv?=
 =?utf-8?B?VXR0S0daUldxRDNJMHk0MGpzbnFyYklRS1dPcEZkcUlUbWNXYzRuSFRUeUdE?=
 =?utf-8?B?NHNMV2NTY20ydnJCS1JRVDZicG1jN3dzcGtTYmsvdDFmZVR5R3BLK2tWLzda?=
 =?utf-8?B?eEVhZngza3grUDl3OGRzcDNDRm5FaW81TnRpVS82WWxyZkczTkdyTi9JcXhM?=
 =?utf-8?B?U3hlODZRS01ZazY0bkxmK1NmbFh0Tm92cHlEZ3VBb3dCemRNNzdUQ2cvOTZk?=
 =?utf-8?B?TFRzWlBXWUJTZmMzSGNuUW9wc2ZVMzBRWHkrTzNIeGtNdy9NWG15cTJmVWR2?=
 =?utf-8?B?Z2E4bHZTU1UrYTF6dVdqMXVMeFQvYmZQeHJwQnE4eGJueUJoTFpjUVdmeVo3?=
 =?utf-8?B?Yml3RnJBR0JzU016QVVRelgwVCtLcXk4ajhFZ2k3TFl4NmFoNGlnRlBPQU8z?=
 =?utf-8?B?ZFN3WUEwbnNvbDgzdFVDYUlYcmk1cHY1dG5qY3RnTlhXakZWQkNkMDlGa25x?=
 =?utf-8?B?SHFxM3d2N0xXNFk3Nkxpb0RlR0NRNTJkL3RJUzAxeit0a21vcjgyM1R5L25W?=
 =?utf-8?B?bXU0TVhpMEdvN250aHQwQjJhRDZDU1docUxxQXF1TVZHeVNLNUlPeUkvclJJ?=
 =?utf-8?B?QUhRZVR2b09Lb0Q2ZGcxcEhQWWlpOGFuZE9HemZjTk9YUkdua0lCY0JrdFNi?=
 =?utf-8?B?eXdsZElrMTZrYm5wZkhZSXlaWGVwak9OOHg5dmp2NStYbk45M1JjOEY3ZGVU?=
 =?utf-8?B?RVpwVGZDYzZBVzJRVWlXblFpSWR1dmIvK0MrcFVRbDduRHM0ekhKQ3lyS2pj?=
 =?utf-8?B?WEhJOG41L2owc3Ntb2lkdzRmaXhMdGQ4UHhlY3cxdDl2WlU2RDJBUW1ET3RC?=
 =?utf-8?B?YVFBdzJSWjZFQnVITHRxNWFia1JpUm5NWnpTcjZVdUhhUVh0bzZlRG5ZZDZB?=
 =?utf-8?B?OUh0YWkwclNMMWdReW1SR0NNY1YzWjhZTjl0RlcyYzl6SXd0QnVsemNXVTFa?=
 =?utf-8?B?ak9MNndseUY3enhuVVh4ZDVGL0RtUndQZU5VVWh4b1FBTDlnVHdZWlNMcmpB?=
 =?utf-8?B?eWNCWHliVFIwQVJyV1l5QzhvcS9sL0dFYlg1Ui9xR29ScHBMaGEzOHB4VFB6?=
 =?utf-8?B?R2liWUVla0YyZ1pvemMvQmFMVCtSWUZmc3hFNWlBeHRubmdOMlU5a0dOZHBv?=
 =?utf-8?B?R0FTdDVxU2cwbGo0RUZINHpHK2tzOXhDNlFOTzZxcnhEUHVZdTVIaEtTWHhp?=
 =?utf-8?B?LzF4NFcvR29YM2llYTJUdThRVG1qeFhURGpvWnovSENNSVc1QmdoNm81Y28z?=
 =?utf-8?B?U2dXRWl1MkluRXE2VWhMQ2o1d2UwOThxK25tdno0UjVjeGJyTnpBK2xNRWNO?=
 =?utf-8?B?TDlvRUJPbzQvUFkrMWs2MmxSd0pNcWtZVW84MDV6b0kwbkVHUU5nYU9jR2xJ?=
 =?utf-8?B?Z0c5TDAwdTN2ZlJhbXkvd2EycnhuWW1DdjRQVDRnQjVmZW03cmtieUhJN2Zu?=
 =?utf-8?B?TGhiRldCU1dGc3lvKy9uelpwY0hGa1hoQm1rNm56RzhmTFhKWDMwZlNPVkZ4?=
 =?utf-8?B?TGlJeTJBR1MyQmw0NVZXSnp5TWJkRnFYMGV5d3hMQVBWQ1VxNzBCV2pHR3VY?=
 =?utf-8?B?ZGZKeUV6bnFiaXZEd3I1bzBJT1BBWW5WeVBzZmhWUUxLNG45VVYxWHN5N1Jr?=
 =?utf-8?B?MDhuc3VKVlFQNTBvVkM2VE12ZWVNWU5nNUg1WDZ4QzFRdE1nNTZYSmpBSTdR?=
 =?utf-8?Q?tvFTZu7Ne4fBg6vXv9+q4gLEH+rMaE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlZsOXMrTGtBNE9OeURVUlZ4Z1FaVytNR0I4d1E2eEV6Wk5lZW9OQVE1RnFj?=
 =?utf-8?B?MlVUWXBKbWFDYjRvRGVZS2JhZU9HOEFCTWZFeXozay9LN2UrUllwSE8wY1Iw?=
 =?utf-8?B?RWxZT3Q5NUxuODhmMXhRWGh3cWJIZUJxc3BBNmUyMytXem96a1RYTW5kU0ph?=
 =?utf-8?B?Q1ltWkRIWjRCL3ZWVUpQNmVEbHd5UUU0RUNXZWJUZkpDYi9xU0ZuSWlUeTc5?=
 =?utf-8?B?THEvazVNTUFXeHFYMUExRkZSVWVabnQzc1NPSTVRZy9OVzN2WDRrbE91bFlz?=
 =?utf-8?B?aUdXZTBxSVR1WW1JaFlUQ2NXeVY5WmxqM1d2M2gvZUVtQmJZVGxKNjNzNUFo?=
 =?utf-8?B?RlJyN3J3dVludHBqY1lYWE9Lb0c0cExlK29BTjZiMEN3Z2ZLOUU1cVlKaHNu?=
 =?utf-8?B?cDZKeWhCVk9tY3kvRGZGSlN1dUNkNXBtRDJvelFyNEpBTGhQVWRPaHAweFRJ?=
 =?utf-8?B?TEp2M0oxdEFTQjBuVlN2Vm96TVFBcmNMSm43TlRCVGFHZ0l5YWdKZ29FVXh4?=
 =?utf-8?B?SWxBb2F5N3ZGNnZsQVRMWW1qbnFldm1IbFI3MHRMUXYzZm5IWjF6azMyQXVz?=
 =?utf-8?B?RUFOREpGTXZGKzF2bURWQnk4Y0pIK2U1ckJSRnIrRmR2Smo0cnQ4UzBSNUxo?=
 =?utf-8?B?WkZzUmhzSnpKeEdGY1FKT0piK2JZZzR2OHc0UTJ6SWNtUThlb0FISmtKYkYz?=
 =?utf-8?B?VEkxeXNqRFNpQmVWMjZFenpOWUJ1N1lCZlp2WFN4bEFQY3pHT1lSVnpNc1pm?=
 =?utf-8?B?SVlzTG5ZSE8vVFZNNDFtTFJpaVRITTgxQi91bFZEVTFjcGRaSU9KbU1DTGRx?=
 =?utf-8?B?OGN3MjJtMkFueDM3V05HcUpIa1Azc1BGMnZaUHFXM1NId1lTaTkwYnhuaTJw?=
 =?utf-8?B?MGFnU2p2K0JTcWE1U0o1U0M2emtXS0JNTU9kaUFqUnJRTnJDRmovM2RGSXpj?=
 =?utf-8?B?NSt6OXc2OUtNZG1HU2J5amV3WDJoZ3F5Zy9iSmQ0WHdSZFUwVzNzaEZRSCsv?=
 =?utf-8?B?Yld2ejdhcWxzSW1kYUlXRmRTUWg4U003ZE83Y3AwQVdjcFBmOHRCUWJtblV6?=
 =?utf-8?B?Qk13L3VnV1JmOWJDVE90M3M0OTU5SGEwcXhrWkh4ZHhZTjBVU2RMdjZzZDlQ?=
 =?utf-8?B?czRjMFFOU1BDd2ZJOTdzdkRBNE9ES25iaXRCSSszMU0xV00xV3ZqZHNocXYw?=
 =?utf-8?B?ODVGdyt3N1BZNk1maFBndFFmRzU5VkNRWjNjMUhzU1RBSEtpWVlPTzVqWm1v?=
 =?utf-8?B?K2RDSFkwRGZDdlpJaGRDU0dkRHQyWGlzb3BGSVNCbGkxM3RoKzNLajA1anRy?=
 =?utf-8?B?Y0dYbEJpU2xuRHVxTTU2VllnYk1qT3U0WFEza3JGdUhJSlQrVzV3MTFYWjZV?=
 =?utf-8?B?b1JFV0F0THhrT0lhYUVWRXJSOGNwTFJCK2pybXNBbXBQcnRCYnVsVkZVT2ky?=
 =?utf-8?B?TjlIL2toQUN1aDdpeHpoMzFUZDY1Z3lPUmwrbElyTnlWMVpmem44aUV4dDVH?=
 =?utf-8?B?TDRDSW52YitadlA3cFpoVXA0S3hWY2pzbCttWDB4VEpFWXhHOFNDRjVoR1Ra?=
 =?utf-8?B?Y3RHaVc3ZnM4d21FbnJTc2pHamxleDNUTzRZQkpTVW1JMjVOWU5aUTFuMmV3?=
 =?utf-8?B?UGtVaTZFRHgxTGU4VkFqbTMzVUVlaExpQnIyVDlpaDgzdWJwa0NyM2dwaVlU?=
 =?utf-8?B?OTZ4MWdRcmhua3p4ZStMWGxKKzZzQ0Z2UnM2TS94TWk2Z1JwcUtobU1CK0hy?=
 =?utf-8?B?QkZmT3dNSlZwV1RaV2Jaa2NZeGpNZHV0QWd6YnVFMVE4OGtYV2QzdWFFbDM2?=
 =?utf-8?B?WVdxMm1BWThpSTc3bEI5d2NrVzhDYjZlOVV2VWJVZkszV2g5VHhsTm01Z1dv?=
 =?utf-8?B?R3MvcmFpd0Jsb3Jtc1J3OXBMd2VDK21IOTdndkhXSGJXdWpyc3ZBVm9ma0pL?=
 =?utf-8?B?VHk2UiswZk1CcGpiWXJJYmV6YUt0dFhQU2EzNWxMZkwxenJndk1aMEJRb2ZX?=
 =?utf-8?B?UnA3djhNb2NiWHVHUW01TWZZTjhqYXR3UVJUQWg5bVZUME1VblhObGYvLzI3?=
 =?utf-8?B?alcycHRseFlpZzd0MHd2RVR5THRHWkVNb0ZGVXFQS1VnRTBGQ2pzanBZblFl?=
 =?utf-8?Q?XXAw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806b3993-2991-4ee3-4c27-08ddb992f7f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 18:05:03.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhySuCzIhAy1TbGp2FGOKpv6sJoAChNegsEW9Ysq5vesgcrb1BQuQLikAQ9tp9kecM58dQHfYGvtLFYLyhIX1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

PiBPbiAwMS8wNy8yMDI1IDAwOjI4LCBGcmFuayBMaSB3cm90ZToNCj4gPiArc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgX2RyaXZlciA9IHsNCj4gPiArICAgICAucHJvYmUgPSBwYXJhbGxl
bF9jc2lfcHJvYmUsDQo+ID4gKyAgICAgLnJlbW92ZSA9IHBhcmFsbGVsX2NzaV9yZW1vdmUsDQo+
ID4gKyAgICAgLmRyaXZlciA9IHsNCj4gPiArICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9
IF9vZl9tYXRjaCwNCj4gPiArICAgICAgICAgICAgIC5uYW1lID0gImlteC1wYXJhbGxlbC1jc2ki
LA0KPiA+ICsgICAgICAgICAgICAgLnBtID0gcG1fcHRyKCZwYXJhbGxlbF9jc2lfcG1fb3BzKSwN
Cj4gPiArICAgICB9LA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cihfZHJpdmVyKTsNCj4gPiArDQo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiaS5NWDkgUGFyYWxs
ZWwgQ1NJIHJlY2VpdmVyIGRyaXZlciIpOw0KPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+
ID4gK01PRFVMRV9BTElBUygicGxhdGZvcm06aW14LXBhcmFsbGVsLWNzaSIpOw0KPiANCj4gUGxl
YXNzZSBzdG9wIHRoaXMgZG93bnN0cmVhbSBwYXR0ZXJuLiBJdCdzIHNlY29uZCBkcml2ZXIgeW91
IHVwc3RyZWFtIG5vdy4NCg0KSSBhbSBzdXJlIHRoYXQgaXMgTk9UIHNlY29uZCBvbmUsIEkgYWxy
ZWFkeSBjYW4ndCByZW1lbWJlciBob3cgbWFueSBkcml2ZXJzDQpJIGFscmVhZHkgdXBzdHJlYW1l
ZC4NCg0KQnV0IGl0IGlzIHRydWUgSSBtYWtlIHR3byB0aGUgc2FtZSBtaXN0YWtlIGhlcmUgYmVj
YXVzZSBJIGhhdmUgbm90IHNlZW4NCnlvdXIgcHJldmlvdXMgY29tbWVudHMgYmVmb3JlIHBvc3Qg
c2Vjb25kIG9uZS4NCg0KKHNvcnJ5LCBJIGhhdmUgdG8gdXNlIG91dGxvb2sgcmVwbHkgdGhpcyBl
bWFpbCBiZWNhdXNlIG11dHQgYWx3YXlzIHJlcG9ydA0KRmFpbHVyZSwgSSBhbSB0cnlpbmcgdG8g
Zml4IGl0IG5vdykNCg0KRnJhbmsNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg==

