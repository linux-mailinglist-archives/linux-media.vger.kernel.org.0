Return-Path: <linux-media+bounces-61069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJSFLdiiAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:35:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3231D50AFFA
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2A7630E72CB
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CA73C1973;
	Mon, 11 May 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQntA0MB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474B3BE65C
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491238; cv=none; b=GGuxcwx0F/xKSiBDL1OQxCD87oQR1L5H/cto3/zHF05cxRW32WZluD7gNqSS7qJjnFuj3AlFYsaAIwyYeGk1xuCkIF1HqmTRnRpSe6mH1r2i7LlV5UImQE/EY3YHdPkJKQzN9uMMSXazlt71reWQ4fT/kSxpksgw0vRiXiwff4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491238; c=relaxed/simple;
	bh=aII67ihvk6yUlrAWkvBSxcTsViGo+wxhGgK9MlHyzZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUjN83P2K4KjuKm/dqPK3HKzbqR0MOp+yEYDzwxkctYRu4luN9Xktoe1RpJn6f8Bxo43zexvK8kFAzu7yalbOfqntf/JJMG3YI+HY74n678wMqzWD2HFCC8ghPnjuR36xwT6baMPHzly4t2PGmn+W/Xw7P1rhj8N+YILHgSWAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQntA0MB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso3228256f8f.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778491234; x=1779096034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v88vZiME58PShFsdqu58388c3o6S1JEPT0wDwwHJzQo=;
        b=dQntA0MBTKiuKz2WtImtD5t60IMOM0HFsB+ad4WTop9JLbOTEieCWUzm+BXTSZE3xE
         Dksr83/oSTXZXKMwGnN5EEsdnezHq24pJn1AMEci/Yo1YRiCHZrfpjHQrT9rBt9eIzGK
         XZaXvn6EMf0UARBE4h+gubQwSbOE5zWgIGMdpHu+oAVi3t2KlrgezWBO8dBDPH8Vhf1G
         k2Dsdu2CAuQvTtgDuZrvhj8M4EHzaDjYZAzkxCE0p6yf26JQ31fM0Mxr67l62AEs8Mqp
         cqvJCMwnJlZPsno+hD5SmEMAnPxuP1D2CJk6cpUmEui8RE3eexrsUC4ecweibB1K9Na8
         HQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491234; x=1779096034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v88vZiME58PShFsdqu58388c3o6S1JEPT0wDwwHJzQo=;
        b=UpZC+Ac+tqoqeuYbzVVKEAiLBplcIHQhUOhkYoiBiayRll4pY8V1fXAgBFr8YZn/Ep
         jeC44D0bW2LVNcH8MmVhrrO8308EsCaqNaRRiHrjaBN77YEbotSzx5J50A4a/m9Y5rrT
         RXnIgXJhOwbXWnsJgcbifPRdBlPzEYD2e0OREdmNPQboSlXcmSx24u/vCWsy+lMRFuC2
         aW4r3G7HdflUEHE6SO4RF+2nrNF6NxToyFXFw3VqlsMG+9iT0wgAFDw1XBo9+SjX1uYM
         MKgic7R3jw+CrDBh+lBhXIP2J8u1/2FU0Ys4dd8nVlwEVYvt6/RqfzH5ejfK807vZ1Jn
         m7mA==
X-Gm-Message-State: AOJu0YysPq5nAmjjiVxT5W5WSUjmBs+unvMfsbCiOHEny4XHSh/4SxRV
	ReepvDJ8V6lBhkAgnxfqhzN0RTEQv0MJyeqlAa5d7OMq7rDbRQPPv3TOUHS/boiBf1k=
X-Gm-Gg: Acq92OEGMxXbu2fKLU4/4XEaZVJbo3DqXz+zB2/++8MNNTOivbXP6d59ZKFFBIjRfwb
	Uf1+Pza0S3pKJtI5123h0KbTdUTgbzo8RDo0N4dZeZmY0AlCLp5YKGue7EWisbpQoszmHi3AM/y
	Em9d9z4SQOhf/ZT1Y9hXbjrG36D/DZioMOPN5UrXAnIxSFoL+8ma+YHK8INr/FW3Psevd2LsiV5
	cvTgedanpOop1iEPmto8O80N+jqEg/bzi3DsMY93xOPr37kGMPRe91rw9spgIGO1l/7FzMoQheU
	yzfc7DO+xLq5ykIaWwNr2ZXeD5GaRPHCX6Scv5T4k4hnSMuOnFX0lIMn+RyHNSeQtQ2Y6OEZ6W0
	iziTIW7PMh4LWeLi3GP0zV2X5r1YoOICvCopLU98LRQgZpnwL9ggm1P0wTKkna7urqcVkMQF2A+
	mFnAfxqhesX08u5El4TbHJGh2N/XWmENeOQ6KJoEPA+86A
X-Received: by 2002:a05:6000:2910:b0:44d:821:1a0b with SMTP id ffacd0b85a97d-4515d3dc326mr36238691f8f.29.1778491233792;
        Mon, 11 May 2026 02:20:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm23743240f8f.17.2026.05.11.02.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:20:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 May 2026 11:20:29 +0200
Subject: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=aII67ihvk6yUlrAWkvBSxcTsViGo+wxhGgK9MlHyzZ4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqAZ9clzKk7rE0y/SqTAcN/l4Kfj0bsYZzPqYYJxhE
 JzEUUUeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagGfXAAKCRB33NvayMhJ0TNXEA
 DGea+pvS41Wjtw8W9lVq/xhhnkwqXLyA4XKTPVknG/xOEydBo8suxd1pskqmfG560BKgxcNtObaGTQ
 azkt1DdgFo+ZasPRfcn7Zmsr0wrKntAmDddobpiyuhelZP2+kvvqeUIilFSXqR2195XIRY+xHVzLzQ
 pEHkC7FpS1ijPyZ+8jR3jBpo1fdtdSom41qxIgqiOiGiJamdAvL9sKPAd7fqXkcaoVgFlZ062QCN3F
 m/wVmJpL1wJ6b1nReR2TzL41HmvjIzpvO6MIebCunxpUWKPlyBGoeKJg+1yUcjEhMNGYHbevuBWT4a
 iJqiySma4XCu6cevlMxM25pw7jqvh4oaiSmcxQT1aCQrmf+4tx/Wch9f4jWo3ynBKkAk5+WJ09O8ZD
 Cj1Tv28Mfb5D80C7tEHgkpOygeT04UjLWDPkV9aLXMpbH533oL27JH++BOqAxyth36OPqcKE2Jv0NF
 EAKNvu/u8E03g8dqWGnjl7mRGH9+cygO9guTfA+0l4pbeAhAelDRPxEZdCQ11GtHD2Ah+ZGwBdJpGE
 +fQhX+n7brKc/ZK2JoyauMjzOUya9XoO7u4nBFQHV3pwyTg6Or9m91lE3emZQDw7FmZn3o9qVKuH2g
 tHEjR9FJr0900SUGb6MS7nRR6GC7zDF1AfiuJReCSldQncByt+mKKQxRiVBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 3231D50AFFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61069-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9..0541e02d7507 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
-	pixmp_op->width = ALIGN(width, 128);
-	pixmp_op->height = ALIGN(height, 32);
-	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+	switch (pixmp_op->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pixmp_op->width = roundup(width, 192);
+		pixmp_op->height = ALIGN(height, 16);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
+		break;
+	}
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 	matrix_coeff = subsc_params.color_info & 0xFF;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f..eea69f937147 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -266,10 +266,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
 		fmt->fmt.pix_mp.num_planes = 1;
-		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		switch (f->fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_P010:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 2, 256);
+			break;
+		case V4L2_PIX_FMT_QC10C:
+			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_QC08C:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width, 128);
+			break;
+		}
 		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;

-- 
2.34.1


