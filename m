Return-Path: <linux-media+bounces-20981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514A9BDEB1
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C791C231EE
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6218192B6B;
	Wed,  6 Nov 2024 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lxtTDeTr"
X-Original-To: linux-media@vger.Kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36191192B67
	for <linux-media@vger.Kernel.org>; Wed,  6 Nov 2024 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873828; cv=fail; b=nlrxb3DLQr99FOjllJEZmwGxooTvGS6I0Y/Azj4mIdjQYK+oC1BZ158KPPDrfRctlFCwIFWHvmd/5XzUDG9BNl/RIK1VKi9Qc9OmSbRpsTvVXyxP20hhYVMMR3/6c7R/54WoeFM49evSFKBN24+2BbYR0MdlExxsHZt1cV6WjnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873828; c=relaxed/simple;
	bh=CxaQanWWHqPh+0YZKNWeOtN/lcgZ7RAeg/2MZuNpQfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J4N1hbdm0paI0mM5BvfuQXQb1yOtCVcgT7OTMdMtJvhXosL51LX1oNHV+LRv9kvED3UvdiMQJ1lNTScebv9924G39qIIoTWP/A5k6xCDBzRAT5YyhRbVZHEluiaV5ji82aRPYXXQ3uswmzi8nmcWPmUPCGgqTIhF1/me/z7WBEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lxtTDeTr; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RE7tIwnRJtya+bBhJXxqmOKAJLR4Udg4/KkzzhZnRwmw5jxXjDHyR5wrzaVkp+UU0NmobTWJSNxNwMpApRzm0f+G9ptVRzKnXX7A0hZtzK3IxJMBjmiAd1qOo6kxxvm6YcIqYtJKOTBs2kFGHWuMFD6hEkxTqcqaLY/qj4sfDEQUYerWfsPG3w7NfFhj1ibTV0//BtOp0uRGa0d/+OBI1p18f0l+sgbdRqspWHH9bWIwykKJtIm+ZFmZE/uh/LhFu9+fiCAA7u/2z1HlAxWNA9xz6jFpUi9kx4HqQxM1MiaKezxRMZDnwYj6hVd/WuShYbiuAtJb69QtjM41GR0igg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMPuHhpVoXB+h/UkOMc6+e8Pzz1ob3RGYx4PvRYfeug=;
 b=gtKeSRNSmuc6qRh7fZyS3wb5pJW9ED23oa7506C0xxRH8nvWisp6byuuh+c+ryC72cEzNwTmEGR4Kv7DscpGD3oUfQPGUmhv2ULysZZmO1AnNQSWmvc8uP5xa3MqQ5R5u0IgIze9hpHn5URcF+dVHMUFuzNzySF/stlQwV5BMCkXSI7JtRJUU0b7iPUFsDdYAoXR9qhE0L3+kVnY/v07eLGg84x7OlgJOeKCNn1cVU3vERWrSdg/EbNqnvnRyUD4nVLxR4KoAN5J8GuJs+RDy3dHvUvU9m41IjOebo6QCnWyb3E115qYWS9kShhTCTVsMYXiPcREIO1MbNpf1OFViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMPuHhpVoXB+h/UkOMc6+e8Pzz1ob3RGYx4PvRYfeug=;
 b=lxtTDeTrr7zZnnV0Hwg0BerviWL1V5ELAtFEQ0CczRtJHG2bvBvVdKI9sL9Bj0dHc9xkyya8fDkrDo1YSqSY/dC2ux+QdAbeoIsmY5oN7naLJ01yYvwNxaFRoOo5yEN7dsTEj3N8c9z+w8C6och8PdtgE8tawchVwmOhfkvrp6VEyHBXZd+BK/fa+Yo5GjJYyr+tXx1E4ysflLYNIpWZI4nWlaOifDhoQ3u8kLNwz0DWjO+YdxfcZlkwppPlqXItg6Si6yp/SnOGKNLt9gdme7N6+ksyf6/xSw23N33tSc7h4ZWO3ESpleVQe0fdWsjYTjoIi0VgE+DiJ3w5iznRsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 06:17:02 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:17:02 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v3 4/4] v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL
Date: Wed,  6 Nov 2024 15:15:37 +0900
Message-ID: <20241106061537.211002-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106061537.211002-1-ming.qian@oss.nxp.com>
References: <20241106061537.211002-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b716557-9aeb-42aa-5283-08dcfe2aa0fb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?wNSLozu3r8Ch5AFAMf7Z1vTbLMnpc07/wlnDSY5Br0M0nTRiHa/lTOLrMGti?=
 =?us-ascii?Q?6xt2jkg6/dv2BG2Wg99qlCDSo+q80wYrllpBMgbF2oULJdqWRyC+on1CZnNA?=
 =?us-ascii?Q?NxPwpkntpo9Oipr64vrYVzxwbhbIhs86XRJ8YBVqnyK/zdbUAyRu/GCoZuF3?=
 =?us-ascii?Q?9oz63omYyJGhpU7nm+PCSn8rLV7RctF1bjbhovcMsEW+d8ONTm7ZN03AG8wp?=
 =?us-ascii?Q?BHzFwijkVSHryMZ5Ro7yjImVUgsGUxhhjay0hljliw3ohXTjFwT5DOBHlonv?=
 =?us-ascii?Q?fvcQpvh5mkmwahhK0OgD5P09Od3G3+WqG0Na42j7FJqiDrk+zVAFS+C4EK8c?=
 =?us-ascii?Q?0+k3AMVGacTt6X6nwyoyoAu5ubCLw7a/PCdyHC1YMzNCkzgtAxXSqXgjbQco?=
 =?us-ascii?Q?EQAUcSTKWZx/L3jaHBo5KiyFMaCv/Oi0GefeIaooJnPBYGcbJj5OH8eF+Y+m?=
 =?us-ascii?Q?ifmSwg7SBOWC+NCypWADKO5/d+JJh50KMRfoj0PhosD3oga4KQysI724COz2?=
 =?us-ascii?Q?wZpApZEq014IxhyExqgb06WIJzsro+Se8npA2wlyzcuH3CjZVweZLCINxZD+?=
 =?us-ascii?Q?FvOZbAoQOSXgdlXwyVz1OOK3PGTI+M3Wg4PjcwQvXEiknDeZ5xRa4oeENox6?=
 =?us-ascii?Q?khOh2X0EcS4imUW4y7dKDtzSEThVLao/YcrNf/Yx+bOvU/qAlZHL5V/vCptU?=
 =?us-ascii?Q?EkBXti31qwjgW5DHR/sg4JWqDgmDN8pN0vWHpsOSmsQyQABvGMzVMZHoZauh?=
 =?us-ascii?Q?BNZTx61g2JjQ45ncHsBJI+G/Xq4Ot9AONQloDkmd0wifFsugidXfEwanaLTG?=
 =?us-ascii?Q?WQymXsi98FwnBeeAuOCSc7CzaFyx37L7Ur/JQvTLDStjn80ka6im9re5NTCu?=
 =?us-ascii?Q?4uBL86KTdhNJ8Y849iZBTtbjyyUK3u9PxqxL9g12+y/QKNzZfCOerZ6jb6+T?=
 =?us-ascii?Q?sph0m7BoFzbrMfnILPDIhV0ia4KdUbHRGaJvJ8IPA5BurZRpKV81mXYOyIkY?=
 =?us-ascii?Q?UuQWYhSnrRzTO3JeOki3T0QckN/iSH88g3/2gh8KFo0u3lxaE7ORj5YHutr2?=
 =?us-ascii?Q?KchaacffoHlO7DmTJnqwpXkoG8lAQdSvhA1Kn9MRga4WxSwLHPtqNb1Rdu4q?=
 =?us-ascii?Q?xakySPGcJ6KvO8EdO2WEXJ8wUN6GIqql/ntPJVjJupmdDtDzN5LOfgXuHnGO?=
 =?us-ascii?Q?5F50YbIexvcfdyhn9NGws+0RjEa0kV4+RAukV+gv2NzkafOR+5aaXRcbkQbe?=
 =?us-ascii?Q?lbsd5J7dAhCl8K6vVDwbtmp4WDKYTrszyp2wkpaek/a5HaIplVvAgJv9G1PG?=
 =?us-ascii?Q?0F2UZJXxyR9hB0uT4H4kqCb7PkF0GLkVrye9s+w2/P7KxRICUjSdeD6TQNiO?=
 =?us-ascii?Q?PLdZveI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ybePUDx8ZTSJlGe6JuURVOgrH6XZB/p6OJ9e59Terwer3jAgZiaDj6q0SnlA?=
 =?us-ascii?Q?jG/RTaAM4L8570N31B+VElkGyhElza9C606BMgcCwoJceUv92p3z7vus/3fC?=
 =?us-ascii?Q?1LkAkqAtjYkQenKMn0LqOvuNixPoQfZ2YHcYaRWNhdHLDAhlZoesPSqlcUNi?=
 =?us-ascii?Q?pmu10WCc9dwQdPeWunroxvFBKsHoV9QF4sI1SO/4TsBHqFuXWCl+mQHFdV+B?=
 =?us-ascii?Q?neKTiBoEnSROeO+XpYzDOu2G+S+KOx1gW4G6AHpCwD83m0JX67Ws346VjELI?=
 =?us-ascii?Q?1RtBpOEFsz7uUG7i6SPRORWjm8OEzDmlFfqIfj6p96DU6lIuzxmezyexIQWw?=
 =?us-ascii?Q?vSgh4bGxgrlJjX1ioefmzFicBts4M4ZXqvIw2ErVAMXhJu5WtlFabe8F44DW?=
 =?us-ascii?Q?aWlo2/9qqwA4mf4iviF0R3ZyZw5QwKxIBDUbty7jBANTKaixH/wmHjyS+lK8?=
 =?us-ascii?Q?SIDLyxEXLNZgvCTlDKJ7+WoDhUoGRcKJEM9T6XYB4/Gvhye9whnmolTdawFt?=
 =?us-ascii?Q?jP1aZiACo+EO43NsWGZxpUAha7x4CfJis4zn+E8CLinjTnKe7G/tlpRlM2WF?=
 =?us-ascii?Q?qkUmSEyqbMlzj1jWDl0vcilqifqfmhAD+u6PRaAHwNZpXzse+dTZC38r4Iwx?=
 =?us-ascii?Q?k/7YKUrrTM02KrbhUayvJZBRTeXS1wSDT8OSUihwD8UP45suIbvR9Kt7i7Lv?=
 =?us-ascii?Q?gAq2lRUjwYFnPbGxBJqDRoejOcQn3+5eXCHgl3IxO2ZZlhqryfA7cCmAjW+8?=
 =?us-ascii?Q?Ni3e22zDp2xxjB+fnvz0ndCLEFL7xSRXgiDxfOj3m9EFOPpv0Hm4zykvSqKx?=
 =?us-ascii?Q?m2uuBoRYFPphchopBg/nIqabJwNtGFfkuOChFyo1HUOSU8x7rg2npd4eZ3fk?=
 =?us-ascii?Q?5+imEtPSdLSjW4VVwkwa4skuOXPVUKPIB5HuNl0nD7kraBDt6//LlRX9iULM?=
 =?us-ascii?Q?dJQJBXXM858sTNlFWA70Nn4WHD8qiE0w9U0LM34H1oRSkonAXDmNCce4QukZ?=
 =?us-ascii?Q?bbHQJNj2+8w/LBdvmC3SbBJGN8ii1C1HxZk6hDy0HMH9N3Sdd21C9dKB1m0n?=
 =?us-ascii?Q?KF7SOGQqTavm0bDRFv1Tc/GTopIJY7HYbjiaAwqzE+jEFu4vq4MFDM+4+d4l?=
 =?us-ascii?Q?b4jBFV+JILDd8tzyAiPkYG4C+vlQTDTfCp5Ni8AcgysWUHIy6WeF1csnJ90R?=
 =?us-ascii?Q?UOeAFgsH+Bi4WOiOLU/No8TrNINCnTgn1CR/eUTlzeOi94WusIOpoW8VJYH2?=
 =?us-ascii?Q?gq41HBJbM95MU8MDXdOmTkcRHB5Sk/WUlP2il004/UVluD8ntbc8uYfV9+tz?=
 =?us-ascii?Q?zEcm6+Z4BsEjCrUY+lOTzhmmSiYLEH76rcuuREQqIMhFeZdXCScraqbh3BbF?=
 =?us-ascii?Q?iNkX6lMYaxoyTd+78cYaZJPfljgr8/dqh26WtXmt8tqU3WA2KfVvjsA35GFN?=
 =?us-ascii?Q?NKNpAonMOgx5UTbSQcHrtn7TI4HqcbQqLBngah1YxGhDmSuQfYvVSNAL6cX5?=
 =?us-ascii?Q?v/Eka1U6k/gTcG/a05d6/itximrVWGcswhw1kwdjoN16D4H3uRXn55zv3n2U?=
 =?us-ascii?Q?zXRqRRMdBhyo4zNStoT6wmo/xpPyvdS3TTeOfN1P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b716557-9aeb-42aa-5283-08dcfe2aa0fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:17:02.4585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2JLQdt1C42AtF5M220WG5mB50Tuew1OLr87zfn+FywHST+IgPXcLoyd6zU+8iPth+PF7zYlmeZ5u6zzRRDPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599

From: Yunke Cao <yunkec@google.com>

Add string name for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX.

Test that V4L2_CTRL_WHICH_MIN/MAX_VAL behaves as expected.
1. Calling G_EXT_CTRLS successes when V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX is set
   and returns -ENVALID if the flag is not set.
2. S_EXT_CTRLS and TRY_EXT_CTRLS always return fail.

Tested with VIVID:

./v4l2-ctl -l -d 0
...
		     area 0x0098f90b (area)   : value=1000x2000 flags=has-payload
read_only_integer_32_bits 0x0098f90c (int)    : min=0 max=255 step=1 default=0 value=0 flags=read-only, has-min-max
        u32_dynamic_array 0x0098f90d (u32)    : min=10 max=90 step=1 default=50 elems=1 dims=[100] flags=has-payload, dynamic-array
	   u8_pixel_array 0x0098f90e (u8)     : min=0 max=255 step=1 default=128 dims=[640][368] flags=has-payload
      s32_2_element_array 0x0098f90f (int)    : min=-10 max=10 step=1 default=2 dims=[2] flags=has-payload, has-min-max
      s64_5_element_array 0x0098f910 (int64)  : min=-10 max=10 step=1 default=4 dims=[5] flags=has-payload, has-min-max
		     rect 0x0098f911 (rect)   : value=(200,100)/300x400 flags=has-payload, has-min-max
...
./v4l2-compliance -d 0
...
Total for vivid device /dev/video0: 125, Succeeded: 125, Failed: 0, Warnings: 0

Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 utils/common/v4l2-info.cpp                   |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 24 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 7dd7e708eb5e..02dfd6da0248 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -538,6 +538,7 @@ std::string ctrlflags2s(__u32 flags)
 		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
 		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
 		{ V4L2_CTRL_FLAG_DYNAMIC_ARRAY, "dynamic-array" },
+		{ V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX, "has-min-max" },
 		{ 0, nullptr }
 	};
 	return flags2s(flags, def);
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e87a1af96406..a0e8bc19aafd 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -971,6 +971,21 @@ int testExtendedControls(struct node *node)
 		if (is_vivid && ctrl.id == VIVID_CID_U32_DYN_ARRAY &&
 		    checkVividDynArray(node, ctrl, qctrl))
 			return fail("dynamic array tests failed\n");
+
+		ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
+		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX)
+			fail_on_test_val(ret, ret);
+		else
+			fail_on_test_val(ret != EINVAL, ret);
+
+		ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
+		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX)
+			fail_on_test_val(ret, ret);
+		else
+			fail_on_test_val(ret != EINVAL, ret);
+
 		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD)
 			delete [] ctrl.string;
 		ctrl.string = nullptr;
@@ -1082,6 +1097,15 @@ int testExtendedControls(struct node *node)
 	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
 	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+
+	ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
+	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+
+	ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
+	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+
 	return 0;
 }
 
-- 
2.43.0-rc1


