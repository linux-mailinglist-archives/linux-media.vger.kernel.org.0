Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA73D1C5548
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 14:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgEEMRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 08:17:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:43568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728627AbgEEMRk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 08:17:40 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA8F8206B8;
        Tue,  5 May 2020 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588681060;
        bh=K9pajpJQ6EekSPZj2ihes75zZ4jheVq+aLvL/UDDZDU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cheu0wapCGA9fHRsws6wr33MHYhvFjLOH83UFUXRGaoUDVQoVO61j9guIeZvDDPb5
         qEbK6Q1brrBhYp4TiU3Dzk8E3DM2RQxv287fImXXCkztE65vtnAdIKoD0wuSLtOSEL
         +C5fY/1u09ZgFzsGAdyprdfkjbDvA4NMqDhLGcgM=
Date:   Tue, 5 May 2020 14:17:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
Message-ID: <20200505141735.53526ede@coco.lan>
In-Reply-To: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
References: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 5 May 2020 10:33:00 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:
> 
>   media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra
> 
> for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50faf:
> 
>   MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Sowjanya Komatineni (2):
>       media: tegra: Add Tegra210 Video input driver
>       MAINTAINERS: Add Tegra Video driver section


As pointed by checkpatch:

	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
	#628: FILE: drivers/staging/media/tegra-video/csi.c:521:
	+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },

	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
	#3238: FILE: drivers/staging/media/tegra-video/video.c:106:
	+	{ .compatible = "nvidia,tegra210-csi", },

and double-checked with:

	$ git grep "nvidia,tegra210-csi"
	drivers/staging/media/tegra-video/csi.c:        { .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
	drivers/staging/media/tegra-video/video.c:      { .compatible = "nvidia,tegra210-csi", },

The DT specs for this driver are missing. I even checked at linux-next:
there's no DT bindings for this.

While the code sounds ok, I'll reject this PR. Please submit a new one
together with the DT file properly reviewed by DT maintainers.

Thanks,
Mauro
