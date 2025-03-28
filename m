Return-Path: <linux-media+bounces-28952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D1A74F94
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4CF3B6083
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828A41E32DD;
	Fri, 28 Mar 2025 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BH63io1g"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE271DF257;
	Fri, 28 Mar 2025 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183218; cv=fail; b=gG7rapr+zng2IgEmVZWFjzzgv86rzVDE26/I4jiIzhj1tOO8p7H8Nmd9jz9wzSbldRIjEFHYBXaIuFh53UVc/UTOZr8zSOhD8UKtLxDtQg4B9NZLtCt6l/GAwKCl7sESv0x3hOh6Pj3rz4mBSi1ck0M63XMipd4/ojk0gx3ohnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183218; c=relaxed/simple;
	bh=OjvUSXuetAP9W/XLH4VGDv/JPgCiYom3wlE0TgKKBD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BR92oXgXFc8BkVcGrXSusQAAxl3cickKore2AdHiwHtO60+TTZu5NFW4brdjtqx19OONrI/P/dvnMiMduVU2vuLsZMi5rTnCiPP7wew3m9jm+O1BDxXG/doR3M+a+Up4vwjW8N7ynHm8nD9YnFWDtmbC5jYtVSVqVuhsiD7TZXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BH63io1g; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtFMVDbOZXDuei8Zd8GZc4lzcSggsT/XEzszZ7cuTZtF83tyc+fzuB+RVnzWtger0FTYuK77HnJXpf4qDv+gul8hst9ffXNjP+z+WlFq0IveTNCcrYCMLGok8g9zyJs9Qsk1Fo8hcqL8nuYzKNAoa59AAdE9RLuTncTb46/iIF7ptFDWKH3Ccuv+PSDx1+DosQApCDHDGzV8seA2Cd4B5Yf8pIJ2DBYnd0k3acffhGPmf9DpXBlhoqXy3JmcVH+d6Z7U3+KixjdpU1U5rroygjNHuRf3d3aVTB/msYwGIfAjUlfz3db2aCl8QXgDAzrSXydVM3TBXX+S8031MF6Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v83VJwlOlCmGdyWMlH2uH7VsPqWa8Tui17akM9EzLLc=;
 b=NoOjUJwbi0/n2L/VbuSsYLZlTDocFXT1QwboWn2fxoMDi3RX2IzIa0kNVPn2jpi0QB39vD9BRk3iXiKTdwaXSt9GKDuwhKQCbdQHJ180j1GEcg3WIJ6VDuuZvohN8uTziRs9S3T6EJTqLnPSjTUi2K0pLQw+G5MIeFz7V3CXv/40RVONhqirTAMqSSnTiL4HWZebL0/f6b/IAQru8V4ucJs2Wjo9J4hPpIOFYlBsqAcEMHmKMOMomE8Dj0bBkC7H0Ffu+pObJJfXeBqksoxbH69PNopzXR23IYAjsg7wKIoWXwQwULhgRs8rfDd56mj8fmB+yXJATgR2if01n8c4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v83VJwlOlCmGdyWMlH2uH7VsPqWa8Tui17akM9EzLLc=;
 b=BH63io1gKzT1PS9GVb00s2xHlV6ORCIvHpVBX03d4hmGhx0OT39p5t1p1jkqRkIF+5vaYkWUCD5fiyn1NiFv5lqcOM0n+Hb3o3abnxCd09dnWADXnLVG6cnnN6t1Tnkfgw4rZjqxUoW13k1N4mMMZnAykEmsdlb62Zcft9DKgpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:33:34 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:33:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Date: Fri, 28 Mar 2025 18:29:53 +0100
Message-ID: <20250328173032.423322-18-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 881b8e24-d20e-4658-5839-08dd6e1eaa66
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pScLDhdrAbqFL/9G3TWEKtfCc9mOwhTnW/m+gPU3JO01ORdnhw8GTojpBM+x?=
 =?us-ascii?Q?FTMpBoPcN+95i9E+KeKxfaj3RwU2FoaWuxg7Q+moI0g8ao0chyJ/3ePXGpHo?=
 =?us-ascii?Q?lABM1IEaZTToeSjK9X3faUZjwnecVtJDt0ofpRjSP82XKgQJfA3Sz7/bjtst?=
 =?us-ascii?Q?bnWwd+I00ydcivG3AFN0D8Orp5lzAs6zMXg/kieNtzNb82Yb87FHhrLnP4BE?=
 =?us-ascii?Q?iSYM+Qqm9w1HWm/cOmZ211432hkvVBB7S9AHTuo4iXSbPCBOLZ6LAGAV8Rqu?=
 =?us-ascii?Q?qnkL5KumXsHGDD0mPgBJUjG3ANY3X9iNP7MVKUhtpUAHdKBaSNlSwz3rNugC?=
 =?us-ascii?Q?b7t+Uh9lbW4xnfpCCEr49m589Hffv4sam5Xhpqdh25ByfPJwsAmL2RBb+HXg?=
 =?us-ascii?Q?/NlA0TrRWKDOKd8C4/dgiXD+K/kgMOX8zZObWIE+jmRqN6YAh6Qry6f/hDTi?=
 =?us-ascii?Q?LjV4rfrghqDzBmsmvZZMHpmQqfZl1sPdDMUnw8bkQXeoLiERgdnwxI6PW7lR?=
 =?us-ascii?Q?dzc1a1PZmfWKkvj1/FFE8ksxt5lrSbGZoVn4oX/z57VSTvU9046wBK3F829Z?=
 =?us-ascii?Q?WPQ9Qk+cC6qmAXu7mjqdjcA/Aq9gamQUJktO9wgmywNMvsaV7z2fQFcSHk4i?=
 =?us-ascii?Q?By29C0kxOfQ8gQnM63vv/Y7zdaOAhS8SdmKtp9bauh2Ajrnv8JEh4hVD76nf?=
 =?us-ascii?Q?QTYZW5m3rVWaxMCJ0UtHkc155JKkx6g6NhCWq6AIQveVWrCDoTwBssOhE/Zh?=
 =?us-ascii?Q?LILHbzh9ecjTppc75C4D/U9jBoDr/TNAPVWMC1VFDXb9YmoAkulrBauHQwqn?=
 =?us-ascii?Q?9Sx0tb/I30WyBsP7GAfW49dqawn0Swy6CnV8J7fWOVeq4Z8jhTPYubwv5S+T?=
 =?us-ascii?Q?4aXZ56AeLk/E9RRZMViPNXJhx0Y98v5wXxDOQ8fc4XHlZ6fGkt/e2x42oFdn?=
 =?us-ascii?Q?cNupjj90rEJlzWaPk6AzWcV4p4FHEsENB8qhzWR1S84fuEd4tvuc3x3mWWMc?=
 =?us-ascii?Q?rf2Yf5b2xySMXnhEymL+7imhdkYHzv1KZ/YoJ6bY1DsKcOEwqwaLeHy+//3b?=
 =?us-ascii?Q?l8wZlNV4kMzqzav4A0uRalK7LjsXH/2JCIIFB2oFM6bu4DdWF4YLbMWCWQoI?=
 =?us-ascii?Q?Jq90i4M2ZTe1r8dafwm2B/cqeumyksBaHsvhxXdcLntJvzDCcAmpqBBlbK4y?=
 =?us-ascii?Q?4T1issS+w4rRhfhUkvxYiqSNQIDXZzrMtygkQdIN2Bu4tALpfqcw+atKO4uo?=
 =?us-ascii?Q?FCuO5zbZthrhczTKPDTRiB51EJnQmuiaAXCFr88mRdp6fxLufUrknb18pH7O?=
 =?us-ascii?Q?3H488UCdTLnQSfS4cBf6bCct9mQzBZTb6F1IGsZqfo3m9OcHY6zqe6vu6Iu9?=
 =?us-ascii?Q?SdkVXsXhUosdAUrQ2WzS+CQxAtDxby1pybSpOWhPmceAPKkwMt72JlhDFKPl?=
 =?us-ascii?Q?d9telIZACJH/F8IB+SU3+Eo0gyNI1lwq8tNrZSLFtuU6o+7YNn/hIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pInQbuRwqifybTNlU8PEGJYNfML5GvlHTGeR16TP1QiqD0NdN1dK7SBFXqru?=
 =?us-ascii?Q?zBo4xX6acVdHac6tctZhBT1LD6IwgDqUuVV6hj4vJfc7bn6mBYwnXhYKh8R9?=
 =?us-ascii?Q?kun65hwkdh35w0BO/5mNSMre24fl0/gYQhTHQWyIPSLLo6LcxulLcwPbBBmh?=
 =?us-ascii?Q?g06EpSeWTS12ZLrBi/6Cm5mLwTSd+0/5Mn/EH7NfBT/DcbMVdnW+WXlqSHXc?=
 =?us-ascii?Q?c6L+PZllnoavPz9ZzlGdzSafMQORSX3x8prPTloLYN1+BOyMMAHCwRbLW9Qh?=
 =?us-ascii?Q?+saBAMOivIo++jKJ5T2y9LROcabAjuFHNx7co3P7j9HC5lFSvILLaCelJUGb?=
 =?us-ascii?Q?yFOBw/SigMSk3QH/GAVPJ/FC/mxiBjS774PXkVdgV4mRR+5dokdyOV7j85lU?=
 =?us-ascii?Q?W21CctXsFc1V6t5bczyjqX5VfQhKBp0SLyhU10n75sv1selwxx7FE0WA0YXX?=
 =?us-ascii?Q?If3DOzwvy6Hmjkpq16icMZJZr1osm0HrUC/v2bjeUpx8GiKH97T+NOPuBX1M?=
 =?us-ascii?Q?l4VZ2X4qY4k3bjJlmxNzy6TOf2jNjsGJ9Jc/FdBeCKPaaLjj4Vty9Jg1NxzR?=
 =?us-ascii?Q?0fKGTLvnFpHcP/5LPu28RnOUM+fCaSeZAn7gaGBkzo4AXfLihOskT3Wr1XOT?=
 =?us-ascii?Q?yPC0jYyNaEMSQAKz83QZkEXpxCwKM/j/4R4HewBU78Ya99oIbCtkOLZ1tSGN?=
 =?us-ascii?Q?Rs5chAU0mf/3wD0ImR+sv7ha1KqycbNmN3nYgWuc5jxhh1RdFHUIJXeL6hmB?=
 =?us-ascii?Q?kh+zBj1ZfxgdlTlglV48AZLVbhT8UPcTkEn1zv+GVZxFV4pIN4howzag9Rbf?=
 =?us-ascii?Q?EY9h62zQFTR/Ccna/1l+N3o4ucGeTt25ZKVmpzcHhXhnafc0UA7iGHN7kJlE?=
 =?us-ascii?Q?VZW/pS78Qw7M4aMQGgMYB/y8s4OPNj3NRy2g8jB+ExYBKVj7VvZ6VSUlJOds?=
 =?us-ascii?Q?0ePNMMx2xrj9+tL2rvzRWYNgffEVipJRmGAQnE2bK2Ud3KhKnyADC0oS8Flp?=
 =?us-ascii?Q?nVCcziOjKsjCmmwBR8g9u9SIbr3VBaoG0mxYVKOLCVXgCDfSleJXUnYRW/K6?=
 =?us-ascii?Q?680k8V0pi6SwdOpEofuj+qoEc9PsDkAAirj4xECOM/Cw//KeF15LibuNxh0Q?=
 =?us-ascii?Q?Gue5iaL6lFXQNuPE9tWNkst24Z3dpM+EFJsR1dHtCu42mk2MFwWWN3lAzmC1?=
 =?us-ascii?Q?khRWBp18HoVD8YBMRXDu4X7zUfrCrP0nroPuJ73JI7IoWY1XQT9ZnWRFp3o1?=
 =?us-ascii?Q?6++6CbWtet2NMgF56SYdl7PkjCCDnZFb79mzS1n/6q2H3iGa9Fo6pgN5/OjZ?=
 =?us-ascii?Q?gCCzSV4nS/FOsNyujZIJW2rcahfAv5nx13hHZ79wYUAXiR3f6dqp/ozU6vRw?=
 =?us-ascii?Q?4a9DiKSM3HSohU2JMHhDL2LeaNlut+c0TL5fS1S80kuUncm8ar41ismTy4FK?=
 =?us-ascii?Q?7KryCWT7fUVdmLEixTfaAhxjALHfozLpOfLlKGSHa7k6sGLmrnj1qv/ck115?=
 =?us-ascii?Q?hBvBrm0OYH2TObHKdsBKUpGYZRRkuwdhlkmCzDpsA84sKYXQw8izYerRyrM3?=
 =?us-ascii?Q?v3w38c7dlUmhskkhmApXimWAbzsse8fWDK0aPS7IYqMhyt3v1UnTPJrDkawD?=
 =?us-ascii?Q?XqRDzXBzQsaAUk8iZuwBkAI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881b8e24-d20e-4658-5839-08dd6e1eaa66
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:33:34.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbXtSNd9M80uTAU6q0T4lsdHUU/AwFzfB6BSsjB2GXZuticMJwFIZ7AWkfaer3YIP5bzWTP0/5biAmgOiKtu4CJgjdY9T1kUk+lRRKwb7cAN3cPXZJ+1rc8U2wtJYpv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
the Renesas RZ/G2L SoC, with the following differences:

- Additional registers rzg3e_cru_regs.
- A different irq handler rzg3e_cru_irq.
- A different rzg3e_cru_csi2_setup.
- A different max input width.
- Additional stride register.

Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
and RZ/G3E and related RZ/G3E functions:

 - rzg3e_cru_enable_interrupts()
 - rzg3e_cru_enable_interrupts()
 - rz3e_fifo_empty()
 - rzg3e_cru_csi2_setup()
 - rzg3e_cru_get_current_slot()

Add then support for the RZ/G3E SoC CRU block with the new compatible
string "renesas,r9a09g047-cru".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Use dma_addr_t with buf_addr directly instead of splitting that into
   cru->mem_banks (high and low address) as suggested by LPinchart.
 - Moved and improved stride adjustment into rzg2l_cru_format_align()
   as suggested by LPinchart.
 - Use csi_vc into rzg3e_cru_csi2_setup() instead of cru->svc_channel as
   suggested by LPinchart
 - Added has_stride field to handle soc differences as suggested by LPinchart.

Changes since v3:
 - Fixed kernel test robot warnings from rzg3e_cru_get_current_slot() and
   rzg3e_cru_irq()

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  62 +++++++
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  13 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 171 +++++++++++++++++-
 4 files changed, 270 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3ae0cd83af164..1356be14eda8a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -290,6 +290,12 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
+	cru->buf_addr = devm_kmalloc_array(dev, cru->num_buf,
+					   sizeof(dma_addr_t), GFP_KERNEL);
+	if (!cru->buf_addr)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to init buf addr\n");
+
 	pm_suspend_ignore_children(dev, true);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -321,6 +327,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg3e_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnIE2] = 0x8,
+	[CRUnINTS] = 0xc,
+	[CRUnINTS2] = 0x10,
+	[CRUnRST] = 0x18,
+	[AMnMB1ADDRL] = 0x40,
+	[AMnMB1ADDRH] = 0x44,
+	[AMnMB2ADDRL] = 0x48,
+	[AMnMB2ADDRH] = 0x4c,
+	[AMnMB3ADDRL] = 0x50,
+	[AMnMB3ADDRH] = 0x54,
+	[AMnMB4ADDRL] = 0x58,
+	[AMnMB4ADDRH] = 0x5c,
+	[AMnMB5ADDRL] = 0x60,
+	[AMnMB5ADDRH] = 0x64,
+	[AMnMB6ADDRL] = 0x68,
+	[AMnMB6ADDRH] = 0x6c,
+	[AMnMB7ADDRL] = 0x70,
+	[AMnMB7ADDRH] = 0x74,
+	[AMnMB8ADDRL] = 0x78,
+	[AMnMB8ADDRH] = 0x7c,
+	[AMnMBVALID] = 0x88,
+	[AMnMADRSL] = 0x8c,
+	[AMnMADRSH] = 0x90,
+	[AMnAXIATTR] = 0xec,
+	[AMnFIFOPNTR] = 0xf8,
+	[AMnAXISTP] = 0x110,
+	[AMnAXISTPACK] = 0x114,
+	[AMnIS] = 0x128,
+	[ICnEN] = 0x1f0,
+	[ICnSVCNUM] = 0x1f8,
+	[ICnSVC] = 0x1fc,
+	[ICnIPMC_C0] = 0x200,
+	[ICnMS] = 0x2d8,
+	[ICnDMR] = 0x304,
+};
+
+static const struct rzg2l_cru_info rzg3e_cru_info = {
+	.max_width = 4095,
+	.max_height = 4095,
+	.image_conv = ICnIPMC_C0,
+	.has_stride = true,
+	.regs = rzg3e_cru_regs,
+	.irq_handler = rzg3e_cru_irq,
+	.enable_interrupts = rzg3e_cru_enable_interrupts,
+	.disable_interrupts = rzg3e_cru_disable_interrupts,
+	.fifo_empty = rz3e_fifo_empty,
+	.csi_setup = rzg3e_cru_csi2_setup,
+};
+
 static const u16 rzg2l_cru_regs[] = {
 	[CRUnCTRL] = 0x0,
 	[CRUnIE] = 0x4,
@@ -367,6 +425,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
+	{
+		.compatible = "renesas,r9a09g047-cru",
+		.data = &rzg3e_cru_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-cru",
 		.data = &rzgl2_cru_info,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 86c3202862465..52324b076674b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -14,8 +14,13 @@
 
 #define CRUnIE_EFE			BIT(17)
 
+#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
+#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
+
 #define CRUnINTS_SFS			BIT(16)
 
+#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
+
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
@@ -32,7 +37,14 @@
 #define AMnAXIATTR_AXILEN		(0xf)
 
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
+#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
+#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
+#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
+#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
+
+#define AMnIS_IS_MASK			GENMASK(14, 7)
+#define AMnIS_IS(x)			((x) << 7)
 
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
@@ -40,6 +52,11 @@
 
 #define ICnEN_ICEN			BIT(0)
 
+#define ICnSVC_SVC0(x)			(x)
+#define ICnSVC_SVC1(x)			((x) << 4)
+#define ICnSVC_SVC2(x)			((x) << 8)
+#define ICnSVC_SVC3(x)			((x) << 12)
+
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
@@ -52,7 +69,9 @@
 enum rzg2l_cru_common_regs {
 	CRUnCTRL,	/* CRU Control */
 	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnIE2,	/* CRU Interrupt Enable(2) */
 	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnINTS2,	/* CRU Interrupt Status(2) */
 	CRUnRST, 	/* CRU Reset */
 	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
 	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
@@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
 	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
 	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
 	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnMADRSL,	/* VD Memory Address Lower Status Register */
+	AMnMADRSH,	/* VD Memory Address Higher Status Register */
 	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
 	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
 	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
 	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	AMnIS,		/* Image Stride Setting Register */
 	ICnEN,		/* CRU Image Processing Enable */
+	ICnSVCNUM,	/* CRU SVC Number Register */
+	ICnSVC,		/* CRU VC Select Register */
 	ICnMC,		/* CRU Image Processing Main Control */
+	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
 	ICnMS,		/* CRU Module Status */
 	ICnDMR,		/* CRU Data Output Mode */
 	RZG2L_CRU_MAX_REG,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ccaba5220f1c8..d68d833406865 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -85,6 +85,7 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	bool has_stride;
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
@@ -108,6 +109,8 @@ struct rzg2l_cru_info {
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
+ * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
+ * @buf_addr:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -144,6 +147,9 @@ struct rzg2l_cru_dev {
 	struct v4l2_device v4l2_dev;
 	u8 num_buf;
 
+	u8 svc_channel;
+	dma_addr_t *buf_addr;
+
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -175,6 +181,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
 irqreturn_t rzg2l_cru_irq(int irq, void *data);
+irqreturn_t rzg3e_cru_irq(int irq, void *data);
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
 
@@ -188,10 +195,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc);
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 748a0855b3245..da6d13e80a45a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -31,6 +31,9 @@
 #define RZG2L_CRU_DEFAULT_FIELD		V4L2_FIELD_NONE
 #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
 
+#define RZG2L_CRU_STRIDE_MAX		32640
+#define RZG2L_CRU_STRIDE_ALIGN		128
+
 struct rzg2l_cru_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -184,6 +187,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 	/* Currently, we just use the buffer in 32 bits address */
 	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
 	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
+
+	cru->buf_addr[slot] = addr;
 }
 
 /*
@@ -224,6 +229,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 
 static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	unsigned int slot;
 	u32 amnaxiattr;
 
@@ -236,12 +242,39 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	for (slot = 0; slot < cru->num_buf; slot++)
 		rzg2l_cru_fill_hw_slot(cru, slot);
 
+	if (info->has_stride) {
+		u32 stride = cru->format.bytesperline;
+		u32 amnis;
+
+		stride /= RZG2L_CRU_STRIDE_ALIGN;
+		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
+		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
+	}
+
 	/* Set AXI burst max length to recommended setting */
 	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
 	amnaxiattr |= AMnAXIATTR_AXILEN;
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
+{
+	const struct rzg2l_cru_info *info = cru->info;
+	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
+
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
+
+	/* Set virtual channel CSI2 */
+	icnmc |= ICnMC_VCSEL(csi_vc);
+
+	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
+	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
+			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
+}
+
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc)
@@ -290,6 +323,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
+{
+	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
+	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
+	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
+	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
+		return true;
+
+	return false;
+}
+
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
@@ -401,6 +447,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
+}
+
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnIE2, 0);
+	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+}
+
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
 {
 	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
@@ -423,6 +483,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	if (ret < 0)
 		return ret;
 	csi_vc = ret;
+	cru->svc_channel = csi_vc;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -601,6 +662,107 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
+static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
+{
+	u64 amnmadrs;
+	int slot;
+
+	/*
+	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
+	 * address also latches the address.
+	 *
+	 * AMnMADRSH must be read after AMnMADRSL has been read.
+	 */
+	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
+	amnmadrs |= ((u64)rzg2l_cru_read(cru, AMnMADRSH) << 32);
+
+	/* Ensure amnmadrs is within this buffer range */
+	for (slot = 0; slot < cru->num_buf; slot++)
+		if (amnmadrs >= cru->buf_addr[slot] &&
+		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
+			return slot;
+
+	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
+	return -EINVAL;
+}
+
+irqreturn_t rzg3e_cru_irq(int irq, void *data)
+{
+	struct rzg2l_cru_dev *cru = data;
+	unsigned int handled = 0;
+	unsigned long flags;
+	u32 irq_status;
+	int slot;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
+	if (!irq_status)
+		goto done;
+
+	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
+
+	handled = 1;
+
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+
+	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
+	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
+		dev_dbg(cru->dev, "IRQ while state stopped\n");
+		goto done;
+	}
+
+	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
+		if (irq_status & CRUnINTS2_FSxS(0) ||
+		    irq_status & CRUnINTS2_FSxS(1) ||
+		    irq_status & CRUnINTS2_FSxS(2) ||
+		    irq_status & CRUnINTS2_FSxS(3))
+			dev_dbg(cru->dev, "IRQ while state stopping\n");
+		goto done;
+	}
+
+	slot = rzg3e_cru_get_current_slot(cru);
+	if (slot < 0)
+		goto done;
+
+	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
+	cru->buf_addr[slot] = 0;
+
+	/*
+	 * To hand buffers back in a known order to userspace start
+	 * to capture first from slot 0.
+	 */
+	if (cru->state == RZG2L_CRU_DMA_STARTING) {
+		if (slot != 0) {
+			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
+			goto done;
+		}
+		dev_dbg(cru->dev, "Capture start synced!\n");
+		cru->state = RZG2L_CRU_DMA_RUNNING;
+	}
+
+	/* Capture frame */
+	if (cru->queue_buf[slot]) {
+		cru->queue_buf[slot]->field = cru->format.field;
+		cru->queue_buf[slot]->sequence = cru->sequence;
+		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
+				VB2_BUF_STATE_DONE);
+		cru->queue_buf[slot] = NULL;
+	} else {
+		/* Scratch buffer was used, dropping frame. */
+		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
+	}
+
+	cru->sequence++;
+
+	/* Prepare for next frame */
+	rzg2l_cru_fill_hw_slot(cru, slot);
+
+done:
+	spin_unlock_irqrestore(&cru->qlock, flags);
+	return IRQ_RETVAL(handled);
+}
+
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
@@ -782,7 +944,14 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	pix->bytesperline = pix->width * fmt->bpp;
+	if (info->has_stride) {
+		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
+				   RZG2L_CRU_STRIDE_MAX);
+		pix->bytesperline = round_up(stride, RZG2L_CRU_STRIDE_ALIGN);
+	} else {
+		pix->bytesperline = pix->width * fmt->bpp;
+	}
+
 	pix->sizeimage = pix->bytesperline * pix->height;
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
-- 
2.43.0


