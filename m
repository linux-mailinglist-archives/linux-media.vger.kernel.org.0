Return-Path: <linux-media+bounces-15494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524F940270
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F76F281636
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 00:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5A510F9;
	Tue, 30 Jul 2024 00:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n1XfQTuw"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756081854
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722299705; cv=fail; b=CaDxsd+CCG+Hy0TSfw+mwF85fMbGPNztw4MbjhtARKXya7DKoh4Y8GNo3GBib4CDKy6Pq9PABKgK1OvDDlzNGF2xsRvKTOE2nFg3HAizFluBeyKrKa3Qm1Mp2CtSUXzQocnxnaFIO0gv4EDMIUVOQXGzUBYBnFBOud/6jcwx7yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722299705; c=relaxed/simple;
	bh=/LXWIhQJYZqygVCgEX/8pGwGDyk6N0eO3OEYhXHRFGE=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=X5MFqr5/xSyAtfbJNRdAu5P8uRSfyheiC/pGb5rEgPPF1k+Q/8Y5w0apTW5Kee4c3+GngoCbXo5nR/Ag/vRgQYk4Z45kRDri+8rZB0CcDc1iiCp19m6WBlAWNQA8z0XMMr2PfjqGLXD49CZ67Ci4Y9FOEiMw++etFrINhEqWZjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n1XfQTuw; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taOmjG0tUkfdjKtqI4H1xtXFVEEEbl5fU6XW7bGAc6EnCkhAGycoPBFXHUuhrvFXU0zQwEq5VPajWfXK2MzU5E6M1dfkC7+DyIhdzy0Ii81AkPgOqrfz8Huv+kzZNzpdBlNEA+y4U4vQZ8i5+oiLO5srV/aJuZpPzW9UJiVhXUUmUNgLsimzGOx7dNuj06YJZ4ZFJ+TjF/RwoZOC92RnOdkRuk5WdiViZrpLfYoktrBiTgs3bn9s/8H8/zD8XBgGAKC1TV9Pfq9RstRvawARXeMogMJar6OdX85C0sBfw9mXHNykrLYTHxxh4CKwIdVJGKGGRs9bXb4CGBmy780IpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3fbeqijHzSesuTrUrKu0YZE5E7sepunCI/sBnaavVc=;
 b=Nmny6bfLfKIm3ru/L4wXF4zNhD+vB/YYWBq3Hb1Q0RH3bQjHhNpEwkr+EGfxZ3ZyoA9htwAkF0M4MmzeWmduj8MsD78Q8jUfZAaz/l8BTwhJxtUfXGaeuvNo/KZaiDu01WirsSvo91SyhnOdy+ukjvvm8MylWwvCPudg7AD35OqSAQYgXjEv4oyB5zkYa+2wMMzORQyHSzW5Ko+ds6bQZ23dzDZBZcRsAs94sucx9kku+Arg3EFZBHQkH9YM4B++Rz0EyeKQ9LemY4GwBYh2wLao5gXus3scmBZSFXpAu6wOBULeHyRUVXzNhSsgapONxO8sHDpOjdo3uoCigu/hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3fbeqijHzSesuTrUrKu0YZE5E7sepunCI/sBnaavVc=;
 b=n1XfQTuwhXbHpLZh+ZpHvVnK7JQuXyzlU+jvhro8AZYbQYI8vyEQHZVYCa43gQrQOERb4ZmDbnsDbKKiL9fQtpbl4EuT1g3sRegp7oMSoDHApbYe32GT1SwTEQmYB2BWfEg1xU7FqnDOhZhKiJyPvhxOsjM8z/aghRVUoEYFTJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6972.jpnprd01.prod.outlook.com
 (2603:1096:604:13a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 00:35:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:35:01 +0000
Message-ID: <87h6c7lnt7.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] media: platform: ti: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 00:35:00 +0000
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5cc30c-3cd6-4378-3d9e-08dcb02f728d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?StdkqrVGcXKHev5fyLS7xLqxvvTk4olRJmcQH+QkJbgWzmKg0H6R7bx1RyNo?=
 =?us-ascii?Q?2r/m5doUzrsYuvUokJizNV7x2PXU8euKPREuVkAqNpQUEGCyFF6zcwTpLv1R?=
 =?us-ascii?Q?9Jonp+ruMSeWwgvgeh8L5glzZqA6UgB88eHslgeyWfsZ5pE9Kzr9K23uuhQ6?=
 =?us-ascii?Q?HYUEfhM5kzcDLAk/oUDCEea+VgEQRht71bXbr5qWj7SWIKJ5CK0tUXqbnAdf?=
 =?us-ascii?Q?fUhPD0mGyKcfEem8JGCLIvZEr6bjQW/3GJa5smVFmrfZ67xe09LaPdQiWaLh?=
 =?us-ascii?Q?Xx03Ki7vKrWuavxGgY2LVP88muSOCxrVttqYSkdUiqiswXps3NQQngzMI3V2?=
 =?us-ascii?Q?katHIEdiaKylex/snoguxRuafQU9+xVGChzyc5vvzSWdH8LlR8xn645FuqrF?=
 =?us-ascii?Q?oFqxXaZrphgmfZGmQz6UWWL8OJSEmipVpNMm4tQcRopa9ihtsjgI5kQaRNRC?=
 =?us-ascii?Q?aG7sbqaxt2sdsw0YBKSK9oFJ0j82zsbGuyGXL2fyVAbfsxd063rKPLyZU5ye?=
 =?us-ascii?Q?II0EFjZTpt9QLFtShB1R/cwpsJrJHyFCjQIMwqnBxh+Jqf3WVtFGqhE+hJa3?=
 =?us-ascii?Q?aGTxfPuhFbbSxlQvWqK1OGUn8BPFrzWUb1mVIWZYY6dFCThvrumk2gtsb6Mq?=
 =?us-ascii?Q?rymKwWmPfPBxaWByWScs8MBFdWOH7kEFhjurx1zl9AaKhSOIUCFvWSYkWjoO?=
 =?us-ascii?Q?z/Vnxg3e4B+qpnsZm0Tml4YgDfjLCMqb94HABlHIP7eE25MF1HNk7OVhlJ4B?=
 =?us-ascii?Q?ERzWtCSiDWLwZoYu9j2p21DfpeZPRWrrCWdBj5sG57D4/waZ5MkAGkaem56o?=
 =?us-ascii?Q?KBzBt/XOeWqMQfQQL4w1WAjcBbBDP36IeNXrtTwPIhSK1Qil1tFqzxToNpDl?=
 =?us-ascii?Q?cXFRT7RUZy9gdayYZOeqg+di+gJ3KfOy8PzRreg+JS51wf+16+TQGJTSLlBV?=
 =?us-ascii?Q?BVIruJjmBRy4V02dpJR6Xe0MeG4tvkQyNdtFDmb9IIpUPD54edAVHJoeP+Yw?=
 =?us-ascii?Q?cxgugraUtYOuvilYGtWEw87SSS67dLEMbgNfNwMc7X9u72OuQ7737BfFHiX0?=
 =?us-ascii?Q?1cLcKmddkFy1EwAhjNkT9j0eFYKRQGPIm+HWmAaL1ub2y5BhMPbiaT3WmLGO?=
 =?us-ascii?Q?VeeetZAJf7GQmaOgsXtt3i5ZqQgi4YgM13mS4fcLuQY6qccRq/peWJUSUX5h?=
 =?us-ascii?Q?dihDhNqkG/QosV83aleQ8IK3dxltBj3BT+DP1//dj13jDwafgx69l5YRN0TF?=
 =?us-ascii?Q?XaO7moj42kYNSvmXpHd61e6Vn19sS7+HHnzNI5wOKE5GJKlDun5JCNfT+l2Z?=
 =?us-ascii?Q?vpAbWbRKlwMfKjE5LYfxwJJ9Y9KDOfz5XG6lP5m3vQtu9uStYoz/bDrQWKmF?=
 =?us-ascii?Q?sPu4cYbTsEgVak9195yXx7D7C+dDLlYLIQeaSqWWVV63LoOtiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?40vOTPGHZktb5w303JaSWKbQVABdXeRXzpVwh/MgWbTzcwsZ6CcD+fj3ZbNZ?=
 =?us-ascii?Q?dr7BuRK2RHYsfilpicxMc0od19pek+rWwslCOwwgeKCJ4MgqTL63p8RyPt3e?=
 =?us-ascii?Q?OJo5OKYsc/dGkfqxggi+0PC2LN8iucfSoiGBzj52f+dw0ZYc6pVT2TmBLMPY?=
 =?us-ascii?Q?1vbJ7OfxgR/dHCoZ4FJGFU1ElNMrV/BCZe9OyfQUx0fktfIrbky3XgkCFAbm?=
 =?us-ascii?Q?WNHtF21LRiOnIqCKWykwUfkG76n+pUbscYVwKVDp/QFW04NcjH1fFnuiXPSz?=
 =?us-ascii?Q?vKmGpbNjrw1mu6bUr8y20mai8QPC7FtxLVC0Vk4qAldzVOdHItBFTaueDxwK?=
 =?us-ascii?Q?xV29Vmg4dFTz6HCdAHlxX9nmXT6PsnzbUwmw2YUexPg2v+quLzmjDChamjX6?=
 =?us-ascii?Q?OwS39/fxzoCrQSRKIS7XBcp0srFoAWPjIP863BTVmp/WvI9Y8ROWmTm2Pl00?=
 =?us-ascii?Q?MLhGlxkqnjULsEdRBsdYjJW4k0+ikDuTsMXgKVOhypUQBoWvddvILVEgGW+q?=
 =?us-ascii?Q?crI369bEvPPu1IBg61JvIOYfIC6kZMy1zJ7Lv4komxshNTkAutCeAcHuGvcz?=
 =?us-ascii?Q?JwEbvitE+zbefnHu8msVx6fgz6xG8kJIHPPew3iE7rRYow3wBYB0hqqM+Jf+?=
 =?us-ascii?Q?MgjWd721kDScehPWyKboRHlTAnCTyPnzSbarsVzPlTHHEvtnigzQcNECGIVK?=
 =?us-ascii?Q?8aav4ubqDeJVXgEuSeWKPfwrOagAVRkzSo+zdOrMzWU+1vDcC/WHz5sz4Cjd?=
 =?us-ascii?Q?ONLSuyd3kTMDtdj9cVFwtQjahQUd0+iGgiAdXlOo2nRacCwfiSUlqAncAg1q?=
 =?us-ascii?Q?3XRo4PexzB6J3Cl7Wpo2hHgcBHOJe1CaB32GFjKfzRx4EfJSTew5gxN0ixWg?=
 =?us-ascii?Q?Hnv3L2nprbq9Lt9CkqYgHQQse3ct9NepureECkBvCmcocyRr0uiajzpF1NT1?=
 =?us-ascii?Q?+GXMQpbq+SxJhq7nzIsB71ulZHBi8a2sVmhvO0EC0pyKd8MFhJTwRayMBkdF?=
 =?us-ascii?Q?ak8qE1/AV/SIp1CCP9uP7PqEDQWPuN3A8yMz1RPDW11Rwl6FNdShqtV4h6rc?=
 =?us-ascii?Q?GuiemEFYVB9XRAmgojqu8GsF0YZWy47G1n25FTH7qBNdUYseLgiwG5Vtw8Vz?=
 =?us-ascii?Q?PV8SJU2EoswZkLJ43qCLxG47mighBhTpmuVA+UxPWYkegWnHChL3gSXOlhAQ?=
 =?us-ascii?Q?syt8q7nQOuAkq7NVNeGWtBLEgnWQx0ECRXtVwNZ72nme/TIjrmSEpW3mfCx5?=
 =?us-ascii?Q?rS/lL0kqAg9UlZxNU2ILDSnhrXhec3Xh59Em9+wglFXa2Mcz0oSCFea1JFVS?=
 =?us-ascii?Q?2h6J+2GnZLqpAdvNQwaMx+eg1xWb6JUBgM8/Nd4y4GMyu45jJz97ZGzvifLL?=
 =?us-ascii?Q?w464opRhV2q8LGDPiSoyNvDTSrR0bsAwCBRZ8ivy/mIbH3avwMpb6CfRnohA?=
 =?us-ascii?Q?qPJR0TsLKhkoV+qAfzZxaZ1miQS1Iai7zA/QM5pCtlOomrsRsK45N7QFA6UV?=
 =?us-ascii?Q?UB9RN2ilyk5fO7bPsEggJz/DoZs+kVyX4rDA2C8oyMCf5T96Uwm+ODFwnlt8?=
 =?us-ascii?Q?2TqlyjC5HoxxIgtmUeywDPAmmgB3cjbeGXmTtYAwwwzMSgmoM9Ej1HxnyduY?=
 =?us-ascii?Q?XlLCZD4yo/60eksBG7hO15E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5cc30c-3cd6-4378-3d9e-08dcb02f728d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:35:01.2369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HzbQsAkNhkbTorB3EZ9LgPa5mRqXPzTOSmftkcO821lWQ12v6cJt/QmaiSz7s7dFRRT5r/wzH560BGqeo7IW3ayh40VaVbkEjZ5r63GvD97cy3hOwG98lo6XyIR8hs5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6972

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
 drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 77e12457d1495..009ff68a2b43c 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2287,7 +2287,7 @@ static const struct v4l2_async_notifier_operations vpfe_async_ops = {
 static struct vpfe_config *
 vpfe_get_pdata(struct vpfe_device *vpfe)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device *dev = vpfe->pdev;
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_config *pdata;
@@ -2306,14 +2306,11 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 	if (!pdata)
 		return NULL;
 
-	for (i = 0; ; i++) {
+	i = 0;
+	for_each_endpoint_of_node(dev->of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		struct device_node *rem;
 
-		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
-		if (!endpoint)
-			break;
-
 		sdinfo = &pdata->sub_devs[i];
 		sdinfo->grp_id = 0;
 
@@ -2371,9 +2368,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
+
+		i++;
 	}
 
-	of_node_put(endpoint);
 	return pdata;
 
 cleanup:
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index c28794b6677b7..16326437767f8 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1487,7 +1487,7 @@ static struct vpif_capture_config *
 vpif_capture_get_pdata(struct platform_device *pdev,
 		       struct v4l2_device *v4l2_dev)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device_node *rem = NULL;
 	struct vpif_capture_config *pdata;
 	struct vpif_subdev_info *sdinfo;
@@ -1517,16 +1517,12 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	if (!pdata->subdev_info)
 		return NULL;
 
-	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
+	i = 0;
+	for_each_endpoint_of_node(pdev->dev.of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		unsigned int flags;
 		int err;
 
-		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
-						      endpoint);
-		if (!endpoint)
-			break;
-
 		rem = of_graph_get_remote_port_parent(endpoint);
 		if (!rem) {
 			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
@@ -1577,6 +1573,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 			goto err_cleanup;
 
 		of_node_put(rem);
+
+		i++;
+		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
+			break;
 	}
 
 done:
-- 
2.43.0


