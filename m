Return-Path: <linux-media+bounces-62440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGkEDbvWDmpzCgYAu9opvQ
	(envelope-from <linux-media+bounces-62440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:56:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C165A2C68
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16E7B31F2936
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08C73783C0;
	Thu, 21 May 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KabRghp6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EC0371D1E
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355509; cv=none; b=On2tQQ4/V3Ev+eeGyT4cheyxzg8IaAk2JRdrtnN2dNjj2hPS/apmVT72bITt+2Zpvo+/ixoVnI9sWwyZR1smcXhzKbVslvWXRidPoVFMEPp75GfDPYx86y1Vo5oQ84HZRkLMt5zVo8/eF/UdQdCuXjfK0aROxDpsc0EfHtDr4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355509; c=relaxed/simple;
	bh=0x5xYEwoUZvKXTEvMQnBzewQiRcORbDr7ycw7TxINKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOLEtnNl0LFru0AVJwDz8D3x5NwD3+IYSW0kdcIrvDUHdSVvaNtvZVfcgfKN/vht9RRkW77K/tBfNvUO0gGTDVxxiDuXaD/UTQwd+Fk61UgGRzSJRXHCIQgbp6QxsbnHZK7CG1c6HOQ90bMH+QphUm1nd66jqEGKV0lIq1j5XVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KabRghp6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso64404705e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355504; x=1779960304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5V3jdq7D8hT9URSjELxQylxndpkD3NUZV1IJWVze3+E=;
        b=KabRghp6exoKj3TDIf/QFEAnImRdbVQTSBzq6qaW614aCjWnOdPvXUbzfc8nDZhMIO
         LdWlRK/P6aoVBV8aOx9F0wng4I1CITbWxJ+kWdjT7VvSZvrtrefGYvjmZcrE6nfOnqXQ
         QhZSdfpY0g2nVBCW4zKWWQr4nyJhm7R3kvxbeGTzjZ+YdAdiQZ7pu3MLiVmAUF1tAk/2
         t7rl7qzAl4aa6Ra2aCdX94qg2PqcjJpfg096QIx9yJlj7bYGagnPrNxj1EQ4xQlLqYnt
         Mnv3kOSaBzmoSPoh52niy1XiyBMv/mE/r8liNck4Tqbp/yPi7xd8Bjv0y4f/LZKduFqT
         Ktog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355504; x=1779960304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5V3jdq7D8hT9URSjELxQylxndpkD3NUZV1IJWVze3+E=;
        b=dVgOtPyoh1rM447pQtBb8KsHBiD4TuzoVfoBBvkeyGLVB7QW5ILiYYqAaeZpNl5A9v
         LNwtqDHkm7hI9KuIC1Zf2NQW5+YHIu78CEBUEp9h7ct0VMt6YJobrnr7+o+dslTlQw0A
         EJOcRihOT76l+V3RevNrsJQ2P8ITKObNP+KQQHgIBzlAP4DnM/5rYrwi8HSMX9Ud3g1D
         ZNsjwi6Ro7bDDHuBTtYIsqJ27Xi8Qbqw1TaWcy3dxy/UI8Vq8JBbbs2uEtFsHLxv/kao
         wCWo8jAouXy0NTgy5evdJuDzesrCovN4ejQqsORP9lOkS67veA3QweZX+UbjIQpcq4r1
         HGsg==
X-Gm-Message-State: AOJu0YykXdptVn24zTtUoHLhAYgJKppOhleUalNbC+fnJ2D/F9KjVhCL
	d28raU9dPGVn0gkTlN2BEX9m7Q9sA+tTF5D8870Ijg44fHgsBvLGaLGOM8xrc+pkkeg=
X-Gm-Gg: Acq92OGtBio4pU06udPqS29HTO5iQoONicyQTNrqLyzFdAL3A8a7qZ80toiDaUGghZU
	8iNvr3MzFgfXRsigoPCsPT3MB/gKozmmj0S6E7iOm7+x6NQX+Da36yHMeDZrql0IdA4cV7GLkBY
	1H21Sf66WjBkO68nryQw5hYs2yaFs5DXcVEfx8m2A4cVzSsbreWPsigFxxzpIPDC2zVPZyWSBZe
	q+fCFXZPe0LG62JDAWC31GB0ZBXQ1+wV/6CBTQPBMDn7PNbQ9p0rEej8nmtqDAgvEP1jaq30o+7
	+3y4cL/CK+bF7ub5B3C912uMeTsRHSGJwmpLDRJuV56tXps4pxuFY1gaIp0AZv3BQ4k+Ji8vJYR
	sCQ6dC9UdMlrq8wCfTeLSQ7c+MMbGFKTUq+kXaViODIjyEaOyiUprUsLb6SfIp2cpUl5qLc78g5
	eCD9PbqjLbIZt0DIHjxQo2SMp98EW/mam0mj6cOcMz3CXy
X-Received: by 2002:a05:600c:33a4:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490360f0f14mr15782675e9.32.1779355503640;
        Thu, 21 May 2026 02:25:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:57 +0200
Subject: [PATCH v4 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-4-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0x5xYEwoUZvKXTEvMQnBzewQiRcORbDr7ycw7TxINKE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9qplGOiq+93Kwowy55wKDxWqlvOjTUQJw98f4t
 JMHBnvyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PagAKCRB33NvayMhJ0bBUD/
 0VgtbW6nrMDvBlizvd2DGdKtqwLV45UpEhkLof7xzSYTp+EaOOZR/OgU2c/IQ0rtfnaatdaLs5nfmY
 95xCy8fNrzttmdn6C/KPSgfLaZDSP1TCvfDBQQaxItXMXsf1tqoTBIusy2kd43BC5KBVEiKC2fiZZQ
 xRUm0XfT2Lha6hU/DgvstPV5rjhGsiQr3/sqqoxDsPBmI+wPdJtbUdWX1fqPoQUi3ZlAUj1MSErxEi
 44jL5DrRL7nOkrN2x5xud044Zer19K6/xn4SY6Spc8Vb8PH3RTej5FXjsTZz8dxlHh7Bo/7CaB2woo
 gj5BUJ+z/acjx82OUqZkYDYWxjN41wCXX7dIe4TdNMZ9Sa9uLIU2arQAWkXnNamEOF+0rxURmhWWEt
 GAt6AAkDfY4l0kFbzgBxdobYZ5E9U5kcGLiLSXQPLs6ajBU/ex3qOaghHYeCiIlC7af+hAtsEgbFVG
 6kW3MZVTJvr1gew/736IqBquWWXNIBRy80HqODrbUQljb+YbafyAvcoDZ22zhBjSr+HXzlF3IH4/vN
 4pxHRjKzwv0BfwkJL+HNJ0lb4fkD6+pYzgKLi3had6haQnCCr4p//yaa8WjAdQKE4fSwnSjKDkPz2m
 T3IzUiMm6YBzWhBgPazSyz5VA0q8mTLAQjVQsmTq8291iD2gD9KhBB/snZ2w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62440-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 86C165A2C68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index c350d231265e..aca90aab8548 100644
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
index ccda3b9fb845..3846d73b4d23 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -272,10 +272,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
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


