Return-Path: <linux-media+bounces-255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C27E9E74
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE5C280DC6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7938210F8;
	Mon, 13 Nov 2023 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kwQ1d5VK"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBF420B2D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 14:19:26 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3041D4C;
	Mon, 13 Nov 2023 06:19:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 251C929A;
	Mon, 13 Nov 2023 15:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699885139;
	bh=/JY16IJ8OpiqsxfQfsJhP0w+1K0WeJqAMz9luderXJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwQ1d5VKJnJTQC+Zfo5Ba0BJfAarf3u4MH2AzG9De2bIq4/BhD9hol7cmjz05Swns
	 AcuoL/2RBpboBmaZtyhMF4RSFN7GTbPDf93H+ZJv49K6+mLH56hWjmylc7g3ovo0lV
	 WDwQzFSBYkT0XH2LuEcadIi7ri8umUJlHXrBKqZg=
Date: Mon, 13 Nov 2023 16:19:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
Message-ID: <20231113141930.GB12711@pendragon.ideasonboard.com>
References: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXfn__=z9RQgxo_Rnmm3x5CbNxvqp1+g+vcQZZQggO=Zg@mail.gmail.com>
 <CAMuHMdV-fMaT-H4m9twdb+Ow7tCM4GZNDD4b1vn7e2B8VQmS8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV-fMaT-H4m9twdb+Ow7tCM4GZNDD4b1vn7e2B8VQmS8g@mail.gmail.com>

Hi Geert,

On Mon, Nov 13, 2023 at 03:05:07PM +0100, Geert Uytterhoeven wrote:
> On Tue, Oct 24, 2023 at 4:56 PM Geert Uytterhoeven wrote:
> > On Tue, Oct 24, 2023 at 4:25 PM Laurent Pinchart wrote:
> > > The VSP1 driver uses the subdev .s_stream() operation to stop WPF
> > > instances, without a corresponding call to start them. The V4L2 subdev
> > > core started warning about unbalanced .s_stream() calls in commit
> > > 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream()
> > > requirements"), causing a regression with this driver.
> > >
> > > Fix the problem by replacing the .s_stream() operation with an explicit
> > > function call for WPF instances. This allows sharing an additional data
> > > structure between RPF and WPF instances.
> > >
> > > Fixes: 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream() requirements")
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Closes: https://lore.kernel.org/linux-media/2221395-6a9b-9527-d697-e76aebc6af@linux-m68k.org/
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > The warning splat is gone, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> FTR, the warning splat is now in v6.7-rc1, but the fix is not
> (not even in linux-next).

I know. I've sent a pull request for it yesterday, it should get merged
in time for v6.7.

-- 
Regards,

Laurent Pinchart

