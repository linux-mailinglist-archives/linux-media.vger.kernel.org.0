Return-Path: <linux-media+bounces-67052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1WzZLO96TmpyNgIAu9opvQ
	(envelope-from <linux-media+bounces-67052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:29:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47E728B6E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:29:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=tbmqS2MA;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67052-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67052-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E82713206708
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B647142669C;
	Wed,  8 Jul 2026 16:14:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78772E266C;
	Wed,  8 Jul 2026 16:14:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527287; cv=fail; b=YBeOSRPKsE8ubSTpyScZqofOiU3BBTiiUdIkRY+3LgR8LuY9iYKwIcjnhPl2ciJDgnQO2Ryyt3Fp/e2yHOGpOh2MJsuSOQBQpdvOj5ij9AkXovAx+OGGgrMdFS0sXeOUW9g5PIJ0RaH/rgmixGtepcbfJT2X06+s84TR5F3ZExA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527287; c=relaxed/simple;
	bh=g6DvrSYZzHQDe/EPv3J0lOXaN9HLpq4s1uGBrrpvaCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mHPHDb5wZLpqIrLGPx0X8WHegPsVx/2eJHKMKmnZSfIX7yBfHfVlWKCZRgTxFiFzfHTNSY9dcfl9g07gsOgF7hWKb+InMDnL+UGH7uK/WRG25e7+mK4cCbs0w4jU36rSqeVcr6gYGSjkx5ksy0oVBkg5DjZbB2G5nIpvl5aNwls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tbmqS2MA; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybF7Ffb1B1zjmZEpQueghgFo/E6V1hUO/2dXXS6m0umhI/tFEoUYH4hpyhAs05jIiPg72YyoLvg7nvADr0wcU1/D9K8l83Px4y3yoSLu5rRthUH32Txf1aoNC+lOUTW02DUA+PmPddodomKBOujV8vTsHNERtaYBYSMSM69fN9IbNbK06sibk3UVgaLv8OyEupjFd473BXNykhZMnui6jw8eZtazGeqSKjYb+xZ/xZSFBBv3B+YCzDlwWbG+JL8aMo17ouV/DmJOEyVydUgXnBS0u5ekCNzzgOOXhSMOF32ImS16xCvDr9CX956Gqghe2HOOnEwuWVBy0sFIzqCJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcitRGZWmo5l6XE6OXMzU4GvgGLihd98VTWKdQgXD6E=;
 b=OOHAJjkhhf88XUNnJvDVFbFfUI+oAjsgjgnK0kEy9Eql5yTx7THqxOjvnVi2xjg58pYqinrbdY5jgAN6PLnvNpZK5wns1ygBXXSJH1SCeWybbnStKInORed/oNfuvAGEgAFm4wIpp6Ox1MaKNOLYof5EvCcmmDRk16IvwL4ZkI244ot/fTo0jhWECmhYvFPhRFkk/1fUaqzErU0tCmeg0ICvnaWypMU20irvSDABkdCDZu8pdSb7xEJNDwWQX6wu9F4WzAlRhrQc92LYYE64Jdx6SfyNx9XNAd2jMW709clpHyYZj/mJvcV+OaAzFjnKf+ag7BaFa+6CndxatES3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcitRGZWmo5l6XE6OXMzU4GvgGLihd98VTWKdQgXD6E=;
 b=tbmqS2MAW07HKnvC+bdxDhYNAFj1iawa0RPCDUIGFX8bTCF2BoSfJRC0PoJZqcBVBzrkcHUlDkw3rMpkYpjER8maTNv/8dxlVNVJ3ebSVh4sVUGes2+gTgHRrp4i8jDYkmTNQty0xMGlSh0UMtOj049tUeI+lnFgO0OLaRU0TiI=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:14:42 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 16:14:42 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
Date: Wed,  8 Jul 2026 18:14:03 +0200
Message-ID: <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11590:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fb01a9-3f66-43fe-8c22-08dedd0c04ea
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|1800799024|366016|38350700014|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 i0vSrX3NfTPDBBi3BRJj06BNCMEqrmmoB/A4V/rIXi+IlU1mj1hFqsZYuxjwIJeMlMu+nUC3fbOnGWFylBI9qqjJmS7cihLkYnY3jQqF5xn7zMlPaRtwLQIWM99GUpR/zPSCifeZOieQfhiHPAILlH++CQR/XU/8psZPCfzajBQzGny/hXdQGXEQNO7DphU2Y4oKCP5cp8+BzRyG1EUOzfdojLpTinqiEuAAjFnnrXhCSC98VMnTRySRLoQ9Sv05lU6lBrcaNaXXCVclhmxg7i+dOtwY8OdE6XjE4wvHdZm19GKwzjDvU1y/+Y9ZjwPMgbf3NYKHuyD73AEEEJtb70oudu8a5J7wq14mdcczYRnCE2FgjVEOubJgkaIMPgEKn2wiEdru4IaW9lBoAbg5zsauAgNlZzHdjk7xfXNA/yeOPMlGsh1pTQkDiaU+fObzDzbHahDQTpUKRaaqXGbW9rWlYGzDuo12tA+78FH0PZcRl0zoovDV8Zlfaz+JKB78+FGHzstPqmFWvWYlY0tCw5IV4+1YmiJsk5i26/8sjFVkrXp3tUnM9lGOJ7wqiEeufr6S9uB5NsbdWQELwom84JNmWuWVSLcOLqQI12Xqu+UbSmhNi0SsR1oONncyJG7X5x/24xNk9fIDv9ErbXY8V8c1p2rFdsNrKp2RoHFnKkfuxdFSXRg7PBs55+Ncnoet5WJs80XgLfbt7oCvQiTkiA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?8abFgootdC1xGb6gYbgOy1SZLjxWgu3DEKB4grWeZtCdx75mcEdTVw+9fJ+C?=
 =?us-ascii?Q?JB8A2N8dhJZkCGvx9tAxQOV34FAJ7F7vmrfmnx/GoVlvsMXQtNan+OgqNvuT?=
 =?us-ascii?Q?e0LZqcVAzvCo+3983qOkvQnm13Sazs4BwlTJcXc8l7W9vCEE+tOgTsaBgJ5L?=
 =?us-ascii?Q?TzTmToEfvb47LBD87dmaLvj26gqIVjglW0r+PFPa9vxHEG8D5TgkxX/vZBpk?=
 =?us-ascii?Q?1ojfFi8UlXhkO0421mZltMFCLhDtE2lY73YQNe2h88cn506foIsL9vokq4HD?=
 =?us-ascii?Q?PdKtVyiTvsPKNmRo1ez8vgf7DHc1FMQsCNHekeSc+Vte5o8IQix/KvtXUMS8?=
 =?us-ascii?Q?jzLwDM5EyQTCrubeFR9AItQOOVFsXmbnUH6qnMih89QYFxFpO2mlPJZ04GPY?=
 =?us-ascii?Q?JqBCTKNc9VohmaAqIej5YPW9xp/kWs8steBfeheGoYisJlwOhxq+SD+gAXEm?=
 =?us-ascii?Q?L85nWM7Bt45aTzF0QqJ+1vkV/9XPqLwgevIXlQ0csbQwV80mLcl8juR+WoUn?=
 =?us-ascii?Q?xnIFwM/rmI7y2cpIfH7UPpjDIqgfa285OBEl91hzfl6RxllmH6svoljPw/8q?=
 =?us-ascii?Q?ZGT43iwl52PUCNi6d/BfZvHBt2b3oOLXodn55gKT76SeZbbgsJcrZv0n5ym6?=
 =?us-ascii?Q?Hj4UyJdYPxlYboh6zaxjJ1X0gKU/0mJpUpnOY2qz9e2nLb1/+0uF5jLCo9yQ?=
 =?us-ascii?Q?Dk3OB4ERkkIaTgydJr0rxMQmi5WuMnrNcXSBM9UNsTksCkubhrnNiyZwHCYS?=
 =?us-ascii?Q?kzDWm6BTH8RD3tElXjc+3b7tedM+HS9ISAuwIH/mkT1rU93kroBoXnabcJKL?=
 =?us-ascii?Q?+6hvt7Atlkp4+XLWwzzBENWyNUeNz2IY+qniIybyfpdmZH5mJUx0wJcMBXVJ?=
 =?us-ascii?Q?E7KR/LUQNBQtG5lg90S5z0VQUq0AjWreui9CaO0oxC/lmlhmSQZxNhABiTdm?=
 =?us-ascii?Q?3mD0XYcZUHI9ad4n9WFzypqo871eVXawyZcZJWT2K4fL9oSp/LpAkCcuEJrz?=
 =?us-ascii?Q?pzR0wjMd7w/npCUBpT2KZB4BYGWYL1p+CQflNrxmUplEB/CHJaXuu7anSXPD?=
 =?us-ascii?Q?yI4bvzvrkh5CYYPIS0HHrIgdZziZMiYR+0j2w7qpZN9/u9U7HxsvBEH5Ka5M?=
 =?us-ascii?Q?BPc0DxTXznh8DjZUohvx5TOuUs3S4sZ0fKb1gXkirrlA/I/MCmXvZMlc0MWo?=
 =?us-ascii?Q?FtCEqdam0kkaZSSWiQ0FoMxXL0tzydHzqub296pkdCpOWXZvFleFqDdpsXUY?=
 =?us-ascii?Q?EPZHm6h7xBzecKyEFWAGYXtFob8D+aLVB1xjPiJuDAAcsbWVThulu8dbd2ng?=
 =?us-ascii?Q?Zp8Gn1WOVtYLnB+mXebqcVVvdH4QCssoIXrKE9bvuocMXHG7FBOY8JA5mtpT?=
 =?us-ascii?Q?9bCD5daxEeQdSk2MjizOuCle6dtBJfK4U/4KpUi2ODSjGqxTpwwnYOPIIXWX?=
 =?us-ascii?Q?EwoDEnwei/tCFnMY1hgUtLQlji4d4weV0cBMd9ZXAqjpc0gqglRhO023uaEP?=
 =?us-ascii?Q?D+Gzqy8EegBxlpIIsX8EiPmdOQrbgQVQPAa5+Dh9sWp9mQK8KedvPJk/YOrX?=
 =?us-ascii?Q?SR1WwyxCqsfsKZ0r56S6wJLivNZq54eToxJQ8IjBuz/LJZNVTOcxik2qaStR?=
 =?us-ascii?Q?fe9gFtdXpa9l0fo60aVNCJahix/xk4heEUlzWLhdN+IxboVMOx+4PiUe3Ug9?=
 =?us-ascii?Q?WxtgUI5RemLSueM5jxuidHy7d1sk1VrcYf/MToPsBOr/L6CA2mD+7Atv1Iqr?=
 =?us-ascii?Q?1haP3xIi7wXAtsprYp0JM26nvjydETdzTBLwQalVNscDGoyzydGo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fb01a9-3f66-43fe-8c22-08dedd0c04ea
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:14:42.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8YicL561L4adoOP/993nuj7MDcXYmMqysaDwlklc19zhshcFPw2wxv4gMUEORQxh7VS7xOnOGPMuyyli/Gb/cTlkG15zX9ti4pf2vuEUFoTgI9sr28hInwcBQW59+59
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67052-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C47E728B6E

Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
that accepts a stride_alignment parameter, mirroring the existing
v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.

v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
with stride_alignment=1, preserving its existing behaviour.

The new helper is needed by drivers whose DMA engine requires the
line stride to be a multiple of a specific value, such as the
Renesas RZ/G3E CRU which requires 128-byte alignment.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes, just moved to from PATCH 3/4 to PATCH 2/4

v1->v2:
 - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
 - Add v4l2_fill_pixfmt_aligned() helper documentation.

 drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
 include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 54995ba8c20d..2ce4f1c20fbc 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height)
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment)
 {
 	const struct v4l2_format_info *info;
 	int i;
@@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
+	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
+							stride_alignment);
 	pixfmt->sizeimage = 0;
 
 	for (i = 0; i < info->comp_planes; i++)
 		pixfmt->sizeimage +=
-			v4l2_format_plane_size(info, i, width, height, 1);
+			v4l2_format_plane_size(info, i, width, height,
+					       stride_alignment);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
+EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 749fe38c134e..be4dd9762196 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height);
+
+/**
+ * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with stride
+ *	alignment requirements.
+ *
+ * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
+ * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @stride_alignment: stride alignment in bytes, must be a power of 2
+ *
+ * Fills all fields of @pixfmt for the given pixel format, dimensions, and
+ * stride alignment. Only formats stored in a single memory plane are
+ * supported; returns -EINVAL for multi-memory-plane formats.
+ *
+ * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
+ * rounded up to a multiple of @stride_alignment. For formats that store
+ * multiple component planes in a single memory buffer (e.g. NV12), the
+ * alignment applied to each component plane's stride is scaled relative to
+ * @stride_alignment so that the chroma stride remains consistently derivable
+ * from the luma stride. @pixfmt->bytesperline therefore reflects only the
+ * primary plane stride.
+ *
+ * @pixfmt->sizeimage is set to the total size in bytes of all component planes.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
+ *	memory planes.
+ */
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment);
+
+static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
+				   u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
+}
 
 /* @stride_alignment is a power of 2 value in bytes */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
-- 
2.54.0


