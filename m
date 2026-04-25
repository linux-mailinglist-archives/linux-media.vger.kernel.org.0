Return-Path: <linux-media+bounces-59610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHnqAvsI7WkEegAAu9opvQ
	(envelope-from <linux-media+bounces-59610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:33:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958846753F
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD8EC301E7C8
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59B037BE63;
	Sat, 25 Apr 2026 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSxqb0e3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AAB37A4B9
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141905; cv=none; b=g+UYZlP46u6gjLg8V+GQ9FC7oHm93fsFgIE0VbcW8jRV/UruFrtDA0U5wBW40xHBEDzYktBjxCB7hz4Zix759RIJI6ydFquXAfCoGGGyVWjhy/sZUc1ytOwd/xpzUZSVquJBtjxwXdF7/odfnJbgG9a7ZvhnW4DKWw9g5+j/7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141905; c=relaxed/simple;
	bh=a7H80R42r3F7Ek1jE2GWR+lyOfXfzqpGUFLS1QAha0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQ8ooXshJ984QpATtgpuIs603xf60dBSqbiK8PaUp76D19kLP9a3O9Lb94GGhumqBvQ5XnCKPOhuDspcC5XODM4CawE8dT9H4GC34Z6UFGCBHSziR14ptmMdBEClmzcHGZtxiGteMLbUNwzrkqNlLYKRewFKZ9WYUDrm5NKlQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSxqb0e3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso92456035e9.1
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141900; x=1777746700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=fSxqb0e344dGNAPKn/eAFTTXa2QGyYRMAUyJI/vwNvxXyu3ld6A11XMOEKMWmmps+u
         KrWWatBypeaPXHfhkTjyYX6SXQ/Bi690I4Dc74IAIJMKfUNs2GKioVDnmwWsV3782beQ
         +ErpIOnmBcLZx6ZdnnJEPn8Xbv75iJ+NDejoCeTmWYLXH8v/ajLf35MyG3RjU27tigPX
         9QRzMS8Le0VwdqmBJ6Nrt3qUUql3v2M0E27OtTaf2YgFgQMgtPERBGDBTcsxFI4GAbSg
         hF3Qi6HtBVSzHaxniZGZ0JcNoSmlymdu2RLwH5Sj/5dCiXXwPbz2dYM4uIkTcIXKigBS
         Nztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141900; x=1777746700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=U12uldhLSaxkErosAhHmTD+7uxO15Q5sbdIZHUem52KCxPdpvWivaL6k1VnaXL0Fjf
         i2SWnbfuProQV2JSpiMfJyvq1PQRNlfVjEG4KouEqP4W1CDtb5I18UcBznRWBjXmyxII
         pDRPyW0GL/ZmqLk1YdoLuas02fyImiRj7KexTP/9ev/qaF+q86xdvDHnH1ELGGxto5uD
         GByP9s9ERtK+UA9PlVun6XcI2ozpvxqhE5/Kprhxt4pWN+PYTn2R7WKCWby1HbZj28Ue
         PbgPfWSfGR9ZnOOAHMjS0ZxIPOJAmixnoBy36NePzCgOPaQA07kTgBeo4CZwp5+x3jiw
         xWvw==
X-Gm-Message-State: AOJu0YwiN/SZmuTqsp3hLtOChupJjX1RZRwOau6ZXQGG/FtIWOsLixIs
	eSbN77a5SxfEIVBBcLp4Q4CLh/K/FpKhcuV8o1ynHkkfFFpvDBcS7h8j
X-Gm-Gg: AeBDieviz53rNp1pB3FMGNLR9XOQBCgLzrtoQX9a/cwW8Ny8gxPigiFftzkoBim1IYj
	WTbSURy7rp9HeK04jGkV4VorwoPQWxGWoT6mUR60J/2lBbsltOWMXSyUTAY36Th8+5wK2WZniOp
	92IoryM/A49Rc+JMZGCLayYmTW/tB220qaQ4jI3hcYtTNLZY9zY5dUDegVMKidjUVIm8lGRyvYK
	NF7BpflI7oAaKhizNgkSd4BJK/1grPMi+oG7qSWrNqUbvPu9oyi4XRqpJZsNeggGMEWantOmoR0
	26rcrkIoKrxGDZzwIGoLktBBE10KcTjVQEoTQNyhbrm4hRWramY6K0vb8Zy6xnTUBz7WJ2/h7v9
	3nO2DdRnuHzB5P9xvm0Ec2z/KwfrTyBg1J9QILa1Gvewcsz/ZkQo3nWjdEygPLvTFlo+ibMciwS
	XRIOk7hxoI97V9fgi2RxX9fiGcweBmd9fzH6k=
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488fb745294mr323101045e9.1.1777141900459;
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:12 +0300
Subject: [PATCH RFC v2 11/11] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-11-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 9958846753F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59610-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ebe166b5c955..98526a1735d9 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..178274d10c02 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -207,7 +207,8 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->enc_codecs = codecs->enc_codecs;
 
 	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
+		if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))
+			core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}

-- 
2.54.0


