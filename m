Return-Path: <linux-media+bounces-29895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45065A83C89
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB69B7ACF15
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689D020E005;
	Thu, 10 Apr 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OMuVFjbM"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638320AF9B;
	Thu, 10 Apr 2025 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272970; cv=fail; b=RDt9BE9Y6wZgUraEQhMnxlWeptE2uIrtKWXAOQh8pIYFFafW6pihA69eDFdavCqzHUV+AKrFYtUtGvHFcPy7jrgtNLQMIwM4n6Iwi544YfmCXfyxM9kkOCPS2LIZ9wKLHTPBj8X45F506yCGKx6Jx9ZZGL162Fsj+eBXs/TRBic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272970; c=relaxed/simple;
	bh=ds3H0rqk7+kL+0QpSEHLUxHCpdf+WSrqm3xIhDa9HVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fnQ6Bj/8opEYC3otjWzB7LWZ6oqTw1WQOsau0aY28pOy230VM6rxgcUkkaX9zHCaoN2IfXpwNd5XSfasfCWAO9xu+bqFh2oZksOFZ76c8sVEab0/dxSTcwScMVcI2mr/dm9qRXcABcVQlqhwBBcMqq+wifxwGQH2r/pf/tqTLzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OMuVFjbM; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWLIo9j91ZJ/cHQjWWkCQrfkcUT1RWYmmDwQieDaa4VfqnAxx7AsSQAvQJd/TpUav83EtHf48IWYIAen0dr7FcGB3SW2aIPHlLlVUHmObcWaaiXaw+mmYa2K5k+hg5AiFBneTH43VrGcX3cS5tNkqAccNDzwKn8TdPdzniF/ijBYQJxSJYihiQf/6HEGgvY3DbK3weSb0PMN9ik3EYJam4BR+4s1rWgBO5Gu2FP/v499o1BSgQVK6MIIAtQdOzfROQDxGy0MuwYR+mKki3eUc93RrLXbM++xUqNI0ibt6GM9HyyYAQnPb+AEL99N7Q0Hb6AmJzVMLbawJ0wkB6zY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBPowDVvYbfUQB7YY1tujpEmW4pzSioSJ7FVkQFc7I8=;
 b=FiLFlEsmLhhrV/+6q2bgUoJGZ/23b5rSN8y3psrNGwmd1hsb2kPauhePUxbDUG/PF7wG96clxKuDv+dnTmj9Ma5KfIymJ4MyzzUh2ueWQ5pmadfHVFMKxc7pegk8c2QFCdMM78Oen3N+aFO9RiZiE0BFuVy1bggN2vOtsTBmHoZItHX5bOFatD9PGtA1kRKvELkHt0qJZMxVkXsc1T2FaBEgj2/HL3IdcObSM6zX1yIg8CuYpuvj1MK8NxGigvDbJf9SpesEnWdrnuTRmKAZTPjMfyt9tYeic35bE32JoVldWvUETVMeep/qicnlRkJTGeo3px14TeQX5T+cIO4Kdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBPowDVvYbfUQB7YY1tujpEmW4pzSioSJ7FVkQFc7I8=;
 b=OMuVFjbM290affKgSZruqDJmEP3RfdkBukrPV43MZmoNFXlUHFMS/RkXHx+aybqGjT4y9TFnh9qlj5BokcEdOxCy6Wlj4Q8sv3jez5tpv6cOIW35T6pKykHWncg9bMd7LGUzkg51dAcmqG3EMVTRkhEv5N800+tZCJdllfXC+YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:16:02 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:16:02 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Date: Thu, 10 Apr 2025 10:12:21 +0200
Message-ID: <20250410081300.3133959-18-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 4875e9fd-10ea-4682-d869-08dd7807ee8c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RchMNQlGLteItfz/UozV3oSarclxS81PhkDIDTQuRvh1IXZIADjInDIKbduX?=
 =?us-ascii?Q?GxbAnqYTyUYB7yxyRR9WSU89ABKrpdQa8gaQYaps0Y2spa1oulrvfMhI36PU?=
 =?us-ascii?Q?PWato1RG+WHSxuKWxVbTt+j7WMhLcF5EIvaUM/EcSBw8iWmlTkfg4HiOOmXI?=
 =?us-ascii?Q?txyu1ojthISISEyguyChqbavmr/bg5FTdrSfVznpc4JS6ud5xZ31JkDoJphC?=
 =?us-ascii?Q?9Z/nbd3k5mHN4Z+3G3xxjhw6HuQNgSXmHhkeQnEnA0dc8Y9NL6EmVkhI/kTI?=
 =?us-ascii?Q?v33PgHMAbCO3uzf7ANF7pO73vp8/P5mxFX/aJ1r9Pxim7P/MB2TD0R9aGM32?=
 =?us-ascii?Q?hQCC7ICeUu8EOGNuzEAMO+jauvtd/wv9uzV3l1FpEZLHhnWv+u/QSFckFYZD?=
 =?us-ascii?Q?w42ykjGksua1TZGti46HTdLGK6Akk8tACJodfPm37hZNJQm///197LuX5a6v?=
 =?us-ascii?Q?RY/UOzur2zXXOHjBPx5acmIUa2JUjjwBwCOldDXTM0mRMDuROteYmTutFDgd?=
 =?us-ascii?Q?444lom+bNwuZ8r3BWWjoZFMlab1uMQ8C1A4jNzceJPPQecR/paHbA1aqZF1v?=
 =?us-ascii?Q?iKo1blZZ4IVNbHwhFN6PGs5LxskPPss8NmTo7NPW4SU2zfD/a3eLRs6bl1LJ?=
 =?us-ascii?Q?pYZHY3Usw8gMs2VJv3bT368kzX7KWxuTwJx3y1y/TW0RVftIVT/0mEsaquK4?=
 =?us-ascii?Q?XFL6ey1uTWzSSxX120gx702M7AQUHoS+aAsncu+C8UFh3/r45uEb/ysaKU7I?=
 =?us-ascii?Q?Zx9uSzqaYCG5X48E7rQAB9fantll9X0MVKZ130bORtv7R577HuSfUthOcFRE?=
 =?us-ascii?Q?3gKvwaJEqN1PggYTJzS0f2PUwR4g6KsStsIu8I5BPUkXNP/4+zE9bxukKA6y?=
 =?us-ascii?Q?lhEN9IY2MAeD+GOd3zErbF8S7KqLkw8qF9+Hj+TbGEkEUsLel3NU/osdgL5R?=
 =?us-ascii?Q?nFFYZgLzu/AekZ0ziOC6hXFgKlJViHg1+GngCHc42DGhjKr5/HelRk7UzX8g?=
 =?us-ascii?Q?X8yq65T/6o6jTfQ9FZYSGdwed33+IQpQwKcbbW1AxYOZkqRtJT0yOqMSp3Yz?=
 =?us-ascii?Q?Gwy9tXF6FywSH0dBLkEpZbx8ycuw2QNZMC7r94fi5rkmwTQ9iGEiZIgqS9Hm?=
 =?us-ascii?Q?hsnv5TZPOqRXqwNZSYhwJ5BKtHIJzbud2mWfWkLTYD6ExjvhO0UCD5OZ+QZQ?=
 =?us-ascii?Q?r1QqkpUW6wa4LiOdJ/YnVNffXS+d5SIroXwiqHD1sPjYkCBh9YZOXeFLlZD8?=
 =?us-ascii?Q?cMJl8f0Q1fNL23NWFpX4zJRAvO75waM/tfmjFGkjnwIVL2rEXb/PR/T1SpWH?=
 =?us-ascii?Q?jupXWxh1SVanR+BJvGeV16HuDMTEGAmm9sVI7SDOns59w57s4kdXTsFMp3XT?=
 =?us-ascii?Q?jMtk9vlSyBdNsba60zUSJXpWGkP/dk4ZUoGkZFJod9o5Ql9bbQmojf5cwmby?=
 =?us-ascii?Q?Ejlt433hg2L8CXjWt795tziZa6aPkec36s3qT0Nc67Z8ju62ptwLYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iKxy3QPGnz+4RJIhzRivCicnmWfyi2rryIJkAhf5NDCQfTI6btP9hkMO9VGl?=
 =?us-ascii?Q?LMGeSxzaRZxu+mOGVyFzNJuJv6AMaaNm1jqZuo9X7nN26bCq8xaodkuWOmwA?=
 =?us-ascii?Q?KgbmKxoNA66UpgPQ/XT1MdOoBXD1HxzVLvY0QoIX9niWUhBrk7byURqpp6oN?=
 =?us-ascii?Q?c3SP17Di2ajA5+aOcRbAv6heKWQVJ3TSmlzF2LFzLMb0MXp5QKXYKae4Y6f/?=
 =?us-ascii?Q?2/cogKvJCYC36HpYwG2OsSnPtu3ySIEyt9A3rOMqQ5hy7JIpoRAlZCTkHqRj?=
 =?us-ascii?Q?rS0Qt6PIKpXS+xDUZysCxitYdo03B7w71tbnOFY2ifnfdk1XTYM1XvEuVFEy?=
 =?us-ascii?Q?tLQVmixV2t50Td1DeQHLJAq+OltoiGoAa53qeVKfQWncX7YiMhs3gXZMrXlY?=
 =?us-ascii?Q?riGlmm4jYtPBZD90mhTEbbmFOOKXYhLLO7Ea3boSkyplfV2T255XxWxd/4cV?=
 =?us-ascii?Q?nYPox+VhBHo5ijkIIWHPIjjqc6etZJqWMU0tLxH6N8HW5nkzkPkd8h2oeMJm?=
 =?us-ascii?Q?eljmqatpAxjaQt2yuSrQZmo4Vi5pC+qHBx91E8GFHTyEEubfg+mlVKEe8Pwp?=
 =?us-ascii?Q?b+SYMOmraintfKm2s7xdKp/UK2nw2F1Ru6K+h6uT5HYqIpSbWiG7BgvQSi/F?=
 =?us-ascii?Q?Iy1QvK8D3sgGyXBsQZu0WLMKVQCPE0+Z09/qcX9ojMOcUZ9NKzNmX9kknP3S?=
 =?us-ascii?Q?qjx97vzTaq8LczWbT3kafGskSbs5NJ5EfDxNim7/j12BZFO0FjhBbxFy52vr?=
 =?us-ascii?Q?jmetZIin6bsIKwRFklkX35tSVdtW++hp6+xLdKqe0KsP3py3JNZMLd7699aV?=
 =?us-ascii?Q?c3+sYtKVmXipb9xnB98/4oaRxptEyuYgBw9eIyrtVD7neJ14AR5jYK8BH3eT?=
 =?us-ascii?Q?tX+Hlg+vPIMQVZu1bW94XS9XEUYDyRmZDqfPR3+2vnxFHVto2OKjhSbUOiz3?=
 =?us-ascii?Q?t44rUQA39uQf+Y4TDRt5EqF+axkq5cMcSNn3hbpEnsbdb7Ou7XogmSj/I1GV?=
 =?us-ascii?Q?JNGYEYV5sSPUe2EDxYcJbLwvp/lL9ddee7ctMpnIki8fx+qqIOZaG2FHk+jO?=
 =?us-ascii?Q?jQMtiBnEaWbJQ0eSzd94TkMyc3Jix51OtmmiN9pYfzjXHBmwL3DlLC/RDzzt?=
 =?us-ascii?Q?TtKz3FbAR3PoJ3Ets9w1IV99nIRwOqmjRN2BunrNq4zHUspFCFWxmc1Y0mP4?=
 =?us-ascii?Q?ercr9PvMfUrxx24emlxkbFkZdcWrE8q4MfaaK858X3ESDYKedzSImzGvtzbF?=
 =?us-ascii?Q?rhIC3G0zj7NiwGDFlxCv8P+A6tLGHOBOKYar2oOA0UgwSjYLJEsDllAkeXtp?=
 =?us-ascii?Q?DL9kfs1oXgkK6lz5ZTm/ExPqt0EiHgHsPTJ2M1HpVH34t54g3aG1u/IybSkt?=
 =?us-ascii?Q?0PUM0ElaZyul3miRTL9D2ZmRd3ah99ik3xJMG7UwJ8GQRkJgAnYoOWAJR+zq?=
 =?us-ascii?Q?Uceah776XzXmQxS7RMGNg+Wj5MTthOf7bNtT5WBB4NOWa1fiOoeRFjPt0ZSk?=
 =?us-ascii?Q?sVzoNgJG75PoX6beUFZY9If/HLzESZ3DlnfjYbQdItzMB4EiDw67migtc247?=
 =?us-ascii?Q?dCOCsTjwqu8pQN6lfUn1DVbATlyTMPMeLzgBL5twxdS35NENf13UrXNMkt+T?=
 =?us-ascii?Q?CVJ9l1JIVH7gvLm35ylY434=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4875e9fd-10ea-4682-d869-08dd7807ee8c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:16:02.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBgjCHKi48BgrJd7oy+SJSzqAzoKeFpKzVRJHC3+Zu+pM8zAPGF6HeOI+/ly/AqCkzqSpNepMSswFc09Be8THMQt39IjmIJvbcHQgxU8QPx2F5NyLR+htMu/bpkZOTDW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

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

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

Changes since v5:
 - Collected tag.
 - Dropped outer parentheses in rzg3e_cru_csi2_setup()
 - Use fixed array for buf_addr as suggested by LPinchart.
 - Drop the outer parentheses + used curly braces for the for statement
   in rzg3e_cru_get_current_slot() as suggested by LPinchart.
 - Added scoped_guard() in rzg3e_cru_irq() as suggested by LPinchart
 - Used a local variable for the queue entry in rzg3e_cru_irq() as suggested
   by LPinchart

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  56 ++++++
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  13 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 168 +++++++++++++++++-
 4 files changed, 261 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3ae0cd83af164..97d70d978b5fc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -321,6 +321,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
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
@@ -367,6 +419,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
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
index ccaba5220f1c8..c30f3b2812846 100644
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
+	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
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
index 809c43d686e26..735c48ef6241b 100644
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
+	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
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
 
@@ -601,6 +662,104 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
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
+	amnmadrs |= (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
+
+	/* Ensure amnmadrs is within this buffer range */
+	for (slot = 0; slot < cru->num_buf; slot++) {
+		if (amnmadrs >= cru->buf_addr[slot] &&
+		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
+			return slot;
+	}
+
+	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
+	return -EINVAL;
+}
+
+irqreturn_t rzg3e_cru_irq(int irq, void *data)
+{
+	struct rzg2l_cru_dev *cru = data;
+	u32 irq_status;
+	int slot;
+
+	scoped_guard(spinlock, &cru->qlock) {
+		irq_status = rzg2l_cru_read(cru, CRUnINTS2);
+		if (!irq_status)
+			return IRQ_NONE;
+
+		dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
+
+		rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+
+		/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
+		if (cru->state == RZG2L_CRU_DMA_STOPPED) {
+			dev_dbg(cru->dev, "IRQ while state stopped\n");
+			return IRQ_HANDLED;
+		}
+
+		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
+			if (irq_status & CRUnINTS2_FSxS(0) ||
+			irq_status & CRUnINTS2_FSxS(1) ||
+			irq_status & CRUnINTS2_FSxS(2) ||
+			irq_status & CRUnINTS2_FSxS(3))
+				dev_dbg(cru->dev, "IRQ while state stopping\n");
+			return IRQ_HANDLED;
+		}
+
+		slot = rzg3e_cru_get_current_slot(cru);
+		if (slot < 0)
+			return IRQ_HANDLED;
+
+		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
+		cru->buf_addr[slot] = 0;
+
+		/*
+		* To hand buffers back in a known order to userspace start
+		* to capture first from slot 0.
+		*/
+		if (cru->state == RZG2L_CRU_DMA_STARTING) {
+			if (slot != 0) {
+				dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
+				return IRQ_HANDLED;
+			}
+			dev_dbg(cru->dev, "Capture start synced!\n");
+			cru->state = RZG2L_CRU_DMA_RUNNING;
+		}
+
+		/* Capture frame */
+		if (cru->queue_buf[slot]) {
+			struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
+
+			buf->field = cru->format.field;
+			buf->sequence = cru->sequence;
+			buf->vb2_buf.timestamp = ktime_get_ns();
+			vb2_buffer_done(&buf->vb2_buf,VB2_BUF_STATE_DONE);
+			cru->queue_buf[slot] = NULL;
+		} else {
+			/* Scratch buffer was used, dropping frame. */
+			dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
+		}
+
+		cru->sequence++;
+
+		/* Prepare for next frame */
+		rzg2l_cru_fill_hw_slot(cru, slot);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
@@ -782,7 +941,14 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
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


