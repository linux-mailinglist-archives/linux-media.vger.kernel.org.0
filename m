Return-Path: <linux-media+bounces-27772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119BA551FE
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7DD188AB9F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B6D25A626;
	Thu,  6 Mar 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="y38OO01G"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022121.outbound.protection.outlook.com [52.101.71.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D126AA94;
	Thu,  6 Mar 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280193; cv=fail; b=J8RjVThyqAfyR48nOQI9LyQe/oUieuX4Xno/1jH0TWMvuAX8+fnuva8v5cGACGN1HLMKqyW08NTz0RaiX0SWylwrYATVvYx4MafkZO27PYjgpgKIF7QTg9ZlaRAReLPg5A8ufonxpeW/3h8keNyl25V+1y3NYbZz65YLyTjXOGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280193; c=relaxed/simple;
	bh=XAUyQebd/kIeP60s7a8uULFfE6nUdjkkCSmsYkQbEPk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eBiz2d2i+ReeM5s+uxVn0Meb/u6e1S9sObH0s+7yimoo2EEGq8hXjHa5eLIie0GARIVSHEPDaLKa+TlbaZ39O5EmXWyNI06GhetfApRvHSVaz3TCa3o3Pcpn0b68Lrohnv8h4ya0v8e4vNqSfwrmRArh0L7xQlfzg8XnTiediV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=y38OO01G; arc=fail smtp.client-ip=52.101.71.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XblleRz6uE9ZB5vCPza5G3Ea04V6GDNkp0Mt+AXRuXYojDsLVcVHQfmH0+2IBH1oGKl8fJuZDUtQ0SiP3djCzUCfOozTJyXRMMcUCQDNNokuODa1zvLmqrS8qQ/isxwUICEQ6HFtycxpeI6S5n+YZXt6nXmrllyfQ3wif1jV0Uw5SQAd9eqAFsKZ4lRu8KskZrr+65kTTc9mBY30HttEVo/f435g4YTLoNXFH7IgXruID8+8sSrCSBToUdLbqmBeFOh3bW2HsmOI6lSm6z/BQOaoB3TgQ3mNIZ0pTltylZvSz+2OLzFc+02w0Akw0IZ2nJDMQG/szICBgJw+O9Fqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iu/nfn49C5pEXaXCCGrNWax4dy7On7ZTpZLW1KudVGI=;
 b=KfnB7ZpLiQs9rkTNTkWB+xZRL7ok+IoEBPMz0ARFPQyD9r2LIXX6/X75LG3/YMl0y8mEN7Rwf9OPePvLq0yODxEoRZxSfbvXmp3Np0fd5hhvaaDXOeAd3qI8zFAu2v0wrOmK7Txt56MnWaREsoxyAP8sOuAuoVFyMyisIupuRZa3K6qiVwBRZYKuIFhJP60T4GCabyUHsodwhiX0fWa4gNIy11vBWe0ApLqchGhOtGnRJmn7R3yeWsczG/nAvV+bYUwKbPLib0OWTWpgnfw3B1veM8ewfOk7rv0/iYmL4ZMnv7+Enp6sCgrjTubpos5RSEZu32ynyXjy78dvaB/NlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu/nfn49C5pEXaXCCGrNWax4dy7On7ZTpZLW1KudVGI=;
 b=y38OO01Gnp/9w91O6Pe/VW/Z2vSwCDOWhWqpE7NgPFRGS9AUOXEw7RCFZzTk4s9TSrV8G2Tj1y/NRB67WKkJUjN2yJq99JgOyjTDaeuNQSOe7tU88YWp/vy+AulaMlDjg4tP4XFyAj5/tDfjbEgbrZ6vQV9tWzAxFEEqO7lekqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:21 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:21 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:09 +0100
Subject: [PATCH v5 08/11] arm64: dts: rockchip: add the vip node to px30
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-8-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=1271;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=B4x8zY3KX5X9wBT8dC0eI+dkSq+U/fBGBr32XMjj84I=;
 b=ylkfuJFMpz3vlDCa/VQOJYcF8EDq1Yjt0dBBsGsJb0IcCwkxn7eCIGA0/AVusw0fXjg2e1LEW
 LrxMEAMvjJzC6zlov0SJBsWb9fTE0BT6GoY5fAL2tj7SiOPpyWkTDJa
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: a1be7819-cf96-4efd-ee0a-08dd5ccfd280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjA3eS9HUTFIUW14M1E3Q3JURkpLdzNmdURqVk1kaTU2RnAvLzNCRU9XTzZt?=
 =?utf-8?B?eDRaWWh3d1Zkb3Fua1dCTlNReHp1YVcydjQ4S1llWncvQzA0K1UvOGp4ekhO?=
 =?utf-8?B?cExNTUUveVJsN3lUYk9uaEpPSzhYZkxJWUVJSmpOakFsblZnQXlLMUg0alFX?=
 =?utf-8?B?YzBvUGs1NXp2T0wwcDRtc3ZqTmZJSVJZM0ZXQTJlSWxodkE0TlRwK1JtY1RV?=
 =?utf-8?B?bGhqVVNhU2d0T05Sb0tHSUxnSkY3cU56WFUzdDhqcytiY2hMT3p3VXRWUEg0?=
 =?utf-8?B?MkcvQXVpNFNxOXFmMEt2SjZidXRaOVluS3VpT0JsTFlXcGZib2d1MGU3RWtq?=
 =?utf-8?B?dzZoSVY0L2UvbFpWTGl0d0VwRWg0M29vcW1yWEJuSXBRSndaeUFValhFM0Nw?=
 =?utf-8?B?OE9HdGR1QytQWmZWNWxvN2N0VWJEcWcvV2dvakpOUzN5aHJkSWVTSWFzWElT?=
 =?utf-8?B?RFlBL2U0OVlQVldjVTlLZjYwSjFWYjF4U1dNWUJKQWhJbVlBbHgyMkZKOVc5?=
 =?utf-8?B?RVR4WjVFUjk2VHVBZEZmQXBQcU1MWDExSTJNekxoNUQrNERvTmFzZVJ6NWla?=
 =?utf-8?B?ZVNMaEh1ZnZWdCtxdjNUQmFaS1gzbXRFQXFmbkVVL01tWnZoTllOWXNnM1Nk?=
 =?utf-8?B?b1YzdkdKbll1dFhVNmpvWXJaT21KL2d4R2dDcllTOFllcXdMd3FWWWdxMnll?=
 =?utf-8?B?RmtpYytva3NlLzAxZDVhS0FEb3lsc3ZsOTB0Wk55OHJGOEpaWWZNUWFkbmZw?=
 =?utf-8?B?QmVXYU5LeHZhMjI2SXh6a3VBUzJoK2hlbXFXMW9HR2JET2FPend5RG5MQklR?=
 =?utf-8?B?RDVUcW0rTllUdlBDRnZjQnkyVnFlaGhRczBhenRoSkd3RGpmZzhKdndhL0Vw?=
 =?utf-8?B?UmIyUitNQ1plcHltYmpGdjBnMTNtVTBDZ0xzRjNsenk5VTluZFRwTjhrQXRa?=
 =?utf-8?B?WVVzN0g0eno2TzBHaVNhUGh1b3hrbFVUb3E5WGpzS3RDREplbFowcmkydSto?=
 =?utf-8?B?Vkl4YTI5dERWSlZXNFY4WkJvWEJOcUJFczlzMGwwcmgzd2VtRnFRY2J4YUh1?=
 =?utf-8?B?cFlUT0QxWGhwWFpUbW5lNmpOdXltZWI3NjdYRlJheDNKRUMvZFBBM21WR2Rn?=
 =?utf-8?B?VlRXV09HSDIzK1hKd1RqUGpHbVJ1YmRIN2tubjdGSkt1NEpMZ0NzSGlTWWZS?=
 =?utf-8?B?TVhoMnhnR05vVUhrdkNLa09VOGtGZDRGTjVPdDdMTktjSWRyd0F4NjlhblA5?=
 =?utf-8?B?YUFCaVR3cnJvN200TkJlajloUUVVaGJOWk43ZEVQWHZFS1R6d0puNFNmNGxW?=
 =?utf-8?B?UDdqekIxY0Y5SXBWU3piaXlrRWpqY0tBa1M4K292eUtpaXhUeTMzbENEa1BG?=
 =?utf-8?B?QjZFVXdpbjZxRkgrclNFUkJ6WkZwMk9mT0FCSzJtREMvNGJ3VWNqdEZtRVFW?=
 =?utf-8?B?OGZGZElHQndVeU85cmVrZGdMQ2NnSjhiRWFZaHhneW1nazlBMVkzemdiS2ox?=
 =?utf-8?B?c3E3VnQ1QXMrQUtrMDBhdmdHTSsvQUZtM3RJNEdKUFExMldLZ1JiR0prYmRv?=
 =?utf-8?B?clNzZVdqcHg4QlZraHR1SVY1djJxaTJSUG5pTGZBNzJTRCtpVFJqOHMzVm0z?=
 =?utf-8?B?dkhmdzN4ajB4UWFwRHNNWnd1NUppV1hod1NvR25lS3FuNUdKWnk2Z2lOUUpD?=
 =?utf-8?B?MkhXajBxNWNvRXVmS3FZV3l4OVVhMlByUzBmckc3NmgwTHdZdi9YV1YxaUZO?=
 =?utf-8?B?NGxIV3RVMjd3VEY2WlR4Y0NyVFhqMDdyamlXSmRhQTZLYm54R3FVd1lOWkdy?=
 =?utf-8?B?eFRFcmxnY3pySElYbXBkT3FDbkU4dU11UUw0bFFOUGZsSVBoWWJLdEk2TFR6?=
 =?utf-8?B?ZjIwWE9XS3o2VHBpTWIwV1FYdFBPOU9aWmN0Q29henVlWUlnNzBURGl3cGMw?=
 =?utf-8?B?dXBEU0lHUFM0b0l5MmJTbXlPa2pDVTEwTTBGOFBVUThTSzhwZkRjZGRXVU1W?=
 =?utf-8?B?NDBocEYrM1FRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmlTbG45K0h5blN6SzlrWSt2RTQvZzIrbUhLYXBGOUZSVm5RY3JuaEhYMUZi?=
 =?utf-8?B?YnhIMXRVOHc2K0JTay9ieVFzMEZzMytkc1dlNWcxYUxWcnlFczNGV1drK1RB?=
 =?utf-8?B?RkFxVzhRMnYzeVRWb1F3ZXhwalZvQ29HKzl0VzM0K0lpUjF3ZXZ5Z0krOThx?=
 =?utf-8?B?ODdrdmJRQ0JWdjh1dFpBMEsra0pJM2g1T3EwWWo1NlU1TmtZakNIaEpMWkw5?=
 =?utf-8?B?SldNS1hRdlFwK1E2ZHIyOFJ5aENXTWwyZ1NIS3Y4dGZGdktTS2VNTTd5YXcz?=
 =?utf-8?B?ZXlXYkZNUmYxNXVpbGQwYmJkZkFNTUZKV2pPUDdUMzN0aFVURllCdUE3ZWc0?=
 =?utf-8?B?UGlOWW1rMHBNZTNRSWdlZ01CcElYMXZmUjduU0FQQUc0QkFDNllJTytickxu?=
 =?utf-8?B?a2xPRzE5ckZrODJyNXZqbFcrYTlkMk5FSGhiQTJMOXlWQkI1dkdJcjJpVmsz?=
 =?utf-8?B?WGp4SXJPM0FoZUErV0dRMnMyU1ZxajdCOWcyRWRFb0duYURvc1l3eHE2Nmlk?=
 =?utf-8?B?YWtUSm9uVVVuSThKTW5qdCtwckxpUVlxRm9tcGdWdDFDaUJUZVVDejZjKzNK?=
 =?utf-8?B?UVBVWVpyL2RQSDlrTXV5RkQvN3ZkaThBbytQUC9VbTVGM29ONHBVV0VVL1ZK?=
 =?utf-8?B?N3FycTZPU2U3N21ZUWh4L3dMdUQ0T1pqMzJ2L3h2OTd0dmt3ejBFZkljaHVL?=
 =?utf-8?B?YlpYeXVzb09yZDJwNW1rWkIyWmtmUnc1WUZxSTNmeThZYWJKNGtHZ2VNRElP?=
 =?utf-8?B?UXQ1Wm9vVTY0b2VjbkVEYnIrdEVVYWcwMmU4b2xQQmJ5QnY3aWN3YyszekY3?=
 =?utf-8?B?SGQ3eU9oTFNqWGthZXIrYnB2M2lSYWRWMnFBMVNqYlNZenZEU3FoSGRvWXBs?=
 =?utf-8?B?emtDdWZjKzYxbmZMSjQwbm1zaDFKa25XL1NqUmRSck9RNUJ6eXFjS3hWMnV3?=
 =?utf-8?B?T3ArNFhsVnQwWFRsT3hQUFZVQTNiV1phbGJwcVRhWXQxQVpkWWU3TlNHMzZ6?=
 =?utf-8?B?TjNBNkw3SzBqVC9MTCs3SkFpcFlGbkJiUjFiZmZwK3dHMDJ4TUtmeGFMYU5k?=
 =?utf-8?B?dDVWeDVicHhuaDlFdU9FU2R3aDhRSStjMTY0Wm5ZSlFHQzJGV1RMS1MrRHVR?=
 =?utf-8?B?NjFrcXUwSklqWjRaRFhIeWgwNG5JSEtCWE5SRDNyQm4zYmNXTGRxMUxDUnd0?=
 =?utf-8?B?UUJKUEZjSnFaVVFrTG9iTVR0SUpLdkl2ZXBHcThnY2hoNnhFOFVLcjV2Ym5P?=
 =?utf-8?B?MVhrMXFFYWdRL29HcmlBSnNDYk1NRkhnY2xjRkVvZ0xyNVVQS1dSQ3BULzQ0?=
 =?utf-8?B?UVNGRHVnSWxMakdZM1RGY1F0Mmc3N0QvREFwVFBXM2dCOE1pWDA4b25BVmRD?=
 =?utf-8?B?K0pZQjBtVE4wWVFUMnRTMnArOXplbnBFRWtKYURBOVlRV0daNkdSWWEycjRV?=
 =?utf-8?B?eTFieHRUclhuVkxIcjFBNytOVlhDVUtMTUR3R1NRMHNuVEpVVldwODdmNHUz?=
 =?utf-8?B?Vms3anBLNDNzTHNsUW4zTlYxZzgrRVBJN09tRDZTQkI5cmpMS2ZhNjc4YVpy?=
 =?utf-8?B?ZGh1VC9pQXlQYkRnQ1NrUmR3STJnd0dSZ0VKUE9KZEFzRmFBVk05aUFWRzhP?=
 =?utf-8?B?YU5vV1V2aTdWWE04SHZuVlVQQWlDTFlTd1V0RXU3MExvV1lNdjg3UWJVem90?=
 =?utf-8?B?b2pqZnlmNURXZU1pVDJYRjN3UTVIbXhWWlhIT01RYnRmdWN5YlpVUGVnRFph?=
 =?utf-8?B?WlVRcjFuUXgrTnU1MkpWVzJuTWlVVnZBNUtIRW15RURoeEk3cXhuVWlzdS9x?=
 =?utf-8?B?TjFHZkprSHJ0eEFxWlVoNjZGT00rQzVTVGswUjBuemEzdFFJTUU1ck10U2tI?=
 =?utf-8?B?czA0Y0pqUm4zUlB6azBqMFRuaXZSQkRkUUM3d09xN3hMVFl6aFAzT2p3T2Mr?=
 =?utf-8?B?dFE4d3RxSG5wWDhhRWYyWnhjZG45WXNCRmRVYURielpxWkxvLzRUTGhIRkJo?=
 =?utf-8?B?TkxNZ3ZqU2dsY1JxSXM0S3VPR3BOWTZKSStEYjBrOGE4OXFVT0VIbG44dGxN?=
 =?utf-8?B?KzZSZXJVOVhNa1lUYWJKajI3bk85UzYwQXpZUXcyeWtlYlNHZUdObWhHTFk1?=
 =?utf-8?B?elpIZ3I4dHdnbnQ2c2ozWENyWU13cm1UeHE0TWdxYnVxRDhWb3FORExGb1RH?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1be7819-cf96-4efd-ee0a-08dd5ccfd280
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:21.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnVGyKcvv9jBgMclvq4r4qKsgdsqFgDVMQOI2QmsJKgcaEoCrYZF8JbpTv6MTFiloTEIYj4Z3emCj4U/NWywaZVPyh5zNCyFEUQWQ/s4g1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..c2acf5952d08 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1282,6 +1282,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.34.1


