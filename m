Return-Path: <linux-media+bounces-25713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F13CA2A558
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BF281880183
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114CC22CBCB;
	Thu,  6 Feb 2025 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="0RW4yL4k"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED4422A4D3;
	Thu,  6 Feb 2025 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835894; cv=fail; b=dtH7tbwPuRumQUqlG+pp4x79WzgnWWEjMO5t4vk33SiY3deY6jx4chlrEo/DgH2V/Vd6J49nscYC2HZUUrKcOmKexc32pWp4nNEJfl3LCxalmyAobN9VX39o+35Okz7qPYdOMFoz/17pkq8rGiLKaQEOMvqlj2DlTj7a6Ad0h+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835894; c=relaxed/simple;
	bh=tsW32CUEff+iCZjJbk1TipHaSJ3BYftG0XEPDuRsp3s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VPnPrzkhXpqEYlOPcbMka//K+YIPxfU6qSXnMITUC1WeeonljLwrsfXt3Q9lEaTrb2VtKOo6ZVfJZ26brTCeVaOYC5+eVRrI8KG2+2uSDAaUqdTuvF8UCbX+eX1cUaHD+o/TJI5QVRPpda6zN5T5MKiIt4jppxquFRKg6InnNNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=0RW4yL4k; arc=fail smtp.client-ip=40.107.22.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRltXd7LOJq/35GtFg00b/+au20vFNDIGSa4ADnQtuUk6F5MdhKaunI4nWq2219HUMInrWloBQKp+pSsV++mYYytXQGSc4670zZ+jcYMfEgvhqKuYNkABjl38fqYqMWGCS7lt81cq5zbyz5YHvYy+A26Vu+yMmOms0Ssmr2f3yOVJtycjXvbBDsQajH9F5wsBB3Afn0ykFIAhU+lqTnK8KOsBHHEyL13vJOH6PUjZYyaRskWoe4YZ3mIsVBO22mWFD+lxCZHheZ4rV9elEnk9XLNEOfNlVW8ewaq3lHqAWzYlnRLMciL2T6K6zDFidYtzlXgSMNkKXYL2Sq0NW96AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOsW4NHbm/jmbTHUNd+U6J50oBKQlQj5vcVbMI9m0f4=;
 b=uTKr1hWX2d6z0eTTt8GOVIl3B8GErIwHnRjQQe2d/wKOsIOreSk4QNgS54abZtDI/NiirJ0xrubAoejmu7dJXeT0vw0LzYyjC8cbYNxNcXkUpX0WtiL/iJHofSxtySglJNMrWbIJOdd7U//U6cwuQzW8+UC7pMJxaQRfX+ftxZZe86diwE4q1q46D3PF617O8iemCBD+/XtWWpUn3gIrvqr9R14igL+CkcdQxObQULNZ7byNxj8fAk0L5ejqYVNuQXQWsoHlUhl4+Ce3WAgzX65QyrPYqU0eLjfenNVe+Q+5Nkp7tkREQGgRsSne9lgmVvNWPRcno5cG9XWg5GKOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOsW4NHbm/jmbTHUNd+U6J50oBKQlQj5vcVbMI9m0f4=;
 b=0RW4yL4kr62Vt9QDEg4Tb+n4u+HlXQwx9Y48IEf7trFN9BrpuAyZC4ULgMj5QYcvc5m6wj1s3krOzIQTV5e3O6JgtSK5L7qIotIR01UwBoNgP9RNHyoxDGjEUTXNkGrH6AZbGaUCg76qX29A7z5W8ynUTQjNf6CIJOooSOY5Bgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9185.eurprd08.prod.outlook.com (2603:10a6:102:30d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 09:58:07 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:58:06 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Feb 2025 10:57:45 +0100
Subject: [PATCH v3 7/7] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-7-69d1f19e5c40@wolfvision.net>
References: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=1477;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=tsW32CUEff+iCZjJbk1TipHaSJ3BYftG0XEPDuRsp3s=;
 b=Oxg7Kv/ZAUs/qy89KwrZkE+3Hn9aFPcx37o121q0mXZbVnXMTxVIeW1wrlyAR52/B9yNEOWjZ
 2aPBXxsmaagC+Qo882p2jnmHcO/cvC4Zu4/i+l8Qw6GyRYrnwrycek2
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7f0ac1-39bf-4a51-09e1-08dd4694c0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1lIdXVrQjFIcW1yRWtzVUhmMTNHK08xbXhldUVtMDlXNThXZ1hOZHB5eDZE?=
 =?utf-8?B?Tm9sQnlBckdCYWhwTEJocHZPNjZVNDRybHdXaTNwUVNxMkkrMVdzdVNXU0t1?=
 =?utf-8?B?LzlwSDVPcUc2OWVrKys2MnJjZmllaGl4U0Z1RGpkdDhPSTk1eWRHRjBOeUFp?=
 =?utf-8?B?V3hNUnE0VEhhbG43V3hGbmNFaTltY0xXNnRvQS94NmtEMjYzYzgwRjcrVmNH?=
 =?utf-8?B?dVFSRGVwQUV3ZTFrdkpqZFpxMlFNYlZycU9lS1RGTXlNbllUeERWK1hteDVM?=
 =?utf-8?B?Vi9pWlUrVFZ5ekxXTHZwQ1FxNVRNRnNabVFQb1EzeVBPdU1MQ0JmM0tuc3BO?=
 =?utf-8?B?UnowSG9zRjY4SHVsWHJRalArekZraUNKWW8zK2NJeWNmMGRudEhrRGI2YXdq?=
 =?utf-8?B?MWlQNS9TQm5obVA2YXFVSG4yQzRPNVNsUkd0MTZTTFBKYjhxb1FSWWdGaU9X?=
 =?utf-8?B?ZDkwL1VTa1BscVhMbzVyTXA1aFhBOUh2L3FXdDJRTHVDTWZLd2poUGdVYTIx?=
 =?utf-8?B?d0VhS3hhbUdIQ1lmN1VBekVkZEN5aVRKRTJ3NXh0OFdkeWhkRE1RcTBHcnBF?=
 =?utf-8?B?VDBvOGh0NGdrMUVhdXRzN3ZRVWNiYzdtdUM1L3ArU3lmWE1aL1NIK2NUdTFN?=
 =?utf-8?B?OEtXcUVUUjVZREt2aTZwVlRjVDVURWFPSkhEM3o3SjZHTUhlQ0ZrV0ZISHFi?=
 =?utf-8?B?VEYzeC9ndlFtM21pRlVqdE5WeFUwSEJnTjZ1dTdZajVHZ2w2dUxaN1hETGJ5?=
 =?utf-8?B?dFRLN05pM2F4c05Gc1dvNkZLaFVCMnlkNGlzRktjVGo4eThueFBqTTQ2alVF?=
 =?utf-8?B?K1dWMmJ4ckpzRHBJSTllT1ozc05DVWdEaTcySEIrYWlyWDA3bmhURFY5NmVi?=
 =?utf-8?B?Z1BoaFY3L3p2K1VGWDdYeGRpWFNsS0ZoYnpNaWNKVWRvWDBZcVdPdGZZUnpV?=
 =?utf-8?B?K01UWndvUkVDUG9uNUV0YlFsVk1mMlFXOVBHZmJGZUxsMndESU8rU3ZUSXQw?=
 =?utf-8?B?OWNxOU83eHp3bzJ6d2RQNDJqNDlBeVFKUG11eENaNDh3dWNMSVFkVjZWcExx?=
 =?utf-8?B?OXRUOTZyZ0Jpc016WmkwNE9tVmlJdmxOdHZqeVk0b2UxR0svMzdFRW5vSkUx?=
 =?utf-8?B?aFluenozVWliU2QwYnV2c3lHaXd1dkFqSklMUWFkV0tsTmgzRE02R1JTMUF3?=
 =?utf-8?B?Q0xCZks1M3dTdUpzeWZ2SHhleXhtK3czSnQ1Und4NVRuYTJieXdJSmg4Y1pm?=
 =?utf-8?B?SVVxejJBZ0g5YzFrOWU1SEt0d01VaWVpd2NJK1JSSThGTjQ4dk5yc3BSRkNB?=
 =?utf-8?B?eGN5TkxUNjI1d2hVMDJrdmlSdHNWMHFkU2NEZUFwWk5CNDJVUGxJbG4xYTJC?=
 =?utf-8?B?ZXBWa1ZvVVRTWWNDTUJpdUg0a1VjNXV2T0cyMkRRdnVEMUxXTjNMbzdBc2dZ?=
 =?utf-8?B?V280T0FyTStWeUtQVmc4Z2NXM2s3bEZDTlI1TGNYMDZ6THc1U29jSUxGcXhB?=
 =?utf-8?B?aXZ1K1A3amJCVlZzMWYrNHhnMUJQWU8xSWhpN0VBeWNlKzM2K1J1U1U4TUpO?=
 =?utf-8?B?SFJpZk9hTS96cXc4SDJHd2tLY09qOE5nL1BMK1RsYThHWGt0RVBTSFd0MUZk?=
 =?utf-8?B?WEQyMWtCNTNJR2ZjdUpyYkZMOUgwUnZIUmhSQUE0bG12L3dxZ0pRQzdhSkVy?=
 =?utf-8?B?dU9nYzNmU1MrajkyY2ZvS3N3OERRb0xHVFFxbURHS0tpVUl3c2ZETjBheElh?=
 =?utf-8?B?U05RYzBXUGFaeEJTMDNtT05SWE1zZFpJK2FaVlpVUDkyNyt4Tmw0dlVuRERT?=
 =?utf-8?B?QVQ0Z0lacXVKNEFMWkxNQnJiWUlsWDd1TEZiQ1dvNTJPU1pGaTNJUWxvWExW?=
 =?utf-8?B?aFZoL0o1aGQ5NVN1QnR4KzZ6Y2pJQlpPQ3RaZW1zYllsWUhCL2tkekxpbitl?=
 =?utf-8?B?dE00a1VDNXBMU1h1b0VXVnh5cG9MamEyRmFXMUdCOU4xcGo2R2hCZHJLY0lj?=
 =?utf-8?B?cGF0YWNkeEVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0hGTVhpYXZEWVEvdkhzWW5EQnhkVnFSQmh6MkszZG16czdSK0FDbTE1cS93?=
 =?utf-8?B?YkpaYXR2MkxRRVZGZE1LcWVNT1VLTEd1TTZsd3NZS1gwR3VqeGZHUXlqc0dl?=
 =?utf-8?B?cUhlSDQwSlYrZlNDNHNEMWRaL1FpTjhmZXlXQnBqUCtySU0xNWg0elBUVEl1?=
 =?utf-8?B?T002MFU5aU1MUUU5eUZIMDFOdTlsN2hxYjdKbEtsanNSZGw3TDdFSEJYRzdv?=
 =?utf-8?B?a1lIR3JxcmFwd3ZKcjRLampzc1E4OFBhRXV0a3lBN2JWMkR5YTlJaThFNEcw?=
 =?utf-8?B?dXN5dm1sTG1WelNjUXZWK0Y2Z3lYa3hBY0lzanhIdG9BdzMzRGZQNGg5Vk9u?=
 =?utf-8?B?WEp0dytoN2htYkRBQW1uMEt0V1loZnhyUjZabXM0U2toYVFDZUFHVVRzV01w?=
 =?utf-8?B?Mlgxa2RHVzZSU0E4ZHRyODV4Uno0ZUNLNVJNVVYrRDVZNk5NN0JUenR4T2xD?=
 =?utf-8?B?NDV0bUh6SUszUXgzSVBKaTE5N3ZpMjA1NGJHeTcrN2FlbGVZSXBnK2xXRk4y?=
 =?utf-8?B?QTA0MHc5Wml5SlZwL3V3UVJIV2hRenUzbTVPck1xellaRHZGMC9NSnR4K2lG?=
 =?utf-8?B?Z1BPaHJ0ZElQUFczR2o3bHhBSEhEN3lkOE42dEJDUUdZeGhoUDBycWJlYUNh?=
 =?utf-8?B?WG44WXUxbHlZL29qQlJmVGtZSVliVnZtSHBBam1hOFBlZGI3cTNlS0poQi9o?=
 =?utf-8?B?bWRHZUpESElpU0ZQVGhQNDQ2V09FZVZVL2QrMURYdnE0cFNrek9BczJ1MFg3?=
 =?utf-8?B?ZmRuTnVKSkcwd2I3MzRXSmlaVTFlb05QK0RsNVVMbzBrOGtwTFBhcjBCWVc1?=
 =?utf-8?B?K0NVQ28vbGRCWDhib3dJZXYzcFI5Z3puZ29SSUtVME1qZ2krYXg5NXhaQVBM?=
 =?utf-8?B?L0dXelBINmxZTjVrNDNFYUFxQUtGODRHWldxNlZrQ1lmTCtXTHduU2JvbGhQ?=
 =?utf-8?B?WFZ5VHRMWEozeFFQdUhvYnJVWXByaFExQnRrRDJaOGdUelJYVm1qTjBuNHF6?=
 =?utf-8?B?YlRjT05rZXl0TmJvdXZFeTd5RmJNcUY0Z2dxbG5ySGsrL3Y5alRYeWJDNllp?=
 =?utf-8?B?OTVXWmNiTXpiaDBoR3FnVVBFd3NYWEkzQnlHUVl2aklJRGoyeHMvSkNEblpz?=
 =?utf-8?B?bWg3WHloblMzV2lpQVFncjhDYTBtS3lHOFkrYmVwd3B6L2ZZb2sxejFMK2Jr?=
 =?utf-8?B?NWhlRlZzaFJJVjVqbGQxQjhoc3M5MnZ4aWxCRitFTEQ4Z1JlOEdSbkZQOHJG?=
 =?utf-8?B?aHBURXZVQ0FMRmRxcFdudTVZRXY5dHdPZzQ5aExGbE1ZZWlCUlF4M0FkMUQ5?=
 =?utf-8?B?akI5SHFZL2g4dDhtRENUYnQ2UjAyZm9WOXlzcXdIci9QT1NFQ05aWWp5SUJM?=
 =?utf-8?B?RlJLQzlzV1RraXdZR2xPdlBPc05rY1Z6N05WeWdzbEpoMmZaRzY4dmRBSmNR?=
 =?utf-8?B?c2xRdkVKNFcwbldxZWdtMHNncnRNeTVsNWdPOHFWaU56MWZKbjV6dS9YVEV3?=
 =?utf-8?B?aHJhS3U5VGRTS2JuSXBQOGtBMGVMZmtsTU44eFJrNitHbDBoOEJ5dythVkVF?=
 =?utf-8?B?OU9NakFEQm9VSzJRa3daMVo4MTVwVHgwemtOd3FXblB2dURRN1g0blZvd28w?=
 =?utf-8?B?bzJGVWVzYzcrM2l4SHdVRG5uZHFrSXVoeFQ0YmYxTENaUlR1Q251anNPaWcv?=
 =?utf-8?B?WHNTYVJwc3MwS1FmL1RSTEdIWWRuS1B4a0VtZ0xmWTFjM2tiWWQ3V05WV2Vh?=
 =?utf-8?B?OTdqUnF1MHRBVEJLWGpheTIzY2lQNWxsdmIxT1p2TFFIS2lJSXN3VnVMNU1u?=
 =?utf-8?B?bkdQQmMyUWZlcTVJRUtEVmlGNUdaUndReE02R2FONHhQWlZpQjZBYWszRmc0?=
 =?utf-8?B?Q2VmWG8vZ3B5UUdoeTQ3M3JBb1RZaVY2OVpHZ2dvRkRCWGdYSEJ6Z0pYUTRC?=
 =?utf-8?B?T2dkNmU1bHgzc1BDbUlzaW81NHFIdjV1aUt3MmVmMERjSEphTlFHTTk0cUJD?=
 =?utf-8?B?MnMxVzFFQXBySEZHR3lkTDFGZ0NVbVZBT09FUy8rVkYxZmtMcVJHNjVoOVRH?=
 =?utf-8?B?UjNDSmI1NHg4OGpCS0FVVm9NdzI4a2twdHl0UUR5SzN1enpVb05BTlNNd05H?=
 =?utf-8?B?S0FNYmRnTm44TzZ3dlZhbEVWRXZiZHpHZFpnYkNRUEsyQ0lUemJvbU5LSEJE?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7f0ac1-39bf-4a51-09e1-08dd4694c0fe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:58:06.4500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrnI7kkBoQB4GpOnCaBWgQ8ubCw4vl7QBLZ6blDXCc3Oz0s709hMxfuo67TntK3ybXW2kmqO2GHXJPE960pZ+RKWCJf4hSg5GPnSh2BFHMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9185

The Digital Video Port (DVP) of the RK3568 VICAP is broken out to the
PF5 mainboard expansion header (16-bit variant). Enable it in the device
tree overlay for the WolfVision PF5 IO Expander board.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../rockchip/rk3568-wolfvision-pf5-io-expander.dtso  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
index 048933de2943..411b06b534f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/rk3568-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -134,3 +135,22 @@ &usb2phy0_host {
 	phy-supply = <&usb_host_vbus>;
 	status = "okay";
 };
+
+&vicap {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cif_clk &cif_dvp_clk &cif_dvp_bus16>;
+	rockchip,cif-clk-delaynum = <10>;
+	status = "okay";
+};
+
+&vicap_dvp {
+	vicap_dvp_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_BT656>;
+		bus-width = <16>;
+		pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+	};
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.34.1


