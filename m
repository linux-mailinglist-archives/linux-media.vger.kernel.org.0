Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D8D6D2581
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 18:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbjCaQaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 12:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjCaQ3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 12:29:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9372CAD5
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 09:25:32 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1piHYZ-00036R-Bp; Fri, 31 Mar 2023 18:24:51 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1piHYX-00062h-BM; Fri, 31 Mar 2023 18:24:49 +0200
Date:   Fri, 31 Mar 2023 18:24:49 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [RFC PATCH] media: hantro: respect data_offset in vb2_plane
Message-ID: <20230331162449.GF7238@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230327132324.1781416-1-m.tretter@pengutronix.de>
 <1f1a5acbd8951cfec250b78fff5a9fec731c3488.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f1a5acbd8951cfec250b78fff5a9fec731c3488.camel@ndufresne.ca>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Fri, 31 Mar 2023 11:07:44 -0400, Nicolas Dufresne wrote:
> Le lundi 27 mars 2023 à 15:23 +0200, Michael Tretter a écrit :
> > The vb2_plane in the vb2_v4l2_buffer may have a data_offset, which is
> > written by user space to tell the driver that the data starts at an
> > offset into the buffer. Currently the hantro driver assumes that the
> > data starts directly at the base address of the buffer.
> > 
> > Add the data_offset to the plane dma_address to make sure that the
> > encoder actually reads the plane data if the user space put the plane
> > data at an offset into the buffer. Otherwise the encoded data may not be
> > the data that userspace expected to be encoded.
> > 
> 
> The data_offset for this purpose have limited use, and this usage is only valid
> for encoders (OUTPUT queues). Would it be possible to state this clearly in the
> subject ?

I'll update the subject.

> 
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Hi,
> > 
> > Most other drivers also assume that the address returned by
> > vb2_dma_contig_plane_dma_addr() is the start of the plane data. Maybe it
> > would be better to change vb2_dma_contig_plane_dma_addr() to already add
> > the data_offset to the plane address. However, there are a few drivers
> > that already have a helper that respects the data_offset, but that seems
> > to be the exception rather than the rule.
> 
> I had this discussion recently, and its a bit hardware specific. Some HW may
> support any random offset, in which case you will program the original (and
> aligned) address, and program the offset in the HW. But some HW may not, in
> which case you need to add alignment validation in the driver.

This makes sense, but it's still a bit surprising that some drivers don't
respect the data_offset. Maybe there should be a check that warns or returns
an error to userspace if the data_offset is set but ignored by the driver?
With such an error, the behavior of vb2_dma_contig_plane_dma_addr() would be
obvious. OTOH, the warning would have to be added in the driver, too.

> 
> > 
> > What I am actually trying to achieve is to import a V4L2_PIX_FMT_NV12
> > buffer from a Rockchip RGA2 (which doesn't support the multi-planar API)
> > as a V4L2_PIX_FMT_NV12M buffer into the Hantro JPEG encoder (which
> > doesn't support V4L2_PIX_FMT_NV12). Solving this by importing the same
> > FD for each plane with a respective offset is how one would import such
> > a buffer with the DRM API. Please tell me, if my approach is wrong and,
> > if so, how I should solve it differently.
> 
> The approach is fine, this is the only valid usage of data_offset when passed by
> userspace. Though, you are making your live much more difficult then needed,
> adding NV12 (contiguous) support to the jpeg encoder should be fairly easy too.

It is fairly easy to add this in the driver, but the negotiation in GStreamer
is becomes a bit cumbersome as the caps don't distinguish between
V4L2_PIX_FMT_NV12 and V4L2_PIX_FMT_NV12M and the encoder will prefer
V4L2_PIX_FMT_NV12M if NV12 is negotiated. Letting userspace explicitly state
the offset of the second plane makes things easier as well. Thus, I discarded
the option of adding NV12 contiguous support to this encoder.

> 
> > 
> > Michael
> > ---
> >  .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c   | 24 +++++++++++++------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> > index 8395c4d48dd0..05df7768187d 100644
> > --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> > +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> > @@ -32,6 +32,16 @@
> >  
> >  #define VEPU_JPEG_QUANT_TABLE_COUNT 16
> >  
> > +static dma_addr_t rockchip_vpu2_plane_dma_addr(struct vb2_buffer *vb,
> > +					       unsigned int plane_no)
> > +{
> > +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> > +	dma_addr_t base = vb2_dma_contig_plane_dma_addr(vb, plane_no);
> > +	unsigned int offset = v4l2_buf->planes[plane_no].data_offset;
> > +
> > +	return base + offset;
> 
> As the offset is not being passed as a control to the HW, you need to go back to
> the datasheet, and figure-out what is the required alignment. This aligment then
> needs to be validated. I don't know the exact answer for you, we don't check the
> dma address because they are all page aligned, so its not needed.
> 
> If the alignment is not acceptable, you have to fail synchronously in
> VIDIOC_QBUF, so that userspace knows and can fallback to copy.

I will add the necessary checks and send a proper version of the patch.

Thanks a lot!

Michael

> 
> > +}
> > +
> >  static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
> >  					   struct hantro_ctx *ctx)
> >  {
> > @@ -79,23 +89,23 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct hantro_dev *vpu,
> >  
> >  	WARN_ON(pix_fmt->num_planes > 3);
> >  
> > -	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
> > +	vepu_write_relaxed(vpu, rockchip_vpu2_plane_dma_addr(dst_buf, 0) +
> >  				ctx->vpu_dst_fmt->header_size,
> >  			   VEPU_REG_ADDR_OUTPUT_STREAM);
> >  	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
> >  
> >  	if (pix_fmt->num_planes == 1) {
> > -		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > +		src[0] = rockchip_vpu2_plane_dma_addr(src_buf, 0);
> >  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> >  	} else if (pix_fmt->num_planes == 2) {
> > -		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > -		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
> > +		src[0] = rockchip_vpu2_plane_dma_addr(src_buf, 0);
> > +		src[1] = rockchip_vpu2_plane_dma_addr(src_buf, 1);
> >  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> >  		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
> >  	} else {
> > -		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > -		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
> > -		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
> > +		src[0] = rockchip_vpu2_plane_dma_addr(src_buf, 0);
> > +		src[1] = rockchip_vpu2_plane_dma_addr(src_buf, 1);
> > +		src[2] = rockchip_vpu2_plane_dma_addr(src_buf, 2);
> >  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> >  		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
> >  		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);
> 
> 
