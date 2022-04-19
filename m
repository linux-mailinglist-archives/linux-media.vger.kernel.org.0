Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19105068CB
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 12:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238239AbiDSKdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 06:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbiDSKdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 06:33:37 -0400
X-Greylist: delayed 512 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Apr 2022 03:30:54 PDT
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2A329CB2;
        Tue, 19 Apr 2022 03:30:54 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 1AAF63C001F;
        Tue, 19 Apr 2022 12:22:20 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 19 Apr
 2022 12:22:19 +0200
Date:   Tue, 19 Apr 2022 12:22:15 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Michael Rodin <mrodin@de.adit-jv.com>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: v4l: vsp1: Fix offset calculation for plane
 cropping
Message-ID: <20220419102215.GA46023@vmlxhi-121.adit-jv.com>
References: <20220228120058.9755-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220302110012.GB11173@vmlxhi-121.adit-jv.com>
 <YlgtnlL8Loehk2cA@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YlgtnlL8Loehk2cA@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Apr 14, 2022 at 05:20:14PM +0300, Laurent Pinchart wrote:
> Hi Michael,
> 
> Your previous mail slipped through the cracks, sorry about that.
> 
> On Wed, Mar 02, 2022 at 12:00:12PM +0100, Michael Rodin wrote:
> > Hi Laurent,
> > 
> > thank you for your work!
> > 
> > On Mon, Feb 28, 2022 at 02:00:58PM +0200, Laurent Pinchart wrote:
> > > From: Michael Rodin <mrodin@de.adit-jv.com>
> > > 
> > > The vertical subsampling factor is currently not considered in the
> > > offset calculation for plane cropping done in rpf_configure_partition.
> > > This causes a distortion (shift of the color plane) when formats with
> > > the vsub factor larger than 1 are used (e.g. NV12, see
> > > vsp1_video_formats in vsp1_pipe.c). This commit considers vsub factor
> > > for all planes except plane 0 (luminance).
> > > 
> > > Fixes: e5ad37b64de9 ("[media] v4l: vsp1: Add cropping support")
> > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > Signed-off-by: LUU HOAI <https://urldefense.proofpoint.com/v2/url?u=http-3A__hoai.luu.ub-40renesas.com&d=DwICaQ&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=sWsgk3pKkv5GeIDM2RZlPY8TjNFU2D0oBeOj6QNBadE&m=XAmHpGpli5fGaRsYAxJsReuojH4FFIzGmp2Njkwt8ko&s=l9CsK_BwOB0w3jdi3p2OFRTiGdlxWl2EHtxac3eVSTU&e=>
> > > 
> > > Drop generalization of the offset calculation to reduce the binary size.
> > 
> > Dropping generalization which I have done in my initial patch [1] is ok as
> > long as this will not cause any troubles. I am not aware of any case where
> > bytesperline and bpp could be different between the chroma planes, so
> > probably it's fine.
> > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/vsp1/vsp1_rpf.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
> > > index 85587c1b6a37..75083cb234fe 100644
> > > --- a/drivers/media/platform/vsp1/vsp1_rpf.c
> > > +++ b/drivers/media/platform/vsp1/vsp1_rpf.c
> > > @@ -291,11 +291,11 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
> > >  		     + crop.left * fmtinfo->bpp[0] / 8;
> > >  
> > >  	if (format->num_planes > 1) {
> > > +		unsigned int bpl = format->plane_fmt[1].bytesperline;
> > >  		unsigned int offset;
> > >  
> > > -		offset = crop.top * format->plane_fmt[1].bytesperline
> > > -		       + crop.left / fmtinfo->hsub
> > > -		       * fmtinfo->bpp[1] / 8;
> > > +		offset = crop.top / fmtinfo->vsub * bpl
> > > +		       + crop.left / fmtinfo->hsub * fmtinfo->bpp[1] / 8;
> > 
> > Probably it makes sense to do the division after all multiplications are
> > done in order to avoid rounding errors? Consider the case when left = 3,
> > hsub = 2, bpp = 32. Then we would get for the second part of the offset:
> >   3 / 2 * 32 / 8 = 1 * 32 / 8 = 4
> > and if we do division as the last operation:
> >   (3 * 32) / (8 * 2) = 96 / 16 = 6
> 
> This was actually done on purpose :-) If the horizontal subsampling
> factor is equal to 2, for instance for the NV12 chroma plane, the
> horizontal offset must effectively be a multiple of 2. Otherwise you'll
> swap the Cr and Cb components.
> 
> Taking your above example with a NV12 format (left=3, hsub=2, but
> bpp=16), with the rounding in this patch,
> 
> 	offset = crop.top / fmtinfo->vsub * bpl
> 	       + crop.left / fmtinfo->hsub * fmtinfo->bpp[1] / 8;
> 	       = [vertical offset]
> 	       + 3 / 2 * 16 / 8;
> 	       = [vertical offset]
> 	       + 2;
> 
> Byte: 0  1  2  3  4  5
>       Cr Cb Cr Cb Cr Cb ...
>             ^
>             offset
> 
> With your rounding proposal,
> 
> 	offset = crop.top / fmtinfo->vsub * bpl
> 	       + (crop.left * fmtinfo->bpp[1]) / (fmtinfo->hsub * 8);
> 	       = [vertical offset]
> 	       + (3 * 16) / (2 * 8);
> 	       = [vertical offset]
> 	       + 3;
> 
> Byte: 0  1  2  3  4  5
>       Cr Cb Cr Cb Cr Cb ...
>                ^
>                offset

Thank you very much for the clarification, I have missed this point!
Now the patch looks fine to me.

Reviewed-by: Michael Rodin <mrodin@de.adit-jv.com>

> > The first part of the offset can probably also cause the same rounding
> > issue.
> > 
> > >  		mem.addr[1] += offset;
> > >  		mem.addr[2] += offset;
> > >  	}
> > > 
> > 
> > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_all_1637679566-2D76975-2D1-2Dgit-2Dsend-2Demail-2Dmrodin-40de.adit-2Djv.com_T_&d=DwICaQ&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=sWsgk3pKkv5GeIDM2RZlPY8TjNFU2D0oBeOj6QNBadE&m=XAmHpGpli5fGaRsYAxJsReuojH4FFIzGmp2Njkwt8ko&s=zwktftJ_aVV0iA0D8dcfCy1_rRg5PSdi5OXfTZBs648&e=
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Best Regards,
Michael
