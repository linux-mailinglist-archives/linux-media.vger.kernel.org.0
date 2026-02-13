Return-Path: <linux-media+bounces-52783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDfoHkqJj2nURQEAu9opvQ
	(envelope-from <linux-media+bounces-52783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:27:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70B139675
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC5CC315BB45
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D2F28640F;
	Fri, 13 Feb 2026 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l4U9SvvS"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1579283FEF;
	Fri, 13 Feb 2026 20:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014361; cv=fail; b=K5idkWCV0PjnS6XfJqUNcGfHee1GYmViJIvPKG6KEvpPPzcTNOHGnf9OdCvx8U0JYomZGwQvXbVJXMCCRxT0b+eVJ13TVheNYWIkQzeV75wFTNSOCrCfE6a8TRplHoUVnK3QftmVkJW/QonZEeiaoRfRwKa6+RqsuTCSemd331s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014361; c=relaxed/simple;
	bh=1nDMOwGvKHRFOAowP546pcxiM1/onap593IVB5p68pQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qu6NzBD6iLuq2Xt+MShswI88e1Z+3MB1ADtLoLR1NEsW9i6gM/PJjKH9YSJHgLWXvAv13EPo/pOj8fNmYVXm5gD5vRdBS5IyfdZpBKTQmMsiKxQYeWNwApFYXNt5dgZvXFQPZaJsvlAQzlLLmuLu0iuFJajNh+3UOBP0K5MLO0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l4U9SvvS; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InRoQOlqh6G8MgwWhK3Lk+eZTEmHdYZkiVDqHOueanEje1BDy72HwPZiCq9jkOd6pZnMuULQCOLzPCcDX8TwBeQrPgBNXBCUJru1+14lnMPb1putOQc2z0Dl9k1gVlXCsoCcBIXB9t6lapTzFO1JFrIvSLIG7pp4E5M0LfwxVGtOWNjagnxCn3uURGKNUYrJ994fDRb+80wEa/8YA4JKF9ZknBWH5l/oXCv28SJtlCXZNHM70EiENUgICNeoIoX6h0U/bLfo3i3erZQRr4Fc6ol5TiaMhqK5V7Uu1bdAoPGsZ6G+J3jbnxUQwMh67CbyORf+FhcTEcS+n/IwTHgd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsuPNlqsfS5nFWi1k2H+s544aqsfajYN12tBDR/KrSk=;
 b=ypHC4FVZaADLQLcbqiHzWv44HZ+ZtD+AnVfYX3T+OcNLZuMfhTOeLBLX2tOFsw8zXYdOmXxCCFSb6yZ/ZBuFkWhILY80X0lBuQDoP9UOe0zh/vvoXZ0iHKVzaxSd8JM+T3r94JMi2KrmNairOMielG7QB61ta/m/IdYSaBoIbRMJ97QLC+VSqhdIijvK3lFAdLhy7irDhqi7RKbdB28aTpIYElslkkBkchJtyUUmE2yhdhZ2hJkeXcOPOQmQA5RS6RYoo+CKFaljDrGHMGbBPcPL1hTQwB+isErIJK1DXD/0Q3rcPTBUKGVejifTnUg1uOBLCOGwq1nws7GnnQy91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsuPNlqsfS5nFWi1k2H+s544aqsfajYN12tBDR/KrSk=;
 b=l4U9SvvSUCeudUGEOu6F0QDseBZHxlEUfMpUehKpdkitr0q4ay21fsBdVJ5j+VGSkA+TctvEJ0l9tVeVWimRGo2saOzEdmZnZ9W4LXECn6NxQ5BX3UFNkDJZiHoHQcEyAH9f6APclRi3l1ykGH7MKr2c3l/qXz3zJqPabmgSFYH4Zn+ItsHz2dL9IPWn5B5mc7poHUzR3BA0cc9ImBLQMDSboxYkxFZjg7GADG7QpyraDgW6QFHv7NFH67AteXj0f4wj1m+3jlWeNMBjf1JhNgTiwcKWvKoY/IfaFZZldxZnq889acCJDgznhB5m0i0Erz9wblCQuBu9P3HuE7gfGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:25:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:25:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 15:25:12 -0500
Subject: [PATCH v2 3/6] media: synopsys: csi2rx: implement
 .get_frame_desc() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-imx93-dw-csi2-v2-3-8be6039f44c6@nxp.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=2179;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1nDMOwGvKHRFOAowP546pcxiM1/onap593IVB5p68pQ=;
 b=Q0wlWRofmpArmqdNKGJXDMdoM/8PRPG3jid3OppWh51uk41sz0/HmEveEa+YdHeHaC/Zethum
 HLZ2SDMWEhbBf5nqwyzEmFDBsrlPczEoBAPJ95B88ebSKeQV7NWQsHQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 92539388-3c3b-4457-3491-08de6b3e1558
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T3Zla2Jqd054cTJvNFdSaW9IRmZpcHhhUVBUTnBjNnpNS2p5UGNpanZKRFVT?=
 =?utf-8?B?ZHpMaWhiVVExT20vQ1FCSjRscUM3WTZadGE3MTRnWlRnb2NKZjBYc0ZqL2FB?=
 =?utf-8?B?K0xiWWRTb2oydnY2SWsvNlQ3T1ZVOXFsTllaZGZ2RTdkZlpBTDQ1Uk9KZVor?=
 =?utf-8?B?TUVjTWZGbTBBbkFnOVRnbjFTU1pGQWNPNlVjakxjd3NJamtaK3haMWZWaHR6?=
 =?utf-8?B?QThlTXVDeHQ2Z291MFcyOHltbjk4WDJIZHZ4a2xnTFlUbnlzRHduM1BaUGVH?=
 =?utf-8?B?dGlWSVJENHB3cFQ0TzJJVjhTNXBuNzFVYUU0SXRBMlhIT1hDNlZodS9QUjll?=
 =?utf-8?B?V1doaFZQZFVkQmpndE53QkdUQStseWs3MWJEeDA3NVBlQ1p1VkQyS1pkY2lH?=
 =?utf-8?B?OUZEc1gzWm9RZkpabHpqV25tWGxtazhsVVZnaTFzZ082L29jU3lwYTVmQlZi?=
 =?utf-8?B?dkszd2trWm44R1dmdkZEaUJwQlNWdHpUYXNpVnR3UEQwS25GS0lZLy8zRitC?=
 =?utf-8?B?cGZibnBPYnJQTkYxZFRqQXR6MUVKYnl3bFhaeTNoNHA0bEluUEM0L2tsWHJk?=
 =?utf-8?B?UEw2RHZpTEUwOFZtTGV5OTR2Y2VHbjZqMWpnSHJVejNNSEs0SS9hbEJWUXB6?=
 =?utf-8?B?VC9mQk1LZGNndzdyV0FuZzRKU25BR3h3TXZEdzhJUG5rTVd6VjJXMWo4R0Z0?=
 =?utf-8?B?V2RXMG9WeEpqRlZBYUhSdEtUdTJYRTVKLzJtellURUhHaVFIa2k5dE1ReS9n?=
 =?utf-8?B?eDhNOWNaQWE2NFNJdWlEVEVNTlkyTVorSUpuUmNWbjNRV1hRY2lUYlorSXNo?=
 =?utf-8?B?QlVDdVZnSjB1V0lIcFdEK09ZU0x4QkJsMXhUNGtwOVdvNEI3ejVSNklBVlBl?=
 =?utf-8?B?U2lyMHFlREZxR2lIU2ZUMjdmaWhuYTlKQ05qYnp4MEtWczVVbHNCZGdhVy8z?=
 =?utf-8?B?TGNYZWN5M0tHQmVFNW9XdndXNTFQQmp6Q05iTlNqWHg0RU9iTDZJQzR3MDd2?=
 =?utf-8?B?N2FUVy9RRk1ZVVJ2dzA4a1VMRnhhMTJIdnRzY2w2d0dWZnJiSkNIU2kzMHVt?=
 =?utf-8?B?YnNGdDlYdVpiRktKQUN5aTg0Tmc0VUJWS0s2SFF4LzNIZUNmdjlnSnM2cW9o?=
 =?utf-8?B?VVZmU1RhU2ZKMVR5K2drNG4wVmd2aEE4V1R4VnZDRHNHS2YxRHdJQjJYN2V4?=
 =?utf-8?B?cVNFS0lPNTJLTnhzV05TcVRBd3BBbURQSUI0VW1nYmtZRVZIdndMM2lmNW9m?=
 =?utf-8?B?c1VqdEhJVThZWkpGUi84STZKWnRmOGkzekN1OGxjWm9US1JLN0dTbWx2c1Er?=
 =?utf-8?B?NWdSWVlGc0pPRU5lQUZMYTJPcGNPKzJBajlkcVNwY3ZHcmFJMEhpcDRHMW5o?=
 =?utf-8?B?UFl4T0RtVEZkamJyYTFlSGhFZm5UdnZ1UmFwaGs2TWRHajRhZlhOeEE3ODU4?=
 =?utf-8?B?WUoyVUJYcjBVMUhFRlI1dStlZGlqM041ZFF6Wm9TRzhRdUhoSkY5MVZPT3du?=
 =?utf-8?B?Z3d5d0haUmJVSjJJUkthalpGQWNSdXBpV1M0aVJlcGNiR1NXOXZMZE1yRit3?=
 =?utf-8?B?YVU1cC81d0FnWjhSc3JVazJnTmVoeUhDVWw0LzZFYVZ0eWNEdlR3NGduckpR?=
 =?utf-8?B?ZHNRUXozK0paZjdWNDhURUpEZXNpUUc2Nmp4TFZKQ2ZSb0VsQjFuUHNnU2xS?=
 =?utf-8?B?WEVPbjFYZnlwaFBzdDlIMUJzdStNeGZseklOU1NiUE10cFZKWDlWVVBENFdK?=
 =?utf-8?B?T29xcnRQZTFyUkh4UFZoTGY1OHNxSGtObldzcjdxU0YzaGE1WlkraTY4WnlJ?=
 =?utf-8?B?S2owNUxWSTN5aW5MdzNMZlJXaUlCa25xenJtZGVyOVpBNjlxOENZaE53ekYv?=
 =?utf-8?B?TC9NRk40dzJIRXBwSHJPMjY0UUxVUFNkd3QvNm5YZWd6UUplSmxteTJobndx?=
 =?utf-8?B?djgyWVRVZ3dKeHZJMkw1N0JDWFlTeGE3K2JRM056TW5EOG5YNmh5MXk3NHVS?=
 =?utf-8?B?NkkrMVA0R2pSNWoxWGhTSkNOVFFCdXhuT1RHcFc1QVRNam1zeEkxZ3BXRWpx?=
 =?utf-8?B?UW5IYVp0eWt3RndVakJaRm1SSzkvTGZ0S29wNXA3bG5hWk9iaFViWE9OVjJI?=
 =?utf-8?B?QVFmNEVBazRaZjVqcVVJelZhekJucjMyMVpBT2ttQnlXNDI3NUo3bG1CUEJu?=
 =?utf-8?Q?JSh1HIOM/QMzKWrqxr96Uhw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U3ZwYWpWTUdLNU5MU05RVkNKalEyWnJUclhmSHdkVSs4RXpadEZ0amJHWDFt?=
 =?utf-8?B?elBPb0RRTkNLNmk3MUFsUWh1MmQ5aFNySUlBbXBZa1ZxdExBNVVOSkNqSm1Y?=
 =?utf-8?B?dFMzTmwrd0o0cXJobXFYNE1ET1RBRTYwTzZWdGJKVk5OOXBHWkl6bVFXRGdj?=
 =?utf-8?B?bWUva1poc1pla3I2R2g0MHMzMWFPWFpham9tdGl2c2JFZ1FCd2N1VEdGbW1G?=
 =?utf-8?B?SHc3R1BQRFlMeEJIQ0puZW00M1VxU0FyUyswczBEOGFVaFlSaHY5b1M3L3pG?=
 =?utf-8?B?cmVoOFpCMk92amgvbktTOFlxekhGNTZPYjBoblVvbnExVkdPVmh0TTJwaGly?=
 =?utf-8?B?a1BtU0xDcEVyNEF2TzdqM0ROMXhoRHU0ZVBJekVzSDRKajcxS2pCWU1jUXJE?=
 =?utf-8?B?bm1Kd2tzaW9KMlRBc0lkUk5iSmxjSm5CUlFtWHAxOGdBRnQxSDVWZ1dJTVVk?=
 =?utf-8?B?endFWFJvNnJQMXZVODJIdVdSYmlONnF0MlFLRlhscCtmbzBSckVLblFFeUo3?=
 =?utf-8?B?SDBXSE93ZXZNcWVZK0k5SDVTK0FVd3cwcmxXUnFwckNYNjU1UEt1cjlMMWxK?=
 =?utf-8?B?NW1nZ2x4M1duR2h2ZlcwMi9IZ0hycEN1R2JmRjMzNEt3bFdaSG9KSStLMkNP?=
 =?utf-8?B?eVZwQk9JQTBuVi9PdDlrOWpNMWZQSWY0MTlwZmpVNGVyMVpuOEg5ZXkwN0lH?=
 =?utf-8?B?Y3lQNGtwQit2NmR0UHg2YmpoTTNCekxNbHk2ZktBVVVFMDF1elk5ZCtGdTl3?=
 =?utf-8?B?emQ2Ty9xeXBJQTNxd3N0S282TzM5L3Mrd0NFY2U4WVI2YWVwTzhaZmo0aXRJ?=
 =?utf-8?B?QTNUWXM3Y0VwSkVPQ2FkTS9FSU1YWm5yL3VCMnlMQjltdTBGRkcyWDg1VXlW?=
 =?utf-8?B?UnBIa2M0ME9wUUxqakFLdlBSck4yd2liZGJaU293L3YvQVZIcWtNS1ZpRy8w?=
 =?utf-8?B?WXFudUMzWVBxVUZlY2tRS3dDM1RuOEYveXBRRk5YM2ptVS9iQzRrV2JrZjA4?=
 =?utf-8?B?UFFJQVR1Uy9zSm00d1NVTW1raDdjcGZxazNCaThLWnA4aWlnLy8yUzBHcWdD?=
 =?utf-8?B?L1FvbDh4VysvdWV5bGo5R2p4WEs2dUxYdVZzYWZXMkM0Z2dKL2g0TzJCL2dZ?=
 =?utf-8?B?MnRJS0ZWUFhKSXZaczhCTXV0NjdZcGFjcE0zM1JhUWVZdGtkSWhWN2VjbnZM?=
 =?utf-8?B?N3BORXQ4UnFkWWpIcFJWZ1B2dVA2aHNhMU4wanBETmxZSlRJQ1E4aTZicTBl?=
 =?utf-8?B?OFBzZFVwSjlTenBjM2xrM1lpRTJ2bFdlQkxmdVZwUEhWTnZQK1JScUk5aUU2?=
 =?utf-8?B?dFBGYUxHYlNRZzBNNGxxVzJjdTVlNGpUd3JrM0pTQjB2bnpBcXpERnNZSE5C?=
 =?utf-8?B?bjZKVkNtMStNUTJrcGV5YUVPUTZ1cDlkL0tPcFgrTi9veVAxN0xBSmVLSVFT?=
 =?utf-8?B?TUp2WURPUWZrRmJkZ3FIUXlqdkxhRmFMekcweEllaCtCeEoraUw5bTR4ZSsr?=
 =?utf-8?B?R0tjUXJEOTg2eUU0RTRZc1d4NUwyWmlXVHJWTUFIcmVvb3BvU09OdGFSTStZ?=
 =?utf-8?B?S1djUi9TNWZVeEpoR3N4WmdvcmduTnN4cnpDZSt1N2ZrRnFSbjBMaWU2M0hs?=
 =?utf-8?B?bEJDUk5UV29MOHc1QzJFNFVqMXk0TnFWUWQ5MHdTR3VlekRNSGhFSlJCejVM?=
 =?utf-8?B?aWptbkhzWUxiN1NyZ3R3em1WaVg1VURrSHNCUXFMdGRhQlZrQlJaTnZYN3lH?=
 =?utf-8?B?bEdybTdlRGwxNWR0Rk9udHowOUhlR3RnNXFLRlR1a09HeDBhMVFydlVaS0tI?=
 =?utf-8?B?UFNyYWNQZk5SM2JubnJ4bVNEMjR3ZXFmWWN6TFcyd1ZIN1FpOTlCWDdoanZq?=
 =?utf-8?B?YThxMzlJZWY5YVlmdjRnR28xdlJaa3JQeGYvYU1tM0g3YlN0TFRXYmNlVm12?=
 =?utf-8?B?YVdtSjdoeTBnTGFBZGdLSDdPNmdSRmNuRGdPNTVIOTl0UXFmMnhib2YveXR0?=
 =?utf-8?B?eU52UnJJOFRsdmZKRDVqTXl1bTVjdk0rVGFMMmNXWk9HdzVGSENDdkVZd0NK?=
 =?utf-8?B?SFE0OTFjdmp0RXdYdHBnb2FrdXNuU3gvWlFLREIrUVB5Z2o4a0tNenhSemlv?=
 =?utf-8?B?WkJSTTFrR0gxc2ZLQk5PcW5mZzlWNVRMSHcvcUNpb250cjc3d1JUb2RLRFBQ?=
 =?utf-8?B?bk13cEh1VnhUTkp1L3Q4UVBVSE5YbEd3STRBWVkrWDE3K3RqNWtMUld3a09X?=
 =?utf-8?B?Nkx0di9wVitYZ1FRVjhxeVB4ZkpCaVlKMnlPbzJWTCt5N0RTWlJwRnpWdWM5?=
 =?utf-8?Q?Rl5TuKKTCs+5IV0v7Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92539388-3c3b-4457-3491-08de6b3e1558
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:25:52.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkXsVI51uTypFofTaH0//ZytwBWtWX/zNeN5uLt9nzx2Jx/7Xz0cGBSHtAFj/92DfgIO4yGZ58fduKKMRAQskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52783-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: CB70B139675
X-Rspamd-Action: no action

Implement the .get_frame_desc() callback to fetch information from the
remote endpoint.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add csi2rx in subject
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f03fe01280013bf9a832433c6b06dab691bf8f4c..a6d251ca5ad14c5138a6fd0202a970460e64c68f 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -68,6 +68,8 @@ struct dw_mipi_csi2rx_device {
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev sd;
 
+	struct v4l2_subdev *remote_source;
+
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
 };
@@ -429,10 +431,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int
+dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			      struct v4l2_mbus_frame_desc *fd)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+	struct media_pad *remote_pad;
+
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
+		return PTR_ERR(remote_pad);
+	}
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
+	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,
@@ -485,6 +508,8 @@ static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	csi2->remote_source = sd;
+
 	return 0;
 }
 

-- 
2.43.0


