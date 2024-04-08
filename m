Return-Path: <linux-media+bounces-8845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0089C238
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 15:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D53283210
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 13:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3262A81723;
	Mon,  8 Apr 2024 13:23:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35177D419
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712582634; cv=none; b=rCcG6oS+supzywhUJz8JkyU0BBf6PVP2WHs1Ic8KweM49xP8iI6ytH/tfDYgMhrWqmJNQoNYH5uZbSBZxLoh+km6wIUPSlUTJ4ixGyl3FnxqsygEWnBT2zfAv3oRRHS8lZeT97YY82+J4oYB6u8SLAaRAuweacZqz7I5BKcrQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712582634; c=relaxed/simple;
	bh=Z/I1Q//dfmfnL+pvvkLeWI/G1hGH4gWVD8nEu9XijZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFeRvGPkQO3bghcuwE8+6zs2usFDFeVGhjayXdqT6zxOt8ifuLuP7rRP0gKDwzusFYvdJXWdt9+QnlbsuAX/QQl/S95ynYdXz348ouw9en2p3GXWZhPP5o28xOOHaR9Les/rk08kNgYwDpzvJiw1iTgqr7A7+82yt1be8qkyUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rtoyS-0008LU-20;
	Mon, 08 Apr 2024 13:23:48 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rtoyR-006ADP-2q;
	Mon, 08 Apr 2024 13:23:48 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.10] media: qcom: camss: Add sc8280xp support (#100618)
Date: Mon,  8 Apr 2024 13:23:47 +0000
Message-Id: <20240408132347.1469226-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <fa7eb5cc-9999-49b9-96ea-abdd3dda855c@xs4all.nl>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/fa7eb5cc-9999-49b9-96ea-abdd3dda855c@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/394065/
Build time: 00:20:34
Link: https://lore.kernel.org/linux-media/fa7eb5cc-9999-49b9-96ea-abdd3dda855c@xs4all.nl

gpg: Signature made Mon 08 Apr 2024 12:54:56 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [marginal]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: hverkuil@xs4all.nl: Verified 7 signatures in the past 7 weeks.  Encrypted
     0 messages.
gpg: hverkuil-cisco@xs4all.nl: Verified 7 signatures in the past 7 weeks.
     Encrypted 0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 052CDE7BC215053B689F1BCABD2D614866143B4C
     to mark it as being bad.

Summary: got 5/6 patches with issues, being 4 at build time

Error/warnings:

patches/0001-media-dt-bindings-media-camss-Add-qcom-sc8280xp-cams.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	/usr/local/bin/compile_checks: line 4: 1402441 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1403541 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1403742 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1403342 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1403900 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1403968 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1404055 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3066 atomisp_set_parameters() error: kvzalloc() does not make sense for no sleep code
	/usr/local/bin/compile_checks: line 4: 1404126 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1404157 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1404169 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1404261 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1404349 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1404113 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1405289 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
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
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
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
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1405588 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	../drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c: ../drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c:126 ia_css_isp_param_allocate_isp_parameters() error: kvcalloc() does not make sense for no sleep code
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: :error: too long token expansion
	../drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c: ../drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:286 ia_css_isp_dvs2_statistics_allocate() error: kvcalloc() does not make sense for no sleep code
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: :error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1405818 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c: ../drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c:592 pipeline_stage_create() error: kvzalloc() does not make sense for no sleep code
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
	/usr/local/bin/compile_checks: line 4: 1405504 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
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
	/usr/local/bin/compile_checks: line 4: 1406753 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1406747 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1406786 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1406966 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1407325 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1407572 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1407824 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1408114 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1408791 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1409205 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1409356 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1409640 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1409239 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1409443 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1409799 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/v4l2-core/v4l2-event.c: ../drivers/media/v4l2-core/v4l2-event.c:238 v4l2_event_subscribe() error: kvzalloc() does not make sense for no sleep code
	/usr/local/bin/compile_checks: line 4: 1409956 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1410204 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1410427 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1411288 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1411407 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/v4l2-core/v4l2-subdev.c: ../drivers/media/v4l2-core/v4l2-subdev.c:1471 __v4l2_subdev_state_alloc() error: kvcalloc() does not make sense for no sleep code
	../drivers/media/v4l2-core/v4l2-subdev.c: ../drivers/media/v4l2-core/v4l2-subdev.c:1710 v4l2_subdev_init_stream_configs() error: kvcalloc() does not make sense for no sleep code
	/usr/local/bin/compile_checks: line 4: 1411623 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1411582 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1411895 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1411730 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1411980 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1412084 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/i2c/ccs/ccs-data.c: ../drivers/media/i2c/ccs/ccs-data.c:45 bin_backing_alloc() error: kvzalloc() does not make sense for no sleep code
	/usr/local/bin/compile_checks: line 4: 1412280 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1412356 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1412461 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/common/videobuf2/videobuf2-dma-sg.c: ../drivers/media/common/videobuf2/videobuf2-dma-sg.c:129 vb2_dma_sg_alloc() error: kvcalloc() does not make sense for no sleep code
	/usr/local/bin/compile_checks: line 4: 1412694 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1412865 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1413260 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1413228 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1413789 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1413928 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1414316 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1414473 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1414439 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1414742 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1414919 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1414948 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1415017 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1415104 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1415271 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1415355 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1416010 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	/usr/local/bin/compile_checks: line 4: 1416084 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1416482 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1416508 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1416626 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417186 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417362 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417328 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417436 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417514 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417560 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417591 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417532 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417729 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417842 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1417956 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418120 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418286 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418390 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418560 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418600 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418589 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418796 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1418755 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419071 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419792 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419812 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419886 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419835 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419903 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1419988 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420023 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420107 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420151 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420489 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420612 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420768 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1420885 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1421292 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1421560 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.
	/usr/local/bin/compile_checks: line 4: 1421519 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1421832 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422021 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422170 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422253 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422466 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422519 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422599 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1423009 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1423223 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1422762 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1424500 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/platform/rockchip/rga/rga-buf.c: ../drivers/media/platform/rockchip/rga/rga-buf.c:83 rga_buf_init() error: 'f' dereferencing possible ERR_PTR()
	/usr/local/bin/compile_checks: line 4: 1425779 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1426228 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1426274 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1426704 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: OOM: 3002676Kb sm_state_count = 1740732
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2511 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 49 seconds
	/usr/local/bin/compile_checks: line 4: 1427732 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1428209 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1428235 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1428381 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1429066 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1429314 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:396 medusa_set_videostandard() parse error: OOM: 3000832Kb sm_state_count = 2111
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:396 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 3 seconds
	/usr/local/bin/compile_checks: line 4: 1429614 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1429791 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1430784 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
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
	/usr/local/bin/compile_checks: line 4: 1431709 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1431722 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: :error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1431888 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	/usr/local/bin/compile_checks: line 4: 1432388 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1432820 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1433011 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1433645 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1433661 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1433748 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1433808 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1433995 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1434028 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1434128 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1434155 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1434334 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1434343 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	/usr/local/bin/compile_checks: line 4: 1434419 Segmentation fault      /opt/smatch/smatch -p=kernel "$@" 1>&2
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2886 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-dt-bindings-media-camss-Add-qcom-sc8280xp-cams.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0002-media-qcom-camss-csiphy-3ph-Add-Gen2-v1.1-two-phase-.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:153:14: error: ‘lane_regs_sc8280xp’ defined but not used [-Werror=unused-const-variable=]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o] Error 1
	make[7]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom/camss] Error 2
	make[6]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom] Error 2
	make[5]: *** [../scripts/Makefile.build:485: drivers/media/platform] Error 2
	make[4]: *** [../scripts/Makefile.build:485: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1919: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:240: __sub-make] Error 2
	make: *** [Makefile:240: __sub-make] Error 2

patches/0003-media-qcom-camss-Add-CAMSS_SC8280XP-enum.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:153:14: error: ‘lane_regs_sc8280xp’ defined but not used [-Werror=unused-const-variable=]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o] Error 1
	make[8]: *** Waiting for unfinished jobs....
	../drivers/media/platform/qcom/camss/camss-csiphy.c: In function ‘msm_csiphy_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-csiphy.c:569:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy.o] Error 1
	make[7]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom/camss] Error 2
	make[6]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom] Error 2
	make[5]: *** [../scripts/Makefile.build:485: drivers/media/platform] Error 2
	make[4]: *** [../scripts/Makefile.build:485: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1919: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:240: __sub-make] Error 2
	make: *** [Makefile:240: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/qcom/camss/camss-csiphy.c: In function ‘msm_csiphy_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-csiphy.c:569:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy.o] Error 1
	make[8]: *** Waiting for unfinished jobs....
	../drivers/media/platform/qcom/camss/camss-vfe.c: In function ‘vfe_src_pad_code’:
	../drivers/media/platform/qcom/camss/camss-vfe.c:174:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	../drivers/media/platform/qcom/camss/camss-vfe.c: In function ‘msm_vfe_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-vfe.c:1499:17: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-vfe.o] Error 1
	make[7]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom/camss] Error 2
	make[6]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom] Error 2
	make[5]: *** [../scripts/Makefile.build:485: drivers/media/platform] Error 2
	make[4]: *** [../scripts/Makefile.build:485: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1919: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:240: __sub-make] Error 2
	make: *** [Makefile:240: __sub-make] Error 2

patches/0004-media-qcom-camss-Add-sc8280xp-resources.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:153:14: error: ‘lane_regs_sc8280xp’ defined but not used [-Werror=unused-const-variable=]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o] Error 1
	make[8]: *** Waiting for unfinished jobs....
	../drivers/media/platform/qcom/camss/camss-csiphy.c: In function ‘msm_csiphy_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-csiphy.c:569:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy.o] Error 1
	../drivers/media/platform/qcom/camss/camss-vfe.c: In function ‘vfe_src_pad_code’:
	../drivers/media/platform/qcom/camss/camss-vfe.c:174:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	../drivers/media/platform/qcom/camss/camss-vfe.c: In function ‘msm_vfe_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-vfe.c:1499:17: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-vfe.o] Error 1
	make[7]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom/camss] Error 2
	make[6]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom] Error 2
	make[5]: *** [../scripts/Makefile.build:485: drivers/media/platform] Error 2
	make[4]: *** [../scripts/Makefile.build:485: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1919: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:240: __sub-make] Error 2
	make: *** [Makefile:240: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/qcom/camss/camss-csiphy.c: In function ‘msm_csiphy_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-csiphy.c:569:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-csiphy.o] Error 1
	make[8]: *** Waiting for unfinished jobs....
	../drivers/media/platform/qcom/camss/camss-video.c: In function ‘msm_video_register’:
	../drivers/media/platform/qcom/camss/camss-video.c:1009:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-video.o] Error 1
	../drivers/media/platform/qcom/camss/camss-vfe.c: In function ‘vfe_src_pad_code’:
	../drivers/media/platform/qcom/camss/camss-vfe.c:174:9: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	../drivers/media/platform/qcom/camss/camss-vfe.c: In function ‘msm_vfe_subdev_init’:
	../drivers/media/platform/qcom/camss/camss-vfe.c:1499:17: error: enumeration value ‘CAMSS_8280XP’ not handled in switch [-Werror=switch]
	cc1: all warnings being treated as errors
	make[8]: *** [../scripts/Makefile.build:244: drivers/media/platform/qcom/camss/camss-vfe.o] Error 1
	make[7]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom/camss] Error 2
	make[6]: *** [../scripts/Makefile.build:485: drivers/media/platform/qcom] Error 2
	make[5]: *** [../scripts/Makefile.build:485: drivers/media/platform] Error 2
	make[4]: *** [../scripts/Makefile.build:485: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1919: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:240: __sub-make] Error 2
	make: *** [Makefile:240: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0004-media-qcom-camss-Add-sc8280xp-resources.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:176: WARNING: line length of 102 exceeds 100 columns
	-:192: WARNING: line length of 102 exceeds 100 columns
	-:208: WARNING: line length of 102 exceeds 100 columns
	-:224: WARNING: line length of 102 exceeds 100 columns

patches/0006-media-qcom-camss-vfe-17x-Rename-camss-vfe-170-to-cam.patch:

   checkpatch.pl:
	$ cat patches/0006-media-qcom-camss-vfe-17x-Rename-camss-vfe-170-to-cam.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


