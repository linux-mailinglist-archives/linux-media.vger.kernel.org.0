Return-Path: <linux-media+bounces-65533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id utvcFhq1O2qIbggAu9opvQ
	(envelope-from <linux-media+bounces-65533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:44:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F46BD76A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:44:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=jHgrviBJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65533-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65533-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5863E30DEE1A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C742D0C8F;
	Wed, 24 Jun 2026 10:42:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22921DFDA1;
	Wed, 24 Jun 2026 10:42:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297779; cv=fail; b=G6MGPpjj6FUJsPDzEbr9fi5fJHnfRysv5WXj0Y3cIJeaUgCws127TnfokizgVRm20FR5Pv+Pk2mfGNk/Gts303Rhl/kNQcUnPQEFo2P2l8F21Jnf2sQwfHaQy0jOw7SNA5L8U3dr5+qnBy81srka4Tqmdv7o9HlZaVkq22+c0kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297779; c=relaxed/simple;
	bh=bUq76hAQAa/yuqgbYRw+X9QwQwUzklKObwhD3LIgATk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U7uc5TazD1MmF1ce/UYLU/gg+AtCxvtZKI6N2djTUMuAwxPizaYRkCwG/O3AaK1fxBje1U86v1FMTDBtgjODeLMv8zXW6Tszfi9CTv8ogKZx8ltEOWBY3D62hCHy9yT/AkmDOeI7WAVjqT+B7IiUPNtDdYZctfiCOwilmnuYFh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jHgrviBJ; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXYT2cNd59C00R7zg5qvTrhVA6VS4VsizDpzRk4/QlaHJv6wYhMfCDbaaVjXCiuc5TM6lf/BKKLEF90VqWZ9A2Obe4IKrTjF8LaMS0pNdvpNTq5HzKUtgxodPxgNryNdvV7LHV+SgzBdNQX6MabgWODD5iC7ksHiM9p25nrUuoN8oLOEoisvjQzp9NuZlTKU97ZGCA5DiFps5N4UkXeWzqZNbzNeZb5eI3QFk693G+RieJq9gfmApl1QuNY6K13W7hd0oHNB2jy/sQcU0C+roeXwIzFSQO27KbnsfF3jBzdOj5YD1hNHqnKcoyLaZWmGl5OZpOF3uLC3rWU0GVKo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoFajXsh98QtjsNeVd5M0DARoMJYkBMPr+OwEhlw2V4=;
 b=n67PZC41xuVq3+tXVrz5rRGOx5fKa3xLlyMpIK/FYUAwaDZRoWJKV8VSbS06Z7EbxGiu0OwnFfnx87+JzapBXkgs6DqNFwkIPm4ImeWC6ZNfkfuDw5U7tj+eIa2w3UuA2YGPrWD0FY5T3IcZZI8zG57p0HjZwmpgPH2SrmJrudGqqC/IuCFpO6p+fYk0ds3EcWO6hZLHm6E/Ak8j71eS3B42U1hG4sVgQiL/z0/gUVF9ERlP5SJd6JDhwGRyV6ytot3Woy9ivUGrDecFh/2CnCg/kTM7jZD9TKyNIx9xyOv4XTOKES+QAp5ryWd53ovNjpQ7vS6i3L/qP6CSNtndlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoFajXsh98QtjsNeVd5M0DARoMJYkBMPr+OwEhlw2V4=;
 b=jHgrviBJEAUcfImEDoZ/rPjbZwMKn3Q/QvB7CHNRzcJGSwL9GKAh6vlvuYQgcSRGm43t9z0aZ49EeNEDIQgjwjvaEBhKlYXnfeIwpGLYCMjkCIHDeAhyBpfH3lcU4Dvx2y1xz4leQDZpL04EIf5fuJG2ZFAsrs+OLmB1TDAKtbU=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB14159.jpnprd01.prod.outlook.com (2603:1096:405:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:42:55 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 10:42:54 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement
Date: Wed, 24 Jun 2026 12:41:31 +0200
Message-ID: <20260624104153.798953-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB14159:EE_
X-MS-Office365-Filtering-Correlation-Id: b7795b82-f799-441c-bca3-08ded1dd58f9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|18002099003|38350700014|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 wm0YaP1VT8GRxvYqp2CKzhZcl6wKC8gFqN44RmX56cDdpF0MBDJUtv84aWZL4ZdGuy0GrUMynAunLNo7/Iio6tPW6kreMEUgqPw7DgK4e/ZuFLqOqfqG4vBl5GttvV3IWZ3wcOIJn4BYagdNMcqz1ij3BwC6cLmAXlPyQD1ft0gTQWYBacinT8F4hqHDaB6u0K4JYVmcKhEDvmQIc9wgUEaCsM9uOeOV9QAynDgp5AbTeoPADRBpcyW/oAnI/qAYUy/BcolWVR3yGOPEJMEaiISxaRR9VK4bTgLeP4URj6PDx7nTDRwBoP25zc+t3sXDB+sfewXYgOJNmVosSGXa7IoY0qknv77kME9s45wmU8le7wdy1Uu39YiRXF4jWnEGOflIEtlHXAJup/Q8XVWDP7gLt2XxIscRZR+n4Rj1fCvhrBEWCfV2DXZ0A+MG2pu9qJbU3v6WjoGUqCVDlcZ7mQ/fdRSktoOXhUorT/MaT2l3eUcfD6ROaspqv5YAg8u8NFWWMD8mySyzU1SN8ol9fVL2JJiEs2dZ5JnKnNnHcivvajyttJQCjQf1o2DgM7K93R6UnXUJpHuZ/WOo+ctf8+7YK1SZo8Hux0ATKLLtG+W9xWTgGpD5LK38jDzjlHde7eKmdNaxmMpFveBsk6J/fZuxw8zQ8cytSIZsF3THeljlMVn5JpH7ZJzgSTGAxxnBmGmEgh9XaifqdKR1DS5jzC8XSrXH1HrccKnDB42zGd8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(18002099003)(38350700014)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mk7x22DU3wyufN8FfTub98YDbPOgFyDBLeanidQ1r0iJCpY64HNt0gx9fZCc?=
 =?us-ascii?Q?uHUX0TgCKfjfWCBYX4kII3+//xcsTchcIqMFg1N+I/hqQ2ZPLxisA7KTpAu/?=
 =?us-ascii?Q?WqtRjHsqANbw4b1KIgThyyITNi66iaPZlQQmAlvUzKojzBK37LzoPzqrBPoH?=
 =?us-ascii?Q?4GE5Yy8mxmhulpmHDFnt4GzHQ8NfbNcVV94+w6dW3KG5ec4IJFpgs/AynqR7?=
 =?us-ascii?Q?lYeiK7T4geCW1++naxs2ZMhvB+pKzqHoAWFA4nMUVgtyxQ0d6l4mfwlKarex?=
 =?us-ascii?Q?vt59QE0RzH60mWMl0SR1oI4ay/bMkPXRHdMtS9dgR5V3GQujgi4vOlQW8X+o?=
 =?us-ascii?Q?oB01c5Y5ahOhGHhGEMM81LGJFvvUVYn/4kTFlM45xrEfCkOeP5+O5EQSXA7e?=
 =?us-ascii?Q?XizQi7G1LrxNoMb19wZNw0z/2xwzaRjalOp8AEeR5BxElBo5N9GIqKoPtWWj?=
 =?us-ascii?Q?G6+dzzmyxIRtYgCCB+DShfPkJCWYP69Q0WenWehGYrvsiW47ZLZWGJ+AggbI?=
 =?us-ascii?Q?htiSG5FD7zRk6805Ebe9tP5+Lpg7nP/3Ct3UjQhhUqXlEVeNHUukhVSWn5LK?=
 =?us-ascii?Q?EyXnYePeZGO+ctQx9t8JsmBw1oeNRw/CsiTg12aR3MjP2IN2gpulWRYWq0Dz?=
 =?us-ascii?Q?+D+m33GgQtzjuVyKjM2TIeTx8n4dXt7rRazGVbBNLsVuy3M+v+GCC5Yx433G?=
 =?us-ascii?Q?68GMmhME/9hQaxNobEsena51MMPJ2q7ZY6qIFky9obUotpTxJVo0XOpkx9df?=
 =?us-ascii?Q?nA5kq0WpxBGcWXIQtb5/tYTajf4qtmQS1uG8j+hlGxz3laBnm6LE4TTcGfbG?=
 =?us-ascii?Q?eixb7Rin9GIj3QTfa5Sj1Q+DB/AIwM2ZdBTTr+xNMOvvARNzh4Pl8DxQqqZP?=
 =?us-ascii?Q?FLdqtFRcwaB6lAwDevdnzyOcfE9sbv2sEEmDoo71+lVHGVCyP0eE1XqGVKOg?=
 =?us-ascii?Q?Q/G8KCdTbCNK1kOCJTWQP1E9+ViuAOJojHNMp54ZU1pzHl2+Kd+pK4vdQMLP?=
 =?us-ascii?Q?AvDJF2KhPYkChARlXth4GSJc2h86dY74bFxN9CNXbo+ZJ/jL64FdpN0QMbOk?=
 =?us-ascii?Q?dxQrs0wJvx5gM+EuGi9DHNeksW7phoB8zcl0Xpl71VjuNChWZRKOS4bV8gbu?=
 =?us-ascii?Q?67Tp6hGtGQMqshlkNMZvRz7nVfJqKxAgMkIzFhJKFDEQbsigD4L7J8kfbFIp?=
 =?us-ascii?Q?KM2MSTBiljTGZJH8VjMLbt4Q+xrw2+6QTdeOKGLQrixC8ngJfXKtCevT1sRH?=
 =?us-ascii?Q?Sz4vvHuQK2WYQ8pDWcN0D7RxTMIfIIsjM2SLNoXdNB8rPnajzNB4LsnfLtm7?=
 =?us-ascii?Q?f0MXOTqOGf/rbgdxIJV/RlqLNSqsKRSVBXhe70fDvgkxhcYT+CAtnMYNqlCs?=
 =?us-ascii?Q?GpZ6Fh6MNgKG+PKFJgRTXONYjcyi6kVKAJhWlWnqnorKicTcPrYQIJXsvRmo?=
 =?us-ascii?Q?zD3xYR44MoI5hviDDSKHvuV5kWflIGWePiQ+mnfGLXrdwqI50/rSjlZbWaCX?=
 =?us-ascii?Q?dR2fcSRnPfWjyAZW39r1gJThKziROZnVxO9pvFM08K1MlK2EhhuotPexWXX3?=
 =?us-ascii?Q?lqt0y1QMdMHpFtxgumgsyeG2SUQhGHP+8bmrvK6obijGHTwWhm24KfgN6BVW?=
 =?us-ascii?Q?XJIR7dW0I5oz1Rlf//f3s7xKlMliHUaWGN7feVd3tWfVMYQML6dYtwsG99Vu?=
 =?us-ascii?Q?5caX0nckZ5i2NDBWGtExhfw+Y8zFi1NDQU35BTP4Zd/ncmQ3HGpXB/9vzgn+?=
 =?us-ascii?Q?oQM84/qEwONtxqjxBi7TcULU/s9PEv4xzeYpBMhdGu5eWk0Y6oon?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7795b82-f799-441c-bca3-08ded1dd58f9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:42:54.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jp7TW4PzkjO3RHp5zRLgkmgul5R+qz2k7AR5Cwj9tEK4bGaCRvAfYaRDdjjUNbKB0epkcRmbbr7JebDjo5HXrrVALD3HkLtVQxM03meLdEBuLKYmaSbe3W9Ibi/w8VYJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14159
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
	TAGGED_FROM(0.00)[bounces-65533-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:mehdi.djait@linux.intel.com,m:paul@crapouillou.net,m:isaac.scott@ideasonboard.com,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A86F46BD76A

The RZ/G3E CRU programs the line stride via the AMnIS register, whose
IS field encodes the value in units of 128 bytes. If bytesperline is
not a multiple of 128, the division truncates and the hardware uses a
wrong stride, causing horizontal banding.

commit ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
replaced the open-coded aligned calculation with v4l2_fill_pixfmt(),
which sets no alignment, reintroducing the issue.

Switch to v4l2_fill_pixfmt_aligned() with RZG2L_CRU_STRIDE_ALIGN when
info->has_stride is set. RZ/G2L has no AMnIS register and keeps using
v4l2_fill_pixfmt() unchanged.

Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 69346a585f9f..478264f26466 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -860,7 +860,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 0, 0);
 
-	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
+	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
+				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.54.0


