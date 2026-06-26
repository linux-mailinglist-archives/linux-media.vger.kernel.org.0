Return-Path: <linux-media+bounces-65682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O06rNn7UPWqU6wgAu9opvQ
	(envelope-from <linux-media+bounces-65682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4866C967B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b="FG/FCtc1";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65682-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65682-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FA2830651BB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306852E5B2D;
	Fri, 26 Jun 2026 01:22:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C117A586;
	Fri, 26 Jun 2026 01:22:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436969; cv=fail; b=sLX3iZLzZA1Tz5njus3kH9bzy4gR/LDSWtBviTogqdp1D5Sa96Zzpk8O+kg+mX/piSRah7u4jffK95h9NjetcZFgvuvs3l90na1dL4/w3kM2iF4uoUUWtYv5BIezAbmf/7aiKEHCcstKekKFtjPcmBLYMxXhXyKw10TeME4GlLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436969; c=relaxed/simple;
	bh=BFNNcdhRDVJU/dWCSt6XG+Y94rJtb6q0HO/Mq2xzWV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNBQrf2F2z2E90hLNecZQWUbmKIfmImB1kuHZepGwcByYnMDYSnJR/K7/ZNk+xq3vDTb5vcBc4EekEBq1wjMwARJirop+PhE/wzWJNoMi04ivNicLATQ4yy1ks6YvPV9p0YTUoEVMCLVANHologeizeIeg3flm89ihfaR41i/7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FG/FCtc1; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bnq3pXi+Rxf851E1n1JwvJ+nFKab0x3SUM7bRW0y+wmWXEBw+JcEfiZpI3ZIm74Rw9GIVKxcMuA2cnwiCB21sioTfALfz/0xvlGfxaSZIcNI92Xm/v9tm+H6JR+DcLiHU2Kd3m9Hx0/DgiyXyO5KdTFos4NCdF4qYYxxul4NLlZS7R3T7va2VJxllMZ5ksSm+ZCX3yPEFehbYR7KdgBFqL1jDc8D9OaunEG6lCI9Adt8Pbu85L4jF0m2KQRKc6OhdH7PGtuc0HFqa8BbtQxPeSQm4w0o7L0vyy6zqipmI9V4JZq2dPkmmintWFHz0mMCLyltkqBe+Lkg5TNUDv0hmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YksB66Vz6x1JlcHUNGIS8vBovP5O+qX7f5/z58EpECk=;
 b=HW03GRzygq3EKN1mBXcufnVqsmJ0XflcU4DEN1TN1V+oFGBPYPeL8hu4nzrAD9D8/1z7rXwtue9joYCoqjHC63osxyD1cVHPCoX0wWpoyNVBt4AS1yh+hexSkbxV5DgcPW9oTW07ZIVIprH08zt4AJgWWMI0Uq9cNzt5A+RbUgpXYxSbkm/ia1vwEbgEoVsD4xe8oC0ylddgq0pvjI5/uGpQHIxokttmgrs7TNDZFehAQQ+5+j+41+EyeW1HPr1dCnP18SPG3jrrJzN2wlS93m0OjteqhZzf0NPAlqCcBvzTcGeuDUb480hTvVAJEgzx6QweGmeFB5+WMPVQX2fwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YksB66Vz6x1JlcHUNGIS8vBovP5O+qX7f5/z58EpECk=;
 b=FG/FCtc14GA/Fby1TQZUHIMGWJnLxxaDa56sXl+eP2o8SjiUfDYVe8ZtnscYyGMHi/rMi2SA0onEdGEqZoSPfMcDSMiSpcMhToLkVGQIABLS6wU2sGaKw1mRHpBQHOp2HdMRqUr8wnbQRvfQ3Et7vQKyGWQMGSa2w0nPuImqekc=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PU4P216MB1949.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Fri, 26 Jun 2026 01:22:44 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 01:22:44 +0000
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
Subject: [PATCH v1 6/7] media: chips-media: wave5: Fix pipeline stall when queuing fails
Date: Fri, 26 Jun 2026 10:22:31 +0900
Message-Id: <20260626012232.111-7-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
References: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PU4P216MB1949:EE_
X-MS-Office365-Filtering-Correlation-Id: f4357fa1-e60e-4524-a8cb-08ded3216bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ln6CDUp8m4b1WCFhXv6QXkrVX+OfpVc/48FxR4e5jRZgADrHyJbLd6RRDdpd9fXJ9dr7m/yaX6UJ7htQ/pn5BYszWCqcj62X1Po6SKz03H3ZXb0BPpudqAsHtgkzhd4z577hA35y2jrvsYrTcSaQHHiThrcrf44/0CwAbZU0QY108iLS8gnhwySX0NoHZLGrzTyTh00kna2OiwquWv3LvrEpk3iR81RZerurJ6SH3K71MF7TZS4/1+RRujal56Jw+Qc8NgLirJpELBjn4BttkpJm3T63AOj0mrYES7VKcroi7MJtqAvQx5lNLHpdMq9faTUoWmOe4exSLvNmksNV5Qi8b6ZAgP5BP2uPLw6vLEIwwsFp3AzzUcPYPXsxuan9DjXpo9W9E9Tlsnq2K6hzfaPetBeRu4FJf48eyExrC7+E9NT+sCmd5Vs81PZR7BsVdhYPXP9OHKhY2sSViW+lkF4DJWLM4hW0n572JB0LMNdRkbxeKgrF4RkZFLmP8uX2GCuP13dmQjoWkEczo2f1E4bdt6qKOyrYXVMbBARCRSzinOWzpNW/Gy6um7cRrCZhRYlzGVUsTckxO7YbsTqXi1rmuWsrzEE0Dwuq6zZgW20CkOwQ9/ZbPHSIrarukfmr4foztmzRP8t12ijA6jyHXKoGQC9ycvn5U9xb9Zyq10/O8dkePIrhzSMFiR2X9YRTNE+y+GAK4w9VCQywy0E3mQ7ggbHCR/VlP2rY4XgNb0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VKNISVkVEGsGkL7mMh+7GAEuq7XxZm+gxTdcw1pVo7/CX9FoTG0oy5Uqr4zF?=
 =?us-ascii?Q?eQJ4/1FQyqkB7gC/Jio6mYcUwQ7+tSYbuM+XrUuCZpUkE0b6A6JXXSeUr057?=
 =?us-ascii?Q?+pfcxnQtdHExcNey/zl0zWtlHBK22JJjCYFQCRqOdxoDZvY249TyIQjbG2AZ?=
 =?us-ascii?Q?vjX9u+S5ZG6bMKFSwEduzrTlfU5zxdvo8RUoVX+e0EPvPXrpfTqBT70OVd1A?=
 =?us-ascii?Q?ptgt9N6blZjt9V+GIgp1ezdGf22wXwLFtbKYUR2SxbfOcJUhwITGJd4a5vAP?=
 =?us-ascii?Q?nsTf14WroIBjbyJsw7HYl9HjBZ2JZ8LQOtqUQvFmBcFP5tOZkCek/pA2xJnC?=
 =?us-ascii?Q?H7PoeYlEdBhtyrNM9+gpENq1msJyUxiP2omm7lwHkRnDMJRYHZQTZmt6Ww2a?=
 =?us-ascii?Q?JwaMxjLYfRmlSixaSxwZhKCkKmzphShVYMKqReSr9SlGzQvVBBe4bOvjvQ2A?=
 =?us-ascii?Q?hIzPtZFb7L3htOi3/MKCLc6y3z89tAS08gqm91vV0GUBgsRuFbDgIUzDowTL?=
 =?us-ascii?Q?+g0JEBUf9VRYLYG6PSq9jxAsRfDJkcNLGrmwiblepbg6hZGC3BCaJqdjBQ0u?=
 =?us-ascii?Q?TgsZ7y0mB1Je3o6kWWSfWI9hnQOjUjF2ZVZDv3brzYrwAqedIjuLN49A828T?=
 =?us-ascii?Q?84Y6yuFpEzOKCD+7WMeXTRGl9hijlOH7nbBrziFJVLblQT7c5G7ntD8+j+kZ?=
 =?us-ascii?Q?nwCy9fWvj/RhsvpRHLjrr3bVxvtJSn+lomlrgaB6vizgqvqKTo4gwfhV2Niq?=
 =?us-ascii?Q?NGQdxkPveqeNteJp9Hc4XJC4l2OBnE6Fnz81L36zNnzj38MYc8JuImevJYxv?=
 =?us-ascii?Q?zyo/KFmj9WyJER7emUzI2IiY7g0Hl9Y5+PEH2+7ojDUAzQ7KpOuZLX2crp6A?=
 =?us-ascii?Q?HwGB0XNOvQycgyVyoIJVDNYz4iR81fI/3Vj6Hqvh6dNFkVktSXqj+R88aI5v?=
 =?us-ascii?Q?ouCDdMes3y27ZLrjbYUDZsV5LX45F++dHKkdHaEYY2zjsZQOjf/2t7WBrQ9y?=
 =?us-ascii?Q?1jPO9ufrdznISc6bLxZfX/v2eIE/vnFHXH0dUu+ENMPTto2AAHNhHis/WwUY?=
 =?us-ascii?Q?5dc4mh5mpm1eduCV+cwVL4ZbU6BJjA4QidDFGVeFcQiPZmX3X9z1l6cYyjG3?=
 =?us-ascii?Q?B9YpRaziDkSi6RAOk+wMfmhAdMRyQ7+vRhKTVo3683DccwyrAqAY2o3qQ3te?=
 =?us-ascii?Q?T/Ot3APHZ5Mrf0fNdQZs//+vIv438CTdi2cOFGZ3dRZPgrj5Pkb4DqEeGhX8?=
 =?us-ascii?Q?l9eFVVNUvu6gWpwgo6thft8fLGNpPW3j4zpdBq5B1VbscigAJv3ZR7k+ZF+X?=
 =?us-ascii?Q?YbHdd/5ljU9CZncIEZFA3RKubPRvZqSptD0rJBaxID/KF37FfwxcA5sbjEVa?=
 =?us-ascii?Q?gm+CFa6VgIvFt0d0eGPesnNKUEu2R/jV+WkiL6lsxucl1PwR6+8H/0PGWqlK?=
 =?us-ascii?Q?C9QWSdwpD9312Bnd7q8n2nYmI5E41bHqgBEq5OeQWjY5XXM4//SHRRVnOBc6?=
 =?us-ascii?Q?r/4vjWiSIW8dpW9ZvjJ1DdISZ8M4p8rPp+e7KG/QcTwENScd42iX+7KI/TZF?=
 =?us-ascii?Q?UVD5qewNYz2OY0X4EBQRAt1+97pzTRZuNljHbDcOpb/gqqyit1OZUpBDvMuQ?=
 =?us-ascii?Q?j4RBzZ7WKkL3f4VgIE2UIfk+DLhNH/kTW6IO4qFRUdmwWW8pSAUEfG3pYmo0?=
 =?us-ascii?Q?cfgXdY1qQCGhNJqfbO9buSv6n36rW6eMupC2SIPb6ZXggIND/xZMPeXYr0vJ?=
 =?us-ascii?Q?5Mh2PYuRJpZaUfJbgwo/3RXuebJ6zRE=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4357fa1-e60e-4524-a8cb-08ded3216bcd
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:43.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+LY7vQ7Fq/X7GXOeN45MhnKceRTZHpYGcMF/RK09zn/gMdOG6Za4YN1L4xyN9VU9TKB2GO1ygdXpJpNg/TMXl2ovZiCglkd/EsivPghef0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1949
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65682-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D4866C967B

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The Wave5 decoder calls v4l2_m2m_job_finish() immediately in device_run()
after submitting frames to firmware. When the firmware completes those
frames and the queue drains to zero, finish_decode() has no active M2M
job to finish, so v4l2_m2m_schedule_next_job() is never called and the
decoder stalls.

Call v4l2_m2m_try_schedule() in finish_decode() when the firmware queue
empties to ensure the framework always schedules the next device_run().

Fixes: a176ac5e701f ("media: chips-media: wave5: Improve performance of decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index f33c00cb801b..1817b83c5884 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -475,7 +475,10 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 
-	inst->queuing_fail = false;
+	if (inst->queuing_fail) {
+		inst->queuing_fail = false;
+		v4l2_m2m_try_schedule(m2m_ctx);
+	}
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
-- 
2.43.0


