Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33A624B9C7
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 13:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbgHTLsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 07:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730528AbgHTKCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:02:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B25FC061757;
        Thu, 20 Aug 2020 03:02:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E5E323D;
        Thu, 20 Aug 2020 12:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597917743;
        bh=UdZW/gWpeBR8Fp2uswR4BNeR1AZf83I2Xerix6/McmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ItMFiAGpy+m799SAJlmxoBALpCUTcBMW2ZU7dxHv3+rwmOEr6obhEyMEeRR1DmtU5
         w83NTD2V6detNxAnQkYHTyfm7GYG23NbpofX1u6znoMCAcfcbBJQgrORodryscgxWx
         WciTsmZ7pXmG36Axz5Ekh/zrHURi1ohdX/kph6gI=
Date:   Thu, 20 Aug 2020 13:02:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Wanchun Zheng <zhengwanchun@hisilicon.com>,
        linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        John Fastabend <john.fastabend@gmail.com>,
        Xiubin Zhang <zhangxiubin1@huawei.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Liwei Cai <cailiwei@hisilicon.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Alexei Starovoitov <ast@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Rob Herring <robh+dt@kernel.org>,
        mauro.chehab@huawei.com, Rob Clark <robdclark@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Liuyao An <anliuyao@huawei.com>,
        Network Development <netdev@vger.kernel.org>,
        Rongrong Zou <zourongrong@gmail.com>,
        BPF Mailing List <bpf@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 00/49] DRM driver for Hikey 970
Message-ID: <20200820100205.GA5962@pendragon.ideasonboard.com>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <20200819152120.GA106437@ravnborg.org>
 <20200819153045.GA18469@pendragon.ideasonboard.com>
 <CALAqxLUXnPRec3UYbMKge8yNKBagLOatOeRCagF=JEyPEfWeKA@mail.gmail.com>
 <20200820090326.3f400a15@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200820090326.3f400a15@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Aug 20, 2020 at 09:03:26AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 19 Aug 2020 12:52:06 -0700 John Stultz escreveu:
> > On Wed, Aug 19, 2020 at 8:31 AM Laurent Pinchart wrote:
> > > On Wed, Aug 19, 2020 at 05:21:20PM +0200, Sam Ravnborg wrote:  
> > > > On Wed, Aug 19, 2020 at 01:45:28PM +0200, Mauro Carvalho Chehab wrote:  
> > > > > This patch series port the out-of-tree driver for Hikey 970 (which
> > > > > should also support Hikey 960) from the official 96boards tree:
> > > > >
> > > > >    https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> > > > >
> > > > > Based on his history, this driver seems to be originally written
> > > > > for Kernel 4.4, and was later ported to Kernel 4.9. The original
> > > > > driver used to depend on ION (from Kernel 4.4) and had its own
> > > > > implementation for FB dev API.
> > > > >
> > > > > As I need to preserve the original history (with has patches from
> > > > > both HiSilicon and from Linaro),  I'm starting from the original
> > > > > patch applied there. The remaining patches are incremental,
> > > > > and port this driver to work with upstream Kernel.
> > > > >  
> > ...
> > > > > - Due to legal reasons, I need to preserve the authorship of
> > > > >   each one responsbile for each patch. So, I need to start from
> > > > >   the original patch from Kernel 4.4;  
> > ...
> > > > I do acknowledge you need to preserve history and all -
> > > > but this patchset is not easy to review.  
> > >
> > > Why do we need to preserve history ? Adding relevant Signed-off-by and
> > > Co-developed-by should be enough, shouldn't it ? Having a public branch
> > > that contains the history is useful if anyone is interested, but I don't
> > > think it's required in mainline.  
> > 
> > Yea. I concur with Laurent here. I'm not sure what legal reasoning you
> > have on this but preserving the "absolute" history here is actively
> > detrimental for review and understanding of the patch set.
> > 
> > Preserving Authorship, Signed-off-by lines and adding Co-developed-by
> > lines should be sufficient to provide both atribution credit and DCO
> > history.
> 
> I'm not convinced that, from legal standpoint, folding things would
> be enough. See, there are at least 3 legal systems involved here
> among the different patch authors:
> 
> 	- civil law;
> 	- common law;
> 	- customary law + common law.
> 
> Merging stuff altogether from different law systems can be problematic,
> and trying to discuss this with experienced IP property lawyers will
> for sure take a lot of time and efforts. I also bet that different
> lawyers will have different opinions, because laws are subject to 
> interpretation. With that matter I'm not aware of any court rules 
> with regards to folded patches. So, it sounds to me that folding 
> patches is something that has yet to be proofed in courts around
> the globe.
> 
> At least for US legal system, it sounds that the Country of
> origin of a patch is relevant, as they have a concept of
> "national technology" that can be subject to export regulations.
> 
> From my side, I really prefer to play safe and stay out of any such
> legal discussions.

Let's be serious for a moment. If you think there are legal issues in
taking GPL-v2.0-only patches and squashing them while retaining
authorship information through tags, the Linux kernel if *full* of that.
You also routinely modify patches that you commit to the media subsystem
to fix "small issues".

The country of origin argument makes no sense either, the kernel code
base if full of code coming from pretty much all country on the planet.

Keeping the patches separate make this hard to review. Please squash
them.

-- 
Regards,

Laurent Pinchart
