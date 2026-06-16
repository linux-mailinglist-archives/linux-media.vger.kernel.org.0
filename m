Return-Path: <linux-media+bounces-65055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NvPUImKEMWqulQUAu9opvQ
	(envelope-from <linux-media+bounces-65055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:14:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F415C692E4D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:14:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=BweeVNd6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65055-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65055-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15D9E30ACEC2
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CA047D936;
	Tue, 16 Jun 2026 17:07:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E847D92F;
	Tue, 16 Jun 2026 17:06:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629620; cv=fail; b=mwIZeu8psQ5X4rjW2tlZfJzfEsEqDYUFJiFNEFHNgenuh34EiuOORiwTR651Hw5lYya7ksGI8H2+QntncQwxCKgQin6OtPICgRxsgDW8qM/P4CjqbgJ4vbEFJYVUI6aIXZ6pSIvvJqAO+4hGsv3nBtLFbB4bcbEtlIiYQZzRGYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629620; c=relaxed/simple;
	bh=AUPVAp6kq5WqrZpJ1XkGgjek1WKALRjdfiqu8yGMw2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyAVi0n2BxFS508egG8BVaujB4xboEGw6hZf1BaBw+yOkpW3mqOwXGtaaaCM8cI/whEXOKVFMvcOPNIih/CufeajatcifQkCbO6q+ovFDMBbaed4fGBLz0X5RfBq5o4BjzXiZDUjWqg9JcuUv777Nx3gngfe4R16cMx6NI5edb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BweeVNd6; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRdP7JA+Z3cQER3fmF9lDMdfp1RA9H85ZszunMCpjcQJ4i5c1RdsGV1szmis5vN4zqA8WpJDqZl9B/Bs8qFNbulp9b4882cAd5rLQnvLu27ugpddqAOqNO/5Ybw2NcKshn1G67kUq4KgWRRJn67nDosicMJTyD0qQYe/+3DG8Twu4+swAihgdlXfznzOlLXS5P4mwnrisp3Td/QWiQ9pGKgdGHUEamJyX+aE9grc7xpX3BXhafGetKWXHCUkeSw6kgg92LUzfocQoRLtIIE946MTvebQTCQ96gc1g0Vaqk2WeJ6mRuIa3wqm9JWr4LO6VuXvvSkLhoA5MbFW3B7PQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Reu3qGNTYf9kB9Kv/jtZw6nTfpOQ42oHIuZL963uNA=;
 b=VZQimQDWD0W7KKEVXaafI6LBp7EBUNeL7eNASrZXajW+evpqh2h0laVePvA2zhwW7en1TK3FodhkGOkFLFXpSOwyYp277enzYT+nwiy4F5u83kLEz6uqqIHAngyO/kiaSFxFgR7mnQtcV+ayE4fAsRM33hggfatECIti20VeN5Bq5wzN7OETS4TehWH+PLErhMalKarDZfWcIyFm25XqZBLzbQPsTyQmOE8giAqjVUUi0B+VBWGtzlPfr72f9gE9LL0a4osqkSsbwVQ9cVx+g15nlyD5QfSmKT8pwpsQp+QNk0G/0EKYp36X/oWiYcab4PMr4XDVwySOj7NjcYPZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Reu3qGNTYf9kB9Kv/jtZw6nTfpOQ42oHIuZL963uNA=;
 b=BweeVNd6wIaXWK9XMwBPkBZw9wzwzG4U9qlgI8Cep63kvgCh/2rDpaBZjoBahIYQWu62CTAsduj7uR1su0/T/n9kWDptDhltiWfZL5GWMAYAGkkkDAjMVk8yxo+58VjlEe3NIS2nKjiakNXDO26rWx1iq/fnEQXS8IF/8M9pm10=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:56 +0000
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
Subject: [PATCH 6/9] media: rzg2l-cru: Add suspend/resume support
Date: Tue, 16 Jun 2026 19:05:36 +0200
Message-ID: <20260616170542.447804-7-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1ee3d957-14dd-477a-ad81-08decbc9ab88
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	v3ITSFye4G5ORQRyVUwISxfUJQI3n22NifZdAHHPCgDZchWOZQc+Hc3Wyc1wN44w4nptRZcjWxnDjBsgg1PYHpXtKhxD7AoUyHEjwKX3ktznFJOndM+D47+5qWaWqTqJ78aQhMpinGG0rKY/gtd3djIpwRPOBFmVA3sn8OPikPl7jMhu/AQT9umURIHxNjuravs2/TeslIXmypt8iLnuxmA/Q0QVfInkv+9lBtL6fM2KCv4v/I3CU3cZYqX93XzDxeJcG4QRMJ2pDgpMi/Pquk12CDgA4niaWLdGrvZ6FMIYeg5hYnPyO0TD74LdfmeY78gJWqvW2fU122xTxb1UlHGnabY4qpOqIRCh6JQVNfkHjeDM9DUS5GJg7FyP4/G4qk0kGD6O0YjyEICCechycmFfuAnXT4SWEmA1HetROz03R9YKONkp5DsM/2uxVQNXf2y8fZUkVk+trDWXmFExCy223qIgyQrYXeQLlW1ABFmhQqSc0Jvrxxb84pgNzBLnQdcZ6nk42IsJdUdYIsinVekbsGl4qCi//D4b43AoBqai/CuBY5VYcvfTxW42kpRut3uDYZ6CVRDd1M1AnGsYmx4GbPFN89v86MGOm7nos+6TjyRORtjFpKlgSBxPhOHGH1UTfeRQRV5me4lxhwk72i0w59LGb7kO4iyouS0j9TYviWTbcMipWbfhoMIJMGOdypZ0YcaGhoanSsdJrlUX8xAHJNWFM84rYHXeUQR+sEvNo4P95sZCw0MkURsy3tZY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fsYNeGIRVuGlbeAwvJWD6afafIFljs7qABuE+WmxafQ290Aj7h6nkBxYDsHX?=
 =?us-ascii?Q?5p9Ux+ZMkSipTAFhzfOWsBP31ScwHLnfiXgHUF+QfAcs7+2yYp20+z0ZjVDV?=
 =?us-ascii?Q?vBPEi6a2Tk0zK+TmC30qsL5lWatjGjTsMRAPgIlRI1LrSRnL6oh4306CQ9aY?=
 =?us-ascii?Q?+87gCTdp5eiWwoEXbZ0twLtplc7O6lp1MSQcJQ2XWwgjFuP1bQ/RFRR2vw+s?=
 =?us-ascii?Q?CRvrL7C3GR5gx6Y5taYZpe61vexqlfI5cIjsVZZpc9XxqUJWMVzwjiUni8cm?=
 =?us-ascii?Q?Cs1j/TMwK68lQkFCtDTnNoWaWkpi9qHcgyxCHrNBADDyy2o4rZAyRPlN9qS4?=
 =?us-ascii?Q?caInM2gnCBNi2FBe6Um8mzn92YlQQyLZmu+H+mAxeQ91gmf1nqeVvzZbB5nb?=
 =?us-ascii?Q?QWVcsLEdsaDpJeFJP6y0TYuMMerM8kwUzrq2w0Vt59ypEFtO7A50GnXMPSh3?=
 =?us-ascii?Q?kWZHMN+yc1kBpnDB6kY/uhrSZ4wkpk+VJkY1WfaBD/UYtGMPLI4NSipgUMZ8?=
 =?us-ascii?Q?A+XMQXqZSsxjvkmJ9J7mRFo61A0jEMn2O32R+Z5+VM1cehyLyAXgl1YQ7uZT?=
 =?us-ascii?Q?95smkl3NUi4j3bFmVYjyJFUPbto49eWVyltjqso7lO1YB8pnrgrfVIgKmeUY?=
 =?us-ascii?Q?VBlkkCgw7QnAfdLfCR57Nt8ro59gYS6WYg1Tp/LD5QnF9Jh3dr/JpJbChe6g?=
 =?us-ascii?Q?vQlWUPuW/ZtNPDthHA0YYv87wsh5lg3FRMZJ5jvFKF8JVDYJ6OlDGDV/GcHB?=
 =?us-ascii?Q?xa4sRIZV94ckRgb0qgKVnag6z7AdZwmBtfedHD0fNx2QofyKXo2uWZsjQP55?=
 =?us-ascii?Q?ex45FXKkQCqV+rd7GZ+EvX2Ii289/azHoghlQjs4Jw0/b7LrYONFJegAMEdf?=
 =?us-ascii?Q?cs+BjqOxmk9DHzzLP69tUg8HTDApLnc4Aygw/1pkF/VPkdFemLlAO6E97qS0?=
 =?us-ascii?Q?rm8TE51MCQyAIpCzRXSbYot6mw1r3MGS6XtzRgT1LK2CvZOPm4fI6mXaX9X2?=
 =?us-ascii?Q?gvvNrlpsj4SemADwSvSOgQ0QDJ7gx0pDYLJxKsGGAPE+C0+5hlOElYUzpY0w?=
 =?us-ascii?Q?Z9YfKMX6amvhG6+W8lR9j9kx2BkpLTTTs7S7scxabefCv5nPvi/t51J3From?=
 =?us-ascii?Q?x1cdOO+GvZ7mrdBJHu4SexBnQ8liS15loLYcfXpgIFTpqEvcnL4XAN7E941c?=
 =?us-ascii?Q?JYN9ft2V9qIb+y7tVlp7lJtDW77azMx8GH+b/isyVe9U3+p4Joz6mL5IcHvt?=
 =?us-ascii?Q?LTFEZa553A/yWIv86q/BJncJsDb5uwTTRul6TquYot5+y1RR9UsCcifLZ9CB?=
 =?us-ascii?Q?bkmOAPa5VEzEGQ3DFoR5a7dR/rRfcb8X4LrRxh/FbmXwsD8JR0T2EV8NJDwP?=
 =?us-ascii?Q?sjCsqACsoVrxd1+/VD5bPJDwcQk4cwoDP7k6PTYyeI84OMw20O3el9ZJcn0P?=
 =?us-ascii?Q?qFBhWdISM661sbumjgP7k/YvhPnp7q+6dyHZzjQAqc2XcwM5fUHbfSBuqLI3?=
 =?us-ascii?Q?iiG0nQ6wIZ4+wmJ5HYyUrXfKPYjQj6PPDVJhHEn1j6m5DHmfdFopEjSutWvF?=
 =?us-ascii?Q?gHa0pnHkr/neJfUY0pEhLQePT032Dog6Fpo2zD8hFS9tmbEuhLmBJvFgl3x+?=
 =?us-ascii?Q?Sg8U9teLyROkmwQzYa3PpDfI71AtYG/LwyhsevNckflbG/qcvO1NaK0TkmsJ?=
 =?us-ascii?Q?LOLx30i7+25NE1z+CFBz0JX6sK5FXrb9j0ZI3BxndztDzNqgR3ApTr72hHuu?=
 =?us-ascii?Q?apsjJ+e51vxlrIaqtzXRLGo8OavGC9bc2Q96iAaFv24bejzq2W/0?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee3d957-14dd-477a-ad81-08decbc9ab88
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:56.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5t5JURmZyA4AYe3oiSdfmpjN48RwmzD3YdalnIEUH0yReX36RGkVEVeuF4vhnHmPBvBSsFu4PdRq1nK07JiPrmsxbGx6q7MbCmuHcsEhabuPjJ/enLDPMiQsOZ9PgsZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65055-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F415C692E4D

The CRU has no system sleep hooks, leaving the device in an undefined
state across suspend/resume.

On suspend, stop the pipeline, requeue any buffers held by the hardware
back to the software queue, and assert the resets. On resume, deassert
the resets and restart streaming.

Add a bool running field to track pipeline state. stop_streaming uses it
to skip rzg2l_cru_set_stream() when the pipeline was already stopped by
a failed resume, avoiding a double-stop. Export rzg2l_cru_set_stream()
and add rzg2l_cru_requeue_active_buffers() for use by the PM callbacks.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 67 +++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 25 ++++++-
 3 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 1b12d91eaec9..2840f40e4c01 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -246,6 +246,72 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 	return 0;
 }
 
+static int rzg2l_cru_pm_suspend(struct device *dev)
+{
+	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = cru->aresetn },
+		{ .rstc = cru->presetn },
+	};
+	int ret;
+
+	if (!cru->running)
+		return 0;
+
+	ret = rzg2l_cru_set_stream(cru, 0);
+	if (ret)
+		return ret;
+
+	rzg2l_cru_requeue_active_buffers(cru);
+
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+	if (ret) {
+		if (rzg2l_cru_set_stream(cru, 1))
+			vb2_queue_error(&cru->queue);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rzg2l_cru_pm_resume(struct device *dev)
+{
+	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = cru->aresetn },
+		{ .rstc = cru->presetn },
+	};
+	int ret;
+
+	if (!cru->running)
+		return 0;
+
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
+	if (ret)
+		goto err_running;
+
+	ret = rzg2l_cru_set_stream(cru, 1);
+	if (ret) {
+		dev_err(cru->dev, "Failed to restart streaming: %d\n", ret);
+		goto err_reset_assert;
+	}
+
+	return 0;
+
+err_reset_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+err_running:
+	cru->running = false;
+	vb2_queue_error(&cru->queue);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rzg2l_cru_pm_ops,
+				rzg2l_cru_pm_suspend,
+				rzg2l_cru_pm_resume);
+
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -437,6 +503,7 @@ static struct platform_driver rzg2l_cru_driver = {
 	.driver = {
 		.name = "rzg2l-cru",
 		.of_match_table = rzg2l_cru_of_id_table,
+		.pm = pm_sleep_ptr(&rzg2l_cru_pm_ops),
 	},
 	.probe = rzg2l_cru_probe,
 	.remove = rzg2l_cru_remove,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 5bf334e173d2..c079cad41266 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -161,12 +161,17 @@ struct rzg2l_cru_dev {
 	struct list_head buf_list;
 	unsigned int sequence;
 
+	bool running;
+
 	struct v4l2_pix_format format;
 };
 
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
 
+int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on);
+void rzg2l_cru_requeue_active_buffers(struct rzg2l_cru_dev *cru);
+
 int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 71d9c671f739..46a0823e1300 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -155,6 +155,23 @@ static void rzg2l_cru_return_buffers(struct rzg2l_cru_dev *cru,
 	}
 }
 
+void rzg2l_cru_requeue_active_buffers(struct rzg2l_cru_dev *cru)
+{
+	unsigned int i;
+
+	scoped_guard(spinlock_irqsave, &cru->hw_lock) {
+		for (i = 0; i < cru->num_buf; i++) {
+			if (!cru->queue_buf[i])
+				continue;
+			scoped_guard(spinlock_irqsave, &cru->qlock) {
+				list_add_tail(to_buf_list(cru->queue_buf[i]),
+					      &cru->buf_list);
+			}
+			cru->queue_buf[i] = NULL;
+		}
+	}
+}
+
 static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 				 unsigned int *nplanes, unsigned int sizes[],
 				 struct device *alloc_devs[])
@@ -528,7 +545,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	return 0;
 }
 
-static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
+int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 {
 	struct media_pipeline *pipe;
 	struct v4l2_subdev *sd;
@@ -707,6 +724,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto out;
 	}
 
+	cru->running = true;
 	dev_dbg(cru->dev, "Starting to capture\n");
 	return 0;
 
@@ -731,7 +749,10 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
 
-	rzg2l_cru_set_stream(cru, 0);
+	if (cru->running) {
+		rzg2l_cru_set_stream(cru, 0);
+		cru->running = false;
+	}
 
 	/* Free scratch buffer */
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
-- 
2.54.0


