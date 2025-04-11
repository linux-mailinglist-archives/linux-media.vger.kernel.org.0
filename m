Return-Path: <linux-media+bounces-30048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C06A8642A
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1598F4A3EA7
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1E8230BD4;
	Fri, 11 Apr 2025 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ws/8OLIq"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E492248BF;
	Fri, 11 Apr 2025 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391255; cv=fail; b=oRPpZ7bCoUZrb+A3yFYQ3McZNLFZkI5GaZ+UFYPDEljH/q3RLKaAp6SLQwjlqbx+TUvsM9ax9oLAmzT72jqQhWfvI4pulhSJtplJvsbNyMmNzHcZ0hhV3KXjbfMMOH/8tcgLtau8KIWfG2hfCFnogR6g6A8f1YL0UjBebM/BJUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391255; c=relaxed/simple;
	bh=+itG+lsmYTQWPhloQpRkN/MtqYNEE1GiS4/fCACV2Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gfDbepRM5bgkAfSi4GnuZehBdhWqgMuhnSgOHOjcsYyMHMIWp6noFUuDDCFTUL20QlssLOVpoUgP7ggBR77205MVF6ihK4g/G0T1SnGaiebh9ap6x1tFs7anAKHVbTJSh1EawV4UaktZTDKNMnqScGEkmeDSTbu3z8yE1PKR8tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ws/8OLIq; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF+Zzn9OCtlPzpL6rmD6fc7lgyidAfvnA4vOhoHtmrBe+fBzhqykWewCIbpju28a1RmC7MMV6H6kw3F5/DzrLV6JLAXN5labS44WlfkNYs6eIIHxDXt+02RI3k8IENG2ETUtQuO6CgDA2pP4Q1N56CfK1CDRzUT4SV6S2lnphLAj3k2/yEr0gjzrZM+FYpIrEtO7kY7qxQab6Zn8gBINT+hLsyC0N1KrfR7F+fGzt7HrB0OE6WtKqNzQ93uJY6YqlzkyyT+jWYhSEOuuFBMo7gCBnRNe3/XKWI6cILaqArxagwGDlja7fFKLOPolL/+pPIouyWV/mT8jFThuEAOq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9n1Jn/LuzaoqA08KS5D9g3uz8mHrNSl6RXD3nCLm00=;
 b=EmmY421hgAirAsEFHtxxwZXmTJJ8ftpqu0gg8TqVTipKyo1AAPTwV2hFtWdklEkopTvvDW4a1g5v03FZ1rig1sDA2i7H2s7QTAxBrQ7hvRZJFE18LRZ7pPxcjCY7mYAZQMmqCoikV+pd9znCYxOv7ENc/wZiRG8Hr+HnGTAbdEUvOoHAWgiaIWnBNYQY7gDk80yoeRLi2Mc8MefrlYTCSWLF0h+LcANNeZrqsbvp9MCUcwu4VG07X/iWS5Ux/7V6kloUHrl+PBXWSIw25C7Pzqn9XwZyH3bXSjbyG1jhtbRKbobbNKREYu0eB+2duzcL3J6wcpnEbOKbBFR77/1RyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9n1Jn/LuzaoqA08KS5D9g3uz8mHrNSl6RXD3nCLm00=;
 b=ws/8OLIqZM9kumUE6LY6krmE7hzyiZX9l+EMhNWA/4QPWJaEmwGDuQP9ogYYDWtkSL38HsP6ayYnFZ9Rzt5mtANrA1ot9hLOpW3nf+LLcXbZiOv2NtCcIR2OvVyJD/wDd08O6NHz9dClfgQjchT+/p9ZU5mtlNBAIZ7U1Kwaxng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:27 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:27 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/17] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
Date: Fri, 11 Apr 2025 19:05:34 +0200
Message-ID: <20250411170624.472257-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b597f2-1db4-42a5-f98f-08dd791b55c8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5naHgFokpFkVJtIfvcRoLzZnFclAOfPVDHsfT6ztO1t5usVycvZybxyAwA+z?=
 =?us-ascii?Q?XVljWFB5wSaOMVMUi3lZUiqLQZkRl1Wp2hAtHfC6YLx1WQvkPfSW8o98b/nq?=
 =?us-ascii?Q?Z5CZ/o5N+orhK/Mi3zopw6Hb8/YWGDahEpsn2z/2gBe4m2aENYu3l5kEAN0q?=
 =?us-ascii?Q?/PPgvU0xIjur4STZgiYNCVX1Db6Xnrl5x2yr7fnjs9aW197uQLfx1YaDfC2f?=
 =?us-ascii?Q?529/xOzS7H/OKewoX94/yhl3yr85CM8uwS4EKv+G+RqK0oInrcBq+Liom4Mw?=
 =?us-ascii?Q?8GxIoI8DNz1fPFILIREOqi+bbHyhLk0UeLM1r17n+CJsrscj7NOBlStUoud4?=
 =?us-ascii?Q?fqXTjkmiVqvDHNgCcsnw3jzJlxp6FD71JNVaRZ66/2fvqmQDixyR2poJ4MQS?=
 =?us-ascii?Q?hJvuWf6uTEkfKg4uvVy607frS40DUq3tp7oXYpJ8N94tCvMOVdshc2xGpPrr?=
 =?us-ascii?Q?cM9YS85MpEc/Zm3gO9wUNwu/WIbAz3vgKFMv4j9gKktFzU6zsp3y5GXoj5Lu?=
 =?us-ascii?Q?xj+RxZ3GgPKBMIyT/vtcza+EpOBCdUvvDGFm93pzzjQGu/E4GQIXGiTfBq8B?=
 =?us-ascii?Q?UJh5cwPAy4J3DIK/9rhxyFJeuC1l6dc6VUkl/wwNoruzWIGPu7SeYIvDxb7J?=
 =?us-ascii?Q?HQ/BIScbovBIABRAC+aqKJp4VUDx1cFJFRZyGYi1ANNjB32YGQCfK9DzqBrO?=
 =?us-ascii?Q?SiEEiSerIam1fH2xtHsaw4Ul/sSnpiKO4R09gmWWU709B4xmL199GYqckcDV?=
 =?us-ascii?Q?59ApWmSqim69VOvODoOiWS32Ut2Pzaw9gU9MN3b/vZdVWQ1N1NwGNTLZsvbd?=
 =?us-ascii?Q?HITafScCq3q3sl4HPLGVDTG63BSQFu3ttxSDaV1xTA0ZZbd3KvvSp8t294zS?=
 =?us-ascii?Q?jAwpvokYSWFaWkEpacNAUniyXlhhQB5Rr5/WAlBh18csCu4g8yYYBykpF3Rl?=
 =?us-ascii?Q?Asxrp4PRUB2IPwa/tycB+668qpFIwpoJiFGK9MyVP4tfZ1wbGeUT5pz4XJYV?=
 =?us-ascii?Q?MJwCqh6wCJnnu9jaCWHf9N0ZG7k1DZ4pgJq8mTzdnbwtX0akn5XwStaFnYKI?=
 =?us-ascii?Q?nWxZiqk5Id+EDuViYz9WdyESbAS1vTYAyHYMN4Z02lFYFQkJSw1Kf7gqaZy0?=
 =?us-ascii?Q?3gFbojdGnUZ+OThSFFuZ5AZ1TTYaqgJvFFdFyVnneU+9dgNgGBCvtriqUkny?=
 =?us-ascii?Q?vAxiKh5aXRRDo2YQDMckwIR2VNeqbZ9w44/LTi6zm/iks3kQ8waDhIpL/R8+?=
 =?us-ascii?Q?khtnnMoBi9bZWHJLBs/3VNltx97rOB8Qim4cFuk34P7Dwu/hSaqXDgu8v+GJ?=
 =?us-ascii?Q?ZVlBUAK5IfiR/9CLy89d8Il1SlS6wd8hwFbsjeUWDHLdeyPcF7VhFihAghe7?=
 =?us-ascii?Q?5bvTac3mM2n4kT2IiFMTl79h5aUDKZIymzqgS3lisTzt8JaNk4cUo4MufGwZ?=
 =?us-ascii?Q?qE/SCx7xWcZECs+u30Sx1jMdvtY7hXIVQg0otXxL7WLGrsj4Rr2uEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C53ccyBt9GhSGDLnNfJjmFKpNXoBQ92TXCnh0RA9kBDnYpsD2Hp4rQ7sQmWm?=
 =?us-ascii?Q?JHX3aM4XPf/XBQSOqneqnVynnVJbiO1Ck4JILC0aDO3uGomuabnEi0hlN5Vy?=
 =?us-ascii?Q?BNtQwAKRdmq2kwBZiAmHKekSNN1rn9A5EpJWFb3iwyCUOxjhqYOCrjGPPmOt?=
 =?us-ascii?Q?SLI0ECUmnNodi58YS3yQb5JnaQfuQJd1/HIpF4lL7GjCRqSqSeGC8WIhPq7K?=
 =?us-ascii?Q?nTwk59nbPnQFgM/GUrbNzpbksbtkFaXU7dsV5AzKeDdVdAaMstCEhDCeUvb+?=
 =?us-ascii?Q?jXh94c9UFRHaqDis/CkavN3cyfuhhdjKqLzn8vbr4uz1Qfi9PlQtMLMLQL/n?=
 =?us-ascii?Q?OLKj/aspFLvceobD88WBsiU7REi9kil4tbAdDX2aDhyNa/+BanyWycQikltV?=
 =?us-ascii?Q?TnvwgBSycfTsnJOAXUdZA78RocQsPee1r06LF+0FR8b4f0XNIVTCpU+/K5l2?=
 =?us-ascii?Q?y/xb7ZfyYGS56K3EN7VlhjkxMcYwWzkXG/WIc6aL43APeFYNxAqeI8U7z1xJ?=
 =?us-ascii?Q?b5PeWTfrUscegmYFFW9Fn37RTTRn12CxbxvLTWD5Z3UwXHPwiabDA16C+ngO?=
 =?us-ascii?Q?/1pAxxJdAQmk7zdt2aVGOMdEChTMK0KDW107hjdGipEy718MoUZytnoKgDdW?=
 =?us-ascii?Q?ZoJdMg5ny/qru3UHvwJfaDj6vgO58W/7/v5gEKnzOsxWj6/8K75w5GrRNxbc?=
 =?us-ascii?Q?hmmNUJVngmvwRdBwul1GBea3fPHECfGi+6gsUlMBDOxqrbaLdwGum977XWBD?=
 =?us-ascii?Q?Lqpd89frYioKcgW5/1A/9b5Ki6l+mOwU0bcNtGWt81C3ghIqgiRMEzF7L+AC?=
 =?us-ascii?Q?eWjKkbAZRi/oeqQKLBVRWUtu8PQtQjNOnkkizVqfQTd/WdHzYExmRKfgZe+I?=
 =?us-ascii?Q?5B6mySfWPSbcvVsPpWBSNRl6CsnRp4U29nC29IoABq9AHYy6aQGwGAXOXQha?=
 =?us-ascii?Q?qryx6U1GXrBkhM9h9FNuLlLySY7trpMCejHYu0lLQ7X/gdzGM2I4I2v1HwAO?=
 =?us-ascii?Q?P317HLO8DjSmAHQT8JlXKbUeLVXLGn4v17Qp7CkO29Q6s0HnnWIBcrXbUZcu?=
 =?us-ascii?Q?qdB+Dy1hemrR31Mdp9OMt9RHLmvQoFmLAUSbLLme2p7ZA1W6KDaLYBcBfUr4?=
 =?us-ascii?Q?H5o3WiF7QPJtwtG7VLLoi7O/hrUDTcgGfzHV/SsSHJin7HGtcsqMlMazXRZW?=
 =?us-ascii?Q?KYCiudsWESXMUQjxqkNop8jg9lRJSnxjLHhJRezp1fapRJcKn4pZ1YBh0RCl?=
 =?us-ascii?Q?2/TOCkbh1q58LuUGKX2W/B5K5m4jNi+eZEFqTFeKve1R+DYGWe4qZ32VH6j3?=
 =?us-ascii?Q?7gvAk746OHKrkhQLouWtLbw7Vp3QIM1MKOqx7E6+Ze2587n6Xn6OrBBEJCFo?=
 =?us-ascii?Q?ONlT6uHvP/MF4kLSVm5Tq6uIvgPTZch1NZdYQzNHXll80rLOtLbp9Otota0C?=
 =?us-ascii?Q?OaVQxbKbt5W7qqxwDqJh7Eu2nainPoz8OPdrynmCol5BC84W0F0rCYX6j+Kf?=
 =?us-ascii?Q?+6675B44zAumLC6YXbDss2sNqhBr78lMVmdpc8CLSgZqIcqgTOqg5KrY5RO2?=
 =?us-ascii?Q?9O4GH2pcFefGnpNq4LLp/n4PGJyTItV4KBfoOf2FMcW9lJbzisUJarswWpcB?=
 =?us-ascii?Q?FPw5FG3RiqUjxkv1KseG8GE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b597f2-1db4-42a5-f98f-08dd791b55c8
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:26.9936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNibTWg3HgTRmwC/iVQzVmYIe1NqquFFGTDzAE+tSkez0F5Jw+/KmobWhpTdnZ2EPxickLU7s343F7o+cWNhzGJGQDUxw4A1oBeq5RR0dOTVpeeME0JFR7mfv7bPGoPU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a49885..70fed0ce45ea0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


