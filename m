Return-Path: <linux-media+bounces-27206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF7A495CF
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33C73BB61B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFCD25B661;
	Fri, 28 Feb 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="b/wBmhrA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEFC25A2B7
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736100; cv=none; b=clrT3cW3bVc4kpSXQhCWzjph13D9lqbW6sHnoczxUNRj6eqwbLz1h8JmDqchaJLaCMHg5Jk30guLUmqWKR0zGhiC97DkmhmFOu0OTqfPylbZ67P1FggjEVhwQrkR1GD+PuKoSjVtWegzwHH+9lAiqBwwYI+JcJhPkSO0hXyMHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736100; c=relaxed/simple;
	bh=8czOAp1XIVXzJzW/nGeiln/rxS6cj6xKkuUCCr0X8ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=pNW7XWOmaPFOKL3Ez1SEoboL7DSFox/P8bKkYnmLM9lijzMIvqxk20xqB1s7Fhsth995IWd9PEfu/J6pTdj2bMWwOlWD/xiAYmT57kfA1QpaCmlwwU1fXamizLQnxTqO1Ml/jCWD6JFQSewdvSKytj+sUpHO76XuxtUFgGzM9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=b/wBmhrA; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250228094810epoutp02a9da0e0d261f4ebe3359dafbea1d4af4~oVkBeOMTD2548625486epoutp02F
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 09:48:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250228094810epoutp02a9da0e0d261f4ebe3359dafbea1d4af4~oVkBeOMTD2548625486epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740736090;
	bh=d/xrksObyuUS+LfR0wsAM0jpJ6JI4C0qssS+Biux8N8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=b/wBmhrAsfgpVJAMqJYU0R5MjmfQjV+Tzuva/an1oEo2ZZKMTIDgphUuImNnED8gF
	 PIsG1Dtq+6Ci93Wg7eeBNPS+qq9MSk/naRg1WMvEYzwGYjml8jcQnIQYbCo1U/64TD
	 M/4navUYX+kJbQ2zzElVnkzBVNoYMZQJiS1Lj/fI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250228094809epcas5p43b4423daa009f9e6d37523f7cd7d890a~oVkA0hqiK1544615446epcas5p4W;
	Fri, 28 Feb 2025 09:48:09 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z43L006Lmz4x9Pp; Fri, 28 Feb
	2025 09:48:08 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.9D.19956.75681C76; Fri, 28 Feb 2025 18:48:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250228070503epcas5p3260dacbf7b2ce5cdb1783e570af665a1~oTVm3L9Hm1856518565epcas5p3E;
	Fri, 28 Feb 2025 07:05:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250228070503epsmtrp2cec91f437594f495f6c7d4d7d07cfec2~oTVm2ZPRN1928319283epsmtrp2d;
	Fri, 28 Feb 2025 07:05:03 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-33-67c18657ffcd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	00.CA.18729.F1061C76; Fri, 28 Feb 2025 16:05:03 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250228070501epsmtip2b98fd1fe64992511d761785b68a5e7a4~oTVlEB6Zi0820508205epsmtip2L;
	Fri, 28 Feb 2025 07:05:01 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [PATCH] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL
 interrupt
Date: Fri, 28 Feb 2025 12:29:52 +0530
Message-Id: <20250228065952.14375-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmhm5428F0g5PTrSye7pjJanF/8WcW
	i0Obt7Jb3Dywk8ni4sy7LBZ9Lx4yW2x6fI3V4vKuOWwWPRu2slrMOL+PyWLtkbvsFss2/WGy
	WLT1C7sDr8fiPS+ZPDat6mTzuHNtD5vH5iX1Hn1bVjF6fN4k53Hq62f2APaobJuM1MSU1CKF
	1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGuVFMoSc0qBQgGJxcVK
	+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZL/+sZS+4KVOx
	8/Qa1gbGdxJdjJwcEgImEv13ljB2MXJxCAnsZpS4d2wDlPOJUeLfxmtsEM43RonZExYxdzFy
	gLU8742CiO9llJjStYcdwvnCKLF+6zFWkCI2AV2Js9tzQFaICKRKvFq3lhWkhllgCZPEoiPP
	mEASwgKhEo+aPrOD2CwCqhLT/uxkBbF5BWwleg9cYoG4T15i9YYDzCDNEgJv2SVu7/wGdYWL
	xIXdHhA1whKvjm9hh7ClJD6/28sGYSdLPF70khnCzpFYv2cK1Ex7iQNX5rCAjGEW0JRYv0sf
	IiwrMfXUOrDTmAX4JHp/P2GCiPNK7JgHY6tJzLnzgxXClpE4vHopI4TtIfHpyBuwGiGBWIk5
	N56wTWCUnYWwYQEj4ypGydSC4tz01GLTAuO81HJ4PCXn525iBKdBLe8djI8efNA7xMjEwXiI
	UYKDWUmEd1bsgXQh3pTEyqrUovz4otKc1OJDjKbAIJvILCWanA9MxHkl8YYmlgYmZmZmJpbG
	ZoZK4rzNO1vShQTSE0tSs1NTC1KLYPqYODilGpjmPY1e8t+Fz27j+UsWdaah1yOmTM79dzn4
	1bd7jRvfro+ze+/knKJ7NaAj7P9xbQ9xaf1unVUfgw4la16aKfN5fnPq1XzXXaZpK35r7vdM
	rp50hINb65/qrq6pF1bcWtAiceuUwt8DfvNKhes3fbzb/bBFQ1GHvej7x7m35/REKddq/5+1
	oejBIRHTc9wvJ8xW/FXF8cjgmRT7tJAi5hVngr2CNl7YUmW9f9WDtKaHuy4uurraKPvqN+X7
	/U4F27SP9C7ZPelG9br7E4v0fSLk3vrwsJ778OyX732Jg9UlG1Yy8nv/PvUhWf/BqeaWvzHf
	3V59qMuZtSdync0j1qcfqh+rbCtLOKZxx1NjxfXie0osxRmJhlrMRcWJAM60yisMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSvK58wsF0g/bDyhZPd8xktbi/+DOL
	xaHNW9ktbh7YyWRxceZdFou+Fw+ZLTY9vsZqcXnXHDaLng1bWS1mnN/HZLH2yF12i2Wb/jBZ
	LNr6hd2B12PxnpdMHptWdbJ53Lm2h81j85J6j74tqxg9Pm+S8zj19TN7AHsUl01Kak5mWWqR
	vl0CV8bLP2vZC27KVOw8vYa1gfGdRBcjB4eEgInE896oLkYuDiGB3YwSExdPZeli5ASKy0j8
	bzvGDmELS6z895wdougTo8SmV2uYQZrZBHQlzm7PAakREUiXmHTnKwtIDbPAOiaJnSsnsoIk
	hAWCJTasms4MYrMIqEpM+7MTLM4rYCvRe+AS1DJ5idUbDjBPYORZwMiwilEytaA4Nz232LDA
	MC+1XK84Mbe4NC9dLzk/dxMjOCS1NHcwbl/1Qe8QIxMH4yFGCQ5mJRHeWbEH0oV4UxIrq1KL
	8uOLSnNSiw8xSnOwKInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwRV2N/ffr54Nr58REL7Gm
	LTr3+MUsr4R8g8DQTxP6LNYvsJmyVVk8yP+YZkG/0sJ0z9T/O+Imzg7SeSU3ibe9S3v9Xul3
	pX2N8Vb3ahNeHxVnPPM7/OMLeyb/dPaUpsjcfSu5X8VdOPqsxz6rQDZxy/snvb48dequ6f9M
	chkmO/IcSWvXn1ow9/j023MmfXhStUSoZvq/UzUsfod+FwSes9NU02Xl5Mw4+oCnUW5Zudyz
	hicx37Stl6xRc54mf+Vj0NWZpduWaO46/SnqgoaFVE7DO7YE013bOz4tWS286er1r3WsZpHr
	u0/ElR3stHVLU401cVvmtYP7f8Kb/fkOPv/uc8ofXs73n2N5yztpJZbijERDLeai4kQA2gjU
	HbgCAAA=
X-CMS-MailID: 20250228070503epcas5p3260dacbf7b2ce5cdb1783e570af665a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250228070503epcas5p3260dacbf7b2ce5cdb1783e570af665a1
References: <CGME20250228070503epcas5p3260dacbf7b2ce5cdb1783e570af665a1@epcas5p3.samsung.com>
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
index 5f80931f056d..fa211c2d68a4 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -739,6 +739,20 @@ static irqreturn_t s5p_mfc_irq(int irq, void *priv)
 		ctx->state = MFCINST_RUNNING;
 		goto irq_cleanup_hw;
 
+	case S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET:
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


