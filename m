Return-Path: <linux-media+bounces-15326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B026393BC61
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 08:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F1B1F23A8E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 06:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1023916E865;
	Thu, 25 Jul 2024 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OWSlmXt/"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021094.outbound.protection.outlook.com [40.107.42.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884C29CA;
	Thu, 25 Jul 2024 06:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887865; cv=fail; b=Z9iM3VM6OpIYZoBNc52e2xR3UW7yjkvZI/nOTocNs0VAIQs8hW/PrXa3G6ItdOadco4sJ+wZdnHSQYmCX/bSKzbm/IWEi4eqtJtMoHLWT6c/08bwobRUcCQyo+9uudDhd8HzaAVNYa3tMElqGPk6bO0bBaFTvqbvlEJmDB4EDHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887865; c=relaxed/simple;
	bh=abz71ql46959hQU0JZHgqC5ZFnnIwls9U6WTjFtR4Iw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nRg9qwaM1/D1e+WfUpK87VVMhBiDJcsdYUPjLDzfPO3HP5EJLCflM2kTVJtqWIeWhgRJu4zQKG+UWdViLb/4gXH3xlhVq4yrfsQQ1d6LmkJcx0DaeBqXIus99+p4MMLZ1a/EhK7jK2nopLMozsWw2jAGNXh1bWELDTppiT+Or44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OWSlmXt/; arc=fail smtp.client-ip=40.107.42.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBZSSIEzzOeUe8m3rO+81m5IMFWelblDnyHDAI4zliu7fnjY6IiZcOF3/7hCDrEldPkcXLq9I2+jadKMPUyCXIDjElZH9MpktXNpa93a4rc8UsQinitDl91YlbAJ8a4V9ED6iKNxhQPIAAkSy4ud5Ph7XYKTpPzb7h8sEuWJ+PUcwDTdJ/Q6rICPivMwAs2aexSzPsbhvLLyqC9S2oZ3KW5RUv9y3kezrw2dFUzAN8ysKDkieJgRr4Y7AjvpMmdBo4feZOO+B4YObY7PdTUOSXm5KcbicazsKbSvjZlzpwzNfOJhrA2gtaJV7lVGLv4VPu56ytvYFZ7ZAb33aJfsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVUszj1XsZEMnq3NzQQmMJxnGbb0VEEP+udD6nRSK30=;
 b=E0LNBJf9MJU7GiUjf2GMtXoMplSkxeskcHu4GQ+V1GS+WGvNtPKLJPwnwsA7EbCi2DBE1l9vd1OxzcOrWvOBxm2uMeBd/lE8o9qHSjNO9y9poEF2jVKWEmCDgfMmfeYtuMAmo7Pkc9meGYvY4hlACU3UQz2loxEpQDcRwoJh8cZBE5ZYYymgF7uDoVRzU5n1zrTEytN1CNjy5JFUrE9LcYdFiw5l2LzRHzPsPyFT91eXvRlpyGDYO6fo9HJdwVQUXMrUInLM7s30qaI/s873KTacdW4IdrxV1GaJeQnD853spqYdYT1YWj4SgqMx6ucN27Fg990vUpuc8SmQaBTEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVUszj1XsZEMnq3NzQQmMJxnGbb0VEEP+udD6nRSK30=;
 b=OWSlmXt/T5D1Jkj9yp4SchNmRHssgf+eoTs+SqOAl7ygCArm43OuZaoZiHMQdvAanhH+gkZBi5p8oKcmsAkEmJft4dAkqxOs21YFmAWqDHf5/VsmGJD7Xdc7pEFyEVxfXpzfihkLou/deI6aaqsf5hLwLvbhmCCx+dhUtaJWVY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1880.KORP216.PROD.OUTLOOK.COM (2603:1096:301:d9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Thu, 25 Jul 2024 06:10:59 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:10:59 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RESEND v3 2/3] media: qcom: venus: Fix uninitialized variable warning
Date: Thu, 25 Jul 2024 15:10:33 +0900
Message-Id: <20240725061034.461-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240725061034.461-1-nas.chung@chipsnmedia.com>
References: <20240725061034.461-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0009.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::15) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: af3d1f3c-97ee-4a35-5d03-08dcac708d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?En9jzlHud8Uvm4DLBhOIr/+Vqz1cLatMloFiWAfc4wl7dd2Z4GlUrb+GQre3?=
 =?us-ascii?Q?sOacvp8xmzafbitJNENyZ5n/qC0pe/w8MHyRXMIwaiFlJPfbfVSntnZz0f9O?=
 =?us-ascii?Q?3A60zxpTKtkQTtaPRX8Lxs1/EV/yteFfJM6pgF32rKQpPkm/MTZg6rAkUTL4?=
 =?us-ascii?Q?mByCxT+1y0vdcbqsRfPoL65UlNfsMgj95G0b1hobyvMz1in27QkHIfRzO6q/?=
 =?us-ascii?Q?pBKspBJ8d2QQvPrK791/4M27Amntaai6clKNgpwyx98GJHiub7cZ5G+uH9PE?=
 =?us-ascii?Q?jKQNyEgfFMIJ/sox9k513L8fKiqrHZ+1l98v76+aqCmtwkgXdnD4k3h3KmgJ?=
 =?us-ascii?Q?1nuq6rPBgDx7v+XoXsUMyscv98flxUBBEDET8FUCPUv6iPs5GMu3KdTnDEoN?=
 =?us-ascii?Q?/9CdPGBTsgUKblUxQdm29Qo4Kj/9KyinLEsKzHvdjLCOVE4LnHd+4/1dsOWd?=
 =?us-ascii?Q?0VJBoHEl9Wnw9Ko0BEJpHiFnqA2RF5A4r/krAyykgAYthmVqX72saFsAVtDP?=
 =?us-ascii?Q?yCAGCRkC8ARrEub+g2joTXMh5ScsCr0+cr/YdEoaj43nsLqMwpn5mc9g5fAD?=
 =?us-ascii?Q?TdSnOEQAt5UxxwwJpIqy7F5H8FvKV2VOy9MdRG7lWtAeiAphUC6f0xUqnKy8?=
 =?us-ascii?Q?uGV5N/fOUk86OTRcgfSui2m7KUrC+ve3cS/MnTsXDmxliS7E4+X7zDPXtT5C?=
 =?us-ascii?Q?zxN88rVKdX/Kbo9RSL4CFYHcPO7c5SjEzC/wXmuyYLXVXOVySzl1A7bVLutg?=
 =?us-ascii?Q?vpGCddpZavMRPWEHoB5+FQO0mZm/Whbre/BS13KXuTwk/iXGAsdQ8uZOs1lt?=
 =?us-ascii?Q?7ThTs6J8BQkBpn5fsu43MkmUrMm6pQVhh4y5FdvpR8Ke4rGmD7VYsiFB17fg?=
 =?us-ascii?Q?kBe2D2fyRNiqsy2LhIHQqaLt7mimOGm/3V0I4dWacQTJS836Y2txjJJxatFO?=
 =?us-ascii?Q?2IyRb8B1E2iBuP7TcIoli5LGXrpzj/qt6ZYLveD2DMej1lqmvBdWy4kE8V1g?=
 =?us-ascii?Q?djYQ2uB8grudjRzjfIyNCdF7fuYg5lcqMD6yPq8H8ZLG6S+ogVh8EPN70+0i?=
 =?us-ascii?Q?kq7Tb+5OGuuT4EXxHoz99YznNquluCudzu/Rv7XWBmP2TG9taKEcInbd81rC?=
 =?us-ascii?Q?AGPaRzLtTHfsaaTXhJco/b9RQNQZlU8BSre/2nHQdFKRjZDyKCvISG5NCtHL?=
 =?us-ascii?Q?NKguvi2/s3C9G7rWy8KFyqtlbcyTB7Nwm+E9F7wYWF/nNepnKp5036ORl+gk?=
 =?us-ascii?Q?TaRLWwdYlmYCo5TcICotqPnkTBcmVxF/lwDoZa68cy0pDAz5kf/GMIZNBGoo?=
 =?us-ascii?Q?blh3InpLbOxwb6XtZYPA49F/qXGnMZrGwbnISm7/+/SSLI3XSDktWEqbaDt7?=
 =?us-ascii?Q?rX4XyKpWm1FVElJS0NP9OfJ0NWU/Ie+WW2ecc6YORMpbJG+zYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fgh43VHxqY+u1S7KS+maKONxSwGHbaP5EklpAEKcCxW8QtmZ/mYEJmMlyvrO?=
 =?us-ascii?Q?zaLWiLc/jzei5YCOiEeWMuT+UkgH9j/Rf42pEw3457me1hy/dA/zoAhpPLRF?=
 =?us-ascii?Q?QtPkUjKkpYWUY74goNfocXksv2Dkkj8DnPQeVKHwvOMjXvRDZaNmkXDh1oQf?=
 =?us-ascii?Q?/WA87jdSH5FsUYx72XK/naf2QkCKaHzX8uEGQTe3sDHF3nJZ4qLkPmhl+1eZ?=
 =?us-ascii?Q?+BK2+wuwBOPArwr48iooq4824rWaQeUBTb3IU5GVmH/J7qR9thV2IDdM49Yh?=
 =?us-ascii?Q?vR4uZpTpNLHPEZXDgV57e+YBdDSWlB8VHlphl0YEvSMaE9dTw8fUvtFJE+0Y?=
 =?us-ascii?Q?qwCMzrsTqqkZ6IXNVkEJhVBYUkUkoceJYck//78OzfQ0sXR2FiGcNbkYfegl?=
 =?us-ascii?Q?XpUJd+qwVcdB1cUGsMAIcdHxv2VIatH0Kc6lodQjlC9BF98AxAcv7gMLnLiz?=
 =?us-ascii?Q?b5fR84XMAz1gj6uQdkTtDvqH4i4VR+Izr4604+WAeJRhB9SelpIXpvP3fvc2?=
 =?us-ascii?Q?LdcJwBpww8jAINheTmGYE62KLaH7mpZHyh4lQsNO9ShjW18ivJ4Bvj8RotdX?=
 =?us-ascii?Q?DP1VrTndRzXfR+3QNmLk3x4buWJmK2unzThmUB/Qmoa6PW6PbCeO37SmhMRW?=
 =?us-ascii?Q?O+XCcFSY/nMJX8+840TV0OzMi8cinDLDRsC04ROGz32olfmpNMfL7yJAKk4p?=
 =?us-ascii?Q?OnmanSkf5SE+ZV36+9SLdmgL8tJhE/TbcNRgPsam29gIossFWGHMs25ptzqn?=
 =?us-ascii?Q?MWRWRsADlrojm/U80L4w7EoREa4145G8b44om723OtkE482CqS+GM+KFwEDY?=
 =?us-ascii?Q?69tTilyFDUDdrLAsobnmm1vKrvzMMcUjS6jZ/YENUDA5qWP5ttEA/RvJ/yxE?=
 =?us-ascii?Q?oJ6i9GXEXE9PlM7V5mspT6BLk4vDOBow0que0tyAN56K6wYvhPCcPB8+K3DA?=
 =?us-ascii?Q?nwaZpvGy+L1qORcnwpfcksp6Ndpm7ob/04uxts2hmjqZW7g9bc+GNMp0f++d?=
 =?us-ascii?Q?pQxPpLNxVwlEcAd1zhCTPg4qP02HcT+wWucaeB4x6282zGUEnS2OjK+LcscJ?=
 =?us-ascii?Q?Lhzf02tOe+O5krqxWv+XV5qpibw8hjhCyILSzSfb4aNAEFdNssp/54bNaIRF?=
 =?us-ascii?Q?P4xgfa4i663uaPDAidmW19Zfxk5H/7MblaDxQd2eQzfLEyA9liHk2yBvog+c?=
 =?us-ascii?Q?p4A5P0utqqWjnMUmcF8/bJHZ963Lh+kAbWPtXpkFTUpm6vnD/yrclXjDx7x2?=
 =?us-ascii?Q?AQ/9XMIxfodFKDIDKCqvD4oXQzn7lQegZB9Wr8Pp/TIK7MJf9U14m0c+K3Du?=
 =?us-ascii?Q?KJi/QjNP8/hZ0QV15mVo3Ghh0dYetMF4u9MHjb+t+cBXpVUYsWfXmY7vxOLm?=
 =?us-ascii?Q?mSvzZTDMzD95C/IdE38ueLCWs0nyz7AZJ6EaZ1OQgPebZq7R2cTiTkYR5cyI?=
 =?us-ascii?Q?IMyk6Li55FK0Hu1PivCDndR3uMBg2WhQiSf+EAxy/iKoQrgzNQfRFxjBPLZo?=
 =?us-ascii?Q?bAzKdPXVnbwN3TzJ6JilaMi+5irClzPoKhVcIEdbWOfrwdL0Hg098Sp0EjBS?=
 =?us-ascii?Q?VdahFfaRzk5CBTc+w+Eh/aAjf8EpZFmTYDPMfMv8RDsI/E9h9DRxuGpjBLpa?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3d1f3c-97ee-4a35-5d03-08dcac708d9b
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:10:59.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELxYxkYE/KvJjrPCjdjLV+UNxyVjBd7w69beBz6UnORUPzQk7I54GtLxu9OONPd/e5vCGpwbCkfVxsC8Cv61tOw2HKKu8FYEGWofdVd1osg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1880

Avoid uninitialized variable when both V4L2_TYPE_IS_OUTPUT() and
V4L2_TYPE_IS_CAPTURE() return false.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d12089370d91..b72b579018e3 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -161,7 +161,7 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
 
 		if (V4L2_TYPE_IS_OUTPUT(type)) {
 			valid = venus_helper_check_codec(inst, fmt[i].pixfmt);
-		} else if (V4L2_TYPE_IS_CAPTURE(type)) {
+		} else {
 			valid = venus_helper_check_format(inst, fmt[i].pixfmt);
 
 			if (fmt[i].pixfmt == V4L2_PIX_FMT_QC10C &&
-- 
2.25.1


