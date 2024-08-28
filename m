Return-Path: <linux-media+bounces-16975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0038961EEC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08BDAB235C3
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 05:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD24C155352;
	Wed, 28 Aug 2024 05:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lm/PSbjJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3271547DD;
	Wed, 28 Aug 2024 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824280; cv=fail; b=NvQ29QTH5FUPtcflHhYj+kchS97AbZuW2EV1M2QeebBe97ucrUVF/JWyX9DaD23nBy90yEh7sXKoClTHw3+slYXOqzunDyCTxuGPVSf5BcAwptNWZdJi3D6k6jJTFbDFoUGcSnlk2BHaiGehVOlTTHkHqqx/xKYxW2jrg6BXF5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824280; c=relaxed/simple;
	bh=Hkp72d8ICf2Qdc4pSGAmaFbi8EopEv7bWLJ7BdqhrR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sdfsTolsqWBogI/x+NyT1zYakMDyTx3ZN/LJnIaADnMnauncahVrKuS0BvtitgnBWQtlJiE1h2D6QiIJO9lOQFTfyGTJuerx2EFRLGwucYmqJIfR5hDut9U6yXibrmK6AxAt6+s0BZZPxFRaO9JouzcNGt9tOlB8wBaCZonKQYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lm/PSbjJ; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMdm55aQljWFq4dj/BgDJCXoj0cilZzFaeg4I5Qjd8ZMyzOLFBxDD7YUWNMUdMJJG5DGAUZhjrc4LT782+fWSfQ8EjsOgCdUJE3Sn30yBPv4PROSzA38prB8sNzeplMbsNEjHhYJBie0zkwMDkYylLDB81heAVN/GlcRzIcn8G2x7r86Cz1TZ+bU456Mnd9t9klZtOXwovkcsSnIyXi2aGyYi0bxNxEq9YsDenKOPJSGsB5YHvDd+EA052gRmXnX7c1urL1T8n6RmNKmAWav+Zm2zlplQk4GGc35q9FOIq9uu/O8TS5BLGWojUykFhS0+X9f7s+yllu52l8l5imPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hkp72d8ICf2Qdc4pSGAmaFbi8EopEv7bWLJ7BdqhrR4=;
 b=TmUd/WgHK7nRy7v1Wv4MbqBbDfwOzpa3SpFWK3lFPJnjpO1U+xEt7aMBRxSeAfguPHL7KPR1BGJghnCbFS/6Ie6IkV9AueJuj2G1Nt4hKVCl9lxVd4xPRIvMAYiCfv6oudXtjRHyHEgClKETo0Y62FAGXIJlk+k/j8NyofMFvNVbqgXew/H/AoRq5uD6kIKU2y0zNM9qVLxGyMfWSmj+1zr6+AMN2VAfVF4PMeRc2oA+M9W9PfG/TRnvoFtNEFgOeEZQV5qUY+BFd9d+YyhEsUjXP/YN3EW7fu8/xLp2ad/Qsb8RqPpLIAXdV9xDdPjCIjfIkM+tP+axsTPLYuzihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hkp72d8ICf2Qdc4pSGAmaFbi8EopEv7bWLJ7BdqhrR4=;
 b=lm/PSbjJlRcflOp8Iv2aQmwZVM6yDaDIhnmC1Ds8OLLpQXrOwGizfIkysY+YP8Sf7xO9yHOkCdwegXv+SdN51W6a0/ySlFuodJ0OLtOoGFSMR9oDMXev2LN7mhxWeNIllhef6Xco6OZ1tvnKxXuiUCIvsg5lTvEFfZQSjWafsfY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5580.jpnprd01.prod.outlook.com (2603:1096:404:8058::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 05:51:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:51:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Thread-Topic: [PATCH v2 2/2] media: staging: max96712: Add support for
 MAX96724
Thread-Index: AQHa+IPq3tvLp5OLs0mPHajoxQwHqbI8KfvA
Date: Wed, 28 Aug 2024 05:51:13 +0000
Message-ID:
 <TY3PR01MB113467917515DFADB5C62E37686952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5580:EE_
x-ms-office365-filtering-correlation-id: 461ccd27-07eb-473b-ae2e-08dcc7256d34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjRVemVveHk0aGZuaGhHcWw1VFdtUTRpeTJqeGdGeVZxemFlWDF4R1RkVVdq?=
 =?utf-8?B?UytvY2w5ODQ5WkZaNmloaERsS0JtckxocXJRc043bVNuM21sanVBWUhRc1Vn?=
 =?utf-8?B?YXVHY3FkU09scEZjejFLYjNxK1FNN08zNzhKaFYzTmF5ODgyS3p5ZFBtWlV4?=
 =?utf-8?B?OHpkeUdublFZVWgvQUhZNkVBcmdLbXhkRmJieVBSOEw1a3JaeWhWOWs4SVBN?=
 =?utf-8?B?ZG8vSEhvbCs3dGdLK0t5bVNMendzZ2hUZjQ4L2pObFl0N1NqU3pJVTJuNExX?=
 =?utf-8?B?Z2dId1cvTnJhRGRLa1Q3UGIrblMvMHI0UHd0Ym0vdUlTcVRUYVQybmo2WnJU?=
 =?utf-8?B?RDdrSUxSRURzZHFITWtpMVZHWHNpdlRUaVNMaWtRcmpIeWpCdW50WTFvZzZX?=
 =?utf-8?B?T1p0Q2hlM3hsUEtneDZtMytCMmt0ckpCYTJxVkgzZ0xVQ2xhNlVZV1dEKzZS?=
 =?utf-8?B?WDdsS3l0SXo5NTE4TjVGMTBuTXk4MnhpdGZrYzlvQktqdXAzZzZtTGRTM0pX?=
 =?utf-8?B?TTRRNVFlenFvSW5SWWZoOFo3eVdrdEtZMWJFdTh6cWxpWVZEY2FwN2RuZEg3?=
 =?utf-8?B?SjFHbUN2ZkhFVHlZaEhKRU9vNmhIZXVubmFXQW1qWldUcGRTTEt0NlNNWDVy?=
 =?utf-8?B?N0MyY01acks4RnhWNXlFNXBpRTNmUkpkcnZlczh4VTk3RWV1TkQ2MWpDdGt4?=
 =?utf-8?B?Umg2clZhcy91Z25JZUgzY1ExV1QvK3JIZ1NQUDVhZWJzcGZWQXE2RThKMFo3?=
 =?utf-8?B?WkdMUGwyTnVGNWlMc2VGaW5MU1cyZWVaVmFZcHhXUEx4SW56VElPTWJPK2Qy?=
 =?utf-8?B?R3Y0NE5FVXNTLzJrTmFZWjM0aEtlQi9DeHhOeGplVGxaeitiNTZWejZJbEw2?=
 =?utf-8?B?UGRrLzk4UGVCZlFGU2dNRCtraWdSOWpteWJXM1RNdmdQNmF6V21SZkU0VVha?=
 =?utf-8?B?Y3Y4WFJaaGEwWmVKblUwdmRoeTYzeno2WW9XVjd3MTJjL0ZrWTQzVEtTUFJo?=
 =?utf-8?B?TjQwMHpkSVNDUTA0RXAzQUp6YlpuZWJudVprVjNydjVrSFJuSGprazlmQXI3?=
 =?utf-8?B?WmZGeTlVOXp5Tk9ZR3lheGEwKzFMaWRGVmdLNUVDM1JFRERxQ0kxb0YrQVJl?=
 =?utf-8?B?eGcyVUN3Tit3TWoyS3BGeGhWNE9RYndHSk5PNnBOQkxYcUlrTjNFZHhCQnJm?=
 =?utf-8?B?anprRzVmTkJPMlBDVG5jSWVIN3JqSWNUVlkyZTFNaHB2Wk5ORzZOZWNGL1Z6?=
 =?utf-8?B?d1o0MnphRzg4dGRRdGhPOTcxSWpjYmt4Q3l2ZFZFaHR2SWlXNjFZMWNaeVk2?=
 =?utf-8?B?UEhNTVkzbEZ4cE9YWGhkY3J3K3dqTmlxT2s4UEdFa0RqcE84VmVTaUNoRnVw?=
 =?utf-8?B?am5GbWk0bVJ4eFZpNkVVai8vOWtINVZoYkVWemE3VGZwM1FBZUsvU2N5K0Zr?=
 =?utf-8?B?VHdYdTNGWXVKM1ZVNHVXM3c1YWtqem5qZmRGaG9DYldlYmloTmJZL1FXa3Qz?=
 =?utf-8?B?VjJjMW1kZmkzYkFJNG9aaW1PMk1VWmsrbU9rVG4rOGxnalU1Y2NlWUErbE9Z?=
 =?utf-8?B?NTdNNDNkN3ZhNFhYTzU5THRCdkxRVnV6cjl2WEpYS0ZJR3RvL0RpTUd3UVRi?=
 =?utf-8?B?cytFVVZUZ2J3dCtCV0E3Zm5LSzhITG0wcnY5ZmJPa2JoaitnSDM1LzBWcnpK?=
 =?utf-8?B?WkhKQ0ZVcGdtckdZM1VTbFRjYStsWFRYejZ2Qkwrb0k2SmxDbUJMek92QkJX?=
 =?utf-8?B?dzNMK1g5dnNkdmtGV29WOUZVNllYUU9Hd0J5WFJ1cWkvM0NUdlhkTFN0U1N4?=
 =?utf-8?B?RWU1TWRjejZGbFBIendydEordThHVGRhQzlYTlVLWFJxbnE5WmsvY1BhSnZM?=
 =?utf-8?B?cDZ3ZENKSU1UR3F4U28yWkpzdEtoazVFM0tEbkRRelQzK2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDdvYTRtNWJTSWdGb000QWJoRVdLNEhDTGdOYm5OMmpYcHVUZU5MOHJDUUgy?=
 =?utf-8?B?cVA0OWtzc3h0U0dpK0piRU8weVBaSDJzTEEwMStOL2J0SzdSby9TcEhSaERN?=
 =?utf-8?B?V0hGRmJzVjY2SzBucVRtU1VMSkVGUXRUNEM0UGNoYnhPZ2wwOXJzSjV4U2FO?=
 =?utf-8?B?bnpLbU9EdHpxVEZIYmY5YnY4QUVrTm9hVGMxRHNkMFVSbWlIQUpHQ1FVU093?=
 =?utf-8?B?QWJlZjZITW85QzQvYVYwU2gvTFg5d1lZc0tJeCtHZXFQZFJlNGtJSnpjRnFT?=
 =?utf-8?B?bHlreFhOQm5Hdyt2YUkyR0l0S0xoZFpPT0txSFc2UURxVVdyejBCR2hRVGtl?=
 =?utf-8?B?SGNNb0poQ0ZsVkQ3MXMxN3A5SmQxYzZhZW1TaE9icXF5MDZmYlVVV1RTRHMv?=
 =?utf-8?B?Z0Q5Rzl6TW9kWXd3SGdFN3V2bHFVYUE3dzdYUk8weVNLd01SZzA4RzZSM3A2?=
 =?utf-8?B?V1NlM2Raa1VQd1hHaWxIZXQwclUrSUZxTkJ5VWZZKzllNDFwSlRCSHJuUmxJ?=
 =?utf-8?B?SEg4TWxaL1lrRG1LU2FwU3dvRU5RTG93dTRZbXF2d0JlNGNPMU92UTZjRWFp?=
 =?utf-8?B?aFlDbGFodXdta01aVHZ6VnlhYjkyeWpBdG9NNWNaaFNoQW5hTGErWkNUdG4x?=
 =?utf-8?B?TzIzRGNpdU4wcWZWeHNHcmFBRUtTemhER3BDMnArcW9zaHlFMlVSaXJ2QnNC?=
 =?utf-8?B?cGpCTjRKVmErYVN1czAwYm0wNHcrckNaaytJbmdraFU3cDBuVXJ0K1pMSjJ6?=
 =?utf-8?B?WjA1c3JJbTRzS3VEaHk3aHorKy93cGtCRmRFM29BVzRGSzFHSStBQ3NTcTJD?=
 =?utf-8?B?eDcrSXNxMFVtWFp6a2FGUWdob1BieW5Ecnd5QXFSQVVqY0dPaXFKZC9UdHR4?=
 =?utf-8?B?dDl2YVJ6U0pyUUlyYWMzSk5nZXN3NGlMK1FsVGM4ellGZTEwZS81ckdXKzZZ?=
 =?utf-8?B?NDE0bW14S1M5NDZjSXRla3RIOUlKeER6Z3A0S0NnUGhhRXNGYUxsN1k0UFBr?=
 =?utf-8?B?QUFkUnI4TnUzU09RQ3ZlaHQreGYvYjgzY0MxMjNKMFF5M0ZKS2JMNU8yTjdB?=
 =?utf-8?B?L1Y2SGFDSVhBZXhpRllpU0xSaWMzVkJJVXUxRy9JQUFPd2JzY2ZUTmw2cnJP?=
 =?utf-8?B?TW9sK3YrcGVoY0o3bkl6R2lxT1AzVzg4YWxhNmJkd0hWNGlDdUtHRFltZmU5?=
 =?utf-8?B?SGswTkFBYmZnbnBYZHZSczlXNU90TGtPa1RJbmVnNnlMVllKZnVDY3MxSkdx?=
 =?utf-8?B?K1MvSlV4QzU0bzBXY3RrVU9ISDlJM3VLRFlEQS9hbk9WdXZlaENDWUFrdHhz?=
 =?utf-8?B?WElOdjNzTk1EblRWRHFSN1hjT1hYTDlMQmNYYWl1RUdkSENZc2w5bzhONGlZ?=
 =?utf-8?B?SDJKYm9YZ24yVllwYnV4d3ZMUG1aNm1NNUdJUUpLdmx1SU5zZXFISFd6Q2J5?=
 =?utf-8?B?bDJlSk9Eb0o4RGlwMnhCZG1ieXBKVzBZbFJMMlVhRlBlZUV3REhvdmhpZC8z?=
 =?utf-8?B?aEc3RUgrYzlvVkl5RWlVcTZmd1NuVlpZRlNjc0RMbTVtQkcrc241M0Nsb0dQ?=
 =?utf-8?B?MkdvMTJtTFhiNWYxb2FPcFlObEhHaFY4SE5uT0JTOVZaVzFTMlNmUWx1Sm9L?=
 =?utf-8?B?eUF0bzdIWFFYT0JLUktBSkpCZlc3ekpWd0l4RlZtVE5mb1RHRjcvTDg5RnA0?=
 =?utf-8?B?WUJjTEdwdGEvd1hadUtIVVZadGZxTXp2MHFXVmJGOUtRZlUyd0s2TDdGdkoy?=
 =?utf-8?B?L2JoWDFaQzdlaC9qSDBvQnVMK2FBNHlaeVRQWEF3TGZDejlOWjZJOFNhMFRP?=
 =?utf-8?B?ZVBsektjZDB4SndPdkxTd0Q4QjVQaGpMSFM1c1FKQ0thVTNNdDF3NFhpM3dQ?=
 =?utf-8?B?YWZHSGlMTTUzSmpYbFZjMUhVbFdIUzU4b1JYVE9USWZFbzZIeVdFc3FPeUJt?=
 =?utf-8?B?bVJhUWwzZThvdmVhMTVIY0F5a2l6UjMxZlcvOXJzMUZiR2QvcU1nay9SREg3?=
 =?utf-8?B?WWhWdHBUUlM1TkpiRElCdFlDWmh2bWNVdDZ5akxpK1M5ZTdPU3pOWVNVQXpB?=
 =?utf-8?B?dWlBS0xuQXNFYTIyUGw2S0g3OTNrVnJhaytreWo5Ty9Rd0w5MU9TWlJjbElS?=
 =?utf-8?B?MUpHTGE3NUhKY05HOCtPMjBBL0dVU2JKejQrd0RZcGd5MlBYbGRoU2VHQXRh?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461ccd27-07eb-473b-ae2e-08dcc7256d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:51:13.9255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ya1rknJrgfwjs4rv8JcYdOwHc9zTs0zJq+6uNkHlpFcm0GZ4quyG8uQgw5NCdtthplxyAa7ddRmnwEUfYkUhWdSyuiZKTLKayypn1bbjRLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5580

SGkgTmlrbGFzLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3Jl
bmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMjQgMjox
OSBQTQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi8yXSBtZWRpYTogc3RhZ2luZzogbWF4OTY3MTI6
IEFkZCBzdXBwb3J0IGZvciBNQVg5NjcyNA0KPiANCj4gVGhlIE1BWDk2NzI0IGlzIGFsbW9zdCBp
ZGVudGljYWwgdG8gdGhlIE1BWDk2NzEyIGFuZCBjYW4gYmUgc3VwcG9ydGVkIGJ5IHRoZSBzYW1l
IGRyaXZlciwgYWRkIHN1cHBvcnQNCj4gZm9yIGl0Lg0KPiANCj4gRm9yIHRoZSBzdGFnaW5nIGRy
aXZlciB3aGljaCBvbmx5IHN1cHBvcnRzIHBhdHRlciBnZW5lcmF0aW9uIHRoZSBiaWcgZGlmZmVy
ZW5jZSBpcyB0aGF0IHRoZSBkYXRhc2hlZXQNCj4gKHJldiA0KSBmb3IgTUFYOTY3MjQgZG8gbm90
IGRlc2NyaWJlIHRoZSBERUJVR19FWFRSQSByZWdpc3Rlciwgd2hpY2ggaXMgYXQgb2Zmc2V0IDB4
MDAwOSBvbiBNQVg5NjcxMi4NCj4gSXQncyBub3QgY2xlYXIgaWYgdGhpcyByZWdpc3RlciBpcyBy
ZW1vdmVkIG9yIG1vdmVkIHRvIGEgZGlmZmVyZW50IG9mZnNldC4NCj4gV2hhdCBpcyBrbm93biBp
cyB3cml0aW5nIHRvIHJlZ2lzdGVyIDB4MDAwOSBoYXZlIG5vIGVmZmVjdCBvbiBNQVg5NjcyNC4N
Cj4gDQo+IFRoaXMgbWFrZXMgaXQgaW1wb3NzaWJsZSB0byBpbmNyZWFzZSB0aGUgdGVzdCBwYXR0
ZXJuIGNsb2NrIGZyZXF1ZW5jeSBmcm9tIDI1IE1IeiB0byA3NU1oeiBvbg0KPiBNQVg5NjcyNC4g
VG8gYmUgYWJsZSB0byBnZXQgYSBzdGFibGUgdGVzdCBwYXR0ZXJuIHRoZSBEUExMIGZyZXF1ZW5j
eSBoYXZlIHRvIGJlIGluY3JlYXNlIGluc3RlYWQgdG8NCj4gY29tcGVuc2F0ZSBmb3IgdGhpcy4g
VGhlIGZyZXF1ZW5jeSBzZWxlY3RlZCBpcyBmb3VuZCBieSBleHBlcmltZW50YXRpb24gYXMgdGhl
IE1BWDk2NzI0IGRhdGFzaGVldCBpcw0KPiBtdWNoIHNwYXJzZXIgdGhlbiB3aGF0J3MgYXZhaWxh
YmxlIGZvciBNQVg5NjcxMi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pa2xhcyBTw7ZkZXJsdW5k
IDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiAtLS0NCj4gKiBDaGFu
Z2VzIHNpbmNlIHYxDQo+IC0gR3JvdXAgaW4gc2VyaWVzIHRvZ2V0aGVyIHdpdGggYmluZGluZy4N
Cj4gLS0tDQo+ICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWF4OTY3MTIvbWF4OTY3MTIuYyB8IDI2
ICsrKysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
bWVkaWEvbWF4OTY3MTIvbWF4OTY3MTIuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tYXg5Njcx
Mi9tYXg5NjcxMi5jDQo+IGluZGV4IDZiZGJjY2JlZTA1YS4uNmJkMDIyNzZjNDEzIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWF4OTY3MTIvbWF4OTY3MTIuYw0KPiArKysg
Yi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWF4OTY3MTIvbWF4OTY3MTIuYw0KPiBAQCAtMTcsOCAr
MTcsMTAgQEANCj4gICNpbmNsdWRlIDxtZWRpYS92NGwyLXN1YmRldi5oPg0KPiANCj4gICNkZWZp
bmUgTUFYOTY3MTJfSUQgMHgyMA0KPiArI2RlZmluZSBNQVg5NjcyNF9JRCAweEE3DQoNClRoaXMg
c2hvdWxkIGFsc28gZ28gaW4gZGV2aWNlIGRhdGEsIGZvciBkZXZpY2UgZGlmZmVyZW5jZXMuDQoN
Cj4gDQo+ICAjZGVmaW5lIE1BWDk2NzEyX0RQTExfRlJFUSAxMDAwDQo+ICsjZGVmaW5lIE1BWDk2
NzI0X0RQTExfRlJFUSAxMjAwDQoNClRoaXMgc2hvdWxkIGFsc28gZ28gaW4gZGV2aWNlIGRhdGEs
IGZvciBkZXZpY2UgZGlmZmVyZW5jZXMuDQoNCj4gDQo+ICBlbnVtIG1heDk2NzEyX3BhdHRlcm4g
ew0KPiAgCU1BWDk2NzEyX1BBVFRFUk5fQ0hFQ0tFUkJPQVJEID0gMCwNCj4gQEAgLTMxLDYgKzMz
LDcgQEAgc3RydWN0IG1heDk2NzEyX3ByaXYgew0KPiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9k
X3B3ZG47DQo+IA0KPiAgCWJvb2wgY3BoeTsNCj4gKwlib29sIG1heDk2NzI0Ow0KDQpZb3Ugc2hv
dWxkIGRyb3AgdGhpcyBhbmQgYWRkIGEgc2luZ2xlIGJpdCBjYXBhYmlsaXR5IGRldmljZSB2YXJp
YWJsZSBpbiBkZXZpY2UgZGF0YS4NCg0KPiAgCXN0cnVjdCB2NGwyX21idXNfY29uZmlnX21pcGlf
Y3NpMiBtaXBpOw0KPiANCj4gIAlzdHJ1Y3QgdjRsMl9zdWJkZXYgc2Q7DQo+IEBAIC0xMjAsNiAr
MTIzLDcgQEAgc3RhdGljIHZvaWQgbWF4OTY3MTJfbWlwaV9lbmFibGUoc3RydWN0IG1heDk2NzEy
X3ByaXYgKnByaXYsIGJvb2wgZW5hYmxlKQ0KPiANCj4gIHN0YXRpYyB2b2lkIG1heDk2NzEyX21p
cGlfY29uZmlndXJlKHN0cnVjdCBtYXg5NjcxMl9wcml2ICpwcml2KSAgew0KPiArCXVuc2lnbmVk
IGludCBkcGxsX2ZyZXE7DQo+ICAJdW5zaWduZWQgaW50IGk7DQo+ICAJdTggcGh5NSA9IDA7DQo+
IA0KPiBAQCAtMTUyLDEwICsxNTYsMTEgQEAgc3RhdGljIHZvaWQgbWF4OTY3MTJfbWlwaV9jb25m
aWd1cmUoc3RydWN0IG1heDk2NzEyX3ByaXYgKnByaXYpDQo+ICAJbWF4OTY3MTJfd3JpdGUocHJp
diwgMHg4YTUsIHBoeTUpOw0KPiANCj4gIAkvKiBTZXQgbGluayBmcmVxdWVuY3kgZm9yIFBIWTAg
YW5kIFBIWTEuICovDQo+ICsJZHBsbF9mcmVxID0gcHJpdi0+bWF4OTY3MjQgPyBNQVg5NjcyNF9E
UExMX0ZSRVEgOiBNQVg5NjcxMl9EUExMX0ZSRVE7DQoNClRoaXMgc2hvdWxkIGJlIGRldmljZSBk
YXRhIGFzc2lnbm1lbnQuDQoNCj4gIAltYXg5NjcxMl91cGRhdGVfYml0cyhwcml2LCAweDQxNSwg
MHgzZiwNCj4gLQkJCSAgICAgKChNQVg5NjcxMl9EUExMX0ZSRVEgLyAxMDApICYgMHgxZikgfCBC
SVQoNSkpOw0KPiArCQkJICAgICAoKGRwbGxfZnJlcSAvIDEwMCkgJiAweDFmKSB8IEJJVCg1KSk7
DQo+ICAJbWF4OTY3MTJfdXBkYXRlX2JpdHMocHJpdiwgMHg0MTgsIDB4M2YsDQo+IC0JCQkgICAg
ICgoTUFYOTY3MTJfRFBMTF9GUkVRIC8gMTAwKSAmIDB4MWYpIHwgQklUKDUpKTsNCj4gKwkJCSAg
ICAgKChkcGxsX2ZyZXEgLyAxMDApICYgMHgxZikgfCBCSVQoNSkpOw0KPiANCj4gIAkvKiBFbmFi
bGUgUEhZMCBhbmQgUEhZMSAqLw0KPiAgCW1heDk2NzEyX3VwZGF0ZV9iaXRzKHByaXYsIDB4OGEy
LCAweGYwLCAweDMwKTsgQEAgLTE4MSw3ICsxODYsOCBAQCBzdGF0aWMgdm9pZA0KPiBtYXg5Njcx
Ml9wYXR0ZXJuX2VuYWJsZShzdHJ1Y3QgbWF4OTY3MTJfcHJpdiAqcHJpdiwgYm9vbCBlbmFibGUp
DQo+ICAJfQ0KPiANCj4gIAkvKiBQQ0xLIDc1TUh6LiAqLw0KPiAtCW1heDk2NzEyX3dyaXRlKHBy
aXYsIDB4MDAwOSwgMHgwMSk7DQo+ICsJaWYgKCFwcml2LT5tYXg5NjcyNCkNCg0KVGhpcyBzaG91
bGQgYmUgZGV2aWNlIGNhcGFiaWxpdHkgdmFyaWFibGUgY2hlY2suDQoNCj4gKwkJbWF4OTY3MTJf
d3JpdGUocHJpdiwgMHgwMDA5LCAweDAxKTsNCj4gDQo+ICAJLyogQ29uZmlndXJlIFZpZGVvIFRp
bWluZyBHZW5lcmF0b3IgZm9yIDE5MjB4MTA4MCBAIDMwIGZwcy4gKi8NCj4gIAltYXg5NjcxMl93
cml0ZV9idWxrX3ZhbHVlKHByaXYsIDB4MTA1MiwgMCwgMyk7IEBAIC0zMDMsNiArMzA5LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdA0KPiB2NGwyX2N0cmxfb3BzIG1heDk2NzEyX2N0cmxfb3BzID0g
ew0KPiANCj4gIHN0YXRpYyBpbnQgbWF4OTY3MTJfdjRsMl9yZWdpc3RlcihzdHJ1Y3QgbWF4OTY3
MTJfcHJpdiAqcHJpdikgIHsNCj4gKwl1bnNpZ25lZCBpbnQgZHBsbF9mcmVxOw0KPiAgCWxvbmcg
cGl4ZWxfcmF0ZTsNCj4gIAlpbnQgcmV0Ow0KPiANCj4gQEAgLTMxNyw3ICszMjQsOCBAQCBzdGF0
aWMgaW50IG1heDk2NzEyX3Y0bDJfcmVnaXN0ZXIoc3RydWN0IG1heDk2NzEyX3ByaXYgKnByaXYp
DQo+ICAJICogVE9ETzogT25jZSBWNEwyX0NJRF9MSU5LX0ZSRVEgaXMgY2hhbmdlZCBmcm9tIGEg
bWVudSBjb250cm9sIHRvIGFuDQo+ICAJICogSU5UNjQgY29udHJvbCBpdCBzaG91bGQgYmUgdXNl
ZCBoZXJlIGluc3RlYWQgb2YgVjRMMl9DSURfUElYRUxfUkFURS4NCj4gIAkgKi8NCj4gLQlwaXhl
bF9yYXRlID0gTUFYOTY3MTJfRFBMTF9GUkVRIC8gcHJpdi0+bWlwaS5udW1fZGF0YV9sYW5lcyAq
IDEwMDAwMDA7DQo+ICsJZHBsbF9mcmVxID0gcHJpdi0+bWF4OTY3MjQgPyBNQVg5NjcyNF9EUExM
X0ZSRVEgOiBNQVg5NjcxMl9EUExMX0ZSRVE7DQo+ICsJcGl4ZWxfcmF0ZSA9IGRwbGxfZnJlcSAv
IHByaXYtPm1pcGkubnVtX2RhdGFfbGFuZXMgKiAxMDAwMDAwOw0KPiAgCXY0bDJfY3RybF9uZXdf
c3RkKCZwcml2LT5jdHJsX2hhbmRsZXIsIE5VTEwsIFY0TDJfQ0lEX1BJWEVMX1JBVEUsDQo+ICAJ
CQkgIHBpeGVsX3JhdGUsIHBpeGVsX3JhdGUsIDEsIHBpeGVsX3JhdGUpOw0KPiANCj4gQEAgLTQz
OCw4ICs0NDYsMTUgQEAgc3RhdGljIGludCBtYXg5NjcxMl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50KQ0KPiAgCWlmIChwcml2LT5ncGlvZF9wd2RuKQ0KPiAgCQl1c2xlZXBfcmFuZ2Uo
NDAwMCwgNTAwMCk7DQo+IA0KPiAtCWlmIChtYXg5NjcxMl9yZWFkKHByaXYsIDB4NGEpICE9IE1B
WDk2NzEyX0lEKQ0KDQpJRCBnb3QgZnJvbSBkZXZpY2VfbWF0Y2hfZGF0YSBzaG91bGQgYmUgY29t
cGFyZWQgd2l0aCB0aGlzIElEIGFuZA0KSWYgdGhlcmUgaXMgYSBtaXNtYXRjaCwgeW91IHNob3Vs
ZCB0aHJvdyBlcnJvci4NCg0KPiArCXN3aXRjaCAobWF4OTY3MTJfcmVhZChwcml2LCAweDRhKSkg
ew0KPiArCWNhc2UgTUFYOTY3MTJfSUQ6DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgTUFYOTY3MjRf
SUQ6DQo+ICsJCXByaXYtPm1heDk2NzI0ID0gdHJ1ZTsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVs
dDoNCj4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+ICsJfQ0KPiANCj4gIAltYXg5NjcxMl9yZXNldChw
cml2KTsNCj4gDQo+IEBAIC00NjMsNiArNDc4LDcgQEAgc3RhdGljIHZvaWQgbWF4OTY3MTJfcmVt
b3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbWF4OTY3MTJfb2ZfdGFibGVbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxl
ID0gIm1heGltLG1heDk2NzEyIiB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAibWF4aW0sbWF4OTY3
MjQiIH0sDQo+ICAJeyAvKiBzZW50aW5lbCAqLyB9LA0KDQpEcm9wIGNvbW1hIGluIHNlcGFyYXRl
IHBhdGNoLg0KDQoNCkNoZWVycywNCkJpanUNCg0KPiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIG1heDk2NzEyX29mX3RhYmxlKTsNCj4gLS0NCj4gMi40Ni4wDQo+IA0KDQo=

