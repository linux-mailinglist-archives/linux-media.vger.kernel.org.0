Return-Path: <linux-media+bounces-58870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPlkKJm14GlClAAAu9opvQ
	(envelope-from <linux-media+bounces-58870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:10:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84140CC0A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F261E303099B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC9F39DBE8;
	Thu, 16 Apr 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIS7iQk4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAC39D6D6
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334190; cv=pass; b=A2M8iqHF7MwlYAWQ7rLyYWLqktut8t10EEzPZS4dd7red4gdE58Tl5aegKNkDcdScOASmXOl4VRJH42c9E3PZOyp2xLbe+//fIwCF1H9rXS4u9+3QUtT0n269qv6HQAEE/jRUZnWZsCy+qqChtgcKRylocEe1TNU8FP5kgg8XWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334190; c=relaxed/simple;
	bh=K6KMcyaN6kKhsHJNW6m88G0plVvYQ8wSRi3+Sq1KRvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=WmMEEBolGZdjBTUbr+v8j0E6AjuXGabBLzOmBZXL/4jAsNymoSM+ct6iiV/bR/uG/kkrxahBQ2U8ojLWEpA/EtHLxioYkE6Y+PniyPkJpJMCzU77oGu577+wB8s7FPuwkznyDAMkwgUnQXI5nmZyfkVjOYS6BOLJLU1LEUf55Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIS7iQk4; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-651b6a003f6so3031931d50.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 03:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776334188; cv=none;
        d=google.com; s=arc-20240605;
        b=FSqHm8q4MSFciLmoeUWEdouo/s0j+U4D7UiiVACzdM4C+yia/QXH/tTPbpsJ+DrUmK
         a+877k8hgXIU/9ygVcMDDRbiA+G/0LXTXIpYtUdYlo8MoNOOJMQ6ckmwFn/73YITJhK3
         cvi5Vvh4ob+9HgCNEzIbbnoVmbv4hQl2TCwoPStcw4UhObLheTuzehuqOelKd/pmmHQj
         i+i0c4g/bOlu3u9l7oFCOMgx3crk0EqxEyotq7o14xXWusWSd71LeWAEHlGIaF8Cna2/
         ifXAPkR2pN5FQNQWHV7c9qwLF1do788leGw8YdbQKtg+ASyYhGk4FUE5BnzRDZbJio5+
         M4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=K6KMcyaN6kKhsHJNW6m88G0plVvYQ8wSRi3+Sq1KRvE=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=XqXmIVeZ/HtKIKoL1feISIzcLSgE6/6XKzvY2jyS1xzOZOaVnDGZKFhjE+gg95RUF6
         ebt8ko9093vmqYUZT6LpPPlh9yZ7gVd1eU/sMvFHO+6fWPjUV6kPqwX9izOqNlxFp+4P
         dbr4yulWJ/jG0lXT1tP2krZYkeDe6zaT1S3gJVjY6m+MW4/CCXoRD8UpI9Cub7Buxws/
         DxxrP4zvOStuqovZREt4NAckUlnNpXQSKwBAK9G1oMA2gvajZydY5WeMiXvcwkMtzMEH
         hNn5HP5zZ7gi0AoqifQHC/TpvWg01n2TFfbufPaU3SUT9q30vAwf6gGiQCNH1b92/Ii+
         mgag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776334188; x=1776938988; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6KMcyaN6kKhsHJNW6m88G0plVvYQ8wSRi3+Sq1KRvE=;
        b=GIS7iQk4RYqxDMbb4e/x+B4sXwWrzkOj60NfIl0YQjmX2r3++0knsjIwn1EpuQJzJh
         vTQnuZzHKg9VVAgo/8adZeDZv7NSrC54BMrAd7yfyaMpLQfevIf7Ts81ibf7ChvQR6IW
         x9hr7eeRYCk27j0qILsqtasIJGnhENh6FXfWIkCFkXTr0nnEDLsa0SnSS6BRf7cBK25S
         izacwZji9Ysf6+XkRnnRS/iRZtIEmI777DV7q5m+Rt310uN+WnI6u6t2WQvtpPPy2nc1
         Ku5fl7nmnZ946E7Q1PlfHs7wGeTMcoSSuD9YStM+EpMNEIBX5+qhvVrryMewIY5F6Vqj
         bnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334188; x=1776938988;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6KMcyaN6kKhsHJNW6m88G0plVvYQ8wSRi3+Sq1KRvE=;
        b=Y3Q31p4Pos5PjUL1FbOd0KVPipZYlzMXFpqYvq7pIzT6embbh0e3VOZUotQW/6Ai45
         1tcMfKWM7y68OFt0JqkL+s5ZK5+MAO7nGzRnDLb5H28719lDmSJbCwRwuWcP5AbSTAhx
         Ts9CzW9ky9yypSv3viTQirJBysvR0aUsj6tIagEUm3sGL+BjivwycLQ27mOzxygd83WZ
         D91JOlQc4fSzy1AXSx43HFFPMhXasPsUDJvGfuW4tQtuOQUtTUv+uP880bGT+KXluReX
         TmQDGbGe6AgsPWBGxB+UTfxuhDi/KLFUc83nhBgghEjRlx9GTRWI+2qTG4ZNBwAlCVYh
         Jkcg==
X-Gm-Message-State: AOJu0YwBQy7jwSuOUorjYpudf03CjtVNBLn1MocQP0V7zeoY/U8nsRih
	Y4aNG0YQTALvnM2siMHm97g05XvClbXIvlSmOMLfJL6p1LUI4NFMUYeV034GBCFBiyUZ+iZFw+A
	+loywSc8N7XkwbjsRvskMYvU8XPwKAFU+6L1z2g88m0x9
X-Gm-Gg: AeBDietIJF/nMOkkKNUw/dloGNLsLf9xs9LCHwy9oMU8mpu1IatjySpuZj+OewJobma
	qeXVp9Ty/fJwgWP9ewyd6ZksJ3qXPzoxgNqLamdEb9tPLp/iml8uLWB75f6MPC2wLupIADAY3oa
	kiRSYBPyzJ03KbriQX6hnBXrcgGo4yHN3930PwBQm0VyfUnkp2+qw9zmE+7vtHDOF1+eSfGSPU1
	JSgt4S0mOC7gJywHRz1nc0bmqEqG46hf4g9GLQnTERrpXp8RYpfpUqn7A2Jz3JrCPU3nZj1gQJ7
	Vs2/E1jtKNwQALsxFHiy
X-Received: by 2002:a05:690e:130a:b0:650:1d21:d681 with SMTP id
 956f58d0204a3-65198b56720mr23611767d50.39.1776334188032; Thu, 16 Apr 2026
 03:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415162058.3551246-1-lgs201920130244@gmail.com> <69dfc93b.050a0220.b5f6c.a091@mx.google.com>
In-Reply-To: <69dfc93b.050a0220.b5f6c.a091@mx.google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 18:09:34 +0800
X-Gm-Features: AQROBzAgGNMZjT6vliVJ2SA1rr-joa2TYJJa-B1vTSmPkFxpEBGIL3f0be_b_N4
Message-ID: <CANUHTR8YnZ0xiFM5gnR-GtwrF9PtvUC=ANAiPmuPj2iv=8kY3Q@mail.gmail.com>
Subject: Re: media: vivid: fix cleanup bugs in vivid_init()
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58870-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 0F84140CC0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,


On Thu, 16 Apr 2026 at 01:22, Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Guangshuo Li:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/97578273/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>
I checked the log for the failed static job.

It seems the job failed due to CI runner/container infrastructure
issues rather than a patch-related problem. The log shows that it
failed while pulling the GitLab runner helper image and ended with:

Failed to pull image ... gitlab-runner-helper:x86_64-v18.8.0

ssh tunnel: read tcp ... connection reset by peer

Job failed (system failure)

There does not appear to be any actual static analysis warning/error
against the patch itself in this log.

Could you please confirm whether this failure can be ignored or the
job can be retried?

Thanks,
Guangshuo Li

