Return-Path: <linux-media+bounces-23340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4747F9EF05F
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1688B16BF04
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BB3236917;
	Thu, 12 Dec 2024 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="sUaLnpAK"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5FE222D66
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019770; cv=none; b=agWZOzhr4YgQYXQVGkJuDBXdcS+AWDVqqG3xau8yKsupctqh94xWXZMRGP02DGnUnhWIT6g8F/T5mPtq58vEAYihuWPP8RUp5kyx1hNhKsgkcpn+wsqQ2x9BRfooFc9M1mz6VBeyJnvNklQFPzly/Y0WpcPfaZMlXlWwmCBYADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019770; c=relaxed/simple;
	bh=apCFxvirC+P5W1oE8i4Rjpd2/J6XLJh1AZEgwkPzTX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VlaiiYawmrFe5rSCSNo7m/pUQ43x4MXHTD59MzEpX6mKmxSz3RZuILDkaITH2rD1MWFNOFevW1XE6B9pisP6mDif+PtVZ3JU9EQ4st1fg71xVolyEAZ44P4zpZjNMuTuQaQxJTNgX/moikBocRhXLah+GQbluUSGEWgsdSBe6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=sUaLnpAK; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MZNtcRtgrejz9oNq+sLP4zF5iArJRWmKLjs1Y9Jb1vo=; b=sUaLnpAKrlsOVkXrFZcTIcXVlH
	gWQA+ihy62+ibHyWiRu0qHVBjJ/ABQXQWNRMppvE1rmTqNi9mZe+jGuOCv3FBbK0uSfgZgirukB4L
	CMR/4q+9daXutvX+LL7NSesAcgjhxYb1rnuaEjdQKy7biNOixxVMlRDYS+JoGMIJrnzhWHdXgYJQ6
	a/A/JDA435k1PTu15gnH44NeBCUrTTT8UgpVezVnr//HngrH+IVFpORA+GNJOLE/8lfy8eRnLzWKu
	8BEz1NUeMgy/LdF/E+c+Qk/GoZb7vWSKlV5q3kenn+6YJxoYDj1Z/yCOvtB4darlShrXD0wHarciY
	ZhGqc4aQ==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tLlkf-0002R5-1A;
	Thu, 12 Dec 2024 16:09:21 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tLlkd-0075AW-2I;
	Thu, 12 Dec 2024 16:09:20 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.14] Various MDP3 changes (#106060)
Date: Thu, 12 Dec 2024 16:09:19 +0000
Message-Id: <20241212160919.1688155-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310/
Build log: https://builder.linuxtv.org/job/patchwork/407264/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310

gpg: Signature made Thu 12 Dec 2024 03:34:52 PM UTC
gpg:                using RSA key B71AEACB392868D77606602EC26580EBB1C88525
gpg: requesting key C26580EBB1C88525 from hkps://keyserver.ubuntu.com
gpg: Can't check signature: No public key


Build aborted due to a fatal error:
FAILED: patch patch patches/0007-soc-mediatek-cmdq-Remove-cmdq_pkt_finalize-helper-fu.patch doesn't apply:
Applying patch patches/0007-soc-mediatek-cmdq-Remove-cmdq_pkt_finalize-helper-fu.patch
patching file drivers/soc/mediatek/mtk-cmdq-helper.c
Hunk #1 FAILED at 524.
1 out of 1 hunk FAILED -- rejects in file drivers/soc/mediatek/mtk-cmdq-helper.c
patching file include/linux/soc/mediatek/mtk-cmdq.h
Patch patches/0007-soc-mediatek-cmdq-Remove-cmdq_pkt_finalize-helper-fu.patch can be reverse-applied


