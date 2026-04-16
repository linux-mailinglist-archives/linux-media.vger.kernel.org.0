Return-Path: <linux-media+bounces-58850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD0fA16C4GmgigAAu9opvQ
	(envelope-from <linux-media+bounces-58850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:31:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2340AAA6
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE07A307C3AA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 06:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF9E346FC0;
	Thu, 16 Apr 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="BtdEHkTb"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022080.outbound.protection.outlook.com [40.107.75.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5E157487;
	Thu, 16 Apr 2026 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776321105; cv=fail; b=glFRZhitMpCgdhM/kNRA8A70cgJv+qTiR0y6lGKC2dLY7zsMrlhiB3k11bRCp4T3eXATSdZ16LXdS7CbJv81Oj5X+Nb7gFidiSWRuf2fvhpWjDXbNplXZEEMjj4m7xPiH6QKJQTWGa1RdhFvNPE638+k4oXQA/w3rcFoMkIy2gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776321105; c=relaxed/simple;
	bh=IDkwMw4RFYGJ2cLF9jhrT0yC+Vf66OhQztDDW5Xbe40=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fkovxqCwNri2o75xi9quMQFVaL24mkWMOvllkeosyNuQM/IdGDCEwcexjfU+6cgk7hNWnw1uLLCMy6jfZLmwdmBwdgJOPo6mOKMd0LAUf5UUK64Ir9fnDHfZyKUFGmwFPhuC1hvHm7d+gSnWvKjHUo3ieMCA6Qob2cd2DbVf/zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=BtdEHkTb; arc=fail smtp.client-ip=40.107.75.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7flJ6RMg+i9Vv+y0X5bQ7kqwrg+eLVk3/0+0JTLezPId/05PitOPQ+7pHkx75sTwDxPf2+LX4dCJiXtWeNRHETknw8oZz+j4bVgzsunh5h7FTvpDqqzS47EtgP8sgl52dV0Uq3ELIWc84UvHrc+46+F+eYsc/bytx3U3HtJbqiVCYhstDmM1q6jSAJssJ1oPkP9Q6IDgObmIIydZJJmniBZ/q6lWw48fRnw/dFeIWLj1sVdcII2HGuYlUDFL4RH9qDsbFI7C7EiSjVmwTGQcjX426aim/K6jooIJZQxN7KEure+Yi5vVABzEOgQIrDKEpHNUgaIJZeiAB6XHsokjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB/L4WN+jmCdRnNJ1mY9MF2JwT3uThu2CLfnDKgAac4=;
 b=uXTORpTS/DAC9XG9jqN/fLj7TSMQ3ojGmHd/6s7heb/U6LGbiZTBmM9lVhy3NrXN5jPefiy08sXFvwAGdwjbyKz6LMqonM3ki9nD4GrjHde0tdhZtEwVhQoNbk0DMSI2sxDLY1hEAqT4XX9SCvxB6RS/DEMGsrNoyEOya+P375ZOKKTiRdxHf2JnQsAOZqkNMIwmNQzvDXhtzH4cZ32VE9PcyQ0quOIBSBjQ3P/s09v54mG4khs8uQufHxDn1Yd2Wbkn12WrhLFkqAj9Ecxxrc/8d4DpGL4ml/NRV664Xg0cVeUTCzx4i7qE5nnqN7K5U+pnhRxf46EBeGSVKTSELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB/L4WN+jmCdRnNJ1mY9MF2JwT3uThu2CLfnDKgAac4=;
 b=BtdEHkTbrbn6KV1x4dfqMhqzdp8klF5FHkso9hdAdtWzA0EPMIeC2slFWLjDnPMdj04SdT844b0R9hChhcED2y0PdSiBWHYRq6dLsD8S/PT8ceisX5EuStXVDFFZefdRjHXW0LmMopzH7Rxpojio6XsItQq67pbo4ZjCaiKIlmD65eDqAkliR2pkF2RcahGPebbUZ6aSBL9VNyHPwUwYb1Zb0Y0G/0ZGE+n95CbrIfj2f7QgsgxsFkL5e31QrxaECpPLWTWOgKTX3K21++uLvXIqJS6FCEMK70Vr2zEYUENcwpw1TC9sC7/yFdwHSuMZOTZxYx1weWoUaSpe004brw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by SEZPR01MB5673.apcprd01.prod.exchangelabs.com
 (2603:1096:101:125::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.50; Thu, 16 Apr
 2026 06:31:37 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 06:31:37 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH] staging: media: atomisp: fix memory leak of raw_black_frame
Date: Thu, 16 Apr 2026 14:30:58 +0800
Message-ID: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|SEZPR01MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: e52db160-e85b-4a0f-70b2-08de9b81cfc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|366016|52116014|376014|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	6+gINlLteaCVq1WMuBq9+ruJg31v9wk3Fqd1c54YgByO7BCZqLKEBo9HJhIdHmF4ZQp8rdJlKE9X0SRPjcLrDAyN8c/Fn/8jpN48x61ftlXFt8q1WmhvOcrPvHFXEgVyI49t523AoobImzf8LNek+95ECFFHTfBmLr/CfoQirjKgOfI3GEZFYKUD58whOxnBX/Vbm18cZtNhsf+tRqoNjIXH/oKLjVi/M3bjmT2es092M0OFivqpY0Q11Ti9NXFvk0QxF7JBhvmj5oPpw2eHH+/F5hITkzVlP1V8Q8Ha93WHFJaDjKbaJSqqEp1v7kk6njbQ3/x1eLhzXpFMgQB6lHRzD5X/jrW8Bvmhty4mOdfnsMDA2KmX78+d8Sq/SxN68ewwFmm2IdkEt0bZ36TmI/HAMdp3jmIcK3jwSRTy41wBZeE6nVNxdAkw1rV9zLzwx2EebGFOoUmN5g4dbe7xKuXSjr8ZdaEkvMUJMwhiwGxYDGN+Hn9zazJ/dR4V0ri0usWhN9k3qkZswCxg8mE4ISSPferP8t7vivlqEU2tA4SewsO7j7DTh+02JcsWjpy2MRv225sp78RSHRq4WsS4rEKqFWAAiiAR5H2do76I0JA/XN5B/oKdpzBq6VvC1saI7cwwT8Dwv1a3hcWRLxPN2gj+J86zNesqtNM5ovJrBxGqtKeDGZ5bCN3oW0HvGrM8CA1T8+1ZwgCD9hrPjeFNbgpwaLDq9qRsW7id2wL/yU+5SD+I2vS0Ketdm+iea6j/0zhVpifehW+7kC714gX/tyiYLUDCox3LShRoEoDmi/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(366016)(52116014)(376014)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m4vSpFaJWs9a+u7t1zwZdmaM/y1ty47udnToCzPc6WwpjyEX/pn5ssSjUUs6?=
 =?us-ascii?Q?8irVQ3PSd4Zz+om0yBKzsHgWgVxwdXszbFxo/bk1i/FarVE+aQQO0mysNJiv?=
 =?us-ascii?Q?6HD2zn3IyemvHyP2UPGd6+CuxMm/yrpXvRrh4YMLzTe/iNNl6vlMlCmYQE9K?=
 =?us-ascii?Q?j3tj8ChWJ00JQ2BHWSmyvY4chffnK0i/m3IczIY66tHCF+M8xXaaWb4EmPXt?=
 =?us-ascii?Q?Jt1b1BImj+wbphp1qFZE+y8qFsLIrSQ4MDcvXCURvu77Jhrl0czV725/p1hR?=
 =?us-ascii?Q?R9outTFvVxFlfX1Dw2+h6OAUtgq/uDd6lK2KdPI83+oQS6dDEnE9ClgruC3D?=
 =?us-ascii?Q?q3XupIlHgFc6mBQw3Gzsx8pMjxPGyM1OAWyZkIEeVNufxOXNN1L9ET/WsWsO?=
 =?us-ascii?Q?aDCrfsVReXKkGsaPvXbeITkiQy7Sz0PON90Y4y8MYJBPwrjG+Z5GwBokM/JK?=
 =?us-ascii?Q?kZCMIr8ZR2fLkjuqLVN9o4Lk4K5P5TqcDZ+9bOGbmuF6kNhCdEin/F2AWRva?=
 =?us-ascii?Q?PHCx369e/urUiTfzgbdblbP8QSgqOu5UMElU1I/3rL6JX37DPRemi9NQQ8mM?=
 =?us-ascii?Q?5LTzVXYi2y2oG+h2H3gF+b9Q8xj9mm+UlA6VlpmuXEG5ebgZAUunqct3JtGE?=
 =?us-ascii?Q?y30AHFImvJDNIDHVgEQ97OOtCJJzk4R15KFJwgxu7QBshdPeuiaSdRsTTarW?=
 =?us-ascii?Q?MsMs8wVJPORIB8P8Y4jps1m1Ts3T2nr7mtf6iwSA3T3Sd9Hb/g3KIJY1J4M5?=
 =?us-ascii?Q?I52w/VQNwz0T39oHbTt68hHwvOeox06bj2CNr4Hj1JWnV2bWZf051z/+KXiI?=
 =?us-ascii?Q?LQidxY5/yKg2pEODsjFtVeHSxgBWWK59Ods6imvX8qcP+s0lPylGO4OZvFjI?=
 =?us-ascii?Q?XowtUx93M8HIQ+NUCEGDi8Wz5/nFbQm1LolQOI5fbMAaZzjJYm6BLpeZIiDM?=
 =?us-ascii?Q?5m6yXnL9i4nDBrk2Q6Lf+uSAVZ+gBvcMkGX3GlrxdeGKRKlvwJ1mfIgBxCv8?=
 =?us-ascii?Q?dW/k+23PZUFNqopMTIY2i4DoKOZWUd4ciw7mvZd+P2UqL/aPDr44qsLwb9wI?=
 =?us-ascii?Q?hwuZaR4/gLzjAjB19Kd76v76shlJSw1jAeSIMmjdq1Tl5ipqu9C/98Hb9FCr?=
 =?us-ascii?Q?4vSpzOwdDxwsxs5/HU1fWE3sp4qYGdQ73zpFefaYdZnN4UPdlB2AEPAaT6VB?=
 =?us-ascii?Q?MBM+qcpgcFthsDO0HysVDOTxHnkJfUemE3ukZ2eMRWEX86SB0sl32EtBY4ws?=
 =?us-ascii?Q?fcxntyojrRdYW7U6x607BgAF3PTUOGNPqCDo+Da1s2+SUGkC2rQI4m2KmdUg?=
 =?us-ascii?Q?UTKuhtSn3D2kjjunh9k5jAuaqyMMBlD+Ez9WLFE4/N2MYJfkrtdezI5TaC4A?=
 =?us-ascii?Q?qiLrJ5fuMMFwLwXq68gHBw09ah14+frIt5Nwqs7c6GEAw7NGGv2pTmiShi26?=
 =?us-ascii?Q?+6SBcqPfLzyaC1qkM2MwtLxm5w8FaIgE+ybjuBQbUfwl9ttJyuFoIi+Qztcl?=
 =?us-ascii?Q?9FanDqt59U13fU+cv8ar0NE6CcJTlwf2JOdx2z8dOxXzpWOQChi6OEMWw26t?=
 =?us-ascii?Q?rV7f2VNHmJsKGl2FRGp0KPCmPU7gnkNXACq0C4QiJrT9NGbwM5NHIoGrOYFk?=
 =?us-ascii?Q?MTmxbYcwizE3RR68v51t0CLqnZ/pcYFl2VNokhhWzMpUnvmc2oJC3n9Odnzf?=
 =?us-ascii?Q?FhHd0XyKxItm2oYtO8BwUmYLix1+gkDzIsUqXID8C7K4kR07Ncny68e1jkCX?=
 =?us-ascii?Q?69lY2tLbRA=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: e52db160-e85b-4a0f-70b2-08de9b81cfc8
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:31:37.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srUHJBhTb7VvIrr9fxWzoJyNuK7M2MgEuQmhToPfCpXenwT/53dcUc1+NzgJAQvwlBCaJAjtOHSNWkGvNQzOFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5673
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[smu.edu.sg,quarantine];
	R_DKIM_ALLOW(-0.20)[smu.edu.sg:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-58850-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smu.edu.sg:email,smu.edu.sg:dkim,smu.edu.sg:mid]
X-Rspamd-Queue-Id: 4BB2340AAA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Our code analyzer reported a memory leak in
drivers/staging/media/atomisp/pci/atomisp_cmd.c.

In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
fails, the function returns -ENOMEM directly without freeing
raw_black_frame. The allocated memory is only freed on the success
path.

My patch adds the missing ia_css_frame_free() call before the error
return, to free raw_black_frame when sh_css_set_black_frame() fails.

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575..3cacf16cb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3365,8 +3365,10 @@ int atomisp_fixed_pattern_table(struct atomisp_sub_device *asd,
 		return ret;
 
 	if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
-				   raw_black_frame) != 0)
+				   raw_black_frame) != 0) {
+		ia_css_frame_free(raw_black_frame);
 		return -ENOMEM;
+	}
 
 	ia_css_frame_free(raw_black_frame);
 	return ret;
-- 
2.50.1


