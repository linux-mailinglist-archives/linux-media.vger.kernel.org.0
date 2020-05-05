Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5011F1C622D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 22:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729108AbgEEUjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 16:39:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729031AbgEEUjU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 16:39:20 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5A4920752;
        Tue,  5 May 2020 20:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588711160;
        bh=bBahhc3JQm49gK7zoqqLsScSJYt4ATXEkf9o3bVl2Lw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=acO6ed+Tj1OAkGnH4XGDhPvsb8UwFMHVQ/HLFCd4oHXO5bJZhkE/cM6UW4vpylPdT
         kq/OSMpRzuQg2ypI2BIg9ebgyeFb5Ug1N3tFHzq0UDgxREk8KC0IBUgPJBEgPb/pP/
         rimdfBnHlugqpUkF1NPUU+f6UUzLQuPjsd5ET8KM=
Date:   Tue, 5 May 2020 22:39:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
Message-ID: <20200505223915.05cf8254@coco.lan>
In-Reply-To: <20200505202220.GA1972539@ulmo>
References: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
        <20200505141735.53526ede@coco.lan>
        <fa23e434-6a04-aa11-ad0d-ca546914a328@xs4all.nl>
        <20200505161555.2c4ddfcc@coco.lan>
        <3c9e6a28-fc6e-0e4d-b7a0-57e3f2e1b206@xs4all.nl>
        <20200505202220.GA1972539@ulmo>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 5 May 2020 22:22:20 +0200
Thierry Reding <thierry.reding@gmail.com> escreveu:

> On Tue, May 05, 2020 at 04:26:04PM +0200, Hans Verkuil wrote:
> > On 05/05/2020 16:15, Mauro Carvalho Chehab wrote:  
> > > Em Tue, 5 May 2020 14:24:22 +0200
> > > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > >   
> > >> On 05/05/2020 14:17, Mauro Carvalho Chehab wrote:  
> > >>> Em Tue, 5 May 2020 10:33:00 +0200
> > >>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > >>>     
> > >>>> The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:
> > >>>>
> > >>>>   media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)
> > >>>>
> > >>>> are available in the Git repository at:
> > >>>>
> > >>>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra
> > >>>>
> > >>>> for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50faf:
> > >>>>
> > >>>>   MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +0200)
> > >>>>
> > >>>> ----------------------------------------------------------------
> > >>>> Tag branch
> > >>>>
> > >>>> ----------------------------------------------------------------
> > >>>> Sowjanya Komatineni (2):
> > >>>>       media: tegra: Add Tegra210 Video input driver
> > >>>>       MAINTAINERS: Add Tegra Video driver section    
> > >>>
> > >>>
> > >>> As pointed by checkpatch:
> > >>>
> > >>> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > >>> 	#628: FILE: drivers/staging/media/tegra-video/csi.c:521:
> > >>> 	+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
> > >>>
> > >>> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > >>> 	#3238: FILE: drivers/staging/media/tegra-video/video.c:106:
> > >>> 	+	{ .compatible = "nvidia,tegra210-csi", },
> > >>>
> > >>> and double-checked with:
> > >>>
> > >>> 	$ git grep "nvidia,tegra210-csi"
> > >>> 	drivers/staging/media/tegra-video/csi.c:        { .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
> > >>> 	drivers/staging/media/tegra-video/video.c:      { .compatible = "nvidia,tegra210-csi", },
> > >>>
> > >>> The DT specs for this driver are missing. I even checked at linux-next:
> > >>> there's no DT bindings for this.    
> > >>
> > >> Sorry, I should have mentioned this in the cover letter: the binding file
> > >> is here: https://patchwork.linuxtv.org/patch/63576/
> > >>
> > >> But it will be merged via the tegra subsystem (Thierry Reding) since it is
> > >> part of the display bindings, not media bindings. Also, Thierry was planning
> > >> to convert it to yaml, so he offered to merge it instead.  
> > > 
> > > Ok. Please re-send the pull request (or just mark it as New on patchwork) 
> > > once the bindings arrive linux-next.  
> > 
> > It's still marked as New in patchwork :-) (https://patchwork.linuxtv.org/patch/63596/)
> >   
> > > 
> > > Alternatively, I don't mind if those patches would also be merged via
> > > Tegra's tree, together with the bindings. On such case, feel free to 
> > > add, for both patches:
> > > 
> > > Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Mauro, do you mind if I turn that into an Acked-by? I think the ARM SoC
> maintainers may prefer that as being more of an explicit statement than
> Reviewed-by: that it's fine to take this through ARM SoC.

Sure, go ahead.

> 
> > 
> > Thierry, let us know what you want to do. It might not be a bad idea to merge
> > the whole series through your tree, as Mauro suggested. It keeps everything
> > together.  
> 
> I can do that. For ARM SoC I typically create a for-X.Y/dt-bindings
> branch where I collect device tree bindings patches that don't have
> a better place anywhere else, so I'll probably stick the DT binding
> update into that branch and then I can base a for-5.8/media branch
> on top of that to resolve the checkpatch warnings.
> 
> Actually, once I have that I could even just send a PR to Mauro to
> take this through the media tree since the dependencies should all
> be resolved. But with an Acked-by I'm sure the ARM SoC maintainers
> won't mind picking this up.

Whatever works best. I don't mind to either pick it together with
the DT, or to merge it via some other tree with either my
acked-by or reviewed-by.

Thanks,
Mauro
