Return-Path: <linux-media+bounces-22849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136F39E8B13
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 040E31632FC
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 05:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989141C4A20;
	Mon,  9 Dec 2024 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hTGvJUTm"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020135.outbound.protection.outlook.com [52.101.156.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D071C2DA2;
	Mon,  9 Dec 2024 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722633; cv=fail; b=jawlnfHCuGaTNyyi8J32dul8jB7FFiJq/ssTHkuPAMDgoRo58uV+sdtAGxKT+Nz0q6IJj6Psd590330K21fLZP8YnBT0qtKjbKsgzPga7AZYV1rqOC6nojy6P8p87pkpZ8v5Ge99f+kIlSdk7XfSuq5Hf8W37tpkUz/POeV6wRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722633; c=relaxed/simple;
	bh=tfhELEXfIgFBBWICfuIKVHQWYh8PP8mDl15+/npi9V0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MWy5wFd5krm7cubb4A3Y4txq4XwmSjacXl+6paa4FCZYmEqIXiQv2+vUGFMe6vACgLYHMzXbtUAnmGyF8Td8nQbo0gUFod4seccEloaRLeSpU+zqB//+KRih6s0k0Tlgyh1GTyacKi7fj6gf5uBGDggbNPUEXF1aOVb27WggJMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hTGvJUTm; arc=fail smtp.client-ip=52.101.156.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk/Y7GWO7U1bC8D+zS1N0SZXsXa70WLdRAW+cOLoBAI8l/7jQ8YMg9HJ4ntgvTXEvZdzm0lU1tA3nOvnMKmcmQhSdvZ68P9ET0/KWX2vTxrwK+cg+UUXAzBkpqLtcMVkfdiE63jFo4J6AmNmEH0mXNxXRfgupwbhILSW9QJidy0KXbjYTD5S9f4Mpi5/8pYJX2i/UuQ1uHm1BcFf2kb3JUQnIoy/QsCwGn7cYC0dmhNX3Ecxm38VjhNJJ1G7jGXd557KrwdPYGQ/8m64KwSoaCOsTkGZvdHVICAYoctpDGbeGXVjnDpnTkNZlkKHs3atYAhL+dVvr/lI4fgTBnwS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gk4bA7H6hRK4XbbJ3XepdyJs/Llcj630cqQqTLtC/+k=;
 b=AQtId4kikc1euHVUOsX2Ihv5bvMbPaj+vQn8sw6yggZ3Qoph6TZ56ehC0ppxv3/AYzkx5195dy3qBRqlRNlVHZvWfL3DxQ9p50KI81w7surUbc3JvtWpAkc1+5cjYbDq5cpsfxjp1cAP7l+lme2ikOvoVDxmv1qVUCgFYHqUT3wCrgb9uVEDzkNW1uFCRIhmFUcUUsjWGofFi/EIot++38dymsNialxCqdG091wAGUI+sZ7A4UnCJlD2TxV1F33eBjChuIT0Ww9g4PtPPl+ksBr9fr1/9w9Bur5exA7PZp/+Hj+kkVoiai2n2j2GNe4zd4pZNhGW/MWuOpPqdy0MLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk4bA7H6hRK4XbbJ3XepdyJs/Llcj630cqQqTLtC/+k=;
 b=hTGvJUTmSMoN5PrzPOEHe7hSPG5PK87Kqru/lAz+ffy9mj+sv+E1QnWO6TX+BMXjhrw6G9dNDLUAf1mYTQdhdVy9wnd2aJbtu/rQoqRQV5jKMkBOB2rzuGZNodh2n7XokJ499u5SQhygvGASjXugzMMfPwBo7vKfhe6zg7M0Zpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB1671.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Mon, 9 Dec 2024 05:37:05 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 05:37:05 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v1 4/5] media: chips-media: wave5: Fix hang after seeking
Date: Mon,  9 Dec 2024 14:36:53 +0900
Message-Id: <20241209053654.52-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0219.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE1P216MB1671:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddd6274-bacb-45a3-dcb2-08dd181383e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQEC056HbWDnsrQWrAILn2OtdCrDbpLOUW94hWue+NZEi9l0aJaC0xXK1qKY?=
 =?us-ascii?Q?EtqAX/n+ZMHhlYroZk/0ssVVMG2Me7cJ2Nbx786YiiI8OBr1GawW/9/8JdCR?=
 =?us-ascii?Q?sOY8ECU7Cak1mFflw+D5OuVxcCc0Y/L5FCIELmnaleTykFhg2dwRwMNdDbqM?=
 =?us-ascii?Q?EhlbTzFE+D/zniIhalQiasz6yQTVwRFDP1zfp5kg4wKYRx2CkjrpgRH9Jcwp?=
 =?us-ascii?Q?R7bUCByYhpOR53rxiQRZcIi0kFO1oeDgo6RR+smKUEqAkefrF2PNKr6wVQW2?=
 =?us-ascii?Q?gA9cdgvCnTNwQ8YoQsZ2z7MMkK1ZLSaijAeak9CDMqD0boSXoADcDV2W5Jr6?=
 =?us-ascii?Q?mk9wrYOnipVhF7qSwZmHn0z5g6ZyJ92WhWVOyl4X9/72v7JHjBY4dq9p87FJ?=
 =?us-ascii?Q?Fubr38IU53QEOWvPyGsSsWxBISqOtpfjD386RXFz69VZVLhVFaOV+hA3dOKJ?=
 =?us-ascii?Q?tXWbZbNs5PuAhQim+tspAFyI2CGbm/ASoeQpOFnpAuYrT9JzWeUBzixB4EQf?=
 =?us-ascii?Q?cPhHl58nw8cy+cHVOJLbZCgJYAoWCuKU+pJ6KXSuHof7MsM6rCCs8dGRQxQC?=
 =?us-ascii?Q?rHimYYqBUVgrFKfQvCZtsYrv/UPMIEHqsZATKLn9BHv+AXmFWbuug2nQSfyv?=
 =?us-ascii?Q?2uJ+tjMDROqY0GcxPUagGh+H/bXOTIBIxWjlAtMFSOsoOyFL6atNfcoxONcG?=
 =?us-ascii?Q?1X8PPWtQ1QkpJv8JkuhPmMUmc/bNhLxLXoFclMXBC2svXIxgXekUpkh+lWfh?=
 =?us-ascii?Q?/3UhfRKx0aDcr9B442DBATXte2hKWmC6/+R0j5iVzNU1MKWhLNRZzWLiCuQ6?=
 =?us-ascii?Q?QI2XsIALKt07lQ3wkvY+fykqAoJ3bRkGoj93vNYgIXjo1dcGF32Qy5Iez77t?=
 =?us-ascii?Q?SJkibYnfXlgbduNk5JOprHpE5/O6Am7YtOo49+SUMVaamWLP3FTMBAO498UQ?=
 =?us-ascii?Q?TB9fgnnr2zya5G+cxGoywrtlVbAxZuaHha3TE0pvM2paOZdtGwbLIxxy+aZA?=
 =?us-ascii?Q?4IwWuo+QEuYW//S8hSJ0JAuaN6VSwIwaUZopFeu/ZZhpeEn0HbIVeZCOE0+x?=
 =?us-ascii?Q?7zTY2bxqcvB+8CrhMFKsebqZ5PPloi8rD5aaq0sRnJPPtOlzmlGjeW43tukX?=
 =?us-ascii?Q?tu89WPamNuGYDzJbi/v9TMlsuuRYjdGDT6cvJvPgYzVh5N+u0QZkkevpgc45?=
 =?us-ascii?Q?7Wx8JbqlBNkhehmx6mUCTaE6QjOFgZhUbIWuwNhuxA3DU/wgBgVz1WBojfJJ?=
 =?us-ascii?Q?Pse/KRdKLiENo083uokHM7SAx3gRttkOWRg+Fyx3aw/VifvBYgp4XWLOCg5k?=
 =?us-ascii?Q?qTCqrbW7PWO5EpdptsT2MmURRELgO8BAvgt7F8VwrS9WMXjOCKObVdlsP9Pe?=
 =?us-ascii?Q?EV1fMyImXCEpoM7zPyE7NHvX8b28JA6x2ZZw/+PuVGa8DpNzWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FrmY/Mhq3QTYMyHQzdrvaFBVayNcqZCD7yBf/NPm9EMVyxwOcEPdQBNt1HpD?=
 =?us-ascii?Q?fWPbVzzS0VOVIt2dDXHdy8+i77a9+zUc9JfyG3oAaoNYrhaWUsZUEX0FJ46x?=
 =?us-ascii?Q?k0GcpkxaxWLT8CzoqWl64TDmqC9hjTiIQHbBM7dx8BGoUKHl5FwbGtP58GwQ?=
 =?us-ascii?Q?B19LpqmOYeQMwFmIS+OI1IvpHG++A6ikBN7nURCJ24+aDMDV6JEr2ez/tz12?=
 =?us-ascii?Q?Ohy1Iq8r4yfV0zpLRh2gINHlWLlmach6bTdzrhTHwP4len9KHFfcZKJRsKgO?=
 =?us-ascii?Q?mvBWLqx58xHUMUaI9RqLCdHGYBSPkwdOvfyqt6g8ucZV4n3KkY32wtx2F077?=
 =?us-ascii?Q?evmDsshT4i4tAVSHs9gFWCDKXm8z0sKPLMN6QYSpANZR236+jOojjERtiOfO?=
 =?us-ascii?Q?4T8nnbvLtHqGCpYI/G92rnQPWcFofHyzxZV8/WbCXlgkbB1LzIfDGeSPaNCm?=
 =?us-ascii?Q?kMFJVk48eQGszIQkRQN+NJcioFAng/wgO0lU37PXJYIFg9E6xyNsY5i03zhI?=
 =?us-ascii?Q?ACi4Fv03DaiZuTKztOVQT/r1E8/qwptRzSHj9tWi5Pe1tFJC3VZuX5DFCv/R?=
 =?us-ascii?Q?1QfV0KSRXqF3qGYR8rEwVMh8rA4PtNg+8+oQwOvnsVDm/E5gsftrSPRobCLH?=
 =?us-ascii?Q?/FaTjiqDWIDKcAPGF/oGV9OKCeG3UdSoTe1F2gGgvNj0YCwCKobB6Xpbuild?=
 =?us-ascii?Q?kR2ZQ9Wb1mLbz+3kX6ueeb9TxKENeMW6BH9bY6/m9ROac//MN0o5wHQAHUV3?=
 =?us-ascii?Q?ULA+6/+LgPdgsRUrpp1t79UKMJchCvYH0BTtYdJzaYxFurpHBnD0oMxWMVAa?=
 =?us-ascii?Q?me+RWXedZ4wF6NhQ1KYmNJ8ijtwGRZbuWbeO+HZNcVIAPtfHazQ9t//Q8+j1?=
 =?us-ascii?Q?oYyczX9vtvVBON7ryo25jsy9UKvMJtPzi2sGZiFvR+g+HdOcg+DP1b48FqVm?=
 =?us-ascii?Q?b5nXO2bXJmlaFEkSsG+6bT1YmRoReXqAhmp/YlX1CUrGE04CKAlPWbtN9wui?=
 =?us-ascii?Q?ARNyLbMmPNOhumTL8wxzHlqAiTIdIKA2ylTSBzoZkTxTr2uEZ17c989OZPUO?=
 =?us-ascii?Q?P4JSE0VtoCDlfXYfGyyAOMHAjzIQ9JhwzkjUTlnYUXlpdz790ALz54yZb0/D?=
 =?us-ascii?Q?wCozzuRwQEsUnMPPUdLuv8SPTE0lQWAQMW2nwWrIVhK59G64llDJHBjLt6Em?=
 =?us-ascii?Q?1PSldJvh8pItxDDv2xjoGyc+tGg6/ABlkEs4wwfr2VTQ4tm/cCydB9uS+FNW?=
 =?us-ascii?Q?tZLNZ4SNZo1yVaZVUKXd110kimSPHZEn6eZ6EA0BDlT50c7AMEPViwhWRuuO?=
 =?us-ascii?Q?hvEbMfvTSFBtmo8vy+BphdRj2K5DvgMta+o4huoQYNPUztyDyeaYd3SXcdhL?=
 =?us-ascii?Q?MUXabgUnnievPYWfUWaa9jHqql/W3Gn2kjiD3aUjru6Kh7KMwLQWfGD1aqsh?=
 =?us-ascii?Q?lK2UUIFpS3FFY30e+ck2csdacL43z+Ll/oZL8/Q17n9Cn3Gb+8gZ2x+RM/9U?=
 =?us-ascii?Q?sMOKLS6WTbCab1K80yfzdAJqLbj5jbm+wdy7sRmhqucReA+4SS9HR0t4Lx+T?=
 =?us-ascii?Q?ZnvLSInMVC7HqjOtRKB/hzZfiAJ9CfD0VmAd++VyJ/vo9CO0dVgykUDPLtZY?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddd6274-bacb-45a3-dcb2-08dd181383e5
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:37:05.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv4E/81jMt6W/CNRPtTQxt2fZQlO8cAG9TQC+RZw7b54HXVxDYTX2kLGI0EtrbXg6/kXNSXW8ugIDHXqoH0ebi9OkM6/PDLLF9YlLOpvTco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1671

While seeking, driver calls flush command. Before flush command is sent to
VPU, driver should handle display buffer flags and should get all decoded
information from VPU if VCORE is running.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c  | 17 ++++++++++++++++-
 .../platform/chips-media/wave5/wave5-vpuapi.c   | 10 ++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index b0e1f94bdb30..ce3fc47dc9d8 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1431,6 +1431,16 @@ static int streamoff_output(struct vb2_queue *q)
 	int ret;
 	dma_addr_t new_rd_ptr;
 	struct vpu_src_buffer *vpu_buf, *tmp;
+	struct dec_output_info dec_info;
+	unsigned int i;
+
+	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
+		ret = wave5_vpu_dec_set_disp_flag(inst, i);
+		if (ret)
+			dev_dbg(inst->dev->dev,
+				"%s: Setting display flag of buf index: %u, fail: %d\n",
+				__func__, i, ret);
+	}
 
 	inst->retry = false;
 	inst->queuing_num = 0;
@@ -1444,6 +1454,11 @@ static int streamoff_output(struct vb2_queue *q)
 		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
 	}
 
+	while (wave5_vpu_dec_get_output_info(inst, &dec_info) == 0) {
+		if (dec_info.index_frame_display >= 0)
+			wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
+	}
+
 	ret = wave5_vpu_flush_instance(inst);
 	if (ret)
 		return ret;
@@ -1526,7 +1541,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
-			dev_dbg(inst->dev->dev, "Getting decoding results from fw, fail\n");
+			dev_dbg(inst->dev->dev, "there is no output info\n");
 	}
 	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 9a28d0f770bc..bcb8e6a37843 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -75,6 +75,16 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
 				 inst->type == VPU_INST_TYPE_DEC ? "DECODER" : "ENCODER", inst->id);
 			mutex_unlock(&inst->dev->hw_lock);
 			return -ETIMEDOUT;
+		} else if (ret == -EBUSY) {
+			struct dec_output_info dec_info;
+
+			mutex_unlock(&inst->dev->hw_lock);
+			wave5_vpu_dec_get_output_info(inst, &dec_info);
+			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+			if (ret)
+				return ret;
+			if (dec_info.index_frame_display > 0)
+				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
 		}
 	} while (ret != 0);
 	mutex_unlock(&inst->dev->hw_lock);
-- 
2.43.0


