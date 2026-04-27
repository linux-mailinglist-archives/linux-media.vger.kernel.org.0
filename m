Return-Path: <linux-media+bounces-59706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFaAFASk72mcDgEAu9opvQ
	(envelope-from <linux-media+bounces-59706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:59:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D034478024
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 645693006139
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCE73E959C;
	Mon, 27 Apr 2026 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZN5O3B6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E8E3E92B6
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312731; cv=none; b=b59nZese6KrniFy3MuhmPG692uUwvOezyn8lTFzuxf/SgpWdLCS1IJlNBhbd4w9hmP4FgvcGc5ZNK4jJ5kobxLUxX1e6CwkOi1OHHNic/X7oKFlE+ZuFmHs5VhATuTl5QNl0E5upbINWOozJuJF/MKBi65Hgw0LLVPD+bwxyQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312731; c=relaxed/simple;
	bh=/n90KONaiUk7JIMeCRq4mUrGxJmn4zHTMpFbTUT82XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCxHRshSvBqbz8Vb09SdK2uOwa0Jq/1S9f50V/DIh5m/Dw7ClppZK9xKLka4ILf25FWeOLsiiZ7+P/DJbsDHDdz1bXs0iAxk8r63BZClkNGZnxYQRTLwj55iV4wfsxRbmlxyTVkUXmGxLmIUlp6RUuGM/dfJpthbzkzrzVhguIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZN5O3B6; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7a4f9cf2b4eso83197437b3.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312729; x=1777917529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=cZN5O3B6EjJfy0OqhkDkSh0dRO+1NS2I3Tv2uXf26BbAHkfrQ4DWqwiiS/QwYxqn0E
         f+ROFB0gkUvd3Z/LWoWNgitODC+khdjTn1M/j5QlADkEQ3j3qloTQqYcDV03K/7Zs4G1
         H6NRs0mMEfIMsA+7EhsFKI4/Ar87l9DhsrUO7xy8zy9Ns/Tsug3gq9kBo/I64piZWqbT
         1vOUfXqb9Q6GpVAndrsr4Pu4Ndgidy5Z6wUKFrgozKyjBUI1lHXlv2UYnBsQXjBbCVLU
         qOu13E2Dxqij5eO2CfOakFsydVkaj/u8Rbe2HTGDFpVaYA4OFeZvinIcosmwFcvhiHyY
         fhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312729; x=1777917529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=RF1jDrovIwe17bZlTN+3ZZ8S3myS02GuS9earc9SVmHbueK7si+OMWXSiXQ6+AeyGa
         jLlqmS7pDSkyZMYGs/m4rwd3ZxXoBOHcDfXmN9Z0Wg4thTbnoc8T3FquyfpeMdDRsH1I
         Rb1LhNjVU6aQtbqeuChk2j7CEZjwrOs4DgdLxfZZfxw0hDKaTKUvk0P/ZWDQ2aPcEJaD
         fX1LJIPm1+oNclzY/m4ZZ6+28Czinv3qUQIxSVWeXP8hdhhn+wwm1akVXN4h79cH5jQu
         gnCTWdPLHTndg3zs4hT5OxtXreVKGA7mh2v7W88r6dGa3fUrA2VmoU9iY1H2wBv/FTSQ
         T3OA==
X-Gm-Message-State: AOJu0YxGFiusse6gszG8rb3fLVRPwiR0SvHRmOiiYYFvYH9fR67ryhs4
	EuDs7VcJo3BN2V6xt5XdLbPR9E5p9MSi4q3wPZr0olBl81PUUQmrF43m
X-Gm-Gg: AeBDiesLZonAuDO0c7GI0yW4igIH60FmfiDtUshXW32uQ5vuHlvrOKjnty20Amvf2Wl
	+6G9bz2EeaO+lgPbJKX+r9/zuvqkvChdFOMQQMH5OsSdrh+RXW4fSx2tRM5052ZUc27HcRxxyeT
	GRmgSImJms77FBFPvxJmcKPxWfnWPg23G10ijiE3JDTI60tR4SDbJopv1lGFSvCL7Y17W9Jhmjl
	6zTL6KyvmsRfpnX/LWbH5svNUAoJabPsqV8RjmDsccUdHBNtuwIR1y7IbhSAcBwzMDAU9C0LeKL
	T6vaVU2LNK/hKdbvExu/DUjarigOvq9/O6AlbT5zg8KfHBewgoy9You2AuU3I+j4GDB/uhFIDNA
	optHeWgmtxQLv8mnvSV57sROSBxZIuZxOj5pC7DADgyVjBm68WcWVYlkmwYNcUATGeVXjyLklKN
	thauWk1pqsb/C8t1+bsUw6n2G0JXnLfBJNNiuF
X-Received: by 2002:a05:690c:9988:b0:7ba:f0ed:c5ad with SMTP id 00721157ae682-7bceddc8f90mr3208727b3.28.1777312728574;
        Mon, 27 Apr 2026 10:58:48 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:48 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:24 +0300
Subject: [PATCH RFC v3 02/11] media: qcom: venus: add pmdomains to the
 struct based on the purpose of cores
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-2-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 3D034478024
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59706-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add vcodec0_pmdomains and vcodec1_pmdomains to indicate power domains
for Venus cores.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..1a919439abc1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,6 +80,8 @@ struct venus_resources {
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
+	const char **vcodec0_pmdomains;
+	const char **vcodec1_pmdomains;
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
@@ -144,6 +146,8 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @vcodec0_pmdomans: a pointer to a list of pmdomains for vcodec0 cores
+ * @vcodec1_pmdomans: a pointer to a list of pmdomains for vcodec1 cores
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -198,6 +202,8 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct dev_pm_domain_list *vcodec0_pmdomains;
+	struct dev_pm_domain_list *vcodec1_pmdomains;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];

-- 
2.54.0


