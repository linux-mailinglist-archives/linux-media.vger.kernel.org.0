Return-Path: <linux-media+bounces-25706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C0A2A541
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159341887EB8
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1205226544;
	Thu,  6 Feb 2025 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="wSj3OMpL"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023113.outbound.protection.outlook.com [52.101.67.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F62248A1;
	Thu,  6 Feb 2025 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835882; cv=fail; b=UaOoYzBdAI413/nZVDHT6xM72NgFGSLc8eJUQnYJQSVR2ev4zpDsk18Fgs2FfMlGoceGUb1GaGgxadXH9r6H7kd5vYXJ4JiZVt8lTncHP1Ug2tLhT0SOaYj/Kpo9n/vKOR/ImvM+ayfdQUWjhTMvcujaMvM8aJ9trkJuMPdXTLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835882; c=relaxed/simple;
	bh=Jwfb9ka7Co1QU4YFQj1bP68YHW3VZLAiB9reUK6eW8Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Innlcvt/7Gdk249lrzRdFgs5DyiudCtNFo3TsQb60kvMw1cNnHAUvlwh1tk6PvcVra6X6E1NOgrHpRDGiF3JXy8SOxaJQGUv9ZPBV8saF0KPcADKLAed2yCfF0ReSeT+hQLCLuK0cm2xURboXO4+eFzWy2eIfRki1QJLv9nOg1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=wSj3OMpL; arc=fail smtp.client-ip=52.101.67.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofhvfod16IhNxYjfkskVhCjoR7+Bpp+kGT1FTXN6smGemw6OfbvryxqUYlOJVJ6WQr2mxSxjrXkuefnlaXmrJ7UzbSZ5FeEyyHxtsh3YFHW5aGez7eOeh8SerSTwkjuNocelYomDKTQiUM86XAXUBH8KCsVuJwkH1bSrIo/bxJfimvQhW3KlLM/a3F8/rS8XrqrKzBoYT3venYosobYPL40IbIakil4+4V88051xEvcqHGj4/XQdoteg3fvsu+fY69Uw0CVs7xZUN93vpIO0TowWFHRKBlLiLEs9vHYS2Y5RsvHB0qYk15qPuixw3EqMdOmNKQFjqIvUNhaymIX+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj6BxCl9fpw5Pry04iUoEkwcUhf418Q3mJRPppiteaU=;
 b=lwTUzIgGNtvFoQx+q3T9DpCzGeP2btzvw5pBJqHIfKgk4RZnsUJyVSJcirT+cbVfpUwp4rVzjGEeJ7YfRcgPponKweEk/ZSE+wcOGpNZQbAqDnClMRE74NfxkEHsSWgja+b73dkESBYhjJ5TDT1ZG1GKSytB61iD0m9/yYq5zn6ZnyPqaqBKGH5r2qvS7pyPqGIC5C4RK9flQBx1+J71SFvXET6aqbBOEbkCRPQRr7in5FWYmv0IQ0dgwyK8M4HvZ8gmsepPRfFE6vzHLT6cyYQHPygGiuIYIuM1AxilZpJcW7lPspJ6y9ZN1pByn5tyWtimBXq9f8y7EFbB9FVYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6BxCl9fpw5Pry04iUoEkwcUhf418Q3mJRPppiteaU=;
 b=wSj3OMpLht3DUJGlrWXM6iDulbIvMiMXby1BzTXrRzAiYVkokTy1CeZQrGMZ1Y56dJKZhKUYDjSoVRD3ugp1nKe11zAgMV0gV7SYYGO1+AZz7YYNT+acezi/gu1WmBgcDnfpwNenEKWIccRfc7MRguqiLh17bH2f7IOfQJ5yHJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10170.eurprd08.prod.outlook.com (2603:10a6:20b:63f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 09:57:57 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:57:57 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Feb 2025 10:57:39 +0100
Subject: [PATCH v3 1/7] media: dt-bindings: media: video-interfaces: add
 defines for sampling modes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-1-69d1f19e5c40@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=948;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Jwfb9ka7Co1QU4YFQj1bP68YHW3VZLAiB9reUK6eW8Q=;
 b=FvtZqmG6ZoB/lNG/Jbh5+3EZqtcxtn/DAsJit+MfhM3rNebNrr1Vt2WE0MHlWGm0TwLiUDWvT
 Md+0y2DAnoxDMxdG/uI6g+VZiovS0VoLDDF5/Xxlq7zAZ0BUXmM5t+o
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
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10170:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcddba5-ff62-4f9f-c053-08dd4694bb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzBLYW92ZFNVUkxhdGs2clRRU2JRMVBuRUU3bFZHaVZkZXFlTzltRXFDZXNy?=
 =?utf-8?B?czhRV3g3Q2JqU0E1ckRpRE0xbno3STl2SnRXZ1ZVTHF3a1k5Zk9UbVNGYlFU?=
 =?utf-8?B?WG5kdmRsQ3hPQjl2dTdacmJIWVM2RTRDY2dGZmF1VEs1cGsvY3pGWkRIUTlY?=
 =?utf-8?B?WFNHY252S0lTR3pSYURVeWp5MnRZMzAyanlVTDNjM29aTUVlbDM4ZXZSQWpK?=
 =?utf-8?B?cHpuTDZpM0NvTnJiSkpITGJKSWk3anl5c052VGpRdTE5cVgraVJ1MW9zQ0Qx?=
 =?utf-8?B?bzEwRXJlZ3dpa1BiMjhRME83OXBXWXVRZUg5cThLWTh2R0FZMkZRdTVpWjlm?=
 =?utf-8?B?elhYalY5L2l1bzhrSkFMTlg4NEV5WmdjelN2RHZXV0VadDU0dnIra2N3OTJs?=
 =?utf-8?B?VUdXWmU3azZCcVFCRXlLNlRsL1JmakhqMnhkRUlWNUdyYTFEaUlEdGdPUmky?=
 =?utf-8?B?b2lDemlDelUwRSs1dGRzZC9pVnJQZHQ1VHVMZElQL2p2dko4LzB3bjM5OGY4?=
 =?utf-8?B?YU5SVVJFbGFJdVlHOE4ycjlIUXJTUWJidjdNWlUvOVlWT3g1MTU1N1NUbDNY?=
 =?utf-8?B?UVVoSlk1TldxM0RVTk55d09rcko3T2FybUphQWR1OHhjN2lJcGRoYmJ5bU1q?=
 =?utf-8?B?ZmdPVzlnb3FxQ2Vzd1BYaHFYNHViZTJQMk9UVW5iUjZFdVpLR1RHMjBkek82?=
 =?utf-8?B?NnpPNGxxYTNYZTMxdVZTRlRNUlhVVytoTlhPK3dDNkJGc2sxRmRqWEgzWWg0?=
 =?utf-8?B?aWR5RHNwc1ZUSVpEeWZLdm5xMW4zcU1SREtaSUVyS09FS0p3c3BxbkdGa1Nu?=
 =?utf-8?B?d0pFS0twcFZJNHBjS0ZRU0xiNkdFZVUxWWZpdHFQNkwveHhwVElONVllRFU3?=
 =?utf-8?B?SkVvMHhLM1JGTlp1aTgyejhUOTVHY3NMYWJKMmlvNkVDZExqbXJNUklad08w?=
 =?utf-8?B?Z2svalZGK0kwb0RoQ0E2M0kvVjdhclZuYk1QR0sxZDBEZUVkcGczSW53b0dj?=
 =?utf-8?B?SllPa2d5RU9qSUV2VWkrbkVrRm94TWIrSyswS2JaZmIzVDBsM2ovZU5IZ2NR?=
 =?utf-8?B?emNBOEVKVnBUeGpIbGV6dTg5cDNCaGNCZFprUXRWTTFkT3lMYWFtcWhWV0gx?=
 =?utf-8?B?UVJjOVgxTmlwaEFDcUE5cm10SHEwNFN1bmZ6SHR6aVM4K04yZzlERWFGN0VK?=
 =?utf-8?B?SEJVVUt1eXVuV0ZXZTd6bVN0YXR3Vk02dENMZlU2NzFCMzQ0dytndnVlSVpW?=
 =?utf-8?B?dVR6aHlyOEZPS1FqZWpUSlhhaTJOb1NLUHgyQ3dvT01FUjVxR3dMVTFiV0xK?=
 =?utf-8?B?dlFpQkV5dkJqWWtaOWo0U2tSNm5hbTJ6Z1kwc3lyNGRuUmhhOWxSUlpIbG1y?=
 =?utf-8?B?V25GRVhKTUViYjBwWW5xOXd0K3dQMHNPLytWWWNrdHB2bUpYVmc1SzdLU1ov?=
 =?utf-8?B?aXRoc2FXZDNNellyUlljdWQwNnM4UWlra1QvNy9PK0ZmcXZhVzhqYWFEUnZt?=
 =?utf-8?B?cTNFZGYzVGdta2FqRDZ4bXhWSVFTc1R5emRiQWViMFFDZkIwQitwVGdaa2F2?=
 =?utf-8?B?RE5Sdnd6ZmZZNTFOSEFGNjVVczdoampVWXB1NUNUS0dWaGw3bHF6MGZUaSt3?=
 =?utf-8?B?ckRKbDlVOEllbUNlbCtUT2ZTM1RhZDNIUml1bEIycGpJL2l2dG1SQXVJY0Z0?=
 =?utf-8?B?ZGtLYlFhWng1b0J2Mi8xRmhaUmZVSEQyeUhRVmVYajlhK3l0Z1BNWi9UMnJY?=
 =?utf-8?B?ZHFSS2h2VUZneDdiVzQ1RURUV3J2QWYrZGgzaU1JT1VneS9BYy94NFpHRmdx?=
 =?utf-8?B?Z1U2WXM5MjYxQ2Z6c3VuaW52dUpHQjZRYkVoQjdHTm1aL3U3OWpqaWl0c0ox?=
 =?utf-8?B?SnJkL1dYUFBINWFLWldDVlU5NDd3ZXgxSmdWMnRVd1RzL1Evc3o3aGRlVTM1?=
 =?utf-8?B?YnR1cWUvWFBBR2wvVXg4QTZxVFlBNkx2YUQ5RExIaDVxUGJWdU0zUW5GMW5u?=
 =?utf-8?B?bTBKQVMyd3BRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d254elBKb0hnMWg1K1ZWcWJZcnBHRlpCblJQWW54YUhCTzdmVHJUc2MxL0RU?=
 =?utf-8?B?NkZyMjV3L1JDRk9lQmFYcW1aSDBWb2hYWW9nM3lyUGphZ2xiSmd6ZVR2YlRL?=
 =?utf-8?B?emRNMUlXSnB2ZlNqdFBIMEcxdnNBNlRnM1dacnNxRy9XejZPLzB1Vmw1R3Vv?=
 =?utf-8?B?UWRncXVrY3BxVjAwcWpIak40dTBiaU1LWU5FcVVaMnlDZ2JmZktkbnhOWGE4?=
 =?utf-8?B?SjFBS1pzbXJQYzlxYzdCZTY4VUdpV0RMaG1KQ3BtK1VOMVJvL0JTUXMyR2tL?=
 =?utf-8?B?QWptcDdMQ1pVMmk4UVdVVTg3RndSenZIdzZtVUg4ZEk5R3gySTNZaXc1WWlp?=
 =?utf-8?B?VzVPNUpROWRjNHlkd21EOW92OHNreTZzOGlCMWlsNTJTYUZkRHNvWHVPOFVk?=
 =?utf-8?B?K0N1REsvY2hiYS9lTEVKbnhqYlNsOUFLa1lkWnd3dmc0R3pmOWl1eGxGbmsy?=
 =?utf-8?B?dDk3N2NWamc4ZDBRVm9penBGaytwd2pMZWh3MUJveHE2blZ6QTNhaHJxOWYw?=
 =?utf-8?B?cHVwbjFPWUpid0JaNno3NzRPeWEzdTZjUC92RjAzYWo0NDQ5UWw2bkF0Tlo1?=
 =?utf-8?B?eG11ZzdWNGZQUXJBQm5OR1VjVFBQaHU5RFZDeXhxamJRbmpYYlJ4aHdGTGEy?=
 =?utf-8?B?aGE3SmZDVmZPMnlpTVVLKzl6QndmZjFmMGRCM0tOaXhTSkhhRzJBOUs2cFNG?=
 =?utf-8?B?V3J6ZTh2SDZVSWxiQ2d2L2hOakcvWU5ZUFpYellCNnM3Rm85Z1NlNy9QZzg1?=
 =?utf-8?B?WE9aMFBPUFlKRFFmZ2NlNXNvQTI1aDczNThVNmx0U2UrZjVyOTNRc2hUT211?=
 =?utf-8?B?ZE9ibFE3WUZtbmJDdnJ3akc5YllWRjJpa1BOYXRlMUVkZTI5dC9CWFlxZVdH?=
 =?utf-8?B?VEVnMUhLRWVKWGZTdmRNR2NSN1Iwblk4WVM5Vkp4Yi9EcDM5emxsdGZlZGw5?=
 =?utf-8?B?STNSb0VhS0FTK09DZTg2a3huVWNQVlJORVZkd0NjWmRSL2Y3U3B2M3NIR0VL?=
 =?utf-8?B?RXoxQ3Z6UEtIbCtZODM0K1RRZnN0MzVwQmVNTXVubVhiMWVTN1BjOVd2aUd6?=
 =?utf-8?B?bWw5NDVKWFhSZm0wWlFydFcvZjBvQVFkaGZyR09nYjJOQm1YSHZIbkk1RnhG?=
 =?utf-8?B?ckFBK0FsbGdjVjdUZU9QbzRObndsYUhDOWphOXVWUnlBTENBeTgwYTA0eUNv?=
 =?utf-8?B?dVMvY29nOUJPRUhEMUQvd2x1MFcwdk92bHdibVNMQThLRDVDdXpUN095bDZT?=
 =?utf-8?B?aXgzaDNXR0xNeVZpbDh2MDIzbU9DRXZXczJJbDVodTArc0JLWW15eHBoQ2gy?=
 =?utf-8?B?amtBYXFMUHlyTllhbG9URnVGRGxTK085WUlNWlAvTTFRejB5KzNoR0ZLWUZk?=
 =?utf-8?B?aTkySzQ3WkdTYy9tSW5hSW50SDhvdU8yQ1NkajkxSzBlZUZ1WG8xazVVV0li?=
 =?utf-8?B?Z0JRV0xiT2ZWQU1VaU16LzRlQTBGN1Rwb0FYRkh1WndCNHdVUDZEblB2NkJx?=
 =?utf-8?B?QWZvbUxoWHVRRzBiMkdCcTY1Tmg1N2hiek9iYmVhbGt6dmVDWEoyV2RvQUZY?=
 =?utf-8?B?dVhTMjRyRFBzMkJHUGN1Z3RFM2JPazZVOHZ6Q3FtaytGRkpoeXlGKy8xR21E?=
 =?utf-8?B?NEtQM202aFkvUXR3by8vRHBjMDB2T05GYWJxMUlLZFF3SkxrYndiRURLK0t6?=
 =?utf-8?B?a3ArR0RuRnBMT0pCL3BlNDkzbUZrb2d5S25pWFAxWWdRdGdmTk5MejR1UkNP?=
 =?utf-8?B?RHQweFdvSXZXcXVmSFErNG90SEhYYUVQUHd5QU96SmJ1a0V1V1M4RXRNdXo3?=
 =?utf-8?B?OUxvbFQ1SWRVNjl6Q2x6Vldha01nbkFQWUEwMytZYWJaN3ZOSCtQSS8rSS95?=
 =?utf-8?B?NmViYWV0MG1ic1ZFY1dGSG5pL01Rb0dmOTVBME1pVXBqMWRSR2ZWNUUyaW1U?=
 =?utf-8?B?K1Axdml6T1ZTSTZtRUhHSjFrYUt5RXJPVU9vcGFaWDRXOVg0RnhNUkJ1UUZ2?=
 =?utf-8?B?VS92NlVWdERMWHNrcXB3dkZWTi9QZ3M1MVp2TkJxQUNDNjRENW9CYmRGQkIz?=
 =?utf-8?B?Z2U2dk4wRm9mb3o3Ly9YTlZFbmZndXFmaHRoVDVvZk1aaXhtbzkrZjIvalZT?=
 =?utf-8?B?VHRsOS9taVdPZG1ERlRYTnZRazJvVjNjWmQ4U0FndHo1MjcvclhvWVFZcVNy?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcddba5-ff62-4f9f-c053-08dd4694bb5f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:57:57.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5NqKRTgithUrNmQ6SX1UuX5yama3y+gX9Dxj19YrLijLtra3WC/RR8SlCSu6YSaB1KEHL4T2en1DuUxI0IKvvMYfVbkSreOflbgNMZ4fos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10170

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.34.1


