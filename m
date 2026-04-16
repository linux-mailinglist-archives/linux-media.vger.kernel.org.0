Return-Path: <linux-media+bounces-58896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEGIAsnn4GnhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:44:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32D40F0D4
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00844302408B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477DC3C73EA;
	Thu, 16 Apr 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJH9CrUL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DF3CB2F0
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347051; cv=none; b=QChPXkUgFp/hmg+JWiHHkU8PC4Oql9XM+y8id+XtVy/tjdIUDaJwqBeCIChfUo+oXk2ea0vRAdCdFmhmlNMUvLgLDbfM+V/9NVXKDfwTasezdBT/ocE1oMpL/fUeYk1DD/JcJCAQrKekb4RuCkuen1bRWvffqtrr8aSJ4dyxcsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347051; c=relaxed/simple;
	bh=Vb2BjE43Rj7+B5nWp9dgRNQNG7l6Oph7RvS6ZEaJ7QQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lqueJBVdoOU4c1jqQsgOWuYPDLou+QudOx0vNEzZmuc80qvyis2y6NmHeA99MZk/9lvr+rrhU8z715kxnaerXlo6sqQQxF83ni41cC5VyHeQXF6Xt7LgOgNeBkN+CpnZMq9XnK5rRguDDZg8WD2DLfwvxhESEFBwwxUP0DiJYL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJH9CrUL; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79ab3e26cceso78580927b3.3
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347043; x=1776951843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1Cj4R8nBBYaIsGoCFVXiPj3J3o46qtr7Y2+nHFPGus=;
        b=PJH9CrULMHMRp2wDjf2bfsZIb7I3ZL+ZhTVErbdCWEkNI3hWAdiKIj9lFDyik/z8uT
         ioDtXzEfn6s9jUYWiRg5N+15+DUHfKNrCvIjqCR3sIJL37QfK80JFoN97EBMtr5+mmJF
         6EaNZX3k14Zzx5NtJKhBHdND2Lkb0f5rcTCKLXrNmnYHz8D5Dt731HjYaqa+fNAXhQVp
         cyimAp57JnSZZprh3LrpITbBTDqijma2O0yAnG27VqPQRwVt2+PHrvkEg+H0x/ckTpVk
         JXGxsiEnLmRVVG6KqvIn14jIx/+cPucPIguij5c7N1rSugFwVP0hKAd1HmfSTjlpOKlg
         P90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347043; x=1776951843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1Cj4R8nBBYaIsGoCFVXiPj3J3o46qtr7Y2+nHFPGus=;
        b=VhwoPeS7amUlo4H7z9BKy9WbXDpxLct6FZO3AwVFDX9prV0izKll4/MwnUc02jNxg2
         5TP8eKOB/g3vEIq9vj3buTUueH0R32IDaFdihM6qZBvbMyXVn8l5XFkke4F8uCyKvF7x
         mQ2p/Ahm4DyKlwxWgW+OQ3Ib89i1g3hF/CBcU3BcgPeouj0k66hoj7bwt1xdCg9smpRE
         qnxGqc/nIeFRierldePXIXkEvMjv/6w19Yg2tluADUa5WjkRWcveis6AUqEH2XLKQ+mh
         xtlcudvI5xPQITpQk6CTlDSL13EH/HONVZg3TbWWDW7RcZQwKSi6d9qGoqn3RQyTcv5t
         8lfg==
X-Gm-Message-State: AOJu0Ywnrnmi/i2vEwlHEZWX5iZT5ravfF89gDpktUcg0OAS6XA5cerz
	X/MkgSHod7HuqILo/CB/b/PFxIqz888u6y9VK2bkqoxdTi2azvIbMI36
X-Gm-Gg: AeBDiev2UaQ5dD7x4kiJFyjG8LpNaT6HO2R3G5IXYRTBObEFyN/Iev6vlKfZuOKYdnl
	pIWzeKILFJTqpJSH9VuLpNuanKaT4rqAlJBW1RqR7f46BxtwUybM7nGnInkb8KRIbQ9IL/Hy2Qt
	7mFDDgxOJsQZiygKEwngLt3wFsgdwawnxfRXgmWJMwGoz8YmY7sF9V+1co+gpWll3G54ygK45h4
	26Ql5PFZtZYO7+C+cbg99UTyqINLo3NHCyG/d4tz59lSlrPTFNm8/2vEVc05U6hDlkjIdbLE1oZ
	bt8NNgx5YERsL8rDtYzypUtYCWE5wrGCyUR+hyL0RCGiSoSPPrxdYk91Qzf3YNqMCTMuwi7f8/Y
	FeRjnL+TiaNQEN2+EtJf2BSCM4wExnbjuBlPawKM3RoUSQN+O21YM4xlJiysKtmGqiSfwtDsfhp
	2w27Kq7MCc1Gwtq/UoRoJFjhsNFQ==
X-Received: by 2002:a05:690c:4990:b0:7b8:c19c:ee89 with SMTP id 00721157ae682-7b8c19cf5f3mr23684577b3.42.1776347042637;
        Thu, 16 Apr 2026 06:44:02 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:01 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
Date: Thu, 16 Apr 2026 16:43:47 +0300
Message-Id: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3dziXAtLY0vdstS80mLdorRk3WQDI9Nkk2Rzk7TEVCWgvoKi1LT
 MCrCZ0UpBbs5KsRDB4tKkrNTkEpBpSrW1APOsIyp6AAAA
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58896-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DF32D40F0D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

This patch series is marked as an RFC. Before submitting a non-RFC
series, I would like to have some details clarified regarding how Venus
works in order to improve and eventually upstream support for MSM8939.

1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
   for vcodec0 cores have only decoding bits enabled, as depicted
   by qcom,bus-configs property of qcom,msm-bus-clients children
   in qcom,vidc node. Do I understand correctly that these cores
   are only needed for decoding, and not for encoding?
2. Currently in device tree there is a video-decoder subnode for Venus
   node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
   subnodes. Does this mean it should be dropped for MSM8939 as well?
3. MSM8939 supports HEVC decoding, however, as the patchset is written
   now, it does not work. It can be enabled, however, it will result in
   breakage of Venus for faulty MSM8916 firmwares, because the code
   disabling HEVC for HFI v1 needs to be removed, and as per commit
   c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
   this would break support for some MSM8916 devices. What could be the
   best way to work around this?
4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
   vdec_get and venc_get later in the probe. Should this be avoided, and
   is there a better way to attach vcodec power domains?

There may be some other issues with this patchset - this is WIP code, so
feedback is very appreciated. Thank you!

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: venus: core: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (6):
      media: venus: add pmdomains to the struct based on the purpose of cores
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: venus: move getting vdec and venc for later
      media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
      media: venus: add power domain enable logic for Venus cores

 .../bindings/media/qcom,msm8939-venus.yaml         | 104 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  24 +++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  39 +++++
 drivers/media/platform/qcom/venus/core.h           |   8 +
 drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/vdec.c           |  12 +-
 drivers/media/platform/qcom/venus/venc.c           |  12 +-
 10 files changed, 374 insertions(+), 32 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


