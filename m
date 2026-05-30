Return-Path: <linux-media+bounces-63078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPGhAOgwGmp+2AgAu9opvQ
	(envelope-from <linux-media+bounces-63078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:35:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECA60A304
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F4DC3047DC5
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0764213E9C;
	Sat, 30 May 2026 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3je5mpY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351801DF74F;
	Sat, 30 May 2026 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780100739; cv=none; b=LA5XB8JxVUcLXAWmF69VEaSYqeuyZs/K58jWLxl7Iiji7VVKA7h1WVTRPAphHbDH59Jl7FcdBrWrpL/But3ee47h83siFuCSO4mAr2piup6cwo+mHNR3Adbch6KQFRYkmwHcUxBY5kRBwzlhx8CsyGGZbzgpEjbqpP74x5tWkAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780100739; c=relaxed/simple;
	bh=1c1YEqubeOCKXelj4uwE5ucnVXoxUtWGMkouNwsJ4xg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bsNCcfc9QyWlX8ucpGi0IkdGtDKH3D4REKDIbAoGF8BHf7ciBVFQhwfVawFvxcwGycjfSFpQr6S+7bajdvAyud6+NZa1bHWuDp/yq3CfXWvtAYRyA7fR5gqX9JlIqTKmyEbiGKTnUEOLUJAKJZP2u7YHvPoeTeii7mQU67WJOUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3je5mpY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4BB1F00893;
	Sat, 30 May 2026 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780100737;
	bh=ZtHJztuMh6Vd0fb/j5SuvYaXaeidOrtdWlSiZ7yhi1U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=A3je5mpYLWfThjqdfvIHTYBwPgpbJpE1ERzGDUg/abYSrUYTaOlGFI6eHvrJfdEI9
	 /4UU2PubpKneXLd6WCO2iEO8Q7C7/ovoqBcSFAAUAQErotjl3phRI0ccGfgrvvoxh3
	 1BaQfSyWj1oOAhqMIRzjVrNsb/l5AeJ1PwyTY3NYQOU60WQZXAUksy5jZzGQAHlTCp
	 qo6c8+wphBOxJQKYCIrITzj3phV9FalomMF2SaKhU4XuySLDL121m20BOOIvQ1Jot1
	 bKZjbjB8eZSESAkgBotZsr7k9tOE3BixM3Hw0QsBASPonF2XQ/jyvH1QCRQb6K17sf
	 2xgxW4nbjinOw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] media: iris: optimize COMV buffer allocation for
 VPU3x and VPU4x
From: bod@kernel.org
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com>
References: <20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com>
Date: Sat, 30 May 2026 01:25:29 +0100
Message-Id: <178010072997.281459.14229826511412321235.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=5007; i=bod@kernel.org;
 h=from:subject:message-id; bh=1c1YEqubeOCKXelj4uwE5ucnVXoxUtWGMkouNwsJ4xg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGi59mYGzBk6xqo8M7IW6vw3xvE1Nw3A5A34TX
 C0uXwLCqt2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahoufQAKCRAicTuzoY3I
 OuDoD/9eK4OXGj0HbJxS3Q0FdO7jphqcQrJ61TvP38xFPrVoBEKd/0zfJdu7aHCiUqBMRXG1rVU
 HOxUXWSdE/Wte3/6hIUN5O4UmhIbknm51DCz6U9u8YxxuKEikM5zYxIgrR2TjYrGkHApQn7Ux6H
 V13/VSQMDli/br2Ad4TAw2TOOBUH10fGTBMjnw48VDRI4fjH0cQOIEm+9t+ILaDtKuYYiWWzMBe
 tDlWLe2zq38v5PNmcNn0FuzPR7Q4IvmpIU5Vpk5O8NwcNV1oMmpAAm4auQlf6SsYW7GI4GgDnnc
 IEV+owp0m+pbs8zedyulRvXHMRCPoxt6MTVnHKGPMrk+vm9ssCBHcNl/7V+blhbbkxLTI0MZAys
 IS+JeCM4QUvz+Oi3s9F27qzNq/8f8l0Pl5xlNO3enpvxy7FCWNX8QoVGdmGmwQJEpS6cjzaq6s7
 4B1G0a18xVWmwAvNQLBb2IFNXBXZrXKbSZo7hkERTg++PZkI8Q91sr4D4JZMnNEomgklBu9DUtU
 dIAzFbuyJjKUjTs7eIguxuKSzBahcWo0xApIYqun2pJsiQ3H+irzS/gzW0qCNIryfGM3NdrIUuE
 VurmNlXGd1WGGZ5zMM90GKJ70R2M2AN9ruhlSz/Iu+/KMVGaKcbrNrC8eWpvWTpNot49u+AfaUe
 c68suAIVeOfRXXA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63078-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,inspiron14p-linux:email]
X-Rspamd-Queue-Id: DEECA60A304
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-14 00:28 +0530, Vishnu Reddy wrote:
> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
> num_comv count unconditionally when calculating the co-located motion
> vector (COMV) buffer size. This resulted in an oversized COMV buffer
> allocation throughout decode session, wasting memory regardless of
> actual number of buffers required.
> 
> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
> replace iris_vpu_dec_comv_size(). These derive num_comv dynamically, it
> uses inst->fw_min_count once the firmware has reported its buffer
> requirements, and fallback to output count during initialization before
> firmware has communicated its requirements. This aligns the COMV buffer
> size to the actual count needed rather than always allocating with fixed
> VIDEO_MAX_FRAME value.
> 
> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
> COMV size calculation to use MIN_BUFFERS even before firmware had reported
> its actual requirements. Fix this by initializing fw_min_count to 0.
> 
> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
> to 6.16MB per decode session, significantly reducing memory consumption.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebase on linux-media/users/bodonoghue next+fixes
> - Resolve merge conflicts due to merged patch "media: qcom: iris: don't
>   use function indirection in gen2-specific code"
> - Link to v3: https://lore.kernel.org/all/20260506-optimize_comv_buffer-v3-1-c1b4a44e4300@oss.qualcomm.com/
> 
> Changes in v3:
> - Update num_comv from instance data instead of using caps num_comv
>   in set_num_comv function to avoid wrong value update during concurrency.
> - Link to v2: https://lore.kernel.org/r/20260504-optimize_comv_buffer-v2-1-69379a59e17d@oss.qualcomm.com
> 
> Changes in v2:
> - Update commit description (Bryan)
> - Update hfi comv buffer count value to use actual num_comv count which
>   used for buffer calculation to avoid any overhead or fixed values (Vikash)
> - Link to v1: https://lore.kernel.org/r/20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com

Please rebase.

<<< deckard@inspiron14p-linux~/Development/linux-worktrees/b4/bod-media-committers-next-plaform-qcom
>>> b4 shazam 20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com                                                                                                    ‹git:next-smoketest ✘› 01:14.01 Sat May 30 2026 >>> 
Looking up https://lore.kernel.org/all/20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com/
Grabbing thread from lore.kernel.org/all/20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v4] media: iris: optimize COMV buffer allocation for VPU3x and VPU4x
  ---
  ✗ No key: ed25519/busanna.reddy@oss.qualcomm.com
  ---
  NOTE: install dkimpy for DKIM signature verification
---
Total patches: 1
---
Applying: media: iris: optimize COMV buffer allocation for VPU3x and VPU4x
Patch failed at 0001 media: iris: optimize COMV buffer allocation for VPU3x and VPU4x
error: patch failed: drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:10
error: drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c: patch does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_platform_common.h:87
error: drivers/media/platform/qcom/iris/iris_platform_common.h: patch does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_platform_qcs8300.h:15
error: drivers/media/platform/qcom/iris/iris_platform_qcs8300.h: patch does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_platform_sm8550.h:23
error: drivers/media/platform/qcom/iris/iris_platform_sm8550.h: patch does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_vdec.c:24
error: drivers/media/platform/qcom/iris/iris_vdec.c: patch does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_vpu_buffer.c:2025
error: drivers/media/platform/qcom/iris/iris_vpu_buffer.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

---
bod


