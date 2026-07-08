Return-Path: <linux-media+bounces-67051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w0VoEbB3TmpwNQIAu9opvQ
	(envelope-from <linux-media+bounces-67051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:15:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3C7288E6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:15:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=oilZjiR6;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67051-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67051-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 217423049C3B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51C842B32D;
	Wed,  8 Jul 2026 16:14:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1541F7D0;
	Wed,  8 Jul 2026 16:14:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527280; cv=fail; b=CEzW9TFTWsfkSoUyLD/OU16HwOC5U0t8JhLVCAdLuQQ1Kr3B/0Fxz5bu5HrwXVvtDlW2WvAdOMiRZfMqW4jR+stKf5/qwt3phC68vw1UkDJ+1otj9kqdySzWuBKZgJXBYA68hlv4Ts/w3WmKO/4wP65x58Zp96uw/8BB4t9iX0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527280; c=relaxed/simple;
	bh=BKWBOtuVcGw9p/AvNQns2TnKGiTkBYdN9YDtB9NbErM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ruLPyfW3tM4EvK2CSBPcKokzEQJ/9c8uObyaFXpIlnjgBmnGHmOzxiLtIJaJaOjCvcAwmWaaN7VIrX10ykIo4eBLMjWXyOXn293wbvTdLoIS7efZFJwacUfBtWgm/eRgY8i4ne4bcMrTEkbpukv1DwKZ6etYh0sAPAeyPuze9Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oilZjiR6; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnCV6x8lCqpKKOyMhT3oDDIk10ksYVJQbXqcCh0zo8CPb901Cm/lw7X5Jc4yITfichEorR+ngmJ0YwaNVDQJmEM8GeXWPnWXAHw7VQCjvtmdqk6S7XpGGu+WnnE0WGwuKBV+k6dqobvSjYMcoXodZow55WYGG9RJNIVi/SC7PW7nEugvYLUz7P6wgBzcwxPj5oF6Zf9tJ96tZ2F+Z7LgQ25QQ6YasoK3Qs/p+ONXswGQQt7sUzTWg9WjJ0pCumXNYINYEVW20DTO9mno5YyPAOgCZgOrpVhSTWj24gdrrmaf1xdKL+648yLXieGbpD9FKMq4F5mNNIlkmqUU+wQX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfUwR7Yz0Ys34dLk8XdboN5kNG372mnqN8zgxCJpVCg=;
 b=w8HMoTGCWSTGJEM+2B9hmYUomn9yDZi5fzzkucpRVULR5DdOkW+CgurtlKNeW2AlT88iqh2JPezCkYh3Rkhpl5Iw7RKaGULWn2pVbFjqV2QunXxRxdK9q0Syv839WcDDN4W74XEfRLZI69emwroJ+r0bDUiyqRdM3oxxkjyRjbul8XjMfuZ9JGfzWgRTuAH5SNgiYDnSetwozv1W2EXza69R6cxYRJSov+NSIljEtCirEPWx82Ho910qONYRp16clOBWuoxGavEsCQmovdSCCcuMxc3dXdDD4JMHqiGqhMmjSx7/DfbgISyR/e45T8ANMV9CKutGtKGJUodFV2O9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfUwR7Yz0Ys34dLk8XdboN5kNG372mnqN8zgxCJpVCg=;
 b=oilZjiR6+dPk1c52m391nsi6UgL9DQQaQ19DjnYai2N0+uk8OVStOer3+u82Foz2FVXXE2kcbl6YnNa74UBsZf1eD0jYxGMHstrhsvwLwCxm48xhSIxPHeNXMIYcHeL7MobuQuhUTphIB/DgAEuG3z4FY0uDkcZv10UQkF5agrQ=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:14:36 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 16:14:36 +0000
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
Subject: [PATCH v3 1/4] media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline wrapper
Date: Wed,  8 Jul 2026 18:14:02 +0200
Message-ID: <20260708161406.396183-2-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 873d6443-8dc8-4148-f725-08dedd0c0101
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|1800799024|366016|38350700014|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 GUpYNKitz/iMNFfv/bFAODinr4PD26fNmhU6RFh/+XuoCivWdVQCHX8xqWMuXhSzhylHpdlE+vPofLtof4NhfFypI/CrfRkhHRSolCzQ5mLe5vht+1f8hCOmFAlXFwb6gAzAbnmjEqt7qcLKGarwiiRbefwpADp84GW33RQ9W/rUXH+kmmuN7zvn5JPA6+kI0SSFJy0mPS/F1z6JZrKqHqE8UEk5JUJFGEQZlm9vMrGgxYiLYCQuagIxe5n6xiQPIQDnH9tGteGtdJ2idh76XYTDPetPtVoJiUCxvEwBpPOGi6oVg4pMF1BqS5IJXvDfT9Q/bgINFse6P1PzZwRCo/gEnbtZnC7rUk6h6Yl0i0ydcOtTfVIVbUet+S51kNsjeh6/cJUDBjMQmkGgfF1diAywld+AD//ldY+tyYAZjqfnm7YJXxOk+ngGVpivRYRtLHI8H4PijdHtq3nubPp2kl6cx57QKDKGk+Hs+/TqDbGrlnTifp/28hUHU/VSs0h0qoSSQCA+gF+16v1BltmvPlPniaGmVD2e4m71hTMmUMwmmjz4yKcU9A8elsIqCPeIt2sL+Qx1d47Ox1bhZIXCsD6dttTk3eh5MFRW/cMh/hWNj4Ta+Jn8wQTEMwOzBRZ4HEPddnkPKLh+70p1m2ZYAP7czEhmp03+2YLF0cac3h5stc6qq/QujTN67SIQKVPU3KB7LSprrYKlbs0UKjdqC4Mat9bB7nRm7s6VsnQ4rEk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Pf0U580HoFyFs7Rm9Q1G92p/gq044TDEr2lgSaBXdB9pJ6CltRK9La+RqLEI?=
 =?us-ascii?Q?MHl99uQq65cuERr3FQ1xGgOp7WkhKyUC64Za+FU1fMvBjkUgsHNTtmayoj2Y?=
 =?us-ascii?Q?Fq3pWwXz3n1P6S7k79+eC/etJzN35Eo2Mn1jxM6u+GYkeKdgrxT+y5kC+b6a?=
 =?us-ascii?Q?rqjAWms5mzQOg6YsmVU4cZxgKf2uGopCPs0MTlpeNjl9MMildQDI/Up9QuSj?=
 =?us-ascii?Q?/o0VTR8i1wGJiFPRJvVIF+Mlvqae16lS9UNTaZg1H9FMH8pxRhd4hwM6DqVB?=
 =?us-ascii?Q?fFODOZAfcJkxUZt/k3V9Ahng0AlEjinzBPN2IR3EHv+gM4mpi6n072XCoZxw?=
 =?us-ascii?Q?mR1TafqmNROkR/i/tQOvIaTPJ1YP+eCdS5dGH1gI26zgu7MujiMb1FL3snUu?=
 =?us-ascii?Q?HJMnf7MeJirDWticJ3eAM6si/C1YL2rSoX0/sxn2vS5l2tWIeBYQPjCI2GXk?=
 =?us-ascii?Q?AxcRVUssC1bUEefzOGT33QwnVRz5rs3k/33uSEELLjrjubZqUfY2C+Xw0WGI?=
 =?us-ascii?Q?4hSHBT28l+zuoX//sFGWX86023GDWfSD5I49GbfusQy30x5TRdLS8N2WvV1d?=
 =?us-ascii?Q?R62mxWBOEhSD/tLrrOB2LbfuB2P6KVbrFNCIYPDzvZDiewFGsQEPPXo8KKVu?=
 =?us-ascii?Q?Tju02XCAnz8KcvHpaPAWLhe6aytR7oSatzn3w3nHFwywo0Z3Q9CnCRA1rMSN?=
 =?us-ascii?Q?P/xKdkj6XQ9kztVfswJEyOKJyATXNGxzyRZHjcqJNdDmfHWOFtV2nbsz+xUp?=
 =?us-ascii?Q?pelK762+9ZuxZ/rhYoYHSDxffx3X7h14/3iAOcuzDS7ox/Y6sUgXwyoOlgsw?=
 =?us-ascii?Q?ZxtP4SO1eWlUwFByEyRTt2eaL2X6+fMKOp/Zorx0qyB8hx96HqBAc9zRwdh+?=
 =?us-ascii?Q?ktlKYzYysQdsXPu2UB9SSLkHSXmPLUwWmdOZSSupVws7My+fLlOU5kiobIOe?=
 =?us-ascii?Q?BHFM1Pj9Y4oqMlMjxOr03n9loLrWFuRq/88PIFAV2BxsqD0CD3YEJuERNS7R?=
 =?us-ascii?Q?VnUNshZfOSXFGoCnHRutNrQVv6fjLukI7dTKUclqICgVjUN4f3IZ9U3aUz3K?=
 =?us-ascii?Q?CqssLNQbFsg3l4t6UcCnaBC6MX2SyYFx2182x3JP255DMAjwGk19lP2ESyZm?=
 =?us-ascii?Q?Ch3dUKvVFVXTOo+jLek5rgzVH32zt9QySXDRDXEMyIkkhLg/Vesg5BB4cCqU?=
 =?us-ascii?Q?pvI1TxuElOn5PEUVnY0ZFCYe1hycoZBNic/T1RqvzXYv70A9B51MptyJQYfw?=
 =?us-ascii?Q?wazZYiCVwO38FQHFPeGcd7itP0TPM8+c9ynDKybSCsVoZMRu+JBiem7Acv2W?=
 =?us-ascii?Q?gIFUF/Z3Oevxs647LUaqmy02+/BONeZvH+Z0CqxtG9vAIVsbaRHq1JU7u1ZB?=
 =?us-ascii?Q?K9+q9RN2lnLQYPQJwqqMgfYP4cd1luwXcwRwS42k1u66jIgmoSELNmKo0vAi?=
 =?us-ascii?Q?6zu8NsTXOUHNCRMVlc7z8ct/kjyWUqJZk6LQYV0Opd5poNrqksRwXO9b1ibi?=
 =?us-ascii?Q?fX7DHm3LAUMbfmO2XvHLZG+xg4SLyJDr0wWXs/eX6dKyUFy13c1kOPOkTeTD?=
 =?us-ascii?Q?Y6X3lOTVhVpZVo1O9a3CulddgqItX2850VFED5yCyitMeujTQkMTzkvbvcgt?=
 =?us-ascii?Q?DYk62JwmOCl0d01hTLgEEVhSAZBBsCbH3JqxdxZu1xFw5Kyx/AOWg6p5qGvE?=
 =?us-ascii?Q?UEm1d094YRZ3qUvLUbF0mcarZzlpQLHFZoGvLU3OT/9k3v7KUH1bXm6SvYV3?=
 =?us-ascii?Q?gV4PZ6jB5hhmVGV2wIb3S4bf2ayQStqLondLALUx88V6ZQhxGk0r?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873d6443-8dc8-4148-f725-08dedd0c0101
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:14:36.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i1K6xU5EbAxK937dvKaiTsx0kSl4N56Pu5XF1ETugV39CKgcejfos5xDxpmJJH1FOG7XNyq+XUGXaTbwEwtX+S4b+THL47J/Ce8JQVhoL5Q3erql2v1yCFsUgHAT307
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67051-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDE3C7288E6

Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
an equivalent static inline in the header that delegates to
v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - New patch

 drivers/media/v4l2-core/v4l2-common.c | 8 --------
 include/media/v4l2-common.h           | 9 +++++++--
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..54995ba8c20d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			u32 pixelformat, u32 width, u32 height)
-{
-	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
-					   width, height, 1);
-}
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
-
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height)
 {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index edd416178c33..749fe38c134e 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
-			u32 width, u32 height);
+
 /* @stride_alignment is a power of 2 value in bytes */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
 
+static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+				      u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, height, 1);
+}
+
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
-- 
2.54.0


