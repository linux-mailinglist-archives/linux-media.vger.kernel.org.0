Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C85B1B1F0
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 10:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfEMIfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 04:35:43 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52321 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727720AbfEMIfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 04:35:43 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Q6Qqhi3v70YQeQ6QthcMlO; Mon, 13 May 2019 10:35:40 +0200
Subject: Re: [RFC,V2,06/11] media: platform: Add Mediatek ISP P1 image & meta
 formats
To:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        seraph.huang@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20190510015755.51495-7-jungo.lin@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5aad30f8-04b0-e3f1-e1d1-def349fd2974@xs4all.nl>
Date:   Mon, 13 May 2019 10:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510015755.51495-7-jungo.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKjl+7SPK/J+2MK4GsV/OD790bNQlW19JYOKfRUnbuiA8rujxLk8gGYl+z3KpIf/mZfcUQ/QXXxXNi+TMglWyOToTnPvs7ewHyiHQXf59jZkHESwYFHd
 +kRKwIXD4pBeO2zEGaWNf5pCOec4H7+swakENaOzy9STrP2TYWRvf2Z7nYwgcZEg9ssHFHuq1TvD7jiuvBQLe2C7pnAC4BFC1z1o/fL9ZRWZTC3TXVol2QOg
 /7FGd8bmxXfnhblBakSB3UU8XqPptYatsjWyW1YSyEyul/ICFqpK9Lgrrga2MBBIasSWK79LzWno9j0ESHftme1vL+UgAqjX+J6fWV7rrV8HcuSiliGvPoun
 Hrm4JlLWWLfIpiFCtiiqJT0ZdjGhfJEYMLR03dhwbNsTGZuuL4RRPik7Vx6UiC2U/TVoh0ZG8MaDkJIQbzJmdOo/BSJVfGG7IyH4zUMuO0w5Tudw/oJRh3wc
 VzwPgDNunUEXRkSPJ7p2QTGpiTe4Wx+pg1RoHzvA1TTrsVDzXR06FeLKjaRLyT3npAThsSLK73PrrOiJhpF++5NdwGIde6H2s0AIdUWp7HQGFyYI+7UL9Wfj
 8z2zvjKgQXpDSHDKLE6/GRzxbnTXYzp87mfPb8op4Q039JR3Aq7q2bUllXlOW0oufratzQdO42yP6422pm4p0WnJcJHUlyQZDey8USGilYuFRBOT8MjC9b43
 R55LirBBHyyB78/4fvE2Me7YaZlzOSsaJgNLFSc0lF6SjkkDZpvqXs2FISvZnZJJ1P1VSe65numnGeQFo9zSeWwltuZhdNGLH0UVQQcGVD5o7uvm6W+yOKXe
 JkoIXL0Cpp+3Ew9bWZ6zEOP3XmKduNr7tA8r1BSfxvBWOPHmz+qU3lV5nVcQGrdGVmXs3P8nuAvbsJv3kH8HnjpXUkYgp3C/YbCCEOZNdg3IzelSfDwSyjke
 6od2ZhftMIiwnnH2TbOrnW4U+jR5sjc9vTs5tX+NYco145CEzzpJFAyOu0ViFXunWtr5KysxiGNoC06ICrWv9Qbz7eI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/10/19 3:57 AM, Jungo Lin wrote:
> Add packed/unpacked/full-g bayer format with 8/10/12/14 bit
> for image output. Add Pass 1 (P1) specific meta formats for
> parameter processing and 3A/other statistics.

These pixel formats will need to be documented in Documentation/media/uapi/v4l/pixfmt-<something>.rst.

> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  include/uapi/linux/videodev2.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1db220da3bcc..b79046d2d812 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -711,6 +711,20 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
>  #define V4L2_PIX_FMT_IPU3_SRGGB10	v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
>  
> +/* Vendor specific - Mediatek ISP compressed formats */
> +#define V4L2_PIX_FMT_MTISP_U8	v4l2_fourcc('M', 'T', 'U', '8') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_U10  v4l2_fourcc('M', 'T', 'U', 'A') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_U12  v4l2_fourcc('M', 'T', 'U', 'C') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_U14  v4l2_fourcc('M', 'T', 'U', 'E') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_B8	v4l2_fourcc('M', 'T', 'B', '8') /* Packed   bayer format,  8-bit */
> +#define V4L2_PIX_FMT_MTISP_B10  v4l2_fourcc('M', 'T', 'B', 'A') /* Packed   bayer format, 10-bit */
> +#define V4L2_PIX_FMT_MTISP_B12  v4l2_fourcc('M', 'T', 'B', 'C') /* Packed   bayer format, 12-bit */
> +#define V4L2_PIX_FMT_MTISP_B14  v4l2_fourcc('M', 'T', 'B', 'E') /* Packed   bayer format, 14-bit */
> +#define V4L2_PIX_FMT_MTISP_F8	v4l2_fourcc('M', 'T', 'F', '8') /* Full-G   bayer format,  8-bit */
> +#define V4L2_PIX_FMT_MTISP_F10  v4l2_fourcc('M', 'T', 'F', 'A') /* Full-G   bayer format, 10-bit */
> +#define V4L2_PIX_FMT_MTISP_F12  v4l2_fourcc('M', 'T', 'F', 'C') /* Full-G   bayer format, 12-bit */
> +#define V4L2_PIX_FMT_MTISP_F14  v4l2_fourcc('M', 'T', 'F', 'E') /* Full-G   bayer format, 14-bit */

Are these all compressed formats? What sort of compression is used? Can software unpack it,
or this is meant to be fed to other mediatek hardware blocks?

> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
> @@ -732,6 +746,12 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +/* Vendor specific - Mediatek ISP parameters for firmware */
> +#define V4L2_META_FMT_MTISP_PARAMS v4l2_fourcc('M', 'T', 'f', 'p') /* ISP tuning parameters */
> +#define V4L2_META_FMT_MTISP_3A	   v4l2_fourcc('M', 'T', 'f', 'a') /* AE/AWB histogram */
> +#define V4L2_META_FMT_MTISP_AF	   v4l2_fourcc('M', 'T', 'f', 'f') /* AF histogram */
> +#define V4L2_META_FMT_MTISP_LCS	   v4l2_fourcc('M', 'T', 'f', 'c') /* Local contrast enhanced statistics */
> +#define V4L2_META_FMT_MTISP_LMV	   v4l2_fourcc('M', 'T', 'f', 'm') /* Local motion vector histogram */

The documentation for these meta formats either needs to point to
freely available mediatek documentation (i.e. no NDA needed), or it
has to be documented in a header or in the pixelformat documentation.

Regards,

	Hans
