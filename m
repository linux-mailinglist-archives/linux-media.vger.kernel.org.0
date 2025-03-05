Return-Path: <linux-media+bounces-27548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5EA4F70B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21EDF3ABACE
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE571DF982;
	Wed,  5 Mar 2025 06:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fbTLDk4H"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5501DE89E
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155768; cv=none; b=m5ry0sfW/vYlWjNKMLc3Jm9oZubZWmVbqopENdykPs+8XNkkSWqeveyPbrzsZBoVY8PtC+KVwQwmDatapQH6F8AcANqRyyoZQdOD/fZSe7tE9Qa4Hf+f37/tPBI/PDBORUkK3EFB8zT8Ak/CD1wNtTf8aKjSQl1Sfz9tztHOhxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155768; c=relaxed/simple;
	bh=0HnBw9w2IzgF6rpejhaGQQTj0NbIISdoJpXBjcqqL0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=pTXz2LfLxqI6s0Qe8giyBOsaFUSM7ppPQcr5QPy56WWFrX61rLDnCvhNMgOn6H4fIbNGM4eUGF6wh3Ye2H39zOsIQXEKGNmp4wSe1ti/ONqzF6TIlwJdgPecshJZ52oGafqrU4D8rOYrYOtt1aeudD9I3wLxee8CrpCSbkkj0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fbTLDk4H; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250305062243epoutp0391eebc0dd3a0d5f0a8d1d95cebd026de~p0-E6DMgB3180131801epoutp03c
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:22:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250305062243epoutp0391eebc0dd3a0d5f0a8d1d95cebd026de~p0-E6DMgB3180131801epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741155764;
	bh=U8yGItZGsATKQZUU1R1JXmvAiWxXb3uu7q+xzzdWEb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fbTLDk4HNePFFo7pz3LVY7fuI+/RQCVbDjgD0SBiN0/YngV31tusylUwXWoEpcI3w
	 tv1LZ44mTQqDUndj9zKP/qidej2YIUTqff1oe0z4pyHkZQ06CQfiToA2ZxwsR2FK+2
	 nNU5mIoATikJ/WEEqZ6QsVkB2M7tsq8IhlvQdIfE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250305062242epcas5p284ec2b4db915d4c0128f4df5a7c19888~p0-D4xagZ1779417794epcas5p2N;
	Wed,  5 Mar 2025 06:22:42 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z72Xc0bZDz4x9Pv; Wed,  5 Mar
	2025 06:22:40 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EF.2F.19710.FADE7C76; Wed,  5 Mar 2025 15:22:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250305055908epcas5p222e192cc21512ac178543445184a2519~p0qerZhYL0089400894epcas5p2q;
	Wed,  5 Mar 2025 05:59:08 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250305055908epsmtrp275ea5e1dd4e29daf87b98efce83d9070~p0qeqcypT1599615996epsmtrp2g;
	Wed,  5 Mar 2025 05:59:08 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-59-67c7edaf3639
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.AD.33707.C28E7C76; Wed,  5 Mar 2025 14:59:08 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250305055906epsmtip10bbe5c1cdd842ff29e652ec38d9da5c6~p0qc4w-qu1758417584epsmtip15;
	Wed,  5 Mar 2025 05:59:06 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [Patch v2] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL
 interrupt
Date: Wed,  5 Mar 2025 11:23:08 +0530
Message-Id: <20250305055308.111300-2-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250305055308.111300-1-aakarsh.jain@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdlhTS3fD2+PpBrNcLZ7umMlqcX/xZxaL
	Q5u3slvcPLCTyeLizLssFn0vHjJbbHp8jdXi8q45bBY9G7ayWsw4v4/JYu2Ru+wWyzb9YbJY
	tPULuwOvx+I9L5k8Nq3qZPO4c20Pm8fmJfUefVtWMXp83iTncerrZ/YA9qhsm4zUxJTUIoXU
	vOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygY5UUyhJzSoFCAYnFxUr6
	djZF+aUlqQoZ+cUltkqpBSk5BSYFesWJucWleel6eaklVoYGBkamQIUJ2RmnGy8yF0yUq/h7
	YBpjA+NUqS5GTg4JAROJ7d9aWLoYuTiEBHYzSkxqeM4E4XxilLg+8RkrnLPpz1FmmJadzZeg
	qnYySjy6to8RwvnCKNF1az1QCwcHm4CuxNntOSANIgKpEq/WrQWbxCywhEli0ZFnTCAJYYEI
	iVsvnoJNZRFQlVi0bB9YnFfATmLKornsENvkJVZvOABWwylgL/F17iNmkEESAo0cEjtP3IA6
	yUXiTe9GqAZhiVfHt0DZUhKf3+1lg7CTJR4veglVnyOxfs8UFgjbXuLAlTksIEczC2hKrN+l
	DxGWlZh6ah3YPcwCfBK9v58wQcR5JXbMg7HVJObc+cEKYctIHF69lBFkjISAh8TTPXyQMJnE
	KDF50Q62CYxysxA2LGBkXMUomVpQnJuemmxaYJiXWg6PteT83E2M4ASp5bKD8cb8f3qHGJk4
	GA8xSnAwK4nwvj51PF2INyWxsiq1KD++qDQntfgQoykw/CYyS4km5wNTdF5JvKGJpYGJmZmZ
	iaWxmaGSOG/zzpZ0IYH0xJLU7NTUgtQimD4mDk6pBqZLEn0fdLQfiq8J5tuR4WAffJhxe2dx
	W7KbX9qPW2Jv+83fvW5lmlwvEsRW69HibDe/I3XmvZ9xDSvmOuU07N/8xm8B65tT5dpuOtdn
	O2t9nrhpbdD6vzcnp/4/I8n4or87aLnY7fKHZ/i+5drrzna7lbLrVeeRb091Uro63jYsa3wh
	dz3v8YSCy1+Kj5y77fN/8q3C5/NnLPfxqbJutv4tb3yjJ0Z6dznnylBtl9hE7u33BXUX/A4I
	kvh6PHfLmQeXl9z/u6fR/1jOJrZKhz37jvtqqWZrZKhFFv9R0T6kFFgzbfHjk+HRs+es22ww
	v5ZL2Ki14sTVF9yiLAGsCf8Uaj2WsMS/7Dx5cW7H2qNKLMUZiYZazEXFiQDeuAaXGQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSnK7Oi+PpBi090hZPd8xktbi/+DOL
	xaHNW9ktbh7YyWRxceZdFou+Fw+ZLTY9vsZqcXnXHDaLng1bWS1mnN/HZLH2yF12i2Wb/jBZ
	LNr6hd2B12PxnpdMHptWdbJ53Lm2h81j85J6j74tqxg9Pm+S8zj19TN7AHsUl01Kak5mWWqR
	vl0CV8bpxovMBRPlKv4emMbYwDhVqouRk0NCwERiZ/Mlpi5GLg4hge2MEnsO7WaESMhI/G87
	xg5hC0us/PecHaLoE6PEjF+fWbsYOTjYBHQlzm7PAakREUiXmHTnKwtIDbPAOiaJnSsnsoIk
	hAXCJFav/wpmswioSixato8JxOYVsJOYsmgu1AJ5idUbDjCD2JwC9hJf5z4Cs4WAavYd6GCd
	wMi3gJFhFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZw8GoF7WBctv6v3iFGJg7GQ4wSHMxK
	IryvTx1PF+JNSaysSi3Kjy8qzUktPsQozcGiJM6rnNOZIiSQnliSmp2aWpBaBJNl4uCUamBS
	u/nN8NfKyJBXn1TfPhN+MFlIvXS/9qOqXfLt5d8jEyJbuh3vTPzxxWzLjAzR4PXabrJxpw+a
	f9CJsH0yj/H+VFW9m5YfLZx9Hu5sZWt+t3j1gYX/rqleO+azscTFd2KpzK47KYuPm3GIREfv
	lSzeVa69UILN7LDX4v/5zDEiAX1N6fFB3kdzCnMZ0iJur197SVDR+bpsjflC/bP3c1+Wx3WG
	rt7f/HFL6E1Gpvnb307+831Bs1XbhZVXfJYlOthvKOEV+hzjN/3mz5m603VW+GyudEpdpXc9
	NMRR8hSTakBDW7HIvOqK7AWcLCcY9Q4FP5c28b5rZulY3q3xd89hyZmrzPprNny/aip3ZpES
	S3FGoqEWc1FxIgCGERoyzQIAAA==
X-CMS-MailID: 20250305055908epcas5p222e192cc21512ac178543445184a2519
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305055908epcas5p222e192cc21512ac178543445184a2519
References: <20250305055308.111300-1-aakarsh.jain@samsung.com>
	<CGME20250305055908epcas5p222e192cc21512ac178543445184a2519@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

When output encoded buffer size provided by userspace
is insufficient with current encoding parameters, it
leads to RET_ENC_BUFFER_FULL interrupt which was not
handled in IRQ handler.

On handling of RET_ENC_BUFFER_FULL interrupt leads to
NAL_ABORT command from host to risc which in turn leads
to RET_NAL_ABORT interrupt. On receiving RET_NAL_ABORT
driver clears workbit and VB2 queues for cleaner closing
of MFC instance.

When user encounters "Call on DQBUF after unrecoverable
error", userspace should close fd and restart with larger
output encoder buffer size.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
changelog:
v1->v2
Patch link: https://patchwork.kernel.org/project/linux-media/patch/20250228065952.14375-1-aakarsh.jain@samsung.com/
Fixed build errors reported by Media CI robot.
 .../media/platform/samsung/s5p-mfc/regs-mfc-v6.h   |  1 +
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   | 14 ++++++++++++++
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  1 +
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      |  5 +++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h b/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
index fa49fe580e1a..075a58b50b8c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
+++ b/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
@@ -45,6 +45,7 @@
 #define S5P_FIMV_H2R_CMD_WAKEUP_V6		8
 #define S5P_FIMV_CH_LAST_FRAME_V6		9
 #define S5P_FIMV_H2R_CMD_FLUSH_V6		10
+#define S5P_FIMV_H2R_CMD_NAL_ABORT_V6		11
 /* RMVME: REALLOC used? */
 #define S5P_FIMV_CH_FRAME_START_REALLOC_V6	5
 
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 5f80931f056d..e764cab2485c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -739,6 +739,20 @@ static irqreturn_t s5p_mfc_irq(int irq, void *priv)
 		ctx->state = MFCINST_RUNNING;
 		goto irq_cleanup_hw;
 
+	case S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET:
+		ctx->state = MFCINST_NAL_ABORT;
+		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
+		set_work_bit(ctx);
+		WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
+		s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
+		break;
+
+	case S5P_MFC_R2H_CMD_NAL_ABORT_RET:
+		ctx->state = MFCINST_ERROR;
+		s5p_mfc_cleanup_queue(&ctx->dst_queue, &ctx->vq_dst);
+		s5p_mfc_cleanup_queue(&ctx->src_queue, &ctx->vq_src);
+		goto irq_cleanup_hw;
+
 	default:
 		mfc_debug(2, "Unknown int reason\n");
 		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 3cc2a4f5c40a..86c316c1ff8f 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -141,6 +141,7 @@ enum s5p_mfc_inst_state {
 	MFCINST_RES_CHANGE_INIT,
 	MFCINST_RES_CHANGE_FLUSH,
 	MFCINST_RES_CHANGE_END,
+	MFCINST_NAL_ABORT,
 };
 
 /*
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 4cf12f33d706..356adfddcfcf 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -2229,6 +2229,11 @@ static void s5p_mfc_try_run_v6(struct s5p_mfc_dev *dev)
 		case MFCINST_HEAD_PRODUCED:
 			ret = s5p_mfc_run_init_enc_buffers(ctx);
 			break;
+		case MFCINST_NAL_ABORT:
+			mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
+			s5p_mfc_hw_call(dev->mfc_cmds, cmd_host2risc,
+					dev, S5P_FIMV_H2R_CMD_NAL_ABORT_V6, NULL);
+			break;
 		default:
 			ret = -EAGAIN;
 		}
-- 
2.17.1


