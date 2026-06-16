Return-Path: <linux-media+bounces-65057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uqsjLa+EMWrNlQUAu9opvQ
	(envelope-from <linux-media+bounces-65057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:15:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10D692EBC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:15:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="cB/6WXo7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65057-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65057-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 237E331270CC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DC047DF9C;
	Tue, 16 Jun 2026 17:07:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2428247AF6E;
	Tue, 16 Jun 2026 17:07:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629628; cv=fail; b=s+vDgkVdMwT2sNNVHujZnO+luEsYEFy1v5/TSChyNBiu/CSqGlzD5fFgwvOgIoJ3diB6pigjQoB8XN9ziwdpZc/ZgZXgrITvA6zoLCkwSQvciKEMiBJELDRO7KVrM/hdCsSm5akdYNI9xm5dQBUnhwSpdda2Ugg0NXaNy+HBnFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629628; c=relaxed/simple;
	bh=0R+iK3vnfjufUQlR6gKkUxKLo8uRwxY/1l0sYq8Xnkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvtcBKjVRVdYaUDkABfnjyZsO3fF5+d+RJ7yymECJjVXk/LeQbRYi8uSbvs82C79NfkWxPqNsE0LO7qdsgeOqCyHJuFjEe70guogYU1IZ0JhFI9/rFWTKTlBmLa158YEyklNtiD/FL5GzB8va5XBHcsiuOpcfAVidfxXdSpNtX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cB/6WXo7; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0d+Qe6Hp0ckXcUIohqaBruV2EDme2lel9c9w3Wb9l+DxmoFE549N5ZuQBQrrEgLFY1Hu235w8PVSnqrHL9KDkqnrtuIUyyqUhebINN6N1qi5abx1gtxnmrPxNWWjFWt5cfkkjt5Fb490Nxt43nQwAnxx0V5ec9ywgS1o2JC7Ui4hSIliT0QZAYBvMdA08KMX3O1T67NZEGYE0+XRaHm4BajAJmpsErNgSC1OfAWPeqhmBYv2oLsVkvwWfMjW2BaQxvq4oPUBrlbBzP8JNcieZSmcNYVFbiOSo9/dIsv5I81I/VbnnWsh7dgGYpsjFyoYB4H8DgyGy0ijrP+mpUvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y9hsZWhzwMveOc+xFRm5eX6K6fWkN/zynOoKHJt4cY=;
 b=embZiwp/zZssDUsnBwkG0xlOgjBe95uRO/yvceoZFaBkXPRvdV3uTcrGPDGBiW/nWMqKLh1GO455j9DSoxHYPPwfuSj1J/3PkeD4FN5hh5XPtK6hm2T0Rz+yKdWE+q7K82GWCImvfq9rneTPXz6lghLuVusdwNzID+YgqiDGTzmXNHLOYJa8rVpQno/U7XlycBfjq344hzsRPxHAorbKaDQ1VE/+Dckdee9RmubyGgqr7HqFqFPXmoZXqelmU9JDd6PL9MQnrzDuFl2MkSu0/0Rj31RqHHt3PABBttanoizL5NENt6ZEfFx4fKuhhaLGyKVBmfyFGkyJIUITe4oTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y9hsZWhzwMveOc+xFRm5eX6K6fWkN/zynOoKHJt4cY=;
 b=cB/6WXo7befaydMO+Uwoebq0R7BRE318xPKa01YG0YXGPUi2CUzLnG+7/k6pVS7njmoIBqpGBVT4bnxuTnLhp7WeqW6Or2zVpd53d4iWybDYlEB+rzuhilDFP4910AU9dIbSW58dQ5FSeClrsTzqr6IW+e/IVnSN/HgwRw0IbAI=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:07:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:07:05 +0000
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
Subject: [PATCH 8/9] media: i2c: ov5645: Switch to RUNTIME_PM_OPS() and pm_ptr()
Date: Tue, 16 Jun 2026 19:05:38 +0200
Message-ID: <20260616170542.447804-9-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 10e8e610-27bc-4475-6269-08decbc9b0bc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	nOoVjtnPfm1VBVgHQJKaU0LofJM4ytOVEYtbQoTmE44z6Jb0nZL3YLlTVlE8V/7siTlAegIjrbJK8Q9n2v36riawvZ8BR/tFeYpKXAhNsdYLFQ5gdaMZps2LN5AWcSlwreVz8SNL5FiAoUtvgl0N+zOXExvhxZZtYkLp9x1sajX7dhO69XsEdWi26Y7LWtR8v6P1Na99TPA0FuvMliorhid9vAL079SfajaxcayK7aX9CA2HLEPj0W5dL7QIIkh3TOwnYLQS28sulOgGy1UgqGW13YPoWUjEE9iLNHYsp5W2/n7DEH8NSSQJ4SX5dBUekT5lvX/r6gbeIrc/0SeE262QRophCJXPJV1u1808d2zVwt3F88HHbToBXTizN71JglBwjMq19y9f3L5Y5S7XpWcq+QWAnWKhtEw3QYL0tYb6AM5GV4b66eTl4S0KsXHFsAOtBRl8KDV5+l2wesUX2aLoTC07vXHsYvQl5dxIIH71nbj+sLd1RG0c8YLlDyGc8drut5VFNffcyortFq2hxcr2yFDM9RFsHU68MPowfD9E2Ump3HkjZrSr7IzkTtIZqjbxVr0AVswttcbSZoB020WiwXwdu2sYuA8wCBzgk4oJfv/cMbQz3MoArq7sQUmPITVt8KZDdWDdImStqkDge2KC6vuLiKVUOS4nQm63cAEOqCwCqtREnlxFnyOzx6VPMIEPYL5MdpGryul21pkIU1NXN2ZXrLruKhDoW2PQIwblrZ5Yx8nrmPL3oERWZfgI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OoEwtHjJ8bnK+e8qqAQ055846Yfzbuy7KvPj6fvq5Lf38nqmcuf8Sbdfjcmj?=
 =?us-ascii?Q?G7+PX9X/RAdl0aNrnnwvbIA9mATXtrvB9QP7XncWjsdj39eKA8H9JsgxiyqT?=
 =?us-ascii?Q?1rHK9OiGiALxGW3v9UH4FHWDT6sbeNxhyU+DV983Q/rauoLDN5UhcqeFUpSG?=
 =?us-ascii?Q?LmY29WnQ3bmy3iZfjreah7LXdu/N2EYwek0Bmw7RUD1O+NF+gM3b/BJrHnQ6?=
 =?us-ascii?Q?eV74BIljhjV0f34eg1AX8fXCluhd8eX0bO+mdPZAu6uC7yfUaMYIhWu1rWMo?=
 =?us-ascii?Q?kWiPXDSWQQ0VgGk4Hy4ITcm/9GCoR4e1LfqcHHT/B2gvKuUXtUkIi9mvRpxS?=
 =?us-ascii?Q?/zsN3hRbSbuR1Kq8Gxc54bSwsnTr7lrTGRt2Xn67aqYAt2WnqI7Oc7UC3V2E?=
 =?us-ascii?Q?J9vVmjGzbhhEvdvtHBAJmqcgqIotG8LWJ/ycEfYHkAZhD1+milLSHCoOTSv5?=
 =?us-ascii?Q?y6nk4//o4l40yZogV8EM1pdDq909q6y7b7cCoA3XtqY+8H8DpDR1of+wShs4?=
 =?us-ascii?Q?75quqdMjXu8CrU8inS3draQyNGi3sAPCNV4yaas9FI16//zWsnJkGimTHbKN?=
 =?us-ascii?Q?h+V4eRVWyad/rt1dcGk9qtJ5W4zPYG+aErgUktN8vM673Gh5iBDUKbALyweu?=
 =?us-ascii?Q?SY1ULIxYZ/lab60dS56LI5ofx27iOcUkoqOb8XpE8OSfdnkHwhSxVvMDcv/E?=
 =?us-ascii?Q?L6F4YTl+ANojRUyuIQdjgZtFLAJEZFxxb/VXbvoJLGSBTtRkJk2GJno0wi+8?=
 =?us-ascii?Q?RoK9N0t9YJq53C+MWfKBMrBiBLTW8BpKQIBMJzScl2VhFkyJ5nHpOwOuSgMy?=
 =?us-ascii?Q?+wC/2TJEJFwBzkIvxcu3dtd0IAdTA6GERSPjy0HgXdw2GxC1pVoqNPHOQt8I?=
 =?us-ascii?Q?nFOLgMSu9drPkaBB3ZhxpXfsbjezwIq294AbUf/slmU3HUOHNJ/zYp1pZ29G?=
 =?us-ascii?Q?0Jz0Lw1U95e8t8kT5uCIA0xCP6/ciFLAHXQC7q75U8qOcIoNvMrSxcoIF6A1?=
 =?us-ascii?Q?ATb//XEEK2UdSQUGwm3pZdcsRSxYGLHBdmqdpVcAY5IjVy7wQV9Y2AZkXi9U?=
 =?us-ascii?Q?UXZ72IPw736eX/xjgBM3QvP21da4oZ9PVcSKmMsqBDqotbO88kGH+zh805vj?=
 =?us-ascii?Q?ZR4GDfi3pfbKtZU8mliOoOas+uL2bnQu5L1OMGuZkQ1iBapfESIY3FWsP9Ob?=
 =?us-ascii?Q?GquUxCX+yjyYjugISDA7RzuohZbd5qJo4+303GpL4iOSQTWU5BJ0HYZr6+d9?=
 =?us-ascii?Q?odW1uzphewTwBNvBntViz9H+Mc8kCT+VIQNzdMLaVuG99RRIRbMAwLZVJxoW?=
 =?us-ascii?Q?BvAwXGJuZoQ4WCeAW4R7P0b4s43BGbsSF4n5wcG0M+eDME5Plom7g3qoh6Se?=
 =?us-ascii?Q?pWl6TspZuWvCOxbsZ4TAtBnU9VZaxdrXB5rwvA6dnzUdG+/9ykD/FvuIBl2E?=
 =?us-ascii?Q?nCplZHiPHsn8XyL0Isc7IvMFW3TMv+4djo3lXNqanCOBaJa+eU6EWQLdZLxp?=
 =?us-ascii?Q?4MFtY/+ZxpIGrsfmOX4nbhe2OffkMqiiLP+MK0Cn7VFgTiGI7nGP8F5TUDWX?=
 =?us-ascii?Q?z8qosoFRBgOh+xPBbe2HsC/3hXO4oJzWpIQ7DBVgDhG3MqCdrAkhCz36aMms?=
 =?us-ascii?Q?akWYgseJcOCdXHyBLVLo7bi6y2rR/f6z7cF47c1xJ6XGwLfg1PCqxo4YrUMY?=
 =?us-ascii?Q?DBG+sKew8NgjG1Fb2R5oTL1ceaIPIoTP1XZCkdxfe0HcwEBn2esb/9g+VCJl?=
 =?us-ascii?Q?eq1shmNKVYK8uajYoNOyW5+Af/eS29qAyYuBmQnLric3Q2IDHRUc?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e8e610-27bc-4475-6269-08decbc9b0bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:07:05.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5lpyKZsiBzmdSRkhi66frSePWopc10OIuyewALs/Mi0/pscDJ0m8q1D+n3MKh05VMPlZGVP6zh8upS/suiiUGzEBy+kXEwXXfAsrNHU7guxLZqvsMoCndoxx4p6J4G0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65057-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A10D692EBC

Replace SET_RUNTIME_PM_OPS() with RUNTIME_PM_OPS() and use pm_ptr()
for the power management operations. This brings the driver in line
with current kernel power management APIs and prepares for future
deprecations.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index c772ef6e51d2..14692d128571 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1231,14 +1231,14 @@ static const struct of_device_id ov5645_of_match[] = {
 MODULE_DEVICE_TABLE(of, ov5645_of_match);
 
 static const struct dev_pm_ops ov5645_pm_ops = {
-	SET_RUNTIME_PM_OPS(ov5645_set_power_off, ov5645_set_power_on, NULL)
+	RUNTIME_PM_OPS(ov5645_set_power_off, ov5645_set_power_on, NULL)
 };
 
 static struct i2c_driver ov5645_i2c_driver = {
 	.driver = {
 		.of_match_table = ov5645_of_match,
 		.name  = "ov5645",
-		.pm = &ov5645_pm_ops,
+		.pm = pm_ptr(&ov5645_pm_ops),
 	},
 	.probe = ov5645_probe,
 	.remove = ov5645_remove,
-- 
2.54.0


