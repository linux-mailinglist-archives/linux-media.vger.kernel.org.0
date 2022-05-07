Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEEF51EA4D
	for <lists+linux-media@lfdr.de>; Sat,  7 May 2022 23:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387445AbiEGVU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 May 2022 17:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245719AbiEGVU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 May 2022 17:20:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E392725;
        Sat,  7 May 2022 14:16:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92EA255A;
        Sat,  7 May 2022 23:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651958198;
        bh=0u6Nhc0or9xRfJWPbcM5/kKi6F21aec1hOKBvq4cBQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wiR63Nj4Cl55Yreue2H3lXeDIcDrpozrcPId50miZijffKwwcTDzbjoQRk0U+uL3M
         XuoH0AhBbjkDc57AWlYYZk15qaEdbySPLrme2ohnrXdqWiNm9WE53zpVigv7L2UZpY
         r/qbFyLrwyVYfTET586Fq5qUoHqTJ1rd/VSqm/aw=
Date:   Sun, 8 May 2022 00:16:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: v4l: vsp1: Fix offset calculation for plane
 cropping
Message-ID: <YnbhsjznA3IZmtoU@pendragon.ideasonboard.com>
References: <20220228120058.9755-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220302110012.GB11173@vmlxhi-121.adit-jv.com>
 <YlgtnlL8Loehk2cA@pendragon.ideasonboard.com>
 <20220419102215.GA46023@vmlxhi-121.adit-jv.com>
 <20220506095821.GA120301@vmlxhi-121.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220506095821.GA120301@vmlxhi-121.adit-jv.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Fri, May 06, 2022 at 11:58:21AM +0200, Michael Rodin wrote:
> Hi Laurent,
> 
> do you see any open points for this patch? If not, do you know maybe when
> it will be available on linux-media or maybe mainline branch?

I've just sent a pull request that includes this fix, I hope it will
make it to v5.19.

> On Tue, Apr 19, 2022 at 12:22:15PM +0200, Michael Rodin wrote:
> > On Thu, Apr 14, 2022 at 05:20:14PM +0300, Laurent Pinchart wrote:
> > > Hi Michael,
> > > 
> > > Your previous mail slipped through the cracks, sorry about that.
> > > 
> > > On Wed, Mar 02, 2022 at 12:00:12PM +0100, Michael Rodin wrote:
> > > > Hi Laurent,
> > > > 
> > > > thank you for your work!
> > > > 
> > > > On Mon, Feb 28, 2022 at 02:00:58PM +0200, Laurent Pinchart wrote:
> > > > > From: Michael Rodin <mrodin@de.adit-jv.com>
> > > > > 
> > > > > The vertical subsampling factor is currently not considered in the
> > > > > offset calculation for plane cropping done in rpf_configure_partition.
> > > > > This causes a distortion (shift of the color plane) when formats with
> > > > > the vsub factor larger than 1 are used (e.g. NV12, see
> > > > > vsp1_video_formats in vsp1_pipe.c). This commit considers vsub factor
> > > > > for all planes except plane 0 (luminance).
> > > > > 
> > > > > Fixes: e5ad37b64de9 ("[media] v4l: vsp1: Add cropping support")
> > > > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > > > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > > > > 
> > > > > Drop generalization of the offset calculation to reduce the binary size.
> > > > 
> > > > Dropping generalization which I have done in my initial patch [1] is ok as
> > > > long as this will not cause any troubles. I am not aware of any case where
> > > > bytesperline and bpp could be different between the chroma planes, so
> > > > probably it's fine.
> > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > ---
> > > > >  drivers/media/platform/vsp1/vsp1_rpf.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
> > > > > index 85587c1b6a37..75083cb234fe 100644
> > > > > --- a/drivers/media/platform/vsp1/vsp1_rpf.c
> > > > > +++ b/drivers/media/platform/vsp1/vsp1_rpf.c
> > > > > @@ -291,11 +291,11 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
> > > > >  		     + crop.left * fmtinfo->bpp[0] / 8;
> > > > >  
> > > > >  	if (format->num_planes > 1) {
> > > > > +		unsigned int bpl = format->plane_fmt[1].bytesperline;
> > > > >  		unsigned int offset;
> > > > >  
> > > > > -		offset = crop.top * format->plane_fmt[1].bytesperline
> > > > > -		       + crop.left / fmtinfo->hsub
> > > > > -		       * fmtinfo->bpp[1] / 8;
> > > > > +		offset = crop.top / fmtinfo->vsub * bpl
> > > > > +		       + crop.left / fmtinfo->hsub * fmtinfo->bpp[1] / 8;
> > > > 
> > > > Probably it makes sense to do the division after all multiplications are
> > > > done in order to avoid rounding errors? Consider the case when left = 3,
> > > > hsub = 2, bpp = 32. Then we would get for the second part of the offset:
> > > >   3 / 2 * 32 / 8 = 1 * 32 / 8 = 4
> > > > and if we do division as the last operation:
> > > >   (3 * 32) / (8 * 2) = 96 / 16 = 6
> > > 
> > > This was actually done on purpose :-) If the horizontal subsampling
> > > factor is equal to 2, for instance for the NV12 chroma plane, the
> > > horizontal offset must effectively be a multiple of 2. Otherwise you'll
> > > swap the Cr and Cb components.
> > > 
> > > Taking your above example with a NV12 format (left=3, hsub=2, but
> > > bpp=16), with the rounding in this patch,
> > > 
> > > 	offset = crop.top / fmtinfo->vsub * bpl
> > > 	       + crop.left / fmtinfo->hsub * fmtinfo->bpp[1] / 8;
> > > 	       = [vertical offset]
> > > 	       + 3 / 2 * 16 / 8;
> > > 	       = [vertical offset]
> > > 	       + 2;
> > > 
> > > Byte: 0  1  2  3  4  5
> > >       Cr Cb Cr Cb Cr Cb ...
> > >             ^
> > >             offset
> > > 
> > > With your rounding proposal,
> > > 
> > > 	offset = crop.top / fmtinfo->vsub * bpl
> > > 	       + (crop.left * fmtinfo->bpp[1]) / (fmtinfo->hsub * 8);
> > > 	       = [vertical offset]
> > > 	       + (3 * 16) / (2 * 8);
> > > 	       = [vertical offset]
> > > 	       + 3;
> > > 
> > > Byte: 0  1  2  3  4  5
> > >       Cr Cb Cr Cb Cr Cb ...
> > >                ^
> > >                offset
> > 
> > Thank you very much for the clarification, I have missed this point!
> > Now the patch looks fine to me.
> > 
> > Reviewed-by: Michael Rodin <mrodin@de.adit-jv.com>
> > 
> > > > The first part of the offset can probably also cause the same rounding
> > > > issue.
> > > > 
> > > > >  		mem.addr[1] += offset;
> > > > >  		mem.addr[2] += offset;
> > > > >  	}
> > > > > 
> > > > 
> > > > [1] https://lore.kernel.org/all/1637679566-2D76975-1-git-send-email-mrodin-40de.adit-jv.com/T/

-- 
Regards,

Laurent Pinchart
