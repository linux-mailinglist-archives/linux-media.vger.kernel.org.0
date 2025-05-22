Return-Path: <linux-media+bounces-33080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E5AC05AD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C1C1B60253
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC41224243;
	Thu, 22 May 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dB6wtDSc"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022104.outbound.protection.outlook.com [40.107.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C0223313;
	Thu, 22 May 2025 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898787; cv=fail; b=M3th4451WQftJ0Yp3tRhkBuDdz1M/Awi5U3LptSqb7Dih6F/nzFbWMhhKHq1237/eh/QeCk9n7ZmBFmqXjP6nYbvthjIq6WK802OM3bPVy/sbT/k+2l2R2CJU8WFCg4H55M6e6Kohuopf9cKiymNXQz5iiYbIWzlsxh01mRAhZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898787; c=relaxed/simple;
	bh=kAFf+g5MWw/R0mXcUCh108EnlO5ouNK3nmSEy+b8QxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KhNpoCRwYSVgmAKLztPprEoI7YfSMxHBfKoml4HRSwWxHIV10KwxHFt9ic4TJKDeUqIgBt8dmg1GLQgKNpB4sAFu+4pmNmZJ9TqyFvHH5xg5YmOib7XCuNMzANsrviouYWuYnvUBCWzH+PprHddtAgev23hb+0usJQ3xrkNOe1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dB6wtDSc; arc=fail smtp.client-ip=40.107.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHV7+oGGQ6qZK66us1Iha/haaxHqwkb3IkvjcBCdQK6+wBG3qM+VqVNJtscgLRMsYygi/5+HNB39OqkLwOK7ehjrFnC9bS8K2vH/Jzad3r/tG+kI4zQ4hX/1lhlrTDoTZRtMeayANnyc3xmqSO4eKgDRrzAGZUvV5VY9o+0UhOD9fMgDZUhdcKQjoOOBPEnJr6TvI5PFNehPj7KCoz8RrAebd1/wVpvN76YpbZ7Mg/moHp2cndVkmu1cJHeMVo40IloIrX20FEaz8eEqkRSQkoIUHBhGiLUXQgWIEM71IwIq7HfE8cSOyyZOiiDBiioUftpN1hy43XIF6lFkNNr72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxxhw98xqAoTpmS8xILwi5BojKJQL61BNEcSMOR1X7k=;
 b=CNvUeKZutnsemnlfhASTZqDckeg9Lnp+et18CaBz3/4jGwyAReFeRwZDw4z5c2TG3ckGDUu7FmIBaotw/KaJpXY26xPK5kSXTuMV1JOCj3CwF0JCsBLANjwxRvdXuZW4oCliGGxfKhpK5Y/BDQj4jLAxHC1/dovtz/1Sdkbh9cFDxS48tBaur0iTppF5S+FUYpUvFY/gvbx0L8LiQAiu52NJEeQH1GPom/nGND23X6ITuG0iV1UeTBR0tqhFRNipaqcG9dLyhotSkEMEg6tXta1reBG6X1W2THU5gyD0aBCRi8NCSXTwSrWUnvVfgxZQ14t/dFKQAsFe9cJDkGkblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxxhw98xqAoTpmS8xILwi5BojKJQL61BNEcSMOR1X7k=;
 b=dB6wtDScb+TYli1GZlIkiVrDn9aLUqFDualup9ILBnGsjd8Mw+mQ1UPa5ycSB0OhGiDM6cKgsdBeAdzu7KxgIMOY4McaowcyxZyN19jwcO4XSPG+OL3NHBCPsmk2ytNU/kY9S4LVMpHfEbNNqfJEVZvDOJ6d2g6Vf6+LxpwunDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:17 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:17 +0000
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
Subject: [PATCH v2 4/7] media: chips-media: wave5: Use spinlock whenever statue is changed
Date: Thu, 22 May 2025 16:26:03 +0900
Message-Id: <20250522072606.51-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PUYP216MB2872:EE_
X-MS-Office365-Filtering-Correlation-Id: df79ebc4-af11-4743-3f35-08dd9901f100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pE7RCnC0xiBzCqWdtDC2LsGwpZEqWrrMFzIGBJWvrw6KSBw1Jy3+25v3J5J/?=
 =?us-ascii?Q?uFl1c1FeFYTbPZJnDX8w7LUCnl7mFaa8blsnfh9o7Mm66D3cVKxjg+UnLR5+?=
 =?us-ascii?Q?yD1ntB9Ts/p1/qJOUnjETXy3V9AqkOVti1/LwgAGPMJXSCTyF5bTa7dOOiD9?=
 =?us-ascii?Q?v62NPUt1iAd6MG0Y4aILHhxalt7tu8GYSNs1tZ58PSuOMaJHFznpVLT7uVaS?=
 =?us-ascii?Q?EkTqQjc/eojpewp79ihVygrlObjGbYYnXAgVaTdO8DGj8vv+ZeE2qGDy7e7Q?=
 =?us-ascii?Q?v6Wi3y6cBi37tKfLyWGjZ3kfhpaBO4Wx0D0i+rNAWZkWlrTCyXEmvInrJZsa?=
 =?us-ascii?Q?5KFXIXnzrnHCVql/sHf2KlT7M53ASq7dxiNHop3nzW3oJTvmWRy6VqRjYPs6?=
 =?us-ascii?Q?HOaj99MWQK4H2ChBKFnce0Q8vHOsiQZH6ltQvLiZCZEFt+QcKRREVbKNE+qx?=
 =?us-ascii?Q?i3MqofGzqBlh8GtU0XpchY4WJHynkEtd7zqrWBVKmVOnsyiaQFT86g7u3uyM?=
 =?us-ascii?Q?4vGF+yEFTFuQ14/mY6udpvgLnnjfORq1dF/b5iAwyKCGme5sYm1IauXhc9dL?=
 =?us-ascii?Q?d974fw8CkXyv2CXWYyQW/9VpAGQxVBZlqIBFVWksJppPDx/da/94tyD/v8in?=
 =?us-ascii?Q?7mZpxPlZpsFxJWxuLMnfqZzi0B+F9W1RXngJqaM7W6FhvilpBVc3PtgmqgPz?=
 =?us-ascii?Q?APhVU0lsQ+TRkUtuN/NgjFFoewrVl/nGEEvmDsy87srXEPFLhGjeBSa3HTXB?=
 =?us-ascii?Q?sCJAPaCKZoh6E4on67ntZUYpjwMaV90DtU1vI/hDtKxXdmtk6wIWQekVotph?=
 =?us-ascii?Q?/xpDn1f0Tj0wkNZSUJRPyDZWemreqp3tEGJWnHz7ut8LzMc/5fbo96ytkvd9?=
 =?us-ascii?Q?/d01IPF8ykls22c4OMEgxDlkd0DFR+x49EVA/HEdLUXVaPKA4rdA56MtKwtx?=
 =?us-ascii?Q?jXwcDCWmidtDB9Mq6s5NCoJRDuMnpdzI7hiRM5fkOe6aRDcveVZZsZY1H2sb?=
 =?us-ascii?Q?6JhkLuKOXS6VFOdVKlC64ohUk7qDLstwXrLDnCFrxNxkoBzRgoIqoKgtB1SV?=
 =?us-ascii?Q?1b3iEU5mEIaJIPmarfDDNhYP5BE9Gx1PUJpGh9oHlkPQIA866IOSgPQsP/L3?=
 =?us-ascii?Q?YyJ74zFAA37XhiNHlfnnpqR2Y7A9VoXXVSjdDxXr4VQdk2A6Hf2bHZ/XxDU+?=
 =?us-ascii?Q?k0g0tft6+xRS5ozNdOF2bJOZB16SrwAJTVsJ8rNHI/zSqJ85VBpAceXsPOCw?=
 =?us-ascii?Q?YT+AmhS0EmP1Fg4S3h01U/R6DmLjpYNjsKmFX8tC2ySWSaoencA+Plr74J8O?=
 =?us-ascii?Q?N/coet55Yim7UP82eHBYpAYfvJh6ujvX0487lekpKaSO3fuAvyCXMz/53Aor?=
 =?us-ascii?Q?kIhGUgz9hC3Qjx4sJrhrhan+gJaYnIypT1Vs9OP3KKBHXHXr6YpsjsalOY40?=
 =?us-ascii?Q?x/ivnOD4oZYRwiqWKgQcZQX7O8sYxwaHtwHC24hYQkNAVkLIZDYalA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j82ee0NGVJ28qrllmvkXJMeKtBp2FHFaUNSpzPq55Rn7hLyHqrco6VFsXfvv?=
 =?us-ascii?Q?T6jAFWNSp+7n5sIn5ie196zBwwXQzcNPBTIAV1vryARv9ozMFyWTNjZvZ8Ez?=
 =?us-ascii?Q?JgWqZ3junhwlRNnrttgoC+uyuib+0HAVprAolUhQ79Pb4s0ANHc7Hzi2h1lV?=
 =?us-ascii?Q?Ev9zoZckdijiMod4zKe+doXReQrWiRQ4/wv/uuMg9dnBbXJg/di+wiQ7hCct?=
 =?us-ascii?Q?3HC6HHRiXV7dsZ5eLxDYohBUwDa9BvScU+l6KRfdQhH12w3J1YBjIi7lH/P1?=
 =?us-ascii?Q?rSJ5j8QRmVbyiAOKtxPpj6DV3/XWxJCD+NBWUUNu/WZUDj0Z51VqITRNvNfR?=
 =?us-ascii?Q?YmomsCYJCfdvJSkUdVCvZl9xM91SJeFp1kCkF+7ew+Sh6gXn5tbDePwJVm2V?=
 =?us-ascii?Q?+IC39ME4IHeirj1Kqcp+x+Kv/0GSUpHCaj2TufJowAuJRvN4d6D9p9ruOt9N?=
 =?us-ascii?Q?tU9eh9LW4/fgvZDljC0QIWVMxtC2W4ddSe7eCy0yR3NTBGk/J3mP929HZPYM?=
 =?us-ascii?Q?vecAl6cq0wbJuy7fS0Lq7by63ePxa7Nj557hGJ/uf/QlomtrKw8ShNohyLcf?=
 =?us-ascii?Q?soE1E4K48hZcn+D8T9ZCY1Z1wNqN0NAqLrOWamxM1qGLlOBo/lelG6nIUkLJ?=
 =?us-ascii?Q?kCZDnLMKh2tBVxR52L2JX2f+/7CNwXgfZs9cA258T058ezJRwBwQp8jv+cUG?=
 =?us-ascii?Q?Cm7vVqQ3JcM4Rna7r+/iknjtyGPK0/X2Jp1LFomFuTL70YwneeQG2AJppDX6?=
 =?us-ascii?Q?Smqc0KEKxt0j5QSWnxxKGh7bwtZuMwY5hhoVKTIJtcNKlXE+/XAWJDkjWkS1?=
 =?us-ascii?Q?lczdWXHXqH4XoZCxWRddk3pnSFeI7VqR4pNx+fzzx5+NtWzRy2lk8kvXhEtA?=
 =?us-ascii?Q?XQbQJHWtelSU6IvADBW8yC/ZVGa56JrY2IOknmquTEpIsh1C+uXOCwESlc0e?=
 =?us-ascii?Q?R/ISAzu126RkBoK9DEju30+W7Fd2HCC+zGoHbCKNiInEOfdxfWZitOs6+s12?=
 =?us-ascii?Q?XkgcTJi64uxB87u5BsOFYqWPUtSIedeNf3hgsc82llCIWXAIdWf1lOWIDRhp?=
 =?us-ascii?Q?gfEqWxVJZWnW9SsWCYYQp4bDwmifyJ3rJkVqf2tGZFgb36FwvtWdEv7xlCQg?=
 =?us-ascii?Q?5jEezJziIKn843q7r5JAyEhsWKj+ryzx6Rc0JCqueIb1rqjb65hCluS/1yxQ?=
 =?us-ascii?Q?XG7SXswFvZpxJGFRUhFVGPLEcvyInQw7KfaPR75LSzkpX/7iQW09IGlKTAad?=
 =?us-ascii?Q?/5leEjn0eXySj7Lx3/VVkX5kcwLsJENmrH4MOlJGegcLWzYOtQWLtFkP1eQ7?=
 =?us-ascii?Q?pPYdf+A8wcwbgiNKNGIGqyxXtuwMpftp9ZV0Wv0Xvb4ead21l5VoR5iiAjJ/?=
 =?us-ascii?Q?4cw3n4tqCE/ysJwH4vGsCwE9A+bDZ95JkBFccLZGM82XYFf/aA8uX6vlcmYX?=
 =?us-ascii?Q?Yxf5vqwZWjCgXBjehdvAkkMkYg0yF8xcr7lgQsKFt6UV8jFjTN0LIKj2BkF1?=
 =?us-ascii?Q?SQ/tG8PwPFnBZU496ei5sEH0GUTDytW648nPkUzhDahoT0255IUk9NxYvuw4?=
 =?us-ascii?Q?IZl2e/ykV6JHRj9I267mbKYi/mxZC4CMZ5eJfnXoKY5Uy5e25hUomE7dFJyk?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df79ebc4-af11-4743-3f35-08dd9901f100
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:17.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKSx0WVAYyMeVAkRBdd98mAuAJX4Tikif5IzmVcu1kV0UqC3ikGinDB608s3B8AA2oPlU0bQwfRF9U/WqImGgu2m+EDPJg5imeOKBJn6Ius=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The device_run and finish_decode is not any more synchronized,
so lock was needed in the device_run whenever state was changed.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 42981c3b49bc..719c5527eb7f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1577,6 +1577,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
@@ -1617,7 +1618,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		}
 
 		break;
@@ -1628,8 +1631,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
-
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
 		 * active until this decode operation completes.
@@ -1643,7 +1647,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
-- 
2.43.0


