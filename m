Return-Path: <linux-media+bounces-19408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AE999F32
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43F31C230FF
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 08:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E166B20C472;
	Fri, 11 Oct 2024 08:40:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D252208C4
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728636045; cv=none; b=meZIQuFCuF9G5QS8bIrKXAMPLMG6kLcGgg/ntOGC4ia/fYn1hasH2GWIxAbp7NI2k3wBaCfx62LyvvNvSs8brldEcS+CslXQ14CSlnPBOCY2VUua/JYBC/IZoVbJeGqT96/WqIS0CRZZeicp6W4z8uInAeRZQ4yDIH1CFO8jmJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728636045; c=relaxed/simple;
	bh=tpPfNen5bmNZRA1EqZoImkI+3JGuRLIp2GaQtfEIAqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pU3QC8hv837TL2F1vRKN3TKGuI/45L5kY7MuBgfT9/p+U/RCSjfT2sAwEvB3wA6KM5aVTXm6He0cD5tqi2bL0/sLLY0qDOkk/O7a8YxzgXXuut01Qes5ep110pKqfWg0Z5TzHYsTgwCorZumI4+E/dUdlNqlAMBultSKDsVl4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szBCQ-0005QN-2i;
	Fri, 11 Oct 2024 08:40:39 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szBCQ-0047vT-0w;
	Fri, 11 Oct 2024 08:40:38 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.13] media: add support for exporting HDMI InfoFrames (#104576)
Date: Fri, 11 Oct 2024 08:40:37 +0000
Message-Id: <20241011084037.983770-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f03553f5-59f1-4d67-aa44-ebc873843b7a@xs4all.nl>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/f03553f5-59f1-4d67-aa44-ebc873843b7a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/389543/
Build time: 00:17:31
Link: https://lore.kernel.org/linux-media/f03553f5-59f1-4d67-aa44-ebc873843b7a@xs4all.nl

gpg: Signature made Tue 08 Oct 2024 08:00:03 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [marginal]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: hverkuil@xs4all.nl: Verified 4 signatures in the past 2 months.  Encrypted
     0 messages.
gpg: hverkuil-cisco@xs4all.nl: Verified 4 signatures in the past 2 months.
     Encrypted 0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 052CDE7BC215053B689F1BCABD2D614866143B4C
     to mark it as being bad.

Summary: no issues. All 6 looked fine.

