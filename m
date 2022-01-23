Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91B8497226
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236758AbiAWOdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:33:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41530 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbiAWOdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:33:11 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72D9725E;
        Sun, 23 Jan 2022 15:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642948389;
        bh=nV9w0z541mYg4jyD9zlwt3spDqE/jFpk84h3HGAbLkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HgwqxC0ES5CE3x5wYEps05AvyDxSf5PIZsuG/NoYQ6qy6XxbO9BvhzFF7Qw56Oj7k
         SBiDUrZvQq48e0NxaN13nA/j1cl7hrR6bGv4lZoe+Tdwh1ljsv+5NDqKj6InQBVQ55
         q/8N7YB40iwntvYvPQ+Yphh0JDBsQf1+XDkQZh1E=
Date:   Sun, 23 Jan 2022 16:32:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH v2] media: rkisp1: fix grey format iommu page faults
Message-ID: <Ye1nFVYP8/GS6UBC@pendragon.ideasonboard.com>
References: <20211207115923.13639-1-dafna.hirschfeld@collabora.com>
 <164241927947.10801.12217816997308426483@Monstersaurus>
 <1f8350f4-a2dc-5405-b48b-e657124f119d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f8350f4-a2dc-5405-b48b-e657124f119d@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Sun, Jan 23, 2022 at 11:50:26AM +0200, Dafna Hirschfeld wrote:
> On 17.01.22 13:34, Kieran Bingham wrote:
> > Quoting Dafna Hirschfeld (2021-12-07 11:59:23)
> >> Currently capturing grey format produces page faults
> >> on both selfpath and mainpath. To support greyscale
> >> we can capture YUV422 planar format and configure the U, V
> >> buffers to the dummy buffer.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >> This is v2 of the patch "media: rkisp1: remove support for V4L2_PIX_FMT_GREY"
> >> In v1 I removed the grey format. In this version it is 'fixed'
> >>
> >>   .../platform/rockchip/rkisp1/rkisp1-capture.c | 28 ++++++++++++++-----
> >>   1 file changed, 21 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> index 768987d5f2dd..8e982dd0c740 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> @@ -249,7 +249,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >>                  .fourcc = V4L2_PIX_FMT_GREY,
> >>                  .uv_swap = 0,
> >>                  .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> >> -               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> >> +               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >>                  .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>          },
> >>          /* rgb */
> >> @@ -631,12 +631,26 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
> >>                  rkisp1_write(cap->rkisp1,
> >>                               buff_addr[RKISP1_PLANE_Y],
> >>                               cap->config->mi.y_base_ad_init);
> >> -               rkisp1_write(cap->rkisp1,
> >> -                            buff_addr[RKISP1_PLANE_CB],
> >> -                            cap->config->mi.cb_base_ad_init);
> >> -               rkisp1_write(cap->rkisp1,
> >> -                            buff_addr[RKISP1_PLANE_CR],
> >> -                            cap->config->mi.cr_base_ad_init);
> >> +               /*
> >> +                * In order to support grey format we capture
> >> +                * YUV422 planar format from the camera and
> >> +                * set the U and V planes to the dummy buffer
> >> +                */
> >> +               if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
> >> +                       rkisp1_write(cap->rkisp1,
> >> +                                    cap->buf.dummy.dma_addr,
> >> +                                    cap->config->mi.cb_base_ad_init);
> >> +                       rkisp1_write(cap->rkisp1,
> >> +                                    cap->buf.dummy.dma_addr,
> >> +                                    cap->config->mi.cr_base_ad_init);
> >> +               } else {
> >> +                       rkisp1_write(cap->rkisp1,
> >> +                                    buff_addr[RKISP1_PLANE_CB],
> >> +                                    cap->config->mi.cb_base_ad_init);
> >> +                       rkisp1_write(cap->rkisp1,
> >> +                                    buff_addr[RKISP1_PLANE_CR],
> >> +                                    cap->config->mi.cr_base_ad_init);
> >> +               }
> >>          } else {
> > 
> > Looking at this function, I think I would have initialised a local array
> > of addresses (either to zero, or to the dummy address?) to then set
> > values when appropriate, and reduce the number of calls to
> > rkisp1_write() to a single set of three after the processing.
> > 
> > It might make the function simpler, and more readable, but it's more
> > effort, and this does look like it will solve the greyscale format issue
> > as discussed in earlier threads so I'd leave it up to you if you want to
> > refactor.
> 
> Hi,
> Yes, I'll do that.
> Interestingly I found out that the patch causing the iommu page fault is
> 
> https://www.spinics.net/lists/linux-media/msg176089.html
> 
> Before that patch there are no iommu page faults but the video is corrupted.
> 
> I can't explain how I didn't find it before, I clearly remember testing the grey format.

It seems really weird indeed.

Are you getting IOMMU faults on both the main and self paths ?

> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> >>                  /*
> >>                   * Use the dummy space allocated by dma_alloc_coherent to

-- 
Regards,

Laurent Pinchart
