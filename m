Return-Path: <linux-media+bounces-27771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA9A551FA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6982216C3F5
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0366626AA92;
	Thu,  6 Mar 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="DRsP9dAW"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022121.outbound.protection.outlook.com [52.101.71.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E125DB1D;
	Thu,  6 Mar 2025 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280191; cv=fail; b=LpGCOu1Y6BOkM7A2ABVz3LyS0i+OdGdMKiSaQr7YAZlR26Z08Mj/o4aLsB6LQmbzcf+pKHSNTt605qtshGmrGGQ5SXds2K/o1jHdBY8HgSYv+gkdYFDx22Xl0cWPyRak7mCFdJRlUDl9VeWCxgHqCWcfCSQeU6kbwrb3W4CKYLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280191; c=relaxed/simple;
	bh=oVfAJlYN41cP585X9vYiVHKQ/20Qved2iXZOz9E6u0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G3Lqpa6ohGz4t4ImAH7gjV5scw25wtU0T5+VLBMHm9UEkoyjKUSIvxX8CVUwpML0fncge2t/Wz9p8LeWSri8Z8XTFFltDe6L4tG7CDdXnGegaTZ+U2bV74skIfoueT3P0ll2f+gb9yUHdjBvb0W9TivkW180MwvVgG1bKgRRZ8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=DRsP9dAW; arc=fail smtp.client-ip=52.101.71.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7qTS5x9YZyS+y5Pv0poQsmJoksDupStm+qYqnsVwWyNkiIGKmUy+ibnOQUEtfKtQmSz+WdTkPLuhjAveMo8Wel1zmSImC3aCdQ/JzmFnXin3z35cR/ZkSEZ0ckVG4EJUvDE0DqTVaWb81isgSRkj9gP2c0cnK7mHUtIXvBKmDBfUtt1o8f5/Nt+MAcRW5dcepxn88WLu3shLJo+/PD9f2LUsoC4H2DI2SwtAHWPmIQ94zuG/2nO1LJzwB389ExildxQTjN78VMhyAmwJ9B76guczYmLMBXY3rK0hWmW0ea6qe9TBeyAZmhbpedowrJnshfyp2adSMwLRHwKqhG4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vI0qo/HsDvHOZgHd4CFjZl2tz/cnikjW0SqfZTuO90=;
 b=FCqF2zu9S9R4tVldhaQbeGWlqrivz+Pkse0fLYplutOYDHzypdZT06yl3RzD9II+QEm3rvQg0MpCGX4D/Cc56AHgE4n0XVnIhNzAiB7xkvNz4+MBMds/pui0t2eVSGCMQCIvknscZ5kHlkBpUHNgoeZttGTzF+dC90gpt7y8cIg8LtPlt5IbrBVolmW+XhNQhy9mQYL2SmWikDXNqD0ClrBx+QyZ+0Bs27E6i3cM2cq4M2tAhVDUNN8LFbaQqwb1EubJC3BxNtGzzi//RAImms4X4EMeQBVWZ4pqh7zz8uXWBVhO0Dzig7m9LIncH0b7huZO4LFfPWiYaH1U9kehmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vI0qo/HsDvHOZgHd4CFjZl2tz/cnikjW0SqfZTuO90=;
 b=DRsP9dAWj2mR3DX3eho9/nUDDn3XRBi7eEbXWQGcZECVFphFzVL7yQ2D3pvizzwSnAinEreTI437kE9dv47NcZVTKxStSPzYyLBzkBW7XTl2KEw8uwzcthFBD3SKYv5GfrPJRtY8roQZAwxGG/rBgy3e1Nd3EfcUjUb4PDpxznY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:18 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:18 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:07 +0100
Subject: [PATCH v5 06/11] media: rockchip: rkcif: add driver for mipi csi-2
 host
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-6-f02152534f3c@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=20423;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=oVfAJlYN41cP585X9vYiVHKQ/20Qved2iXZOz9E6u0Y=;
 b=0ggfzlwjaxe+72Zh0QUuI0hOJNaf52LQWj8sIKPKdcZ226vNMoBan3CAE6nHxDJRuBWkUV8Vf
 qoA5pzZCg2lAryVnepx5xnvPgmsVC25DmTyIwRdsFhPJYxodXGUQX5z
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
X-MS-Office365-Filtering-Correlation-Id: 6fd7c742-40d8-4cd8-0063-08dd5ccfd091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGtrV1lXNktlTUIySnVTaitvTmhjMkJtZ0tHVy9seVVBYm8rZ1UvN3pqeFU2?=
 =?utf-8?B?aWVRSk1BNWpkSEFndXhrSWFFaThBNHVlV3JoVi94RVV2WDRTUUtneU5pdFY4?=
 =?utf-8?B?TG9sRHpyVmhOcnA3TlUxZXNiM3YvU0JwNmFBSHhVQWtQY0R2cm1JNzA2LzJC?=
 =?utf-8?B?T0dhNUhuSWtPOHJKeHhLRG84N3NoTmdDM0lobUluNDlCRE1JSFZVWFd1STJQ?=
 =?utf-8?B?SlpSRGJYQW9SUzdWR2kxUGlvZ0ZkM28zVXpMeDE0aHpsS0ROZnc3QXYwNkJM?=
 =?utf-8?B?U1N0Tkx0OHA5NXZIemNhRURhQnVlVUd0MWVubCtRS3JtdEE3WWlLb2tOeVJT?=
 =?utf-8?B?ak12OVZvSG4xMm5lNEtFTkFWUW02UU9wcXpWV1ZUK2xhWUU4cXpXTDBMdkFB?=
 =?utf-8?B?cDJBaGZHYW01WWo5elM1dnZ5MzJ1bW1wa1Z2YVA1eG96NHZKVllDQjFLWHBl?=
 =?utf-8?B?WGc1RUtMMmkzRCs2OU9YTkRKbnkrVEllRWlFUzVDd3RBVVRZSGJteWFyRnVE?=
 =?utf-8?B?aVBUTHhUTXlUUEdGZE41anBMRlk0ZHNxV3FMY1pZalpOMUNKRy9lY2xTSlVR?=
 =?utf-8?B?WFJMK2pFRFBQUFRsWTY1QVlHYlg0Y3Y3V09HMWhGNjFlVmV1U3hpZkJnK1RB?=
 =?utf-8?B?UHY3bjc4NEJWVi8zUnRzRHF2N2xabWVLdXlwNkpnRGhOV0J3anJEZDJEL1R4?=
 =?utf-8?B?R21GQXFkWUt2eGh4WE9nT2RYZmNkRWlGbU1IeXFGUjVDMUd0MzZ6aHo3K0k1?=
 =?utf-8?B?WEt1cW45M1ZrcTFxcVEyb3ozN0dVRGp1WGd6MjIydm5IN0tzSnZtWWkyaFlB?=
 =?utf-8?B?WlE3RG9rZUx1elZzT0w4TVBCNWtWOWluYTh2UWZSRUlmRGVuZ042WCtiSCsz?=
 =?utf-8?B?c1k1Znoxa0ljNi9sbmQxcnJrUCtzdUgxUDRYcE1CQ2xRNUFEL2dTZ0xiVWR4?=
 =?utf-8?B?SzUwUW1xZ3pkUm1SV2VKWk1MSXcrYWVCclNjaUR2NkxFKzMzRmNtQ1VCYWFN?=
 =?utf-8?B?YVM5cUpkQ0VkVmZETy8zOXV2a1ZUZWNEOUlzNGlua0wxQ21IbWlsWjg4ajd2?=
 =?utf-8?B?ZS9jNFo1UmZIZ1FnbEFOOWsxVFNsUDlteTJ5bEpQR0hmcE53OG1qbWVPT0th?=
 =?utf-8?B?MENiOG5YVUZjTUdzbmhaaTAyUFdrR1hVL3U4STY5NGhTRHNreTZ3K2RabmJR?=
 =?utf-8?B?QjQwWktyeVZLNjVBOHpSYXMvK0R5c2N3U0Fjd3RjVHBkbGZpdUhHc3B1a1pS?=
 =?utf-8?B?ZUtYZzUvL1NoVzlwWGUvN0taOGhueHlZQnN6cjdTWFF3N0l4d29GZ24rWFRB?=
 =?utf-8?B?c2FrV0RvRWlGVmZjcmJQTlhQOUtBTWtHYnlEOG96OWpXc0RKdGMzaEpCVEkv?=
 =?utf-8?B?aTVCeSt0V2lwb3VxS2QrRDkreXdERGYrbDVjUllaN3VzZ00yS2ZydVhoUWVm?=
 =?utf-8?B?VUZPRjJxT3p3a2dnRm0yTysrekNGL3V6azdSMDY4UGVXT2Z4MXg4S2t6R1FQ?=
 =?utf-8?B?bU9aa2w3UVkzMEkvcFArMGlqcnBsNzJqczlnVktXc1FsT1FYT2NjK2NYZ1Iv?=
 =?utf-8?B?aVZEempOVjI1dlFad2JGZGZ0N3UrVThuVEw2aThtZzlDU1VQQUE5YlJOM0pG?=
 =?utf-8?B?dDJvRjdQZmsyT1ptNmJjWHY3aHM3ZzBxRzQvdENhSHZwSG9rNWlJcEhTYnZo?=
 =?utf-8?B?T1lCcVN0cFV2ZTRCYlA4SEVVT2lTL1pWaTkwS2hLdm5QOU5lcjB0a2ZBVGl5?=
 =?utf-8?B?clFlKzAyS0NCZmlsQ3ZlelVOK28veHN1eXpRSE02TlUranlnbiszdzRlazNN?=
 =?utf-8?B?NW1aajdVUWRCakNheFlDeXJlU3BUam1lRjNtazV5MVhyTWNVMlVHdWwvZVBh?=
 =?utf-8?B?MGZWT1NvRHlsRjBEOUJOWnlHYkoyZTBHd0ViTjZXc2NqT3BvRnJRZkl0bE9J?=
 =?utf-8?B?Yko2U1FycitpRjFudHhzY2lnT1JWMWpZWEQvT1FvQjc3a2wza042SVB6a0ln?=
 =?utf-8?B?QlVzc0F4YytBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjI1L0xRR05xU1d1eWwrQ2d2RGxXK0VDSXhsaHBmUWs4anRWVE81bFVWMWlR?=
 =?utf-8?B?QmVZb0xscmN1dDk3czJHOXJMMU9QTGFsSlJaN2ZLWGRDL3lHWGEyZ1Q2YklJ?=
 =?utf-8?B?OVhTRWVSSUZIWDcxU3lFNTJjZHhUR1dpREtHZk1yYjRRbGFYSGE4UVRhNW5j?=
 =?utf-8?B?TlEwaVB4SWtNK3gxSklIczRFdUJZMWsxRHVOR3NTdGVIQVl0cGlCNlJOeDR3?=
 =?utf-8?B?bzEwTmYyRHlTdkNXdEgxWENldXlhSDBhelllWFBOd21jVkd1T1ltdkxFZitI?=
 =?utf-8?B?RERvOG9SUGsxM2YzVllCcy9WVmUxZ2ZuZXFnYzJqd3BKLzRRNjJaTXlWbGRl?=
 =?utf-8?B?K2xiNlB3YVdYYytaeXBwa2JlUzlJOGVpbVJDTWhKU2d2QStRdUJNSmpwMC82?=
 =?utf-8?B?TGRYZm03by9CWittTmVwdmZMMVpibkdDZVU2YmNxN1FVZ0JmUUJYdWhMOTNi?=
 =?utf-8?B?bHpoWW5xY2RnV3JHV2RWUnBPYzZtSUtVbkJQak1ITFFOcm9jUEVndTBpZDA3?=
 =?utf-8?B?Y3ZXNnM2dERRZTA4RzMxVlRNOHNSU25GUlg1aWxsMXNWOWtyYytOVWNMQkVk?=
 =?utf-8?B?eVZxbHhJdEZuczBWNzkrc09GQlFrRGtIRk5NK081anhVUDRvVVdoaVI1Nkcr?=
 =?utf-8?B?VmtHREFJSW1VK2NPZVB4dVk5cGRFRGp0UWRiVnpjSk5UYUFqT3VpTWcxUEc3?=
 =?utf-8?B?UTYxL1NuK29LM2htQjdSekxzeFkxOVd3Q1FpUGxoY0lwZVgyaGM3ckh1L1Mr?=
 =?utf-8?B?WG81Z29yZkhpSFRDNUJhWUQ4bEI4SDBuNGRqWU9Db0J0WUlHSEczeEFCald0?=
 =?utf-8?B?eU5sQ2NoWURnNVgxazdZZmhmQnRMMmNoR20zSFJhN0lQdEhjY1N1V0Z6b2dK?=
 =?utf-8?B?NW42Ni9EY2JrbWpXSmIvQUE4UlM0NVdsbzV6MS9wWEpkb0l3YnJqV2x0Q0I5?=
 =?utf-8?B?SFFWV2pjZ2FtTzlRUUUrbUZJN1hTa29keHpxdWkzZHpWWnFlKzdWTGFFbkt3?=
 =?utf-8?B?SklSNHkrR0x0eC9zVXlFTkxDaWlqYVQvS0s1OGlGVDRUVXFXOFV2eFhBUWov?=
 =?utf-8?B?TDZvdE5KdXRTMlZXc1h3azFHU2JDMTFmNU5iUjgvNUtiekpSL2ZLK1REWklT?=
 =?utf-8?B?MSt3TnNVZXFSVDZob1FOaDNRRytuRUJVVVV6K3YxcjJ4UVg1elRiTUppZXZF?=
 =?utf-8?B?NGdIU3ZrOFZNa00xZ3RiekJTRExyWWZ3SEhkWi93ZGNKRitnNkk4c0xrdCtm?=
 =?utf-8?B?Ym5qUW1PSWdtek1Sc1F4NFdsWkNMMUw4RkVFSWFERXFsdmpkRyt0ZEUvWC93?=
 =?utf-8?B?R1FFcnAvczJZZFpRMU56cC9LZ3NKWU9ZVVhGSjVrSC9TREt5UzlEQXV2YTJH?=
 =?utf-8?B?M2hzRFBJbnRyanJCUmVTQS90QW9QUWZ6Z0RKUTAvUkpqZ0Q5ZWppOFBWSmgv?=
 =?utf-8?B?dmNuakc3cG5yWUErMHAxdy9JTHN1OW13cUlVQW5BYkVxSzl3ZS9HTnlwaFpZ?=
 =?utf-8?B?NjAzR080djFrdTV0S3Q2RndFd3hLeEt2TkszNkZwMDFLLysvbldVYk5CWU1Y?=
 =?utf-8?B?QXk3bklEZnc4a3c4Y3ByYWpoWExIdTFwZzRLRWcwS2YxUHgxdjh4aTlCTVRq?=
 =?utf-8?B?bU9YWEhTdlowOHN2ZldjaU9HRk1UZldhdWFqdUl1Qit3aHA2d1BmL3hVYXRo?=
 =?utf-8?B?MFJHT0IwRGM1UnNpcEJvb2V2UjhMQnZHOEtIUUowelI3Wk5FU3hVUmhYeVpL?=
 =?utf-8?B?QWN6UlBxcy83bk0wcHJMVFlHQkNTamVlZ0tWdHFLRnJwc0NCS0xISXJuRDdS?=
 =?utf-8?B?K2lTZ3pnNUhlUlJ0bWo4RGYyWG52c2poQVVIQmhrSC9WWDZxdnFCTDg2dkpM?=
 =?utf-8?B?Wnc4QmJGOFVFb0FXblgrOWZvQlVjT3owVjg3ME04SVI0TXB5eUFwckd6U3Bu?=
 =?utf-8?B?MDM1U3BvU0RqeUJaQ3htSWs5enBmWE5WU3VLY2pnVXJHYnVnWlB0RjN5VlNF?=
 =?utf-8?B?N0JJYy80c0JNRktUZXJydTJTLy90YjFkQ2NJTm56VCtLTTNneUp4Y0JZeFh6?=
 =?utf-8?B?NWlpM0tGVjNoQ3dzZkpZTkdEU3lzQzNuWlg5TkpBTnpZbFFqekZkcEUwa2xW?=
 =?utf-8?B?RFdyRU5xcVBMaHdHeGcrL3dGbmhyN3B1UEs2dUlycmFhTmhVekNmV3IwSG5w?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd7c742-40d8-4cd8-0063-08dd5ccfd091
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:18.5141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtCKKXN19Ep4MT9YzdO0Xru+IR2lAuWszQTTzI7jE6q6FhZnbmjjsVc8nIl3HBnEKac2J6eH9dF4brRKBrrq6kB2YBjJ953wtdnR+0/YSHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
and one output port. It receives the data with the help of an external
MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video
Capture (VICAP) block. Add a V4L2 subdevice driver for this unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   3 +
 .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 +++++++++++++++++++++
 2 files changed, 734 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index 818424972c7b..f3a91912c373 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -5,3 +5,6 @@ rockchip-cif-objs += rkcif-dev.o \
 	rkcif-capture-mipi.o \
 	rkcif-interface.o \
 	rkcif-stream.o
+
+obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-mipi-csi.o
+rockchip-mipi-csi-objs += rkcif-mipi-csi-host.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
new file mode 100644
index 000000000000..58eb4b102d48
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
@@ -0,0 +1,731 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip MIPI CSI-2 Host Driver
+ *
+ * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define CSI2HOST_N_LANES     0x04
+#define CSI2HOST_CSI2_RESETN 0x10
+#define CSI2HOST_PHY_STATE   0x14
+#define CSI2HOST_ERR1	     0x20
+#define CSI2HOST_ERR2	     0x24
+#define CSI2HOST_MSK1	     0x28
+#define CSI2HOST_MSK2	     0x2c
+#define CSI2HOST_CONTROL     0x40
+
+#define SW_CPHY_EN(x)	     ((x) << 0)
+#define SW_DSI_EN(x)	     ((x) << 4)
+#define SW_DATATYPE_FS(x)    ((x) << 8)
+#define SW_DATATYPE_FE(x)    ((x) << 14)
+#define SW_DATATYPE_LS(x)    ((x) << 20)
+#define SW_DATATYPE_LE(x)    ((x) << 26)
+
+#define RKCIF_CSI_CLKS_MAX   1
+
+enum {
+	RKCIF_CSI_PAD_SINK,
+	RKCIF_CSI_PAD_SRC,
+	RKCIF_CSI_PAD_MAX,
+};
+
+struct rkcif_csi_format {
+	u32 code;
+	u8 depth;
+	u8 csi_dt;
+};
+
+struct rkcif_csi_device {
+	struct device *dev;
+
+	void __iomem *base_addr;
+	struct clk_bulk_data *clks;
+	unsigned int clks_num;
+	struct phy *phy;
+	struct reset_control *reset;
+
+	const struct rkcif_csi_format *formats;
+	unsigned int formats_num;
+
+	struct media_pad pads[RKCIF_CSI_PAD_MAX];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_fwnode_endpoint vep;
+	struct v4l2_subdev sd;
+
+	struct v4l2_subdev *source_sd;
+	u32 source_pad;
+};
+
+const struct v4l2_mbus_framefmt default_format = {
+	.width = 3840,
+	.height = 2160,
+	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_RAW,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_NONE,
+};
+
+static const struct rkcif_csi_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	{
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	/* Bayer formats */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+};
+
+static inline struct rkcif_csi_device *to_rkcif_csi(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkcif_csi_device, sd);
+}
+
+static inline __maybe_unused void
+rkcif_csi_write(struct rkcif_csi_device *csi_dev, unsigned int addr, u32 val)
+{
+	writel(val, csi_dev->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_csi_read(struct rkcif_csi_device *csi_dev, unsigned int addr)
+{
+	return readl(csi_dev->base_addr + addr);
+}
+
+static const struct rkcif_csi_format *
+rkcif_csi_find_format(struct rkcif_csi_device *csi_dev, u32 mbus_code)
+{
+	const struct rkcif_csi_format *format;
+
+	WARN_ON(csi_dev->formats_num == 0);
+
+	for (int i = 0; i < csi_dev->formats_num; i++) {
+		format = &csi_dev->formats[i];
+		if (format->code == mbus_code)
+			return format;
+	}
+
+	return NULL;
+}
+
+static int rkcif_csi_start(struct rkcif_csi_device *csi_dev)
+{
+	enum v4l2_mbus_type bus_type = csi_dev->vep.bus_type;
+	union phy_configure_opts opts;
+	s64 link_freq;
+	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
+	u32 control = 0;
+
+	if (lanes < 1 || lanes > 4)
+		return -EINVAL;
+
+	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
+	link_freq = v4l2_get_link_freq(csi_dev->source_sd->ctrl_handler, 0, 0);
+	if (link_freq <= 0)
+		return -EINVAL;
+
+	if (bus_type == V4L2_MBUS_CSI2_DPHY) {
+		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+
+		phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2, lanes,
+							   cfg);
+		phy_set_mode(csi_dev->phy, PHY_MODE_MIPI_DPHY);
+		phy_configure(csi_dev->phy, &opts);
+
+		control |= SW_CPHY_EN(0);
+
+	} else if (bus_type == V4L2_MBUS_CSI2_CPHY) {
+		control |= SW_CPHY_EN(1);
+
+		/* TODO: implement CPHY configuration */
+	} else {
+		return -EINVAL;
+	}
+
+	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
+		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
+
+	rkcif_csi_write(csi_dev, CSI2HOST_N_LANES, lanes - 1);
+	rkcif_csi_write(csi_dev, CSI2HOST_CONTROL, control);
+	rkcif_csi_write(csi_dev, CSI2HOST_CSI2_RESETN, 1);
+
+	phy_power_on(csi_dev->phy);
+
+	return 0;
+}
+
+static void rkcif_csi_stop(struct rkcif_csi_device *csi_dev)
+{
+	phy_power_off(csi_dev->phy);
+
+	rkcif_csi_write(csi_dev, CSI2HOST_CSI2_RESETN, 0);
+	rkcif_csi_write(csi_dev, CSI2HOST_MSK1, ~0);
+	rkcif_csi_write(csi_dev, CSI2HOST_MSK2, ~0);
+}
+
+static const struct media_entity_operations rkcif_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int rkcif_csi_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+
+	if (code->pad == RKCIF_CSI_PAD_SRC) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							RKCIF_CSI_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	} else if (code->pad == RKCIF_CSI_PAD_SINK) {
+		if (code->index > csi_dev->formats_num)
+			return -EINVAL;
+
+		code->code = csi_dev->formats[code->index].code;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int rkcif_csi_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *format)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	const struct rkcif_csi_format *fmt;
+	struct v4l2_mbus_framefmt *sink, *src;
+
+	/* the format on the source pad always matches the sink pad */
+	if (format->pad == RKCIF_CSI_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!sink)
+		return -EINVAL;
+
+	fmt = rkcif_csi_find_format(csi_dev, format->format.code);
+	if (fmt)
+		*sink = format->format;
+	else
+		*sink = default_format;
+
+	/* propagate the format to the source pad */
+	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!src)
+		return -EINVAL;
+
+	*src = *sink;
+
+	return 0;
+}
+
+static int rkcif_csi_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &default_format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rkcif_csi_enable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi_dev->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[RKCIF_CSI_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_CSI_PAD_SINK,
+					       RKCIF_CSI_PAD_SRC,
+					       &streams_mask);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err;
+
+	ret = rkcif_csi_start(csi_dev);
+	if (ret) {
+		dev_err(dev, "failed to enable CSI hardware\n");
+		goto err_pm_runtime_put;
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		goto err_csi_stop;
+
+	return 0;
+
+err_csi_stop:
+	rkcif_csi_stop(csi_dev);
+err_pm_runtime_put:
+	pm_runtime_put_sync(dev);
+err:
+	return ret;
+}
+
+static int rkcif_csi_disable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi_dev->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[RKCIF_CSI_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_CSI_PAD_SINK,
+					       RKCIF_CSI_PAD_SRC,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+
+	rkcif_csi_stop(csi_dev);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops rkcif_csi_pad_ops = {
+	.enum_mbus_code = rkcif_csi_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkcif_csi_set_fmt,
+	.set_routing = rkcif_csi_set_routing,
+	.enable_streams = rkcif_csi_enable_streams,
+	.disable_streams = rkcif_csi_disable_streams,
+};
+
+static const struct v4l2_subdev_ops rkcif_csi_ops = {
+	.pad = &rkcif_csi_pad_ops,
+};
+
+static int rkcif_csi_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RKCIF_CSI_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = RKCIF_CSI_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	int ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+					       &default_format);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_internal_ops rkcif_csi_internal_ops = {
+	.init_state = rkcif_csi_init_state,
+};
+
+static int rkcif_csi_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *sd,
+				    struct v4l2_async_connection *asd)
+{
+	struct rkcif_csi_device *csi_dev =
+		container_of(notifier, struct rkcif_csi_device, notifier);
+	int source_pad;
+
+	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+						 MEDIA_PAD_FL_SOURCE);
+	if (source_pad < 0) {
+		dev_err(csi_dev->dev, "failed to find source pad for %s\n",
+			sd->name);
+		return source_pad;
+	}
+
+	csi_dev->source_sd = sd;
+	csi_dev->source_pad = source_pad;
+
+	return media_create_pad_link(&sd->entity, source_pad,
+				     &csi_dev->sd.entity, RKCIF_CSI_PAD_SINK,
+				     MEDIA_LNK_FL_ENABLED);
+}
+
+static const struct v4l2_async_notifier_operations rkcif_csi_notifier_ops = {
+	.bound = rkcif_csi_notifier_bound,
+};
+
+static int rkcif_register_notifier(struct rkcif_csi_device *csi_dev)
+{
+	struct v4l2_async_connection *asd;
+	struct v4l2_async_notifier *ntf = &csi_dev->notifier;
+	struct v4l2_fwnode_endpoint *vep = &csi_dev->vep;
+	struct v4l2_subdev *sd = &csi_dev->sd;
+	struct device *dev = csi_dev->dev;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
+
+	vep->bus_type = V4L2_MBUS_UNKNOWN;
+	ret = v4l2_fwnode_endpoint_parse(ep, vep);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to parse endpoint\n");
+		goto out;
+	}
+
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep->bus_type != V4L2_MBUS_CSI2_CPHY) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "invalid bus type of endpoint\n");
+		goto out;
+	}
+
+	v4l2_async_subdev_nf_init(ntf, sd);
+	ntf->ops = &rkcif_csi_notifier_ops;
+
+	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
+	}
+
+	ret = v4l2_async_nf_register(ntf);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
+		v4l2_async_nf_cleanup(ntf);
+		goto out;
+	}
+
+	ret = 0;
+
+out:
+	fwnode_handle_put(ep);
+	return ret;
+}
+
+static int rkcif_csi_register(struct rkcif_csi_device *csi_dev)
+{
+	struct media_pad *pads = csi_dev->pads;
+	struct v4l2_subdev *sd = &csi_dev->sd;
+	int ret;
+
+	ret = rkcif_register_notifier(csi_dev);
+	if (ret)
+		goto err;
+
+	v4l2_subdev_init(sd, &rkcif_csi_ops);
+	sd->dev = csi_dev->dev;
+	sd->entity.ops = &rkcif_csi_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->internal_ops = &rkcif_csi_internal_ops;
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
+		 dev_name(csi_dev->dev));
+
+	pads[RKCIF_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					 MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKCIF_CSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
+					MEDIA_PAD_FL_MUST_CONNECT;
+	ret = media_entity_pads_init(&sd->entity, RKCIF_CSI_PAD_MAX, pads);
+	if (ret)
+		goto err_notifier_unregister;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret) {
+		dev_err(sd->dev, "failed to register CSI subdev\n");
+		goto err_subdev_cleanup;
+	}
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+err_notifier_unregister:
+	v4l2_async_nf_unregister(&csi_dev->notifier);
+	v4l2_async_nf_cleanup(&csi_dev->notifier);
+err:
+	return ret;
+}
+
+static void rkcif_csi_unregister(struct rkcif_csi_device *csi_dev)
+{
+	struct v4l2_subdev *sd = &csi_dev->sd;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(&csi_dev->notifier);
+	v4l2_async_nf_cleanup(&csi_dev->notifier);
+}
+
+static const struct of_device_id rkcif_csi_of_match[] = {
+	{
+		.compatible = "rockchip,rk3568-mipi-csi",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, rkcif_csi_of_match);
+
+static int rkcif_csi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rkcif_csi_device *csi_dev;
+	int ret;
+
+	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
+	if (!csi_dev)
+		return -ENOMEM;
+	csi_dev->dev = dev;
+	dev_set_drvdata(dev, csi_dev);
+
+	csi_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi_dev->base_addr))
+		return PTR_ERR(csi_dev->base_addr);
+
+	ret = devm_clk_bulk_get_all(dev, &csi_dev->clks);
+	if (ret != RKCIF_CSI_CLKS_MAX)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	csi_dev->clks_num = ret;
+
+	csi_dev->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(csi_dev->phy))
+		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
+				     "failed to get MIPI CSI PHY\n");
+
+	csi_dev->reset = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(csi_dev->reset))
+		return dev_err_probe(dev, PTR_ERR(csi_dev->reset),
+				     "failed to get reset\n");
+
+	csi_dev->formats = formats;
+	csi_dev->formats_num = ARRAY_SIZE(formats);
+
+	pm_runtime_enable(dev);
+
+	ret = phy_init(csi_dev->phy);
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to initialize MIPI CSI PHY\n");
+		goto err_pm_runtime_disable;
+	}
+
+	ret = rkcif_csi_register(csi_dev);
+	if (ret)
+		goto err_phy_exit;
+
+	return 0;
+
+err_phy_exit:
+	phy_exit(csi_dev->phy);
+err_pm_runtime_disable:
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static void rkcif_csi_remove(struct platform_device *pdev)
+{
+	struct rkcif_csi_device *csi_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	rkcif_csi_unregister(csi_dev);
+	phy_exit(csi_dev->phy);
+	pm_runtime_disable(dev);
+}
+
+static int rkcif_csi_runtime_suspend(struct device *dev)
+{
+	struct rkcif_csi_device *csi_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi_dev->clks_num, csi_dev->clks);
+
+	return 0;
+}
+
+static int rkcif_csi_runtime_resume(struct device *dev)
+{
+	struct rkcif_csi_device *csi_dev = dev_get_drvdata(dev);
+	int ret;
+
+	reset_control_assert(csi_dev->reset);
+	udelay(5);
+	reset_control_deassert(csi_dev->reset);
+
+	ret = clk_bulk_prepare_enable(csi_dev->clks_num, csi_dev->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rkcif_csi_pm_ops = {
+	.runtime_suspend = rkcif_csi_runtime_suspend,
+	.runtime_resume = rkcif_csi_runtime_resume,
+};
+
+static struct platform_driver rkcif_csi_drv = {
+	.driver = {
+		   .name = "rockchip-mipi-csi",
+		   .of_match_table = rkcif_csi_of_match,
+		   .pm = &rkcif_csi_pm_ops,
+	},
+	.probe = rkcif_csi_probe,
+	.remove = rkcif_csi_remove,
+};
+module_platform_driver(rkcif_csi_drv);
+
+MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Host platform driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


