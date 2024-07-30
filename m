Return-Path: <linux-media+bounces-15496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC55940279
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA351C21090
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 00:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D9A7E1;
	Tue, 30 Jul 2024 00:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jBmp1Fzx"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3897E6
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 00:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722299727; cv=fail; b=CZE04MSCWbq25/EUnUwfCqvg5RHFUgAVMa1yHvcjJrkLlIfx2GZnRTGtuWoExAYmUQ/dZM1kg5AwpZ/39eo2jizElWV1KzA+MSEmBL6xYmY+oloipT/jgbDVeGkKRAWJxIaaww0BCvWjAjEOTzZD62qrQyYww86y01DtJsNSmGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722299727; c=relaxed/simple;
	bh=Gj7gZCmCXBxP7NSFq5kl6WHPm2h/Iad/8G3zfc+eHok=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=ZPocpPZCn39HV3C4i6TUU727k1Yq+L7ezQngtILaplhYdCcCI0AkQyc7BpeEN+GCyfkDhKd4HmbrNSs1HH782VC8RUtTgXVPJHOSxdYFl7zEZGjJjJ4bnth6aXe/V2OJAZQUrab7c2prLFi57KNmAbrh9nGO4leXITk2fJ4upsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jBmp1Fzx; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MopOTdpVPa8xESweq8pJTrjkBm6x0DT7F+76Whv+RM+QpbVt+aOHxYMChcQs4T0fKT3ZjwjkcXtuZHUxwIFGfg0Zt4HvhJ8ZUuzjGwgMjsN9uH31ZzwilpBu43P92IF/8cEpa/eh9erdfUZL+Sd3zLBybZwuszhVN9eNBauvXvPwMELVNa/se+g54OaW/NVx7fJQwMFPKD8R/JUqK/RPHmqeVucZhcCdXzz17H9pkSd4HbPcYdSJdWecsKwprRp2VVQLcjCTvfYiRqSLRGyCANDD9jzia4o07NMp2y9piCHTVKmBqCmTOn5cZgtSQyICUodal/E8LE0uL6SXYHAHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyTYNVFuiPWsFlVH9oyG1GODHOUjUOsgwsvvhJOqvV0=;
 b=WXgfYBHIthLOqtxRLpIAPJ8zRWt9PaxVJzxpvEzLr6Bito84KaF6tkfLOPyjOxHq9AJg2spKlBej+8alMKmYgb0Y0uP1LxgWS+vzAmYy1B3nyvsFjHq0uJbCxn+S7ThXddm3zYfpk0Da0j6EfKNSty60TT/2PKaUEL68piZxvybgpvWFnilD1AU6W/SgK2suoKCSDxLQP2llwO+FxOEFahWzREnq06iJn/WCtfzBkFFmpFCj+zMZLss5MrDqrXQw9Yd/h7PfqGyB5x4Ya+Hmw3AkL9IPZu/Hgr7kFVmC3lxlrhhdYiK/3XCwH5MueQioTXPZxqwNTZ4fV2OmH8yETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyTYNVFuiPWsFlVH9oyG1GODHOUjUOsgwsvvhJOqvV0=;
 b=jBmp1FzxU2pj7BYt+xWBTdjMYmCopylBiz4R3FONylFQDsmPN2owzXxVYye/JtxtWHzVz96dK000qwr1L3fKIsga0k45Qf1SEpEjtFN4hKfzvhf/QVhDffk/g5qrUXX71GLqoTDDhweRsdK61NbcjW865iNOCIgfEq7qnJk9C4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6972.jpnprd01.prod.outlook.com
 (2603:1096:604:13a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 00:35:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:35:21 +0000
Message-ID: <87ed7blnsn.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] staging: media: atmel: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 00:35:21 +0000
X-ClientProxiedBy: TY2PR06CA0038.apcprd06.prod.outlook.com
 (2603:1096:404:2e::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 248c9ca0-b614-4022-fb3a-08dcb02f7e9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d4hItnb3a2FY4YztKCuXG5rx2Uev7gjnmvtlgP1wFN+AlAyIbSU+XNb7IlRu?=
 =?us-ascii?Q?CYEg1DZWu7dXocecBrmDkcpHl2Laxbts9b27NAxr+YKvrHCPmqo1tIOLYOvk?=
 =?us-ascii?Q?lLSjbFovr3ltQWzKLK0PHDiUPua70rnv3MnBS7jCDwuiPETh9UehPc1dDV0b?=
 =?us-ascii?Q?V9u2MkEMDAAXvWyv4lrJ93ItNccWKVr+zlyumJX6eK5DVHcrhkwc/sMctOvg?=
 =?us-ascii?Q?MFoteXT9Fkr3UimYM7kYnZj/LTY+w4Asa37zpI+TWKPONuB7lRKBY4QXYMda?=
 =?us-ascii?Q?LWtSKBCoukE3P/km5jsmvrmeHSMWy4yLlktZYPLUp65+R3G1PANMmnbhQV3H?=
 =?us-ascii?Q?bwJZNMz6B9NjEwPmOKHKGSc2Yng95N4fg2CZR/7OWPoBH+8KUMgsiM6vQSlD?=
 =?us-ascii?Q?1sQ3a7/AtjrVsvYTp8Y2zwLYyI47Yxxsx1utL2gV1Mua+v6ezRctSuFbfkgm?=
 =?us-ascii?Q?VvPVdPmG2WByog7iDyA4Sy12e0ZJGu8ltjrYAh71qYzBsV7HLAGFYu3LfsAj?=
 =?us-ascii?Q?DVc6Q8xG6Ga7pcBB5yRDGQ7Xmny/ZwulwBo3FTIA6PQBA19zL0WA/dtwQz5M?=
 =?us-ascii?Q?qu3l4kC3O3nWENT+ziPPdQWBw4bYJMd4cLjjLnP/zOWpIpR7dxqUcOeLGAkm?=
 =?us-ascii?Q?qi1Q4AjH5EL2HwLZ2q48JMra/+GZtdie0855XbMXdiV/to9SXTVSztB20pDo?=
 =?us-ascii?Q?jbNBSpVI5soUC1MXMaxK5ppN91wEQeZDautUfahjFnuar/3/S7HLvDyi49vw?=
 =?us-ascii?Q?v5TcfphqPPOg/OUH+CDmvwVFOLmyngs//pAWg4uOVbVebrdKjrj8VK+zxn2u?=
 =?us-ascii?Q?m+uNboECGY/L/B88LSNjEwNwCWlra6kf54n3cpci4uqN/E0iqr55UIRRY+tk?=
 =?us-ascii?Q?JLEInIM8uw9bF8GonAZ8yJP7Kp0fFXtXuMSaEY8cI2toA0zsU3emyQAj2y2f?=
 =?us-ascii?Q?uRyq1O5kP3A0NrcfSn6cchbHUscA//6mdwx/lChKWO29jPtNTqY83HtZaakt?=
 =?us-ascii?Q?f3RLrHIFWaEJjfHsxA32BidA5dk+zvRuiJzSFOkLXTs8u16oknijOeHvQ+r7?=
 =?us-ascii?Q?ThnkpoiChFSnM4KpiQq/yqiX4sHEwVGF24DwPtGgBBvaSowLxBB9q0/+31aq?=
 =?us-ascii?Q?Jm1rdeb7VXWHsqZvIB0CXciiR8TU6Xxq/8+dJ6Jde+I4LKR60ZuYNY0gv7A8?=
 =?us-ascii?Q?bvDfAEQ+ISxoOGtwgHl7W8fyuj6JDIOS2KWIlhN83OzTjyb8rVRw60r2jzcR?=
 =?us-ascii?Q?ijt6Ezdsg/IWXv0rOMo2vrSYthMJKAIV0dpwOzlSe1zFbMMuQVmYBNpEjvYD?=
 =?us-ascii?Q?Wk4SIgBnqX1kEG/SItOXGerNKvlxyVZM81264MnxnyYRQMOgM6IuALaG5xik?=
 =?us-ascii?Q?+Mx/o3iYEExqGnwidaCDW2nSAZGzBjIkq49fgxiTIkOoO5N4jw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JFIeCpweNp93ONQ+htORv5IFLGPfMftpWSMyreB3ARYgVa1fIV8lRC9sitn/?=
 =?us-ascii?Q?GFi9qtCF3qyMxjmalbLPhx+0o0+V8xni2r8yswdQIGVpYwGEOvrAfrE4KWjc?=
 =?us-ascii?Q?JlME7AKNeUeNNwW8JTtWCU5e5mUlyFemd6Qb7LAQr7MvCDyLyykmiXx1su2z?=
 =?us-ascii?Q?OtX9ivnhtWt+mPyyxx4nQX/ITeGD3YBkiF1YIdwK84OKUx1HbjqM0ePgtLAq?=
 =?us-ascii?Q?/YDt2vk70bDiJg4ekgPpm9n64B2MsmW0WjZ/mbMq+RKe8xjmon6HkY6ZPB7K?=
 =?us-ascii?Q?9aV/OZhumKdVunrk2YhBNH+jlfvR+ZfxViToVu7WVQPR5ZXZUWOMv7v7syKO?=
 =?us-ascii?Q?yggAfReAfPZ+sH9tapGtgWrq1Df0VLE9e/e/AvjJ1jtUSYE1VEjK3li+TkXR?=
 =?us-ascii?Q?MqwPiYX3q0PCDp5nR93P2pc2zztomvJDon0GbbSUoiIHsqJ9gH8/hHj/7UvA?=
 =?us-ascii?Q?5ZEoIP2EX7CB2kpKCeoUkQhrWgqKX2rZYygD/o1O6k4VXpbZLGP+WDJMS4HM?=
 =?us-ascii?Q?hjptveA5L8N8a70Z2mnw1UPH1TQNW/TmR7N5EOMk/J4nf77IvP7ieOkeGQqn?=
 =?us-ascii?Q?bEQs53OnQi6l0eI46YKuXqso7HDjhvG1siCK9dZyUireurgbPWLZbHKZqfeL?=
 =?us-ascii?Q?xbAed+SXIhk/R14ceo+IVLulcncFllsACAwDlWZmc31CMw+sdJjjMIrPf/Ih?=
 =?us-ascii?Q?4SFFHKJeHr8a+Ose73t1V9WeUDOgS/n726YNxLKG5WCS8EReHiojndyB84Dh?=
 =?us-ascii?Q?mhAgDyjtYFquR+XjRgsVWT6Wz2rwQ8kbwvodO1UGFamekDviqHvrZ9SuhQOh?=
 =?us-ascii?Q?1gTlBrS+nD6DaBOD26a/qqvRYqymsRdE+M3k61tQQvvrf0gn3ywIuTE65nsu?=
 =?us-ascii?Q?FSZvaR3hlfxs6cBOpgQXQ637Ezt3b5kHusJcjXENVSgj30VK10bEvWPr2uuT?=
 =?us-ascii?Q?0MlnRDLF6wnIX62cm4WeeyaGYsmT/GNgvacNYyOs82Pg0qtgXtB1/iyIKO1N?=
 =?us-ascii?Q?Dx4lFDqXu8ci60J8x08Gb9J54eqDVyGPU4MKqCPFKnJCuQHSEKlBiqAwPB9T?=
 =?us-ascii?Q?ER9lVj1Z9cP1tZaMUEpOIQ20g3DbcqxrrHe1D+OhoYwleKLdmN8e5jvU6xFM?=
 =?us-ascii?Q?GiOJWB6nNneGJ/JVIbHjqNz1WIHT61D+HDgy+g20THdBbNBSywUJXnTlrkAr?=
 =?us-ascii?Q?E8FeL0hRFSrZ4UvGm0YrYP9VKI7Pn7rseU1OPn8gTZ+7OBtviojT0wsrhtMF?=
 =?us-ascii?Q?Ui0TKfb9Whz/Rk/QyR6/p6nd6hq3Qy4CDQw5c2X9FX5fQzlDRAI8VU+UmR+f?=
 =?us-ascii?Q?azhundnv6CVzjhmbFYiWGzl+tITMDYd+hYhJbyXGa2wmvv+MCX5zkkOwNTPY?=
 =?us-ascii?Q?0icNsCgad8YCp1sXo/tOHAqggfyxBpi6MfvFAj+xUh7CqURV4V/b/cokA1Mv?=
 =?us-ascii?Q?vsZennp7p4121brwazm+YearWOJHsOtME/DBmI5BGLoOAlqcX6cf8K67183E?=
 =?us-ascii?Q?e8/1hWSQzNrBmIKXgJKViW1E10ZpKRMTEnAlNctiZsgoRHwVG8uh/nfhvzsT?=
 =?us-ascii?Q?FhZ+O4p/E1NfGEHHJKAXsoj2320BJpqVsSoQyrR4QLdqoHwj+WuOc9CrAYGW?=
 =?us-ascii?Q?ee8vWlrGTzpTN+D8iuV5cSU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248c9ca0-b614-4022-fb3a-08dcb02f7e9f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:35:21.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWKABazcXyuiturtcifzYwoKMgX+uiHUAh69bLzmOSsIjX571IeXPLP4nRoHqjoj+8rKUZPoVAOTd1NyYonLeV0aSk5GDoi/5yPuSk+4ARIPAconooXsxwbvspRh5jDr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6972

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 10 +++-------
 .../staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 10 +++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 31b2b48085c59..712f916f0935f 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -333,20 +333,16 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
+	int ret = -EINVAL;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 020034f631f57..9485167d5b7d7 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -316,23 +316,19 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
+	int ret = -EINVAL;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-- 
2.43.0


