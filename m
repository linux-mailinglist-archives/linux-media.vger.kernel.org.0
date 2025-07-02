Return-Path: <linux-media+bounces-36532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DAAF1302
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BEB3A3E69
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC811269880;
	Wed,  2 Jul 2025 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NrA6v1Lf"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16325523C;
	Wed,  2 Jul 2025 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454013; cv=fail; b=FEmV7dzHmkC/N9oRTGoJnWSgky1loi/3ij7wI8c6IPqroTh6QllVBmtf2nDldBqmyDzMxeqajIByItc3LauhfQ8Bt/PB8fZvQu0d6IfmL9uZadxgaFILaxhJCR8QR6Hoca/IgqiJouJLMcC9L7dkKReZ6FQJE0Ja3M5CzJoYOI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454013; c=relaxed/simple;
	bh=wE/rZyxZUNuzCDeOCQTT64rFWdHMt7tJHeVEavsNuuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFXQL+2yy0PtK6Q8SMrvpgzG8jUxy+ueMyEdjVLoDtpQZnETanXhZqwXZFd109mCta8rFS+0XyOV5qkvj/NC0kDcLnuNBU8J6K8ZEzl1Onh64rtDr7fidPGhRT/rHk38eCXHxHLtfiYfU3KuwtFPSdqAxUEVyJd56JFBBVw4AtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NrA6v1Lf; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5GRYuyVHUxW74lqlrd4WVYuDbSU3LInRMDbAqEvOYyCaEkFKHSehJJsdVQbsl65tbeqLd/bvPegVMWWsqM/6o7+hH+Fxx4elkzpboh9Dhof/lTqCzjTxDKKj+2Z3cke///QoShnolINMvrDVYv5mfHRzl4eDf3UxcA/38s5ndhlIhqAVoNkE0KK/Y1zabLeegiWRt+0Q/TyoUeCkNRkgJhSt3I9p7VeHbRRmBQI6B70f8SbFSgsyi4mf0E8uxWXSCy0X0ivkTg+MaJGpjr/s3j0iQU36+IUkgNWozE8KiUKcu5ghByw5dg7LKlahBBz8V7K9cnMbJlEAzxurPPFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJa5NFWO9AUJOy6LGENilO2nrVdxIkLW3KrikaEwpg8=;
 b=TrJm+HFiXI1jRjgv1q+Frh0cTuj1FZbhZ8J38OJh3eMgWKEaMClSXaukm/sFbdL2A9NcysS+FgHNKMUnJvzkO86Gny2cKek4u9ePOj0Ky7sTDIioxdx2oDQJW+rmRB7KZibl5GsLbQ40sUE0ttSxWsqMyd86Snn+v+BrrOI0t2sJNsqBmirbaxFozN1+OdLwykYA4lhuQtEONh1J1QuQb7Qdqc8NICzFtRVylXiiXKGp7Z6MuIH4DLsG0CSRMneB4CugJoqXRrp5joJg8UYggxA5zlDN5sTX6wnzywjviMBylXoUROkk6s6w6t9bzLddIQ09vsxRU2NFSbfowyaX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJa5NFWO9AUJOy6LGENilO2nrVdxIkLW3KrikaEwpg8=;
 b=NrA6v1LfeYzbd8+5xYQfTCvLGNxJpqNZJP0E27h+2MiiewO46R8trp8pBldTeo3DHdq4AF2V8MZEHYZVNSmtaFDUskvUtR8oKeveQUkU/J+IdaWO5QYnl6p47GJkqDB3+3o6ocATf/jtHowzkQkFK6fA3QxPq+0wVsrBBHWMuK/Fu7iLOwXvtUGehMHKlY6r+iQzJaDg4iUxt11t3qEpTzIrEesuUjPnH1hpLipgMr0nvAXTDN3IL/0WEsl61rddrblHnqq/WfZ+enG6lFtx9QSjNUAi89tHKCgI/m0gt+NV40g9wZkcLzcnbEI7ff69FODoFFDcYFqi19krtQsx6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:00:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:00:08 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 3/3] media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Wed,  2 Jul 2025 19:02:22 +0800
Message-Id: <20250702110222.3926355-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702110222.3926355-1-xu.yang_2@nxp.com>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: c83d5ce2-c1e6-4532-23d3-08ddb9579b81
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?t322hwP76nfbZ5gxxQpqDylGFJHtmb2Nh5h8HaImaZvI9s00YKR8uuvYLYMn?=
 =?us-ascii?Q?S0L1CMXeX5u0fFtGC8iuWN/4PkLQXFk6tpXVcI1khTuD3hzrzfGBQzWBwIWs?=
 =?us-ascii?Q?o2CGj5sinj/MaOmdFcdEnLQtA2sIXVTNxlYOsB1aS1uRZ5iaHjgMfylrGU0k?=
 =?us-ascii?Q?PtXnQ0no6MobvJEov8/zL6k4jz8+Ja5VJOQlvrRDgErxGXZo0xk5MOd6MCUm?=
 =?us-ascii?Q?4WXr1B1AKoYw4HlZnZkLIsDELS8YraigxlKCcfQ1S2l/7MQUTJqRqOYFFKSn?=
 =?us-ascii?Q?9p9/OyWB7V8whDk+sdWGqB+1Rg4nEJLHar4TLeS1DuyGx0Y0RiaY/gtKOV+J?=
 =?us-ascii?Q?bVKGtYbFhDH0fHDRZoXdkxdagySwIuCS/Vz/ePqaiGPI1OgsXoWaeIM/hiXP?=
 =?us-ascii?Q?kDUXsjJb3N0L80KjyLtgi7QNl8dz2lakQu5O6WRGgOunccQDDDRyCXU3byjf?=
 =?us-ascii?Q?FeGvOOxhqZwjVL5OghVApYbg/+TsG20DQyMOptUggp2663fcQuw35F13hMOz?=
 =?us-ascii?Q?KgqBbRroWE+h3CSQ8RzYdW7ySBy1Y6GHEzOP1IBUA/ABa96zPqy+0hxI/Yew?=
 =?us-ascii?Q?ZI6UnY/ZhWu2o2XQOVvd1/3t/ANyICcwuaWm5zy1jjA7xx8Xu/z5MYa2Ti5/?=
 =?us-ascii?Q?kkWhW0poix5tFjDpyCKvTr6rTvieALoZwcL6LSg3xZ3rMPvAO7QtGOguC8Cj?=
 =?us-ascii?Q?hfQI3Pm0zgweFlDDWDbqle1fXteuo9nOfCIwEDqovXFQXdgwK95mJiheEMJA?=
 =?us-ascii?Q?w70kexLguJNYRS2hLJ0D8R/PDP9tlSoFWsF3BFS0sVQJKsbQpe/1aPMXxM6m?=
 =?us-ascii?Q?Fcut667Dx5XfF3fd+nSvUn8Ukxe0DKRHR7gIJGY5rpZD4wOQ2xOe6BNqfDwa?=
 =?us-ascii?Q?zO7mA2o30bImFfxCzeD/5idrus75aX/q1rsIgiDX5N08T8mbcUuP+OHQhTlx?=
 =?us-ascii?Q?IkmJudH6hFj8trM2MRZ2IWHiGSzwOLW1G0u8ONseOtJJkiUSyF/C0N3YkJI8?=
 =?us-ascii?Q?r0i+aOfXzxt8EyAULo2IL2xl4fsws+FAzJ1r8I9KiR+yo+PlwJYj1RFY0M9P?=
 =?us-ascii?Q?WJsi9RQnkzEdzSUK4lmmUX/Tol9qe59RJXw3zsi43GX3az/JQQ7XihMbi/wZ?=
 =?us-ascii?Q?oRWr3cgHM4dXWZVlwX8p8Jx1H0mXNkuy1JmDj7Z2u90U6QYyz1NkKIB0jJJq?=
 =?us-ascii?Q?OcD357lSCkNTijgyNdxoSZ35FgiGgL9k5m42FXGciX/LifmQYC5yJV4BYpR0?=
 =?us-ascii?Q?7vlsr2w8SLAakMyoKkfzDOkBsKsHxvXQLe4i07ezw0ndDVCkEoq2LUtNT4YU?=
 =?us-ascii?Q?mQxWSOxnq9nAw6mFyAKk7gnH0g2fakgcMzwRZK7bgbzWfQEO589f8aOHxx8o?=
 =?us-ascii?Q?zA0iioTwTJd00lU+050FpXh2G27Q61o/E8YqOqhzA2cz4MmSF9sz0GKaxOlh?=
 =?us-ascii?Q?IwJEjtU/D19uFBss4ppt5DMmh1zEfE0We+IC3JcFKJp055uahpRE72xJpc1i?=
 =?us-ascii?Q?Nkroc3A+iEIjzcA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?SSeABD97VRXKAeeLRXjNTZw3Ct2bVBa3ev0L9wtSV3GIEbvs0nUtRvXfHFlc?=
 =?us-ascii?Q?VfPquE+LapZ7mM60UruVwaXjASbc0m1B614wQoTPjzORGLL/29A/sm+Jh+4B?=
 =?us-ascii?Q?To0XF0YdSeEQC51+/7bq62GttIZHzOUcwMM9Cjd+UelFKudp1qFvsjsBIXui?=
 =?us-ascii?Q?BwC6zMYIUYC2hea4brtaORBfW1fvpukilpqtF63Pjzr/uBTBhrKdIZLLLHww?=
 =?us-ascii?Q?X/+Dylqh3ecQug+5KjYPeymYloKYtlfUcCfzKhHkOwcmk0xMscMnVnkxrC4a?=
 =?us-ascii?Q?AOIwqUOtHfY8XGu1cOSrnZFdCpE2epAObTfZALmIR8/LvvhY/eW8Xq2dPCsM?=
 =?us-ascii?Q?pUMrYYUHf2n7gJQ0YGroeHlJqhGT2vEnwF7nvWDQxUtRuYGuhM6YKWFYw3ri?=
 =?us-ascii?Q?8OsXdL6wrFfMu3jJnSUthIrryrhmbhWbLPfMA0Ag8iCUpeP4xdH5LU1BX5sF?=
 =?us-ascii?Q?Fo8mYhtKY91a9tatHEWlRnZlDIftp8XILueWLOEX6jSbhnwKBMOUE3VbpbPl?=
 =?us-ascii?Q?KctCZ03epyedBonXpc3bktFceg4Wx16UxPETsWM0PfVNpfiA470h90xfd7Mw?=
 =?us-ascii?Q?m6JhmIC7lIIhdPIkS9eYodKVULKBE2lfpicOggIG3wSu5ujmnxRjnaM8JxoL?=
 =?us-ascii?Q?DjTBcv0pUX9EZRMziqE7btYE9kwfGg3Xm4AmBKrXYdgkTsub5BCDwoH9kM0G?=
 =?us-ascii?Q?W2LEIY2yH359sPH+9Qlj7CtQbasZC9hvzeFqRQHZHe30tXRXuHSLrdaQB1Ak?=
 =?us-ascii?Q?NJ5utcMiU+SkyMYHAHVKHHN+ggoiyE5JovLBxf9MbtSHrEHVXOEzvp3fWA6i?=
 =?us-ascii?Q?FAf4fUr+/3jY77Z7FkNRvbXgAK3lbFySAzFjDB+oVNwWIhEkWZ87OpPscCkj?=
 =?us-ascii?Q?PmVYSX72vDfX7EQLCBhLMDv76Btugjls+tDZu+8Gpr/iJapQxi86exKAaANR?=
 =?us-ascii?Q?FcSAWSAILi76n+7u3M5bxJ6bcvM3mnap6YSWfd0QQnxAxJu9axh6Mi8pVfzE?=
 =?us-ascii?Q?h5IP9ZsXHHUlW3sljfcFjqOenoxvggW5MpxIO3Pmq6EVuf/B00d+Vo9DdMp1?=
 =?us-ascii?Q?jgGrvByhk4RemkYo+CnBliCbhh/HqjBcLyZGhAczlAWux9MESiCJf0DlFl6/?=
 =?us-ascii?Q?RI96NcPBRPcRWZAC0IlfB4CZ7FyiirRvEnbfKfjPDS1xY0PEBiZ0WkaRZdkn?=
 =?us-ascii?Q?G21WClyph+DquIejjpqllXqG/geDYhGWUHVPRhox2JX+fcRd/+IyshIKAk0Y?=
 =?us-ascii?Q?f9V6vaeUY4Ku5SiSGfLLa5LKQQaDMMuRd3fJ3aeSkmrK3PrhHBjUaUnV86Ss?=
 =?us-ascii?Q?oazQq6Se0rQCrjK60HGYy2QqG6EoMKM4d2qMMEDxOUU2Ij74D3/YwgM2UTp/?=
 =?us-ascii?Q?/FjFfwSIiwUUbluPtGWffwerPCaIBEXaohhwQCAiOW3d8ZxvSM/1BuXrEzyv?=
 =?us-ascii?Q?nlVdmbRyVPJ/LjlJ8jOCUVTpyD7qTGft/F8T9nA2ZeF3Idc30cKHJHW8NQnr?=
 =?us-ascii?Q?FAkPxu7ps7mpZAnzAXaAeAmdDGNsY4yC7mA2zZmlDyxlqfR3cXTE+aTN6F11?=
 =?us-ascii?Q?SZwVH2EYVKELYZ8+fOUpOh08Zite4k3lvvjhRneQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83d5ce2-c1e6-4532-23d3-08ddb9579b81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:00:08.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrthMtGhfot0NjKFC6vTFSoQujsU26Qk+Cfs1Ab+DW/8lHEdE30cdepRxg50My5/OUEzGn+QH4qmOw9IrTN5fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

This will use USB noncoherent API to alloc/free urb buffers, then
stk1160 driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |  4 ---
 drivers/media/usb/stk1160/stk1160-video.c | 43 ++++++-----------------
 drivers/media/usb/stk1160/stk1160.h       |  7 ----
 3 files changed, 11 insertions(+), 43 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 5ba3d9c4b3fb..715ce1dcb304 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,10 +232,6 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
-		struct stk1160_urb *stk_urb = &dev->isoc_ctl.urb_ctl[i];
-
-		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt,
-					    DMA_FROM_DEVICE);
 		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 9cbd957ecc90..416cb74377eb 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -298,9 +298,7 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
 static void stk1160_isoc_irq(struct urb *urb)
 {
 	int i, rc;
-	struct stk1160_urb *stk_urb = urb->context;
-	struct stk1160 *dev = stk_urb->dev;
-	struct device *dma_dev = stk1160_get_dmadev(dev);
+	struct stk1160 *dev = urb->context;
 
 	switch (urb->status) {
 	case 0:
@@ -315,10 +313,6 @@ static void stk1160_isoc_irq(struct urb *urb)
 		return;
 	}
 
-	invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
-				     urb->transfer_buffer_length);
-	dma_sync_sgtable_for_cpu(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
-
 	stk1160_process_isoc(dev, urb);
 
 	/* Reset urb buffers */
@@ -327,7 +321,6 @@ static void stk1160_isoc_irq(struct urb *urb)
 		urb->iso_frame_desc[i].actual_length = 0;
 	}
 
-	dma_sync_sgtable_for_device(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
 	rc = usb_submit_urb(urb, GFP_ATOMIC);
 	if (rc)
 		stk1160_err("urb re-submit failed (%d)\n", rc);
@@ -365,11 +358,9 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 
 static void stk_free_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb)
 {
-	struct device *dma_dev = stk1160_get_dmadev(dev);
-
-	dma_vunmap_noncontiguous(dma_dev, stk_urb->transfer_buffer);
-	dma_free_noncontiguous(dma_dev, stk_urb->urb->transfer_buffer_length,
-			       stk_urb->sgt, DMA_FROM_DEVICE);
+	usb_free_noncoherent(dev->udev, stk_urb->urb->transfer_buffer_length,
+			     stk_urb->transfer_buffer, DMA_FROM_DEVICE,
+			     stk_urb->sgt);
 	usb_free_urb(stk_urb->urb);
 
 	stk_urb->transfer_buffer = NULL;
@@ -410,32 +401,19 @@ void stk1160_uninit_isoc(struct stk1160 *dev)
 static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
 			    int sb_size, int max_packets)
 {
-	struct device *dma_dev = stk1160_get_dmadev(dev);
-
 	stk_urb->urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 	if (!stk_urb->urb)
 		return -ENOMEM;
-	stk_urb->sgt = dma_alloc_noncontiguous(dma_dev, sb_size,
-					       DMA_FROM_DEVICE, GFP_KERNEL, 0);
-
-	/*
-	 * If the buffer allocation failed, we exit but return 0 since
-	 * we allow the driver working with less buffers
-	 */
-	if (!stk_urb->sgt)
-		goto free_urb;
 
-	stk_urb->transfer_buffer = dma_vmap_noncontiguous(dma_dev, sb_size,
-							  stk_urb->sgt);
+	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
+							 GFP_KERNEL, &stk_urb->dma,
+							 DMA_FROM_DEVICE, &stk_urb->sgt);
 	if (!stk_urb->transfer_buffer)
-		goto free_sgt;
+		goto free_urb;
 
-	stk_urb->dma = stk_urb->sgt->sgl->dma_address;
 	stk_urb->dev = dev;
 	return 0;
-free_sgt:
-	dma_free_noncontiguous(dma_dev, sb_size, stk_urb->sgt, DMA_FROM_DEVICE);
-	stk_urb->sgt = NULL;
+
 free_urb:
 	usb_free_urb(stk_urb->urb);
 	stk_urb->urb = NULL;
@@ -494,12 +472,13 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
-		urb->context = &dev->isoc_ctl.urb_ctl[i];
+		urb->context = dev;
 		urb->interval = 1;
 		urb->start_frame = 0;
 		urb->number_of_packets = max_packets;
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = dev->isoc_ctl.urb_ctl[i].dma;
+		urb->sgt = dev->isoc_ctl.urb_ctl[i].sgt;
 
 		k = 0;
 		for (j = 0; j < max_packets; j++) {
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index 7b498d14ed7a..4cbcb0a03bab 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -16,8 +16,6 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
 
 #define STK1160_VERSION		"0.9.5"
 #define STK1160_VERSION_NUM	0x000905
@@ -195,8 +193,3 @@ void stk1160_select_input(struct stk1160 *dev);
 
 /* Provided by stk1160-ac97.c */
 void stk1160_ac97_setup(struct stk1160 *dev);
-
-static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
-{
-	return bus_to_hcd(dev->udev->bus)->self.sysdev;
-}
-- 
2.34.1


