Return-Path: <linux-media+bounces-28936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219DA74F44
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12B4418911B9
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD59B1DE4C8;
	Fri, 28 Mar 2025 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZEXfeugl"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2261DC98A;
	Fri, 28 Mar 2025 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183072; cv=fail; b=CPyBhieKeECKrnwy7hAXM3sKoyunRApYSiKW9IiKmSe+cnEi+LxISaTJInyhQ1t6FqEQ5H5lHosgGFhHHgquWW6qgbiA5IPk1f3eahr6PZS2d/soGljehncswYbeTXWapKBME52j5qoMPFy/2fAOQLBZ8U5gPtOoiQiVhk69A0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183072; c=relaxed/simple;
	bh=GwC/pnvXfePMeOSqvF7zTcSuX9PSb4MHw0m9fpN4+AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fjMKJNQDLZiPkCOIQ+D2Ciuc+B08i5ceqE5y+nQXfWbk4aqG0MleKAYNbarJ6Wvfbp7wKAt9BRKp1U582YTNXpPq4BB8W+CxtbA5hADTuHhlNX4U8DIwkdrAuHvcFty8cISGPiwq3NlQvaJCnfgejLdxlVD5N8YTWTPN1+WCxXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZEXfeugl; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCTt1LRbMeRI6FSQqc1U92NJhb+kF5ucxyDkVTeWy1uyD/NSdOALqJJlXvdHFSF/CiNpCnJSKdtQu+mjTpsOYR4Gs/4+rnYP5Ncq/nOSelNZOSDMGCD4VesYBP9bw7eVC4ELcODb06OILocwkocIoYx9aAr1XuL+4JUKfjlD3bNk1wUZo2X8p9lKfP6xUR38+JnddWOh62hFPDMuWDNaFLsnm0cBiNHap1kqu2pkRiwiHQSwybwECP0EDHhg5upyXIbYukSBPc1NOuM+Ci4mK6WZ6MdKUFSt8LHm8zA8hqKVg9JU/dshP8IuNK/JtvsZalWhs82HDdv06LTuIY337Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+sJ/VKw9i+wYzK6ThZ2MwoL2lHU0JgBemf00RHc+9E=;
 b=KslrR0JaMFIH4MZFDljfb3eIoSzJVtYh3StbQOsaAcFA/J+qo61gfonJ8r1LOsfnBqUWtUgfm1PwhcmMzxW4kr8ylaiA+YoCEJ1rFbGghBd4TELswPvTMUIlQ96RtQwLLKtxPCzzAIW6DFHVc0EyflXHc3X178IOVc+uDLMe0ciTIl0frSyj+/3MxwRwlKZodJNCJFkMrMyMcOCcV+F1xqA/YTG/Z11oaaWC1f8ENpwGxDmZTlnkWvZSG/glE8IZHRkCzyUD/LzJW2AZ+aU0bFuiSaHvW+Xe9lOpURx32osIyB9/u2NY5J5nn+ztSre8ukV6RfmTeu/khQS/Lo0s2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+sJ/VKw9i+wYzK6ThZ2MwoL2lHU0JgBemf00RHc+9E=;
 b=ZEXfeuglJR8aPMelFbUAUS9oyvfCxQPLhUgmkd87yXlXgWFR2TtZYeuk3Kz++pJZ80imRyDCbau9s63YlY3/CVCgoLFrUH7ZmQHyCdGynRDx1YJJtrWuWmg0d0sI03SijJP0VKAnZJHIn6qV46/uwDOXfoAt4YPfMcSE/i82ovc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:04 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:04 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Fri, 28 Mar 2025 18:29:37 +0100
Message-ID: <20250328173032.423322-2-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 65d5c0d6-6266-42e8-ceb7-08dd6e1e510b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j/4HVoycPiWSgI5J7/eX9NV/twDDjOT/fm00Gr+IVRkVcoZfqYOdwU0mKIPr?=
 =?us-ascii?Q?oZCLCcCr7DEfHV3N/SEkZ9x5gjVU2PAKI3i00eo/XqLW1MbwQCzIYZTfqDQ5?=
 =?us-ascii?Q?dHWmmngOUJC3a0MwIDIBCEDArWRxnFGg/9u3C+friVIZjumA0S3p0jcCxpo8?=
 =?us-ascii?Q?uTh7SdkRU52UPK8EHrp92rDiuuYc/4R9ALsPQAqYhQZdK/Mn2z6skeLpHnZW?=
 =?us-ascii?Q?7Nc7tYcgKRHEAB9qEcNzWcZ/ZT4fCsNTGD8RCNDo1jHO9DN7p7enYfjrJEuX?=
 =?us-ascii?Q?AU4X3jcA79Pa4XApf87SxLhCvs5nLfRlUbFe7Aopo/SJDZxMyUDHEtpVL8iQ?=
 =?us-ascii?Q?JADNbKU8aHKLiBwf5Yj+wbosldyWvdGHk5XOCa9ahlufMbjRejWOlUQrFar7?=
 =?us-ascii?Q?SB4oWlwNfpeEIdqoz5Lstxr3Nf9izt1DCyephvJOWnzNEc3AZLriiUM1f/F9?=
 =?us-ascii?Q?L4FhgedJv9W5JRHUaNZxwWkl8cD69lSzwhEq1dMZArshszJClWFWiZyzzoSb?=
 =?us-ascii?Q?ImMC2MU+FQV3wOYg9bsjsG31Vd8YsZ8SugnKM0m19afA0FEEqADwgMoA/01f?=
 =?us-ascii?Q?37vc/S/zu+2HHpCgisqgLniPUG1NmuWVEpQG/WzqK/0YWtQDCw5jGRSWxHMa?=
 =?us-ascii?Q?G8Ee87B0+sAZsNEnewzwOitW+n6XCvU5tMtkj+8cGs3htnaMZIGZdKXCHtfS?=
 =?us-ascii?Q?UWmuly8VUYqkf4Wf33uNZD6ouDuq1oaVd/0sE5zDmViEnjoy4wtMWpUgctfh?=
 =?us-ascii?Q?fbiMfERPD/RVevQui30OTWjZPMxxug9q9dwgXHLZAhYvLpXhnIdYFnAv7Y2c?=
 =?us-ascii?Q?LSxTAtq4WgAFsEKb4Igz7Krc+Yr6B35bGoWq9rKThaclPo1a1qTE4CKGZ1jF?=
 =?us-ascii?Q?j8ESzLTQyTBwH3cPLuK6FJIywiyjHcXr75jQwO2ud6D4Ja6gLKycRletEnfv?=
 =?us-ascii?Q?ORKrjim72nV7F70rUlAQqJ3cJeFW4W55JWKM4FaFI9uLCaSWwzneRbjxWAXZ?=
 =?us-ascii?Q?v4GXKLc4YWowegX8SIQH1mPdPr8Xu+XBk+mHFqiPSsOWd5PqPcahEqDPU3lX?=
 =?us-ascii?Q?D8kuffci1JgFVNwQiLClWJrk5GAI4p6vYcAtQWnj7eOyp8sWrEdCqb1tWC+D?=
 =?us-ascii?Q?v7g3Z4HQtTH1PYuAVBW0wCOYo/iEUKZwhCP1tUH3GKdkvgKXeEgwIvJRlkwR?=
 =?us-ascii?Q?7SUKhs3atr/AwhPW6IRVfzkBMQIjittA6czrtxjD1s1fhtJNpsDBz3mzFCWL?=
 =?us-ascii?Q?BWNSJkxqTsqn4kwOQs3AsQjWUIO1rT2v/QMRv0gcwEbl+HpwQHy7u/VCO01D?=
 =?us-ascii?Q?PwML9kMhj/CdgeFZjp4uDKYC56hugBkki2uBbVINpPkWxIgBHv4IuQUfWmN5?=
 =?us-ascii?Q?1g04+JnHERbXIj9pGxh5UXELwBpOanTGJYFW5Kh02n5MT/ikcBDoSZfuunWk?=
 =?us-ascii?Q?ysC8AOaIoLlZESy9ttsptDdhonvh58zGy+LXYHMIGKspJ/Yd4ZWubQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yjnFqOroB+iqrdhtJj3CGrfEIUhIg2p5UTw9FEjQ0I/0BS+j6UUSsvYyI3hW?=
 =?us-ascii?Q?QdN11sOoNIzf/lG/UPdB9fTKa7/9PtaszUDDb6ieTLFKC1UASJTciqVJcufd?=
 =?us-ascii?Q?rQw6+GprwzfbQfP9bGxK6iQsv9Lhf+9ZAqAeK79kp/TOFuKXa4to42lolrrA?=
 =?us-ascii?Q?zUnhx1TMQ7PxwwK64k2vlzMwHl21140INZ+qr2pWpyU8h/lurNoDBeLjJlH+?=
 =?us-ascii?Q?BeOnDZnxp7s5HXtWRY8OzerfMOw/C3W0/ilePjbYMN4fkg1s1/qmVXsGCDjk?=
 =?us-ascii?Q?bGcGz9TUoagfAC4I4pzmbqINSM/vMBmEYYxsc1PBE5Y/noB3YsKxMVXnsOBJ?=
 =?us-ascii?Q?qheTkfQ97kc1THQJT3xYp5GtBtolNHpPbACfsJcL5LfvCuau4e+2A+szKSZ4?=
 =?us-ascii?Q?+ZIrMzR/16KQlZr9ANyjwq+G2RzDSlqDxvC2LUuSptni2V8etQ1xAoNguyO9?=
 =?us-ascii?Q?3yR0Fh+5MjH4hLf5UpPxj7Zrsg7v8gENH9VgOAA+pBm0rf8+kspYC34tXorR?=
 =?us-ascii?Q?QCsUhkBUhWgXWOdtr3gZ3xWSH0kxLGdMVDz+YyaxFZ6BIwATKfPtYYkWysdl?=
 =?us-ascii?Q?oo5ZM1nY9buoEyhkdmH5xL1B5jwQzyCZTncTq7Q22DiGT0qC2tIvl6HZV9NJ?=
 =?us-ascii?Q?inYAoJMoH+B6J+bfn22qs1bjuOIKgvT+6OaneEoz7YEyV3HfXiN3U97Vodnj?=
 =?us-ascii?Q?NNVVC4ABx8Jh4eVv3aI0CpJhl+DIgfhysJj7yxHtXrl0byO3qKSOdf3F8JLO?=
 =?us-ascii?Q?DOTmnJ4rMl+oYozCTIxp8Y5/MztwEJK/KZwR6q1iMtgS3m0VjQymydQN4GoE?=
 =?us-ascii?Q?Eozj1CCQYYjAURC/bIcf0wdATXf9YXLPMzaEVZRN6ifazc1z1DPMJu6lVLwj?=
 =?us-ascii?Q?AdR+iv1hbQ/GaPrOaoI8AC+HQPkfBmtiA5zU20iFlqer0G176IN4sVh1CG9n?=
 =?us-ascii?Q?KxIwWNr2rtfBZ5xf7QVKy2heuxfap9lfbVndYCO8dc3ZxTpdH36Shjw4pu7j?=
 =?us-ascii?Q?pzqMluW7KykFWio8XQeztNXWVWStnRfAEdLYOgacvHS6kQ4yepfu9Wy4WNsr?=
 =?us-ascii?Q?3qCXQQOj3rULLK50JhOiyVGc+M/Ljk5PxiZoDTdEfzFKPyftBqsBH29Ox/Dr?=
 =?us-ascii?Q?swdSTQUu/qKDzgD/17UPikCOUKqHvJM6lB2CDLoVuDS+SvW6kPotZwswZm/I?=
 =?us-ascii?Q?dkUIanT/gaq0JyE5PSxqje8RVqLDYgqNs3yVZpJwEj3f3Ogww/kyyhzcj9Z4?=
 =?us-ascii?Q?zCFn/8ypN1p8VzYYuAOOE62qIZvnhnyo8ooTOGRrcOgpSqWMioPtf72krWgU?=
 =?us-ascii?Q?YF//pVd4BLju9vQwAWZWIv7nj7jVaDzkp31BHGlTbywC9U3mIohTc6o2kR4w?=
 =?us-ascii?Q?4QFtCtM1Of4+0fHZO2zC3WzxBd6rxZ2l9GRQdjHUqkptt/kL/y5PE4dYWsUN?=
 =?us-ascii?Q?85/lqt2+H02wkn5sTN0xbo1o7KefSUC3dB8XfCsA9vmyM2o5kHZ0Eu7qgcK8?=
 =?us-ascii?Q?Nuvm7XVSVig2iuy9NzRcwepu9fvPFFYiBbzGYHbYiUdq/WTKJEAnKnG1f3I6?=
 =?us-ascii?Q?k2Rx2KEy0Rs0bVEkoNU5xTbuwyHBdIBPRX6C6Dz9003TdO9D7BlJarTKWqhl?=
 =?us-ascii?Q?mzwYKOh6YqPqV21MYk7SpoM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d5c0d6-6266-42e8-ceb7-08dd6e1e510b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:04.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 878pyiyFCKMf8yJ5kRii+vwwrC8oZyFee8Iu9Xtb3H/+NkG2ZW2TavZ8UxtPhuccnIXZ1yOiiMdprXqD4Cg/Hj/tuajGf+mrqKF2l2pey8ZsTlU0xtR4PWq3ZHVvQ1yJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
found on the Renesas RZ/G2L SoC, with the following differences:
- A different D-PHY
- Additional registers for the MIPI CSI-2 link
- Only two clocks

Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Dropped empty line as suggested by LPinchart
 - Fixed minItems into else conditional block as suggested by RHerring

Changes since v2:
 - Collected tags
 - Fixed CRU_CMN_RSTB description as suggested by LPinchart

Changes since v3:
 - Fixed CRU_CMN_RSTB description as suggested by GUytterhoeven

 .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5bb..1f9ee37584b34 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -17,12 +17,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-csi2       # RZ/G2UL
-          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
-          - renesas,r9a07g054-csi2       # RZ/V2L
-      - const: renesas,rzg2l-csi2
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-csi2 # RZ/G2UL
+              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
+              - renesas,r9a07g054-csi2 # RZ/V2L
+          - const: renesas,rzg2l-csi2
+      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -31,16 +33,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Internal clock for connecting CRU and MIPI
-      - description: CRU Main clock
-      - description: CRU Register access clock
+    oneOf:
+      - items:
+          - description: Internal clock for connecting CRU and MIPI
+          - description: CRU Main clock
+          - description: CRU Register access clock
+      - items:
+          - description: CRU Main clock
+          - description: CRU Register access clock
 
   clock-names:
-    items:
-      - const: system
-      - const: video
-      - const: apb
+    oneOf:
+      - items:
+          - const: system
+          - const: video
+          - const: apb
+      - items:
+          - const: video
+          - const: apb
 
   power-domains:
     maxItems: 1
@@ -48,7 +58,7 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description: D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)
 
   reset-names:
     items:
@@ -101,6 +111,25 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-csi2
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


