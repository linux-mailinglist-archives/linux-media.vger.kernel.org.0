Return-Path: <linux-media+bounces-15591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A699942232
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 23:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 303A31F254EE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 21:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2817018E04B;
	Tue, 30 Jul 2024 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="V5L7ipvg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5B18E03A;
	Tue, 30 Jul 2024 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722374957; cv=none; b=N1+kLqWNTf/vY0kbKCNNTdeDj9mNThXkYdoYm6NPUur3yQ2H5SvndT4WB4z9ETM0Dy+5NiIVT3ZobLX0LJRbnLshN08X3ft0MWZLNViPN5ZLM4rUCcZakDh/ena/yHYVVhLJxBo+3lF+gCsgXGJ05ZryJADxRVGGs0DamB0OHVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722374957; c=relaxed/simple;
	bh=C6VSGx8RupmJLdmFxZP9iZzz+DlZoP0RzAD1ZTJ0how=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yf/dI0iwXn0w/J5vhidGNEv2SKqVc8r/tn29HUhkzkuTNKtKjpRCoeNqoD9s8D45tFizyTg7ssFXVOFyLaWxeosxNM93zAHpcCDL97r5VGln6DBkr8EEZ84ZYHG0pH8WT88YDEddrvo81A9CMVpxHK512y1IQhXg/UGPQeNrg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=V5L7ipvg; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYSzG3Pp0z9wZt;
	Tue, 30 Jul 2024 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722374954; bh=C6VSGx8RupmJLdmFxZP9iZzz+DlZoP0RzAD1ZTJ0how=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5L7ipvgVlzC91Pzne7nAADR7bQtYLQzbxxoAp1O7ESB5SeV3FyVCUBU3cyad1vtg
	 ni/E3TkldiiLdrQnCxdXeS3hwwiFBMfNEeRl48LWXqxyX12SfmWdcHwC1/LtsxCei4
	 t8/Gi2l7+LqzksIymXFx78BPkCWNxhtmFoZ9eDh0=
X-Riseup-User-ID: BDB4D0B77CB8B1A37EA613107467F4BD0693762E86973698D43FFCD98055D728
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WYSz20qdPzFvlN;
	Tue, 30 Jul 2024 21:29:01 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3 2/2] staging: media: sdis: move open braces to the previous line
Date: Wed, 31 Jul 2024 06:28:54 +0900
Message-Id: <20240730212854.474708-2-santiagorr@riseup.net>
In-Reply-To: <20240730212854.474708-1-santiagorr@riseup.net>
References: <20240730212854.474708-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: that open brace { should be on the previous
line" in ia_css_sdis.host.c:253 and :258.

Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>

---
This is one of my first patches. Could you please if is there anything
wrong with it? Thank you

V3: Insert the change history (including for V2)

V2: Remove spurious [PATCH] header from the Subject, inserted by mistake
---
 .../pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index cabacfc84..467572d84 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -250,13 +250,11 @@ ia_css_get_dvs_statistics(
 	assert(isp_stats);
 
 	map = ia_css_isp_dvs_statistics_map_allocate(isp_stats, NULL);
-	if (map)
-	{
+	if (map) {
 		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_dvs_statistics(host_stats, map);
 		ia_css_isp_dvs_statistics_map_free(map);
-	} else
-	{
+	} else {
 		IA_CSS_ERROR("out of memory");
 		ret = -ENOMEM;
 	}
-- 
2.39.2


