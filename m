Return-Path: <linux-media+bounces-50911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59065D33746
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6998430F034F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA4D342CB1;
	Fri, 16 Jan 2026 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pyw1FBO/"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CF340D86;
	Fri, 16 Jan 2026 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580351; cv=fail; b=pVXOaAg4BEQLQ1OifHRTVmPdAAyWXv4FM5wXbz+IfxDzSPZM6osEAjaJ5ySzAlWRTCGrofxWFu1/ZevntSg7/LuPcxb8U0W31GOcFb6jDj0cK7F6ydw/tA3+nh15gHbK9T6HKbSAuL7hFPYaPn2ci5w1CCfokZARmzXTS96f+to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580351; c=relaxed/simple;
	bh=HUtJfZ5UwnVY167yFTUryLb7oW4vhVqma7POuJNTdq8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mbAnY+KKLLgbQcSfXovBHIpm+4+T5JkabGTdjjQyW2vU/tufp31v9zVGG8eVl4InpG569dtGx7LKmgs7KW2CtxIroeKqaU2y2kJHpvVnk25HSder6ktI07d/1E6GkjqKSQxRIbvDRVzanlGRFKvItQzJJp0QJ3RI4LGcs/Oun1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pyw1FBO/; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD3rsS2kQg0Yp6xbw0mf9a8TCrLptvjxlCyhGqymshZO4gp+JCmNKay0i/5eZN2R76H84b7IfNV0IBsRcHbD63lbAG/sfSJX2/E/7P0mjaAJOASuMfFkgc7OXPIkQaRPwH6mqrWvwcOdPW25htztCpvexXVXhW6EzE4LrbeDU2Vqs0z+2t3gh3NredlfIv55Q9ADVKeDy9WqZrln9qoDpg+Ue9ePx2KuFJsYvTu955ToJCCtYoThtEjor21dHG1g+Nbw6GO+oVJx4clBgeBFw8p5kqwlTKx0NjAcenwPoPST0rKZutH6tWfgQmcmCrM8pnM9MYijGGt7ZdNVYT8o7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXO7m7C7aW85x0I8vOEzC/LeMjS7hFhZOXZcN/YC39I=;
 b=egfsOr7mOs1s/CqVhRW85pOI4YaN54JGwyIXrBVLOLO/K2eHsgeWWItBIg2QNELAMxuGpero93TztrQmU4yLmWluLSNrcYDUghzMeFr57NDB8MsfqVAnaHEOqZXjK1Qu1Ka/eFIm7FJMNDWzntJybqv0t28CRVOsyun2Z3YeO4dhD8/bmeHXTRrSbShUSIolHk/zOlPAiP76Y4XZe4A2661hO3qjEvB6MHc/oYvXBvuc8ZZCnyTktOJtzI1LtaYZe661XGzFxVaKahKWXYsM/Y0VRbIn/JAgZlX/Bdqjmc4XV6baGVIp1Ewy5HBN892TI/O0H45a7ByaqNe1WMhj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXO7m7C7aW85x0I8vOEzC/LeMjS7hFhZOXZcN/YC39I=;
 b=Pyw1FBO/WG0rfgEZihVZAoiVm2rH7jd1AIhU5GSisI36S9sM8bUZzQaydm7WZmoB9D8yUicTc/FO9vigZZ/200bM99psEfwhzRlU7gD2zde0TT+SX5K2EeNjVFAknRxa6pcn6wr2/iagb011MYT5DVFZPCFaaRshVhw9lTs9MqJIjxCEX2/M/ZQM/TBQWoO/d3o1jUha/geo9yDcViAKJ38dlE8o8SVTrOzGUrMGdJYle+mdYx0ONATbKLjXtYKrMCeanWUezUk5diW+MXw8FbSrlJ0Md4cbbD478kfYP/VejAMo9deGN1nImo8dwysYGaWtoQyNRLMrUho72pPHMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:18:41 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:18:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:17:59 -0500
Subject: [PATCH RESEND v2 4/5] media: staging: media: imx6-mipi-csi2: use
 guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-stage-csi2-cleanup-v2-4-a56e9cb25196@nxp.com>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580309; l=3875;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HUtJfZ5UwnVY167yFTUryLb7oW4vhVqma7POuJNTdq8=;
 b=JKtP1zFIYmQeB/svNOoupMVUgo/Ai3F8LuUy697ESaPkAGxNXyXyeDhskA5/uR+ytsa4Wqd0U
 F2vaVDGvzDcDROpYaFuT5UQ5+fwJ8VI73jBsD6O0u1hkkP65dwGelvd
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1cc83f-6a3e-4cb8-4ba1-08de551ae9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnJZL3VqUG5uLzR5MGJHbXNYRlJsMEV0Zy9xTjdBWHJYV1A3dkdXOWkyblo1?=
 =?utf-8?B?K0czYzAvZVhMZlQzN2hYOGE0S05tcEZVOVVtbHB3aTdZRFZ5S3NnZ3ZzY3J5?=
 =?utf-8?B?MEJvU2IyTkpiZzdzUXpqVE54RHdGT3YyVit6SVo4Zk5ZN3ZFYVl6UzR4UHFV?=
 =?utf-8?B?VHVlVWtCVWI2aWhNbis4eXBmKzJldFYwaEc3SFVhS3l1VVVGaW1ySkowU1JD?=
 =?utf-8?B?NWlYdHowdGVEYVFZdXY2MU1oTm0yZERUc3BBRDZBTkFGY3VSTWtBWFZ3Z2Mr?=
 =?utf-8?B?T0V2V2Q4VkViMzVlUmJORGNxTWQ0bjBBSXdTM2Q3QVFyV0dpVDhiNkhwbXZZ?=
 =?utf-8?B?TFgzbGpmdnpRb1lodkhzS29YeE03OC9UamxscDJJQnFLM2I2blgwbmdqWHFw?=
 =?utf-8?B?SlU4SkVJYWM3WXpnYld2OVhSSjZvNVBMbVFpQ0NxRmdSYy9PRFRydm9yWnk4?=
 =?utf-8?B?aWd5OUMyNEpZY1IyRDVFRUkyT29Ka3kvenk4MVBDZnJTTEVxMXp1WXpPNEVj?=
 =?utf-8?B?RXNkWFd1TXNUSHBlbC9KWjNjUjRpMkQxK01pV0c0OHRBRTY2QXlNaDE3QSsr?=
 =?utf-8?B?YmxsTzFzdmJLZlM4YXdHWGJ4OFZPNFhsMzkvM2tlUzJSU0hFUmRjbUJ6STlP?=
 =?utf-8?B?TEQzOHlmK0xtTDVtUkRFYkZIbm9CNys1ZGJidDRqTVl6Z0gzNXlVQmRjTWhp?=
 =?utf-8?B?R2FsM0t1QmdmdVh0WGZ0WDlmU0tMbXJ5UHY5cjk3VHE3TEFja2JzMDdSbjlO?=
 =?utf-8?B?S1A3YUtUWFJuWUhjYkduWm02OS83eEZCZXVtN3Q0ay81QzFsL1phK3g0bGtB?=
 =?utf-8?B?OGFoY2dUdjNuZkxuTkNabHdPUHZ4d3prSmxNbWRNL2hzYzZMUk5idHJ6TDBr?=
 =?utf-8?B?R0U4YzUrWHN1UXNialhOdU1renRyQmtsS25KTCttV1hLUWlNSmJUdGsxY2Ns?=
 =?utf-8?B?YkZoNGZ2Tm9KS0hjRXh5dnZJUVZyYVFVNXZVNG9zWllsaVJ1ZzNud3NrSHI5?=
 =?utf-8?B?cmtadG9ENVlwaGNPKzZuVU10WXhqMDVQZVY4TGxKN2xOKy9JdzVHeURDd01j?=
 =?utf-8?B?Uzl2V0dNNW9JbDlwWHpqYWtGYmRIQ2V1RTBmVGlzQXhZTkhScGZmbndBS00y?=
 =?utf-8?B?NjRuYlRweXFHLzc4S0ZENDZpQjRlaE5vS0VoS1hVZ3Jyc3llcnlRVkdiRUVF?=
 =?utf-8?B?Y1c3QWgwUXY3S1VZQVVtanBkMHNFWTVMeGtuTnI2S2hRM2dmOTY0L3N1enVx?=
 =?utf-8?B?enFRaGxlcWUzK0E2ek05dUlDV01jSm1Uai9GZHhuQ3pkbi85ZDM2NzJtYSti?=
 =?utf-8?B?Z1BZQ0hwdjFXWW9JMVNqMWFwNkRhMytTb1dPZXpmZlRmOUFyeC9VWW96alR3?=
 =?utf-8?B?bUVwK1lkRHd6L0d1YkxrVWkvd1lMbmFpYUh0ZEcxUEVIQ2VpRGhrRG95QzNi?=
 =?utf-8?B?WXRQVXpYbGdLM2pQcXZmYjBBUnQ0NnBYN2RrWUJFb2F2OUdhOExuOUlMeXBs?=
 =?utf-8?B?bURhVk9DTmpjTGE4dnZaQ2ZVY01mS3BnWm1ONHQ3R1psSW5sYzJxWlorVUtR?=
 =?utf-8?B?WE5BVDdBZkkyM2Jua2h5WURRU3VENXFnU0RVYk5hTDhETkEyQldjMnhPVGVW?=
 =?utf-8?B?U21Ec0gzS2VVN1ZXQ0E5Njd1elA2SUg1LzczbUJva2UrMndHWEpjQldSTGdU?=
 =?utf-8?B?UFpBcE5LZ1ArRk5KeDFtTDlYUTAyMVZxY3JqOUVSWkxEdUdPdWpQR1dSQTB0?=
 =?utf-8?B?bkRNR0hKK2VER2tRbXhvc2VsNXVwNWlWMTZqbDJ0ZC8yRmFwdkZUQk5VT3Jr?=
 =?utf-8?B?RTNIVHRaUEY1ajZyU2F6QXp3cTZIelU0RG5qMUpZRGJwT00xY1JUSlpmU1Zl?=
 =?utf-8?B?NEJOS0dUbWRKcnR1UzJhT0Q4OEtJQXYyMjBaUW1SYlJYOUFrelVRM3lld2VX?=
 =?utf-8?B?MEpucDM4VUZUSGRQYjloS0VCZ1Z0V2txaUI1VUNZUlVUeTA1YkpsVXR4UU9S?=
 =?utf-8?B?NlpZbVE3a2V6TEpKWGM5V25ZdXlvaVJaTE1wUTR3bWFBbDI3R0FoVFFwWWQv?=
 =?utf-8?B?M0U3SGxpOXNQTTA3Qm9ZMVU4RVpRalM4eVgwV3VnYkI1eThZQkcxREZHaUpL?=
 =?utf-8?B?VE5nQlhWNHNYOFh5K255TkFwY2tzczhKSis5TG9jcUt4dTlJV2lNc2JMYmZj?=
 =?utf-8?Q?QrkpaOL1fzHdNwemoLqKIiA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG9tYUZoNVMwaTVIREVobFU0Y3dUakNEOFpBNFRBc0VZOHdya1JENlc5Zk96?=
 =?utf-8?B?QlE4RGpFNHp2NU85a0d6eEZtankxNlNTRlBsVS9hRzYxaXZ1VTFFa3Zjek8x?=
 =?utf-8?B?MDAvMTlJVllLWlQxRlBKRnZkTldrSlp2MGJ5YkdEM1VKRzNic0dhbHEzQ3Ur?=
 =?utf-8?B?RXY3cjFvQXdNUk9LMnh2MG5UYUZXS0YwOW1xZ1A0czU3SzhyQmx2NHQyVC90?=
 =?utf-8?B?bmFVcTk3SG5id0Z0SlBwV3JDdm41eE5sWTNpRmhyUGQyUEdjUklZckVHWVN6?=
 =?utf-8?B?a09lbHNjNUEwYXluSU54Z3c1c2swa0hCRjN2N0xRY3A2dGFqYjhpWjFKUFA5?=
 =?utf-8?B?L3BFLy9mRWlpaDlISU5FeUhYWFVQZ1JYMFNkMElDR3FtL2wrc1dEZEovMGkw?=
 =?utf-8?B?MTdLeTFPK1RPbGhlL0dQeFpKdnlMakV1VVNQSXFoUWF6aStCYUwydDFUeFp3?=
 =?utf-8?B?SnRFeXNGMDMyazJSOC9PWDRwb2FlQlZpaHVsK0ZqT2RKN0FZbXVxY0lOTnVY?=
 =?utf-8?B?enhvTzN3enFsVDF2TUlrLzF0NzFJT1RYTjdOTHNUM0xNUXppa2Vuc1IrL1hR?=
 =?utf-8?B?OHVLV2o1a2k5cjRaVDdYZmlwdmRXMy8zdElJQzhuOTJOVjZLdGo5bmhZSE9D?=
 =?utf-8?B?bGJZRUluTzI0N2hEaEVoRlRvYjEzR0ZpZ2hoSTlOZnduOHZNR2g3Nnd6SDJW?=
 =?utf-8?B?QTAzdm5Ic1NocVpQaW4zUEgwdU1UU1E0ZlU5Z2R6RGhSZ2N6Mmo0bUJid1d4?=
 =?utf-8?B?RW9tZjZ6bkxvNGE0cjVNZHVhY1ozVElibEFPUklBV241UUNFZm9pY0puRTlx?=
 =?utf-8?B?ZEx5ays2endPNkhqbWxXbHR0NTJOdVAxMUlMYkhIUFErbWZ5b0FmcUhnM0Rn?=
 =?utf-8?B?d0hXcDJWMUxIcWhDZmxWaXhEUFdqazlpM3ZiR25TV2Q3TnBoOVlGbHBGNlc1?=
 =?utf-8?B?OHQ0ZGw3WHZaWG50dnFTM0lYTGM4aS8xcllOc3B6blZ3Vy9DWGRFNDBxNWdD?=
 =?utf-8?B?U2psV0FCMjR5MThGRkZSK0xUUXVxNHFUMkpCT1c0UVRyZXJtMytsRkxpMExa?=
 =?utf-8?B?RHZEblpzNmViRU96ZGM3VnNOejZLNGgzNStsZERCNlM5bUtEcEUrT01VNE9N?=
 =?utf-8?B?bmFWNGJ6TnB3YXcwWkF5TUJFRzJVNjBKVXJ5dkFPME9zRDJ0UE04Vk9PeXRX?=
 =?utf-8?B?bVBTbXJhMGpOeDFIbmlSQjVJbjdPbW5PRk5WNEdMdjQwUEVQVmIxRWNUaDk4?=
 =?utf-8?B?UXhyOG5tS2xhSW5VY2NNa054RllTUW1LZlUxVkRUT2pnOGI3bGl1QU9qZEV4?=
 =?utf-8?B?elpQbnNzWnZBUHlNUnFYVlBrVEVUdlZ1enA4RVkvaFhKUXRuakhZTkFUQjJE?=
 =?utf-8?B?bHVZN2NhUnpnallkaWoxcW94VSsrZEMydUxKMWx3eGhaNVJKMkNLRXdta091?=
 =?utf-8?B?WGlRczlFd3hSWjJMdGI2SzVhNkVJVzVVYkE3ZjlKc3JCWFBqRXQvOFc4ampQ?=
 =?utf-8?B?YS9DQXVuNDh5bzB2TDBMZjB2SC9wSXJ6Uy9Nb05lU1UvMGRkWnlXYzJwN1Fq?=
 =?utf-8?B?RjBWUVcxaW12M2pkdUh0aGJtSkVjYngrNGdvalNIaS9jeUhRUEcvUXhhRjJS?=
 =?utf-8?B?cXVMK3hMU2p2SjFrc1BFKzgzc1VWQ21FR0owUURJUDdRc3h5eXJJamxHTjg1?=
 =?utf-8?B?b0YvcWdXSzY0cERmT04rRlFLbEVHQ3N3cGsvRWtiNmN6Rk0xV0UyMSsrY1V5?=
 =?utf-8?B?THpIVER6azlhZUxQeSt1SUdXdXZYMUhYcFNnVGhreS9Ca1RVc09SMkhsRVZD?=
 =?utf-8?B?ME9GOWhTWmVuR2hCTHdkdlZobjlMUHlUdG9JbzA3L0pRRjZWMjRwU2tkc04y?=
 =?utf-8?B?djhUVmt1UHpTZHRoMXpMcHJ2K0J0bElMcjJYeUJ0czVVcE8ybk1rY0dzUmFr?=
 =?utf-8?B?ZGdqaGdHbTVraE9WVGtpK3ZhSldZNVFsTUdYNWVDN1EyVUViQzFhY2N2dEMy?=
 =?utf-8?B?ejZZcDJSV0c5Y3JQOGl5YzFWazgvWVNDVEEwek1TTFlDcjhGYzQxSXlnT3NC?=
 =?utf-8?B?d1p4MDNsUDFRb1I5OHhESllweHVTNWZObGlzNzJoY0JNODJIWU9TR0NNRHkz?=
 =?utf-8?B?cWtwVDNac25tcEVzZFpwc3drU29rdU5FWlE5Yi9qSVcwMEdkZHZ0MlVHS2ND?=
 =?utf-8?B?Mnk3MXcwbmQzdVBQZmxwMUhLWVAzRHZXcE13UjJCNzlqa3ZldDBYajVObEdw?=
 =?utf-8?B?Wjh1Y0VXMFpTSkYweVhYSmNHbDJvVVNZMUJrZkowajNUU1VWbTdONWlRYUxH?=
 =?utf-8?Q?M8xsrQYEyuQBxhwH/X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1cc83f-6a3e-4cb8-4ba1-08de551ae9d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:18:41.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVfI1u8ecFz808xi0X38whBtAjG4O1c1rqyL8P0Sx/8vqx93UoTrMFz5jI/i1du7zzLJOLL2BcGstp+/OuefRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

Use guard() to simplify mutex locking. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
leave as it without cleanup goto branch because there are two path to
update stream_count.

And it will be replaced soon at

Use new v4l2_subdev_pad_ops.enable_streams(disalbe_stream) replace
deprecated s_stream interface.

https://lore.kernel.org/imx/20250821-95_cam-v3-18-c9286fbb34b9@nxp.com/
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 54 +++++++++++-------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index e1b4b7fb53131ce9515b9441d8fc420e85d3e993..762f19ffd0858c952027afa8e0f36fc87246e1ea 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -412,21 +412,17 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
-	if (!csi2->src_sd) {
-		ret = -EPIPE;
-		goto out;
-	}
+	if (!csi2->src_sd)
+		return -EPIPE;
 
 	for (i = 0; i < CSI2_NUM_SRC_PADS; i++) {
 		if (csi2->sink_linked[i])
 			break;
 	}
-	if (i >= CSI2_NUM_SRC_PADS) {
-		ret = -EPIPE;
-		goto out;
-	}
+	if (i >= CSI2_NUM_SRC_PADS)
+		return -EPIPE;
 
 	/*
 	 * enable/disable streaming only if stream_count is
@@ -441,14 +437,12 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	else
 		csi2_stop(csi2);
 	if (ret)
-		goto out;
+		return ret;
 
 update_count:
 	csi2->stream_count += enable ? 1 : -1;
 	if (csi2->stream_count < 0)
 		csi2->stream_count = 0;
-out:
-	mutex_unlock(&csi2->lock);
 	return ret;
 }
 
@@ -466,32 +460,28 @@ static int csi2_link_setup(struct media_entity *entity,
 
 	remote_sd = media_entity_to_v4l2_subdev(remote->entity);
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->sink_linked[local->index - 1]) {
-				ret = -EBUSY;
-				goto out;
-			}
+			if (csi2->sink_linked[local->index - 1])
+				return -EBUSY;
+
 			csi2->sink_linked[local->index - 1] = true;
 		} else {
 			csi2->sink_linked[local->index - 1] = false;
 		}
 	} else {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->src_sd) {
-				ret = -EBUSY;
-				goto out;
-			}
+			if (csi2->src_sd)
+				return -EBUSY;
+
 			csi2->src_sd = remote_sd;
 		} else {
 			csi2->src_sd = NULL;
 		}
 	}
 
-out:
-	mutex_unlock(&csi2->lock);
 	return ret;
 }
 
@@ -512,14 +502,12 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	sdformat->format = *fmt;
 
-	mutex_unlock(&csi2->lock);
-
 	return 0;
 }
 
@@ -529,17 +517,14 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 {
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
-	int ret = 0;
 
 	if (sdformat->pad >= CSI2_NUM_PADS)
 		return -EINVAL;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
-	if (csi2->stream_count > 0) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (csi2->stream_count > 0)
+		return -EBUSY;
 
 	/* Output pads mirror active input pad, no limits on input pads */
 	if (sdformat->pad != CSI2_SINK_PAD)
@@ -548,9 +533,8 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	*fmt = sdformat->format;
-out:
-	mutex_unlock(&csi2->lock);
-	return ret;
+
+	return 0;
 }
 
 static int csi2_registered(struct v4l2_subdev *sd)

-- 
2.34.1


