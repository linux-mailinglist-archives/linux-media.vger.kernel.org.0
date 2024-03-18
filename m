Return-Path: <linux-media+bounces-7228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B36487EF3C
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 18:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6D67B20D9E
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 17:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAC455C32;
	Mon, 18 Mar 2024 17:53:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130F55C07
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784422; cv=none; b=nIl4F4mT4CK3s4XgHUrrYukwUF5L8CTrIujL6wBi2o3PpCKCi4b8Nd/iBsAyw6Q+D5oTyJ5gj4CXT7xrR19JsZHFaubwBo1TYXnQiUAs9L9AMvcP8hTj4LAbny3yvImIxRGp2LyMFNDAWm0z4W3Ots5eKfGU+QD9hWtpk8Zycyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784422; c=relaxed/simple;
	bh=YCWZXKioeS99N2DPmt5fbkoGHgTl2BYeiXlfedSJDOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbDhC7VnKZGyS7o817AUlIxaaJIc756P/2PKMhjCzq36UVv/+ZTLutwtgrnQZlwkN5f+br7g+aqxuS6Q/SuJ3MixMx+ZhuMD/UWrHypy5YlVTFp8fSX/hJUaSyEJuV0CujnAFSDig0RTdBB+469EHV9VBjez809thPvitbUiBLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rmHAv-0003bT-2d;
	Mon, 18 Mar 2024 17:53:29 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rmHAv-00Fj0J-27;
	Mon, 18 Mar 2024 17:53:29 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.10] Add REMOVE_BUF ioctl (#99956)
Date: Mon, 18 Mar 2024 17:53:28 +0000
Message-Id: <20240318175328.3747906-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <60427350-38b9-40f1-b31e-b2990b46cbed@xs4all.nl>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/60427350-38b9-40f1-b31e-b2990b46cbed@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/388156/
Build time: 00:00:07
Link: https://lore.kernel.org/linux-media/60427350-38b9-40f1-b31e-b2990b46cbed@xs4all.nl

gpg: Signature made Mon 18 Mar 2024 03:36:18 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [marginal]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: hverkuil@xs4all.nl: Verified 4 signatures in the past 4 weeks.  Encrypted
     0 messages.
gpg: hverkuil-cisco@xs4all.nl: Verified 4 signatures in the past 4 weeks.
     Encrypted 0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 052CDE7BC215053B689F1BCABD2D614866143B4C
     to mark it as being bad.

Summary: got 6/9 patches with issues, being 6 at build time

Error/warnings:

patches/0001-media-videobuf2-Update-vb2_is_busy-logic.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
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
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3023328Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 4 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1746474
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
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
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2866 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-videobuf2-Add-min_reqbufs_allocation-field-to-.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
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
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3023328Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 3 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1746299
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
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
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2860 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-media-core-Rework-how-create_buf-index-returned-valu.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
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
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1988 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1746299
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 49 seconds
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3023328Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 3 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2880 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
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

patches/0005-media-core-Add-bitmap-manage-bufs-array-entries.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
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
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2866 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3023336Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 3 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1746296
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
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

patches/0007-media-v4l2-Add-REMOVE_BUFS-ioctl.patch:

    allyesconfig: return code #0:
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
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
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3023368Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 4 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: OOM: 3000012Kb sm_state_count = 1746296
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 47 seconds
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
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
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2860 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion

   checkpatch.pl:
	$ cat patches/0007-media-v4l2-Add-REMOVE_BUFS-ioctl.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:41: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:256: WARNING: Avoid logging continuation uses where feasible
	-:323: WARNING: line length of 155 exceeds 100 columns

patches/0008-media-v4l2-Add-mem2mem-helpers-for-REMOVE_BUFS-ioctl.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()


