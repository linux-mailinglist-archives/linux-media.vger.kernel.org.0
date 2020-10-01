Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B032F280061
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 15:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732229AbgJANow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 09:44:52 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50081 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732020AbgJANow (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 09:44:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Nyt4ko7ba4gEjNyt7kpqIN; Thu, 01 Oct 2020 15:44:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601559889; bh=/2md+tOc4iU6VmP/EUZ7iASBcQZZ99VyMH4tXE5O6Z0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KlDSnejmrRbVR5Hj/p5Iplcr+il0BVIFFbURL/grDSbHcht8+I+sYyKUsuXKh0836
         Mzz6pAv2XXztzYOxO1W5IBd2eYFcGk5jJKLngqeAdjgKWbVjXze5cgW/N1pGfREUHC
         R4mlCXLLmJBxhlQP+l7t8nGxch9R4MJUc8NwWGJzmauyFgxNL0oqhZCuSpC9FQB7Xo
         Fml3ihjp50PzS9Qph6naPI66O2CbwmfhfB29YiGyL8C7HAyOF1HPtx6MJKZeB0t5Eb
         RT+IDavHQqeIsDVgq1juKYTIZGfUw9kgiXau62ldv8AQgDYLhkhp2MdneP+1y4KT/4
         l+/nSL4uZV0EA==
Subject: Re: [PATCH/RFC 13/16] media: v4l2: Add 10-, 12- and 16-bpc BGR
 formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
 <20200923024333.920-14-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8ebbcde2-9c3c-9b65-c7dd-60e0fc973ee9@xs4all.nl>
Date:   Thu, 1 Oct 2020 15:44:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923024333.920-14-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPhAFgNX2mnQWrVcuAtKb8GRoHAvWJUkCs9IQdgdwZttCIVJccSSDzkBymTr0uLNssNcJFMIKPi/dITanaTZv70jnVbzm2dTzKxSo93NY19PQ0olu1nr
 cE51IGD5syzQkPtFxOky4+TlGc9ErFvfFLoBW+EKfAH6hOnoYqjuZzvBS+qysMWPli/ZVK4usWRdyvqqbeG2sRNNk6z95KNhRt3akMtc420PUcSyqtOYW5FK
 MO+iLI9vr1dhSij68s4W1+c3El8q6BFzBXgypHrAXoL8qX7vHZKFF3wybAcJ3yO+Xp78Dngl3Xi4ErGwmCTkw4itI3qXdWunlRC1S6nGRkw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/09/2020 04:43, Laurent Pinchart wrote:
> Add three new pixel formats that store RGB data in BGR order with 10, 12
> and 16 bits per component. They are used by the Xilinx Video Frame
> Buffer Read/Write IP cores.
> 
> The nomenclature for these new formats follows the 8- and 16-bpp RGB
> formats and the DRM format naming conventions, which differs from the
> 24- and 32-bpp RGB formats in V4L2.
> 
> As the number of bits per pixel grows quite large, a table with one
> column per bit would be difficult to read. These formats are thus
> described with one column per byte.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 68 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  5 ++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index 32bfd68af425..2e81d448177e 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -1087,6 +1087,74 @@ order of components as seen in a 24- or 32-bit little endian word.
>      \endgroup
>  
>  
> +More Than 8 Bits Per Component
> +==============================
> +
> +These formats store an RGB triplet in four bytes or more. Similarly to the 8-
> +and 16-bpp formats, they are named based on the order of the RGB components as
> +seen in a word, which is then stored in memory in little endian byte order, and
> +on the number of bits for each component.
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|
> +
> +
> +.. flat-table:: RGB Formats With More Than 8 Bits Per Component
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Byte 0 in memory
> +      - Byte 1
> +      - Byte 2
> +      - Byte 3
> +      - Byte 4
> +      - Byte 5
> +    * .. _V4L2-PIX-FMT-XBGR2101010:
> +
> +      - ``V4L2_PIX_FMT_XBGR2101010``

How about naming this: 'X2B10G10R10'. That makes it easier to understand the
number of bits assigned to each pixel component.

An alternative (but more verbose) would be: XBGR_2_10_10_10.

> +      - 'XB30'
> +
> +      - R\ :sub:`7-0`
> +      - G\ :sub:`5-0` R\ :sub:`9-8`
> +      - B\ :sub:`3-0` G\ :sub:`9-6`
> +      - `-`\ :sub:`1-0` B\ :sub:`9-4`
> +
> +      -
> +    * .. _V4L2-PIX-FMT-XBGR4121212:
> +
> +      - ``V4L2_PIX_FMT_XBGR4121212``

X4B12G12R12

> +      - 'XB36'
> +
> +      - R\ :sub:`7-0`
> +      - G\ :sub:`3-0` R\ :sub:`11-8`
> +      - G\ :sub:`11-4`
> +      - B\ :sub:`7-0`
> +      - `-`\ :sub:`3-0` B\ :sub:`11-8`
> +
> +      -
> +    * .. _V4L2-PIX-FMT-BGR161616:
> +
> +      - ``V4L2_PIX_FMT_BGR161616``

B16G16R16

Regards,

	Hans

> +      - 'XB48'
> +
> +      - R\ :sub:`7-0`
> +      - R\ :sub:`15-8`
> +      - G\ :sub:`7-0`
> +      - G\ :sub:`15-8`
> +      - B\ :sub:`7-0`
> +      - B\ :sub:`15-8`
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +
>  Deprecated RGB Formats
>  ======================
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3f5f1cf8d1c0..9181e44c20db 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -561,6 +561,11 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
>  #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
>  
> +/* RGB formats (more than 8 bits per component) */
> +#define V4L2_PIX_FMT_XBGR2101010 v4l2_fourcc('X', 'B', '3', '0') /* 32  XBGR-2-10-10-10 */
> +#define V4L2_PIX_FMT_XBGR4121212 v4l2_fourcc('X', 'B', '3', '6') /* 40  XBGR-4-12-12-12 */
> +#define V4L2_PIX_FMT_BGR161616 v4l2_fourcc('X', 'B', '4', '8') /* 48  BGR-16-16-16 */
> +
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
>  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
> 

