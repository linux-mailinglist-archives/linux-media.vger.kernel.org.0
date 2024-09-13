Return-Path: <linux-media+bounces-18242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409A9778BF
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 08:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE201F26686
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 06:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6351BB6B1;
	Fri, 13 Sep 2024 06:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="msMXBD8i"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15761BAEE9;
	Fri, 13 Sep 2024 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208546; cv=fail; b=QjBOXqozPaYN6WwH8bj1v8aG/31YmNKfJDjv1OQk1qLqUOVRHmpOsnm7GDSTr2vn3WdLxB4wPQu3V4PspkbjuxQTcBhEhi5ZQgTvPX9rcuvwnBKcnZrxApseLTozcUMtdO3/Xx/j3jKARo9i7oaF0kqqgSD6ynAJDo0Qe6bopTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208546; c=relaxed/simple;
	bh=IUqtvTggzjOVdgtdkOJBh0RXh/1WiOvHpq57zFbnvF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VwiqJlyKBMOUCNakTkTWj3iMznaXd6yUlkjcRFRGjNulet7AkSVnXQXZ2jTlyoNR3XoVWGAsjICU4lJgpmZWgyLM9nN31V3rmLzGtQoi5FoTLqRhoLzZ0CCbQxmsvI0Ez1ro2rQarzkRIgbiLyuizT1O+hiZkkxKbBEi9rjagWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=msMXBD8i; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIk76VT//l8r0bYB26LHbUm11aBtXMpCOyXbT+oaeKtiRi5ZCurYOw0NhATRDOzUvbFJLqI1rt3lEgYfdyBnoiRyErbMIiooiz0EmqS5BA/BTZsB6AZGdhwNlWHclrEi0PDK9R/l+b/uxHziQtErZsOy5inx5bP7ZAOwo0R2G69WOcRnN34tR71WIs9utWdq71n7VJWd9GbsnrIz9j/UZ/97SkLupY3Rach74cv8LtTxLwwKmhiT/YbmXmX0rPiZEyjrFzZWgOV846/B9bNJOsI9tWP3thhFBo8d3efKbafv/uM0s3sfd4OFmuGmQyC8G9ZW75BbEqotKxXnI7uSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0y3LdCQc+eydC2gY0PuQdPfvj6redQGQTPCv1VhAgA=;
 b=lk1q001YCN3d0VHVEGDFs693NUwYzxWcFhniHDi+3/kH+G656AapdZesRF0qp3Jw8eqQ1N+fxw067zQikZHshpxckREFlCI1xj/avIfHrCrz299ulW8dsYFhP4PnrAkbQOK2VoWW8zKb0gF/NGwOF4wSTwp5FYrR3g4t5lTnuKK18Y28mAKv0Ip4z1Iab6wW7j+60Rm9+dNGbyWf+3sTttG365Uae/G9KhsDLp/JIMZh9hPShMZ37+lRxtYCbWar4shqHKlouQGiGas7r9B2rtETXlLf77Ply0dScQx28fLtAUlZ/tZhjr5XsmBjA4Yg4mvw8fq5EFGhIDezh9MyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0y3LdCQc+eydC2gY0PuQdPfvj6redQGQTPCv1VhAgA=;
 b=msMXBD8iR6QgHV6JR3xtDywhv2Eyv1DpY2MqKL6l1Mziix0yT+bNGfm8d30Gj1Hc7BmWDzOYVdoeKsgdEPx0maXpsLJq+awqhPDs5U9KrnMgj/NMRjuk+mgXn1ztdsN/NIEYnSdtUVM4JPL5um2V9gfdMBUpO8fTpnl5SYzJICtcTeACi3EcQoXaU7hGE5ntWo5XGwfcoX0qnvxEv3diym5Upw1nLw1EmkZTwRc1lyPnZFSAtsR88hKJToR9SaxlrOuAAeFRoDxwvIDgZ7AB4E3lm3ZwKhQr/YtH0/cKFY0/txigONXrQiw8mv2Cq+76JEhC5yImYE4yMOtHlBRW2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10856.eurprd04.prod.outlook.com (2603:10a6:800:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 06:22:21 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%5]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:22:20 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] media: amphion: Set video drvdata before register video device
Date: Fri, 13 Sep 2024 15:21:45 +0900
Message-ID: <20240913062145.1885502-2-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20240913062145.1885502-1-ming.qian@nxp.com>
References: <20240913062145.1885502-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10856:EE_
X-MS-Office365-Filtering-Correlation-Id: f0710cc3-04bd-494b-b49a-08dcd3bc6c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TCbGQxrMZkxCimCeFR9xQfiUeBm+AZoOYaMEuBJ2Ybgem1MRnfRhdyG85b4X?=
 =?us-ascii?Q?IR1oypzIHYRapPyrmTf7RyN8CNaqZ7I4k/5ceJEkP8zG21i+IxC4uRkY9SO5?=
 =?us-ascii?Q?33II2KPfV3V+QXN926qLH5+NNqptU+9Wc0hr9eY6F+2Bf0HZcbThCmP7Ky5z?=
 =?us-ascii?Q?ijZkAw8MJhg/2GzzfZI7baWFi5h55oQaw8iQMsTF6+chplJumn6h45gPNKak?=
 =?us-ascii?Q?DK0Mrm81KA4gz4KS0LAsdvaAemettA9JGjYOIaKR+Y2yj4DrYEisgblOsh/8?=
 =?us-ascii?Q?+k5EFfy+cKGNbDnaUDRK8V6ouob8Oh15KSaD91yB6Ateew9L2DYooNtTRULe?=
 =?us-ascii?Q?zGeZT5JXSpAbJULjTpbdkl4XqKpOqS9Zz84PPeEYoknlzKEN0LaR7RXxBsuC?=
 =?us-ascii?Q?IusDiFFtHGsJBB+EFarHotXnuu49zPUMWoBoGjGk24UFc+bG2tP/XU7e3wrm?=
 =?us-ascii?Q?SgM4a5nPllMbNg0Pd1JFUV9uc04Cs5rpQ3oZOKenwDHv4X78SbSH//6PM35j?=
 =?us-ascii?Q?gBdpoOfWW5/sCqwiyTggqiWKcjuDmC+4YzrgO7uThzcWAJKXbWeK7EsfTZ+K?=
 =?us-ascii?Q?tu2ln4NsdCbVpJd5r64oQoycJKboNdoVD6l0TBWav0XhSeBc3usq6p6H/jJQ?=
 =?us-ascii?Q?39jaVsL/IDgLn57nh7vPmGgr8ZbpnpAaksbrR7tTTYvZEobhiQqFJifWopi5?=
 =?us-ascii?Q?jXzXlFHLZ17mRsSMFpErSXILeWhOtG2+SRKP3yx8srwZdw9qVQqhZ+qhcxHg?=
 =?us-ascii?Q?uzKlFppL9GNvva+qrIoIK0WbtW5iJqzyqMMBOj8pXgNSTh3rb2tfMIQZAhkc?=
 =?us-ascii?Q?8mWqcb5/8fczfWKhykT5nxMVbGazYE2gls2t7RKID2CKiW0F8MnTtbB1lx0W?=
 =?us-ascii?Q?cXa1MhcbozrGYnKhzDW3dhnsrhgtsq5eRpc3kERVEiaB4r8/lrbVyAAfswJ6?=
 =?us-ascii?Q?++S3iF/Us6Rs4yKqVet1C7sUnXHXCPjxLH9jHRKgFS/WRhJjFC8uck6ThP4L?=
 =?us-ascii?Q?wNAsYb4gFubin3n7WZPUt4EinWJZmxK7TSikyXJcQd0qPKxY+bO1/+anADAy?=
 =?us-ascii?Q?0pJjtmkPpfyQs5hi+ZnQvwLVFupnPgR/j0Kg3icxQSCNuu+1cXousnk6epie?=
 =?us-ascii?Q?emThAgyLaw6h5CePeWbMxPHK9JEGzhdbJcvbBxXxEKvL74Hb3RjaXUZXO6Wo?=
 =?us-ascii?Q?qSP8rQWHE6pI4Fs8Ec70YPdV7OQ5yjUsBq1qDRl+20A+q6nDsAwXeMNMZ6Bn?=
 =?us-ascii?Q?AbKto8o+pXvWgf1Lmxj6+hxTHb//iWbtLwIyIOnmEuFxMFdu6pQ4uCa0BfkF?=
 =?us-ascii?Q?uXuiYzcfIHMzSFzG9KQk+Vdb8YWLQ70P7SOTECqvtzn3tKp+IlmkDR63WbB+?=
 =?us-ascii?Q?LwLyedGq2gn4blvoRB9aTFF+3zc8L1Yjib/cAaZj0VnasTpjig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3A1mWiOKn1ZM2X8lRkT4PAc0vKRRJo5be2IVESbDTpluDLSiu17fei+I/X3?=
 =?us-ascii?Q?KdY+aFnHR37Ibk14mRtQiA6oUiYCMMvlIJ16DorJmicHILST0+Wsozo4J9l/?=
 =?us-ascii?Q?v8YyJzWtreH1ZfCS+pgF+jvFFlZxKblnufR7et9SmA+oXAkxvPgq7Wvx8gh2?=
 =?us-ascii?Q?mDZB5pyiOAeUZK0Blgnb77qsG4NTJ0Ls3iv5xKeXbsNDPoVycqVwjWCJCJVm?=
 =?us-ascii?Q?2Uakevevy7lrTKR43OGnu8W5tDqWZYQZ7yM7N5fBwWGDqbCqPri9trqORJs5?=
 =?us-ascii?Q?2Z4OHhUwf0eQigiCtn8uchJuONDi8+yKvEnnrlyue2DRf7P0peQ7GKGAdVZY?=
 =?us-ascii?Q?IYRfC+xIVzYHBaSifUEDQk48eCG9CHMTip4Vqe8tjowNuEpJoOvbUQstyaUh?=
 =?us-ascii?Q?vBJZj8Qv2KHShQbWRaUADPbs9KRPkOOY9UpRzNluIwDF0+2j0Fb1ap03aeu7?=
 =?us-ascii?Q?bbUnBXpOVO05voaZAIl5ZAq29qwOW+K5vEWLhdmGDSkInG+2/hSTOE97cSPK?=
 =?us-ascii?Q?JJy9YcR0t6Gv7ImtVrHXnqYIEua+F4finXBXhNVqSic3en/oOqsJ/LvAAIwv?=
 =?us-ascii?Q?be9zOboI0YouCKxnoS87eQb7taJaxpFnAAl78AW7VWLWrhkosNdmlcF6AIcV?=
 =?us-ascii?Q?8cKTiz8d8snFHqcZSYmQeKV+sZ2r+ebWlhj1lAr9OMu14cyUfE6Ea1uY93CU?=
 =?us-ascii?Q?mKaebfP2nVecp1/yNCqulmgUHrsXHlrrwvnSiDa2Zl+ITsxytZdejo/Wqbio?=
 =?us-ascii?Q?cvYK50OG0ciJwZvs5NPHBE3W8XRKHhSNAtjSdkelMdX0bIFiq0DlAWG8WcGl?=
 =?us-ascii?Q?ad9G0ROsjW1d8v1ouD3+RtuJV0VU0UV+aordjNGVDrpTzugIV4RZ9x2u8F9q?=
 =?us-ascii?Q?AcSvZqgeVZ28FV7T3TJTsoq7//dN7QFoMrAuL93Yyg8CgIoBimDSz/YzZSts?=
 =?us-ascii?Q?TlGSCRdWe6pc3gR8+3gKsDohqCRtgHvW+hxkf8YdjSS/z01TZwtaBYG9NEEw?=
 =?us-ascii?Q?mEe8fN+cdA0L8ecQ8SmTci9FVzNchcG6a5zszAZ14ZdL36Yzv4TL2GsZjrYK?=
 =?us-ascii?Q?EHQgkjRrr5I9x23H3dEM7SmAJq1nd2IXjJWINSOymEFETkPkDC0FoPN2HhrQ?=
 =?us-ascii?Q?aWEyRU2wMvS/7hOMKzLev/IVtbU1OqGGTnDWVof2Oa+09ghuZVyWCpScPS9K?=
 =?us-ascii?Q?ysnpgK41FeSVaw2xk8V5TspANfUe86JeFXT061N1PY6bnuQMl4WvIWoXtW6k?=
 =?us-ascii?Q?awc5hGW5Z8TdokQUhmmiuhUF+y6DVMnQDt/os7UYds1K0VV2r0v3Uta8BmXV?=
 =?us-ascii?Q?72ZyfiWi0/CyqDxg/VJM9e77Ja+Ra8XJhSQrQer+2KRR8QLql+3xTRXyr6nE?=
 =?us-ascii?Q?/ckorgDjXN1lwarbiK10Y3zj1oqyFQPVfnBN3adUAAoDZGGQMyn1Hv0ciYJ6?=
 =?us-ascii?Q?MiYvrNAHS9TfchHEYguiDRjDqNY0gBr506WLIGulBN1AW/wiAsk5PZUG9lHE?=
 =?us-ascii?Q?tkeJcIc33jY3kNPap6r2imxZkmoEhZ8Mlqe3LWK+BYEvhJaNw5mbYq97l+F6?=
 =?us-ascii?Q?T98gH13rWYDaiAHM16IyPa/6GpFoIet9/ZouTITK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0710cc3-04bd-494b-b49a-08dcd3bc6c64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:22:20.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eb5ZH8wP7e5KkB6hjsqGOJWTdX+zPgsCAaEa0Ic2r9hWRGK4rzuOug3x2ATk2bENjTcbl1co0ICnUmFDKvpsew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10856

The video drvdata should be set before the video device is registered,
otherwise video_drvdata() may return NULL in the open() file ops, and led
to oops.

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Ming Qian <ming.qian@nxp.com>
Reviewed-by: TaoJiang <tao.jiang_2@nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 83db57bc80b7..f0b1ec79d296 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -841,6 +841,7 @@ int vpu_add_func(struct vpu_dev *vpu, struct vpu_func *func)
 		vfd->fops = vdec_get_fops();
 		vfd->ioctl_ops = vdec_get_ioctl_ops();
 	}
+	video_set_drvdata(vfd, vpu);
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -848,7 +849,6 @@ int vpu_add_func(struct vpu_dev *vpu, struct vpu_func *func)
 		v4l2_m2m_release(func->m2m_dev);
 		return ret;
 	}
-	video_set_drvdata(vfd, vpu);
 	func->vfd = vfd;
 
 	ret = v4l2_m2m_register_media_controller(func->m2m_dev, func->vfd, func->function);
-- 
2.43.0-rc1


