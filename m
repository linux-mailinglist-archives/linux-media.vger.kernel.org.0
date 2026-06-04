Return-Path: <linux-media+bounces-63721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gw9JNlXdIGp38gAAu9opvQ
	(envelope-from <linux-media+bounces-63721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:05:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A963C588
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=BEzikFbs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63721-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63721-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1023C3079128
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FFE2F12C6;
	Thu,  4 Jun 2026 02:02:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560412E11D2;
	Thu,  4 Jun 2026 02:02:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538537; cv=fail; b=gP+COUptsrlOS9cEh36thO0Y2rrt52fioCalc7Cc2p7rwPRw//ppnO+sPHX0sAaSrLdGhknmzjGPP7ZOjFuL7KmhD8WTmvRwmZByod/5WMxH0C4ZRjojYX6dIPmWmrQ10r77nbWRf8Nqa7s9f79njPWSfA2P/h5pZ51jbS47/EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538537; c=relaxed/simple;
	bh=ItyPi+poi6bZWJ0twuqYDQY625pe+bAar2gY4Crbi/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mt0TG4pJt+xy8SDD/C6y92xaspS81uL02WwPXFsyZu1NSjYIH5UmaRxUBXKql/tuYZA7nsnKTHNlRxOKiM8dbmmMwWYvb8++2t8eABy1fsZBQy1TVVvhiP8SVvyHY4X8a9jU/nDID+Sr6OAlbS6Ba59TMjSzqi9E0QnoVerjDTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=BEzikFbs; arc=fail smtp.client-ip=40.107.42.77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+XU3FLXzs3L2iAj21iI8PYFNeyg8pjk8SwwJEqCoQLWy5vIF7kwdsyOTxdLEQTs64ZKceG1+Fi7UXKn4heqlE2jW1m7g6G+gYOv3+rD8s52ahl60hRHtUKxMqwha+pyACZ+re0iCja/6qIuGTCYBDt25ua5UH4GI8ILue/zMHOV2X3+PrZNnOGzyGQsDcghXid4kQ0zLDIKCf9jOQ5TrgifCvFhaUZEpABwZGjDGuw/P3nJ7fkuDNHTBoVVSt2dzZshbVoKEq/4BdzeuFB46lVQDDVLs8P4cCn+Ms7RKhfgGIDtJl3BXAMWSS17+YwAr2HkjGaOD1KTvQk1cAUeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtdNoDsAt2abvRre0YEJYYNa6wH2Dle6yhBz8oInR6g=;
 b=mzYLutgmbH6zXraC1AuiGUXYI9tmIhkn7dK34eKwEJu0oLBPkAP5/oGd8Qmc8pKuk+HvKtA/aJvyc6WY5TGAyz9ZpbdM6+JYAu7+/PDkWD6oVjMyFkt4d9RUL6r3uSC0F3PLqgJApsJgTv4rCVaRSsY3aJtZh76Yp1HQlR8W42k1IENgJ+iDcnIw26jsRbaZWUp7KCT5wAsmqTOCr9pQF+D3Cyc0o22rA8K+PEJvczwhhVZyxrU6U2rt0nDDRHA+n3NjLrGda2YPVuMJmMdie40BNohfGqLF/wqhch+lvlamIQVO3A1zcD9a653/KRHgV3LLvlI3xczC8WYgJ8o8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtdNoDsAt2abvRre0YEJYYNa6wH2Dle6yhBz8oInR6g=;
 b=BEzikFbsPBAfqhbp+C2n14k9wr97vEd9s+lSveQaDRQgs5FSykNxM1frDbVht7IlM8aAXI5dtpJ7L18S2ZxYdovvhsWKpsr+cQwQZVh8Y3zYeioQ6cByqz2qt4gzjJPmwVITfUiHAuSWJy8rhQLVxItU9aNzaFr7+MEVR8I0epw=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3229.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 02:02:07 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:02:07 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v0 4/4] media: chips-media: wave5: Add interrupt timeout while stop_streaming
Date: Thu,  4 Jun 2026 11:01:55 +0900
Message-Id: <20260604020155.77-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3229:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b92fc87-9dc2-4572-60a4-08dec1dd4807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|6133799003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	nvL1QzsjS4YyC1oqGROcsdFPHox7BibheLgWgP+UtKv91YalDjvnJmJmJorxqz6Fz3KZ/mjDXjpRxJlsZELoXxr74MZZ2jEt5xdbo+QlNi6SLJXXjAoz+mXuenbARSmxvwwa8laZzO/rbwMN418F12ur3QUqgyOYBAFDC0mhaftrdVlvwSVq/mM0pyV4exryWE+ryqVSFCAhjGWtEUL6kR+FCUfUKv4sFymIigxiCIdlvvovZN/3lHoxkgVOoKsKWBQZ4O5jraKfpCgYi2UBjm+szpHc3DANMwOiXETnnIm8Npbgrz4vpwciYHe2dAZM1B/fruQ6CTqEj9zB8puMtXiCSqNQcR5zjEhssXg0jYFQ4HIoCyo/LRQ9BRrguprlJQnIvzJFeA+aBe9IzAsV3wkT5WP4x/Br0KY8Xb/4OrDHmoNFUb+zRt72jYcYlIfA4CgPpYFAgb3gqsOwfaMLa3vwGfUZeT6F2OZw0r+AXSQhoyUXj7XiDpXBRedKZ6FICrdY4OmgsbZRsGLa8lbr3AJDJs+m8guawQtyMz/PR0o5a2s/7V2a0K/WOzGyFa2lRw474g0NUkg1U7foinKF1SR5EBSOVrzQ+/2vEIj5z1mlbCfRAwY8uspdzvZ9oje9z2jZ6usQxTq2TOy/PzegrtqUbylPv2eeRIl/qQN8d/gMPdSgk5wO5vHqeu6w4GHInvWyrEHAHS3nBVWayWpCy0eM/HWwgfX+zTcHkEVbtYE03wxHOzwYf+2VfQDJX56G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qhq8j9TGbTISBaPWGNoWu9KKWzcAIfeGuNsAiFaxPU119NIZSUP2iFb7UIYp?=
 =?us-ascii?Q?1P+UH0n34cKR0iicUuWjNRqwbfeWEblh5veLRNRVnXQT7mY7lLpgfSYXDOtv?=
 =?us-ascii?Q?6/UEcXn00Tm6o3kS5XIT02FTP4dVvFwMSmY9sqEnVB8umnOAtgbSDUrAtfB6?=
 =?us-ascii?Q?eTqRyvsyB4UdqHocSr643Vjeqnq83BF71OyNJCG22jeeW7STU01ZQjbMrcTE?=
 =?us-ascii?Q?hZvY+G6rBv7FLChIw1HiMxZ9XeJB2Nh0ecxhTku8mHb8J7lQt0YOftCu5lPW?=
 =?us-ascii?Q?WmognCY7gi4P4G4VZ8sTnT1jrP0sHTCrd9P/87TATU3P+Jj5HERRl9g/ETXB?=
 =?us-ascii?Q?ikq9/QUROarh1GpKDK2vFbcr+eZsNPChxbYxOb706XAZ/y7AAV8Mtc3pt9+/?=
 =?us-ascii?Q?9sZAASNxYQoqodM41q/TNY6sGujKm++9tgfj2PM5iz84+hZsSTH6Uwm8SWNn?=
 =?us-ascii?Q?SLdpVJqY6J7sdrdbhDMJPM9kA6GW5bpmuU4lhYGOpPXPH91hpsQ/1/mVrl2W?=
 =?us-ascii?Q?ykZDkLVCEK3r6m6+xHDri0MASd+VdPxNBRBmVg0uhzB0Mc2lEpH2DT89734C?=
 =?us-ascii?Q?aVtcS8aXIPtLWmR5AWxMEP8+O3hWmf6pVDnV7Nu5OYgX4YjREDNanVVSq/m0?=
 =?us-ascii?Q?tW673FX894lEt1zKAxuazI8xDApO3JgSSKfYh/RtlDSvu4F07V/maNgStfO+?=
 =?us-ascii?Q?RsbFnSZQacK70q9j8T6q0+bHhD3gbFQKuUp08veP8BXz1210t2ibJb57Xaq8?=
 =?us-ascii?Q?xq7BNh31+TNsqixGqY0GWSkXfaesGSvaRnU/GRIIbxqP+Qev9s+0sErR0zvO?=
 =?us-ascii?Q?C3Y8I2rm51T6yPQo9PjmEhhXu71nT6rql3dGRkWtQO7J3oW3Uo+JzxdfKZj7?=
 =?us-ascii?Q?1KA/ysx/iAmBQh3p+KVZigPP0xktgx0pt/CqNLiZyodp+q0V+LtC4Ymj3GZq?=
 =?us-ascii?Q?CRfc4jRKvE4lsZMdzKm8qm1D2vtkV9CWhQCzzQIkBIWl8fEFLxuLJ8WIMalD?=
 =?us-ascii?Q?oCuLt8SoI6OaVV7PdXWVBVlRoWoqry8CwM5ZdOWnvjs+8mjLSla81zuYiBPB?=
 =?us-ascii?Q?/t9xWaf9evUGkbfj7iZTGLZGHlSXVRy/GOqitSVi8hsxUtoalOIfb7QjQ41H?=
 =?us-ascii?Q?S+bPLHTIsHls44+G28hLCn7e3iIZN/MaVRW4ieDUHrsNiMRrs1PblJiaxj2T?=
 =?us-ascii?Q?YehWSqjmrBQYVO5dVilwJKlFzkTYJT5cHssmwOIkaa/Bc90B5IFz44aUMDC0?=
 =?us-ascii?Q?8l7/I/MfwIDf1tiekYz57i4Q83Lh5MjBx68whIRrTSgEhNSle59gOVYYzPSc?=
 =?us-ascii?Q?2+a9palvJZjWl3IjRSNFiD42d8S/8/mpe6zFqx6AWrDukH4S36YrPIuQMHNk?=
 =?us-ascii?Q?HFnIcYSXZPJfOUQPL7a3KPIrc2a8ddwiS33zwcJyM0lr9scg9tx+vjVl1tor?=
 =?us-ascii?Q?PaW6x04w2rsrheHXhvpXoT8AuQX/Mhd7ZMX/MTXIutHfegBqDjLumMHfKaEe?=
 =?us-ascii?Q?P7fxeBtjlqLoMwSN5wEZ/nMhmjKO7mZkrnJ2YHam97BeWx33AdgUot5OWFJR?=
 =?us-ascii?Q?B0ein6NtbtnPhDlNYCUxzY4cKPxgfNRqvYmLUsk9nh8/u5scZ8j92xtr8v4V?=
 =?us-ascii?Q?svSlwjMgSVcyQUMcFBubIc8/4zYgNznT03kCvLmCMhSLs9W8ze4ZvPLn6GNS?=
 =?us-ascii?Q?xOYfrc7hwrd0j6xeBC1UibQSm+NE1qrN5jc9GbDB5FBDqdZCKtI356IFDAuv?=
 =?us-ascii?Q?9IvXnu7oUiADPEk+qi6uM/bI7A+b3bM=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b92fc87-9dc2-4572-60a4-08dec1dd4807
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:02:07.5939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb/S5i4EKZ23mxWOdLbjyhZvFXEWuE9UEHt2uJp0CSV/GwRPDlMyfswm8lSlIz5Pp5uEFHsHIpkfCJRFGZ5Io4i34+NuSQ6tYFjlQaHdDm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63721-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[chipsnmedia.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:mid,chipsnmedia.com:dkim,chipsnmedia.com:from_mime,chipsnmedia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C4A963C588

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When stop_streaming is called, an infinite loop may occur in some cases.
To prevent this, add a timeout based on interrupt status before calling
get_result. If no further interrupts are received, the loop should exit.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c   | 5 +++++
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index b7fa19ea2aac..52ff1ac82e7b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1543,6 +1543,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
 	inst->empty_queue = true;
+
 	while (check_cmd) {
 		struct queue_status_info q_status;
 		struct dec_output_info dec_output_info;
@@ -1554,6 +1555,10 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 			q_status.report_queue_count == 0)
 			break;
 
+		if (q_status.instance_queue_count > 0 &&
+		    wave5_vpu_wait_interrupt(inst, VPU_DEC_STOP_TIMEOUT) < 0)
+			break;
+
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
 			dev_dbg(inst->dev->dev, "there is no output info\n");
 	}
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index 4ebd48d5550e..e04f2dbf3b65 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -59,7 +59,7 @@
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
 #define VPU_DEC_TIMEOUT                 60000
-#define VPU_DEC_STOP_TIMEOUT            10
+#define VPU_DEC_STOP_TIMEOUT            300
 
 // for WAVE encoder
 #define USE_SRC_PRP_AXI         0
-- 
2.43.0


