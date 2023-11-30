Return-Path: <linux-media+bounces-1393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C67FEC24
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 10:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28ED2813F2
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 09:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F07D3986A;
	Thu, 30 Nov 2023 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SwfEEZ7S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22271D50;
	Thu, 30 Nov 2023 01:47:12 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38D768C1;
	Thu, 30 Nov 2023 10:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701337593;
	bh=A+ZecSE4hjPnaI3Hh8yXuuX/lFO1rYZCXT1nhjdZtw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwfEEZ7SpVU/OdE+/rfMspmM71hg225W3lQ8u4HuQL39vM0NYE9zqAUquXppYJ1be
	 NY+hif7gIyqf+RhFCLYNnztvFeWmifdDfk4e/FH1t+ghvgkntskwB56Ce1ahGV9PxW
	 heNlfR1N9ctz0WpO6qAZoYifdZJgc1k87IxCr3QI=
Date: Thu, 30 Nov 2023 18:47:00 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rkisp1: debug: Add register dump for IS
Message-ID: <ZWhaFL48cgdHsOPN@pyrite.rasen.tech>
References: <20231129092956.250129-1-paul.elder@ideasonboard.com>
 <20231129092956.250129-3-paul.elder@ideasonboard.com>
 <170128834260.3048548.11979514587961676400@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170128834260.3048548.11979514587961676400@ping.linuxembedded.co.uk>

On Wed, Nov 29, 2023 at 08:05:42PM +0000, Kieran Bingham wrote:
> Quoting Paul Elder (2023-11-29 09:29:55)
> > Add register dump for the image stabilizer module to debugfs.
> > 
> 
> Is the Image Stabilizer on all variants of the ISP?
> 
> I.e. is it valid register space on the RK3399 implementation?

Yes, it is.

> 
> If so then:
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-debug.c    | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > index 71df3dc95e6f..f66b9754472e 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > @@ -139,6 +139,21 @@ static int rkisp1_debug_dump_mi_mp_show(struct seq_file *m, void *p)
> >  }
> >  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp);
> >  
> > +static int rkisp1_debug_dump_is_show(struct seq_file *m, void *p)
> > +{
> > +       static const struct rkisp1_debug_register registers[] = {
> > +               RKISP1_DEBUG_SHD_REG(ISP_IS_H_OFFS),
> > +               RKISP1_DEBUG_SHD_REG(ISP_IS_V_OFFS),
> > +               RKISP1_DEBUG_SHD_REG(ISP_IS_H_SIZE),
> > +               RKISP1_DEBUG_SHD_REG(ISP_IS_V_SIZE),
> 
> I expect so as you haven't added the register macros in this series so
> they must already be there ...

Yep :)


Paul

> 
> 
> > +               { /* Sentinel */ },
> > +       };
> > +       struct rkisp1_device *rkisp1 = m->private;
> > +
> > +       return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_is);
> > +
> >  #define RKISP1_DEBUG_DATA_COUNT_BINS   32
> >  #define RKISP1_DEBUG_DATA_COUNT_STEP   (4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> >  
> > @@ -235,6 +250,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >  
> >         debugfs_create_file("mi_mp", 0444, regs_dir, rkisp1,
> >                             &rkisp1_debug_dump_mi_mp_fops);
> > +
> > +       debugfs_create_file("is", 0444, regs_dir, rkisp1,
> > +                           &rkisp1_debug_dump_is_fops);
> >  }
> >  
> >  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> > -- 
> > 2.39.2
> >

