Return-Path: <linux-media+bounces-61640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOusDA7sBmqCowIAu9opvQ
	(envelope-from <linux-media+bounces-61640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:49:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F154CB80
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EF2F3016839
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 09:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8242E43DA24;
	Fri, 15 May 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljEUs9m6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5842B733;
	Fri, 15 May 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837713; cv=none; b=WcZRrhjtUjZx7b5c4XaRDDcQWhmgibSkWtle6uihDFYI5ASR6K/lGxw+dc6wZSmzHB7ELej/pC0zgQVHmcunpK/9mbaVigiJL1eQFDhdZsWVpOCbUwbSfDytn41IDRTt+U4WVOyx49C4TuQRX2cMhlPFtHSrpAIgVRDr0vPnKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837713; c=relaxed/simple;
	bh=6+Z2hFPm2CGaDDYAFq6XLOFDhDpjRJ6rarPLFafTKqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEUClb1ChChX5tfwSiFKTiohDj/03syjZW6B2DKtgvB4bwNHND2n+6fploVsXRcZmPkU7WuQhBd3qk8nZaOwxbz7qPMoNy/u8ktu06mQ4kxwndhLFGkV/FZMrRcXbMg5gCvSvFUS9TNGKyOxHnpUc6QKGMIeNiOPd950c5/U5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljEUs9m6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9604C2BCB3;
	Fri, 15 May 2026 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778837712;
	bh=6+Z2hFPm2CGaDDYAFq6XLOFDhDpjRJ6rarPLFafTKqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ljEUs9m6V8tA1WOak8gM1zqbVrzmI1ancVge9Ngh4ZCS1BtpCy7eK3NR3GOe9neg4
	 mbIJ2Yo8eQqNy22ykzf9GhHoQvJvFhc1drgCI18bscYSuxtGTi64rnYmMxGjZaSzxZ
	 SeS62KX8LQnTdBGxhsaRliikorTxuv9WTil5cVtzYTt+iABqWhbDswGONmsq5MhI1s
	 tH24npT9bji90xbFRn5aBJzCdkzmilBXcpzs059o4Hk8Fv/MUtOoIx3dH6cSMp1jI6
	 uEAV3W3FwBNEEaL/GUSXYKPksBYM72P+lhtfV/+3UgO9EW/Dy/cAzWEEjtxikN2LQl
	 By5o1LFMcl5bw==
Message-ID: <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
Date: Fri, 15 May 2026 10:35:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5Yg7em0Xca9girDZT52cxZaTg93xJtZD7C2ExswhAkholGSsMsWXMWxtbtsWmkGeJWjp56SmJlLhj55vO4e0nw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 924F154CB80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-61640-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


Can you rebase off of:

https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/next

and ideally make sure everything applies against

https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/next+fixes

bod-media-committers-next-plaform-qcom(next-smoketest*)$ b4 shazam 
20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
Grabbing thread from 
lore.kernel.org/all/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 25 messages in the thread
Analyzing 12 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit 
formats
     + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
   ✓ [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size 
calculations
   ✓ [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit decoding
     + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
   ✓ [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride 
calculations for 10bit formats
     + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
   ✓ [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to 
handle 8bit and 10bit formats
     + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
   ✓ [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into 
10bit format
     + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
   ---
   ✓ Signed: openpgp/neil.armstrong@linaro.org
   ---
   NOTE: install dkimpy for DKIM signature verification
---
Total patches: 6
---
  Base: base-commit 76671814f2843482d97feca12e95c06f0b05bc8a not known, 
ignoring
Applying: media: qcom: iris: add helpers for 8bit and 10bit formats
Applying: media: qcom: iris: add QC10C & P010 buffer size calculations
Applying: media: qcom: iris: gen2: add support for 10bit decoding
Applying: media: qcom: iris: vdec: update size and stride calculations 
for 10bit formats
Applying: media: qcom: iris: vdec: update find_format to handle 8bit and 
10bit formats
Applying: media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
Patch failed at 0006 media: qcom: iris: vdec: allow GEN2 decoding into 
10bit format
error: drivers/media/platform/qcom/iris/iris_platform_gen2.c: does not 
exist in index

that file got zapped in:

commit 53a5e095636acbab817a7fb98a67ce76cac59fdf
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Sun Mar 29 02:33:10 2026 +0200

     media: qcom: iris: split platform data from firmware data

     Finalize the logical separation of the software and hardware interface
     descriptions by moving hardware properties to the files specific to the
     particular VPU version.

     Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
     Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

diff --git a/drivers/media/platform/qcom/iris/Makefile 
b/drivers/media/platform/qcom/iris/Makefile
index 2fde45f817276..48e415cbc4390 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
               iris_ctrls.o \
               iris_firmware.o \
               iris_hfi_common.o \
+             iris_hfi_gen1.o \
               iris_hfi_gen1_command.o \
               iris_hfi_gen1_response.o \
+             iris_hfi_gen2.o \
               iris_hfi_gen2_command.o \
               iris_hfi_gen2_packet.o \
               iris_hfi_gen2_response.o \
               iris_hfi_queue.o \
-             iris_platform_gen1.o \
-             iris_platform_gen2.o \
+             iris_platform_vpu2.o \
+             iris_platform_vpu3x.o \
               iris_power.o \
               iris_probe.o \
               iris_resources.o \

---
bod

