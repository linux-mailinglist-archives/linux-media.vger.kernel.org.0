Return-Path: <linux-media+bounces-49758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B096CEA4B8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D05C3063807
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8831330645;
	Tue, 30 Dec 2025 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ao5uX3L1"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B832E121;
	Tue, 30 Dec 2025 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114594; cv=fail; b=N494AD5mhel0gBx8VpUfGzeh/J+J9yKNK991UVHniYBcIigwfcoQk74LjBH/Et7a1pl7AdTQOhfWey/+Fy6XjrTIfIIIVAAeyiwmbpOClbS0Sut0A46h2CEsse1u7GTqWLCRMIERkZRZrSTDMSHY/4QPjhLrxCA2ttmanfPh+dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114594; c=relaxed/simple;
	bh=Y5WGcaOlMERGk90sfcfwg7hSSg+rehi1J18H9EtSSuY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TYTTT2dT2vv6zg8JsbLiKvZiAuVjPRZyspP03nsJ72UJSqlmo7UTicYXRHCDsRvGAn665x2+ZeLFdYFHv94r5Pj1pjzBIZ/HViX/RhB9vSotKqdPO4jUcu4u/xzaX8xHIb4/FzWG/AG+qBxONTJxSvWFV0k6illBxP655SMz81g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ao5uX3L1; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElFRKsw+NZBbTqJcp/MtIFPNENYJavk7g0QiG4MvPaodUWROCJOpby3MQpz2SG39oHDERzx3Sj5oeIowZ8ZmVfm3nJRWuyIpMV/fry/0xGZIu1Uw9HHYPbjUUBKHpEbulyVvsJTVSFwuSc389yV5EFmdD0ECqlNAHeYk7kevGhh1izkkYNJOGBU5dI2QZKkeclQ9Gegy5lf+EqEPPkiQpUI18oseJhVzcARJoyWPL4nnFRTnhYu+5b7Yqk4+UpHMJRHCNfWUC9FAGHMTm+P/Jkvw4aXqtgJoYfhFkDUj6HzfOhDs/0CA0PBcNiuJLFs1/u+vHPV3C2NuFml6hewSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrLfex4GzbrTn9jweG6f1wBbAFLBl1swoevRrokTPXA=;
 b=uCCiTVvYL+bLr1mVtSDGg8ien14HlTF71yco6EcptmFRrl/PEBewGT2rTXMGWSRRiPhwGB3pOilnsu8fDnGFdZosuxxbqfXhEDYGX8/VaO57F0bYFVjiluLNUH8J/qZKxMch9BomTXGhvALp/D1HUzfmujFzL3O43qXPQS8TuFz45cNgW5kY32qkq+dwkCF/N30w5His4TFzaVJlERXnVWwhe+rAkKmojiHk7c9HbRQAWIeERX/G8h3/IXZMw9xA20LoBt0KVSX09C6Ww8jYlGC4GyQdXZjyboRNuKOpGeJuAczWPCeE8dbCun05eZH8VHtKR0bgbFlNP1WCS7p+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrLfex4GzbrTn9jweG6f1wBbAFLBl1swoevRrokTPXA=;
 b=ao5uX3L1r/h7wh2JHInDlmQTinMcT03XhJi4moGLornMV0hxiSZ1X0C1pyKYwRbx4GLMV9JoY2wMu9BA1ZLLd7h9EALgZyxYaXsPuMnc0YyrRrRtEtvkRWxwMZ4uBE7UZkz8TCQp2sgOlukgS2eXmpOwfqBipX/ZMFJDZmfIzHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB17518.jpnprd01.prod.outlook.com (2603:1096:604:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:09:45 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 17:09:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: rzg2l-cru: Fixes and improvements
Date: Tue, 30 Dec 2025 18:09:14 +0100
Message-ID: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB17518:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c152ef-81c1-411b-f4d8-08de47c63b13
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/YBye2xQ/RbIlD5GWuGGeylAGbcRz4v72MVrG+Bj0pKVD9sZZ9k+5XFJ5240?=
 =?us-ascii?Q?lzJQng9EW6vi8mpsjC8QdNq/OIQp4x0rkePl0FIAwrmWnnb+qBW5k3n8mCgo?=
 =?us-ascii?Q?q32ExrrqtnNnu3p5HEn9OrLRGIwnobywW4TyWKZ6++MqfBEsPTiwIY3eDDWa?=
 =?us-ascii?Q?U39fuqmI+3h81hlXqeO+jWkbgyxoHUPbURcwdqllW+XOak7u5frIa0XKhm8I?=
 =?us-ascii?Q?TIAQQTyoCmwHJUGFNBPUEfAhRd/Kd+SafbIiwJIMx6Ouu9iKoNfS944Ok3nC?=
 =?us-ascii?Q?gFJixlb1Xpcdq7rG5jlpHDi/LKarBF0uRzTn4hGMi94CEYvoXE3Lg6UPBVmx?=
 =?us-ascii?Q?95MyGKvxzoZwSNrVbItVKrZZYqMPc01KUNuS9hBddIk/RKaQCQSfZZi3Gntv?=
 =?us-ascii?Q?A+ZnjkRrsN3R3maW+OLV2o8IRgnX5yDa/BRtVGN+HYogREB73jNebuhtgbWi?=
 =?us-ascii?Q?WRbqEfhXACUI2xtIK0wfmvMxz4hRqwFowzKPf15YQDeUgaSyQ4zufkreNDn8?=
 =?us-ascii?Q?Z49DM/yzmyMeBzsd0jNHWs9ijUVuVBMuRG9EzYemYgJ662RPej2U4BrC4xha?=
 =?us-ascii?Q?ggiy8LErlMmbA0hM8dmQ7J0wzKYjIjfUeRL0rKuSIhZavYBl2BeVxLpRUlYZ?=
 =?us-ascii?Q?sUIQvH61jJKMjbEbXGSboVxx0NeL3/Dk+4MmfP1J4pyovhlnSnYL83aqdlAN?=
 =?us-ascii?Q?yH931rcohh9mZJgvMXAaF84wReaEQeDz7yyAVpUQJeUGcVDmoH/sZ1vdkzkI?=
 =?us-ascii?Q?yyEoySfPr3Tg2w5TRSBLcgT86Y9Iblmoe1FXBw6ffRNB5j+HK6Y8y2Gj/DlM?=
 =?us-ascii?Q?RlI/EXcsNklYA2npIBURJj5ruaEoyNgTnMQAyEPzY/uJHi5VecfipsC8EA2h?=
 =?us-ascii?Q?QqZXL8JyCcFsHZu2F06BJ8gvRqqU+y3FSIOAZ0DXzKAH7oa0Ih7ORkRWQrPT?=
 =?us-ascii?Q?/j2zCfC+ZHCu9cxFkmbZu6iGKJRbO9qLbFkMsR6JxdGO8FFRAvWdpa+rfSwL?=
 =?us-ascii?Q?43Rd2YTfDtIMKIbVee67cAaE7odTvFbgWefmrXoKdDMmGRvoY0M3oM2wPADW?=
 =?us-ascii?Q?RrzAp3Fm8WTSEAcr6g7UvUdqqnxemk02YbnFcSYHSCX1aLYmA/7nN10O+h1z?=
 =?us-ascii?Q?PrfuGYVdNZl7r+qnz9iyINc2HYYHqcKiQfrNDX0XkKbTurUwd0ZIiIh5AolG?=
 =?us-ascii?Q?kyzly636xHRWaFAjGjknRviELaTg2aYTPnU8RovxHFQIHSpxWMmULxImJudi?=
 =?us-ascii?Q?of2VtNxhExeMcSPWKfYVRrz+Zv9JB+ThyYuwzIfmPbrK0LotiWy9W5QTT8yd?=
 =?us-ascii?Q?14Pmm5qBap62hN3lwpWbAjtWUf7fV++x1vPvcKC2klL5r9BOGaIRpOTxIpm2?=
 =?us-ascii?Q?sLGacOXmJayDNb1R7xD25bovd4qGLHDqGIHJtZs91Xm0UBE+f32+rWUucBgQ?=
 =?us-ascii?Q?8mOfSd5tc9NA5CKI1EhHWVpIR2iV8CtdfKAoVp+OaQM819tljvjyRKmgOKtK?=
 =?us-ascii?Q?2PIzYsmM+vjIsknvCfecNAd/2j3WOvRy1VrK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iu8M2Z5PAuQXvr8xkh9iMFPwbgiIbLbKeZ8C4bNu/9vYxlzfLpAG/tydDETB?=
 =?us-ascii?Q?0B7Lo48972EjKhDKuBMtlrjY9CwBLWS32zc4sDxKjSoekM3yNB2rVeVVTPRI?=
 =?us-ascii?Q?9l9NJN6liUm5U5tC42eSrzYncRUO8xsD3AKQKlIrXeen7uQf3FfKPjKdDvoc?=
 =?us-ascii?Q?Jao3r0CFndvsrM3P0oUlrJCSAlt8iNsnIXnvrSR+s7ZRI5+5xBmiRjMS88yg?=
 =?us-ascii?Q?7Ub96mWlWuqLzyl7GWJdVPuVjkjugjGKUoR1XL5Ln4XyP4Cl5g+OtmLrk1hR?=
 =?us-ascii?Q?mJrnxMZTHkAmZyB1Ij3hhKb92L92df9iWfRYnAi+6Juhy6c6ftoN/ZMBarjw?=
 =?us-ascii?Q?XSQjWxHm7rzHApaXcoAwfCZ+4I9orBW3p+FbWkVRQWabWcWi1VrZQPBKphDS?=
 =?us-ascii?Q?BMhLiDZLRRZKlBK9gR/jndhYXTMX2wg8ZUIFAbmUISZjMzGDuV+yykvL+LmQ?=
 =?us-ascii?Q?r3UT7sWNlc2BrnQ6/iQfXEkK9TVOm9ME2aDxndFHgAX9BIdYD5uuu0zAwMXV?=
 =?us-ascii?Q?cV5R+f3INUMNmIolvp7hI/5jPTvTBAo6sVKyrK2Tvj2XFXTDks9+8lzX8WpX?=
 =?us-ascii?Q?qytljhlrbJMtm9klS+U8EELvOorjYt0IhS8EWReA6WnKsyG4NvdFFMj1sTFE?=
 =?us-ascii?Q?g2HyJW3Kz6Q8sZSL6WAtdtxmKEfd3zekxhHNDy4jUHQvE7H/vejvFZ53lvny?=
 =?us-ascii?Q?PIaQWnA2bclLOWhd/QpyLvrWejKtdJFDgJzrFIhPWGey1Ukf8KBUmH9X5ZTj?=
 =?us-ascii?Q?yUjxlpt7iVJeMtSPG7iFbOd2UpVVR312eFB9+Khn5RqcGObaR2c0xwyCnQDr?=
 =?us-ascii?Q?gnurptTy/QfSAAIhi75v8mWfLeDB5U7TKAujEpiNMTrtzbncGXtnxifn2VbV?=
 =?us-ascii?Q?tuuthM08zU4YMBAyPGtJxQ2pRDv96ZSWslnb3ngtK/xTwWYgdj9ulqE9CdEN?=
 =?us-ascii?Q?DS5Iif3+qqvyNZkrCsyl0fXFiD2b0WABQ7yJH7L0TpByGTcKXyqT/BM6M/Ix?=
 =?us-ascii?Q?9ph6JLJCgL76IiuRg7JQFKs9y7XQIv7JZmH4edckdkz1tecEFKspkKv6CKIS?=
 =?us-ascii?Q?KCK5LzjqZQ/YuapxylaNrZTyQ43y9fAmK/UEQ28pXch3kXe7ZheShg7i/H5D?=
 =?us-ascii?Q?hh1aHIPdIORZHweO32SlZDfVWRwN1R5GPgMqt1X8PJA64rLyk8thGOWu2KPQ?=
 =?us-ascii?Q?updON7NnWykjSeAqR0a7HCx1pUarrHhEJeVDqqm0M3hf8YIIbydR35x6h/KM?=
 =?us-ascii?Q?ttgn6/3rgzzbdF6duDbvPLRgddBBXLjDWDhmo7euYgfu5v9rgCZqPPCIhe9p?=
 =?us-ascii?Q?BLOKn+B1wuYhtIBKR9FBvOKvkhriZBgpPrpnmAKEhMT6aygy6OQHqo4puCl6?=
 =?us-ascii?Q?jaOFWuVe11aYnqxmPqr6KUXB/WdK6wudLWWPSgogSnwGWmWTqDnYJxfSHfco?=
 =?us-ascii?Q?FIswdKKIPTlXTdi9FA0EBJkPGrryelH1o2v88UmEj2QZg/VmonYl0kx0/6MT?=
 =?us-ascii?Q?Mamzs7saMw2pGjzQ5KoBy7ded8h9HULlTCGChoP/kd0R45WrVHciJeAd7mZe?=
 =?us-ascii?Q?ff11HgqfbUZguuxh/HxaazsOWEjWu0cSOe1hLlnYsmlqRrqgmCcBXKGmY/iR?=
 =?us-ascii?Q?agzoZIGZ6JIejyUOivHGyvDC1+N23CxDINrxCN+9KbPAGsR3wbJf3Xc3lY1U?=
 =?us-ascii?Q?ZmB/CxXV+XuAFGxvBKKrAw9QNMaRdf7IHnJXEaNRMI6rLg+4KwJT08r4F8JY?=
 =?us-ascii?Q?/oxkQFkdykALEjTVMRTTIFbk59iUnXI/QIAE4GBs1G3rUlR1JoVM?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c152ef-81c1-411b-f4d8-08de47c63b13
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:09:45.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfnOWFTNrYUkNB71hRm1Nx996pjNRLOz6z9mzUsQjsQ78suPR51aAEeLVRstmngWVg4K8fkcIWqWFXxhLh1yp0fc2iFcSomdHaJ9Mso6zF+utQc29VeClJeT+wbB2/0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17518

Dear All,

This patchset contains fixes and improvements for RZG2L CRU driver.
In particular the first patch skips the ICnMC configuration when is not
needed, for example on RZ/{G3E, V2H/P} SoC.
The second patch uses only frame end interrupts for DMA stopping state.
Removed also redundant buffer address clearing into rzg3e_cru_irq().

Thanks & Regards,
Tommaso

Tommaso Merciai (3):
  media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
  media: rzg2l-cru: Use only frame end interrupts for DMA stopping state
  media: rzg2l-cru: Drop redundant buffer address clearing

 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h      |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.43.0


