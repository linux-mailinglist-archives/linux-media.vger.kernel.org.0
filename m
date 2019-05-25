Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96EE2A403
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 13:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfEYLga (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 07:36:30 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38613 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726484AbfEYLga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 07:36:30 -0400
Received: from [IPv6:2001:983:e9a7:1:6081:f7d7:b93c:24af] ([IPv6:2001:983:e9a7:1:6081:f7d7:b93c:24af])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UUyQhPCuZsDWyUUyRhUFdc; Sat, 25 May 2019 13:36:28 +0200
Subject: Re: [PATCH v5 3/4] media: pixfmt: Document the HEVC slice pixel
 format
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20190524093635.1832-1-paul.kocialkowski@bootlin.com>
 <20190524093635.1832-4-paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <de925df1-e15e-6293-31b5-b046060e7359@xs4all.nl>
Date:   Sat, 25 May 2019 13:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524093635.1832-4-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL5ASQGLGKFdBxYetB5w++UJszYGQx9k/wzBFOSR0d1qvZS8Dyyn9JMjmSBnoMDWOPuEkfLPS+B9eJV4AXBrcbrQ8rKdPJD3VlNeP9BgVFDQyJMtVG8e
 NdcszGQdoOq6xbmoeJI5TlASl41wxbKOXnlYhsbP7imNZSHMlmoliT3GGSQg9MzWbMpcNHsUyaQ9i4BlwJKaNq7A5nHlCpNlNvP+EXqSNioz3biSS669EmIg
 CtYfm/AclOe1UeaPKc3/aDioOvAjzrXYYdWKk6xGTSi/QxRiw3b+kjAfMHK802x7mHlUQH3IRoGiceW8C9fkka0e8XB3Ma2cNjQ2+6ocukUDEo/c48AFZx0u
 qLDrUPcgP3ZLXoowScD55gR3K030KQbKnBAxJWhc3Vopfu2x88JLMn/FrW6AQYJrt5k0pMP3cqOIQhdYV0dY9PmaRxzZx6yAw4HGW36FjkWW50Pfo0sVYybv
 D8JJTAVew5NVqf5xUUAy3H6sGsMIm77HSNtGfuUh3lpfilNUxThMdVtoyvSLRFFAZlRsr2c4/PH7hSVMNfvXlqZ0h2RwuqzlgFF9Ec60tjIlszGRFt7ejqWw
 tO/Epet1eDCs9mXuCXFJE/+Fe+sf9i6rppSys54pFSPgcB6Asf0h3cXyPxbH8gvcTtrZ/Iz9JA0p225QJ9ZAf3B55L1PJN+kgYctd3vQqVh1bmIwoeXY82NI
 +nvO2Ff5XT38voye3UdfMdjCdJJbSpJ9N2k0hRshCZvGxSSZGitczTX5aAAwIuepT3tzpFSLpsvMwU2M5P6SpGb/y0pstXOPYBdcS2pf31u50lmdGrj4OOgB
 /1B2HzykKbyzRQAvS1yk2tiAWjBddRcAskMJJ0Zqgc4aRyeEVB1XObgy53gyQQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/24/19 11:36 AM, Paul Kocialkowski wrote:
> Document the current state of the HEVC slice pixel format.
> The format will need to evolve in the future, which is why it is
> not part of the public API.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/uapi/v4l/pixfmt-compressed.rst      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> index 4b701fc7653e..9d4195723c3e 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> @@ -143,6 +143,27 @@ Compressed Formats
>        - ``V4L2_PIX_FMT_HEVC``
>        - 'HEVC'
>        - HEVC/H.265 video elementary stream.
> +    * .. _V4L2-PIX-FMT-HEVC-SLICE:
> +
> +      - ``V4L2_PIX_FMT_HEVC_SLICE``
> +      - 'S265'
> +      - HEVC parsed slice data, as extracted from the HEVC bitstream.
> +	This format is adapted for stateless video decoders that implement a
> +	HEVC pipeline (using the :ref:`codec` and :ref:`media-request-api`).

Should be :ref:`mem2mem`.

Regards,

	Hans

> +	Metadata associated with the frame to decode is required to be passed
> +	through the following controls :
> +        * ``V4L2_CID_MPEG_VIDEO_HEVC_SPS``
> +        * ``V4L2_CID_MPEG_VIDEO_HEVC_PPS``
> +        * ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS``
> +	See the :ref:`associated Codec Control IDs <v4l2-mpeg-hevc>`.
> +	Buffers associated with this pixel format must contain the appropriate
> +	number of macroblocks to decode a full corresponding frame.
> +
> +	.. note::
> +
> +	   This format is not yet part of the public kernel API and it
> +	   is expected to change.
> +
>      * .. _V4L2-PIX-FMT-FWHT:
>  
>        - ``V4L2_PIX_FMT_FWHT``
> 

