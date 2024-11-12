Return-Path: <linux-media+bounces-21279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1B9C4C83
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 03:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38595B270DA
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 02:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7340F20ADF2;
	Tue, 12 Nov 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iRRQxQ8O"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021085.outbound.protection.outlook.com [40.107.42.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374DA20A5CC;
	Tue, 12 Nov 2024 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377737; cv=fail; b=gofoDyjf+Z+v3+K1MiqaLV8ANZfdbcgL0SWZ4HKIUM6xpRr/GfvE2diRNNMuUP/Qii2Q5fb+8dWTmHSZ4eg/57DX90Ngis0ZjGJQQaDDBs8E29gHlt/Pqn035INuOLgs5hvHNPYbPqyyNoLFKhteHh6xjuk9B+5GCLSmpYFZTts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377737; c=relaxed/simple;
	bh=LidYNCtL7KNerqloT06mzsIV2PFBI1/GqVdsAXf5ew4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFRZZnAKFVqrqLci7E/Vh+vRj2qHmj1kvfdJosmbpzUdfwFFaQAs2JX90rVgldALReSJw61MAoE7KltkZjVJQOdBbjdqMw/W9NBvGCG3/RJBhLUfbUMCbdFr8gfc70mMQe5o78JZb1bddKHeWwQqzQnRcBHM8YIFTKqfgPuyn9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iRRQxQ8O; arc=fail smtp.client-ip=40.107.42.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4eZXwgVePdvWUxQ+HkLvQhJ+VL2XYt053dquT0v4XALMPRsILOEf133Qn/mtnjQJrPz47yDGVePtxMx3y0jGpYUnAnNNBWZ3sluNj3+IQaXAPz6grX8uHuH4gljBT1caojE2Po7HtOE0ma4BbpEl4B7dM2CeWzWqw91vPg25u7XlUyRVLskEHUBBlLLJat+HStYfQtkAManAyXeV38W+dwP5K+YTMiakgS79B7NE/faQyu7aFk+CsrDKwyNBHLiPd483Lw1G0eHukTtAOHTIRPdZWJeFV/Vb3fc2WvdAq46zaedn/jgZ1kECf7WQiKwhZsdXv5incyfWch+orPy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmpCoE44XUfD9f+gO2QHeFVCqPLDpuhGdPnk3gbc4HY=;
 b=X6rFAo2GHgN7J4jUMJxKhPbEsz9Yu8/nhrd1uXksSWxEXimARnlbIO1SMiNzF6CZUsnhM3TOa3Z6gSMIX9LGlhsc6pqo4RHQRIZ1VnTifdQjA7lULsCIJb8Ta4QFY519XbBoRluEu8FPobmGMvT5r6szlfNidL0x1JKwfi7m2evES5N52PWJw2mqernbDyenyzyt8qJ9KBXAd4uzhYNX838Zennk0iihgAP6ZTkVax6TZhU9o/tXsvhf76wCDe1vHMgXoA34DovpE3kfEZLheyZSqbOzECAK7JB+6Lo4ouQVmJfT/Qu09nlzWxT7wS8aNKPkzsYU10OWxkIHAYuXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmpCoE44XUfD9f+gO2QHeFVCqPLDpuhGdPnk3gbc4HY=;
 b=iRRQxQ8OzlkuJexlnlUcDbd2o4o2ZdWDBV0ITgj73Z5630ivl2N+woj8gObJX+u/FYSGAEtH5sKyLQeQocLDR2/+bCoSKY5s95TuNntqlSeTn+PZdQnCzAqYlXaEk8rnTxC1yo4eYUZNhFywN99hzLsleU6V89DxO4iazeBwtok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB2114.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 02:15:27 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:26 +0000
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
Subject: [PATCH v0 4/6] media: chips-media: wave5: Fix Multistream Decode Hang with no IRQ Present
Date: Tue, 12 Nov 2024 11:15:15 +0900
Message-Id: <20241112021517.121-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::7) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE1P216MB2114:EE_
X-MS-Office365-Filtering-Correlation-Id: f1676394-24e8-4640-36f3-08dd02bfdf77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rbXb4z3ok95GTbAmNALDGqI0C22VuBt+jMDFoTRbnHgXVyImUXkUJbG1ZUde?=
 =?us-ascii?Q?U/jwiKAQI9bpd+qWB5eiZc50dtaAD769UrT3fc60yWUOC5/Gejo6/6vUHyZw?=
 =?us-ascii?Q?TZ/Xb+9NDWcAu8cAqqrgByrRAx5ufB1b9DIAFli7oWZ9qUgGlrYgrPf9cNZ9?=
 =?us-ascii?Q?w8HEZBhTMkl96qepbS+L8fwqSCqDxMp9uDZKI1hMYksAyjbqj6G/e2sHdxWj?=
 =?us-ascii?Q?Se1Lz26jyx76WTtqdlNz/NrNBDvY16o7eahbsemyJ6RAB69dUk0cMni/8uSg?=
 =?us-ascii?Q?v3rqrQHQYuUjRvODIwWZODDznjWM4tm2+0JYEbMbbnnj3DI0qOJTdilEGBZ6?=
 =?us-ascii?Q?YcYx+181btG2clniJFu3WohBwTDIewZuRppE6ExLl4//vZ4c4jygJcB9NosT?=
 =?us-ascii?Q?kEPzYYOiZDphVrOxmddeqf58NHF3qF0GLoslkSLqaAP0PY5SZvZtUvUDHb4m?=
 =?us-ascii?Q?GOp16LEJXIDSiWDUAefIDiPuMM+896LicuX2gCGk44vPhewkCZaEzW4//0hQ?=
 =?us-ascii?Q?qGbZnhl2d/XISfYQOltq/XSEmUUTtOXzU5VXPw0gpxot30lIuRVjJD9GmHwj?=
 =?us-ascii?Q?2nIQGaLuT6X5vBKYELmdRTVmUhZfU/t5oXjjYe4tgjjNWRLRFUYh+zwzKuTC?=
 =?us-ascii?Q?l4hcq6gAM9zByUL58+Jr9GJDnLuCrAFurw38UipX2ygYX6DE7yxjSjRZgjPg?=
 =?us-ascii?Q?hFXVAeUg7G6uI9gwVgFimsAKEfaSyx8VRzZO4Fk0kAF9Jf0E7PjVah1ETO3Q?=
 =?us-ascii?Q?OkgYIE2sYlApFJ7YWAiv5xW8/YTnKFLHu5W0K0LIpJYFit79Js009hE/vzlf?=
 =?us-ascii?Q?3nwB2qV/r8uUquY4bNFoV9XdtrdzA53TQ5om+DH/e4HVH7S8xjVJNC11LKjT?=
 =?us-ascii?Q?/c3vjnOs+Ozky4YVll9z7aeDpuz730zSpSXYKLYQ3Udl9mhnEn9TczCP57kw?=
 =?us-ascii?Q?hj7mS+5RlBBG8U1koo28QIV12HPegl5v0dUYwPxh6kV6Y8BPwW7gpK1+cYCo?=
 =?us-ascii?Q?UAkYEQTMjUkXb1PuwNEK8F3AJAirdMZgLzKHHrtQQnuk2CBWxG3KPRMI95fz?=
 =?us-ascii?Q?e98yyhE9jenb0KP0mR71g0U7Ra24HMFO9lGmfp7mKezLZYC3EbKw5dJie9pc?=
 =?us-ascii?Q?x6+zRkQWXPOc5KUuzDfeZ1TgA36DDX4MoWLo3HZjnok8QPMd6DdbYaWnHhUX?=
 =?us-ascii?Q?VgFz9XD0KKKAcQDOX6CH+LkENEucCx/8q5JR6K7UfwjVZd9BbPuIT9XAjyHd?=
 =?us-ascii?Q?h1y9AxgQpOnDevkJqSrYONY92VzLluulfQjCmo67sY24eSZM5K/JbdnlT654?=
 =?us-ascii?Q?L7rM/T2ZQtAW/TdBmdcTKGgxZmL0TKAslVKYUMATk4WiXAatJYRlS5HUmXKs?=
 =?us-ascii?Q?65Cr9NE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RtofmjMQ9c4XKYlFykCLpnFp5lR31fs4owISAY3KXvZJeo2EMI69YZSDcIDC?=
 =?us-ascii?Q?33MN9NP/gOm3lJCUGXDqEjO9c8fVrSBdJYLid1Q+7W7Vb6y5+JGmdtGs5PgY?=
 =?us-ascii?Q?wt7tAtJTf/I3Rh1/gCOApF3HJH9QgzZfUfWVM7m0G71pF/SdegAVTHSgbHCl?=
 =?us-ascii?Q?6zQUhl6WSfxNXCJlBa03NTmh8fjfAitaJxEbBdS+kchxF4aMf+cqhqLCMSIF?=
 =?us-ascii?Q?vsJt381H3RXDgbF+7/v998+lvnR2qO4S5YCO5R5jh3uchck6xGHc2whfCGEC?=
 =?us-ascii?Q?ZQYelxz8oqHF+Lrk70gBKTZ5nEDhv3W+1+yPkvcs5ti9ZkD78093PRmikqZ9?=
 =?us-ascii?Q?cxmpbNUx+MZYflECL1z71bUP05RFZJ3x+rcpwFtpv6Zh6ZaIlPMdazuiQEhZ?=
 =?us-ascii?Q?Lws4RXaItMd2JH65Z5DumSZsWBJ7RA2zp54jaFhDtB3GcENTfbNguAJUEsxN?=
 =?us-ascii?Q?TzNBCdr2jvuMPWkrU+IjI80RsQoylCk+0qQ/eGtSRpNMIkmZkG3k/ektWtgP?=
 =?us-ascii?Q?mR97pbYxYQGY0yUcFihp4CSTi080gHes0Y3HL7asSCoKWraTI3s+oseXrYEL?=
 =?us-ascii?Q?gnm3tH9oKWjTSW/hD9yfSGhE/zYszJLutT0uOlvVpygF2ZwGAxwJU49d9oMf?=
 =?us-ascii?Q?J/8/Vg9DfKI7LS+8Q6L09+MR6Bg3YBWwPsG/FMRX0HXbx3a6gU0Upp3KI/8e?=
 =?us-ascii?Q?fJO0Pru8ZHUTMw5omjv/VtwLOclB42LHk2QAYprxTHqDuax9jV7j5pmwr6/1?=
 =?us-ascii?Q?uJ0JVlDNDPRZHoQ3xQPB3iveKRakG7sJhpAkSWqnb4dodyDaYbwYR1HUNU6m?=
 =?us-ascii?Q?DgWnqX98vXoRGkKtoOYSCgYW72tgW5x34jrS8rpBBiIRsWUylt9wgD78T/cv?=
 =?us-ascii?Q?dE/vmnF/lP+d/HDPRMTr9s5CDDFzCj8jpU2+yVa1RcfCJbMlAye72SpVYVid?=
 =?us-ascii?Q?ug7wa8X4EUIZq+MERPtvoxi9Nz1FVFZ9B+O4o6ou8S3sQPD4nfjz9J1Q4fVp?=
 =?us-ascii?Q?pW/T57ZYLJQtBOk///RUKSF5l+y4jW1izU1pOddJ6Hzb0XR2+ETBEwu0gHeg?=
 =?us-ascii?Q?u6ZgpmW7tSZ1bFXaRY/jLWyx/aLtL48OCTR5io1u+XkpV308JB1okb9sEnjC?=
 =?us-ascii?Q?XO1sTERo/4/xnkofoudWG0yJSLe0L+6mJbXeh6q1ILbzX8POovs6+/622jSs?=
 =?us-ascii?Q?FPseVTsFmTsPmA+FTB2i4aKLJIh6EkAsu3rbVoH++PkykFFZvX3hQgcG98PG?=
 =?us-ascii?Q?SQaFWu3NlWf1R1DxgNBmxcO10RkE+g7k0Ri05sffRNiU2ygTld3/NfKeHspX?=
 =?us-ascii?Q?+79KsO9YHlqZE7RuyeIxGHxWOX7qxI0qCb+zmtbBSE5QD+tAQSZS5bvlWHDU?=
 =?us-ascii?Q?oooyY2PfayMPhHEfpkiZ2FOSImuIAIeUvCeVHYLV/sYskGr9uUeGoj1dmixU?=
 =?us-ascii?Q?PIJ/7rwBER4/93XVhhcFOt9p7xoh9ZnfVo5ZvJvfs1TS/lxTPG/mWwQm92cC?=
 =?us-ascii?Q?87iiiCSAN1ihf41CRteQW+DJhRKnx+owvyY5lw27/H+O4ThWubP8i9DK1/K4?=
 =?us-ascii?Q?t4H8mkyQbg4tNI/2JeaBA8vQGteBK6AQBEwNmKsQgRp3cANAI9OBd5py1Fh1?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1676394-24e8-4640-36f3-08dd02bfdf77
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:15:26.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JTKRruwI239DDt3M6r+ZKC/vCPw/QpOwNcbRAFMBo04wYlF7DPk7knJJ9c6BMwoEmZuKVOmv8UAZCX9K4rlLYKQdwg4SivaKcFNKgTxwG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2114

In multistream decode case when polling is used, a hang can occur in two
different locations. Firstly, the work function that is called every 5ms to
service any possible interrupts triggered by the VPU. While handling VPU
IRQ, there is corner case where another decoded picture IRQ event could
occur. Before marking command as handled on the VPU, make sure that another
decoded picture IRQ event hasn't occurred so the event isn't lost.

Secondly, during stop_streaming, there is a check in place to see if any
decoded pictures remain. If there are, a call is made to wait for the
interrupt to trigger in order to service the decoded picture. However, this
interrupt won't be seen since polling is being used. A timeout will then
occur after one minute. Remove this wait and allow work handler to keep
running until last picture is serviced.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave5/wave5-vpu.c   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index a9bd96cbf9ac..9bc216052a15 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,6 +51,7 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
+	u32 irq_subreason;
 	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
 
@@ -81,8 +82,17 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
+				if (dev->irq < 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				} else {
+					wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
+								 cmd_done);
+				}
 				inst->ops->finish_process(inst);
 			}
 		}
-- 
2.43.0


