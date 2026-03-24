Return-Path: <linux-media+bounces-56802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH3bB9IbwmlvZgQAu9opvQ
	(envelope-from <linux-media+bounces-56802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:06:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83E302214
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7DB630CB8D2
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074C2291C10;
	Tue, 24 Mar 2026 05:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="RnG6IUiT"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EE283FEA;
	Tue, 24 Mar 2026 05:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328658; cv=fail; b=LevDjgrlSQc0YhJRNLmAlmy8wWR4sChWWApPHnNUSLD//ZFBigk/+q7WxJKv/zsP1WG3Xoj8+V7RxejkGbzQsIMfr1BrJ9N88KN0zabu5sM6qqus0uTs5tGAtKNeAJlVzBUR/MzFz4Mqv5IePHxEGXU//Wo8ihu5yv7hkrsAFaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328658; c=relaxed/simple;
	bh=j8mtIFbXBRvqazj9AFmcmSfzePZmS8saWD539kliJ/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BBoBn+nepYfi1xlz6Gnoe9nM5e4JLEwCa4apEjFmJa7PJMpuLXi4fYgc2H0gcDgPqSppvdF7+PyI0dCe47Bh0ABWMOO60ESnucnLwaYy/gEMv+Hbgpj96vMew2uMUZhgAsW8yQlUNkwuFTsBSXgw0gF9Ogk0OT52NzqK1stc6BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=RnG6IUiT; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCDvthyBem1XGMXvzzEd3ZwtkNs36KucWUJou3IQfRUkSBo/PC1X8Zs3W2PgeCCpYjX9Oem/5KJxwefovfJW7gvx6/7xAa7qFT7Wym2PmENu0ybKJ70wwvDffd2jh4OpaIHFJXpQ4i1+ZRpHxUu0ltp7Dx/0wWa5an2pt7MdnSmExg1FdCmvg1V1M1jv2F9n33TBgsSXxud2dLPJynp/Wz+bU1D0sURX6VjdAhHqvUQ4t54IJz1chiDflqidaFCnk3MzTK+onbbKDLpp9FCuPUjvETZQCMl4r4L+E8U+oEF8VX8vJdEFxrP2NOZP8YZ9cKCJBosNHWTCq1IEVf2jyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydw42pLGsrcKcvMBE8Or6BtfCQTxw6bybMDXjEdTGi4=;
 b=X0PKNnMJPcEczyZifGWBv9cqDmj0ni5JccgBabo51Ml99nvPSbDsZHiZt/A+9UU258sxziIxcKtPU2Q3APm38jeWoCQr2AB3cLR+IUG95M6RcX7OUVKHBvNcvKp1BEVGX5azNU0/m4HMoNscV7HFi+IjlehK8KBt7GgLN+4ceg50JZl5al9Ref+dJtnvtMw9+e9oc61l3qr/Lq1+jAXsrnZeVh8ob+iRei0+WGhLMOzwtQA34onswcLaM+jp9V99hjdxgmNaNjO6pMJ8PQdUCtgfnLzBhLtCcLU3JrVzRysBxcm5EQxO8xfiZ5YMAtZ3K4pmhZ0ZfegYqM0LKiUnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydw42pLGsrcKcvMBE8Or6BtfCQTxw6bybMDXjEdTGi4=;
 b=RnG6IUiTcO49wWzVDchzDN6XcB+lpTyn0AZdwi6D8eUnimZxj6k9Piaou9L0/rFFp0alUcxv6HNtfp7UJR2MWlWYJ60kKUfg1hPj6sTXSypKOeAHuKJaV5k49Gz7w1rlz7YY0jGr1WHwB6YKAk6EGxQqMF/krj03Z96eaf3ZAJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3232.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 05:04:09 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:04:08 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [PATCH v1 2/4] media: chips-media: wave5: Add support for background detection
Date: Tue, 24 Mar 2026 14:03:58 +0900
Message-Id: <20260324050400.218-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3232:EE_
X-MS-Office365-Filtering-Correlation-Id: 9979eb22-d494-4e4f-27a0-08de8962c7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kcl9FUlhlZv5PkDVF3HCR5HJE06AkZ3RsHPmB5BbT6qNKppYx2sms8OcOpFsZhpgE8jA9eAtQtAP3JLib0VN27rTdrMFPmc7dx6tv6Eka8n+wcVTRfQmoLjpKRe/2mfnA0mQ5e2jAj0kn/t/gkWwrAcPiudg0V8DOrIy2qTZrZ3r9XUo0ts94MAPOmAJc/gRRc9046V28v0oyLgiCd39vJtMbB77dml6zLusrS+MVTeBYGu7H+SQLGzxwiP4TC7FAOtmv0ikOElwnEw98rgwZ8SXI4jISOhD578WtsWN1WPGDzkk4dlpip9CjIlo2J78Q9XvJDo1yNutDOOMntyrYDkyxk4bVDkT8iON4xBbdjnMMyqx59yKhEoAzsvazMopmmfl7sxmuU9lUbtEtvS3i/kZmcKThunJA2TLQNGtNuPJos88CrRCmjAmBYLfOkOdWunHmB+TpBjJ1Zw7BSYBoIkaKBqLXBOh/as8am0CRU+/FGuu81dQgxlpne43CsDUkE82GGasKpj+Vv4TF+QpZoMNWIfmHwGKvfzd4pn9h5PFKGIZnEBrpv8nY5UfQxuqCN5bnHIoPtb2hZO2qdp9Cd8CTYMsF69uywV1pEEFRT/K9Gio7M9C/WmaEBKuYp3UXvko1BVE9+zzMLqmpkEqlIbdn8VoR81acuMQgR6u2ao/+Mv8+el4QH+aFyrs1Nlc/RPjjuf7ZWZgB0XLgtAP0LwpgzIVX3C6yXMLuRiP2UXmhz9ICDGzPdDZReUHuo4aGqHgLwB17NNJhv4O9nMsybtNCbP3Jeno+LXERGSGLoQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lc7vm7W/MW2IJhZ55hOl7xCE9aoLWrJIbmSPGyp9umvXPLAMt/64tN8OYeJ7?=
 =?us-ascii?Q?utIM+qLjA6iwm6TyxWzq/cz4aUFp2H/3onRo4pIE5um8bksmHcxsYNiTw9d7?=
 =?us-ascii?Q?vb4F9x3r2HEBPTi1c+8bQbD3yZa0ubCYhgQv5hhl95yhDA8mhl/m1LozT982?=
 =?us-ascii?Q?6jxNmw1iUrcYLMVIIFAlt2ylYJKh4Zc1E2muC7RPUBEw6WOZIAT9R4TmPmaH?=
 =?us-ascii?Q?hSBG6kpLlPuJniI2T9zV9/NPggnuGI3kFIribnCfsIdfz2GeEOoPfi/KV2sb?=
 =?us-ascii?Q?0bJmNXUgK3QBQD6yt3V4TwoddbNYFOxQmkJ3ACw2sbxRz3s9XSx6e8L/sxza?=
 =?us-ascii?Q?35xC2kKVPzJ1QPwDCpyvuC+H85a1HHITJCwFIZDBCSs/wlA5HgOyGPatnUm2?=
 =?us-ascii?Q?16PHwvXPrzo4lFUOdeq8J5MTiEwerZ25l5ShFnY/09k0l5udpEfb5nQGnRYa?=
 =?us-ascii?Q?yU428YOlV6ZKaosPpfg2a+QwVygUy+GjEchRqnUHQBO3+7HOgunPx9nB8b88?=
 =?us-ascii?Q?2hg55rOjoKY5svqjrEgRcYfIigAX7krVD4tksGedxut1ORQedinKg28F0ZO5?=
 =?us-ascii?Q?0LY9jjNQwVo7GPpMIpeOfiWPxhNzyZxgwyNbYPOEJfBUaW2E5hlYpiADQb37?=
 =?us-ascii?Q?jC1/mo0K2IhUK7c6YrQOjeO9bUqw6p2FTJa6kGQTelXS4ksXcPIHj0AN13sb?=
 =?us-ascii?Q?PMMz9aAtoOyPANy78thxgkTkaUkIpevjV8u2hsRS0/l+u48kSjiY4rSkJ5md?=
 =?us-ascii?Q?dm7QH0u1nSIjyByUZVSUXYbuGTIMiQ2ArsVGuBxodqjMSnHgnGGt0/d1sQvJ?=
 =?us-ascii?Q?KMIa7jb125Dq5v1spoie6mSmQxb2kGRRj4GEnsoKsZvWn0esRyBOkBuGxxHR?=
 =?us-ascii?Q?/fkWJVGGdZlxp5qGhRtAK3zkEa/uR7JepGF5abgZSFhz1n++X6tq+P9FTIFT?=
 =?us-ascii?Q?dp5/r80xmsHxns7p/pUTA3/RQJYUiEk4Y5Qkzxwi+cgk9r8lvuyvOCpbdFED?=
 =?us-ascii?Q?GnfA46mtw0MEflZcMIEjfIoRd6NV4k6d74z+azgnsvDPDP0Grqa2HiU6LNxO?=
 =?us-ascii?Q?cKC/MK3wF3JerJ+6eQwK6t+PGZRAob2e7g2VMA1WTjWZ6v5AwlKx0erNuZOD?=
 =?us-ascii?Q?zBqyjf9dob6hJV/W7A9EpFfL2K5iMbdNvmwvKG1SSgxangQWc+MSjgfN+CEo?=
 =?us-ascii?Q?zOsffY4QpKu1PMKG+UDfMYX/hJVXvujteExml8IJsTbqZGu/9Wzeh5zxgAKV?=
 =?us-ascii?Q?mH7P/A/rKp6oKt68eraQ1vttFfMmPVt4OVQPTyruX6CHpfWqx2a0UqHOs8qV?=
 =?us-ascii?Q?rx+dVTtviGc7otn9OKIbFTMDFV1YbTwgaucXWKIs3Uoby//4MV9B4KfAh8Kk?=
 =?us-ascii?Q?4bPDrnqlSQLTqi1Rbr+YOw8Il9UJOp0+8zUvojgz5RmMYwrrnKpseR5k3q05?=
 =?us-ascii?Q?Iq5QqLDFD1DEPKb081lf3M9GauY7XGYhyoi1hdUcIakRrA8n393c2JdjQrip?=
 =?us-ascii?Q?NFgq8CTDjsfGuXGTjS9tjEUZ7Nigp0tf3oGdVkNnFQfWAMLZ/MKGxFjdjJoB?=
 =?us-ascii?Q?1pT5o/C3tAhYmO9hP+uuyvqnGo0P5mHT4wBPF1onABRW10u5rsJiJUPGzZ32?=
 =?us-ascii?Q?ylBIwofUXFhFCuwILPJ1FJYGh3MTdt5QFeomDmvS0oF+N55rlQCk8FHLi9nJ?=
 =?us-ascii?Q?hbhc5P08lgLsnJ7cDW504core3FRVaZDQ8/ZuNOTEacEdAmaMEWDob4oM6Ea?=
 =?us-ascii?Q?hTUGwok8JQKJ9ngbdmdgpGLjGNShOxI=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9979eb22-d494-4e4f-27a0-08de8962c7fb
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:04:08.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNCuBKQfAzb8Ldifp1oRWIG6rkUmem2753MfCflHatakxWiModBGOsF6jXg/Oa1H9npb0EMgZMBSDFWFzsC2haAGNPOWyxI+JbYOTxLZ1y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3232
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56802-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C83E302214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Implement V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION in the Wave5 encoder
driver. When enabled, the hardware detects background regions in a frame
and uses fewer bits or skip mode to encode them, reducing bitrate for
streams with stationary scenes.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c      | 4 +++-
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 7 +++++++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h  | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 687ce6ccf3ae..c516d125f553 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -49,6 +49,7 @@
 
 #define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
 #define SEQ_PARAM_PROFILE_MASK		GENMASK(30, 24)
+#define SEQ_BG_PARAM_REG_DATA		0x3800410
 
 static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32 reg_fail_reason,
 				 const char *func);
@@ -1838,7 +1839,8 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_RC_BIT_RATIO_LAYER_4_7, 0);
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_ROT_PARAM, rot_mir_mode);
 
-	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM, 0);
+	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM,
+		      SEQ_BG_PARAM_REG_DATA | p_param->bg_detection);
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CUSTOM_LAMBDA_ADDR, 0);
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CONF_WIN_TOP_BOT,
 		      p_param->conf_win_bot << 16 | p_param->conf_win_top);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 7613fcdbafed..6fe01217233f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -780,6 +780,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		inst->bit_rate = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
+		inst->enc_param.bg_detection = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		inst->enc_param.avc_idr_period = ctrl->val;
 		break;
@@ -1205,6 +1208,7 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 	open_param->wave_param.beta_offset_div2 = input.beta_offset_div2;
 	open_param->wave_param.decoding_refresh_type = input.decoding_refresh_type;
 	open_param->wave_param.intra_period = input.intra_period;
+	open_param->wave_param.bg_detection = input.bg_detection;
 	if (inst->std == W_HEVC_ENC) {
 		if (input.intra_period == 0) {
 			open_param->wave_param.decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
@@ -1700,6 +1704,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
 			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION,
+			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_HFLIP,
 			  0, 1, 1, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index c64135769869..dc31689e0d27 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -570,6 +570,7 @@ struct enc_wave_param {
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
 	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
+	u32 bg_detection: 1; /* enable background detection */
 };
 
 struct enc_open_param {
-- 
2.43.0


