Return-Path: <linux-media+bounces-27768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79BA551F3
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE505188AB1C
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA62C2566D5;
	Thu,  6 Mar 2025 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="G8e2aNIn"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023113.outbound.protection.outlook.com [52.101.67.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D9F25B69E;
	Thu,  6 Mar 2025 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280185; cv=fail; b=P6cWH++/DwaukeymIC1zPX88kdAZ2nXZv8PM+hOh1IFiAtkDyrijI++Q+u+Lt3eQ9fBmz8qXRsqHwl6PUPrfr0vsCg59T8u0Fm02IRy+FkZ0soXmuuXbfKYWTuY7yJGI1TvweStxu7Bb64qmIjgemMXdy6mxLMb/5Dt8QFIXciM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280185; c=relaxed/simple;
	bh=NYEdDn7MSlbM1x9+oead7EcbRCt3+IouSl50tSCLiVk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a97b94MlXd0EEmYk+NCZknx6doSUFqpqIkpI8iMgJtvhBcTC0VeBK45+ahi/8O4lckZTJuHlFWtuqWWLMaUjVgu00Ojd8S+r1NzaT78NDQZXeJCi8cEcnDohC9+mHFI57X01PcyGdA8b9H7UKNU/7JFmAS3GpWdWwUPdnQ3x9Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=G8e2aNIn; arc=fail smtp.client-ip=52.101.67.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jgc0R/D8rHlZgzLuNaTD/6RW0/JQtXFNfU6dSD1QRTHO6OUjfHI/W+oRghIgFJzR+1m0ouPQPBpqcPm3nFxa0kF+lxXGN3dxd0Q6m8mltw/f+O7VYQ0M2NvOp9PUP5VJHuvH4xGc3WVUO00u5BvGZNtArqItUuk2Kqf8hqQswAJh8m01CQVE4SSaG8e2DnJ7LyTRmqSJkphkG7L8K1LQaIer8g7rt4/zMiIdcK6wBSwKoEzKL0duw7SKDUr1C6OpG/GYKY8m8iaE2SAXX5+fEf+2W93tgsRykAZFd2BnVbkre9X5iC+sphF0SIjUpL1GKR0IWuGYw+JxDUrPMj9vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfzU0DZ3M586X2EBrNTxXcUUxN/vzrNewqHzavc5yD8=;
 b=An8pAYbktB3BfefgfmZ8xnUGix3TwUfPjovQh8eWpyXEldVbPQ7OvxL8ZHj+I7d/Eu1+J7K/o/4WZ7ogKoslG9V2qqrlmbwEWZmTcAp5BQTvatWGasWT2ix8UR4KPdO7YJ+Sb2JXvxeggHWNQdqmDSQan1qnuxGKAO8KMYk8Wz51RDc9kKexHQw4oBNuIjHEILpnSP3h0mim5IF6RDggSENeuMS+OM8uBgVb/xZzOudEscXj1tu1piKhNKpV5MRPwT/5h2bebrQtkDtxd8LflPYO7SgQ6xOkQWXlFJ8nIZtRW6y6iOy1WIIEAprDqGzxb2xppCv7myir36nJbBzPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfzU0DZ3M586X2EBrNTxXcUUxN/vzrNewqHzavc5yD8=;
 b=G8e2aNIn/VrLsuUI/vfGxgpDmraCGdkZALkipQe2U8ztx4N0pSW8hPZxTDVHr4heWpl5e98U/i5awIjNdRQut6fSInRr2J9oJZPOB85hkjv4Kw0KZoyD714tUO/sv7sBtTY1qjk9wscGxfv2Zy+Cx7O/ogeB+SLpoJhOFy1uZm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:14 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:14 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:04 +0100
Subject: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=5948;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=NYEdDn7MSlbM1x9+oead7EcbRCt3+IouSl50tSCLiVk=;
 b=m9Aklamni94d6XW0b46+4hExbVTgC+FtROpYYLexRBi3TxbnaUPgav6LDxfKFVekPMs/mkWFO
 8hRrJUxHSYlCz6IPdZz73nldFyHhBH4hB1Ju7eGShldaYjFyf8Ln0gp
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
X-MS-Office365-Filtering-Correlation-Id: bc4e1920-5c73-4a67-2ba9-08dd5ccfcdb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajFxM1BXVXUyRkhjVkRXbnVHUE42RjVDdWdMUE9ZOGwrQzgzT09hYjgzY1V0?=
 =?utf-8?B?ZVkrK0FKcndQZmFqVzFUY3YwVlA5Zk82dDM2NDFWZUNNdmNhWFNVQk5EOGlZ?=
 =?utf-8?B?RjNOWWlWRlpMQU1hWERucXFhMmlXNGJNV1V5dm12OXBkcVhsSkZwTWE4VDNU?=
 =?utf-8?B?aEJ6R3h4M0UvMGRoZHlEMUdmMzNPczdhcWZVdU1nYlRVYklOVzBRd01XQkdu?=
 =?utf-8?B?aGpraG9za0JpRlYwK25lYTdqOVR2STJZYUE2MXI4a2RldnlSOVZ1ZzI2aGww?=
 =?utf-8?B?ZDNUSmlqRHZRNDVGVkZ1TXF0UVZ5N1pYbXRLQi9xcHcxdkdwMFBEWUExQm9s?=
 =?utf-8?B?ZFZhYkd3WE56RVAzME9SZGVNeFduWlY1T2VJZi9KRU5STUUxZXFxYjlNYnpm?=
 =?utf-8?B?cGU4RzJvbmtyLytVSXFKZG9JdEdCVzFFWWFncHNlcVBXQXdGWDY2MFFhTmoz?=
 =?utf-8?B?VzN0ajN6TVhwb3plTDFQZGNBSmNZdFN5Zy9sd0d0Vml0TGJoenM1TWpydmlj?=
 =?utf-8?B?SXkvdTlGdmoxenVId0ZvSHRUTWxOSm4xOC9RWkVJZnNqcW5PQlNSSzY3Tk8x?=
 =?utf-8?B?TWp6ZjB1My9melRyeUJvYzhPZEJoVVJ3bWtFYktxMHpiMEw0Mk1ENzFFbmh4?=
 =?utf-8?B?TElZNlJwSzQrU3dQVGp1blRwenUxemtObjY4UDkzcnhTTjRPQW1EcEZ5U1or?=
 =?utf-8?B?Y1c3Vm5sdEhHKy9haUIxZHZ0b3AzUTA5ZXdwY1ovaGhNVlFnc3lOcVJId1FL?=
 =?utf-8?B?Y1BsRC9EL29JOUhRYXNFa1hUcEYxMUNFK2o1QXZLR1ljRkJDLzBjdksydjFm?=
 =?utf-8?B?UWVqZ1psWkJFODZtSFBqMk9GekFRTWRNSWZmQndZKzBzbVp4eklSc0liVEU2?=
 =?utf-8?B?NUUrRGFwNmF5cFJzaDE0aXpEN2xwYXEvU0dSTy9oN205SjMyKzNxUHU0OFVk?=
 =?utf-8?B?K3pzQ3RvM01vRERERUNzUEY3S2hmMVpaZ1dJckxLM0xpR1VweXdQTlI1endW?=
 =?utf-8?B?YVgvN3RJV2tCQkV6V1NPQVlSejNWMk1SZWlqLzJicWNOYk9CejZsMHFTWm5a?=
 =?utf-8?B?cEhBUG9yNSs3TWk5WVR1a3UyV0YvTllKSGNXMUpsQXNWVWo3dWFyNjk3aUl4?=
 =?utf-8?B?ZmFZZWtjdHY2UHh6aTFZTWREb0grYk5LZ0x1eU00R0xUYmdXWlQ1U2RHVEdZ?=
 =?utf-8?B?SmNRWWNFRDlmd0JVekIxN0FEanZBam12VjBuYU1TVUNLV25BRTd2aFd3aWJH?=
 =?utf-8?B?OUhRU3F5b1lPRHU4bjBVU2x0VkVYWUM0dEdKU2ZCY3MvbkFRdFNlVzBBalRl?=
 =?utf-8?B?c2JCcTRaVUM0dkdEek5PUk9EK0g1c0tmb1JUOXN2VGtOejMwRHkxb0VoVHBo?=
 =?utf-8?B?WnZDWVlvaWN1WUNPZXpSWkZsZllnZ3d5MlFSaENteWtzUWZOUmhiNGFkaDhn?=
 =?utf-8?B?aEtVamtPS0lIY2JDNS9UKzc5L0p2VzNRRkdteG1qUVJ4T1BXS2lqNlhaWFlq?=
 =?utf-8?B?c2ZMYVlFcGNCeGZLTDd2VUx3TTN6UzF3UHRsVVl4MklKYW50TW9WYlBSbzFr?=
 =?utf-8?B?ODQ4SnVRWEZEbjFtZUVlTFJIeCtkemkvbzltdy9NYWZhN1l0SEpFSER6ci8r?=
 =?utf-8?B?Y3RuN0ZpSFBaTmFXQkFQK2dYMkNISytwUUpKbW1yNGhaRjZTSVppMHo5NWpD?=
 =?utf-8?B?MG8vcDlUbzhrZUd4Vk40YXBTVWk4ZUFHSlVVOTZXY2RRSCtlU3JRZ3dDNkVw?=
 =?utf-8?B?dXI2WTZSNUJaSEpVVjdGSElMRnNWMXpTaytaMC83UVYxeVZwRndNaXlsQnR6?=
 =?utf-8?B?Nzl2ZGovZDVPV3ZvMDBmNENFMmlGanhENzFpNHpXSnBwSmc3WkovMmxGenF4?=
 =?utf-8?B?b3lma2VKV1BSRlBoTE0xR1NJTnQwQzEvNnUzOHpLeEw4MUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTk3OHQwUG1RbHZwdlBacFo1QjF1TlB5SGJNKzhKMTJlN0wxMXljUE01TlIz?=
 =?utf-8?B?Tm5RcWZPeWM2UTNrSVZHajQvM25CWDFsamxueElRZ1BLVkVSMGxNa1RYU0NJ?=
 =?utf-8?B?NGJwZnhOMUdEMlhVSkY5K0VqVDVwV0N5bW9QSkRsRUxtTm5BK093M3A5MzBE?=
 =?utf-8?B?c2dzYVpId3l2K1NsYktqc3FoTERRbEtJSnNJZUhtQ0ZZdkNpSy9ENW9WVm1T?=
 =?utf-8?B?OXhyUlVQVUNSSExQaUlUTDVHM2xleFhlNnlLbXU3T2FJc1Q4YWZPQ04wMmhU?=
 =?utf-8?B?VENhdFJ2TDJmTXMwc2J2TElDelpZYnhNVHljL1Y1QnkvRHNaclYyQkloYWRK?=
 =?utf-8?B?aWlNZUZNMjZpbEtHVHdGVVVvVWgrQkY3R1VFenQvSm1GRkEvOTJvNUJ5cWtm?=
 =?utf-8?B?ZHh0VWQ5MXRweWluR2pibGRmUi9uTFQxeGhQWXJ0UGtwamRFc2Z3Zk9kR0Vm?=
 =?utf-8?B?Unp5RnU5UExsTnhCZEFZelB4ME95RTR0dUEyeXh4WFBXM3pQZ29jVzRsTmhs?=
 =?utf-8?B?RVRReHhueUI5Z1Z5QkNVY1hHVHhLZDRQalMyZnlNcXg3QU9OQ0pNUEVNVmVx?=
 =?utf-8?B?RDVnbkV1L3M5QXN6eUFMRGkwUmJJMGRaY2MzUkdFeEFvZFZmakczU29HOXNQ?=
 =?utf-8?B?OHlIM1ZoSDlCNGhyb1VNOTFERjAzK0ZVeXRsRUg1UzFBTldIS2NINm83UjJS?=
 =?utf-8?B?K3FZckhNS3pFRmxLcDdqakpiYi9IOHB3Y1haWm1wd0NjVWJnem5hZS8vVThx?=
 =?utf-8?B?WlZVcmtuTzRKSDRWNzBaamVWSTBrY0NzNHptWlhWc2czM3ZCTTQvd2VmY0Qx?=
 =?utf-8?B?M3pKRnhaV083Ulk1dmNJOUVGN0UwTTlkVC9VRDVVb1lZRGVoWUp5Zy80WjN4?=
 =?utf-8?B?dE5TUEptNGlZKzJzUGEyaDJreXJRQXh0bW85RkZ5ZUh1RmlRZGxXMENOamcy?=
 =?utf-8?B?UklJRlVPNGJCKzhWK0FzT2daNVpQRlVIUGxjT0xNT3ZaaVMvbG5PTnpKVVEw?=
 =?utf-8?B?c09XVTh3aFA2aFllYWRWWk5HS2VFbUNSV0VQN3RwYTAwd1BJeW1EL0NvcVF1?=
 =?utf-8?B?cE5vVjJKTWZoQ2JSNEMvTHBrSkx2WG5YaU1UMnhwbExRemVGZDM0ZFhjWDJD?=
 =?utf-8?B?NWdSd0NsWUNhU2Fwd296YjFtODlvbjNob1hGQWxvQTRJYkV1c2dhMFhrd05W?=
 =?utf-8?B?V3Nhc0krQkFLRHNyZm9pTjVORmtrUXdiT2pzWmJSM0c2cXhRMVhsMWxTTGlp?=
 =?utf-8?B?dUEyN0VVbis5RHRtOWhoOG9HME1SNzIyZEV5MmZVb3BVZW0wb1Y4YW5jN2Vy?=
 =?utf-8?B?eDl4b2MxblBBRVJtVXU0WWR0dGIwMVp3eU0xcGJ1WXVyeFBhWVE1SHNGTm96?=
 =?utf-8?B?eUNtVDUrVlJZSE1lRG1OQWJxUnoxMndXdUkvMlp0NnZNamdESE1jQWVYQ2lN?=
 =?utf-8?B?ZTdoUDlJNURDQk5EdGsxeXdmYUM2OFAraVNZQnVXSnM2VkVxWmhiOWViQUN1?=
 =?utf-8?B?T0cwRUtGVGJTbTBUcDRsWGxqK0hvaiszT0FUaUVucU9kMFJaNkk5NTgvcDlT?=
 =?utf-8?B?dmE1VTVPWDNkdGJsZVJCMXV5bHBhdDdKU01tL2o0Njl0S3FYN3AxbEFZS0kw?=
 =?utf-8?B?VC9TemxjaTIvWlVoSDBwS0hHSWFyOVVobm8rZXdjZUFPMk5QWnFlQnlsZXIv?=
 =?utf-8?B?UlJGeTlxbDFUUkVSdUtZS0NrcEcxYWNzak5vWVd0cUQ0Q3I1NEEyVEdiZGE2?=
 =?utf-8?B?S1QrbjljVTFVNE9zZnMwaUM4ZEhQalJjRktCYktGNzZHdlpSTDJ6TERDZ2dn?=
 =?utf-8?B?WEhVL2tEb01rQ2hiSXo5YUtQV0NqVWdzVnJPSy8zUDg1WHM4TzBPV1M1WVBr?=
 =?utf-8?B?OGpIMEp2UzNBbnVzTkhRQUxrUDh0L0ZObVFDS1paOWNhZHVOalB3cWlMRm9V?=
 =?utf-8?B?T0RXektLSjBwUXNaRFlBcUFsQnVnY2FkY1ZnU3MyeTd4WjBBY1RZQy9UeDdj?=
 =?utf-8?B?ZjUyNVRsZFVONWgwZlhxaGpoajlVZSs4ajBPRitDa1VQN3Jjc0txOXFxVU1M?=
 =?utf-8?B?OCtyTXp0S1J5cTkyRmdwcnRqYnFTUFlKS1pYTVF0RFVFV3k1UzdJcXhudU9U?=
 =?utf-8?B?dnV6SmViTWExWHFXQWJjSFJxRnBGQWNGT296VHB5UXJza3lKVERVRCtFZzI1?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4e1920-5c73-4a67-2ba9-08dd5ccfcdb5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:13.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AGpNBYakg8+Wde2fK0zAIQFYT/aPh2yZBj3a3k+esfYejSlxtMm5Bl5gTuNL0Brf7J7d1jodQvfUszJLx3puycXdMY26TAf2h7S7md0qCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
new file mode 100644
index 000000000000..0e61f02a9508
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Video Capture (VICAP)
+
+maintainers:
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
+  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
+  the data from camera sensors, video decoders, or other companion ICs and
+  transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-vicap
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
+      - description: DCLK
+      - description: ICLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: dclk
+      - const: iclk
+
+  rockchip,cif-clk-delaynum:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    description:
+      Delay the DVP path clock input to align the sampling phase, only valid
+      in dual edge sampling mode. Delay is zero by default and can be adjusted
+      optionally.
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ARST
+      - description: HRST
+      - description: DRST
+      - description: PRST
+      - description: IRST
+
+  reset-names:
+    items:
+      - const: arst
+      - const: hrst
+      - const: drst
+      - const: prst
+      - const: irst
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to general register file used for video input block control.
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
+        description: The digital video port (DVP, a parallel video interface).
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
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Internal port connected to a MIPI CSI-2 host.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
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
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vicap: video-capture@fdfe0000 {
+            compatible = "rockchip,rk3568-vicap";
+            reg = <0x0 0xfdfe0000 0x0 0x200>;
+            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&cru DCLK_VICAP>;
+            assigned-clock-rates = <300000000>;
+            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+            clock-names = "aclk", "hclk", "dclk", "iclk";
+            iommus = <&vicap_mmu>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+                     <&cru SRST_I_VICAP>;
+            reset-names = "arst", "hrst", "drst", "prst", "irst";
+            rockchip,grf = <&grf>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                vicap_dvp: port@0 {
+                    reg = <0>;
+
+                    vicap_dvp_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                        bus-width = <16>;
+                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+                        remote-endpoint = <&it6801_output>;
+                    };
+                };
+
+                vicap_mipi: port@1 {
+                    reg = <1>;
+
+                    vicap_mipi_input: endpoint {
+                        remote-endpoint = <&csi_output>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bbfaf35d50c6..cd8fa1afe5eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>

-- 
2.34.1


