Return-Path: <linux-media+bounces-4831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16E84CE2C
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 16:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBC01C20BDF
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF627FBC7;
	Wed,  7 Feb 2024 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Z/md2VFH"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2109.outbound.protection.outlook.com [40.92.52.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBB1E4BD
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320226; cv=fail; b=HOdm+VtU9eENTivoYY/t7vHcS7T/xYrAJjTonzXjahbTQXRX1AKUh/GD7UAzOOne32MCrLs28JwFqAUGI3nEK7hmTu+SACLR4+0UNnDeWKLm/XoEQiCQIsvUXiWo2q+95mNJtH/RA0dFUFz2lYfCSFtWRL2Fneuvx3Yv2c4eRvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320226; c=relaxed/simple;
	bh=HkDStaRSRjob7ueZRUDgaBDzVkBZTlmQuX5Zb6TwpMI=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RQsZOLrs/LrWZt9g213ZoY3laR13yIEwRONw1WBPB5gfl46RCEfV93bpS+UrsMiqxRwKCKnhRAZwqMrelCPLzNm/CujxAaktthbhL8uYQSeRKFRUpib3Wyi+z92O+57REAf1yKYl/p9XVwILDuMifOPKpwlYlS3sc7FNXgiFv3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Z/md2VFH; arc=fail smtp.client-ip=40.92.52.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obUJG/4NBDS9uNClXgbTRCkmNjRqxEfWaZ9idg1Resxj3NfW85Ys6vr2SInobc/Ju7pqGErgKdGc6udvWaO8ayS7FyVU98oibncPrP0KJ8AaZi8wBE2HETeeyv3gaVqRVIF3cOFb4OTcfTSDQg7jOkcdmZUUnbFMAFV9a3dinOotEDOjT/D5exZQbVUL8nwz8btMbTr81BGNHsm+FgNWKFntBTLipDnXJB8SBc/lYTuNaAotVn7WaEdtkF2NP27xmoqJrOs2F5ejwzNFBslWp54lgcQ19t/G+QLi/ZlsbbEM92vr8gsXPCs/KPC4pDIaZv0F6EnWFgEigyERMxIx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5xmiNwMzuQ0s1yDbsv0KEkypuAOMNHiB+O//iJ6gYk=;
 b=P/VL5N+6O7KW8yV+S/SLlv7N6o+IhH8FNQYeVGDsB6WmLu9ISTcM+U+QGd9O+ksrz3lPmFIkxycgdErvZaOkyBlXRiHStkB0xWfKAwqFekgqETzBHT1GzyQrEdyDTEm5ghRXxqqFHUnCWcRPit8sfCgZqC97y5A/iJtcT9b/NLex/ViO16f2bSUsHNwRfii6Bx+WpSgxYP1+3lkznPoyUp9pu3B0/F4A+vl100YhTwWDqFrDZ5heAQBDMAsmGvmTFFONRUB/Ajwcis5pcBGul0NIW3vc4JgNfxGubKZJhER82RdPMw09A7/LNPeaxtbymBppJmQLPLvwuqLtKLBliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5xmiNwMzuQ0s1yDbsv0KEkypuAOMNHiB+O//iJ6gYk=;
 b=Z/md2VFHxsujYHrkQzpdrCJqAnj69u3m9fLLzDusthon69V/eEnV16TQe6aKCGghY9ftKfNamWbaTF83uAfslHGYXL77NMCL82IYsSQkQJ8ZUK4u0vrh+LZLoa1kA0dxUQ4wFbNCzhweBxgbl6JHv7Gzn3TSmtmtJU6i4eKbT5tyNPzswNnA0zPrWGLLwgG8JPZclPO8OUf5qj/QFfi7vP3HOaEMr7diKoj/B1j1NdyAdjMivyt8c5VNnhGYeAIp9HrmUpGoJL2IYuBfAps2Y/q2DhrLPSr6tplcPcfpWzypZdvg+YvKB+e/7HIP50AQzdhB5q/uZwATv63mfEsnXQ==
Received: from KL1PR06MB6178.apcprd06.prod.outlook.com (2603:1096:820:d8::6)
 by OS8PR06MB7337.apcprd06.prod.outlook.com (2603:1096:604:287::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 15:37:01 +0000
Received: from KL1PR06MB6178.apcprd06.prod.outlook.com
 ([fe80::f116:c835:7a40:f79c]) by KL1PR06MB6178.apcprd06.prod.outlook.com
 ([fe80::f116:c835:7a40:f79c%7]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 15:37:01 +0000
Date: Wed, 7 Feb 2024 23:36:57 +0800
From: Andy Chen <andy.chen88@outlook.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ming Qian <ming.qian@nxp.com>
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: platform: nxp: fix return value check in
 mipi_csis_s_stream()
Message-ID:
 <KL1PR06MB617883F6696C3A07B5B5CEB5E0452@KL1PR06MB6178.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TMN: [6sZSuNgIb/YU1rpt7LRFcGbVKsU6Ky7iONzCc9S0Ah8=]
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To KL1PR06MB6178.apcprd06.prod.outlook.com
 (2603:1096:820:d8::6)
X-Microsoft-Original-Message-ID: <20240207153657.GA3836@ubuntu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6178:EE_|OS8PR06MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 32764868-b695-49ed-8380-08dc27f2a070
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WihZKN6XVlshsbSCF1rmPEdNveh9zo3btGnPn1EpWIi/aMquihQYzGh+sUAn+3hsMXRvKIh25fKh0U8XGet30FYZ7mGK+v1+g3KVHbkqqlTUesgUzCnrEixBAoY2wO/hcTmy2sWBYwzbZ+3Xpo4n/DaAW3ibkXWrSzGslEHPjNSkcPn9gonxVLjEIvht9v9mkJlEJLg2fO1Qikn3iyN+P0io5AEUvYYA1WQ0z9lPAngOyAz6Ukbx9IOoNvUE5cJtmMJgdLzXSX/bzW0MKKHFs46nJXMeE+YNMnzIwmlPUAoJc4GPTjEacFv8ZcPba1ARSglsWj5/KBBi6NXj+Xk7Ojrr30WzCa/dPhVF9+Ybdg4wh8IIoxYvIu16yxuObqM/nnzTxuTPV5buWA+8+w0iYv82SNkuPtaryDp/YYz/A2ftq8j4s4mgsfxd4M6y2oWl8DL6cU7JzNRtJSr2nrkDEpydWcfi7QW25xZqJEnRjWuKhHQ0JFMbKcLTvxixWQNHywjw+kfE26Q0WiqftD0BtpaF68f0qBIWCdO/Ls5X9/Z/y0RfdE2Taq5DjSscibgD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fivTBbBM+i5yfTaVpfUz5t661dyyzWYu3NoZZMSLDSZEqNJlIGjAFDmI5Gik?=
 =?us-ascii?Q?/kRyQ891vnF5CsCbawFdeh2FZtOAh5SdmBxC2szTE/qzepW7EA8y0lrs6LLe?=
 =?us-ascii?Q?oyjD/akcHYgYjJ6XZx45/c8bOlxEl8ppIVRufDybouwSigQu8kUQzqPJ3GBL?=
 =?us-ascii?Q?ySEexH7HJborYq5nhXKDxradqH5Wewp0QN9M3S0DOB4n2YYQHd/g5ZxQBOze?=
 =?us-ascii?Q?O3u39bzerQecLCFBdzefxkbUBTMy+9rbuN7Bgp/ERD1ojm5hoGyw41AnOqLG?=
 =?us-ascii?Q?vu1qgntMxzfAUDEIGyA4igt16jX3TiDQ9R3nJeOMRQY57+0ZPRnW+hSXbSeU?=
 =?us-ascii?Q?nnr1VCXSxG2H2qGHFqrCGU2GvqY8lDU9ovbkg1u2FByI0Bjx9oL/u7GF6Ccz?=
 =?us-ascii?Q?iQUpAulP4DGWiyI/grOku3dN+sqeb2jXMiit2DbLL5wpxfAFdl72VEG/5Ue5?=
 =?us-ascii?Q?2hmELBHgN28zVxQdM3swD2MuomR8ioI38I23knsra6Mi9Z+6Rd0HkuhhCWlz?=
 =?us-ascii?Q?h9Bnimcbv8AVKP89j/eRhJoFpoIKTJJRKXOPVBKYbEH1Av0w4iVixG0zi7Ng?=
 =?us-ascii?Q?H9ROJGY43EhmTaYFK0HziFQ+W7BRSIhtueAgqk65NYqqCzFvi5Udycm3ys/O?=
 =?us-ascii?Q?jQg7zp2QhlMvYVX7wftPV4flUhRTIppWJgvM/qfKznGLrAQcMMQ6NUIcP/Em?=
 =?us-ascii?Q?GbSrEg4mSboa/V64hzh1w09n+KJTp5eUmwQ0i3NPeuLQy+QFpojIEtfBsZ5U?=
 =?us-ascii?Q?W9m9+GOlZgR5cb5HTxM0qjU/EltbszBfjIuaVkl0/KPZij4uRQvX5T3oJ7BM?=
 =?us-ascii?Q?BYaAI4DR7BaSuz3lXIIH6AyfZNq+1PlBEKAF4QWe0SSONwnzEQMgeW8tWS+V?=
 =?us-ascii?Q?xPlSA/wa+7J66Of+sIw+yCxQjy1AUzoLPaHU89vQTLoHmDf1Wt2+bHpPVr68?=
 =?us-ascii?Q?EQLBfN+RWN/yIoyWjOHxUkTvqGVUbp4eIdnhV7iVfHUk7WEt+W0oh0wUyQoT?=
 =?us-ascii?Q?hugZuIpQHhGRvHVA+dYVim4MGSk0m/Hwn7EbFlwCiZimYjwBE3yIdJ/4tPKX?=
 =?us-ascii?Q?gXqY1ToONuWs13susA+YtQzpkuol0JNKBOC5O6z18PPY21xfnztzphCEfHAu?=
 =?us-ascii?Q?js5aYu9c88HeAeAT4tRv0ET4xqPqSDHaPVsGrdyvQEes/0+4OMh0NqSVPFnt?=
 =?us-ascii?Q?3qVeAik0gx9SQxH7kgh6Wz8S8nyD24t2hembPHYWqDMx1S7Ni/dZUSSRUO4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32764868-b695-49ed-8380-08dc27f2a070
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 15:37:00.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7337

Hi,

find_csis_format() may return NULL, and we should determine its return value
to prevent a fatal error when later functions use it.

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index db8ff5f5c4d3..ac867620e2ba 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -956,6 +956,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
+	if (!csis_fmt)
+		return -EPIPE;
 
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)

This is my first patch, any suggestions are welcome, thanks!

Regards,

Andy Chen

