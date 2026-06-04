Return-Path: <linux-media+bounces-63720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YxoIIBPeIGqi8gAAu9opvQ
	(envelope-from <linux-media+bounces-63720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:08:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1763C5E9
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:08:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=SAFU5H1w;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63720-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63720-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6CA830BE27D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E635B21A;
	Thu,  4 Jun 2026 02:02:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F492DB7B8;
	Thu,  4 Jun 2026 02:02:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538535; cv=fail; b=rlKcMbRp1l8NgsDIH5LwRPcpHNUBdLZ/uIw6uVA4dCzmHgXZNM8wuroKKouvmiRKVuyRFii2rEYgORl3wepdsczn6jXW8skC9Pxl8lz6DacuPOfL6U6S2bADoeBhyJAZIp7PHequiCAqaWsd+/i2MGyeCGH0oD8a4VPmG2Thqqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538535; c=relaxed/simple;
	bh=HtCtCmY/c1pnCh8ot07T7J5z3/ek4TtrzuzsIEKmwOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMLWSPQLIhPQltF6FZMsHU3H4VMogfIHnWj574fcPwbRN883021/6m1jf7TxN7P1hqy8lg8BVUo+7B86MF5vK7DCPp9KLQSgeoWZVlKohFi4Epxa4wNSvEzkNn22DIvknKDbWHWsTMJd9VMczlbPWfDCuK02zUyDRRN7NuInAvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=SAFU5H1w; arc=fail smtp.client-ip=40.107.42.77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPDeLeiu834klqYrkmYDpZl1LBk4uWFOkbqTENvNFYQgGmFn+DQNAdGjiWqdpDjQOiA/t3ENHZ3X/CPd28bQZ9YlEWl8y81BnLz3KV1B79nRQkE0EavvaaDdB+GKSTvQeusWhIVOadCv9ud5+FFtP0x0q2PyO6w4HqS4oKhCkm/Lan8gxvcYsVtIw3MR/3UuXJ9Af9gO29iJMCFinbiPbubm70FQl1lFVA/1+BNs3++AMWvNCSkHQLuInUiCHYdkD6ZHyT+A4T527iQD9Re4u3ULcLzXmvzD0Rid3WcQdJZGi4UqWJQgfshdbF+R7kdgmM+fc85Rn0wkpX3Bze+WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws4ooYOqTkTPeXLwUlbQ6rFUi7bRYDjZZZ7cubsM3iQ=;
 b=y+e5JiCMwnFOT/DC2lImisjNPaz6ubrdfjTXVmFkGZZQzm5R3mkTG5gCJNMrwa0SSwnrekNWdVRewgH7JS56jrPVbmO7qC1TELfOOGS0Z8/hUnG08zRqpzmI+I/YZ/39Vyh63JRgRdyFPdcDrQw2hUsnQjTVhCC7+VyvTeINDKHS/4l0vZ2kULDkVf+Wpmng5I0dZMXFtJQGZtUvkoFLQMvXnNqxuRuLb+94K6AxJEaIdeqQ4fO5khhpyc9hgLaBprj7VtrVPtcgptqRW67/RvC54X7cVIaQe7JTsKVYJ3YBm+jm937RwKgnqFzTCvx/uFrlp7t9IT96VOjv00pnLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws4ooYOqTkTPeXLwUlbQ6rFUi7bRYDjZZZ7cubsM3iQ=;
 b=SAFU5H1w+UIlLqB2m178gaIKOlwPA9VKLUlk9Sc6BBNjcJzw4IqP+2sc/1gAGTKS1jgkFkMd5oBJUmxl+SZr9a7VMhr3CWeMoUnal7WPOdm4Tf5s8RWs7DI5/AmIBfNbLBc+aaPf3OTPTp4aYmd1DiOKG8DkqGrOxjLXTGeOyFk=
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
Subject: [PATCH v0 3/4] media: chips-media: wave5: avoid skipping device_run while VPU has work
Date: Thu,  4 Jun 2026 11:01:54 +0900
Message-Id: <20260604020155.77-4-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 47827e27-ecbe-475e-74a7-08dec1dd47d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|6133799003|18002099003|22082099003|56012099006|3023799007|5023799004;
X-Microsoft-Antispam-Message-Info:
	FWb4kUKbIjn0zsIbLLSKnSf1hJeoQ4LgfWCRgy1EBDqErfNHOGazfwKfVff36pLaS1u5WXL+CIxwpDDpLSQVXBZsgtuxIyRxY/HAJqrCQMpEXRXMeIMlQvwoXB+4TJgl1qL6BBzVFoe6gJvJEJpNnEMGFsIQZ2UuJ8RANyNSFhXAvMclFn4fMN7FMMDaKyxzF0sDP548Y8s9aeI2CLuJ1O9SdRsIZAECvaJq92DBVnaYOibzl8biX1mepHnrvXBJymxCM9rSXWkJl/Q8eNdedwDv9jEux5CnrKq9Spb3wZETih75wmlez51aianSvDUqp5jV5q7bEkriJtw4mMjl8QSGDacktQfMcbe3qObI2wPTDGfeFrV4rj41feMtUCcX9JeGMpvCjMNzdBNSqTeepxPnTEAx8FWeUh9WLqCVI9+hHCWnn2XdJ0NiWWelCHz8V/cJLC2AfOcw9XOvHol3gY7XMq75lPpyCyiXcX40d0SSyk4d5IkqxCiOQxmXenl1PJOF0EvlCvzpUHPfhGFwgXBQvSpMvjB3qA3HST2hw7mHPUwWeT9i1NrkE+cFBLWxnXp6rWrzCg8tcNwPRVDcPnfW7IcL676v5uPJzts6oF13ULSjEE5zxbexe+bp24E7V9rUQlOU7x3T0tm9DHNM5K30b4rz48LXtRB24/3G4CcdU5Byded+ADak0wC+/oNprqGl6iP8tNhjuyoEM/o5C/s4S18UFplSNEcK/ryCgYvHo25nrWJ3nF9eFJ08ElgT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6VStRmZNHwe0v3PCw6NtCuExTYm2DZ22lPE1QkgD3U2BbSZPBo+g8U2FzJkq?=
 =?us-ascii?Q?Rzp27GfKp5u9eF+1ZmxqU7kUjTTBw2CymoADErBP167c+klHEuEYUVPQefaz?=
 =?us-ascii?Q?KRT9ygAP4T6jsQSAeVChOpDYh6sFdtW+ZRrO4mRvQUD6daTNEJ9UFtkvkPwZ?=
 =?us-ascii?Q?cEjqHcPF3imnUEn+XMrFsnqYjooUt4gsEI/j+QCkKld08uuQi7zKkHdd8PkW?=
 =?us-ascii?Q?pNXTX+IaGNbZGn4s9pYiZ0ftfUlvAhIBRVHacTGg/sn+BMezYCsCXF+lVXEu?=
 =?us-ascii?Q?0FON2WABVM6Us+xhC+lcRp9NVlsxojOqasAvwK9ahATRaR59ZIfpAJz248Iu?=
 =?us-ascii?Q?z6lL/Xva0dSF/1HzaZqsOOrwYvtJsCdvbkdw2b+kqEAKHhUkmTGL//Hs02g7?=
 =?us-ascii?Q?SBkqZqCs+oEYG9imxfCKWUbq5TEoR9MQcPHP1DwQgnuYqRlIGd3jVssHv3Pg?=
 =?us-ascii?Q?bUzDFUjCo6vT24+MzdhydP8KppRUN5G65/u6OYZuNc9u5q1L0i/ZRTosgTe7?=
 =?us-ascii?Q?SAl6Z6eo/hcI/bc4GQ+hjdykupqKT+wIobbIv7xj90V33yR2iGdfdhrwerz+?=
 =?us-ascii?Q?nnlYkTBaza/WgXHbW+3sVquh1E/VAKGDjkCVnKvTMCM3TcomdRV0KZ9dWOpI?=
 =?us-ascii?Q?hgFxGAOGmk9FjwjrZ1ur9VMyD7nNPSRLT7Q42p7t3oCRJubKNuoSge7NbLkw?=
 =?us-ascii?Q?3MwZgVi5p1dCSrPZJ8AnvdRGOQ9DOcYcBvH0f/9Xx9ULto/t9Vj22zZNcIhb?=
 =?us-ascii?Q?8462fuhrZqvYFHz9RMwOSbo6iasY84ZiXsAHBnN+tccX8efoIg43T1tCNqBe?=
 =?us-ascii?Q?qKthog6S6vytt4PUY4IBIE5BDurr2JN19ANNIeoT6Uoi4Jo6USZD8qcNuFxH?=
 =?us-ascii?Q?vGQvk9gKft0SFcrSR8SEzveHEI4ucYw4nwzj2o9UtnyTDN5IhPKBFx9u4Eod?=
 =?us-ascii?Q?MggyQonXKnN4Pk21xTq3EvBPuSLYahaWhVh3LJ8ZRLfRGSDA43StFbGlyPjD?=
 =?us-ascii?Q?1fD3sCLyXNqHHhLt3CZ1OmmCFCJLN4hi96n61UnWU8oNeb/xEUdCHzpckJKE?=
 =?us-ascii?Q?W7Mw9CtO8wiGCD7zK3X6jVg78TvKxxdGGnV3GjaBm60dBW73quiKbFtUxBkm?=
 =?us-ascii?Q?KoQDrsT7QVlUhPfW4eIQfBBNKJGP3q6aAvdVzQIKoR3EeR1ZRBTjx47cFxBR?=
 =?us-ascii?Q?Pa/Gx+3kUCrL5hQMWCnVRXJn8sMgvGjZybxrpN0YovWhFQz6DY6QKUvDe2J3?=
 =?us-ascii?Q?JvuXUN/YRjxbDBVJBdRsKDa1EIFeAhgkgVFO/dt2gUI5b7JCedf4jTF0Hz1n?=
 =?us-ascii?Q?Cm77V3ljgCQjCeEyhLdAydmsFhdsc6jg2ssV7zsgeW8zANfWZyRrNCX+wMgD?=
 =?us-ascii?Q?kkNljKZON8SklYdJutLptLFeDKwzui/U6o6yZjywbnjaS6y96WOf3TEUnCko?=
 =?us-ascii?Q?pBXeZqzo2Fsv66pK6JhtJR3SqcsvZ/aKX51AuWFBOwg1llKZxJ8KD/cdOqT4?=
 =?us-ascii?Q?vN68RNCRrSSCq2wWwrGzDd9VoAaU3pajmbG2Nb6zgwOZZMdM2CTu8xZSY3NL?=
 =?us-ascii?Q?qHOxWiVB8zLy5nu3/dDG/AqnGSCONif4v3EG/VcLQQShUxv5IBMyYAJdNl2V?=
 =?us-ascii?Q?wJ/4SMBRI+IM3pBP5H5XzRhuFi9T/9KsfvHym3Fvw8g6ryGFhfm8FcCuZhyq?=
 =?us-ascii?Q?+0/PFB6vA+gzzZ1KmR0lGJgm6TBrDRMZRKPe5nhweBJB3iHvwwyTqQMmqNfS?=
 =?us-ascii?Q?rmwmGpjn/TFSV54paMS4HWVwoHhxCDw=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47827e27-ecbe-475e-74a7-08dec1dd47d4
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:02:07.1293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cbQjJB/DmiYJ2+582dJkhRVltY1vCHumzTLKB87UA3DaXwEe1LswtQrk9KDfqPH0QMq4VaWs0IXBIBExfIF7J2RVQKbr6kyQX8r+BZ5nK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63720-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:mid,chipsnmedia.com:dkim,chipsnmedia.com:from_mime,chipsnmedia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAD1763C5E9

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The decoder stalls because empty_queue is set to true even when the
m2m context still has pending commands. As a result, device_run is
never invoked, the m2m source queue fills up, and userspace (e.g.
Chromium) can no longer queue new bitstream buffers to the V4L2
driver.

Fix this by querying the VPU queue status via DEC_GET_QUEUE_STATUS
before deciding whether to skip device_run. Only skip when the
VPU's instance_queue_count equals the number of ready source
buffers in the v4l2-m2m context, which indicates that there is
genuinely no new work to perform. Otherwise, proceed with issuing
a decode command so that the VPU can continue draining its internal
queue.

Fixes: a176ac5e701f ("media: chips-media: wave5: Improve performance of decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 01d1368b2965..b7fa19ea2aac 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1663,9 +1663,15 @@ static void wave5_vpu_dec_device_run(void *priv)
 		} else if (!inst->eos &&
 				inst->queuing_num == 0 &&
 				inst->state == VPU_INST_STATE_PIC_RUN) {
-			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
-			inst->empty_queue = true;
-			goto finish_job_and_return;
+			struct queue_status_info q_status;
+
+			wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
+			if (q_status.instance_queue_count == v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+				dev_dbg(inst->dev->dev, "%s: no bitstream, skip\n",
+					__func__);
+				inst->empty_queue = true;
+				goto finish_job_and_return;
+			}
 		}
 	}
 
-- 
2.43.0


