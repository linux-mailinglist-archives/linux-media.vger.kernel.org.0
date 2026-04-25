Return-Path: <linux-media+bounces-59602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDwZKuMI7WkGegAAu9opvQ
	(envelope-from <linux-media+bounces-59602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:33:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA246750B
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B270B3031AFF
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541E837700D;
	Sat, 25 Apr 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHvdwkoU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E337474F
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141885; cv=none; b=um5XyRu+tC345nupP0eliK/VlRfa9MSL6bIgDDAfiQruA4UKadD9UjYh6cfaW6ExCGtL3jvPxesVxcW9fqyT1RcbXOfKDtw/HOkT1mA7erGWG8D621OGcVX1OMfPYDPSr4XweYoKolGfbzro+EWynsnQXhgNUAgm3lS7Rf0YboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141885; c=relaxed/simple;
	bh=/n90KONaiUk7JIMeCRq4mUrGxJmn4zHTMpFbTUT82XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeMh6rLd60gFC9Jz2wYjYbVYDjzl7sV9CJZaG4uAN2AWIh3U5XkRAD+Dmp8oMnnSNfL9gpoa3/zM+AcNrlbnSrY1uSgQMDMPt9VN7qOM44EUcU3CHYpBfkgIovKx08NnNBBvzUpNU3qsceEqNM6WHc95t89BK17ZPOQA38YaNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHvdwkoU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso92454255e9.1
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141881; x=1777746681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=tHvdwkoUpI1bKAdNk8pi+mrFxRHXnBU9czApjsQTGQpv7asrc8O1ehCubziToXHtIh
         7/mBF8Ah0EdMCYY1SX9Lemzim4TP9JMtKWURV7KENO4fbfVFKyMEL34RfLbFpTVqBR+V
         RVCbcZSKgAxPxaFY8Z1CTDZK1yH/ivCBPgVR0+1qhzoYQqgQDop3vlEXpGsJ9YOitKIN
         0ZbJWHnhvCjZzQWiu14xCQF0Y+NK30ie8ILU0lTZjq+NuPqtB866XTYAyqxgdnueB8OA
         kxcN8vWICCEycwBWRbQiFo7wUUsVaNrHQJ0GjOnxecuFQrZi+93ZpI7guYkfCZwjo1OS
         ipFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141881; x=1777746681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=nzttkcbIaUJ9U8YUcjQKYfGCFobttfCmxSXGdpgXm7NKJhevl21z/S5XdZhrlAdFo2
         6RTs3QKBxnErqNlCiUHkTlRz19e9XRpfNMOiLKCz96SkJwEVKYphBfWA8PLCn9+KIZNF
         jbvN5wQ5fuGmWh05RinEV4OcA7ZcmrArNLVrKmcAAIRWvdcJOTh05KpJVoTa7anZcm7G
         QVYuLcoinDIlqAo6hfpdC4oZ3LS1OWbJh0LGjxpSIi+xBw4yvvfbmgJzbte6A2jwo0tr
         ZMYYIiYmrWS+s83+3vy+Km80JsQbajlmjIe2bEgX0xvFL7Nul8VgKUEQ429Mxhw7yEx7
         7vsQ==
X-Gm-Message-State: AOJu0YwGntaKBy82srk9WcIVe7A049cqxofxQIVZYx8fnNuU+jsWM8T8
	VuimupP0r/0+ly/Ur12UZ3zgwmDuaJoLWU59/2b/j6qcIPbwnep4wvdf
X-Gm-Gg: AeBDiessnvPHG67ltJGEAn+xNOh1D0+m1BPxQ3aWh5KBSp24gTzN1NA2jwzLUEb+cdT
	hpTa0vmK3YqEQxQRj1AHGEUY0Zq+tPufMsqPt2dzD5LQdAxMx05sCDefv83W087dVHexfz51dTW
	1We1W8Ol89QEHoetM9XNbwJWqYNaco9Hc6MnjS9NaOma4kxiXknooJiCIKmdwr1n8KeUqHZpP9y
	aOdlqKktkpPsl8nhl/s0rJqIf2Hcp9wTqxtrqD7P2v7iVNsZwgSAQnujHy7vtm86j4HVlXxp2P6
	Ug87dC2t2K2ZwreSAOwtv1HP2F1Pjz3H35Grwsfg/M6C5PL/NYlfc0ErS2DdTasyvmjHdMbcX11
	Jr5MdDgcizTgXs6kRtaAXWgoDTOikrVdk1XrRj1TGC3lhUzCISgJZLeBaM2MM4S4OPveoucq1u/
	P/r+s8t/o5fjGYytozt4vGivhiOkMYq4RE+oA=
X-Received: by 2002:a05:600c:5295:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-488fb77d12dmr525819325e9.16.1777141881001;
        Sat, 25 Apr 2026 11:31:21 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:20 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:03 +0300
Subject: [PATCH RFC v2 02/11] media: qcom: venus: add pmdomains to the
 struct based on the purpose of cores
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-2-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 10CA246750B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59602-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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


