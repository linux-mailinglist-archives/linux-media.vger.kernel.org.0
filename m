Return-Path: <linux-media+bounces-22851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EB9E8B17
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100BF18851AB
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 05:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C861C2324;
	Mon,  9 Dec 2024 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dqW9qkPL"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021102.outbound.protection.outlook.com [40.107.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C691C5492;
	Mon,  9 Dec 2024 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722636; cv=fail; b=VPa5tS3xj9ChjvrQio5rUaQf2DhsFOaZT5/dVFSP0RzmLQga/H4o/dlme2/1y9L5YHTJoaub0kRpFDem7rMfwpTfzxyw6KLN7VnaKR8IlaxA5IdQCoLGfsDwH6WFd+3gtruUKu376j8w4r/aqW5RZq3XDATt93xEuJALyuzrih4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722636; c=relaxed/simple;
	bh=5XnS8ZG1IZzAUxMyN9PZ2JGgUjkM1hRT8fmum5bFlsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bip9Um7JuczBzBsHH5FvXv/sZ8+JH7JNwl/1FSFLhckKlg4vxEiBjH8ve8q1OT5HCjTSk11n6bPDmjpDmPZvcO8qu7zOML8ZnNw6hAkkQPfS+cdXqXbqaseMEK3TdD/ex1Ot6AdrQgNy7v/l9O7N82NZBh8TB31Oe49iZ6tvZ6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dqW9qkPL; arc=fail smtp.client-ip=40.107.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSQvA7wT88AY79RKC6Rop2lTC/UdhOWaanQVNHyEQxXD+QzQ8sVxFCrzjbJ7OmqklWRmBYLtA2c6DbeRDBLgzessn9zSkjWh4nbcH645DN4En0B94riXL7LdLJGZxealA1C6ZANLLO/qgylL8A32IpLe96tWtnGWtbR6sCDd0FAzC4AoOOLrZalwG/TSQ9aCKhUPKYn8QLV1rwGoLLFWGO8lHHAEBHd9a/zHH6waX9+gUoJMzzrCZE1NoSL5nYrTfEAjr0H5HKaEZahZ0hslgeZYovv+TYof9BIN6ctG4lV6FgyBnP7XqN4QEdjxGmjMztOvbY54I4UNMEu4O8SP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0yVgbdsH/fmOUFrxA+03xWS7dgjD7Qmm0XQHVFwphQ=;
 b=UAjb/YJG8vTvslou6CmEQGatPYVd99H5SeApNjv2soJ8O723q2uJ7rtCu0t8AmggD2GuIrSI+4hwMw2/OqDeK1IUS1vq7NRR38lZiVtXh5V9ZvJuInDtqdpbt6NtF+6F2nxvjMnyfoOh36h30YRGJ3H2xu7DgGfpQtcJgyq9QYvj8Um8P8EnA68tGEwAQGN1j613E3ran50a4wpxYZn1RU3U5BJVtgSV3Q8c/C89g1xqJ1IIHHQ064kCnKSf/7wekR2x2LZnktksHS6ObZnmR5SrmHJphxXP0XdhT5ZZgDXcaVpsnJ7mOzHoMSURLl4YSPhHaQCWvEYhZ4VtQZ0ZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0yVgbdsH/fmOUFrxA+03xWS7dgjD7Qmm0XQHVFwphQ=;
 b=dqW9qkPLW6fkhp/QszMFprhC3+++c36BHfTDUkqu2AffaW8aIPNu65bqGgN+OUEmzXMvIgRgpKI+LQ1Pm7v6JSViQD2R+3ndy/AozRlmklQaBxaK7Sjxux2Y4AgG2lOvZPldkUmdZUiwGKDiV6PfNW/77opyoROaOz8FhZGQZQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1966.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f9::13) with Microsoft
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
Subject: [PATCH v1 3/5] media: chips-media: wave5: Improve performance of decoder
Date: Mon,  9 Dec 2024 14:36:52 +0900
Message-Id: <20241209053654.52-4-jackson.lee@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4a8d8b-7ab1-45fb-fe69-08dd181383a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GioQWGHCJW9SXcbUW+x8TL2ZI/yXY8TuDOVdIAW3VdNE2h72eOboDWby2E9p?=
 =?us-ascii?Q?6WNAcV4j9uolG7c6/FdvUf3EPnF7iS9IJ3KZB5Bay5ugevtfVShSzDn+Tawo?=
 =?us-ascii?Q?2xXVvlIbXhkxcDE7vgTP0rxsh8jPBemEzkWScyfUBiVDYosqkbF+xi2kWKLa?=
 =?us-ascii?Q?2AupRG/sEVjd7i7qyWCTAolhYGfIunZQJTzNsPnJsZk/5tgqwnlzd5PWN58h?=
 =?us-ascii?Q?bhKxTCzIwQOX4c9jOBn2w7boGpvc893cBHNIe+jQxHIkHvctnXnLIur4xdXE?=
 =?us-ascii?Q?A5MPJ9QAIiDN50kKBNmIw5e/zm0Ms1mcwpvRQqELDXQumS1kwZTxJPyeCoZt?=
 =?us-ascii?Q?nYQ5GH5sPorrg3niJ+61iWGK6clEi4icEwXq3oLUAjUYp8wLC/FZTn0Bwe/R?=
 =?us-ascii?Q?nL97OzRTxwwDdyBHEIXUeQN01OdwDx4Bs/bGjDFqq4E6T4p/fxpkvKEFMw6Y?=
 =?us-ascii?Q?PKR75tfvFNEAhIbNDeqdl8as1ljlcpci0TtLr3O4B/YMQwq919q8nc017tPl?=
 =?us-ascii?Q?j+clGwvPuW98MggI6mi3ro8OYuMFDNeC8qHiTJZ36ncgr7V5s2XDXZwsc83a?=
 =?us-ascii?Q?ZK0xclPwsRCZSr/a6Mm+BeOuUWDqQLuEVVFBlpwHN2JskdK6MhvxB1zhqcl4?=
 =?us-ascii?Q?nl4sTGPtTxe9RTA0SFxA4eZJqEyT793Ya8G3zvgjt1ejVuakwgljE97HgUTp?=
 =?us-ascii?Q?wc1k2M0Lq0rlWx8hEPOgiPRkxP0E4LV2ROkuFxMOCaP8rEThTzF3zbSVnSwz?=
 =?us-ascii?Q?+q2AACkKE4KW7xxKPvh9h8YC4f0E+Jbosnwu5b16cBx8vqZ//EIqH6wtGHTd?=
 =?us-ascii?Q?56n4kyfRAGttejxbXG0Kfe1ZiKy3uZMnDqG5DklF1cJvRjJoZXvhI1kq/2RK?=
 =?us-ascii?Q?gsFvxvyre6vLS/hwqABt51Duo4vgPEe4GFB++5o+m6ko091izOPKz4Ue1dqw?=
 =?us-ascii?Q?Q+UF518rz1+/7ek+fDXkIgoYtob6obMdU3EhEs2JNNqE33YvxuKo28Ppc83Y?=
 =?us-ascii?Q?T0Mm7v0FENlJg9XGswO3nUYOnnohQZ/qfyGzTymn57Q7F+HrkrwUMbrw/mK1?=
 =?us-ascii?Q?8lUyFJK6XGWHYjXKi/JUmLq/+qIpJ1wWon/It3j1ek6ekzOWR9ruJlOjj8xc?=
 =?us-ascii?Q?s4Ux2SDwGKhmUUcfI+41PZ3I4naaw9zU04iP7NsId8XYItfR6754lUko1N8m?=
 =?us-ascii?Q?2u3PjLf5KtT3wmYhdtiHN2J07TftJRJizkDDp64VIPi64UJ/YCdHrDMty5cK?=
 =?us-ascii?Q?4IxNToLwQOnA4c5vnkcaj0N023XrPF9KQFVZ+y8v6D5/OdwcRVqZBNDu0Al0?=
 =?us-ascii?Q?lLiQPeURUbsR+Mp0aocnq6uIMY6KWTStcUACJYrzukBCPIhogFfv2sU9ctkV?=
 =?us-ascii?Q?nsU6dOD9FQcg5MYYmrXRpwxpqRIFrTYC0IjvlJNLGdVBgBPO7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+w8nYaTfVP+p1KiZ2Xg/ovAuB/UQ4+qZTQjTfLzaIYmk8+wQKL45VNk4LGRJ?=
 =?us-ascii?Q?xMlghd5eldqNghSp7R5Ne98nBH8vNuJ3ICpRbAZUI8vgw8mf5gDlCd/SfsdN?=
 =?us-ascii?Q?l9vOQOMHzpBTVOJMNApqnwzlPMAlhf1XmsebZFmoShnPZ2E/Qw3au6JMtFoZ?=
 =?us-ascii?Q?M5r3/XxY4URlRU8LG+JT4A4aCPaKrXfcssa7laKrI8DexXnR/dDJSEI8MJsP?=
 =?us-ascii?Q?J34BWOmULW/XMEUnDW1zyy/lLGmL9PKEp+BX0Gb3nyMJlfA73B6q4ptl3Bau?=
 =?us-ascii?Q?PirKI4ieJqC9VXHtN68ReHlzgsSYcuQuMrhj8SgP3/ZHQqdNNQGwkwkJ1mY6?=
 =?us-ascii?Q?hE/zjq2/snAZtk25vYkmmNqPokldIgl4Jsi521t2KE/mBgHqK0lMOv2o0VcC?=
 =?us-ascii?Q?VxHFEo8l1ZpdNBhcC3WlHokz2FtTWKzf+iPVr8nqVM75TdmSEKUSk0zVSnYj?=
 =?us-ascii?Q?uKz6jIbd+CDIWbcZdFgZC4kZGPah1rAh5A9VPJtVVUKGadvQwsKip2VV8ePl?=
 =?us-ascii?Q?x9EcCZRRD/LD3Dt/1yDcI09iZVg8hbinNwt/b2pEc9nl/RISR63l8E8zfbb2?=
 =?us-ascii?Q?sVmFnlH4GAIF5Jh8I1yygDhD02O7dewhPyU7MZCelHzV2m4421LAsL6ux412?=
 =?us-ascii?Q?09yh8It7VJkae8TC7RJXd7z8kbtIVLGCSSrwyQhWx8jGi7o3fj89WvsxQQAr?=
 =?us-ascii?Q?u2qeS3zHqRUdBrdQdFl9PIKTVZd8korJhgbTATwxTcsExMZr1cEx9GpavlPg?=
 =?us-ascii?Q?J8HpjsDo/6gRcLSCNbwYpCom6BT1yGmlgaolFTxYP7AUtplat8GYLi6VKgy0?=
 =?us-ascii?Q?PIE0e5NUekicFzJLZUcqjTe96iCOaEq/uoepV2M3iIJvmEeYes2F/znabh/e?=
 =?us-ascii?Q?CUgGlfeEJVUsSJaDJYJvE63ktTnj5676V5Ysi8miVaZx92wHoP5YBtYjpj4o?=
 =?us-ascii?Q?RWVzaOxAqqpSzaDTa2nTraQ7XvoKjoci6xRy9C0aQd0wo2/819iphfb/Le+1?=
 =?us-ascii?Q?Im4eMioOFVEo9o+8E333Xa/MOw/uvEFpjZjebA3gRYvGuuOXqbdGwjtLNvxH?=
 =?us-ascii?Q?4qhcSv7zsfHXS2XmrxvyJFazfSheOoXlVXyePX2kp6XEVDqMdvrphXo8Stms?=
 =?us-ascii?Q?Xb3J3fbS/JZ/PujFLXEcYTl0In8iTywNYJ0U7Z44eERc6euLTeYkC6lcYTy7?=
 =?us-ascii?Q?YRIpC/PsFdnG/eXc+jV3jAfA3cMhFqYEZnegu6behrFhqFd/BFU2qctgEF6Y?=
 =?us-ascii?Q?fS6VFZji0Hk3KA/cskWxps6PlGWFyPmdtF5arzttJWD3Qg1hNfXZel61P9Wk?=
 =?us-ascii?Q?XjBkCbhachX3szFE3Yc2QN8iRO1SmfQn7sKYp4YzWE23uq8vQeuxgFwvJhZS?=
 =?us-ascii?Q?W0I26lpbupGZvynTU9XPmHHJkqPf1kG7+8Ie/tGSnPHCHI+TOd98LZaR79XA?=
 =?us-ascii?Q?ElFK+NbhXslg2bq3s0qVy/Z3MwCTUDwro6RClTkqXcePPoCfenCnBeqJ7ToD?=
 =?us-ascii?Q?7Vr84AgqJnMf0y1b6yY1KjTGqjphoDCu5KTj2/oOplfikDD53M2Myuhw5DJk?=
 =?us-ascii?Q?SA6VY3s+P0VBpTbxY6LySMMB+iCNACeFN4tE+dfpa5rgq09/uUT0bKbrNI54?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4a8d8b-7ab1-45fb-fe69-08dd181383a8
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:37:05.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GN4Zz0V6V0l+sFkc13intqfU2Ab8Q8N+3MUM2Hdzn1DEsh5y3+JZQKWrI19PonpoHe6KTMrwkHQ+Zx/13t5LsBu38tSfLHEMH9uU+v3wwLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1966

The existing way for decoding frames was to wait until each frame was
decoded after feeding a bitstream. As a result, performance was low
and Wave5 could not achieve max pixel processing rate.

Update driver to use an asynchronous approach for decoding and feeding a
bitstream in order to achieve full capabilities of the device.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |  20 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 400 +++++++++++-------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  73 +++-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  24 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  15 +-
 6 files changed, 355 insertions(+), 185 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 2c9d8cbca6e4..83f30ad36e4f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -30,7 +30,6 @@ const char *state_to_str(enum vpu_instance_state state)
 void wave5_cleanup_instance(struct vpu_instance *inst)
 {
 	int i;
-
 	/*
 	 * For Wave515 SRAM memory is allocated at
 	 * wave5_vpu_dec_register_device() and freed at
@@ -49,7 +48,9 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
 		v4l2_fh_del(&inst->v4l2_fh);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+
+	kfifo_free(&inst->irq_status);
+	mutex_destroy(&inst->feed_lock);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +62,22 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
 	int ret = 0;
+	unsigned long flags;
+
+	if (inst->run_thread) {
+		kthread_stop(inst->run_thread);
+		up(&inst->run_sem);
+		inst->run_thread = NULL;
+	}
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
+	if (ret)
+		return ret;
+	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
+	list_del_init(&inst->list);
+	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
+	mutex_unlock(&inst->dev->irq_lock);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
@@ -79,7 +94,6 @@ int wave5_vpu_release_device(struct file *filp,
 	}
 
 	wave5_cleanup_instance(inst);
-
 	return ret;
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index d3ff420c52ce..b0e1f94bdb30 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -6,6 +6,9 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <linux/timer.h>
+#include <linux/atomic.h>
 #include "wave5-helper.h"
 
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
@@ -101,6 +104,24 @@ static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	}
 };
 
+static int run_thread(void *data)
+{
+	struct vpu_instance *inst = (struct vpu_instance *)data;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&inst->run_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	}
+
+	return 0;
+}
+
 /*
  * Make sure that the state switch is allowed and add logging for debugging
  * purposes
@@ -230,7 +251,6 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 		switch_state(inst, VPU_INST_STATE_STOP);
 
 		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 
 	return ret;
@@ -347,7 +367,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
@@ -360,11 +379,22 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 
 	dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &dec_info.rd_ptr,
 		&dec_info.wr_ptr);
-	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
 
 	dev_dbg(inst->dev->dev, "%s: dec_info dec_idx %i disp_idx %i", __func__,
 		dec_info.index_frame_decoded, dec_info.index_frame_display);
 
+	if (inst->std == W_AVC_DEC &&
+	    dec_info.index_frame_decoded == DECODED_IDX_FLAG_SKIP &&
+	    dec_info.index_frame_display == DISPLAY_IDX_FLAG_NO_FB) {
+		struct vb2_v4l2_buffer *src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
+
+		if (src_buf)
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
+
 	if (!vb2_is_streaming(dst_vq)) {
 		dev_dbg(inst->dev->dev, "%s: capture is not streaming..", __func__);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
@@ -441,20 +471,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		}
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
-
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_mark_last_busy(inst->dev->dev);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
-	}
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -465,6 +481,142 @@ static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capab
 	return 0;
 }
 
+static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
+			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
+{
+	size_t size;
+	size_t offset = wr_ptr - ring_buffer->daddr;
+	int ret;
+
+	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
+		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
+		if (ret < 0)
+			return ret;
+
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
+					     buffer_size - size);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
+					     buffer_size);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fill_ringbuffer(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
+
+	if (m2m_ctx->last_src_buf)  {
+		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "last src buffer already written\n");
+			return 0;
+		}
+	}
+
+	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
+		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
+		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
+		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+		dma_addr_t rd_ptr = 0;
+		dma_addr_t wr_ptr = 0;
+		size_t remain_size = 0;
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
+				vbuf->vb2_buf.index);
+			continue;
+		}
+
+		if (!src_buf) {
+			dev_dbg(inst->dev->dev,
+				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
+				__func__, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
+		if (ret) {
+			/* Unable to acquire the mutex */
+			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
+				ret);
+			return ret;
+		}
+
+		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
+
+		if (remain_size < src_size) {
+			dev_dbg(inst->dev->dev,
+				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
+				__func__, remain_size, src_size, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
+		if (ret) {
+			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
+				vbuf->vb2_buf.index, ret);
+			return ret;
+		}
+
+		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
+		if (ret) {
+			dev_dbg(inst->dev->dev,
+				"update_bitstream_buffer fail: %d for src buf (%u)\n",
+				ret, vbuf->vb2_buf.index);
+			break;
+		}
+
+		vpu_buf->consumed = true;
+
+		/* Don't write buffers passed the last one while draining. */
+		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
+			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
+			break;
+		}
+
+		inst->queuing_num++;
+		list_del_init(&vpu_buf->list);
+		break;
+	}
+
+	return ret;
+}
+
+static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
+{
+	int ret = 0;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	u32 fail_res = 0;
+
+	mutex_lock(&inst->feed_lock);
+	ret = fill_ringbuffer(inst);
+	mutex_unlock(&inst->feed_lock);
+	if (ret) {
+		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+		return;
+	}
+
+	ret = start_decode(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev,
+			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
+			m2m_ctx, ret, fail_res);
+	}
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+}
+
 static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
 {
 	const struct vpu_format *vpu_fmt;
@@ -794,11 +946,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
 	}
 
 	if (inst->state != VPU_INST_STATE_NONE) {
+		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_src_buffer *vpu_buf;
+
 		/*
 		 * Temporarily release the state_spinlock so that subsequent
 		 * calls do not block on a mutex while inside this spinlock.
 		 */
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
+		if (vbuf) {
+			vpu_buf = wave5_to_vpu_src_buf(vbuf);
+			if (!vpu_buf->consumed)
+				wave5_vpu_dec_feed_remaining(inst);
+		}
+
 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 		if (ret)
 			return ret;
@@ -1116,115 +1278,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
 	return 0;
 }
 
-static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
-			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
-{
-	size_t size;
-	size_t offset = wr_ptr - ring_buffer->daddr;
-	int ret;
-
-	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
-		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
-		if (ret < 0)
-			return ret;
-
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
-					     buffer_size - size);
-		if (ret < 0)
-			return ret;
-	} else {
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
-					     buffer_size);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int fill_ringbuffer(struct vpu_instance *inst)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
-
-	if (m2m_ctx->last_src_buf)  {
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "last src buffer already written\n");
-			return 0;
-		}
-	}
-
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
-		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
-		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
-		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
-		dma_addr_t rd_ptr = 0;
-		dma_addr_t wr_ptr = 0;
-		size_t remain_size = 0;
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
-				vbuf->vb2_buf.index);
-			continue;
-		}
-
-		if (!src_buf) {
-			dev_dbg(inst->dev->dev,
-				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
-				__func__, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
-		if (ret) {
-			/* Unable to acquire the mutex */
-			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
-				ret);
-			return ret;
-		}
-
-		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
-
-		if (remain_size < src_size) {
-			dev_dbg(inst->dev->dev,
-				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
-				__func__, remain_size, src_size, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
-		if (ret) {
-			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
-				vbuf->vb2_buf.index, ret);
-			return ret;
-		}
-
-		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
-		if (ret) {
-			dev_dbg(inst->dev->dev,
-				"update_bitstream_buffer fail: %d for src buf (%u)\n",
-				ret, vbuf->vb2_buf.index);
-			break;
-		}
-
-		vpu_buf->consumed = true;
-
-		/* Don't write buffers passed the last one while draining. */
-		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
-			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
-			break;
-		}
-	}
-
-	return 0;
-}
-
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
@@ -1236,6 +1289,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	vbuf->sequence = inst->queued_src_buf_num++;
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	INIT_LIST_HEAD(&vpu_buf->list);
+	mutex_lock(&inst->feed_lock);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 }
 
 static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
@@ -1287,10 +1345,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (inst->empty_queue)
+			inst->empty_queue = false;
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1369,6 +1430,13 @@ static int streamoff_output(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 	dma_addr_t new_rd_ptr;
+	struct vpu_src_buffer *vpu_buf, *tmp;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+
+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
+		list_del_init(&vpu_buf->list);
 
 	while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx))) {
 		dev_dbg(inst->dev->dev, "%s: (Multiplanar) buf type %4u | index %4u\n",
@@ -1445,6 +1513,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
+	inst->empty_queue = false;
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1452,16 +1521,13 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
+		    q_status.report_queue_count == 0)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
 			dev_dbg(inst->dev->dev, "Getting decoding results from fw, fail\n");
 	}
-
 	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -1548,13 +1614,24 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
-	ret = fill_ringbuffer(inst);
-	if (ret) {
-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
-		goto finish_job_and_return;
+	if (!inst->retry) {
+		mutex_lock(&inst->feed_lock);
+		ret = fill_ringbuffer(inst);
+		mutex_unlock(&inst->feed_lock);
+		if (ret < 0) {
+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+			goto finish_job_and_return;
+		} else if (!inst->eos &&
+			   inst->queuing_num == 0 &&
+			   inst->state == VPU_INST_STATE_PIC_RUN) {
+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1590,7 +1667,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
@@ -1605,12 +1684,14 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
 		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 			return;
 		}
 
@@ -1621,21 +1702,27 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
 		}
 		/* Return so that we leave this job active */
-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-		return;
-	default:
-		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+		} else {
+			inst->retry = false;
+			if (!inst->eos)
+				inst->queuing_num--;
+		}
 		break;
+	default:
+		if (!v4l2_m2m_has_stopped(m2m_ctx))
+			WARN(1, "Execution of a job in state %s illegal.\n",
+			     state_to_str(inst->state));
+		return;
 	}
 
 finish_job_and_return:
+	up(&inst->run_sem);
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
-	pm_runtime_mark_last_busy(inst->dev->dev);
-	pm_runtime_put_autosuspend(inst->dev->dev);
-	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static void wave5_vpu_dec_job_abort(void *priv)
@@ -1647,10 +1734,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		return;
 
-	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
-	if (ret)
-		dev_warn(inst->dev->dev,
-			 "Setting EOS for the bitstream, fail: %d\n", ret);
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1686,7 +1770,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
@@ -1726,6 +1811,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
@@ -1782,6 +1869,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
@@ -1797,13 +1889,13 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (inst->dev->product_code != WAVE515_CODE)
 		wave5_vdi_allocate_sram(inst->dev);
 
+	sema_init(&inst->run_sem, 1);
+	inst->run_thread = kthread_run(run_thread, inst, "run thread");
+
 	ret = mutex_lock_interruptible(&dev->dev_lock);
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1e5fc5f8b856..7f1aa392805f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
@@ -1774,9 +1779,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 63a607d10433..e1e4be482d36 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,17 +51,24 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	u32 irq_subreason;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
+	int val;
+	unsigned long flags;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
 	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
 	cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
+
+	if (dev->irq < 0 && cmd_done > 0)
+		wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST, 0);
+
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
-
+	spin_lock_irqsave(&dev->irq_spinlock, flags);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
 			if (dev->product_code == WAVE515_CODE &&
@@ -82,14 +89,22 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
-				inst->ops->finish_process(inst);
+				if (dev->irq >= 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				}
+				val = BIT(INT_WAVE5_DEC_PIC);
+				kfifo_in(&inst->irq_status, &val, sizeof(int));
 			}
 		}
-
-		wave5_vpu_clear_interrupt(inst, irq_reason);
 	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	up(&dev->irq_sem);
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
@@ -121,6 +136,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static int irq_thread(void *data)
+{
+	struct vpu_device *dev = (struct vpu_device *)data;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&dev->irq_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		mutex_lock(&dev->irq_lock);
+		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+			while (kfifo_len(&inst->irq_status)) {
+				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+				if (!ret)
+					break;
+
+				inst->ops->finish_process(inst);
+			}
+		}
+		mutex_unlock(&dev->irq_lock);
+	}
+
+	return 0;
+}
+
 static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 				   u32 *revision)
 {
@@ -224,6 +268,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,6 +312,9 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
 
+	sema_init(&dev->irq_sem, 1);
+	INIT_LIST_HEAD(&dev->instances);
+	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
@@ -288,7 +337,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -351,6 +399,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 {
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
+	if (dev->irq_thread) {
+		kthread_stop(dev->irq_thread);
+		up(&dev->irq_sem);
+		dev->irq_thread = NULL;
+	}
+
 	if (dev->irq < 0) {
 		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
@@ -361,6 +415,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e16b990041c2..9a28d0f770bc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -197,8 +197,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -223,6 +221,16 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
 			ret = -ETIMEDOUT;
 			goto unlock_and_return;
+		} else if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING) {
+			struct dec_output_info dec_info;
+
+			mutex_unlock(&vpu_dev->hw_lock);
+			wave5_vpu_dec_get_output_info(inst, &dec_info);
+			ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
+			if (ret) {
+				pm_runtime_put_sync(inst->dev->dev);
+				return ret;
+			}
 		}
 	} while (ret != 0);
 
@@ -240,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -710,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -755,11 +756,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..d26590141562 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -8,6 +8,7 @@
 #ifndef VPUAPI_H_INCLUDED
 #define VPUAPI_H_INCLUDED
 
+#include <linux/kfifo.h>
 #include <linux/idr.h>
 #include <linux/genalloc.h>
 #include <media/v4l2-device.h>
@@ -163,7 +164,7 @@ enum set_param_option {
 
 #define BUFFER_MARGIN				4096
 
-#define MAX_FIRMWARE_CALL_RETRY			10
+#define MAX_FIRMWARE_CALL_RETRY			30
 
 #define VDI_LITTLE_ENDIAN	0x0
 
@@ -747,6 +748,7 @@ struct vpu_device {
 	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
 	struct mutex hw_lock; /* lock hw configurations */
+	struct mutex irq_lock;
 	int irq;
 	enum product_id product;
 	struct vpu_attr attr;
@@ -764,7 +766,10 @@ struct vpu_device {
 	struct kthread_worker *worker;
 	int vpu_poll_interval;
 	int num_clks;
+	struct task_struct *irq_thread;
+	struct semaphore irq_sem;
 	struct reset_control *resets;
+	spinlock_t irq_spinlock; /* protect instances list */
 };
 
 struct vpu_instance;
@@ -787,7 +792,7 @@ struct vpu_instance {
 	enum v4l2_xfer_func xfer_func;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
-
+	struct kfifo irq_status;
 	enum vpu_instance_state state;
 	enum vpu_instance_type type;
 	const struct vpu_instance_ops *ops;
@@ -812,11 +817,17 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool retry;
+	bool empty_queue;
+	int queuing_num;
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
 	bool needs_reallocation;
 
+	struct semaphore run_sem;
+	struct task_struct *run_thread;
 	unsigned int min_src_buf_count;
 	unsigned int rot_angle;
 	unsigned int mirror_direction;
-- 
2.43.0


