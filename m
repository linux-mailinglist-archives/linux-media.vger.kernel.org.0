Return-Path: <linux-media+bounces-67435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZhaQC+qbVGrioAMAu9opvQ
	(envelope-from <linux-media+bounces-67435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:03:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 830447487AC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:03:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=BXJBdK63;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67435-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67435-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC5273022DFB
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778623A451E;
	Mon, 13 Jul 2026 08:03:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F41F91F6;
	Mon, 13 Jul 2026 08:03:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929822; cv=fail; b=tCyI+vl3bF5a/CvlEn95ONdH0PtHYxwyuzPLoHtajZAoGAb4mGJMYGKQta6LoVXta0kT7ObmNih7vyJrEm+KMPjqT+VT9TZ1yWIk2rSPa1dvOAN+YLnIJ4/v4XgwhgfnBkFST6C/yvx00bLCVV11SPCl5e3SjegNyfAC8YRG/gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929822; c=relaxed/simple;
	bh=wH7uDAZe/jIKhs3uAbHUxkIJD/FQCPD39w/34TVpyQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PRuCDnuN8xe47yqF68paYLrryyoT4n/J5LNH050s8QthRbhTtgTTqy/+lU6bZuclBcvO+e1UXKAEU1cwbIPzBhK3Jfu8D4iZVQIizNa4sM6KxtXYgOeHqIlrAl87UXx1KK+AB6Y9uN+0DuZw+skgt/dfpuCelRwglhU+hr7sKfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BXJBdK63; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCUgh4qU3Z3XXFb+FBTplm2spqk3Njxee1df/uEcgJivSQfwp9C/H6kVS0zTwnQLi83vw1x22F9f2oBZago3Czp27dHbHNYGZyGfaF+hSkOIyt6/Ch+BQcTKS9K22EX492Pek6jDbI/9oHCW6FLxdGsIbnA1fFAgcGi+oUuZX2whag3w3qNRLrTp166V+ZCqmqrFf+sJDrbSqdxGgb8ubNiSCGc6488+SnZZhbOtLkmWkgZUo/CElXI1l5K007OIfUbeNrfuGv69FXvL7G7bGoGUvElNUutV03LUN2e734CnNh1YkuPRu0WqG0ZNTiVsqaozEBJbl7fQQ9s/PbL2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD5dGqEUMoPwY8K/+RNQUbFOHb60hk5E2kSUIJIJyBw=;
 b=fZJS/vBzspV1HVMhLCJzsjog9ysHPZitsSJrwNbvN3Q6HdqVD7MXzTaJTalRwuuUf0es9iM01i5e8ks6jCaxVyhBvQnXNOc/cTdRzEMhBlV2KOPyRg0IZTdMFd4oc6OSFoQOCY7I8LroMLJU5oVAzowdwzayiUEKC5v+ig2KSWq1TsrDVDkxOcKcNe53GL/pEPdhAAhxvjHueOg2Kf+WFbUF/Ee+IsWynzo3nsUTil1ojRUNqEwdEXl62rvFBVawaaGQpt/39Rkyt1+EWyIWPYCLfxlK6o6P7e4NiNEFnDU+I+j9n9MUbAyPknmMCDuMr9aTOm8kg2sPvEqlh6cFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD5dGqEUMoPwY8K/+RNQUbFOHb60hk5E2kSUIJIJyBw=;
 b=BXJBdK63Okg+7OqjzxNsJsed5qLzETToZs/LFl6AhYr8nAgVs/vdcQYTGx7qK7lY0sKk5y44aolS6YOh68rpafNqCZWQDQA8cU2W1GkqBz9AZDJIlbYgIjXH/EWKgkkeb00owblg6qR7N0KrGbozK59tUoJLBR6bhEAFg0qUSHg=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:03:38 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:03:38 +0000
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v4 2/4] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
Date: Mon, 13 Jul 2026 10:02:51 +0200
Message-ID: <20260713080259.21835-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11657:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f2df35-c4f0-4cd8-6d28-08dee0b53ef1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|3023799007|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 RAbOSlyNxYQSi5R9fKykNw/zfN08ofVeGnI4n+7UFCyMzXJUAD+G6aljdrDDxOvzqwNLts51qYbIAzIJU0nTKXdvr9DjD2mFHntidIaBidisXpLjj0IIEZk+kEg8VbZtg2KY4QEJEHha9KjkDDYokqNDuZyezmXjN0uadYMl23uGJVGIMRUBCsg2DyoDTdQEmqHrnOi+uyUUSuxbsY5Jz/uvKfKcMFjyMGkbFBYoCv5TC6GdlHqwttWIWksbWmdZzYUvN1GQcBNX8D0iQ4PpDsW839uFhpXasmzzzXoyzlv9MVCxuqRbc78tDFtblOS1cd2sI2gZjfy3rbCtT0eA0Ji/gDTFOCnYkyPZcdcozE/SXp2eU+Sor5vLx4ytD2cakYHI3Yn7dGHGWKP3C/Q8V+b3OjCPj3KyRTcPFtBdDjaPnhqEg2gTRoqTOqX6Jm6ov9nz4gLCWfmqpRp1sr+tUvqOJ/W/a8IkJW98gUODdmjbDP1nQyFr3f4GZmlpgE3oAcIk2a+0YV7oNQ6SU/xz0dkZPzO3pqOl0Z2hlipqQF/BlsR3/fdzkkjwBQqRyPHwsubCJrEDvZENI2krce4ftoIlzMwUCINGUhnx3sUcRM6FlqZPO1XJnTmziIcKM53ZAbRX2tYMOgpuCm7i2gIF8Ay9CacX+WksumUWGtjsXP8hoIUUjquJXp9zrTAIAqujNpkahnUOaV6RaBDIeZWB3g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ovcKdIjXLHgrywJjWhfOaH5S11y8JMzYHCxmfgqbn429TtbYH9Jc/M5qp7XX?=
 =?us-ascii?Q?7ROhbeFZTY4oCeENC5G/vjJPOGSLLuOly8+vs1EYW5ufePlQtx0Twzy+MnAF?=
 =?us-ascii?Q?mPyFA5PcvBm5NP+vUjEy9Nv+08Wvgd2bkw1586M5AJ3UZiv6W3R/vZUTO769?=
 =?us-ascii?Q?8/in/TwzTQjldICvGf0wGgaiMhOk2BykGAgQ1umLRLmYwJ3IbBd6Yb1i5UGd?=
 =?us-ascii?Q?JJqlHsPsgmsuAl+CObFbxROMNGxaVDVvv1tnhvkSxC2VdyHB0koexJnFTKqi?=
 =?us-ascii?Q?oy+gyUgLWrvMwpmHQFry4pTdD6+11fDFWPlHfnC73ObPjk0mUSz8KBNy8+VJ?=
 =?us-ascii?Q?+PdMQrReykdlM/b9NS8dSTW0kFPQpJwqsCmCDyhKFyBt0HuKxWqLuIQCF/KO?=
 =?us-ascii?Q?2IgHghtUW9hifUgIaqo3gIdYQRoPwlJgTXDqxYOYTDyCAs88GzS4VjMV0P1T?=
 =?us-ascii?Q?cI0jRfyogv/XnXpbzKmd+5cx1Fbg/kSXuZcKB39dqzbXmzHnMBOnzWZxrKG8?=
 =?us-ascii?Q?/vFjic5APl+4yiXzuYwuWTet5tuwHeWYP6nOnG1JSNwviTOXktbFuiSnxYfd?=
 =?us-ascii?Q?W2qO4RvFCT75bDXhwbJZ7Gimdy/iYWSComa27HU49bKMHoKfgCVg2CkqqEJb?=
 =?us-ascii?Q?vGnwRMxXUH3+p3qyIS7fTAsiPqdxV/jVhAMG2MxjJx9BK3ip5Y1uXUojwZnR?=
 =?us-ascii?Q?HWmQB6b9KUjicD+RG2x2lRbZVj/DeNUupLKectxyTAvXs6Qv0+cv0LdBfDqA?=
 =?us-ascii?Q?r35EVSDO2nTWLwyv+iXphaHlH9tjCdOrNJU6+Ld5d8+jAJEd393sloeYm/jC?=
 =?us-ascii?Q?YXxHO3F6RoTaWqmNHpvmJcD6UcnNdh7SHn7m5E8clj2Kiv2WhGkKayouVJam?=
 =?us-ascii?Q?Z6h19gOtA4SSkmbzPf7FUxJBOX4mrsb5IaR03+MDPB6qU4dYYd+lE1426yL0?=
 =?us-ascii?Q?RBzg2o8Dq/FjKvn1xHkncm/fk7g00YCHAjdbsBGrHvv8BFPJBjvtgubz5y1Q?=
 =?us-ascii?Q?bC5ttiX0a7FAkutmY6IDBrQX81FXZzZAglA0K/cJWoABcvo5vDh8bafW2YyU?=
 =?us-ascii?Q?joDJbOiXJNnn96lEMBVE7hAKelmHfF7epLF8zXUMD8T5LSIib6/9uF4SFdgW?=
 =?us-ascii?Q?sS+9xaCM3guJ++OVb2bIS0exC6gr6ZpTL0S9nXOz6bM+6kWD2pHePxGD2Np9?=
 =?us-ascii?Q?p0x5tksAzSPzeyM44cN3csDhJRqg17quFepalHN3rMOz0pg7K97fzdHZMkvO?=
 =?us-ascii?Q?DvXDqUySCuNdLy1A8exyVvOXl2SX7HGhK/3KAo1nDGFU2nftN7/auKC+Loza?=
 =?us-ascii?Q?DABHXqvWO0MFetpcJ1kOiPh7FKYTDe/ZfA9HHo2q4TQdburhYDw0j8qexVVq?=
 =?us-ascii?Q?HWtBp/joUoX1Y1UxWLqxijbXs1HxqhxPIhjQ3vTI0nWJIy68JaU4LEYd5Nts?=
 =?us-ascii?Q?zwSc5XSzq+OcUWUDdSWxiaSDX8GDaH7bB8fNQ3QEVcg8p0LQrTqkLx0oxXkC?=
 =?us-ascii?Q?gDzTgVaocOyZkFjgfVEqwVR2MZ2eUM6CzNC5hBf8oVW+UFwvlf6Rpj/mArwV?=
 =?us-ascii?Q?Ijst91pTlagPnxfVu37kOnTpZ1azDHCar8t+GZ/wpjPNqpguotkgocH0+KJt?=
 =?us-ascii?Q?7ZMarTfZz9HwiXPSPGugelwwcv4ew8A3gbIBkl+V6b9vbYYzASZilwIQKTYN?=
 =?us-ascii?Q?y8m1xuOoR6/7pCwq6m9EVHy3yCMiSHZLgDU25kS9/+havjfltknXQvPbHTjX?=
 =?us-ascii?Q?FDk4OPhVCGr55EVbzOtzHYou7yUp2mRQ4jeZW8S3cmuWA7RG62hI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f2df35-c4f0-4cd8-6d28-08dee0b53ef1
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:03:38.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msjLbegJCB4gGSlirV+g9g3yD2V+5LC/KZKAqbe7RToey9G3RBom3DJqM+67j9hs35CZO0iur9kiYbHwCFrqTgvFOKSm0XhxDTQSHzLwzncSkM/F3PKzdX7LM58w+zAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67435-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:mehdi.djait@linux.intel.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 830447487AC

Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
that accepts a stride_alignment parameter, mirroring the existing
v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.

v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
with stride_alignment=1, preserving its existing behaviour.

The new helper is needed by drivers whose DMA engine requires the
line stride to be a multiple of a specific value, such as the
Renesas RZ/G3E CRU which requires 128-byte alignment.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected tag.
 - Removed "." at the end of the function's brief description
 - Removed "component" from @pixfmt->sizeimage line
 - Removed wrong tab
 - Fixed example (e.g NV12) -> (e.g. YUV420) into function description

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
index 749fe38c134e..4e5c5ffaf651 100644
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
+ *	alignment requirements
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
+ * multiple component planes in a single memory buffer (e.g. YUV420), the
+ * alignment applied to each component plane's stride is scaled relative to
+ * @stride_alignment so that the chroma stride remains consistently derivable
+ * from the luma stride. @pixfmt->bytesperline therefore reflects only the
+ * primary plane stride.
+ *
+ * @pixfmt->sizeimage is set to the total size in bytes of all planes.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
+ * memory planes.
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


