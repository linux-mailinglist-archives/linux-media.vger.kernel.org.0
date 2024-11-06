Return-Path: <linux-media+bounces-20980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1DE9BDEB0
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21DA28503C
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B691925AF;
	Wed,  6 Nov 2024 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AoM3fOHZ"
X-Original-To: linux-media@vger.Kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128321922FB
	for <linux-media@vger.Kernel.org>; Wed,  6 Nov 2024 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873823; cv=fail; b=j3QKQcIgpAeL26gFxFOSDOcd5OuOYSH7Lu8yfIN0NNJWuR79d3uGOqCVZIqXmZm3127Okgp4hLorySZpJTMdySLhUYUoxTnOuyxp4MS1K1ivGsb5IbfNWfBWUE+20egAuVughqkFDPr+xdlFdFTKNWK9TLKH3fHgSAW0NEBTHcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873823; c=relaxed/simple;
	bh=Jc6d7MjDrgy7PvyqchGCiZ+AqjoKDpV9uKQ4tvJnFxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gKHswamxlh40j71xkQg+9EHwB1Ks2kFmGmPyRtk9YSOo3ELD44Kjl7FIGM+++/+OS7kNX+2ApSfsLONzWj88KNpCzD/rO4R1pwsIQaX3HBKQuFZWdT2D2Uoayd2lCdVePiqWrs7mdtEg0Ja4kzC97qp5ZjLRvGpNzg11Owe+yS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AoM3fOHZ; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaHkoU3Ty2A/yWSRBxJxxLsRVw55ozQtGXqNFxw7sHp9JOIeyEmpH4ck2v5x3j3xyFVaZrVDfqcNd5eNz3PzZT9nMPIbzPTqtHt9WixPlO56w+lOhdMPCW1even4TzrbjxESzAYmwZru4WPR6Js6hxTslZsRE8i7+B2URMuv8ZL9uokBFtbdptg0VeS5RrNvsFXn2RHEjUeQ2pfxnRz3Awq17FrdU/XdcANedcPMk2Fi8TMTrBBE/jG5K3NCV+bX2OUojbXRhygKfrcsVO9vQsEOLQg4AM7GqtoBn2YcurxDkxUdLPNXDKQc9+hTTn2mDvx6Vvjcdho6zROoZn3uZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTRHhP7KH0T57Am0hgobO91+Ll7J2bwoMr724wGaPeo=;
 b=QiO7ecH1CJ41ezMBNqQkcnTa4hP1lpwezuS1p5HJLojPTAlRJeXOVP51/Ez7yVLkbCDmGkQy0EWYRtm9IOYPFQI2EtfAaRrtNlLhWXvL8KdRBOQuXg9GA+4UiF8kFHtxxK9RLyjL4577mb6YcuRmdyIm4uSw90p1m9nPgQahyEAXwmY4ci2NjckLESseDQIPT8P/alcFBulXzbL8a8KNA9qXxiZzvhHy1EVQnqKFUyqtgc1xGEYQbSI/aiN1q+vZD63iYGFkeqENeBks2dwQ8Rjbtj4oy7nVmcbI+ElNFyY3oGS6XdAL6JhmQTrOw1jYWXXGEkQpG7f69b1bABh+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTRHhP7KH0T57Am0hgobO91+Ll7J2bwoMr724wGaPeo=;
 b=AoM3fOHZr7az8DhvT876BlMmsz+ZMj7rovu0/a+OUrSZoLLb08ZSG9ZH1SBRr3OKRQ1LdTtRuV6cL8z14LG3sIC1XGNbSqDi9FCWWa9AG+DxZZGBE1urS3xDCr0zmxkuYE+UolW3a3pQMdhC/dNCBbsQ32l59rRkvfijTcpLcBpuZMMsOkbsIwu/d8WimC0MKoMeQn7QiRHuhaoXDL6ho907il/sa3Ehv99BOWc5/cblnqP7btSLfPzRXX2lnWWX0viF9q7xC3ocsqgpS4LrTZ6LpiQGSkm9MyUPAqZX/2G7Ve6KZAhbuMFz7731/EuGazpwu4Lib1hysyXjqbqsbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 06:16:59 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:16:59 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v3 3/4] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Date: Wed,  6 Nov 2024 15:15:36 +0900
Message-ID: <20241106061537.211002-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106061537.211002-1-ming.qian@oss.nxp.com>
References: <20241106061537.211002-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: f5170298-b7d0-4dd7-ab85-08dcfe2a9ef7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?GFRqnVRpSTZRErcNhbdv5lmCOt2DkjcsAmtShd2Z0Zuf05Dt++WjycaDOi2E?=
 =?us-ascii?Q?uQVc59TI1hKg2tQsb4Yy5v+UImyNpqi0SR8xnN5uNPJUDNw1hVU9JL/6JncR?=
 =?us-ascii?Q?solkPonbmOYYeyoUJL8/8F2XYJ4SX0p2GCCW3Do7ZHdz8rndDRmb2kMXoKWM?=
 =?us-ascii?Q?pYhvtbvLoyb4nLm4XUB0hwyvMRSngU7il0KFP1g9Sp/B8O5hoDMwUwcln2N4?=
 =?us-ascii?Q?U4SnTRei79cGFTVs6tf0/l3hOEqcOvocC1q+AT5+W8TzN5ata2ffHPOyEggz?=
 =?us-ascii?Q?z9IqY532sqgV5YE4PXZGHlinJK/fOxkrpCVsHFy3J0nFplrkcjhMSEtZpUJz?=
 =?us-ascii?Q?KlDx3ikcGfGGgsqQ2OsLzpSd/EQhYvNqDyPoe7IXJrxuV1EElmp5XGZSgYNS?=
 =?us-ascii?Q?TVDh4fgoQIHm1bQ1CjjZReEiv2ZfcnEST2snZrdnSdRDOCn9LDfPM80vQyPN?=
 =?us-ascii?Q?Im2a8BRa1fFy8dY9j71dKJMXBFhFEIygbaFvTVWVeYrFQZQPyafVILvksbxb?=
 =?us-ascii?Q?l7HQSN6sMQmx1bpRojEVj5GYn2Zd8zf4VVvzY6dyH/vP8M44x+IWxmPGduF4?=
 =?us-ascii?Q?jblIE5TK7r8nl2EYlsjFJ3QQeOIbtuOuQ2y0RiOCbu5w4biZGXJL8WVfK699?=
 =?us-ascii?Q?aWaWs1ZzS7HQKhsud22nc8udp97oF99kZrZg5y/DYT2ucAC/sU8joo8QV9Gx?=
 =?us-ascii?Q?aL6kG0L13Gocj7bwGE0zi14FQE6JkYZhKGeZSxfiuoDjxFX4OdNjGugDdlM8?=
 =?us-ascii?Q?v2jWhCkPF9UV0AzabsqmCNT8WwaygdKZ+jCxRD1IJ6MkQrfeHWfTjRyzJOlj?=
 =?us-ascii?Q?RhQ+t0Sp6IGg2BAAzXNxGKjSPRgf1lQETGGj0VLRMp//kJziGKIy7+p4mnnm?=
 =?us-ascii?Q?JyF3gRJuQiJoNK5IXeTvNKbaVIa4ijS2Ea/2ettUjKFMgZpmhkLfW0UtGuTn?=
 =?us-ascii?Q?Ph9OENKJzITK6I01y5LX8WSPjvaXnLjv1iBgiPd5tZB6Wix/m8q3qX9/mYTQ?=
 =?us-ascii?Q?BHBTmL26hvjx6eyPrM6evG+npGD5hGNLJBXze74Z66lJV+OVkLnj/yI7XtNQ?=
 =?us-ascii?Q?hpYzIwWyLNOZe0gtSzXeCO++/7DkftJkBUZxNkY/Pg7/RiolcdAQ0TVWOh0C?=
 =?us-ascii?Q?2QJN77MpPWqZqMWKiykdJkSW1W4kz1IweDS22fYn7VvIWWj61Zo5DU5VkIk8?=
 =?us-ascii?Q?d+r73WoGGPQtGonyQv1Rwu84rKFv9oHldOZqSBLpLtjFxv5pdla97lnwu1FS?=
 =?us-ascii?Q?jr46gRR/75DQ7nTywkCnJxwsAHKpK61iRs2H9tPuWtwPuKw5EghLfHbi8YoA?=
 =?us-ascii?Q?35BvdxgG8Gc/PnwSyiUbDWwOi5rbd09t+oYuPa7ggwTk19H/DE0x+tuW3F8I?=
 =?us-ascii?Q?A7YLnC0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?8spMKTuSCImDCfMTb6B4GQOlc5jc+BBU1LM9+QfzpFUWJg38KqjFWKeIhNWX?=
 =?us-ascii?Q?ZreCLs+N+ZCuov309gBq4N0iSocxjmNtM/J+0AmeCFP0ZKqoFPJHdGSTBOB3?=
 =?us-ascii?Q?+XRBN2dH2ObU2zRVpCpy2EC7WIKZaMfgeF7C6mqQsv5xqAkVKUGykewtnbY5?=
 =?us-ascii?Q?4vBnH0ReBtrOvKGsDWAE1SZooJIiP58mZRuLI9jVWSYzvP58Bickc+DaHpYx?=
 =?us-ascii?Q?X6VzGfexzG8rj9Gfbx+CDTjiyejmJ32r1YdKyOUF5f73KWVrJpEz0euTI20U?=
 =?us-ascii?Q?mgznTKnxADI0vcNeM0qXoMShFXvhNZaK97BM7dUxOUiXc3u4PBMZM+rBNwtj?=
 =?us-ascii?Q?T992PU2ziXYYYmVlJs+bAsJvuOKtx5bLjYZRf29dHhxJC3HUcNjs0T39Yw5k?=
 =?us-ascii?Q?yb32Lud9xdn4LLMNT/AlP2lYwcx8rOfatCKvweemqZTFjUtP6brkhgLvz6RG?=
 =?us-ascii?Q?EJ+cX720uIyq7Bdn+SpJ3/+29CGkyZYmiVpilt3Ne/3X5VAptbEbQ821QfUp?=
 =?us-ascii?Q?+RUw0Ypj1t62qUQxy7Sy5VoBbBHLlNXtsY6vnfHId6LiMR7USprvvuO0Ch63?=
 =?us-ascii?Q?F+hIP6XJDPT9rihb4LRAtQv6+D7BsH8iTh2q29+buC9E987hk6m/7rfsd98l?=
 =?us-ascii?Q?Vjezku1OTnCP59SAr1aZCKi+qYZ+6c+hlB8kGKM+1egfW2Lrzv7BeKa3/tVG?=
 =?us-ascii?Q?VcWLaI9ZtvNESRuqJCngU3wGqWNbFUKFhXyPJxZHA5x3eiJt3gWUGg0MUFwH?=
 =?us-ascii?Q?wd9L5nkQIDiXRs4JFidDTzxfXn8IRV4aDXsJlCwff8PiAa9841u2WlVTSx9l?=
 =?us-ascii?Q?czPdkT1OUO9nksQ0Yh7PbUpH6d5zSvso3k5fuMG7CtHKOglsfvgvsBQmulK6?=
 =?us-ascii?Q?XJazxZ6FQIYFcMlicNbMB6dsYWHKheahP3jzm/PcGNza9gLIv+MruyqyKv8S?=
 =?us-ascii?Q?C/YSZf18GYxMf92xyJcYKI23hxib0lT3QfBCv58tiQKsCeiefHEYvcBjdao0?=
 =?us-ascii?Q?WJoJrMMN1BpLNJ30vN/cWwsTKTfP4BXHAg30ABUCrQIJnG4n9ZcIsrq2Mm+7?=
 =?us-ascii?Q?EkMQx0swtZHksxRdjbImXeQbIczvUSYZEQk4CGzrADk9Gwmrk9pa4WywUPeW?=
 =?us-ascii?Q?nv5kk+wZCHtmrWNHtCv0RFOs2ba0lkunwaPZzgV2wQ9FJqJf/rrG6BNG7l0m?=
 =?us-ascii?Q?Vyvjh5Q9td+J+K856w9twTor2HEWpiZcKl/ThHtCizKElCjkM/Ammp4GeRjo?=
 =?us-ascii?Q?+R0xfPPFqarBcpsIUT+ZLjg/k8JlEfKigoq7hklnHQohRxEFK/IqdQOHbpEz?=
 =?us-ascii?Q?Z/oRt2EZ8aDD4LtuzSaalU9zE6S95wR9JxNyWjAb4QV4Q4e7gFRq7lyoFAH7?=
 =?us-ascii?Q?is3NpvedWKtQBR6//3ofnNqjlrU7u5z/nli7SfOBS8iS1DOcZvLbhQj/hH/s?=
 =?us-ascii?Q?d65arKj4uBwrF3AiyGXH9ONnTTIlNqRk5crmcTb4fAt2fKRKedwD0i7TUCOa?=
 =?us-ascii?Q?fL1SqY6ddFnpdpN7gVjNs3itayH7gsr3FMUOFxeOgSz+5+iQ6O39xfNrIixt?=
 =?us-ascii?Q?0xPa/qS/DJlYeLuMNwcc6+Jb8XGEtV+P9mDF7BNi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5170298-b7d0-4dd7-ab85-08dcfe2a9ef7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:16:59.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzX9qufVTT+sqXdnq9EPSN/m5TbnCzojARFGSdBNiqc4dANGiXH/5ikp/5a0dgOt2Gc1UhgSuy3ARDqCUqVBwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599

From: Yunke Cao <yunkec@google.com>

Tested with VIVID

 ./v4l2-ctl -C rect -d 0
 rect: (200,100)/300x400

 ./v4l2-ctl -c rect="(0,0)/1000x2000"
 ./v4l2-ctl -C rect -d 0
 rect: (0,0)/1000x2000

Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 40667575fcc7..1859292f6f77 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -614,6 +614,11 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 		case V4L2_CTRL_TYPE_AREA:
 			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
 			break;
+		case V4L2_CTRL_TYPE_RECT:
+			printf("(%d,%d)/%ux%u",
+			       ctrl.p_rect->left, ctrl.p_rect->top,
+			       ctrl.p_rect->width, ctrl.p_rect->height);
+			break;
 		default:
 			printf("unsupported payload type");
 			break;
@@ -702,6 +707,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 	case V4L2_CTRL_TYPE_AREA:
 		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
+		break;
 	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
 		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
 		break;
@@ -1279,6 +1287,11 @@ void common_set(cv4l_fd &_fd)
 					sscanf(set_ctrl.second.c_str(), "%ux%u",
 					       &ctrl.p_area->width, &ctrl.p_area->height);
 					break;
+				case V4L2_CTRL_TYPE_RECT:
+					sscanf(set_ctrl.second.c_str(), "(%d,%d)/%ux%u",
+					       &ctrl.p_rect->left, &ctrl.p_rect->top,
+					       &ctrl.p_rect->width, &ctrl.p_rect->height);
+					break;
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
 							qc.name);
-- 
2.43.0-rc1


