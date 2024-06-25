Return-Path: <linux-media+bounces-14133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0650917287
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 22:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35E5FB223E1
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 20:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8027417D37C;
	Tue, 25 Jun 2024 20:29:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275614830C
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719347360; cv=none; b=oubzUgVCEe1FdZRyxt3KlTHGCZRiVY/r8b+cjZ9GFgDF0EDExzysnUB6YWHdEBRnztNP66SfIqSlZoBiWnEQPR3uZ/D9nWAgISa99FcdySNQ0kfmfOSLxIYaVZ5gDnUg5MQBUOyo/n9YYC6PQZuD43XpfGlCMmF5D0a/mP5mC98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719347360; c=relaxed/simple;
	bh=s4CSySW6ZfmU68D7fHHJlIH1/7sRtoch5yUW7ZlMQvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DC3RGzr/B1zgbZFkoKiF1nyJXmpygWdB2B6kG1BgoPoH2G8oWU3+e8iATyLiMnYXw9f5nCNnnmfZJrTlKeo2NQUvVjmYdN9Kh7FHuvbYjVVAwpSAgVJPRy/T0VMgzhMtpiZniHOspsoWkLThIleY+06E6KHFxPHvDlRK++xviGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sMCmy-0005Ue-13;
	Tue, 25 Jun 2024 20:29:16 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sMCmy-00FYBa-0a;
	Tue, 25 Jun 2024 20:29:16 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL] Linux Media vimc update for 6.11-rc1 (#102741)
Date: Tue, 25 Jun 2024 20:29:15 +0000
Message-Id: <20240625202915.3706321-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <5cf9727e-073e-4691-880c-06630c60f6b8@linuxfoundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5cf9727e-073e-4691-880c-06630c60f6b8@linuxfoundation.org/
Build log: https://builder.linuxtv.org/job/patchwork/416091/
Build time: 00:24:33
Link: https://lore.kernel.org/linux-media/5cf9727e-073e-4691-880c-06630c60f6b8@linuxfoundation.org

gpg: Signature made Tue 25 Jun 2024 07:46:50 PM UTC
gpg:                using RSA key 3D92B29BF459B8E086780FE40B0244C40D0D431C
gpg: Good signature from "Shuah Khan <shuah@gonehiking.org>" [full]
gpg:                 aka "Shuah Khan <shuah@kernel.org>" [marginal]
gpg:                 aka "Shuah Khan (gmail) <shuahkhan@gmail.com>" [full]
gpg:                 aka "Shuah Khan (Linux Foundation work address) <skhan@linuxfoundation.org>" [marginal]
gpg: shuah@kernel.org: Verified 1 signatures in the past 1 second.  Encrypted
     0 messages.
gpg: Warning: we've only seen one message signed using this key and user id!
gpg: Warning: you have yet to encrypt a message to this key!
gpg: shuah@gonehiking.org: Verified 1 signatures in the past 1 second.
     Encrypted 0 messages.
gpg: shuahkhan@gmail.com: Verified 1 signatures in the past 1 second.  Encrypted
     0 messages.
gpg: skhan@linuxfoundation.org: Verified 1 signatures in the past 1 second.
     Encrypted 0 messages.
gpg: Warning: we've only seen one message signed using this key and user id!
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 3D92B29BF459B8E086780FE40B0244C40D0D431C
     to mark it as being bad.

Summary: got 2/9 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-vimc-Don-t-iterate-over-single-pad.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/meson/vdec/vdec_1.c: ../drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.
	../drivers/staging/media/meson/vdec/vdec_hevc.c: ../drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 227.
	../drivers/staging/media/meson/vdec/vdec_hevc.c: ../drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 227.
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion

    allyesconfig: return code #0:
	../drivers/media/i2c/ar0521.c: ../drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.
	../drivers/media/i2c/s5c73m3/s5c73m3-core.c: ../drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.
	../drivers/media/i2c/tc358746.c: ../drivers/media/i2c/tc358746.c:1631 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1631.
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion

patches/0008-media-vimc-debayer-Use-subdev-active-state.patch:

   checkpatch.pl:
	$ cat patches/0008-media-vimc-debayer-Use-subdev-active-state.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:182: WARNING: quoted string split across lines
	-:183: WARNING: quoted string split across lines


Error #512 when building PDF docs


