Return-Path: <linux-media+bounces-39955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AECB27BB3
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C245188AE90
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DED25A2BC;
	Fri, 15 Aug 2025 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wudqWAKk"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC61EA7CC;
	Fri, 15 Aug 2025 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247829; cv=fail; b=J4soPv+RDSScC6yDubp/1XSGZhEHANefFhHrPb9Fqw1fb1u/m+M60l1oz40+5DuV0enb9T2leYzjs6fueTmVuGQv8rPFGiNveJPcQGiOjDxNK5KXWx5ak9jCr+eYPaSkyZ3a1QK+OYurJgr/ddkC3HQLKPZHdNv/Xcv8O8hMfJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247829; c=relaxed/simple;
	bh=cOGfBWnGho+UDbmZtTyx+I7gPw2vJ5BkUJMAZ8+PnSQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pRvQD8zeQzovuowgeA95gJwXSrl5Frgxeth6WL50p5TM2ODyQGzvDoj4g37r6aSD15DUxMPB9vB3ctbXpoy6i9I/f4OLaS6/ltOP+GZabiAcJA+XzA/On7GGOaIYa+AyVp28pfNQFYJAPyUurmOmyoxJ3FtnaBmynZadaPMOc2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wudqWAKk; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDJy9yoJnJ1WhrgZ3sHYi0IYqIxua1VhEQ5z8FPg7xPpXgxdglkksrbo54wbmB7ECSzufT34EDvgVdgTbICeLogv73VCYidICFWclZ5bByZJ2vJb28IsAZH3YWMuCpH35C2WqksNOP6NNxvbEQJ5/G9TkJW8JuuKm6nwcaW/AHI7j9zKPw3gb+qTxZAEOA8QOwVmEJIXVd8EhK5HthOY8djRqFRRH40vjKnFcNlOXBExCW8ziJbhxRJ7mFo+NOVOWyHbIhR8BKGrw1U7gLM0Wg64BHaKv4gQd7xLf40ujfEP3/Il0bWt5aD3Di19V6gzK8jR00MOd7K6HVkESqZW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOGfBWnGho+UDbmZtTyx+I7gPw2vJ5BkUJMAZ8+PnSQ=;
 b=jze1GcWelOq9Zf+ECdEuAo1lCDQ7E7dRTfICqvq2gyfykWJ3Q6JLQLQQ8v0HqqE6D0TcJNuLsuq4e3wNfYYpOjtE7hBlqiLnDG9rvTFWLd6UDF2xn5wkD7llrvOmTNmjxwWfPuvUy6OBUH/wQdeRwBFyjeRwCupF8TCRjrl1ArbmC7wbqCPKyd8ZiNci/0/La55sPR1gonhuH5f3Kn0Kkx37DIFy2REAc0EBJDsOJpjK3d8egBhCTGbl3nwjGphgcBTi0yo7YcXRWIdE5lxEVZYyhw+Dv5+e9Ksx7eqAUWVg1GcNp8srluhVCw2dPV36VR8QKVsci7lCw0cEV3ehhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOGfBWnGho+UDbmZtTyx+I7gPw2vJ5BkUJMAZ8+PnSQ=;
 b=wudqWAKk/rJ9gJeEmBz2NGtePSGQJM4blTAyVgjmlWHrzOh1W3HuYXvvY+No6X8WnN+CvAyIByBvodETb+v4Uo2LaHt2Wj6eTsXAp+KsZRyxL8N7CTNEke801AJOE5FAP6T3Py3RpRaLWcbM8AQZXwqcQIuITboA5zD61+bu7nBUvWvAcqqHQRaftZBWiNuFx+tutr+nT14hyY27fJgjFj/+lB9cvUPFKqUJ80ZTua0a8ZVU/ML/vftLQQVqoWfF/a7tqDC+1BXmzXbmatPJX/HtQ0LVeFKfBuxAIc8KyuRwiDFQIKHaiAaXdcVMmqvI4vOlzJ6p05gIbCm+97eyvQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB8029.eurprd04.prod.outlook.com (2603:10a6:102:c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 08:50:22 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.006; Fri, 15 Aug 2025
 08:50:22 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "martink@posteo.de"
	<martink@posteo.de>, "kernel@puri.sm" <kernel@puri.sm>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2mem
Thread-Topic: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2mem
Thread-Index: AQHb9sRLGkrKAAD5PE+pdxmIcoX/drRhWKMAgAI8cAA=
Date: Fri, 15 Aug 2025 08:50:21 +0000
Message-ID:
 <AS8PR04MB90802170205D9EA2AA3C1098FA34A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
 <20250813223910.GA11412@pendragon.ideasonboard.com>
In-Reply-To: <20250813223910.GA11412@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA4PR04MB8029:EE_
x-ms-office365-filtering-correlation-id: 8b48f62a-18f0-49ac-9839-08dddbd8c4e5
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bGNRVkRuUWVMb0ViNXEyM2lFK05oWGtYdGhsQUZtSnRKYTd1K1ZvdTNacTJ6?=
 =?utf-8?B?amNNTEFiZSsxV0VtWGFZMTA5ak1MWDJpQTN6RVc2bmMrUzRoT3FDaldVTEs2?=
 =?utf-8?B?Q1RabkpEWXdwZDZwbzNxODk2OHF2N0FPYnRRYmRoU2oxN2I3dmN4c2t6ZlBs?=
 =?utf-8?B?eFFhSTkzc2wyMENybW14VFZCTkF2SmMrMlFuUDRqN1E4c0tqNzFVTHN3OUUv?=
 =?utf-8?B?VkVWNGI3SnpyaVpoV3NkeGdXQS9EeEFibHI3eFFzWlNrbmxLRE5ZdTR5cW1H?=
 =?utf-8?B?SUxVdG1Qa3UwVkZDRGpMU3VxT290TzVabHFRaGowVkM5ZjFBZmNtTTR2Mzlt?=
 =?utf-8?B?dzZyVEZPWGg5R0VoNTA3UW9QYXBQeUs2a2YyR0RTZVFJQmh2azdsZ3ZMcU1E?=
 =?utf-8?B?TjFxM2RoQ0RDMXhQNmtaNkI2bTN2SDIzelpRZFZLUkV2alhwbnJaZk90Ly9M?=
 =?utf-8?B?M0JWdGl1QXhCT3Uyb0dVUmVpV01XczFHSWNFUk9xWVlwUXdTNEhjeGlKWEdL?=
 =?utf-8?B?TmdyRG1CM01OTkZlUEdPWStGY2pmMFhBMjdTeHZ1Z1NCaWU3YXExS1RiWmRk?=
 =?utf-8?B?RUNpYVJYVjZBQVdXZnF6UHNGMWV1L0tMSDgzOHg2UExPWkdLWnYzejBUZGxo?=
 =?utf-8?B?WGg0Z2xPaGNLOXZ4VFpmTlZlWXR1dVVDVGhXQllPVjFwZmFpQ3R0aFNCQUhR?=
 =?utf-8?B?L1ZWTFdQa1J6MDE5TTZjY3RVSVRLejdSdExQZTl4NXp3MjFSUWdTNXd4bERh?=
 =?utf-8?B?cHNvTFpTWVcwV0pHM1R0c2FEZy9lclFOTmtINkxCcFAxNlE4ci9IdTMzS2lF?=
 =?utf-8?B?eCtIWnFXK3FWbllLTklRUDZ0c2R1M1d4OU4wQVhqU0Q0aGxGMnFvWkowNVhv?=
 =?utf-8?B?S0R5TXNYb1hQcGFsSXBSbzVJTVhKU0xwbHlEcDQ1bXZLdHVCR2FYN09JUzhB?=
 =?utf-8?B?R0tINVdwU1lUZkpSbWI3L0tLa3ZKby8wYkRldWZBZDNPWWpLMTlqQzhHM3JK?=
 =?utf-8?B?ckVETlFiczFrZXN1UnEzTWMzaHkvZHE0MmVqTHVNMHh6cmZmT2p5NTdkOUZR?=
 =?utf-8?B?MzRxVWJ2M3Nkb2JsUHNCcjdDQmo1YTlCc0xZcFBJNUNvazhMRURsaVZpbHNK?=
 =?utf-8?B?WWhwWnliQlpISjlYZ3F1bTBqYmhKYkRkbXhMOWxqMzZDVWg4V04rb1dqaUtq?=
 =?utf-8?B?Nlk0QUdGbDQ1a045MUFqOHl1Q201b0VVaVJFbDRGb3MraFNXNFVmTXI2OURP?=
 =?utf-8?B?b1Z4N1MxQkhnUWt4SXlCRVc0d0RaZDAwMlZqL2RPeGszVjE0VWkwZXFqWHJQ?=
 =?utf-8?B?SWIzTG9WV253eXVXNjJyOVFJTGppUlRrTm9tWkNjcVRuTmNDbEZLUmMyanFI?=
 =?utf-8?B?N0JNNTI2eU1GOTJTOXpPZjZ2YXNKYUpjKzZFV3dnbTBlb1ovVkcvcW5ZMVBi?=
 =?utf-8?B?NkpuL21VNTNZUStHK01PdUJzS0dORVBSd1VkWU53MEcydjZRWk4vNnBCVVBN?=
 =?utf-8?B?WVVIVEFxd3l0Vi9icW11bEkybURQQk9yTnp4blBmMWdwc2xtbUp0b1cyUFVq?=
 =?utf-8?B?RDVKOXlmcjZkdU1qSVRtRTl4eVJ0cXBid1pucTNDRWNiME5uWWdoQ0FsSzU4?=
 =?utf-8?B?cEpWUE1PZVFMVTFIZkswTWx6YjM4Nk91VGZ0OXU3NzNmOExwOUhETWliSVhy?=
 =?utf-8?B?MDdwaGxQWHhkWmFoL2NxcytqckJ2YVZHaHNFcFcxRzhQTHBKYTUvTzVwOG5I?=
 =?utf-8?B?M3dXRzBiWmcyMThBU2dmdEppRkdMTEk5cnRLakIvdGN0Uk9BRWk4bXM5NldZ?=
 =?utf-8?B?Ny9oT1ozMWhSYm9jUFRWVzhvMVlYS3hXRnZWWktiemRjMVlLMUZyOUxMU3lL?=
 =?utf-8?B?cDFSMmdJeDRKc1oyWVpLSFlrUmlYLzdHajM1Skx0dVkzK0YyUWsyOFRsTm9O?=
 =?utf-8?B?aHZJbytlS3Q0RCs3Um9ZeVMrVXZ3MUZvSVNSZG9Vc29COTQ0RmZlSFhLOVZS?=
 =?utf-8?B?VitWbDhUemh3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z05LREZNclM5R2pkL3dOY3JscWZRcVQ0aHBsV0JMNGFlMkkwNXpINlZYbWg2?=
 =?utf-8?B?Q1Z3YkV2SjYwZUlTczZJemd1UXBxOW1yek15bHNZMlRLcG1ZTkFCampVaHQ3?=
 =?utf-8?B?bkVoMUdBVTVabGlodEZsanIyK2VtU2VOSW1QNWJQNFlYWktPOHQxNGVVRE5P?=
 =?utf-8?B?WlJFcDJIZGFwTmZCR0hXT2RvZnNTck5OQWFoTnhhOUYwYU1zNUZybUxYN1U4?=
 =?utf-8?B?NG5IS1ozN05MYkgwRjBoUTZianJOZzRIWnp2N1pHcGlvZ1NKV0ltK0xpYTZK?=
 =?utf-8?B?YjZzM21jQ1VUaHpsSDkydEVIc3QwRTZmNHVKeXNpZnZ6YUlsL2dvNkF1cTc2?=
 =?utf-8?B?d1RPaE9EMTBsaTJPR1dHUWc1NDkzM2VKRXl1ZkR1V1BJTXVzTUVvTjI3bU0w?=
 =?utf-8?B?OVZIRUNHd3UwZVlWQzlTclIzQ2lad2x2cWV3VnpJWTc2LzhOc0hqWHZrWlJG?=
 =?utf-8?B?K0txc2ZHWVlyU0pQUCtlR0w4b24xbUZPOGF2Z2lUc2srRDhuUDBraXdLWEpD?=
 =?utf-8?B?cC9OczJCemh0RWd0MlhXYldpUXFFTWlUOHg5ci9MUFJnK1NJS2lkL0duaHR0?=
 =?utf-8?B?WDBrOXpJUUtKSTVrZ0lSalNCVS9uUTlpeS9kaXhNNkZXODVVL2QvZzdrYnow?=
 =?utf-8?B?K1huVGR6SEpCQWxYSFNWNXNLa082MDUvTzE5ZkQwZ2ZPbG5JeE9VQXVncTBy?=
 =?utf-8?B?TzdVelBiT3c4bzFHQ2RINk1hQjlnQlJSemt2UTMyajBjYVhNaW50Z0pNNzV5?=
 =?utf-8?B?Tk4yaHJWaUhWQ3pLMEJzQ3pOaWlvL3RqOXpsaG9NRHBDeGVOeitKZW5MN3Mv?=
 =?utf-8?B?Ukt2U0o5Ny9tRTF2eVFtRTFsYnRyYUNLdDE5QXFiQVF3UGxLOGpPeEtBalJl?=
 =?utf-8?B?b0R0aEQ5NytTcDRpYzZXZTd2TmNkTW9kSGxicEhldkp0U1M0WitrK01qZFk3?=
 =?utf-8?B?MzI4ZllUWFQrSW1haytReVpxanVrWXJ5UTNkNkdhcUZ3cWZadGtEZ3p1T1pU?=
 =?utf-8?B?Zzkrbzg1ZEMrZG9ZK1hQL2hhS3YwSDMxcW9wSzB4YnlCUFZlRmpWMk5hRHV2?=
 =?utf-8?B?Qjg0SFVwSmpqUDRkSUo3Yk0rc0VIUTlnZjhWcjFxNi92d2trTXpsVGp0T1Fz?=
 =?utf-8?B?bmVETnNoY2FuZ3pUemUrQ2hWemFNMXF4dE1rV2pQbnB5SGh6UGxreDM4TFIz?=
 =?utf-8?B?dUpwQ3ZtbUN1blBpNnBha1VKL1cxMDVJRVFHTWJQbVViT3FRTGt1NG93ME14?=
 =?utf-8?B?cGJTNS9qbzkvMmdUZkF1K3dKczZjQ1FnNEJsZjROVjg3b2ZJUGdtVkVwLzl2?=
 =?utf-8?B?a08xWEJ5NnBEMzc5Z0lQc2F4K2tpenplbmdjMHVNQkE3L1RQbWY3Rm1aNm55?=
 =?utf-8?B?ZFlWaFZnaEZOU0Q1dXZ4YWxTQkpuWEVkV3l2YWY0STVGK1c3VFl4OUVpRWV0?=
 =?utf-8?B?M2Y1NXNuVENKamFGUm91dU8yZkMveWI3U1JoUTFUYWhuTndkRFhhTC9ReGM0?=
 =?utf-8?B?TmJNV0RzWTFBaG12VWxkQTM1a25FRnhIeGJhVmxBcXh1Nm5FV2NkanRpTndl?=
 =?utf-8?B?UmxjelNWaHBaYnNzS2YvTUZPcTA3VmhhYmtoVXhJTllHNzV3Ry9GUHNheUtX?=
 =?utf-8?B?Z2NCVXJjQkQzemxhb1ExY1hDZ1FzUFl2cDNaL1oyL2FNaG5pdnVKNm1adTAy?=
 =?utf-8?B?RDNNd29WVE9BdGR2MVk4Q2xuUFBBOU9FMHNnTW0rTFErWU1hT1VISnYxZm0y?=
 =?utf-8?B?WnJXVGF3dG8vVGdJcmRTcXM3ZEtKdGh5bUUxeWJJY1RXb1lhUHpmdWdQM0Jr?=
 =?utf-8?B?c1RSd2d3L1RieEdEUjNPbWtFdlE3LzJKTmo5bXVVdXhzWVU5WWRpN1RKQ1dN?=
 =?utf-8?B?aTdpQTlTdFN6TTBCUithVWhUOWpRUXNwbUh1eDV5ZHZCQnIzWnlObkpCMnMx?=
 =?utf-8?B?SC9IVGNrV2JjaDNjWGFxSUFQNENYS0VjU1NXR1NHRXRIQUVhQ21LbVk2Ynli?=
 =?utf-8?B?dFBFUlovaDVFbmhyWitSYkJYQmxhbTZLNFZqcURVU3d0OFhkL0dtQUZtTzFW?=
 =?utf-8?B?TE4rcm5LN2lDRWNEanY4Q3dISEg5eHMrVXEwVktsa1N2SnAwdXArQVMvazRV?=
 =?utf-8?Q?yb/EjYsfTXjEohcZ6ARNBWXfK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b48f62a-18f0-49ac-9839-08dddbd8c4e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 08:50:21.9057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDK0O/I7iW8vy/XacrPrVHP3SNMGgU1FTxdj3iI6knMjVMHcl/zIt0HUBFUTutg97FC2cfUT/uEet/PhsgOYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8029

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlld2luZy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTQsIDIwMjUg
NjozOSBBTQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4N
Cj4gQ2M6IHJtZnJmc0BnbWFpbC5jb207IG1hcnRpbmtAcG9zdGVvLmRlOyBrZXJuZWxAcHVyaS5z
bTsNCj4gbWNoZWhhYkBrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxA
cGVuZ3V0cm9uaXguZGU7DQo+IGZlc3RldmFtQGdtYWlsLmNvbTsgbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC0NCj4gYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIG1lZGlhOiBueHA6IGlteDgtaXNpOiBBZGQgc3VzcGVuZC9yZXN1bWUgc3Vw
cG9ydCBmb3IgSVNJDQo+IG1lbTJtZW0NCj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgMTA6NDM6NTRB
TSArMDgwMCwgZ3Vvbml1Lnpob3VAb3NzLm54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogR3Vvbml1
IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4NCj4gPiBBZGQgc3VzcGVuZC9yZXN1bWUg
c3VwcG9ydCBmb3IgSVNJIHdoZW4gd29yayBhdCBtZW1vcnkgdG8gbWVtb3J5IG1vZGUuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiAgLi4uL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmMgICAg
IHwgIDggKysrKw0KPiA+ICAuLi4vcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUu
aCAgICAgfCAxMSArKysrKw0KPiA+ICAuLi4vcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNp
LW0ybS5jICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgNjcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuYw0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5jDQo+ID4gaW5kZXggOTgxNjQ4
YTAzMTEzLi42ZWVmNDUzMDJlNmMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5jDQo+ID4gQEAgLTM3Miw2ICsz
NzIsNyBAQCBzdGF0aWMgaW50IG14Y19pc2lfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ID4gIAkJc3RydWN0IG14Y19pc2lfcGlwZSAqcGlwZSA9ICZpc2ktPnBpcGVzW2ldOw0KPiA+
DQo+ID4gIAkJbXhjX2lzaV92aWRlb19zdXNwZW5kKHBpcGUpOw0KPiA+ICsJCW14Y19pc2lfbTJt
X3N1c3BlbmQocGlwZSk7DQo+ID4gIAl9DQo+IA0KPiBHaXZlbiB0aGF0IG9ubHkgdGhlIGZpcnN0
IHBpcGUgY2FuIGJlIHVzZWQgZm9yIE0yTSwgSSB3b3VsZCBtb3ZlIHRoZQ0KPiBteGNfaXNpX20y
bV9zdXNwZW5kKCkgY2FsbCBhZnRlciB0aGUgbG9vcCwgYW5kIHBhc3MgaXQgYSAmaXNpLT5tMm0g
YXJndW1lbnQuDQoNCltHLk5dIE9rLCB3aWxsIGFkZHJlc3MgaW4gbmV4dCB2ZXJzaW9uDQoNCj4g
DQo+ID4NCj4gPiAgCXJldHVybiBwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQoZGV2KTsgQEAgLTQw
MSw2ICs0MDIsMTMgQEANCj4gc3RhdGljDQo+ID4gaW50IG14Y19pc2lfcG1fcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikNCj4gPiAgCQkJICovDQo+ID4gIAkJCWVyciA9IHJldDsNCj4gPiAgCQl9
DQo+ID4gKw0KPiA+ICsJCXJldCA9IG14Y19pc2lfbTJtX3Jlc3VtZShwaXBlKTsNCj4gPiArCQlp
ZiAocmV0KSB7DQo+ID4gKwkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlc3VtZSBJU0kldSAo
JWQpIGZvciBtMm1cbiIsDQo+IGksDQo+ID4gKwkJCQlyZXQpOw0KPiA+ICsJCQllcnIgPSByZXQ7
DQo+ID4gKwkJfQ0KPiANCj4gU2FtZSBoZXJlLCB0aGF0IGNhbiBiZSBtb3ZlZCBhZnRlciB0aGUg
bG9vcC4NCj4gDQo+ID4gIAl9DQo+ID4NCj4gPiAgCXJldHVybiBlcnI7DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0K
PiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5o
DQo+ID4gaW5kZXggMjA2OTk1YmVkY2E0Li5iOTc5Yjc5YjU1MjUgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5o
DQo+ID4gQEAgLTM0Myw2ICszNDMsOCBAQCBpbnQgbXhjX2lzaV92aWRlb19idWZmZXJfcHJlcGFy
ZShzdHJ1Y3QNCj4gPiBteGNfaXNpX2RldiAqaXNpLCBzdHJ1Y3QgdmIyX2J1ZmZlciAqdmIyICAj
aWZkZWYNCj4gPiBDT05GSUdfVklERU9fSU1YOF9JU0lfTTJNICBpbnQgbXhjX2lzaV9tMm1fcmVn
aXN0ZXIoc3RydWN0DQo+IG14Y19pc2lfZGV2DQo+ID4gKmlzaSwgc3RydWN0IHY0bDJfZGV2aWNl
ICp2NGwyX2Rldik7ICBpbnQNCj4gPiBteGNfaXNpX20ybV91bnJlZ2lzdGVyKHN0cnVjdCBteGNf
aXNpX2RldiAqaXNpKTsNCj4gPiArdm9pZCBteGNfaXNpX20ybV9zdXNwZW5kKHN0cnVjdCBteGNf
aXNpX3BpcGUgKnBpcGUpOyBpbnQNCj4gPiArbXhjX2lzaV9tMm1fcmVzdW1lKHN0cnVjdCBteGNf
aXNpX3BpcGUgKnBpcGUpOw0KPiA+ICAjZWxzZQ0KPiA+ICBzdGF0aWMgaW5saW5lIGludCBteGNf
aXNpX20ybV9yZWdpc3RlcihzdHJ1Y3QgbXhjX2lzaV9kZXYgKmlzaSwNCj4gPiAgCQkJCSAgICAg
ICBzdHJ1Y3QgdjRsMl9kZXZpY2UgKnY0bDJfZGV2KSBAQCAtMzUzLDYNCj4gKzM1NSwxNSBAQCBz
dGF0aWMNCj4gPiBpbmxpbmUgaW50IG14Y19pc2lfbTJtX3VucmVnaXN0ZXIoc3RydWN0IG14Y19p
c2lfZGV2ICppc2kpICB7DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArc3Rh
dGljIGlubGluZSB2b2lkIG14Y19pc2lfbTJtX3N1c3BlbmQoc3RydWN0IG14Y19pc2lfcGlwZSAq
cGlwZSkgeyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIGludCBteGNfaXNpX20ybV9yZXN1
bWUoc3RydWN0IG14Y19pc2lfcGlwZSAqcGlwZSkgew0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiAgI2VuZGlmDQo+ID4NCj4gPiAgaW50IG14Y19pc2lfY2hhbm5lbF9hY3F1aXJlKHN0cnVj
dCBteGNfaXNpX3BpcGUgKnBpcGUsIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLW0ybS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1tMm0uYw0KPiA+IGluZGV4IDIyZTQ5ZDNhMTI4
Ny4uZmU5ZDg1MzM1YjZjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bnhwL2lteDgtaXNpL2lteDgtaXNpLW0ybS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktbTJtLmMNCj4gPiBAQCAtNzMyLDYgKzczMiw1NCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfZmlsZV9vcGVyYXRpb25zDQo+IG14Y19pc2lfbTJt
X2ZvcHMgPSB7DQo+ID4gIAkubW1hcAkJPSB2NGwyX20ybV9mb3BfbW1hcCwNCj4gPiAgfTsNCj4g
Pg0KPiA+ICsvKg0KPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiArLS0tLS0tLS0NCj4gPiArICogU3Vz
cGVuZCAmIHJlc3VtZQ0KPiA+ICsgKi8NCj4gPiArDQo+ID4gK3ZvaWQgbXhjX2lzaV9tMm1fc3Vz
cGVuZChzdHJ1Y3QgbXhjX2lzaV9waXBlICpwaXBlKSB7DQo+ID4gKwlzdHJ1Y3QgbXhjX2lzaV9t
Mm0gKm0ybSA9ICZwaXBlLT5pc2ktPm0ybTsNCj4gPiArCXN0cnVjdCBteGNfaXNpX20ybV9jdHgg
KmN0eCA9IG0ybS0+bGFzdF9jdHg7DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIENoZWNrIHBp
cGUgZm9yIElTSSBtZW1vcnkgdG8gbWVtb3J5IHNpbmNlIG9ubHkNCj4gPiArCSAqIGNoYW5uZWwg
MCBzdXBwb3J0IHRoaXMgZmVhdHVyZS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKG0ybS0+cGlwZSAh
PSBwaXBlIHx8IG0ybS0+dXNhZ2VfY291bnQgPT0gMCkNCj4gDQo+IElmIHdlIHBhc3MgdGhlIG14
Y19pc2lfbTJtIHBvaW50ZXIgdG8gdGhlIGZ1bmN0aW9uLCB5b3UgY2FuIGRyb3AgdGhlIGNvbW1l
bnQNCj4gYW5kIHRoZSBmaXJzdCBwYXJ0IG9mIHRoZSBjb25kaXRpb24uIFNhbWUgaW4gbXhjX2lz
aV9tMm1fcmVzdW1lKCkuDQoNCltHLk5dIE9rLCB3aWxsIGFkZHJlc3MgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwl2NGwyX20ybV9zdXNwZW5kKG0y
bS0+bTJtX2Rldik7DQo+ID4gKw0KPiA+ICsJaWYgKGN0eC0+Y2hhaW5lZCkNCj4gDQo+IFNob3Vs
ZG4ndCB5b3UgY2hlY2sgbTJtLT5jaGFpbmVkX2NvdW50IGluc3RlYWQgPyBTYW1lIGluDQo+IG14
Y19pc2lfbTJtX3Jlc3VtZSgpLg0KDQpbRy5OXSBBZ3JlZSB3aXRoIHlvdS4NCg0KPiANCj4gPiAr
CQlteGNfaXNpX2NoYW5uZWxfdW5jaGFpbihwaXBlKTsNCj4gPiArDQo+ID4gKwlteGNfaXNpX2No
YW5uZWxfZGlzYWJsZShwaXBlKTsNCj4gPiArCW14Y19pc2lfY2hhbm5lbF9wdXQocGlwZSk7DQo+
ID4gK30NCj4gPiArDQo+ID4gK2ludCBteGNfaXNpX20ybV9yZXN1bWUoc3RydWN0IG14Y19pc2lf
cGlwZSAqcGlwZSkgew0KPiA+ICsJc3RydWN0IG14Y19pc2lfbTJtICptMm0gPSAmcGlwZS0+aXNp
LT5tMm07DQo+ID4gKwlzdHJ1Y3QgbXhjX2lzaV9tMm1fY3R4ICpjdHggPSBtMm0tPmxhc3RfY3R4
Ow0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBDaGVjayBwaXBlIGZvciBJU0kgbWVtb3J5IHRv
IG1lbW9yeSBzaW5jZSBvbmx5DQo+ID4gKwkgKiBjaGFubmVsIDAgc3VwcG9ydCB0aGlzIGZlYXR1
cmUuDQo+ID4gKwkgKi8NCj4gPiArCWlmIChtMm0tPnBpcGUgIT0gcGlwZSB8fCBtMm0tPnVzYWdl
X2NvdW50ID09IDApDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJbXhjX2lzaV9jaGFu
bmVsX2dldChwaXBlKTsNCj4gPiArDQo+ID4gKwlpZiAoY3R4LT5jaGFpbmVkKQ0KPiA+ICsJCW14
Y19pc2lfY2hhbm5lbF9jaGFpbihwaXBlLCBmYWxzZSk7DQo+ID4gKw0KPiA+ICsJbTJtLT5sYXN0
X2N0eCA9IE5VTEw7DQo+ID4gKwl2NGwyX20ybV9yZXN1bWUobTJtLT5tMm1fZGV2KTsNCj4gPiAr
DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgLyogLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gPiAgICogUmVnaXN0cmF0aW9uDQo+ID4gICAqLw0KPiANCj4gLS0NCj4gUmVnYXJk
cywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

