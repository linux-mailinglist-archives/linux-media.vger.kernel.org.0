Return-Path: <linux-media+bounces-65050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cE68G9eEMWrklQUAu9opvQ
	(envelope-from <linux-media+bounces-65050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:16:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8C692EFB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=jzVPLzdV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65050-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65050-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03A2B3052DDD
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D961547A0C3;
	Tue, 16 Jun 2026 17:06:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020B47A0DC;
	Tue, 16 Jun 2026 17:06:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629602; cv=fail; b=H2+o6YjO69DqJXjlkgamxNX9zy1PPEl80ztS5T1/pLUU82ge526GXCi6hs/gxaW84DurQe6r+dkR+PcaAfLm1Xd73K5KeBHFKNn9i8VPduw/isudpjFwghNpi0ieB9gb0AtpTGal162h0yN2QnGrUMd1ILW7yajGEub1WDQVxwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629602; c=relaxed/simple;
	bh=W339RIpOowbUxkDO9vqyp1rfT9fz4zHz84q5lxctAi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fUIDU8u9wz4ZUIQPcBdh42Bwc2Y+MR9+mPwuwjVPhy2g0hkvl66BISlW3OWAk2wQUH4ZGOAeZza24tEy0YYyEIebhHLe0Ny333RISU00oLzT5ZKog1Z1KcriVPEvqYjIVDGQIL3M0sweQWLnTDG+L9W8CeG8yYKGqn11Ssb+9Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jzVPLzdV; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay8+9LQ/V5MiESvqRupocPM0cynymV+VeXKRcyYdv+Kdlzow2ZXeGBi8zyUJxpkJbHIMPDVeOAeg3p0LEsBWXIOV6cUJZkItr9xcqBBE95F6gmqRo90k7a/pQ+bVWB3RnY/zNzZMKRNarhANXDQReGlcavSnU1ygTnyerzslJFs/Kh5KeoR3/037E9JtzzummKftEhcL1ClaaS9kEeatadLDwJX23jSh5+YKZTK/bCDN3U0lN2jFPBh1C/YYfFo6lCRLlAK3Q5fuEWjqi9ttggSzhCoFnrDyD/7zrljqCZ81pbQwIRSEH+HpLCv3UiI5XZLSBOKnNLabnl1Xoyr91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnCSOSdpBnf6XcvYP0hSNHCsTQuF9MYjpOVyZ6MXozo=;
 b=Wg+1m3TnvF37wXWQMjhfzilptb0NWBOH4ODZUmySNCCRoYKVEoMXN1ZTvCmgKJ+HFwiLDckmPW2EmwtRo53JOqi7J1UDfuyyfWp9VZB3pKZXDWoocTJnSgLLpC0VwrcEf4V14BJg3aZAcI220M01zMo8gvavkuNhaiWMCI1YzOqzoNvyq7saSAEWP70bP3LADvyP5CV66in+uawCxIGMDKy/XlElNi1YYaPZJota6xvYIRm7W/tbD57io+sxt7Ayme59eZ5oX7fYvjeB96r0ko2btKuV+Ef2B5PqdaCrHUqJ4xz7vudthdAPJqmZEiZXwcAp1+9SZvlJgb+TGO1HfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnCSOSdpBnf6XcvYP0hSNHCsTQuF9MYjpOVyZ6MXozo=;
 b=jzVPLzdVkZNcOU/SregnnbgrIY82B/5mXN8+mqiL/Hr08aMBN0WYLfwmSg/Qj1pYHoijq7TVl2+GeDgxbrMpfFt7EE9/7wLxJ4ssxQArCq+6sKO6c08MeHS8zp2K0UQvffayA31AJgdHR/hcRhL8FJ+3s5q6ZHUYW61evj+8+rc=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] media: rzg2l-cru: Add device_link from CRU to CSI-2
Date: Tue, 16 Jun 2026 19:05:31 +0200
Message-ID: <20260616170542.447804-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: adad116f-b5ee-435b-dfc2-08decbc99ed3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	V0zj5fvJ+1RH78fu+u/ZoMhi/lc9EYf5lru7Sjnq59p+CfwA/Bn/TWSbYvF3N6LVsy4w80VKlqScZtVCFsI/R18L1yiykZLVH+1eMFm9cz2dmzfD/rKJNg8qG4dfnsT8EOPZ2uMCs7dL1RsREBhrJMRAvF9wh8TcWnnt2IXpSPSMLkwg231kaYEqDvfaxuKD66EoIQJ5d8QewZPelyBXmO72ixsoaE0o5DvIlsPaSZ88ifLtCKPkMbYE+8BsevguaiKefnVJBeprl/B3MWdiKjoy/z4uJZnNBLgzBsY5im+3bDKo9v/wOSljdtdtdLrBhjq7TEujO6MINKc2qqFfz7TPY8qttYuqeM8pDC2/CNdGaljoquwpk/wWXVe9jPqc56X3F0nX4f3xJUdNFwztmLnL7XwHrdtQO0O0ZFgdQVravm0ViruroPbyEstry62Pe3jxO48S8NoRlnJmTKAfvHdyQgs/cVFltB+fJ38WioGRiQIdkb/yCoNsV1NsCvTeSOfPhbILTcTOffAE8JxazVDL/ufk63Lkjj6Xn0YHxJGVfMHQsrvVGbeOX4csegczlSe+OMMokT9cv8h7WN5NTnal+Vug7NT31ZunUoM3FbeZnO2nmXWMX0q87P7x6sNWfniRSUt+siw71WS4J47Kj9OrmTajB3PClWukuRXJspBu1Rws2XqcMHOSCcI8XB3xwoMMczVHAq2sIiLPOBi4JcEHBochuwgNNzNHCXDuH/h6JeKpAARNuLMPGDqECJ+f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yDMEcW1BliOAWYE9NGnoNU31QnwV9XS1wOeflA47eAwl7Zi7/aCT92YLdiEs?=
 =?us-ascii?Q?RO70xxWjfuhQpY49ZCTi3qHbKpZYCyNGuvVUfEDW6tfHZDb+xrMOr4JVt3bX?=
 =?us-ascii?Q?CE2xCuU8HI+7NFt5cqB0Zpv73v3Uc0PJYmGma/89CPcBxhU0U3vY3mqrWBw3?=
 =?us-ascii?Q?Qn6CP2MX8FV7B+gXRXtyzUKCA8oFV7uOZIOebhEEog3O6/eLQ47OB67/8ipR?=
 =?us-ascii?Q?WTP1jb4A3LpOmudcaz16wICZbCqKnnW3dDSnof5GJ34/PJi0zrS5r0s4fWjb?=
 =?us-ascii?Q?Xax5usgKvAYlAUZ5runzBKcp/bCPkzreE+i/1uddVN3jFjGgKIYPRGvNGeXj?=
 =?us-ascii?Q?LAyjEyaLdr/ImSp1L07DKYVMuqIKcP9yiDg974yCnS5Km8f29bdSufDhrB1X?=
 =?us-ascii?Q?/tfbsmUKht6DRN/n36XHfqP3gw4DjNUfdOwpoyD+VzqHwK8qBIXN5bMHu4ZH?=
 =?us-ascii?Q?RXRr7YHU3Dh3JZMzl22KSWHkm8g3mhpmgmShE+4K6d+zpbmFka9vLgOMV5k9?=
 =?us-ascii?Q?q4XbTdbC1iHgZy1AiMPfD9F/uPr71hZRJTk+eyo9SUC5/v+G9e8bzdZkdO1a?=
 =?us-ascii?Q?O/tRALpG0lN8OSeBR6RtnNb3d0cvGL9K6Rt6yb9P/AXit21tAya40AA6YGps?=
 =?us-ascii?Q?B6zwcmjxzCo5Jst7APODe1B2nVkBS0Kf7tj+tdHA7qt+UKkkYdo0WiHfPICH?=
 =?us-ascii?Q?JTP592XCVqH1jiNWzG+ZZGPZf2M9LLDoxp3xlSuIWxUYWAXbQPNlMkv3Txi0?=
 =?us-ascii?Q?hgQRu+bEoykEDlP7LPtiFDNWrzOo4qDVIHriBNS7zVyXxDcIkssboCIfoH08?=
 =?us-ascii?Q?bZQ/nzLTN9W0cqV11lR4YtYjcVmzHfMu8MU2a9aFlT056V+mHWLmeNsdaykX?=
 =?us-ascii?Q?cyaf8Do9grEdK026gb+z4w31+hmF4Ez4GcVk4GY7AfObLeYo504T2l6AKiB5?=
 =?us-ascii?Q?YcXgeLLymQ8v602lDGTX3+UzP+cnJAbp0DFYZaKGUTbVrUtiYjzshEJUydAE?=
 =?us-ascii?Q?lGJlYXlQqSDxa3v9G/66shaaroYVgqM62NeK8yBtGQQtE36hag++0UX44Axg?=
 =?us-ascii?Q?8ZFHt2blSp03zWL276NgAgxq7C4R6Vnr3LEWMIQMpfu0jCy9JIDuTm0VdFeY?=
 =?us-ascii?Q?VfsS2AeuvrGubKiDomqyVKQ1jfe/dyALTLzrQgx5+WmajD/Nc+JsWaYr9y1t?=
 =?us-ascii?Q?WiHJhcS7tDIZAHaiUFGJXk65+DG5wB1gGEO5GLtZRjQjx1im+AVbQjGWFyyg?=
 =?us-ascii?Q?S4fdZsfIkhhssBI329HMNmIgfeiyTAbTE1ujGUZfhvJk7TVd+ryOX7PQSg5d?=
 =?us-ascii?Q?tjpiWQgnKqllmInDBEv6zCW0fU8Hb46FnleD6gwl1opMeV9UYEteh3cFFTQe?=
 =?us-ascii?Q?CIZuYR1fU/JgahaJD+2w4gcUzssaMlLNYY9rUkge+y53l54dzDcowYMhPfXs?=
 =?us-ascii?Q?jiDdwTT1+xHo1LdmL9AXz391MIoZkzpl4m29nn+J4hdQZKyTQfIIBJWTXxiY?=
 =?us-ascii?Q?2Uj2jVurdPk4ElpDTMWmym3FU0V0T4D7tCbZxBGM5RL4X8cIpdVKZVbg4PWZ?=
 =?us-ascii?Q?n1UtDvT1OadQ7WPowXloOI9Nhd4QOu1Ng2vVPXZl+t/AtLl5IfZtfZIBVMl9?=
 =?us-ascii?Q?UZM+48pjqL0O3ai33jgkN8Sz/fsuCMgHU50LFWToxawfjSWA71+E/qeX5jRr?=
 =?us-ascii?Q?ebVukqY3UhtsANZA8qoBx7Z/za517lHNpqjfOQERDV5WCobhX0/69lFAj/YQ?=
 =?us-ascii?Q?ts5w1OUzoeI6VWepIRsvN2jS3Fk0ChCTC11A5Jo4aJPIg0ahtybA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adad116f-b5ee-435b-dfc2-08decbc99ed3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:34.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYuAUVxVMkNATINmvYgeYw7kcdAVWZ9l7ZJzTMpVejjBdtqtzUlW53EuQaHzMv71nZu5ep1447rRnNXMkKBn49OvBcjmO90PEzOuQtjlnyqRp4MBhVj+XVd7H7xoO+4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65050-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FC8C692EFB

The CRU device depends on CSI-2 to operate. Without an explicit
device_link the PM core has no knowledge of this dependency and may
suspend CSI-2 while CRU is still active, or resume CRU before CSI-2
is ready.

Add a DL_FLAG_STATELESS device_link from the CRU to CSI-2 when the
CSI-2 subdev binds. This instructs the PM core to suspend CRU before
CSI-2 and to resume CSI-2 before CRU. The link is deleted on unbind.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..1b12d91eaec9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -101,6 +101,7 @@ static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	mutex_lock(&cru->mdev_lock);
 
 	if (cru->csi.asd == asd) {
+		device_link_remove(cru->dev, subdev->dev);
 		cru->csi.subdev = NULL;
 		dev_dbg(cru->dev, "Unbind CSI-2 %s\n", subdev->name);
 	}
@@ -118,6 +119,12 @@ static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
 
 	if (cru->csi.asd == asd) {
 		cru->csi.subdev = subdev;
+		if (!device_link_add(cru->dev, subdev->dev, DL_FLAG_STATELESS)) {
+			dev_err(cru->dev, "Failed to create device link to CSI-2 %s\n",
+				subdev->name);
+			mutex_unlock(&cru->mdev_lock);
+			return -EINVAL;
+		}
 		dev_dbg(cru->dev, "Bound CSI-2 %s\n", subdev->name);
 	}
 
-- 
2.54.0


