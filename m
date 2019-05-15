Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 352E51F4D1
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 14:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfEOMtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 08:49:47 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:49323 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726667AbfEOMtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 08:49:47 -0400
X-UUID: 46500c3b81d34772aaefd1ecee520c3f-20190515
X-UUID: 46500c3b81d34772aaefd1ecee520c3f-20190515
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1641890628; Wed, 15 May 2019 20:49:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 May 2019 20:49:40 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 May 2019 20:49:39 +0800
Message-ID: <1557924579.5721.5.camel@mtksdccf07>
Subject: Re: [RFC, V2, 06/11] media: platform: Add Mediatek ISP P1 image &
 meta formats
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <tfiga@chromium.org>, <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <shik@chromium.org>, <devicetree@vger.kernel.org>,
        <Sean.Cheng@mediatek.com>, <suleiman@chromium.org>,
        <Rynn.Wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <ryan.yu@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <sj.huang@mediatek.com>,
        <yuzhao@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <seraph.huang@mediatek.com>, <zwisler@chromium.org>,
        <christie.yu@mediatek.com>, <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Wed, 15 May 2019 20:49:39 +0800
In-Reply-To: <5aad30f8-04b0-e3f1-e1d1-def349fd2974@xs4all.nl>
References: <Jungo Lin <jungo.lin@mediatek.com>
         <20190510015755.51495-7-jungo.lin@mediatek.com>
         <5aad30f8-04b0-e3f1-e1d1-def349fd2974@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1CCEB0FC81A333AE5BC56B0F71FB2257A386FDA685253B160604E3EC0E7228382000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Hans:

Thanks for your comments.

On Mon, 2019-05-13 at 10:35 +0200, Hans Verkuil wrote:
> On 5/10/19 3:57 AM, Jungo Lin wrote:
> > Add packed/unpacked/full-g bayer format with 8/10/12/14 bit
> > for image output. Add Pass 1 (P1) specific meta formats for
> > parameter processing and 3A/other statistics.
> 
> These pixel formats will need to be documented in Documentation/media/uapi/v4l/pixfmt-<something>.rst.
> 

Ok, we will add these pixfmt-<something>.rst files in next patch to
explain these pixel formats.

> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  include/uapi/linux/videodev2.h | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 1db220da3bcc..b79046d2d812 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -711,6 +711,20 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
> >  #define V4L2_PIX_FMT_IPU3_SRGGB10	v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
> >  
> > +/* Vendor specific - Mediatek ISP compressed formats */
> > +#define V4L2_PIX_FMT_MTISP_U8	v4l2_fourcc('M', 'T', 'U', '8') /* Unpacked bayer format, 16-bit */
> > +#define V4L2_PIX_FMT_MTISP_U10  v4l2_fourcc('M', 'T', 'U', 'A') /* Unpacked bayer format, 16-bit */
> > +#define V4L2_PIX_FMT_MTISP_U12  v4l2_fourcc('M', 'T', 'U', 'C') /* Unpacked bayer format, 16-bit */
> > +#define V4L2_PIX_FMT_MTISP_U14  v4l2_fourcc('M', 'T', 'U', 'E') /* Unpacked bayer format, 16-bit */
> > +#define V4L2_PIX_FMT_MTISP_B8	v4l2_fourcc('M', 'T', 'B', '8') /* Packed   bayer format,  8-bit */
> > +#define V4L2_PIX_FMT_MTISP_B10  v4l2_fourcc('M', 'T', 'B', 'A') /* Packed   bayer format, 10-bit */
> > +#define V4L2_PIX_FMT_MTISP_B12  v4l2_fourcc('M', 'T', 'B', 'C') /* Packed   bayer format, 12-bit */
> > +#define V4L2_PIX_FMT_MTISP_B14  v4l2_fourcc('M', 'T', 'B', 'E') /* Packed   bayer format, 14-bit */
> > +#define V4L2_PIX_FMT_MTISP_F8	v4l2_fourcc('M', 'T', 'F', '8') /* Full-G   bayer format,  8-bit */
> > +#define V4L2_PIX_FMT_MTISP_F10  v4l2_fourcc('M', 'T', 'F', 'A') /* Full-G   bayer format, 10-bit */
> > +#define V4L2_PIX_FMT_MTISP_F12  v4l2_fourcc('M', 'T', 'F', 'C') /* Full-G   bayer format, 12-bit */
> > +#define V4L2_PIX_FMT_MTISP_F14  v4l2_fourcc('M', 'T', 'F', 'E') /* Full-G   bayer format, 14-bit */
> 
> Are these all compressed formats? What sort of compression is used? Can software unpack it,
> or this is meant to be fed to other mediatek hardware blocks?
> 

No, these are not compressed formats. These images could be unpacked by
software, not depended on Mediatek hardware blocks.

> > +
> >  /* SDR formats - used only for Software Defined Radio devices */
> >  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
> >  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
> > @@ -732,6 +746,12 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
> >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> > +/* Vendor specific - Mediatek ISP parameters for firmware */
> > +#define V4L2_META_FMT_MTISP_PARAMS v4l2_fourcc('M', 'T', 'f', 'p') /* ISP tuning parameters */
> > +#define V4L2_META_FMT_MTISP_3A	   v4l2_fourcc('M', 'T', 'f', 'a') /* AE/AWB histogram */
> > +#define V4L2_META_FMT_MTISP_AF	   v4l2_fourcc('M', 'T', 'f', 'f') /* AF histogram */
> > +#define V4L2_META_FMT_MTISP_LCS	   v4l2_fourcc('M', 'T', 'f', 'c') /* Local contrast enhanced statistics */
> > +#define V4L2_META_FMT_MTISP_LMV	   v4l2_fourcc('M', 'T', 'f', 'm') /* Local motion vector histogram */
> 
> The documentation for these meta formats either needs to point to
> freely available mediatek documentation (i.e. no NDA needed), or it
> has to be documented in a header or in the pixelformat documentation.
> 

Ok, we are under internal discussion how to export these meta
information.

> Regards,
> 
> 	Hans
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


