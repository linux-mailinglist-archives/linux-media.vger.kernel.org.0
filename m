Return-Path: <linux-media+bounces-14960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 544C292F9A9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 13:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD60FB21E76
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 11:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C1D15F404;
	Fri, 12 Jul 2024 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D0OG3ePY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2413E41A;
	Fri, 12 Jul 2024 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720784838; cv=none; b=SGgCs5+uITNrtOBn56t7aeg8n1F+RFq0Azzsly7ORazo4WFLf6rkekj/imDIGDeTEfdMCiqCj5AjQag4VDKn/vpv3pshyUgRjJcN3GrVgcxEr/txI6WqqBkuio+UXJ4sCYRSoG1ZSnvHjeyeL9QACDMa8bj4Hfp/o8geUiomhOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720784838; c=relaxed/simple;
	bh=T/3oI02kJkTX1Yr1xDgUh5F5FCTmLxt7AM3acs9HL74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/YlTp8UKK+WMvzzanTmIINK5hNI2xtriYVuszL+D+QuK4uwby2WN/nMehD97BIAnlS6mnOxeNA2t5yxOXNI/sMQBELxFwltcAcJee5Gao0pQBp4TQFPo4OX6qoYht/vEcq05Jc0X5SkUBl9apYc0q0vOE3VlFseEOtSCLB2yeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D0OG3ePY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF7F5A5;
	Fri, 12 Jul 2024 13:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720784192;
	bh=T/3oI02kJkTX1Yr1xDgUh5F5FCTmLxt7AM3acs9HL74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0OG3ePYzEDC2YxCfmHw6Ekw1lo1/itgwu4jipkaVhLZKeOuCjcgwJWfivYUk3u+i
	 bZxhPPovMsl+jmF0uePTzkCrpDcAHyRGpQIFkkrRHonnVcxrDM6UtwPaKn7AXOBq57
	 gfWvT4Q6oBFME7xEALZ/naQymGg8Bb5i53UUu9oQ=
Date: Fri, 12 Jul 2024 13:37:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mingjia Zhang <mingjia.zhang@mediatek.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Keith Zhao <keith.zhao@starfivetech.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2?= =?utf-8?Q?5?=
 08/14] staging: media: starfive: Add for StarFive ISP 3A SC
Message-ID: <gppf6abnt3pjmaonnulszamnsusmnjreeygch7y3ty7sqzdbsl@xcxvrcaurkho>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-9-changhuang.liang@starfivetech.com>
 <hxv4l4t32a7il5zv2wk7btydlk6qokyborevbnrajpwziaalva@lly6nfkts2no>
 <ZQ0PR01MB13024CFE2FCCF4D39E3FAEDEF2A52@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <b45mnwf4p4ygrvukzdmrvbffndmqg5fncyepg2yxize7wq3a75@v6doupiawwnt>
 <ZQ0PR01MB1302A295EC18E19578026E0BF2A62@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1302A295EC18E19578026E0BF2A62@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

Hi Changhuang

On Fri, Jul 12, 2024 at 08:36:21AM GMT, Changhuang Liang wrote:
> Hi, Jacopo
>
> [...]
> > > > > +
> > > > > +void stf_set_scd_addr(struct stfcamss *stfcamss,
> > > > > +		      dma_addr_t yhist_addr, dma_addr_t scd_addr,
> > > > > +		      enum stf_isp_type_scd type_scd) {
> > > > > +	stf_isp_reg_set_bit(stfcamss, ISP_REG_SC_CFG_1, ISP_SC_SEL_MASK,
> > > > > +			    SEL_TYPE(type_scd));
> > > > > +	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_0, scd_addr);
> > > > > +	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_4, yhist_addr); }
> > > > > +
> > > > > +static void stf_isp_fill_yhist(struct stfcamss *stfcamss, void
> > > > > +*vaddr) {
> > > > > +	struct jh7110_isp_sc_buffer *sc = (struct jh7110_isp_sc_buffer
> > *)vaddr;
> > > > > +	u32 reg_addr = ISP_REG_YHIST_ACC_0;
> > > > > +	u32 i;
> > > > > +
> > > > > +	for (i = 0; i < 64; i++, reg_addr += 4)
> > > > > +		sc->y_histogram[i] = stf_isp_reg_read(stfcamss, reg_addr);
> > > >
> > > > If you have a contigous memory space to read, could memcpy_fromio()
> > > > help instead of going through 64 reads ?
> > > >
> > >
> > > I will try this function.
> > >
> > > > > +}
> > > > > +
> > > > > +static void stf_isp_fill_flag(struct stfcamss *stfcamss, void *vaddr,
> > > > > +			      enum stf_isp_type_scd *type_scd) {
> > > > > +	struct jh7110_isp_sc_buffer *sc = (struct jh7110_isp_sc_buffer
> > > > > +*)vaddr;
> > > > > +
> > > > > +	*type_scd = stf_isp_get_scd_type(stfcamss);
> > > > > +	if (*type_scd == TYPE_AWB) {
> > > > > +		sc->flag = JH7110_ISP_SC_FLAG_AWB;
> > > > > +		*type_scd = TYPE_OECF;
> > > > > +	} else {
> > > > > +		sc->flag = JH7110_ISP_SC_FLAG_AE_AF;
> > > > > +		*type_scd = TYPE_AWB;
> > > >
> > > > Is this correct ? Why are you overwriting the value read from HW
> > > > that indicates AE/AF stats with AWB ones ?
> > >
> > > The AWB frame and AE/AF frames will alternate, so the current frame
> > > indicates the AE/AF, then set AWB type just for next AWB frame.
> > >
> >
> > Ah! Shouldn't it be userspace configuring which type of statistics it wants to
> > receive instead of the driver alternating the two ?
> >
>
> No, this is determined by hardware, cannot be configured by userspace.
>


So this
	stf_isp_reg_set_bit(stfcamss, ISP_REG_SC_CFG_1, ISP_SC_SEL_MASK,
			    SEL_TYPE(type_scd));

doesn't actually select which stats type you get from the HW

> > > >
> > > > > +	}
> > > > > +}
> > > > > +
> > > > >  irqreturn_t stf_line_irq_handler(int irq, void *priv)  {
> > > > >  	struct stfcamss *stfcamss = priv;
> > > > >  	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
> > > > > +	struct stf_capture *cap_scd =
> > > > > +&stfcamss->captures[STF_CAPTURE_SCD];
> > > > >  	struct stfcamss_buffer *change_buf;
> > > > > +	enum stf_isp_type_scd type_scd;
> > > > > +	u32 value;
> > > > >  	u32 status;
> > > > >
> > > > >  	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0); @@
> > > > > -467,6
> > > > > +513,17 @@ irqreturn_t stf_line_irq_handler(int irq, void *priv)
> > > > >  					stf_set_yuv_addr(stfcamss, change_buf->addr[0],
> > > > >  							 change_buf->addr[1]);
> > > > >  			}
> > > > > +
> > > > > +			value = stf_isp_reg_read(stfcamss,
> > > > ISP_REG_CSI_MODULE_CFG);
> > > > > +			if (value & CSI_SC_EN) {
> > > > > +				change_buf = stf_change_buffer(&cap_scd->buffers);
> > > > > +				if (change_buf) {
> > > > > +					stf_isp_fill_flag(stfcamss, change_buf->vaddr,
> > > > > +							  &type_scd);
> > > > > +					stf_set_scd_addr(stfcamss, change_buf->addr[0],
> > > > > +							 change_buf->addr[1], type_scd);
> > > >
> > > > Sorry if I'm un-familiar with the HW but this seems to be the line-interrupt.
> > > > Are you swapping buffers every line or it's just that you have a
> > > > single line irq for the stats ?
> > > >
> > >
> > > Every frame triggers a line-interrupt, and we will swap buffers in it.
> > >
> >
> > ah, frames completion triggers a line-interrupt ?
> >
>
> Every frame will trigger line-interrupt and stf_isp_irq_handler.
> We use line-interrupt changing buffer, the stf_isp_irq_handler will indicate that
> image transfer to DDR is complete.
>
>
> > > > > +				}
> > > > > +			}
> > > > >  		}
> > > > >
> > > > >  		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS, @@ -485,6
> > +542,7
> > > > @@
> > > > > irqreturn_t stf_isp_irq_handler(int irq, void *priv)  {
> > > > >  	struct stfcamss *stfcamss = priv;
> > > > >  	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
> > > > > +	struct stf_capture *cap_scd =
> > > > > +&stfcamss->captures[STF_CAPTURE_SCD];
> > > > >  	struct stfcamss_buffer *ready_buf;
> > > > >  	u32 status;
> > > > >
> > > > > @@ -496,6 +554,14 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
> > > > >  				vb2_buffer_done(&ready_buf->vb.vb2_buf,
> > > > VB2_BUF_STATE_DONE);
> > > > >  		}
> > > > >
> > > > > +		if (status & ISPC_SC) {
> > > > > +			ready_buf = stf_buf_done(&cap_scd->buffers);
> > > > > +			if (ready_buf) {
> > > > > +				stf_isp_fill_yhist(stfcamss, ready_buf->vaddr);
> > > > > +				vb2_buffer_done(&ready_buf->vb.vb2_buf,
> > > > VB2_BUF_STATE_DONE);
> > > > > +			}
> > > > > +		}
> > > > > +
> > > > >  		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
> > > > >  				  (status & ~ISPC_INT_ALL_MASK) |
> > > > >  				  ISPC_ISP | ISPC_CSI | ISPC_SC); diff --git
> > > > > a/drivers/staging/media/starfive/camss/stf-isp.h
> > > > > b/drivers/staging/media/starfive/camss/stf-isp.h
> > > > > index fcda0502e3b0..0af7b367e57a 100644
> > > > > --- a/drivers/staging/media/starfive/camss/stf-isp.h
> > > > > +++ b/drivers/staging/media/starfive/camss/stf-isp.h
> > > > > @@ -10,6 +10,7 @@
> > > > >  #ifndef STF_ISP_H
> > > > >  #define STF_ISP_H
> > > > >
> > > > > +#include <linux/jh7110-isp.h>
> > > > >  #include <media/v4l2-subdev.h>
> > > > >
> > > > >  #include "stf-video.h"
> > > > > @@ -107,6 +108,12 @@
> > > > >  #define Y_COOR(y)				((y) << 16)
> > > > >  #define X_COOR(x)				((x) << 0)
> > > > >
> > > > > +#define ISP_REG_SCD_CFG_0			0x098
> > > > > +
> > > > > +#define ISP_REG_SC_CFG_1			0x0bc
> > > > > +#define ISP_SC_SEL_MASK				GENMASK(31, 30)
> > > > > +#define SEL_TYPE(n)				((n) << 30)
> > > > > +
> > > > >  #define ISP_REG_LCCF_CFG_2			0x0e0
> > > > >  #define ISP_REG_LCCF_CFG_3			0x0e4
> > > > >  #define ISP_REG_LCCF_CFG_4			0x0e8
> > > > > @@ -305,6 +312,10 @@
> > > > >  #define DNRM_F(n)				((n) << 16)
> > > > >  #define CCM_M_DAT(n)				((n) << 0)
> > > > >
> > > > > +#define ISP_REG_YHIST_CFG_4			0xcd8
> > > > > +
> > > > > +#define ISP_REG_YHIST_ACC_0			0xd00
> > > > > +
> > > > >  #define ISP_REG_GAMMA_VAL0			0xe00
> > > > >  #define ISP_REG_GAMMA_VAL1			0xe04
> > > > >  #define ISP_REG_GAMMA_VAL2			0xe08
> > > > > @@ -389,6 +400,15 @@
> > > > >  #define IMAGE_MAX_WIDTH				1920
> > > > >  #define IMAGE_MAX_HEIGH				1080
> > > > >
> > > > > +#define ISP_YHIST_BUFFER_SIZE			(64 * sizeof(__u32))
> > > >
> > > > Should this be in the uAPI header as it is useful to userspace as well ?
> > > >
> > > > you could:
> > > >
> > > > struct jh7110_isp_sc_buffer {
> > > > 	__u8 y_histogram[ISP_YHIST_BUFFER_SIZE];
> > > > 	__u32 reserv0[33];
> > > > 	__u32 bright_sc[4096];
> > > > 	__u32 reserv1[96];
> > > > 	__u32 ae_hist_y[128];
> > > > 	__u32 reserv2[511];
> > > > 	__u16 flag;
> > > > };
> > > >
> > > > ofc if the size is made part of the uAPI you need a more proper name
> > > > such as JH7110_ISP_YHIST_SIZE
> > > >
> > >
> > > OK, I will try this.
> > >
> > > > > +
> > > > > +enum stf_isp_type_scd {
> > > > > +	TYPE_DEC = 0,
> > > > > +	TYPE_OBC,
> > > > > +	TYPE_OECF,
> > > > > +	TYPE_AWB,
> > > > > +};
> > > > > +
> > > > >  /* pad id for media framework */
> > > > >  enum stf_isp_pad_id {
> > > > >  	STF_ISP_PAD_SINK = 0,
> > > > > @@ -429,5 +449,8 @@ int stf_isp_unregister(struct stf_isp_dev
> > > > > *isp_dev);
> > > > >
> > > > >  void stf_set_yuv_addr(struct stfcamss *stfcamss,
> > > > >  		      dma_addr_t y_addr, dma_addr_t uv_addr);
> > > > > +void stf_set_scd_addr(struct stfcamss *stfcamss,
> > > > > +		      dma_addr_t yhist_addr, dma_addr_t scd_addr,
> > > > > +		      enum stf_isp_type_scd type_scd);
> > > > >
> > > > >  #endif /* STF_ISP_H */
> > > > > diff --git a/drivers/staging/media/starfive/camss/stf-video.c
> > > > > b/drivers/staging/media/starfive/camss/stf-video.c
> > > > > index 989b5e82bae9..2203605ec9c7 100644
> > > > > --- a/drivers/staging/media/starfive/camss/stf-video.c
> > > > > +++ b/drivers/staging/media/starfive/camss/stf-video.c
> > > > > @@ -125,6 +125,14 @@ static int stf_video_init_format(struct
> > > > stfcamss_video *video)
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > +static int stf_video_scd_init_format(struct stfcamss_video
> > > > > +*video)
> > > >
> > > > Make it void if it can't fail (see below)
> > > >
> > >
> > > OK.
> > >
> > > > > +{
> > > > > +	video->active_fmt.fmt.meta.dataformat =
> > > > video->formats[0].pixelformat;
> > > > > +	video->active_fmt.fmt.meta.buffersize = sizeof(struct
> > > > > +jh7110_isp_sc_buffer);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  /* -----------------------------------------------------------------------------
> > > > >   * Video queue operations
> > > > >   */
> > > > > @@ -330,6 +338,78 @@ static const struct vb2_ops
> > > > > stf_video_vb2_q_ops =
> > > > {
> > > > >  	.stop_streaming  = video_stop_streaming,  };
> > > > >
> > > > > +static int video_scd_queue_setup(struct vb2_queue *q,
> > > > > +				 unsigned int *num_buffers,
> > > > > +				 unsigned int *num_planes,
> > > > > +				 unsigned int sizes[],
> > > > > +				 struct device *alloc_devs[]) {
> > > > > +	if (*num_planes)
> > > > > +		return sizes[0] < sizeof(struct jh7110_isp_sc_buffer) ? -EINVAL :
> > > > > +0;
> > > > > +
> > > > > +	*num_planes = 1;
> > > > > +	sizes[0] = sizeof(struct jh7110_isp_sc_buffer);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int video_scd_buf_init(struct vb2_buffer *vb) {
> > > > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > > > +	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
> > > > > +	dma_addr_t *paddr;
> > > > > +
> > > > > +	paddr = vb2_plane_cookie(vb, 0);
> > > > > +	buffer->addr[0] = *paddr;
> > > > > +	buffer->addr[1] = buffer->addr[0] + ISP_YHIST_BUFFER_SIZE;
> > > >
> > > > Interesting, I don't see many users of vb2_plane_cookie() in
> > > > mainline and I'm not sure what this gives you as you use it to program the
> > following registers:
> > > >
> > > > 	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_0, scd_addr);
> > > > 	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_4, yhist_addr);
> > > >
> > >
> > > We set the value for ISP hardware, then ISP will transfer the statistics to the
> > buffer.
> > > when the stf_isp_irq_handler interrupt is triggered, indicates that
> > > the buffer fill is complete.
> > >
> >
> > So I take this as
> >
> > 	paddr = vb2_plane_cookie(vb, 0);
> > 	buffer->addr[0] = *paddr;
> > 	buffer->addr[1] = buffer->addr[0] + ISP_YHIST_BUFFER_SIZE;
> >
> >         stf_set_scd_addr(stfcamss, change_buf->addr[0],
> >                          change_buf->addr[1], type_scd);
> >
> > Makes the ISP transfer data directly to the memory areas in addr[0] and addr[1]
> > (which explains why struct jh7110_isp_sc_buffer is packed, as it has to match
> > the HW registers layout)
> >
> > If this is the case, why are you then manually copying the histograms and the
> > flags to vaddr ?
> >
>
> Yes, your are right.
> But actually there is a problem with our ISP RTL.
> We set this yhist_addr to ISP, but it actually not work.
> 	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_4, yhist_addr);
> or I will drop this line in next version.
>
> So, in this structure
> struct jh7110_isp_sc_buffer {
> 	__u32 y_histogram[64];
> 	__u32 reserv0[33];
> 	__u32 bright_sc[4096];
> 	__u32 reserv1[96];
> 	__u32 ae_hist_y[128];
> 	__u32 reserv2[511];
> 	__u16 flag;
> };
>
> Only
>
> 	__u32 reserv0[33];
> 	__u32 bright_sc[4096];
> 	__u32 reserv1[96];
> 	__u32 ae_hist_y[128];
> 	__u32 reserv2[511];
>
> transfer by ISP hardware.
>
> I need to fill
> 	__u32 y_histogram[64];
> 	__u16 flag;
>
> by vaddr.

I see.

Apart from the fact you can drop paddr and vb2_plane_cookie() and use
vaddr for all (if I'm not mistaken), could you please record the above
rationale for manually filling y_histogram and flag by hand in a
comment to avoid future readers being confused by this as I was ?

Thank you
   j

>
> Regards,
> Changhuang
>
> >                 ready_buf = stf_buf_done(&cap_scd->buffers);
> >                 if (ready_buf) {
> >                         stf_isp_fill_yhist(stfcamss, ready_buf->vaddr);
> >                         vb2_buffer_done(&ready_buf->vb.vb2_buf,
> > VB2_BUF_STATE_DONE);
> >                 }
> >
> >                 change_buf = stf_change_buffer(&cap_scd->buffers);
> >                 if (change_buf) {
> >                         stf_isp_fill_flag(stfcamss, change_buf->vaddr,
> >                                           &type_scd);
> >
> > If I read vb2_dc_alloc_coherent() right 'cookie' == 'vaddr'
> >
> > static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf) {
> > 	struct vb2_queue *q = buf->vb->vb2_queue;
> >
> > 	buf->cookie = dma_alloc_attrs(buf->dev,
> > 				      buf->size,
> > 				      &buf->dma_addr,
> > 				      GFP_KERNEL | q->gfp_flags,
> > 				      buf->attrs);
> > 	if (!buf->cookie)
> > 		return -ENOMEM;
> >
> > 	if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> > 		return 0;
> >
> > 	buf->vaddr = buf->cookie;
> > 	return 0;
> > }
> >
> > Could you verify what you get by printing out 'paddr' and 'vaddr' in
> > video_scd_buf_init() ?
> >
> >
> > > >
> > > > > +	buffer->vaddr = vb2_plane_vaddr(vb, 0);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int video_scd_buf_prepare(struct vb2_buffer *vb) {
> > > > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > > > +
> > > > > +	if (sizeof(struct jh7110_isp_sc_buffer) > vb2_plane_size(vb, 0))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	vb2_set_plane_payload(vb, 0, sizeof(struct
> > > > > +jh7110_isp_sc_buffer));
> > > > > +
> > > > > +	vbuf->field = V4L2_FIELD_NONE;
> > > >
> > > > is this necessary ?
> > > >
> > >
> > > Will drop it.
> > >
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int video_scd_start_streaming(struct vb2_queue *q,
> > > > > +unsigned int count) {
> > > > > +	struct stfcamss_video *video = vb2_get_drv_priv(q);
> > > > > +
> > > > > +	video->ops->start_streaming(video);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static void video_scd_stop_streaming(struct vb2_queue *q) {
> > > > > +	struct stfcamss_video *video = vb2_get_drv_priv(q);
> > > > > +
> > > > > +	video->ops->stop_streaming(video);
> > > > > +
> > > > > +	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR); }
> > > > > +
> > > > > +static const struct vb2_ops stf_video_scd_vb2_q_ops = {
> > > > > +	.queue_setup     = video_scd_queue_setup,
> > > > > +	.wait_prepare    = vb2_ops_wait_prepare,
> > > > > +	.wait_finish     = vb2_ops_wait_finish,
> > > > > +	.buf_init        = video_scd_buf_init,
> > > > > +	.buf_prepare     = video_scd_buf_prepare,
> > > > > +	.buf_queue       = video_buf_queue,
> > > > > +	.start_streaming = video_scd_start_streaming,
> > > > > +	.stop_streaming  = video_scd_stop_streaming, };
> > > > > +
> > > > >  /* -----------------------------------------------------------------------------
> > > > >   * V4L2 ioctls
> > > > >   */
> > > > > @@ -448,6 +528,37 @@ static const struct v4l2_ioctl_ops
> > > > > stf_vid_ioctl_ops
> > > > = {
> > > > >  	.vidioc_streamoff               = vb2_ioctl_streamoff,
> > > > >  };
> > > > >
> > > > > +static int video_scd_g_fmt(struct file *file, void *fh, struct
> > > > > +v4l2_format *f) {
> > > > > +	struct stfcamss_video *video = video_drvdata(file);
> > > > > +	struct v4l2_meta_format *meta = &f->fmt.meta;
> > > > > +
> > > > > +	if (f->type != video->type)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	meta->dataformat = video->active_fmt.fmt.meta.dataformat;
> > > > > +	meta->buffersize = video->active_fmt.fmt.meta.buffersize;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct v4l2_ioctl_ops stf_vid_scd_ioctl_ops = {
> > > > > +	.vidioc_querycap                = video_querycap,
> > > > > +	.vidioc_enum_fmt_meta_cap       = video_enum_fmt,
> > > > > +	.vidioc_g_fmt_meta_cap          = video_scd_g_fmt,
> > > > > +	.vidioc_s_fmt_meta_cap          = video_scd_g_fmt,
> > > > > +	.vidioc_try_fmt_meta_cap        = video_scd_g_fmt,
> > > > > +	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
> > > > > +	.vidioc_querybuf                = vb2_ioctl_querybuf,
> > > > > +	.vidioc_qbuf                    = vb2_ioctl_qbuf,
> > > > > +	.vidioc_expbuf                  = vb2_ioctl_expbuf,
> > > > > +	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
> > > > > +	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
> > > > > +	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
> > > > > +	.vidioc_streamon                = vb2_ioctl_streamon,
> > > > > +	.vidioc_streamoff               = vb2_ioctl_streamoff,
> > > > > +};
> > > > > +
> > > > >  /* -----------------------------------------------------------------------------
> > > > >   * V4L2 file operations
> > > > >   */
> > > > > @@ -473,6 +584,9 @@ static int stf_link_validate(struct media_link *link)
> > > > >  	struct stfcamss_video *video = video_get_drvdata(vdev);
> > > > >  	int ret;
> > > > >
> > > > > +	if (video->type == V4L2_BUF_TYPE_META_CAPTURE)
> > > > > +		return 0;
> > > > > +
> > > > >  	ret = stf_video_check_format(video);
> > > > >
> > > > >  	return ret;
> > > > > @@ -506,7 +620,11 @@ int stf_video_register(struct stfcamss_video
> > > > *video,
> > > > >  	q = &video->vb2_q;
> > > > >  	q->drv_priv = video;
> > > > >  	q->mem_ops = &vb2_dma_contig_memops;
> > > > > -	q->ops = &stf_video_vb2_q_ops;
> > > > > +
> > > > > +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > > > > +		q->ops = &stf_video_vb2_q_ops;
> > > > > +	else
> > > > > +		q->ops = &stf_video_scd_vb2_q_ops;
> > > > >  	q->type = video->type;
> > > > >  	q->io_modes = VB2_DMABUF | VB2_MMAP;
> > > > >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > > > @@ -529,16 +647,28 @@ int stf_video_register(struct stfcamss_video
> > > > *video,
> > > > >  		goto err_mutex_destroy;
> > > > >  	}
> > > > >
> > > > > -	ret = stf_video_init_format(video);
> > > > > -	if (ret < 0) {
> > > > > -		dev_err(video->stfcamss->dev,
> > > > > -			"Failed to init format: %d\n", ret);
> > > > > -		goto err_media_cleanup;
> > > > > +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > > > > +		ret = stf_video_init_format(video);
> > > >
> > > > I don't think this can fail
> > > >
> > >
> > > This already exists, and I probably will not change it here.
> > >
> >
> > No problem! Maybe something for later when de-staging the driver.
> >
> > Thanks
> >   j
> > > >

