Return-Path: <linux-media+bounces-63354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPnyB++WHmrPlAkAu9opvQ
	(envelope-from <linux-media+bounces-63354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:40:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E762AB7A
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AAA43012B32
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1952377EBC;
	Tue,  2 Jun 2026 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYCfQ+Df"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888613C73F7
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389571; cv=none; b=uffpUtjO8LCaZ5yJWXYDbTikQsatBo8flideced81sTpR1PH5QwyTktEBLJXchNNKkKDHecenV0eyAEQzKaOdGV6f4G+kF/Fb1ySUvo9aNKyqmqegKoUv+xkiuwI/MZzXYnwAqw1Dcwilq7b/v7vV4lNkdGiNKDPfPfWeDGT9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389571; c=relaxed/simple;
	bh=AGNlMq/rmW+DgIPAyuJDu0dlqI4I/vZ6MLbj2JdQR9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onrKLGx2wOYHmN7tOwPrGzwN3ls6zOAZBaE6Ja6TTskchTiQf3YzBF7ZeSMFRvO4EkRO6/rCapLJ+dToC6XFqwW1MKy4Yrhy9QCWt0Dx3Nfavig1Zt3DKv0AmkZc/SYh3tncGuTMiLXM+xchsTW0NYTazypN76aqb9idUqE7N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYCfQ+Df; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso11803055e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389565; x=1780994365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbnfuFDSGtjOdRPNnS9h8MPvEx7+PQJBmmZ8fMbaRcE=;
        b=AYCfQ+DfQJ35nmJ1eXd4umqT+RlHwNX/rFTtd5XjJkmtn8jPKLHvvcmWFuIPvtLSt0
         HmLSoL6AkVwCjw7EuUuWJnBeCLdPMR36pc8aDVCSPVaez17Ecj8ndvZvZSs0/uz/Jf7q
         r/hPnbq1u2BKIGB6quFtJoM7DCOr1DmHOXqbZbE6LHDEJpaCU70PIJjlbdg58vHxaIAg
         ed+P7V2LSHzYfZRRj/HWBtVZLfsG51tzyd5jvqqJqjdqbe6tabEUlFx7uWtkRQL1j4Ow
         dBxrpwsNJRz/1kKsH3V8cV6iYuzhkIRU0j7Q9shFRT4Ko2c6atJ1EkmmvnhRBcvMjvkc
         gDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389565; x=1780994365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JbnfuFDSGtjOdRPNnS9h8MPvEx7+PQJBmmZ8fMbaRcE=;
        b=YdxnmKA78QdAQ5tl1uh/z8mdCS4MtDIu8MlkjAcDD+w3VxVb/7H8FMYZa7R4+BgPOm
         qZ8iIqtvHoU8HDyvLExuIJyMSyoKOgwo9aHqgMzNCRhSg2GMTBbjTE6v6Cn9pauRjY42
         aIcOxxftZnlKKQYZfEJUwi0VxzxpIqa2D51RsdHk3Gly16yXpoJcSTO29L9+J3UMcp7X
         4iEUu516uIU1PGyN/Gs5nFqohaFzbImMKymzRYkAmhJ2bSPNqbn1bxgz7HzZLMu9hoU2
         BNp39100DzAciCkv8szPeN6SLNSkWlnL6xLOgdp/KV+59q+uBAdfKiHHIkyMUeVP+wd4
         gR7Q==
X-Gm-Message-State: AOJu0YzVqJUJLLKzOUIh+jeQ+4adLMH1rH0uuWj16qHXhezOf8oN0vuk
	q32T4Ex1lUZUoNh0Vwoq5h/2PTHCOPPURq6HQgJz0PLgJNA51HNwJpEz2vGarZg6sA7U/BpAw5B
	48Z5/
X-Gm-Gg: Acq92OFd30GUg0l2Hc96Kaxx4pZq/j3tcSdqB41FfYYcDCllMDjoxKgIeUKDan+GYdV
	OLdZ5XV76N1Ks160hWH/mrO7/N/CdxweBwGq76jV5OPwhbzRxzL3G9kZvLs33ZDHuoADaM+hXvZ
	jHNPojtm2rqWWfAmO520rXlSZeHb6ZMorAV8RH0268utUUw0h3aZea9DENbTxnmnc3/dLI2T3ZQ
	0J+cJ/w89vrHUV1opljsfEID2F23JFp1Lyaipi7g3ExQzCQTFpM7s1bi3AQqN6IdZhtKPbtyAiK
	Ktbzpzkae2NI6NKHyOQn+VGzNgco3JB6lOtG3kUn+owYq5P4Oqc/bIl7x/3EP/YztCwRhdCkB62
	SYchfTm7gNKFAwMQwDIgLIx7VE5DbptHjnI0oJYa8mttKz/OqjqR8Fk5AABRgyiM44MYHsdw3jP
	omp2MzSEwI2yjCnLpw4gdqvYSrd6jtZzXlLKMzwff3un/6JPxwtz2n0Mk=
X-Received: by 2002:a05:600c:3acb:b0:490:aef9:aa3b with SMTP id 5b1f17b1804b1-490aef9ab5cmr85735165e9.32.1780389564713;
        Tue, 02 Jun 2026 01:39:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:20 +0200
Subject: [PATCH v5 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-5-c2b32474ed67@linaro.org>
References: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
In-Reply-To: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=AGNlMq/rmW+DgIPAyuJDu0dlqI4I/vZ6MLbj2JdQR9k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa3YghYS42q+WEludXjGeKj4fmuAg53dU5d53wp
 MaJZN6GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtwAKCRB33NvayMhJ0WwaD/
 90phSUtZprGcg/QO2ak2gfR9cpgLPZI4RqhTRd4QxlnTCOpfPGCV5Zt4JNiLGAhA9Sb+Ghl2+BGj58
 O91bjyUg+9N6yAwdQi98yRpmqF9Fc0EKxarPo3F5D6BPYL/IiZG+DhdCUvqT1dnqV6NkHddV2fuKnr
 +0FTDq/xh5YEtXp4jlUsbBcs/JtvMu5XOysq6xR89rJhp82XNxlfu5OsTl/eyHSFyvG9XImUMBD2N0
 vhjXk8GsnnRI8vVFUrEPyneMRMStiGzAQvP22/SUD9D/Po3w/D4Ksi5p0IiDtTf3FJHgRUZjxlbo4/
 Zv0xNlUJ0vGxxPRCKRFkM6xLSUEfiZUMielOQZW5JzijFwJ7O+isO3wAaic4AGTcfYgLiF/KGI/47t
 HyaTc5cUhbYeYMqoxcOeUWSovS30T89QVJE7ePA613oHTUy8oLKRuFuGj2jICJhQ3Vu/1rwUaXf4o3
 W2/BNP65kaAfRKrojplV9eJGKzBWeO9hhkNoaWDj1Av2yMPHdXuXUVAWQ88Tpt48hY93wHNShIH5AC
 kgb1O+aixwzpIAMTfgTqdi3o0Ooyd+M0PMFVKznZWjgLe4yPXAr1ifhGvhTY6jEgLeZYPVG9bqz37J
 pRMf/ct2L29QmV0UZaGYWezHvr8Ay3L4KL8LKIU6/iHtO/uT91IM2YFEZsrA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63354-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: B03E762AB7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 10bit pixel format can be only used when the decoder identifies the
stream as decoding into 10bit pixel format buffers, so update the
find_format helper to filter the formats and only allow the proper
formats when setting or trying a capture format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c            | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6d69a1e3dcd3..c9256f2323dc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -17,6 +17,7 @@ struct iris_inst;
 
 #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
 #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
+#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
 #define CODED_FRAMES_PROGRESSIVE		0x0
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 92e9201cd3a4..d55671340600 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -93,10 +93,23 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 	for (i = 0; i < size; i++) {
 		if (fmt[i] == pixfmt)
-			return true;
+			break;
+	}
+
+	if (i == size)
+		return false;
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (iris_fmt_is_8bit(pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
+			return false;
+
+		if (iris_fmt_is_10bit(pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
+			return false;
 	}
 
-	return false;
+	return true;
 }
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)

-- 
2.34.1


