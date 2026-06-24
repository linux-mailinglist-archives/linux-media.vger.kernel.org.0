Return-Path: <linux-media+bounces-65509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nlSSHReGO2rbZAgAu9opvQ
	(envelope-from <linux-media+bounces-65509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:24:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EEA6BC21B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=Zfeba0Mw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65509-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65509-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B78ED3047D65
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FAF3AFCF7;
	Wed, 24 Jun 2026 07:21:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020098.outbound.protection.outlook.com [52.101.156.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30873ADBA3;
	Wed, 24 Jun 2026 07:21:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285716; cv=fail; b=hRnVNFHkr7TCxnKVSH88H/skEHyWagecq6ktLgRGws6FM8jy3y5QbSyUmREVIbtg/YbJ8yk/xVSf38Ha3YiTnnWMaS0qEygrg1GzyAAwSf1/+YtoIGUPp7HYYDZMgTXd0shnkKKTXFxqNu8R2b2G8rNPIRiFP0d0Mx3/bJFPVKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285716; c=relaxed/simple;
	bh=wJPoS7kf1e3ZOuVyubh1B1OH0BbC6iBA5QyVZzIRsPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hexp4HmNoNJc07KvLFnxclG/oQEwb6lT1jFS9jdJ/qTKKZcgY+aXQ1ZfqLdRux+pHVP6PSugCq0bm3oJuui6xKVq0gmxSpmluMt/M4RuF9PUX6YHhwOvArIJm3/hfyWYdv0WMAiRex0ErMQKq0tf0xXjoCqcEaOHt+q88JINuP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Zfeba0Mw; arc=fail smtp.client-ip=52.101.156.98
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KA7fS7LRY6vGfIUpJ1tZP2Uvsthu2/d2nO9N4Vw1R2ro228uA0rVuR4mtTXsQRi85i3megQIJIe1Mp5ZO/eVYVKGpxdGK26CnsaxqBPU1nwYoaGbp9ZRCrUZ+NLkJa+W/aIxyRq2VFHZ3ApVJYh4RlG60NCu9ungE+YI617WW4cEgLCfCG4T4ewOb1vymU5vhQbKgfLlDGiaO3+61nwIZQ38wRSY2qcAYYd4//xIBj5tXNs8+z4FtrtkDzf/9yLCzwVTHdDsf+caFfK9gWheDenvEaY6pTplljA0wn0VEzkPatWtSvr6+Pb2zht09sYpjkkyRHNaxjjaaNOP2G0TVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOadby4hlwP2sbPnSaUhK5rogbP/675VXlAOyF74FwE=;
 b=ab3TAqcc9tg51HwvgvIVdguxkp/HxN95Lmh34etHMPKSdI531eow9USAvdB0VNFRTpFPgORSjXxL+vANlOsuRRxKgr7IREqoWKex7gMLV2saGBTv8Aw6M5qqHAt/9aYB5MHLVgMtHkTQd7m9PZ/yMcMWLPDNBRUz2ctcyezsF2GJyktX8K5zQkoAH8AVhXf0qqb03Y9pwnEC8DbP7dTsUW+WpU1msQ3pMho6/fDOMqgc+pZeePz37cB1Aq6/rPC/Y0aww7nE+op7RekM6EEF6t74rn58wJgbNslxtUe2Q58C8OysB4/V4LOpW5um5lh7YIzUEsDKkIl+i4q04POENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOadby4hlwP2sbPnSaUhK5rogbP/675VXlAOyF74FwE=;
 b=Zfeba0MwQB3160IgKCPu6o60zI0jYkXoIgGaOTnshzqc9pExZXdDVcnjhr6NLdyUiwfBCNgCaipNtu1GULVKqCl0Y1uiz3Z+HC8lRHeGm0Gk1nZa8uneroArGlhRWaKcH7m9Kc50DdzRFLadUcltwfYWPNp1PF/E8ArYrqzrFkU=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:21:01 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:21:01 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v6 8/9] media: chips-media: wave6: Add Wave6 control driver
Date: Wed, 24 Jun 2026 16:20:42 +0900
Message-Id: <20260624072043.238-9-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260624072043.238-1-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::10) To SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1c8::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2440:EE_|PUUP216MB3514:EE_
X-MS-Office365-Filtering-Correlation-Id: 52525ae3-d8f7-4e70-27a3-08ded1c124cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SmYbphBGXU+AH2IvbNo0EbFhnd+5VHCjRtE1RZ32QrGKESSkeBjMnu+yacKgU/shDsv/B6JkoYm3gQ7Ql6ZWEV/ff8Evg1UdiqU/AYfK5M6kfN+RjlGQDXwK72xPFkRlNTP/Pgakmntn+pYtWj7bDwWXNaSp2ii1BMrfhCJZOA+juRk0db7+4n1xOUFMql4Ebxyj8uCYPCEgJFcduhPynGu1q+6nfZeUDqNG/66d/EHu0wDw9F7blhqnhBHMKlEVXPboWV/Gtf385SwgKVjbSi9ReW71RMQhHZS82pXJX4Clp0xh/6Cblm10J1QoRgKwo9xqrTqnfcXL25E63YtOAWohnC2LqvigrXYXj0PtYZeT3omnjJ7J7jxH7TDqIJS3qi8Kuh5OsGaVOouQv+LEouYt35AxPx12uEhKlrhgFxtor5H2xOpVSTZDRWLW4RPhMgTcHtK0ucmjU68LvRf80Zj+MYpgbNQ7Sj32AeZdD1OoaM8WvMGeJL3k1PcF6kKRFVt4hTTm44YBijkdjgs5Gl2n7nAfhomzcpdCZiBadSz86OdklRZpO8ww2R5cXsKuIqx1i/Rs69KaOgm7+aNP2dXAJth9v6LH00rysuuurYMUHfdm6JsgJ9WMpXUu34Cu54STwEZHWyAPGMK6WSQ8C41xx3SO+l0qS7rLebtpHEcXXmEd8YpnSx7kxRzQA2lFtfkrjMjAsqMh9WRwEMExGd2aRjMimUX2qaRFUMWS1Oc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rNXby3ur7UDD0MhX4RkZ6rGZiVGZUZYUCybW1f8Lp3XUScJkO5XgiVANaytj?=
 =?us-ascii?Q?igAHv0CVpcfSeXVImXm1Y5bJYlJ+9+dYnr/BLdmF3qTzu4rc4y3zdRHB8cRp?=
 =?us-ascii?Q?epM5BB4nYaA50ajJ0msYq8KFYrzyjimwthUIKmoXoGt4ct9BQFanloy/f9+c?=
 =?us-ascii?Q?M/coOL30z0Cx7GMk+H9Meb7c69br6fU4dM6ILc6D//T+TYDYwdpxusis7Dk4?=
 =?us-ascii?Q?pnl3Uyl1+ONCP/YxdAVGZWpMzFmJL76nmoyuPtXRv1Ici8M0+cFfwpom3XlP?=
 =?us-ascii?Q?ZSJfnSNKT302lde2OcQbyAsEsO1Z80WFZe8BVYuiXE+H8RyCYXohMAw1J/Y8?=
 =?us-ascii?Q?u2L97QRLtvMf9PzrlxKSsDYZi3z6vPKJhsGeP2iTqu/8v1srIelAshHNVPRY?=
 =?us-ascii?Q?RH11JRAmVgP+C6jG+j1jRrE6BVxyANB3qPzTNxCRjkxonOB5oix9+mVkdDjl?=
 =?us-ascii?Q?dSfsqD8T2NtHKl1qKsQevRkaRbGPDGxU/XcaoValQ0bNN1HE8WQV3dH/pcTJ?=
 =?us-ascii?Q?Mz39e9bFR+jeSRryvUY2QZTgIA8eOp7RTJLZfIh0js87AKVRQNYaXoOjrFR2?=
 =?us-ascii?Q?V9QogjQv7/LQxoeNZfYfIUENGdxq0FvjUXVYL11GroVrbH77yoXIvlXb+FZC?=
 =?us-ascii?Q?2ZxUIy9QFxFjRTTwBrgEGlqaLVHehqu1cvhv5HJGsgP69CudCEuAeOqRhnHQ?=
 =?us-ascii?Q?YvtiQwKCYgR1UHAiF7dHbKIsj63b1nG4MrmwJuivX6DaMX4pFynJ8XJefqkc?=
 =?us-ascii?Q?Nl96tEcr+ZaPlOiKRD/K6dayjw1Bh3jKBwXUW2BL7n8c+R53hTE9+YftexSz?=
 =?us-ascii?Q?+h/meeAutqZ15UykQHMXwzW0pJnbc6ccYrpi9QkhqBXfX2Ka7o/Y0V1A+gyp?=
 =?us-ascii?Q?614y5a0giJpVuG5091WTCtO+fghDCPR23HpOHpuecFFoArAuknroylLnnTEc?=
 =?us-ascii?Q?QBPEqhzTsKNn65KdXN1cHGl7b/3GujLilidXdkb10LEF/iblGKlKK9K+lLVV?=
 =?us-ascii?Q?CSzUaFe5yLEV9ZdIjCR2VblkVEkfdsG8tM7d4xD9/7THvk4/c5FBsZ6mj6TT?=
 =?us-ascii?Q?SycUzjHocb5eSFbMblsdgil18k2e7rbtm07ZEhoUoklcsLYnJsLkRovCq0YI?=
 =?us-ascii?Q?m7qpKUJbk17T1sP6nY9PVU/LiCOP/H9YTGFu4OxopbNJTdnV7E7jkIdKqfYz?=
 =?us-ascii?Q?Qu9G6Di7HS8IpUIPxiWxQzo/mUCOY/QexpeTKpMw5YgXZi3z8PjOUVgeOPVx?=
 =?us-ascii?Q?qdo4vR72MNp0tLVHpFV9wE8JPC78zfCIfkL8jZbq+9l1O6g8MMPz63yX1ei9?=
 =?us-ascii?Q?38ljxoPbWCWY4SSl3e0/5FOtJPvBO63JTToietChpg5NY7oX9QOxuWUUWaX8?=
 =?us-ascii?Q?rIWsu2bLT4Yz3uneush17PYKzqvVjjUtobfq29tWFCniXfugJqAaQ+vwEypC?=
 =?us-ascii?Q?8sta9LG97/EGZaZtJ34zWL4WKGAVH/x2Itv6cnBCcZla3ARtIx62MlB4wftL?=
 =?us-ascii?Q?D1DOMwJmWzbMNwoWcKuvBXjtzagCS7FAlLag6kDNXWiRCOE8jcqIOgz0ZUM4?=
 =?us-ascii?Q?HG50apcjcKn/0QV50uovMIOO7nyObsZnEdDg32X6B2hu2agxbFX+cxox28Vr?=
 =?us-ascii?Q?1cL6tfgCyWmpj9/tkQiE6oyZgC3iEtnHQx2PK9+B6/XH0VcKhDwofMcASDZT?=
 =?us-ascii?Q?CmzYfhpNF35JQgH6B2fSbwRevucNF1+pwax3v78wZyYRi6F4N7ttip5g0225?=
 =?us-ascii?Q?vCHAL4KbwsRWWvIVrTFlhbYTUQQyws0=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52525ae3-d8f7-4e70-27a3-08ded1c124cb
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:21:01.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYOruLA49HAyipagOm2U4dJuKNJDqUPk/yoq2o4w1rdhX7NcdqBF5gx2Q+swnaqarQJRe0EJ1pRbryvcVjWuiAFtO8EHEf1HorddoGt5vB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65509-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:ming.qian@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,nxp.com:email,info.data:url,info.id:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbox.org:email,info.name:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08EEA6BC21B

Add the control driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine.

This driver handles the control region and manages shared resources such
as firmware loading, firmware memory allocation, and coordination required
by the interface register regions.

It also instantiates and coordinates with the `wave6-core` child devices
for firmware and power state management.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  17 +
 .../media/platform/chips-media/wave6/Makefile |  17 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 821 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 143 +++
 6 files changed, 1000 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h

diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ad350eb6b1fc..8ef7fc8029a4 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
 
 source "drivers/media/platform/chips-media/coda/Kconfig"
 source "drivers/media/platform/chips-media/wave5/Kconfig"
+source "drivers/media/platform/chips-media/wave6/Kconfig"
diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
index 6b5d99de8b54..b9a07a91c9d6 100644
--- a/drivers/media/platform/chips-media/Makefile
+++ b/drivers/media/platform/chips-media/Makefile
@@ -2,3 +2,4 @@
 
 obj-y += coda/
 obj-y += wave5/
+obj-y += wave6/
diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
new file mode 100644
index 000000000000..63d79c56c7fc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_WAVE6_VPU
+	tristate "Chips&Media Wave6 Codec Driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_MXC || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
+	help
+	  Chips&Media Wave6 stateful codec driver.
+	  The wave6 driver manages shared resources such as firmware memory.
+	  The wave6-core driver provides encoding and decoding capabilities
+	  for H.264, HEVC, and other video formats.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6 and wave6-core.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..06f8ac9bef14
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu-core.o := -I$(src)
+
+wave6-objs += wave6-vpu.o \
+	      wave6-vpu-thermal.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
+
+wave6-core-objs += wave6-vpu-core.o \
+		   wave6-vpu-v4l2.o \
+		   wave6-vpu-dbg.o \
+		   wave6-vpuapi.o \
+		   wave6-vpu-dec.o \
+		   wave6-vpu-enc.o \
+		   wave6-hw.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6-core.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..c6efc4578183
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/property.h>
+#include <linux/of_irq.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpu.h"
+
+static const struct wave6_vpu_resource wave633c_data = {
+	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static const struct wave6_vpu_core_resource wave633c_core_data = {
+	.codec_types = WAVE633_CODEC_TYPE,
+	.compatible_fw_version = WAVE633_COMPATIBLE_FW_VERSION,
+};
+
+static const char *wave6_vpu_state_name(enum wave6_vpu_state state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_transition(struct wave6_vpu_device *vpu,
+				       enum wave6_vpu_state next)
+{
+	switch (vpu->state) {
+	case WAVE6_VPU_STATE_OFF:
+		/* to PREPARE: first boot attempt */
+		/* to ON: already booted before, skipping boot */
+		if (next == WAVE6_VPU_STATE_PREPARE ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_PREPARE:
+		/* to OFF: boot failed */
+		/* to ON: boot successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_ON:
+		/* to OFF: sleep failed */
+		/* to SLEEP: sleep successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_SLEEP)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_SLEEP:
+		/* to OFF: resume failed */
+		/* to ON: resume successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	}
+
+	dev_err(vpu->dev, "invalid transition: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(next));
+
+	return false;
+}
+
+static void wave6_vpu_set_state(struct wave6_vpu_device *vpu,
+				enum wave6_vpu_state state)
+{
+	if (!wave6_vpu_valid_transition(vpu, state))
+		return;
+
+	dev_dbg(vpu->dev, "set state: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(state));
+
+	vpu->state = state;
+}
+
+static int wave6_vpu_wait_busy(struct vpu_core_device *core)
+{
+	u32 val;
+
+	return read_poll_timeout(wave6_vdi_readl, val, !val,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core->reg_base, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_check_result(struct vpu_core_device *core)
+{
+	if (wave6_vdi_readl(core->reg_base, W6_RET_SUCCESS))
+		return 0;
+
+	return wave6_vdi_readl(core->reg_base, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
+{
+	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
+{
+	dma_addr_t code_base = vpu->code_buf.dma_addr;
+	u32 i, reg_val;
+
+	for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
+		reg_val = REMAP_CTRL_ON |
+			  REMAP_CTRL_INDEX(i) |
+			  REMAP_CTRL_PAGE_SIZE_ON |
+			  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
+				 i * W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
+				 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
+	}
+}
+
+static void wave6_vpu_init_code_buf(struct wave6_vpu_device *vpu)
+{
+	if (vpu->code_buf.size < W6_CODE_BUF_SIZE) {
+		dev_warn(vpu->dev,
+			 "code buf size (%zu) is too small\n", vpu->code_buf.size);
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.vaddr = devm_memremap(vpu->dev,
+					    vpu->code_buf.phys_addr,
+					    vpu->code_buf.size,
+					    MEMREMAP_WC);
+	if (!vpu->code_buf.vaddr) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.dma_addr = dma_map_resource(vpu->dev,
+						  vpu->code_buf.phys_addr,
+						  vpu->code_buf.size,
+						  DMA_BIDIRECTIONAL,
+						  0);
+	if (dma_mapping_error(vpu->dev, vpu->code_buf.dma_addr)) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+}
+
+static void wave6_vpu_allocate_work_buffers(struct wave6_vpu_device *vpu)
+{
+	struct vpu_buf *buf;
+	int i;
+
+	for (i = 0; i < MAX_NUM_INSTANCE; i++) {
+		buf = &vpu->work_buffers[i];
+		buf->size = W637DEC_WORKBUF_SIZE_FOR_CQ;
+
+		if (wave6_vdi_alloc_dma(vpu->dev, buf)) {
+			dev_warn(vpu->dev, "Failed to allocate work_buffers\n");
+			return;
+		}
+
+		vpu->work_buffers_alloc++;
+	}
+}
+
+static void wave6_vpu_free_work_buffers(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < vpu->work_buffers_alloc; i++)
+		wave6_vdi_free_dma(&vpu->work_buffers[i]);
+
+	vpu->work_buffers_alloc = 0;
+	vpu->work_buffers_avail = 0;
+}
+
+static void wave6_vpu_init_work_buf(struct wave6_vpu_device *vpu,
+				    struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed\n");
+		return;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed, reason 0x%x\n", ret);
+		return;
+	}
+
+	vpu->work_buffers_avail = vpu->work_buffers_alloc;
+}
+
+static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try init directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto init_done;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+init_done:
+	wave6_vpu_init_work_buf(vpu, core);
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_sleep(struct wave6_vpu_device *vpu,
+			   struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (!wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC)) {
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return 0;
+	}
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_wakeup(struct wave6_vpu_device *vpu,
+			    struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try wakeup directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto wakeup_done;
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+wakeup_done:
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_try_boot(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	u32 product_code;
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (vpu->state != WAVE6_VPU_STATE_OFF && vpu->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	product_code = wave6_vdi_readl(core->reg_base, W6_VPU_RET_PRODUCT_CODE);
+	if (!wave6_is_product_w_series(product_code)) {
+		dev_err(vpu->dev, "unknown product : %08x\n", product_code);
+		return -EINVAL;
+	}
+
+	if (vpu->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_wakeup(vpu, core);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_vpu(vpu, core);
+
+	return ret;
+}
+
+static int wave6_vpu_get(struct wave6_vpu_device *vpu,
+			 struct vpu_core_device *core)
+{
+	int ret;
+
+	if (WARN_ON(!vpu || !core))
+		return -EINVAL;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return -EINVAL;
+
+	/* Only the first core executes boot; others return */
+	if (atomic_inc_return(&vpu->core_count) > 1)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret)
+		goto error_pm;
+
+	ret = wave6_vpu_try_boot(vpu, core);
+	if (ret)
+		goto error_boot;
+
+	return 0;
+
+error_boot:
+	pm_runtime_put_sync(vpu->dev);
+error_pm:
+	atomic_dec(&vpu->core_count);
+
+	return ret;
+}
+
+static void wave6_vpu_put(struct wave6_vpu_device *vpu,
+			  struct vpu_core_device *core)
+{
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return;
+
+	/* Only the last core executes sleep; others return */
+	if (atomic_dec_return(&vpu->core_count) > 0)
+		return;
+
+	wave6_vpu_sleep(vpu, core);
+
+	if (!pm_runtime_suspended(vpu->dev))
+		pm_runtime_put_sync(vpu->dev);
+}
+
+static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
+					  struct vpu_core_device *core)
+{
+	struct vpu_buf *vb;
+	u32 size;
+
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	size = wave6_vdi_readl(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE);
+	if (!size)
+		return;
+
+	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
+		goto exit;
+
+	if (WARN_ON(vpu->work_buffers_avail == 0))
+		goto exit;
+
+	vpu->work_buffers_avail--;
+	vb = &vpu->work_buffers[vpu->work_buffers_avail];
+
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
+
+exit:
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
+}
+
+static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
+{
+	struct device_node *child;
+	int num_cores = 0;
+
+	for_each_available_child_of_node(vpu->dev->of_node, child) {
+		struct platform_device_info info = {};
+		struct platform_device *pdev;
+		struct resource res[2];
+		int irq;
+
+		if (num_cores >= W6_VPU_MAX_NUM_CORE) {
+			of_node_put(child);
+			break;
+		}
+
+		if (of_address_to_resource(child, 0, &res[0])) {
+			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
+			continue;
+		}
+
+		irq = of_irq_get(child, 0);
+		if (irq < 0) {
+			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
+			continue;
+		}
+		res[1] = DEFINE_RES_IRQ(irq);
+
+		info.fwnode = of_fwnode_handle(child);
+		info.parent = vpu->dev;
+		info.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME;
+		info.id = num_cores;
+		info.dma_mask = DMA_BIT_MASK(32);
+		info.res = res;
+		info.num_res = ARRAY_SIZE(res);
+		info.data = &wave633c_core_data;
+		info.size_data = sizeof(wave633c_core_data);
+
+		pdev = platform_device_register_full(&info);
+		if (IS_ERR(pdev)) {
+			dev_err(vpu->dev, "Failed to register core %d: %ld\n",
+				num_cores, PTR_ERR(pdev));
+			continue;
+		}
+
+		vpu->core_pdevs[num_cores] = pdev;
+		num_cores++;
+	}
+
+	return num_cores;
+}
+
+static void wave6_vpu_destroy_cores(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < W6_VPU_MAX_NUM_CORE; i++) {
+		struct platform_device *pdev = vpu->core_pdevs[i];
+
+		if (!pdev)
+			continue;
+
+		platform_device_unregister(pdev);
+		vpu->core_pdevs[i] = NULL;
+	}
+}
+
+static void wave6_vpu_release(struct wave6_vpu_device *vpu)
+{
+	guard(mutex)(&vpu->lock);
+
+	vpu->fw_available = false;
+	wave6_vpu_destroy_cores(vpu);
+	wave6_vpu_free_work_buffers(vpu);
+	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
+		dma_unmap_resource(vpu->dev,
+				   vpu->sram_buf.dma_addr,
+				   vpu->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(vpu->sram_pool,
+			      (unsigned long)vpu->sram_buf.vaddr,
+			      vpu->sram_buf.size);
+	}
+	if (vpu->code_buf.dma_addr)
+		dma_unmap_resource(vpu->dev,
+				   vpu->code_buf.dma_addr,
+				   vpu->code_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+}
+
+static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
+{
+	struct wave6_vpu_device *vpu = context;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!fw || !fw->data) {
+		dev_err(vpu->dev, "No firmware.\n");
+		return;
+	}
+
+	if (!vpu->fw_available)
+		goto exit;
+
+	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
+		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
+			fw->size, vpu->code_buf.size);
+		vpu->fw_available = false;
+		goto exit;
+	}
+
+	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
+
+	vpu->get_vpu = wave6_vpu_get;
+	vpu->put_vpu = wave6_vpu_put;
+	vpu->req_work_buffer = wave6_vpu_require_work_buffer;
+
+	if (!wave6_vpu_create_cores(vpu)) {
+		dev_err(vpu->dev, "Failed to create VPU cores\n");
+		vpu->fw_available = false;
+	}
+
+exit:
+	release_firmware(fw);
+}
+
+static void wave6_vpu_detach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	if (!vpu->num_pm_domains)
+		return;
+
+	for (int i = 0; i < vpu->num_pm_domains; i++) {
+		struct device *pd_dev = vpu->pd_list->pd_devs[i];
+
+		if (!IS_ERR_OR_NULL(pd_dev) && !pm_runtime_suspended(pd_dev))
+			pm_runtime_force_suspend(pd_dev);
+	}
+
+	dev_pm_domain_detach_list(vpu->pd_list);
+	vpu->pd_list = NULL;
+	vpu->num_pm_domains = 0;
+}
+
+static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	int ret;
+
+	vpu->num_pm_domains = of_count_phandle_with_args(vpu->dev->of_node,
+							 "power-domains",
+							 "#power-domain-cells");
+	if (vpu->num_pm_domains < 0) {
+		dev_err(vpu->dev, "No power domains defined for vpu node\n");
+		return vpu->num_pm_domains;
+	}
+
+	if (vpu->num_pm_domains == 1) {
+		/* genpd_dev_pm_attach() attach automatically if count is 1 */
+		vpu->num_pm_domains = 0;
+		return 0;
+	}
+
+	ret = dev_pm_domain_attach_list(vpu->dev, NULL, &vpu->pd_list);
+	if (ret < 0) {
+		dev_err(vpu->dev, "Can't attach pm domains, ret = %d\n", ret);
+		return ret;
+	}
+
+	vpu->num_pm_domains = ret;
+
+	return 0;
+}
+
+static struct device *wave6_vpu_get_performance_dev(struct wave6_vpu_device *vpu)
+{
+	int index;
+
+	if (!vpu->num_pm_domains)
+		return vpu->dev;
+
+	index = of_property_match_string(vpu->dev->of_node,
+					 "power-domain-names", "perf");
+	if (index < 0 || index >= vpu->num_pm_domains)
+		return NULL;
+
+	return vpu->pd_list->pd_devs[index];
+}
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	struct device_node *np;
+	struct wave6_vpu_device *vpu;
+	const struct wave6_vpu_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	res = device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
+	if (ret)
+		return ret;
+
+	atomic_set(&vpu->core_count, 0);
+	dev_set_drvdata(&pdev->dev, vpu);
+	vpu->dev = &pdev->dev;
+	vpu->res = res;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	vpu->num_clks = ret;
+
+	ret = wave6_vpu_attach_pm_domains(vpu);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to attach pm domains\n");
+
+	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			vpu->code_buf.phys_addr = mem.start;
+			vpu->code_buf.size = resource_size(&mem);
+			wave6_vpu_init_code_buf(vpu);
+		} else {
+			dev_warn(&pdev->dev, "memory-region is not available.\n");
+		}
+	}
+
+	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (vpu->sram_pool) {
+		vpu->sram_buf.size = vpu->res->sram_size;
+		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
+							 vpu->sram_buf.size,
+							 &vpu->sram_buf.phys_addr);
+		if (!vpu->sram_buf.vaddr) {
+			vpu->sram_buf.size = 0;
+		} else {
+			vpu->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								  vpu->sram_buf.phys_addr,
+								  vpu->sram_buf.size,
+								  DMA_BIDIRECTIONAL,
+								  0);
+			if (dma_mapping_error(&pdev->dev, vpu->sram_buf.dma_addr)) {
+				gen_pool_free(vpu->sram_pool,
+					      (unsigned long)vpu->sram_buf.vaddr,
+					      vpu->sram_buf.size);
+				memset(&vpu->sram_buf, 0, sizeof(vpu->sram_buf));
+			}
+		}
+	}
+
+	vpu->thermal.dev = wave6_vpu_get_performance_dev(vpu);
+	if (vpu->thermal.dev) {
+		ret = wave6_vpu_cooling_init(vpu->dev, &vpu->thermal);
+		if (ret)
+			dev_err(&pdev->dev, "failed to initialize thermal cooling, %d\n", ret);
+	}
+
+	wave6_vpu_allocate_work_buffers(vpu);
+
+	pm_runtime_enable(&pdev->dev);
+	vpu->fw_available = true;
+
+	request_module("platform:%s", WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
+
+	ret = firmware_request_nowait_nowarn(THIS_MODULE,
+					     vpu->res->fw_name,
+					     &pdev->dev,
+					     GFP_KERNEL,
+					     vpu,
+					     wave6_vpu_load_firmware);
+	if (ret) {
+		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	pm_runtime_disable(&pdev->dev);
+	wave6_vpu_release(vpu);
+	wave6_vpu_detach_pm_domains(vpu);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(vpu->dev);
+	wave6_vpu_release(vpu);
+	wave6_vpu_detach_pm_domains(vpu);
+}
+
+static int wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+}
+
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
+		       wave6_vpu_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+			    pm_runtime_force_resume)
+};
+
+static const struct of_device_id wave6_vpu_ids[] = {
+	{ .compatible = "nxp,imx95-vpu", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = WAVE6_VPU_PLATFORM_DRIVER_NAME,
+		.of_match_table = wave6_vpu_ids,
+		.pm = pm_ptr(&wave6_vpu_pm_ops),
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
+MODULE_AUTHOR("CHIPS&MEDIA INC");
+MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..ec3c9299526b
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <linux/device.h>
+#include "wave6-vpu-thermal.h"
+#include "wave6-vdi.h"
+#include "wave6-vpuapi.h"
+
+#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
+#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
+
+struct wave6_vpu_device;
+struct vpu_core_device;
+
+/**
+ * enum wave6_vpu_state - VPU states
+ * @WAVE6_VPU_STATE_OFF:	VPU is powered off
+ * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
+ * @WAVE6_VPU_STATE_ON:		VPU is running
+ * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
+ */
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+/**
+ * struct wave6_vpu_dma_buf - VPU buffer from reserved memory or gen_pool
+ * @size:	Buffer size
+ * @dma_addr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @phys_addr:	Physical address of the reserved memory region or gen_pool
+ *
+ * Represents a buffer allocated from pre-reserved device memory regions or
+ * SRAM via gen_pool_dma_alloc(). Used for code and SRAM buffers only.
+ * Managed by the VPU device.
+ */
+struct wave6_vpu_dma_buf {
+	size_t size;
+	dma_addr_t dma_addr;
+	void *vaddr;
+	phys_addr_t phys_addr;
+};
+
+/**
+ * struct wave6_vpu_resource - VPU device compatible data
+ * @fw_name:	Firmware name for the device
+ * @sram_size:	Required SRAM size
+ */
+struct wave6_vpu_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+#define WAVE6_IS_ENC				BIT(0)
+#define WAVE6_IS_DEC				BIT(1)
+
+#define WAVE633_CODEC_TYPE			(WAVE6_IS_ENC | WAVE6_IS_DEC)
+#define WAVE633_COMPATIBLE_FW_VERSION		0x2010000
+
+/**
+ * struct wave6_vpu_core_resource - VPU CORE device compatible data
+ * @codec_types:		Bitmask of supported codec types
+ * @compatible_fw_version:	Firmware version compatible with driver
+ */
+struct wave6_vpu_core_resource {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+/**
+ * struct wave6_vpu_device - VPU driver structure
+ * @get_vpu:		Function pointer, boot or wake the device
+ * @put_vpu:		Function pointer, power off or suspend the device
+ * @req_work_buffer:	Function pointer, request allocation of a work buffer
+ * @dev:		Platform device pointer
+ * @reg_base:		Base address of MMIO registers
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @state:		Device state
+ * @lock:		Mutex protecting device data, register access
+ * @fw_available:	Firmware availability flag
+ * @res:		Device compatible data
+ * @sram_pool:		Genalloc pool for SRAM allocations
+ * @sram_buf:		Optional SRAM buffer
+ * @code_buf:		Firmware code buffer
+ * @work_buffers:	Array of work buffers
+ * @work_buffers_alloc:	Number of allocated work buffers
+ * @work_buffers_avail:	Number of available work buffers
+ * @thermal:		Thermal cooling device
+ * @core_count:		Number of available VPU core devices
+ *
+ * @get_vpu, @put_vpu, @req_work_buffer are called by VPU core devices.
+ *
+ * Buffers such as @sram_buf, @code_buf, and @work_buffers are managed
+ * by the VPU device and accessed exclusively by the firmware.
+ */
+struct wave6_vpu_device {
+	int (*get_vpu)(struct wave6_vpu_device *vpu,
+		       struct vpu_core_device *core);
+	void (*put_vpu)(struct wave6_vpu_device *vpu,
+			struct vpu_core_device *core);
+	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
+				struct vpu_core_device *core);
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	enum wave6_vpu_state state;
+	struct mutex lock; /* Protects device data, register access */
+
+	/* Prevents boot or sleep sequence if firmware is unavailable. */
+	bool fw_available;
+
+	const struct wave6_vpu_resource *res;
+	struct gen_pool *sram_pool;
+	struct wave6_vpu_dma_buf sram_buf;
+	struct wave6_vpu_dma_buf code_buf;
+
+	/* Allocates per-instance, used for storing instance-specific data. */
+	struct vpu_buf work_buffers[MAX_NUM_INSTANCE];
+	u32 work_buffers_alloc;
+	u32 work_buffers_avail;
+
+	struct vpu_thermal_cooling thermal;
+	atomic_t core_count;
+
+	int num_pm_domains;
+	struct dev_pm_domain_list *pd_list;
+
+	struct platform_device *core_pdevs[W6_VPU_MAX_NUM_CORE];
+};
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1


