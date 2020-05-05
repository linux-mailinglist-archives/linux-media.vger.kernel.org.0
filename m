Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7531C58F0
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgEEOQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729986AbgEEOQA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:16:00 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C68852083B;
        Tue,  5 May 2020 14:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588688159;
        bh=hQaBKfpKqeZ1fxu1koHuFFwAPFXimKVr2qwWy4pH3Fc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2RvpUPtpckRL6M+orldQnp5MsEzNCr3zbE3BO5vBiJeea/pybACKTWuVs/OQ9hKuw
         xdf72G/tgWNG6WNABpRIsMVh4QyxaH1C/gQEeKP+Y/TlXiXvxeX5fY56kyHMC/ccVm
         hwN6AdyRtGUN6gAwhXtjRRWElqVXVtSUsaopTD4U=
Date:   Tue, 5 May 2020 16:15:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
Message-ID: <20200505161555.2c4ddfcc@coco.lan>
In-Reply-To: <fa23e434-6a04-aa11-ad0d-ca546914a328@xs4all.nl>
References: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
        <20200505141735.53526ede@coco.lan>
        <fa23e434-6a04-aa11-ad0d-ca546914a328@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 5 May 2020 14:24:22 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 05/05/2020 14:17, Mauro Carvalho Chehab wrote:
> > Em Tue, 5 May 2020 10:33:00 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >   
> >> The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:
> >>
> >>   media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra
> >>
> >> for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50faf:
> >>
> >>   MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +0200)
> >>
> >> ----------------------------------------------------------------
> >> Tag branch
> >>
> >> ----------------------------------------------------------------
> >> Sowjanya Komatineni (2):
> >>       media: tegra: Add Tegra210 Video input driver
> >>       MAINTAINERS: Add Tegra Video driver section  
> > 
> > 
> > As pointed by checkpatch:
> > 
> > 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > 	#628: FILE: drivers/staging/media/tegra-video/csi.c:521:
> > 	+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
> > 
> > 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > 	#3238: FILE: drivers/staging/media/tegra-video/video.c:106:
> > 	+	{ .compatible = "nvidia,tegra210-csi", },
> > 
> > and double-checked with:
> > 
> > 	$ git grep "nvidia,tegra210-csi"
> > 	drivers/staging/media/tegra-video/csi.c:        { .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
> > 	drivers/staging/media/tegra-video/video.c:      { .compatible = "nvidia,tegra210-csi", },
> > 
> > The DT specs for this driver are missing. I even checked at linux-next:
> > there's no DT bindings for this.  
> 
> Sorry, I should have mentioned this in the cover letter: the binding file
> is here: https://patchwork.linuxtv.org/patch/63576/
> 
> But it will be merged via the tegra subsystem (Thierry Reding) since it is
> part of the display bindings, not media bindings. Also, Thierry was planning
> to convert it to yaml, so he offered to merge it instead.

Ok. Please re-send the pull request (or just mark it as New on patchwork) 
once the bindings arrive linux-next.

Alternatively, I don't mind if those patches would also be merged via
Tegra's tree, together with the bindings. On such case, feel free to 
add, for both patches:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Mauro
