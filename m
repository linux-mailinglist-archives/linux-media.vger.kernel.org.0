Return-Path: <linux-media+bounces-58720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIzAHPr/3WkRmAkAu9opvQ
	(envelope-from <linux-media+bounces-58720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:51:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D5A3F786A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E80D301877B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9D83B6C01;
	Tue, 14 Apr 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="OHU+nPE6"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021096.outbound.protection.outlook.com [40.107.57.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9222EDD78;
	Tue, 14 Apr 2026 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156661; cv=fail; b=a5awgnSf3BEDbJ3waDS9Exgb6wH5xT7x7VaCNzT2k/hZSY1CJpOhmGY3T7Badn6OYB77F8yR/6b55moPdOjYmUrwJIKJQUMd2cOF0YbGa+Ae81GeJywGnilpf5aDAk/dKNSsy6TucnXHMN9Um+fIM6y2v6Uz/Waw7FvKa0KQ22Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156661; c=relaxed/simple;
	bh=BYuwnhVkWbQ/qXh/wfV3wiWZ8c0yLLQUg7TF9R47OgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bTJpDG96B8Df9pyKxOpVDfaX/qbyff8HWNPk3Kxot8ADOZBoDmxHKvXbKF8eEnDF6QziJqjjCN3LgM5M4ejSN8VAV9eBeZq5tggrfX3lxRiFdbrkZBJNfem6ln+m9LwIMk935a+cfvC7xqoyH7EA5yeTSUYbfyL1vPyElsLhc3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=OHU+nPE6; arc=fail smtp.client-ip=40.107.57.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqv5eO5VqHgQYBQ1/4KgByzp69dcYHHMf1VkMmjwRUioTwNWQhwhbUV60UHGjoE9PuoUCDoyiQD5tw+RP69Aw3VMpGMhse12Mv+S5yFHcZFblYDXSUqvQ7qQCMILDPnr+L3zfXxhAhq94h60nzT3WVwmmRq+fHJM56rPQOwNkIZ9Rvaf53MpciN0I/EQ0x+au5MKBNT2BWuK6qCUZUilqhGY5EEnAvuRPRLsKSU3gMuUQZkB8rsyeYek/TUlkfLdUii/wq4Mo6eaYborY/MhZ4qTgUM0XlEkJbeB54ktvuGN/mntqsWaHE/rPI9CxMWuKfj5znYJlSubp6cqxMFX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARJhoqph5ICgZVGkLn3qT9FnhbOovSut0qm3RoKrX4A=;
 b=tS2KhwWoTm5oT5rqzL47QBpj6krPfjqqtlWYmnmUEs0qBZEplEBtnxwPaU22TGfu0AmU8qev8F/geVxYXkoj/umGFH6nd9JEutJJOX3dhgv14nmZLEE5NBWdVilXOAhHYK9JdNVqlft3T9AIbggC3sLYpd+DsVXS8OvuiAwztYdPIGRjBnranxDcKxzLSqaOTxg7++fCCyz7Y5vckghZfAxRmY1WuCJWlDHs4XV8ZdwUouLA+G7YqyC5zFMg9TwdmOw5yGBTRCdfK+D0fVFlZ4//InvFnsSibnm/uLreQmYrJmzhtRMzroAM9yWbDdyqdaISB6Hf0qgb5oUT8vg6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARJhoqph5ICgZVGkLn3qT9FnhbOovSut0qm3RoKrX4A=;
 b=OHU+nPE6Qq9YhN/TgRJugkyT3SOzDbg3EZJtaUhxs8zAXLGL9c1suDsUObli6nimBgA6agTCqdBY7bpbjXHmcgaMvVzsat/O3ntM8GRmZgCBgsExtUTxiBdSkDUgBc5Stb3dbtsTwTfRvXuF3KjcZNO3IrtaPe0XNSSi9RmVOo/a4Wp19H1hdpaxlwfafh8LHKJQsusvfhNF262wX8vXClNG3NqpoP1M91PK2sOwAUIC5CDujv0RJZiHAj7U+LARlvnPXWWHRjf84N+7LwatVEz4PFqIkf8FoUC7uJz0YwKvfKtEhlxO/wq1nVgLwS8jhEE7fgbm6vau+skNrttg8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MAUP287MB5036.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 08:50:56 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 08:50:56 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	tarang.raval@siliconsignals.io
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Date: Tue, 14 Apr 2026 14:19:44 +0530
Message-Id: <20260414084952.217215-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::7) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MAUP287MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5b51de-c6e7-472e-9cb9-08de9a02f140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UlUtGlA51masZup07gL/CicvlI6ryfvr901Qlhss98wfpvp5/nn/Pv2pD95lcGtA+5GR6IgG6rbeLQa4GTefa3BU8HzOYBZIPLmu2KEjb/O9eX2VVPbu2O3uOdFtacl6/EdBvOJCFe2JP8EtMFxKICMPfscfhWqZjT3MmtHkShhlJijAsQxndl7QTCSOeCbRIWsXXF7eStip1cwRYl304f/Vd8lcUyY3LcWz0ectenCfqcYFElkKRTMGnfMXsTp3js/gIrN81FvGbSwUR7ITwsUKYeOwqAnZIbm3R1JS+6rD2F4dpHS66aUJNdZbnMRjlgxMl3fuBkkI3g8ujZGK7OJteCzPt4YIGsa6GTptnxIPUyIx8wHCJ3HNhz3OhVtXzhouNGlBw3B6gQYDgPflZiwJH+tZh5wo4p6qwwykC3DzWCupbHqx++NGI/ly9ApBugWIYrdSha8eIHBRTZXjsBDy4Saw2FGCu4XqM7ixwflVxqOf8U1O8ssGH6NCvJOG6qsJ5OP3HzaSUtUTjftEqmveSgWMWSQhJ7NHGVqOabsCQm2WgJiQMraSBJL/d+vyB971Ml2F5U6eEsR5+y/EN/3Di6NuyUPO/gCfr4k6xavoPmLfn0csfdZLcX9VzbT1AjD99kaEk6Val3FOxNpNNMMJgrzQLNcdgVyfEsN5Ufpkt1Wokauh/8pdoIcKUtYcZbnaqfDbVopLhVLMIo6d0aY5RO3LlanuweH5WvIsUho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbJ8pyqCwjcaVYfTJiIrYuWQxooDzx4gKVeeVBIElvIKevgGHWuuAkgvBXSa?=
 =?us-ascii?Q?AfWx+aGSOGNKOxT1hV0tqgh653NoefF9L+Lcacm7wVb1l0787S1Kr5+Ri6H3?=
 =?us-ascii?Q?VStbFLRyPDsyadWJueuReiRZx9ncpRlDFIfmnXfJEcRxKrORhZWe4RM7JYcR?=
 =?us-ascii?Q?rMv8u5ZM13kfVSGfH5Lotw/a30FHFDNcGfxdrPy4r7tiZTWgGQ3ZopLsG94J?=
 =?us-ascii?Q?LsWn1nTGk3472HLJbfE2eIlVCtca3Fmi2u1lvJFfP289ra1lZUsEsL8hiSRf?=
 =?us-ascii?Q?CmD9xsH/E78uU7uMsiiDawQIpRX/D0lUYNf6B2T0PlDORM+eoCDP2ShdLIZX?=
 =?us-ascii?Q?DjjMI20nLu0I35yfsarGi8NM7g0fV+jsAcq51bashUVW685LPx7XtJWffTKJ?=
 =?us-ascii?Q?sjuqrZnusvWyfoKhQIxRIuTpxQKuybOMlr8P2h8DlmLVUgwVzNrV1kv+1r2g?=
 =?us-ascii?Q?ZmUI6aboq7CgevPRRM9ZBY+3mLoXCHctbXDBczSjjuOvXvH5rnyBkpOLZYzK?=
 =?us-ascii?Q?2PRbp7xszak49327tMp9dFQ2vRaUi0m81VSkDWW+yrxxG/SzKE6BBxGIFQGN?=
 =?us-ascii?Q?ZrJctrJ2CJZvD4dkm1xBraG016JGgupTacfwxqinq7H8E5hzlKyQkdF5IF1d?=
 =?us-ascii?Q?Qty0XA+altsKp0gDb3Zwzd5jRM13MK1jBCuj1uxwC874KQDn3Vnc5VKqs4Qx?=
 =?us-ascii?Q?S/pgLFSicu1ppcOgytrk3LvXAbfn7adVS8obwUppW2KDmxiMgHhlLV11g22H?=
 =?us-ascii?Q?nvxyVVEWiJN2QfuTztAiEU7Yh/Hr7x8by1hf5RJoV3CTbnAT8BoMiabKqAot?=
 =?us-ascii?Q?soKLZiijtXuhF8jy4w+LHjeei647bmxY+9d9Db98+u+IG5SH80AOZrHp2qus?=
 =?us-ascii?Q?/k09/W4YgUnsl2nyYhUiGlf+41dCB8hOUjYroHCGp8n9OtkdDnmeYpewAwYu?=
 =?us-ascii?Q?8FUQSpNt5TIgsqkEDhahOlybf+lsJdzzlfHZjVwfVxDmOPzb5fGdXRwOj4lM?=
 =?us-ascii?Q?jlRS3YnZkXj4ZuqZBivSLQTKb7z04wyjMTb1pwLj1BSakX0bQM2X1TpeAv5h?=
 =?us-ascii?Q?GpqPfM84+ZFPq5/G8oj+zQbrpFdojGhgLhterRr1mm/wlm5D3hRGLKBHYcIj?=
 =?us-ascii?Q?Xw1xHNfBN4KF8sanSTp8DVt4f2o1BG9qZFmIDsjHOdKZ9EydL8QrHbfbgo8/?=
 =?us-ascii?Q?KpHrIz/JUd1Lu+UCW4AIrOz/MPYv9vFqh5SEKdfar99AZyWRtbkAM1E1x0Ee?=
 =?us-ascii?Q?aa20Xn0drxw1NrIsv8Nb4kvdlJhGmambJIatYFIJpsAcg+LQ87RpRJcEq+8N?=
 =?us-ascii?Q?msElT0qC00AcBBEslfe5B77m6/O0jKOzgaXFChbWLGcoFFmhaDxBaR3KtvhT?=
 =?us-ascii?Q?RXQPK+qSkjwalDzqFSbWoj/LSVqcgUVfEEsHKVII+zMY2Ax+D2EiruKTIPvg?=
 =?us-ascii?Q?acouNrSNr3sYB8vBsHfxFBfi5iV7lxsrdBY9FvDN/gtZAHGlM+LvF9Q/G8nv?=
 =?us-ascii?Q?ZkvrJ00ZqjnvcuVA6XexD5R3RMIA+bK3EmJlKH6VBVwQbBK+7ENzHUU9kdk7?=
 =?us-ascii?Q?Ebsh15grAr8lCMNsQSe9n+0wqZCB75lKrmo/RbYpjvZyL/Rkx6NhW8bvEOSo?=
 =?us-ascii?Q?9IMWjGn3LveIZZBFGXfpeaTVkU6SZ4PCppgYJ23SuCmzTkJug016FsHhlTul?=
 =?us-ascii?Q?eNb3p1e73ezcxCT5TsJGZhYCxXem13saZKcZqd+0Iaa74B/oEChclGoQZOg0?=
 =?us-ascii?Q?2Oycbfjfs+w8YP8vEYMGBn9++6Dt5MtkzjgA4GLp/44Nm1FqzgX+?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5b51de-c6e7-472e-9cb9-08de9a02f140
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 08:50:56.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJhtpLkwRsEOpMubXgdkFKJmGit34S28SBdrtrzy8ZDLo4tbwrUJkSNKX7+3hQSQbt2AKbt+NdHlSgVXlWArtES08JSleApbMu5+sF4U7HVjNVTDFbpvCAIEaeO9gGKe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5036
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,foss.st.com,gmail.com,intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58720-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,3c:email,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: C8D5A3F786A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for Omnivision OS02G10 sensor.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os02g10.yaml      | 96 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
new file mode 100644
index 000000000000..79e7e644d696
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os02g10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS02G10 Image Sensor
+
+maintainers:
+  - Tarang Raval <tarang.raval@siliconsignals.io>
+
+description:
+  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10 format.
+
+properties:
+  compatible:
+    const: ovti,os02g10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital core Power Supply (1.5v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+            compatible = "ovti,os02g10";
+            reg = <0x3c>;
+            clocks = <&os02g10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os02g10_avdd_2v8>;
+            dvdd-supply = <&os02g10_dvdd_1v2>;
+            dovdd-supply = <&os2gb10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..13409c71a765 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19457,6 +19457,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS02G10 SENSOR DRIVER
+M:	Tarang Raval <tarang.raval@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+
 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
 M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
--
2.34.1


