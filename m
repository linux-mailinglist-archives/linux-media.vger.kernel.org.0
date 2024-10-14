Return-Path: <linux-media+bounces-19549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2C99C335
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 10:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F3028392D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 08:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6DA153824;
	Mon, 14 Oct 2024 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qG9F21GO"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2085.outbound.protection.outlook.com [40.107.249.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46811531C5;
	Mon, 14 Oct 2024 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894434; cv=fail; b=mTZisag+HGHilQklnDsQ/8ZOquHsoZa59CQBPI8OHsdIkZQGWyW3+v5mQkgjkSJ6P6tV77lZlNeT6WWi2WVsuvmoGew233bMvrV93l7U/6YbKM0CJKJDYYXEMYrovldS/KZeZXL56Hx5X1k6PYEWwlaeLaILsP/PW/qqnwWH2b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894434; c=relaxed/simple;
	bh=Nm7x3c0GwHFIEwbwaE2IqbPRwq8FUFWCFMFJqruDfYE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=irar2ippcWp5WgVBXJ52/1SDZu1IccF8CmiAHUBKjDLWDKCS+L2Q16DthsrjiN5CB7A2CxwIU02T/75P/EVFJSRA22bZsX2mlaR7/d0NkYwXExknLLX/Q0d2uxpWXf9FweBn2MPM/VHbcW7NjsMDcAV4++0WuBW9gLl+I9w2K5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qG9F21GO; arc=fail smtp.client-ip=40.107.249.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+Fcy4ZoVgBphQIFVKAJTWzoUDVih2JxGcBJvz25HygGnUShCUHQqIW2HF09WmmDnzNNaSKk5As9ETfNHdlheNRsT9GF2VCdqxRrwYmxd7cuzPV5755ZBcwCxS7hJW2RcDRfCrSpNVtLEDtEWZu6OB4TKksRO0lxFev6xuL66/UDlt6PDT0DJ+rT+7Q6UAluSXohOVZcZq1mR5+l4029MLZIHk5RxqGvq+nvL8bpCa/XmvfoZNK/j4ofjhOqj9zGNVRhdifHyqgmWHIIAcBYsTFvmxUfBOdPhNzxCnv4U5se+8wJasG0+yQU9eKvlEO9ZSYvJx7WyclTH6UgHQi+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm7x3c0GwHFIEwbwaE2IqbPRwq8FUFWCFMFJqruDfYE=;
 b=OmwWHO1XrxHk7G48yRpRdhjxqnqZDhfQitvT9Dq8FFcqVMOyev1PTOALBJC6EdaYNtb0mpZ1/J3HYHfI1WnSoIQLJ0P7aa+RoZqiqOCs8/wJnOKt3TN1aqSN76HmcMTfWx84c+XgnN70WVKSbcwvvSfdrW74pzTcF8inhEloIUYKgWYi8e/XHIeEB5yFDLY6WvbUkD1pFjrzeLGooJNS3pbZ+qGBR3aCylsxR5IEmey2Wq2nvR9lUstZlkZqfGx032oBFvotY+nqvYeM6b76xeYh5Z2ZvNKGdQU+ZSJlMXY0BYgaEptyW7a3T9ySMCxRczEbZToL3KileN67ZtIlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm7x3c0GwHFIEwbwaE2IqbPRwq8FUFWCFMFJqruDfYE=;
 b=qG9F21GOFmY0+TK6MafHm96kx98O379U7tMYL2dr1N/2klCbJisVZoarQBzTp9UaAcTLXgsdBeu442Ou1d5zDkYucg3cdn2s/xX0uog70ZXrPzm5NgWLn+G8q9Ja7rvjFHT2mNYwVhBC/FPMJXWDfgIoURdRs4iuhF5ff/vWFDLgVbqi+695iIPNsupfsFCuZViNIOq9q/w1TPaDMmJIUr2c3FUskIRxVolmijknKkHm88u0/HUeJGydmhWq+Dipv7nInvuWgUsaIQ7aYXuSO4tgYXZKuL6NLpagA1B5U67c23hgh2Eqjc9bPqagQ48Op9H4RENeYTNC+St+liFMAg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB11036.eurprd04.prod.outlook.com (2603:10a6:102:48b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:27:09 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:27:09 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, "jacopo@jmondi.org"
	<jacopo@jmondi.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.d" <kernel@pengutronix.d>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI
 compatible string
Thread-Topic: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP
 ISI compatible string
Thread-Index: AQHbHINhFvMSuTYhP0mdLjBltsYICrKF3OAAgAANMzA=
Date: Mon, 14 Oct 2024 08:27:09 +0000
Message-ID:
 <AS8PR04MB9080EB24C4F1CFB6ED2B1C0EFA442@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
 <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>
 <6skgxfgvnd5f7zx5gcobcvp7krjskupo52c4op25i4qmmgti5w@3tn3hkmh3e2l>
In-Reply-To: <6skgxfgvnd5f7zx5gcobcvp7krjskupo52c4op25i4qmmgti5w@3tn3hkmh3e2l>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA1PR04MB11036:EE_
x-ms-office365-filtering-correlation-id: ba8eed86-98a9-46cd-a529-08dcec29fedf
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2dMTDFqMGprNmFmVm1qYUYxbnptTC9TaUlUZ3ViMXdJZWpLYWlGZE81MnNX?=
 =?utf-8?B?TnhsVHQ2OVpHMTNockNYdm5aK01FNGRJY201TWlrMEd0VUM1UVp3bCttcFcr?=
 =?utf-8?B?VW9EZ2dKYWNJZWNMd2NsdS9YNVB2bS9WMUJJMzJKR2VUYS9Cei9vN2RNV052?=
 =?utf-8?B?RGxhdUZpY1N2TGdQNFlFcFVjZEhoV3IvZ1lPS3FqUTIrWWFNVTNZK1lxeEhE?=
 =?utf-8?B?ZzBBRjRLRlFwaW5YZGo2bEpEU0EvODBtNlB1VnBiYWluZWkwelpPdFpPbkxn?=
 =?utf-8?B?MTJUVU9wbWJoUVo0cXlBWUozOUpudkwxWUVza0FYY010cm1ka2Y1VnZZdUx2?=
 =?utf-8?B?Ky9NMnpkYXFLenU5NG95ak5YaWJqY2RldFF2enVORFJoSEdObTBLbnQ2WG5J?=
 =?utf-8?B?NHJJcTRNTVBWRXVrOE1iMXhhdWF1MVMvSWlONFJjN29vOG4rZWkrWnlPWWhD?=
 =?utf-8?B?NTBMMEhNQ3hoMVhSamhaNExkRE91ZUY3eVhOOHVOeWIzUTk0L3ltR2JrMjdz?=
 =?utf-8?B?clR2Z1ZnbDc5emMyN1huL3EzYmplKzhibUowSFpyazZYcXF5V2k5M0MzUkM4?=
 =?utf-8?B?ZUdEeElzWHhyNU96OTdYRkNReXQzNm1aME40Mm1iMFVQNEdYL0t6R00vbEdq?=
 =?utf-8?B?ci9QRTE4bDJPaW90WTlZWnRqZWFEL2l0TmQ3T1lGbzRldmVoTjlreHFkRzZK?=
 =?utf-8?B?YWpKSmJIeVE3YTdWK2o5aEhDN2JSWTltYmVTTVB1NHhxTGJPUkVQa0hXRFNt?=
 =?utf-8?B?bkNwZXduQVNiRStVTW5OdFVoZlVFbEJHcXRNNUpIRkFGN3EwYU95bUlxM0do?=
 =?utf-8?B?dzU4REVxQXZ0dnJDTjU0L2YyRFJlem9nSnRZcnJSakJJRDlLT3huWVJVNlAv?=
 =?utf-8?B?S0UxREtuaXBXL3ozT3BXc1FlOHFodWVMRXBZcXJtNnRMNXJ6aHBXTEN2U3Bi?=
 =?utf-8?B?ZEZzVHlTR1NDSDJWS05ybER4Y1YyRzFGSHdvS29xcFYrMFRJK2NEM3kzTlVR?=
 =?utf-8?B?NE9ONEtVdEN3UWtzamtiVzQxL1NEc3VOVndRQUtkcDJIVTV2c2hJSmltRysz?=
 =?utf-8?B?ejgrdC94dlRRemEvVXVYMGl5RUdCdnl6YmU0Qm80UDM2dTR1UVhEVEJNRFcz?=
 =?utf-8?B?VU9LZjZRbzhleG9xNll6cHB1dGtETDBkbG5URXEyNFF3Z3IvRmRCd2tBZHZi?=
 =?utf-8?B?T1ZMTXNFeHVzQjhDTS84bE5pZktNV2wyeTN1VjZLcmdDYThqWFN0MmgvbWR0?=
 =?utf-8?B?YUxXb1REZW91SWw4Y2NhSDg1ZTNYb2hZNk4wWWdMVEFLWVlSL293RzFoVVJ6?=
 =?utf-8?B?cExsUnZzcjBKb3VPOEpaeHhJMHZ3NUlSN1VsdGFqZkxnMWs4WHhhdjZGLytY?=
 =?utf-8?B?OWNCYTE0QytmMDVNZ3hVUm9OMnpCVVhPa1ZJVGM2WGhySmU5SGVvZGF0UmNk?=
 =?utf-8?B?bXFreFF6WWlWYXBzR3VZaGxpZ3hXVnhYekxFVUFhQTlPbkpvNThFSUhIZkxQ?=
 =?utf-8?B?VTVBV2QybTlpWkkzbThqdHcvdXo5STJ4blJRYVJIMVZma1A5OGRUVHA3ZTRo?=
 =?utf-8?B?OXVBUDd5R1lDVDNFeFdyUmJISlRZMzB6L1o2a2dTWStNZWpzZElOSnc0MXlV?=
 =?utf-8?B?NTFmUW13VTVaLzlNbFZ4dDNwdmhROWlnS0VOQXMwVWIzMzJteXhBWkJOcDRZ?=
 =?utf-8?B?OW1ZVHh6bEZtc2VMN2lneW1hNGRJb3J1ell5VnJYNVozS0kzaW5jMGFOcU5n?=
 =?utf-8?B?aU8reXIwK1ZRcE9KN0Y5TTJ1VkpKakhPQStYL2dSZG5xTjBweGhGVHVMRlMy?=
 =?utf-8?B?MEdta0xvclJXNXVYWmlMZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em1GVmFsbUs3NGVTY3ZLN0k0QWMyR05XeHh1R2dOaHErZ1RnUjE4VllrenpG?=
 =?utf-8?B?eTczQXlRRlBvckF1Qjl6YXNqZEhJRjRpVWZ2dzA5UTdMNTFPS3dmWjVUMGlK?=
 =?utf-8?B?ZDI4bllWMTB4VTlpRTFYcEVRa0RNZ3c5SmFaZUFzL0NnUUZjQ296QXlxN29Y?=
 =?utf-8?B?QWowdklHRnl3cGJrZ2dqdHVQand6UGs3SFN0Y0l4V2hmbzQ5RlpWa3h3aGM5?=
 =?utf-8?B?UW44bkxtMHNaWjVTbzZ6R3d0MlFiSlhtcEo3amtDSFhNNkhJUjdYRUxwZUV3?=
 =?utf-8?B?K3FOKzRHQVFFdC92WWx6T3FBQVNtYVJ1K1lSMlFLMnR4TFpDdzVoNXhwdGFD?=
 =?utf-8?B?WGNWcjlIbjlxTHIwL0w3WU9ZdWdNYnhwaTdlYlp1b29RNjVkM0UzeldPTFh4?=
 =?utf-8?B?aXpHZlVvaXVtVEJPelV4ZFFxQXFpK01NQ1NpU1MxK3RuaTZCc1RDME42THMr?=
 =?utf-8?B?SXBtalFYUVRoVlgyOS9pYThXTVROZzU1U2VNUzNZMldkVEJYbjVEVWlONFhY?=
 =?utf-8?B?VTJTUjhJamZrZWFvdThqL1NrMlp0NVA4WFg2UlJwbWdiRHg2WWNYbzFYM21J?=
 =?utf-8?B?NEtqaW16ZmN4Qit5RGxYaGsrZGs5TEJqMTJaVVJ3Vk5jV2xvcFJWVHRlSTlz?=
 =?utf-8?B?Uy9JckZnbitKVFlRd2wzallFWlVkU2tSTCthVlpaT2lTdkJpemFyOXdCWUNs?=
 =?utf-8?B?UTJ0R3FxWlZPUS9BV09RditPU1MxTzNtL3IrZnB0aVNWQ0tlaFBUQnE2VUNF?=
 =?utf-8?B?RCtrT2RPeXIzRVhwWHRWNDE1dDZtaFdFb0hHUkdEeDVZQ25Md1ZaTzdkZjhz?=
 =?utf-8?B?TWROR0l4S2syVy9BYkhiSmJ4alRKTmlnTE5EbVlnM2hGSEc2ZkdiRnhxYXdJ?=
 =?utf-8?B?NjJRdUtOK1VqaVhrWE1KVlBCU01QcmozbVRaaiswdnZRMlFscmlLTVNVb3Ew?=
 =?utf-8?B?YXNWNlFsSm1oOUduaU5tbzVyRXlEVnMvLzd0bnQ4U3RBeVFyZFozZFJ4NVo0?=
 =?utf-8?B?RTFvVThXdXdtaHFVVE80Tm1iaFFnNE1PMkZvRmRUR29JREtvSDA5NzZINlFN?=
 =?utf-8?B?Z2dEZHhtOTcybWVXd2UyLzdwaXY5TmZvVGNkTUxZaUpuNjJkaGYvcnJGTHJG?=
 =?utf-8?B?RU5HVU4zR0pqMTRmYWY0MmszQWRuVjBoOFYrWjd1UnBqVzJjQnNTK0tabEVD?=
 =?utf-8?B?QXFIcHVqVEFxTnBMNUFudmR5WFBIc0c3R3F0V3VlYktjdlB3RlcvS2Q4RzZD?=
 =?utf-8?B?dTZRM2JBWjlSZmZKQjVRam5BdjRUbDZLWjhRMzVxOFdFakFhbGRLQ1dYYy9D?=
 =?utf-8?B?RnRnSTA0MVVLUUFta2prdmptY3dZUkVrYkRTUVBrUnBneTZlK2hHeDE4cTh4?=
 =?utf-8?B?S0VFK2JCa0ZCeWROZGxUSE1iRXdRT3I4NUgzWWpxMFJaUHBpS1RmKzBEMnhs?=
 =?utf-8?B?eXRLYktDOXR5MGs2dGZRM01xYTNKS28xbzNlbjJtZ1FpbDlZd3NGamlJa1JO?=
 =?utf-8?B?bzNVdzZ4UUdTVStnUXl5Vys0S1c0ZFBPclpGMU8wQ2hrMHJIakwzYkFUTDlh?=
 =?utf-8?B?NHNFZU9oVnZYVUUyNE9nUCtBZ2lCQm80bU40T2xHb2pHN3pJbjU4T1VHMVp3?=
 =?utf-8?B?UkRrQWdwcHlpOFVVYlhLQmd5UVdWemlGZldnWk9vSVdrWEN1ZjhxbUVGMGpp?=
 =?utf-8?B?V3dYRkR6cW1FSytqM2NzaTd4MTVJdXNxN2RvT0lCOG1BODNJU1FyMmVKcEJV?=
 =?utf-8?B?WFNZbGhOZThyc1pkQlB4ZGhEMGowTngwaElkTUV1VjJtRVdHZFVCaGc5bGxt?=
 =?utf-8?B?MmcwbW1DZVVUQ2J1RUxreFdqU1pLaEJ5Rk02RXBYcERrZjJJNms2S1V5dU1P?=
 =?utf-8?B?ZjZxV1VWYTRXOG5rdGtvZkFmSXF4cm9SUUVNSHNPMDBURDZqUndiNFVqa2JV?=
 =?utf-8?B?d2RJRWFDNjF5a0FybnY1cmd5ZWM0dVRwc2NZU21KZ0Q1emtpamxDWXZoSjlv?=
 =?utf-8?B?MVN5RVEzOGtJbGI2aWozZ2gxZ3pUL0pOelYzY000d3ZvSGoxTnRueGQ3WER1?=
 =?utf-8?B?TzBXL0FoWnRXNHpOTm84VitMRVNTbFh4M05GRnQ1eTVDV0lwN3gwWnFqbW5F?=
 =?utf-8?Q?x6TlbkSQD2xD53U7B9DWdgdVc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8eed86-98a9-46cd-a529-08dcec29fedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 08:27:09.3458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lE9hh1wBYv/u/gxIpABMi02EJdIZoaonLgTIPcKgDPY4KytX+LMqpRgDUSlRjuJUIO/PrIaTmDLIdiAFA4uP+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11036

SGkgS3J6c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciByZXBseWluZy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNCwgMjAyNCAzOjMxIFBNDQo+IFRvOiBH
Lk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBMYXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+OyBqYWNvcG9Aam1vbmRpLm9yZzsNCj4gbWNoZWhhYkBrZXJuZWwu
b3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2Vy
bmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4g
a2VybmVsQHBlbmd1dHJvbml4LmQ7IGZlc3RldmFtQGdtYWlsLmNvbTsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGR0LWJpbmRpbmdzOiBtZWRp
YTogbnhwLGlteDgtaXNpOiBBZGQgaS5NWDhVTFAgSVNJDQo+IGNvbXBhdGlibGUgc3RyaW5nDQo+
IA0KPiBPbiBTYXQsIE9jdCAxMiwgMjAyNCBhdCAwNDo0NzozNVBNICswODAwLCBndW9uaXUuemhv
dUBvc3MubnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhv
dUBueHAuY29tPg0KPiANCj4gQXJlIHlvdSBzdXJlIHlvdXIgbmFtZSBpbmNsdWRlcyB0aGUgZG90
PyBPciB5b3UganVzdCB1c2UgbG9naW4gYXMgZnVsbCBuYW1lPw0KDQpEbyB5b3UgbWVhbiB0aGUg
ZG90IGluICJHdW9uaXUuemhvdSIuIElmIHllcywgaXQncyBub3QgYSBwYXJ0IG9mIG15IGJ1dCB0
byBkaXN0aW5ndWlzaCBmYW1pbHkgbmFtZSBhbmQgZ2l2ZW4gbmFtZS4NCg0KPiANCj4gPg0KPiA+
IEFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgc3VwcG9ydCBmb3IgaS5NWDhVTFAgSVNJLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1Lnpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAs
aW14OC1pc2kueWFtbCB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K

