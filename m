Return-Path: <linux-media+bounces-23610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A59F5058
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F12165BCA
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF23C1F9F49;
	Tue, 17 Dec 2024 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="kit/GAUr"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023088.outbound.protection.outlook.com [52.101.67.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679F1F9EA4;
	Tue, 17 Dec 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450930; cv=fail; b=WrLxEim+YbK76c8P25S+lOTXd4eQrdRiZqYYA9INcUf/TIRIKmTd8IQUaT/19YymU/uFWOLauutIrxPO0a104PB2uUa+I6jovicwKOyo+9+cwXQ5IcrBAyENNt4VeXohz6YcMa0V8LdFNuIiaHugEu2gUPee+vArTRBmZpIQri0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450930; c=relaxed/simple;
	bh=Q1U+hCWMbDf1SN1Ix3Mqd0fx64Sd9o9Mjn+iKW7t8ys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ej0lZxN1KduEcFbXNKt1yIsQc/cF9OBUUb3O74AF2fbmzKvxBjOIJZ+xs3pdiy4yOcJG4+piIjN0a3eKvpzdqxpslWX9zFuGSMROLDOs/C43wFJcQaZq0GnhWEulHWRkXWz2wG9RX8CjnF2OOLvDFoY8YbEkA+kEQuieTUX5pqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=kit/GAUr; arc=fail smtp.client-ip=52.101.67.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1rYpOrGu2HsSEUgGDVMyvdhFy7vC7tjRAKgyzgYGvDJDLWy/6r1uVnu5R28Tkh2dcScGGAPdp7L/hNqoImbNOR6/56IqOnBIOv3OSbGq10SYBWkZbxUJprhZVl24prgqsdLjn9bZy0pWNwL70cL+5/MvSHmBQiDYJadJNy+lxN4TD5S4jMFma1f0cEucNltH/ZdB/ih7Wmy49vI6ZcK93OAQgS5sp7vAuz25rfTSFYK8AldR+5ZN5LCZDxH74qYQWtzJ9qktiSSGYIovvSLRuarMcFqgsQ7BqR7m4I5OPgtNKVTnhKWTq8XsKkZK3+C9jPdagrqBgErWeMXvEmNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VikGLePMQ9QRBVE4hbE7LcLpfXFlDftNktO4sp2LOLA=;
 b=vtpekwNjmCBM0YN+4ZeFEmbyIZlZEQ8HhoRD6NJr0WkIlv8uafxvm7ILq8HEC71Bqv1q6ebwkJUkOLODQuvTdi1p7O9EIldHry5+BY6d8lvmki+YxfpBp8pcdyC1cHfsOd6p0LVnZNge1KW3zEj9dVwfRKQj5el/l4EEh2DRUvBvnHjC6DEAG9jDB1KFonwaPJhRpdKIKQEdQMjkfVT6Y92EDcy54IKEBij2quQI7qRIECgB0mE6AR62tRjQneISzO8ET4+HYTPp5FTIOT1WJ7P1/TFTpuhR8q9NYeYEt7dZhqkx2VMuMoFjSTPeEZgzUZDHc7R6Nulkt8cDrT68Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VikGLePMQ9QRBVE4hbE7LcLpfXFlDftNktO4sp2LOLA=;
 b=kit/GAUr6BRsLg406UkmnuWmegfZG8wBaLAyr9TpYxJ4I/R6aHwXu/ynM7+xVgYG8dgGW8E4G07C4cpant3pIY5sSx0NA8Q6/0lC2cSKXOfHgTCwNPEPPnkes2mEo1pCWK1mMfsMb9RDPbnauI/NVcIsL5ktRzaDPEWDPFLmKTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10149.eurprd08.prod.outlook.com (2603:10a6:20b:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:55:23 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:55:23 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 17 Dec 2024 16:55:14 +0100
Subject: [PATCH v2 2/6] media: dt-bindings: media: add bindings for
 rockchip px30 vip
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v6-8-topic-rk3568-vicap-v2-2-b1d488fcc0d3@wolfvision.net>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734450919; l=4393;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=RmVu3SsH9qeLCvZmcE7bNMUYIKOSWsz4lkOu6z5dwzw=;
 b=JtswgMPckHBY4HJLJtx2TFMEoinGD9JpEGJOuzSHogcvQhAOEqlp52WZ1aKX5AyegFj6rbyag
 EXgIf+TsIqXArxEtDHkT2k9TLZdYFB0ybFwnzAAsTzu7lIxdXZbK/UF
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d6d35d-81ce-454c-1c85-08dd1eb33789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDJ2dFpjaGx0QWEwdHFBSy9YWFdVdS9XeUxjK1VKcHVXVW90Z1pmSElDQVlT?=
 =?utf-8?B?WWxTM3ZKcVdVYzVUcU5uTzdVRkZ6YU5aSlZLbFRXZHhOakdZVmRlSkJjcGxu?=
 =?utf-8?B?dmo2czN2NHVPS3J3OVJLblhjTGk0UUhLa0FvU1prRndGZkduS2FGa3dqRzQw?=
 =?utf-8?B?OEtzNUxSSGJDZWpyVHNOOVowdkNTZjlTUE4xczJoS3F3UnZ3TzdRODJjY25B?=
 =?utf-8?B?UWN0dlZqcVZ6azVaRjh3dDhRVThtT1JWUUdjdUMxVG12Z21wK0gxaTVxWFpB?=
 =?utf-8?B?VTRRNzVsRFh3THF2TmdJNnRZZHZFZjVqWkEwTDBwYW9hRmpIYWtDVld3NlB0?=
 =?utf-8?B?MWo0eUo2cTJvY2RmdFRkV1VRM3lZQWFZRGRsRnl6bmJERndUbnE4T3QwdGcr?=
 =?utf-8?B?QmJ0UEhqZGZvdUt0b2hMR3YvaVVUYnVNVHBwZGlCcGJCNmxjRU4xckJBdjhp?=
 =?utf-8?B?c2xPVFR6OUtPM01DSHhwaURJTVVQNnJEMUFsUTFKWTBCaVcybmhOeXdsSy85?=
 =?utf-8?B?THJBLzBYdmNDT3RPTkNtN0VNdW1SRUJMOUc1bXFyL3ErSTBaWjRzajlRbXhL?=
 =?utf-8?B?SHoyZlFEWDdrNGlPL1piTUhKRUxqNy9kNmpqNHhEZ0crMVRoVmJ1N1ZlbmNR?=
 =?utf-8?B?bTNUMDRTVDB4ZWkzelg5OWx5VEpwUzhaWnNXK0tHQkhUV09iZWZObDlyS3Yy?=
 =?utf-8?B?cVdhOFRFcGJBRnIwYm5OSm5EQmcvb0FyM2R4WFZqb2pKS3MzdnNSVFYyNWNI?=
 =?utf-8?B?c24xQjJvSWZCSUNkck5jUGdSTEFUbG5ZU2NRRmlZUUp3MjlXTGFYY00vVW5T?=
 =?utf-8?B?RVdhZ0NScWxBMVBINTZEbzg5cnR5VGhoemNiNEs0anhxL2lFaEtpd3FXM1JL?=
 =?utf-8?B?Wkk4K1VNc2pCa1lqY2tlUUs3T212UzBlbldjTFNNWU1wS3JSQTkwY0JUSDNj?=
 =?utf-8?B?WWtVQlVXTTJxZnJNODVhcDJETEFERTJxRVgwMkZmQnVkYUVBRGR5RkZiL2E1?=
 =?utf-8?B?V1k5TGVESnVIV0NwekdObFlTQTVyN3ZJdDBwSmR0ZTR6SktEVGFEWGVjc1l0?=
 =?utf-8?B?eExFOFBWWHZjdm03cHB3MmlLK25qbHl3ZU8xbyt6Z3ltZWtJUG40MGU0bW9H?=
 =?utf-8?B?eEFZVFVzTkdqei9uc09PWkVUUzl1RytlNyswYjY3OHk1allBUjVZUHIvVlAz?=
 =?utf-8?B?V21RdEJQc0Y3TGcxbmJRVTRPbmJlbVV1aHNNYVoyR1g4Z0xSMmtoUTYxL3Fx?=
 =?utf-8?B?YllhdjgyaXNoekFscHFiQllnYVh3Q2M3VEMxZXN6dlFRUTlsdDA0K3F0TU0z?=
 =?utf-8?B?VHVnVWR3aGtCVVNmM3Z5bUpvaTh4blFtd0dNYXlmaW5GaTZzV1JGQlNpRmY3?=
 =?utf-8?B?M1ExZm1pOW90MThFTEhkd01LeWFYckhEV2MyaEFNZXMwZnl4NlE2WUw5ZmdJ?=
 =?utf-8?B?MnpQbWltMHRGQ0dMMnE0Mk5TdjE0eFJDUmhaT0cyM0NVQUVzZHZNN2pvN3hD?=
 =?utf-8?B?eXE5bHdabEZaZTh0bWVZVHJDckFEZHJ4RlNYUlNzeE9mcmxuYXVQSzlRS3RB?=
 =?utf-8?B?azFGYTFNQTJwaGc3TkxEc2I0QlpQQVNIQUFOa2FQYmw3SUZldXVQMTV1ci9j?=
 =?utf-8?B?UGV6WFYrekJ3aDVQTTJtNVZVOUxRdVNwenY4SW1XSWRVN2FNQzUrZlo5WGpO?=
 =?utf-8?B?c3dvNmVPRjBCMVhSY0R2c1AybTRQYTgwTlUyV0pWS21yVjJpbGtiYWZmSWFk?=
 =?utf-8?B?SEdHRElvR2lZSjZOVk4vRGM5M1BiNk11VWQvbTRHZ1pNc1R3TG9SUDFtcktw?=
 =?utf-8?B?NUorbVpOQlpJSkFIdFptVWI2anVVNDNGaXFXcHlGVlRtM083U2hMNEJNUFRo?=
 =?utf-8?B?NnNPd1QwM2FSTE4zMm5XM1lZUHp2T2NiSC9iWGFScUZxTHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDNjSm9uS0Q5clE4OHd3SHRjTW1QL2JEZ2lTbzJrUDA1QVN6RXQ4NmQ5bGV0?=
 =?utf-8?B?SFQwVDBuOHdybS8yUDZPNk1MRFN2TFp0RVdxc3RITlVKVE95dnUxNWE2VEVl?=
 =?utf-8?B?dkQ5clBkbGsvNmV0Sk01K3BrelgwTzFQQndweW0vTjlHdTZEcnJRM0psYis2?=
 =?utf-8?B?OXp1QW5jdzRleEU2Qk5mVVhNcVJqVUpzQTBXR2xtb1A4VzE5elFsenBuQ1FU?=
 =?utf-8?B?UkptYnpXN2pTN3hLcmZwVzFvaEx0WSt6cmp4UDV5Z2xsQnVvYndDM1FHRVBj?=
 =?utf-8?B?ZmkzVElwekhFTjRGTm1MYXZMaTBtcDNQZzZ3QkpQN1FUN1FYSk8rRnpNOHd3?=
 =?utf-8?B?RXdxNjJhMFA2T1lwdlpQdUI3dy9RbHRHck5IemExZElVOTI2bUtFb0duRzZu?=
 =?utf-8?B?K0NqNTB2UHp5OFpkcWY2TEVnQUYwTjQ2WVZkNHB0dm1XVy9oMXJjQWhsZVkx?=
 =?utf-8?B?amE3dUhBQWRJZFc4VzJXWTJCVlcvK1d6TzVwNFd5cW51RHpjbzFmdUhJMHkz?=
 =?utf-8?B?bVdQTVNvdWhTU1k2NkhkNDZRQkVwWFhpS3ZIQ2FNMWhXbFFRMm5aUXp2OVFh?=
 =?utf-8?B?N1ZiUGJSZkwyUzV5UWdnZlJ3ZjNvUzI4Y2VNVVVTMjZpWjcwajZQMGlDQlRZ?=
 =?utf-8?B?cmhVQUZNbzU3SDJ3aTJzckdRdFN0a1hQS3RDeE5lTm5nMmJucDRXMVM2UE81?=
 =?utf-8?B?MjZNc0VxQmtHTHVZNTZPajdpaXBmUXNXQmFERStyNkFyVHVJdEc0dTIvV2dK?=
 =?utf-8?B?RjdDMTFNQjZab0ZVZzlTQk5LS3B0bDF1RnRsQyt0TDVqUmVxQW9WZkRDb0Vs?=
 =?utf-8?B?TWtrYklrRkJWelU3WHVVOWIyNXZuNjVLb0UySit4VjZpa3JtV3Rnb2pBcjV4?=
 =?utf-8?B?WnhuZTNJWCsxVG5HNXplSU5uanY1RXNDYlVsSzdGTWw0TGxrOThRWTlvV2ZH?=
 =?utf-8?B?UjFPeGd4dy9za214ekgvVS9iQThIQk54S1FqeHBDWURkNFN1TEUwMUdtV1Fr?=
 =?utf-8?B?K1hRYVVZdzM2VFNSaGdhQnR6YnRLbllsSWJUTldHSWR1Z2RGSXdCT1FqL0t3?=
 =?utf-8?B?V21aRFFPSHlZYUVubjJBdUxFR2V1V0x5R3czVFd6b2d2S09LSHdoczhKU3V6?=
 =?utf-8?B?ZS9PRHdaZDhTK1ZjSi82QTBhK0V6VkxlL3ZpcHR2UU1wY3BDVjcweSt6cTZP?=
 =?utf-8?B?ZW1VYlUyTnhaTjF0Rm9CeTZHRXY2QTJIdzRsZlFpUXNsanlodFFxaSt1OHVs?=
 =?utf-8?B?MXBUYWdQckhIeFB2d2h2aTdSRXVUY1htempBeEplNEhzbVBrOEphWXhkVlc5?=
 =?utf-8?B?ZTd1amlkNjNTVHQyWGdvWHZ2bWZPeTc3MlJrelVBMFVWU25rY0ovOUFMUms0?=
 =?utf-8?B?elNNOXpiV092TzZ3MUVCa29taXRpWXM5Z2RJMDdZOGNQUzNhZURIOHh6dWM1?=
 =?utf-8?B?Z3NnaWdVK3d0aEtIdDFuZ21aVVF6YmtkMmVTamFZNkptYVNSMU84eHBXS3Jq?=
 =?utf-8?B?ZzRRdTJEMWRKUEptZXA2R1N4ek44S2FNeEdJTGNQZXJXUGxxeW1MWjhmOGdR?=
 =?utf-8?B?UFB4ZStHTjJObFArK05CTGgrQ0E4bkZTc2phejZnVlVPNy9VZ2pFcGdEQWY1?=
 =?utf-8?B?aFlNTWVWYkVDQ2RRNndyVTRla0tXMnFxbGNnNEJGTWVBbUFZeXRyY0R5UFEv?=
 =?utf-8?B?RTFtVGUzY3puYUEyY3E0ci8zVEU2cFRubmtzT1Z6YitoREtSUzZ5UjZ3NXB6?=
 =?utf-8?B?aTN3WDlwZm50NUlNYXVLT0dySFIrcTQrK29WZDkrMmtCdnZXQ3lpbWtsdnA0?=
 =?utf-8?B?YnQ2NHRwdmcvOVhTeG1hSzlnelNkNnhiZnExWXYxbUZsYkpqaVJiODFJTWph?=
 =?utf-8?B?T29DcXpybUJmMnFRZlo3aXlMTGRxZXhWaE13N0Izdkx0bmRMSjZ5WGtuSmxJ?=
 =?utf-8?B?a3A4ZXRnQXMxQUc3anZhaEFKTkhsK3N0czI1cFg4b1dWak5pOFJmSVIxNVVM?=
 =?utf-8?B?UU0wZk1XYnNmdkxmNWZlZ292VlVHM0hXQWFya0ZPdzZyUzVtUThMb3ZFRGtm?=
 =?utf-8?B?alpEVGJmbjZGS0NvbWlyNUlRcW14YmdFWGZRMndRRS9HRTN3V256d2MyVlN1?=
 =?utf-8?B?MllSbDM0aGtpQTdCNzRvVEtGdHFMWEVXL3piaWRwTURKblRsODZZdEFhWklN?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d6d35d-81ce-454c-1c85-08dd1eb33789
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:55:23.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eba52Tf+ZKVbTy2HF2r+jwPGO4oHXxqwNWtt9VKJJZaK171pPZbIoddTDQqev5tm0KXyk0O1IjovfTfel2MD69cXuBVuA1FjcCivIyTbJBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10149

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add documentation for the Rockchip PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[revised description]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
new file mode 100644
index 000000000000..d34c0974204f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,px30-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip PX30 Video Input Processor (VIP)
+
+maintainers:
+  - Mehdi Djait <mehdi.djait@linux.intel.com>
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip PX30 Video Input Processor (VIP) receives the data from a camera
+  sensor or CCIR656 encoder and transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,px30-vip
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: PCLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: AXI
+      - description: AHB
+      - description: PCLK IN
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: pclkin
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port on the parallel interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-capture@ff490000 {
+            compatible = "rockchip,px30-vip";
+            reg = <0x0 0xff490000 0x0 0x200>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+            clock-names = "aclk", "hclk", "pclk";
+            power-domains = <&power PX30_PD_VI>;
+            resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+            reset-names = "axi", "ahb", "pclkin";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    cif_in: endpoint {
+                        remote-endpoint = <&tw9900_out>;
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..1138c8858bc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20217,6 +20217,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
 F:	drivers/net/can/rockchip/
 
+ROCKCHIP CIF DRIVER
+M:	Mehdi Djait <mehdi.djait@linux.intel.com>
+M:	Michael Riesch <michael.riesch@wolfvision.net>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org

-- 
2.34.1


