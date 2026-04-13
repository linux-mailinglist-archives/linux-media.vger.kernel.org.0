Return-Path: <linux-media+bounces-58673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAJ9BgYV3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:08:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 929163EE5CC
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F6B8304F7DB
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD842853EE;
	Mon, 13 Apr 2026 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QoGmbKC+"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD62773F7;
	Mon, 13 Apr 2026 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096282; cv=fail; b=A8yGU+2ie5sHhmaLKMYQKre+JaMDlOw+QRrZ402zXHelWmBKIp5G1WRa7+lMKYmSeGzd/1GyMYwLgEI+RDqtWH1Hs1kMZgLXidHkgG0g8spWEyEdbxJlGv3dIDw+J+Wfdp7RMD871PFaU4YHl8Qz2f9crWRlFEx2bqVqV4oAI5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096282; c=relaxed/simple;
	bh=1PGM7nXGJxj6nQoqHtk7qUU64d4Y8lDTNHyZ/pK4n+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eaWoCCDjp53zYxwd5u71lMhcHJc419aiKbcKWRnc/7xjG2IAUCPmtt7xNuOTMZq8/d2Vkvx1czGi4nYEd9riCBAd0f3+7gbSXC2ik/PtIeZFHRmypBm1prZ7vkhDHoozM3l83EzfJyhLsln5LXcQ7HVNo7WI2gT4ZxWTlUeCFdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QoGmbKC+; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NySK2CNq9nF2D9L8kQJ504vTkSBLRa6v5xaVe4oykYEjUQnbY4OQXscSGWVnFWo2+QXT5ji7fixkTGIgBgBoJC3kKYVqXAvONmMX92oaAXHumtVvO00ahIAMDSPnxFvKBKNMli4RoVvhR/pYVfR+A3AlsIPbwbBLQ/uzBWAwBziXUJ1sWc0DBCDOPVnFBJpq5hHTdyf9FewewzhQM5fUw/BSI3PZ7SiGGXjrwOWBt8z6sUJNf7AZLUi5Ngwk23HU+6tjJGfj9Jv/mDbnSjtkMEipqv/tICYC5cUudFrvwhnoccEmr5wh+KazwWb/AxCYB+vE7FuozVVYRqq85omPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcrT+ny4fH1/ZVfipGz0xgcFBD/YwUVyhGAVpaC/KtY=;
 b=Xox31Jl22H3hh/sogg2AZxolTAO+gp0LMfSoyvHNUDq9oLJaQqf5rzMZVygPCP7GByiii8Ah9+6zXTn6fXzbSHCEL+v4Q9C94NR+/ZdvllxWEHR56KOlY45soaRpb/rg5Xgtc6N9lA/P+krPY8Fd1SQiR+JiGfST8rr0hZHoD8YW9UD5U63LP1VUKN8dJy50gQYJmUuU7DzCML3/dGhBZbBOXQ7s5FPpjL7QstQ4G8qmhSc2v4j+6mwn7g919wIyq26zoDMjdgsbOeC9rEdhWGrNJEK8e/Z1ux6hyRftXVcuelQNf0EW6CdMGYpsR6BuNL/LHAulj147/Md5OV17PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcrT+ny4fH1/ZVfipGz0xgcFBD/YwUVyhGAVpaC/KtY=;
 b=QoGmbKC+r/HDEUe7WFKgmPYhMFT9m/9UyAVEaXPXCm8U7ro3j1aKy7edn+m862p7fsfYgrtXTMbimcvqsdMUlr3Nprwaa/5Q+rqZ7RiwSgB8fGFMlyf5PUWvc2ZGMyy098oVTP94JP+ILiQTDX24q+GiH6jSOja9t0wlR6lLZt9GymyCbQlXD0bhgjUj4OYoxi+raoN4aLmzTaBrf1132Si5QUGyB6UQL1ZnUeqpbZpoGc08I6DFDY1AfPtgKwMoylzEQ8cY6YJQ2/lfXsp7WjBjJniZm3op8y9mhRPw9jls9DPMc0ZWTxji3+CWGyhtr1zkqZVNf2W1zXMk9DSjrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:34 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:34 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 03/11] media: v4l2-isp: Add helper function to compute extended stats size
Date: Mon, 13 Apr 2026 18:03:23 +0200
Message-ID: <20260413160331.2611829-4-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: 23306871-9b10-4b8b-af07-08de99765aac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 J5TG4/wvGvAsqYPIKzrQp7fwcpP9mKubfzf63hW6zJ6phY3mO9acvcM9WsA+4uxRKFmloUWdQWBkesfCqiY07TJ4zKiby4hIE9jzUZZ0lFm871IuPQ+d2/DRSLmCqpxeHni8UVQq8QTNEvgSB2l6s2HY74u6PAtIC78J4L0GICC2PvLFSqLYvIOPCakwU/tYCh5UyaitoBzm3Lu9hmrbs3KOpvhNfvAA1sj7USbe3+tU/ZB714udEt7zlImTY8OJuR0EkurHlAmhzybH2sl4KNFM7OGm+pzsK0npBqyTN4aZS5a+q3rnnYe/5qrK+/8JLKLjZbL5cwIMyyw6pvFJ+YwuQNtOcySRHnlCgozIXMy+Vu4su2m71/o5hat+Z7ssM4XyChAB9N3BTj3vGRSyz6XVDWq6utPM5gMtUxV7TC2dvAktjyukt9p5I23lFBPNIqXOPjd+JRHvBV5tDT9qfT8XEWm4NIXSiOHXjDLCDhPrC/IlhVEOcUT8wbZe2NEM5ZmQn66MFe6fxtrOFZ2QulZ7mIRTak4X+rCZPTUaN20Dj0s4C9EkhwDeUoVMBTeQGTux4Bm3idaMrOeYtlFxCqO6+X/yTaW8TggfAdvMc9MkBiVDnlSmmuNxHCIMfCZ1+jiLnvtlxKvFyXE1d7g/shCkcMUoyDg+s1Ff50F7XnjFbwrAOhtX5I6DBvGj9KrsOZ57JOnJWocIY5PIs7aluUcqjlApnoT/Rxxr91CddtTuriyg52zMEtJwW7Cfhpi79012LpUQD3AU8eziIINcN0UQ2CmviCNOvKlXZtUEJDuoy0TkoX9BFVz3mlGDfovN
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?N7x9r9w8wPqeVHG7d0gLSlSDyxevAdkHdYHw8iwQMgjrPvnvkSY2Fugib0Nw?=
 =?us-ascii?Q?iJDWwsJJ835Bvh/g8XDpn5OWW3XUzk3p5Ae1jibiMG4TgaadBHfQDK3+vlVS?=
 =?us-ascii?Q?qM6+pbvtxett4zpXDJpsc+9cDn4jmr/RtMnjxbutYLBot+euso2bK51k7Qjg?=
 =?us-ascii?Q?fGkZpCbvHL8UaESxX1G0WNNv9ATmU1AshmWr7rumb+HqvTe9kKUgpDSP1NLO?=
 =?us-ascii?Q?zO0b5sCRQBJNfrUvXqMeoIadpl5OWmRjl16nerMG4937+sNBlvV5/kmm33Wy?=
 =?us-ascii?Q?3b7cg3v7Bx3UgcOxbHzd5jfaosvCokDNXru2fpA+TuIAu1ae2FUrwPs4BeOn?=
 =?us-ascii?Q?9GLFios4NzcB1YuwrmMIGGJEuCOx73TK92w7HYPzmgMNUi+pv18/+HTcBBpQ?=
 =?us-ascii?Q?BZDBGZTaRu7EE/GfV5ZmUYF/VX9c/ZWiT22yKBr5BWSfkstxxwP/L2bY8iIy?=
 =?us-ascii?Q?LXnmrXak7AXgWwENOsoNjCEN4ocyixEKQgc6VUM8qbmP0KfD0Su5LtCGG9jL?=
 =?us-ascii?Q?YQvXLqgCKeR+/MAzt0dFbmZOuDdpKwbaPzaB2d7cU6PtYkRaWpzXAncSchmR?=
 =?us-ascii?Q?xlLNjEwn0FEr//riyCQ18NbsckLvRz9EMoipOWgR3Hi+Waj3hWtbmO/e0qHw?=
 =?us-ascii?Q?g++MP3G/PngN60/dfDXJU7OBlQx60TnGH0lgYca4C+rkqBBao0xMRVMtank5?=
 =?us-ascii?Q?HfEUkM7sQwgiz50YKlTOYT61HLD3NetEMl2EBRtuvPIXW+CH1+dW3NyuN/rq?=
 =?us-ascii?Q?a+K/YjBP+lV+uqgBGIQYCl7OLqJE8QtnClD/bGbEhfxBwFDV/6UC9eghqX/4?=
 =?us-ascii?Q?nFIbCglmfca+Z318VTlBZ6CWPnqrnUof6slC0Z3zpjJnl7UCRol/GTtT/cR1?=
 =?us-ascii?Q?fvXlV9t/UwiCxD0mEmwIe3qhx1dcrQkFu/uYRPwLZGGvQaZlb7xz/kGoYBT6?=
 =?us-ascii?Q?8WbBbNb3Wecw+V/XJ/r6avXlQdRKZF9wmCEmSDMkJVuUqDkLCUSh3ge6l98D?=
 =?us-ascii?Q?iKh3jZXuw7jKPDiCC65PQiMWPyRFYj83sVGyBF8Dqin/KLoA3C2FVplO3G9u?=
 =?us-ascii?Q?at+69jFF+hxvx2l5yld9C139m6sxumn7H3ruSOavQjf4006+/o/LmkrtRym1?=
 =?us-ascii?Q?kM7kcColRUP1CkMXTXQ3LjBIJxaFKiA2myQH7VTeQvyIf8DMN7DLwINcvqHK?=
 =?us-ascii?Q?Sg5EExrvSG5pxVrFXCruqKZzCBxgft7bvdYIO41icWXb/sgAgjXq+YSQQM6L?=
 =?us-ascii?Q?uv462QRmWeA632eVbDlSnDttvYSUz4VJMWt3ewqCTIut1WersZZCn1hAE3+H?=
 =?us-ascii?Q?V8TP9kFPdf05HKo703j9sA8c64ZbEjv7ymHw2RCH6g1alDx6/Al5TKPmgWsY?=
 =?us-ascii?Q?uLmqmeVy2PQUPEOwosVVfmbYhSrDv7HF3ZnFQKngZjcRYtCMkj1rRZh3K7/s?=
 =?us-ascii?Q?sG+L7aVKf3xmMmjiP56ZDsjqSteNOhm7tcQcd+T0djWw6nqe2jPij/vgagMa?=
 =?us-ascii?Q?cC8bbsBFmfUxXfmliRY9ujyOC2Fj2IFP+ENOWJziNxn2zeJF1C91d+Ewdxo5?=
 =?us-ascii?Q?lDiKu899ip+nacGT3o7nVIENZlED0NsmgJpoNdr4SmIaDle0ZKws+sjPyvWx?=
 =?us-ascii?Q?VZOFF1oOKokEuk8dUwIRzlNL1TDk9soPzWPn1ob06K9ucJLWKSi6etILIbzJ?=
 =?us-ascii?Q?ePRnoG5voJScYjNGGsPVyPEB+TXqD/MaBxK4dXlJ1RQgbUG2kGKnHfslKlXm?=
 =?us-ascii?Q?4ODAtEGqqA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23306871-9b10-4b8b-af07-08de99765aac
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:34.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3d+ae+BXaGlk9ADYst9b8FQHmRUQNxLIYV8xVqKuDYtZMmH0VmcF0jl0bhx0em0Dfi4E99xSAndaHyeHOXatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58673-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 929163EE5CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v4l2-isp framework only supports extended buffer for generic ISP
configuration. This patch adds simple helper function to compute the
extended statistics buffer size, exactly the same as for extended
parameters, except that it uses the `v4l2_isp_stats_block_header`
structure definition to prevent conflict with the
`v4l2_isp_params_block_header` one.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/media/v4l2-isp.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index f3a6d0edcb24..9a93a534e7b0 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -27,6 +27,19 @@ struct vb2_buffer;
 #define v4l2_isp_params_buffer_size(max_params_size) \
 	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
 
+/**
+ * v4l2_isp_stats_buffer_size - Calculate size of v4l2_isp_stats_buffer
+ * @max_stats_size: The total size of the ISP statistic blocks
+ *
+ * Users of the v4l2 extensible statistics buffers will have differing sized data
+ * arrays depending on their specific ISP blocks. Drivers and userspace will need
+ * to be able to calculate the appropriate size of the struct to accommodate all
+ * ISP statistics blocks provided by the platform.
+ * This macro provides a convenient tool for the calculation.
+ */
+#define v4l2_isp_stats_buffer_size(max_stats_size) \
+	(offsetof(struct v4l2_isp_stats_buffer, data) + (max_stats_size))
+
 /**
  * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
  * @dev: the driver's device pointer
-- 
2.51.0


