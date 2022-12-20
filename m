Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F3465226B
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 15:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiLTOYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 09:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiLTOYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 09:24:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299C829F;
        Tue, 20 Dec 2022 06:24:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7FF24F8;
        Tue, 20 Dec 2022 15:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671546270;
        bh=GwpbOzzbp72L2smekY/5o6NMVnF/kbKkVtDyzLmIkuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cmV9QUVEVA1tzQMP1jziwiuG5KTsC09bUsfqVAEpAStg6TafntRdqV2FH1IqtpDzr
         BfmG4s+iuRdNU6rx+sMzbfFJGw4fxDPJBqIrJKPs3o3b9hPwZI5ndkioCC9fcs01QT
         iBUumabashSi0Wiu2ptViwsi6EFJJxMecMi/8hh4=
Date:   Tue, 20 Dec 2022 16:24:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/7] media: Add 2-10-10-10 RGB formats
Message-ID: <Y6HFmVXL/A/gazTn@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-2-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6C3PtnjAdv/seMy@pendragon.ideasonboard.com>
 <cfbb8f85-2bf9-4623-96bd-c05390a57a10@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cfbb8f85-2bf9-4623-96bd-c05390a57a10@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Dec 20, 2022 at 04:12:29PM +0200, Tomi Valkeinen wrote:
> On 19/12/2022 21:10, Laurent Pinchart wrote:
> > On Mon, Dec 19, 2022 at 04:01:33PM +0200, Tomi Valkeinen wrote:
> >> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
> >>   drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
> >>   include/uapi/linux/videodev2.h                |   3 +
> >>   3 files changed, 200 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> >> index 30f51cd33f99..de78cd2dcd73 100644
> >> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> >> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> >> @@ -763,6 +763,200 @@ nomenclature that instead use the order of components as seen in a 24- or
> >>       \normalsize
> >>   
> >>   
> >> +10 Bits Per Component
> >> +=====================
> >> +
> >> +These formats store a 30-bit RGB triplet with an optional 2 bit alpha in four
> >> +bytes. They are named based on the order of the RGB components as seen in a
> >> +32-bit word, which is then stored in memory in little endian byte order
> >> +(unless otherwise noted by the presence of bit 31 in the 4CC value), and on the
> >> +number of bits for each component.
> >> +
> >> +.. raw:: latex
> >> +
> >> +    \begingroup
> >> +    \tiny
> >> +    \setlength{\tabcolsep}{2pt}
> >> +
> >> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> >> +
> >> +
> >> +.. flat-table:: RGB Formats 10 Bits Per Color Component
> >> +    :header-rows:  2
> >> +    :stub-columns: 0
> >> +
> >> +    * - Identifier
> >> +      - Code
> >> +      - :cspan:`7` Byte 0 in memory
> >> +      - :cspan:`7` Byte 1
> >> +      - :cspan:`7` Byte 2
> >> +      - :cspan:`7` Byte 3
> >> +    * -
> >> +      -
> >> +      - 7
> >> +      - 6
> >> +      - 5
> >> +      - 4
> >> +      - 3
> >> +      - 2
> >> +      - 1
> >> +      - 0
> >> +
> >> +      - 7
> >> +      - 6
> >> +      - 5
> >> +      - 4
> >> +      - 3
> >> +      - 2
> >> +      - 1
> >> +      - 0
> >> +
> >> +      - 7
> >> +      - 6
> >> +      - 5
> >> +      - 4
> >> +      - 3
> >> +      - 2
> >> +      - 1
> >> +      - 0
> >> +
> >> +      - 7
> >> +      - 6
> >> +      - 5
> >> +      - 4
> >> +      - 3
> >> +      - 2
> >> +      - 1
> >> +      - 0
> >> +    * .. _V4L2-PIX-FMT-XBGR2101010:
> >> +
> >> +      - ``V4L2_PIX_FMT_XBGR2101010``
> >> +      - 'RX30'
> >> +
> >> +      - b\ :sub:`5`
> >> +      - b\ :sub:`4`
> >> +      - b\ :sub:`3`
> >> +      - b\ :sub:`2`
> >> +      - b\ :sub:`1`
> >> +      - b\ :sub:`0`
> >> +      - x
> >> +      - x
> >> +
> >> +      - g\ :sub:`3`
> >> +      - g\ :sub:`2`
> >> +      - g\ :sub:`1`
> >> +      - g\ :sub:`0`
> >> +      - b\ :sub:`9`
> >> +      - b\ :sub:`8`
> >> +      - b\ :sub:`7`
> >> +      - b\ :sub:`6`
> >> +
> >> +      - r\ :sub:`1`
> >> +      - r\ :sub:`0`
> >> +      - g\ :sub:`9`
> >> +      - g\ :sub:`8`
> >> +      - g\ :sub:`7`
> >> +      - g\ :sub:`6`
> >> +      - g\ :sub:`5`
> >> +      - g\ :sub:`4`
> >> +
> >> +      - r\ :sub:`9`
> >> +      - r\ :sub:`8`
> >> +      - r\ :sub:`7`
> >> +      - r\ :sub:`6`
> >> +      - r\ :sub:`5`
> >> +      - r\ :sub:`4`
> >> +      - r\ :sub:`3`
> >> +      - r\ :sub:`2`
> >> +      -
> > 
> > This doesn't match the text above. This would be RGBX2101010. I'm not
> > sure which format you want, so I don't know if it's the documentation or
> > the format name that is incorrect. The next two formats also seem
> > incorrect to me.
> 
> Right, the text should say big endian instead of little endian.

No, in big-endian format, you would have, for instance,
V4L2_PIX_FMT_XBGR2101010 defined as

	[x, x, B[9:4]], [B[3:0], G[9:6]], [G[5:0], R[1:0]], [R[7:0]]

in memory byte order, while the format you want to define is

	[B[5:0], x, x], [G[3:0], B[9:6]], [R[1:0], G[9:4]], [R[9:2]]

The issue here is that 10-bpp formats don't have an integer number of
bytes per component. They are thus more similar to the 16-bit RGB
formats, where the macro named defined the order in a 16-bit word, which
was then stored in little-endian format in memory. For 24-bit and 32-bit
formats, we departed from that rule by using the byte memory order in
the macro name. For 10-bpp RGB formats we can't do so anymore. The most
sensible option is thus, I think, to use the same naming scheme as the
16-bit RGB formats, which incidentaly matches the DRM naming scheme.

-- 
Regards,

Laurent Pinchart
