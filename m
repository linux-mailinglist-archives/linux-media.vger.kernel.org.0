Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C479ED5E8C
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 11:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbfJNJTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 05:19:44 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47445 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730585AbfJNJTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 05:19:44 -0400
Received: from [IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d] ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JwVxiFoZtop0AJwVyidOPF; Mon, 14 Oct 2019 11:19:42 +0200
Subject: Re: [PATCH 3/8] cec-follower: create digital ARIB channels
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
 <20191014041721.52025-4-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e27c1e7d-fc56-d4a7-68bb-fd000b33b160@xs4all.nl>
Date:   Mon, 14 Oct 2019 11:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014041721.52025-4-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKN5oFCo5EVOHvoe+HbLJIs9kpMaRTSdoD3zmwZnpmgtmfCFqwNCHkzqH4fbU0xkI31QilSKhuoiI7XIpuWwf8Rpd8A4D2mWQyjQUtStcmYxlJfCExvl
 oiJNazZX2eKWiSiHPmZpPasBsYNHdRrqmrlAys6hBUDKMVXHSiEIBQtfStdfeVVA3gu0VYzkQCAQ5edPIAB7Jw0JNu7lSGzyEuNIO/gK44uOguXibEdE2aXM
 1dDW5U3M0/jjXyJxxQPmN6GyBuflQ6PXuguACTHpi/H3k5ig5g2NsL6L58F4lSckIfo/SV/9QSjQecc9NhE+aUF4h5x8+l0h/d4uQN4k5W0DG9DHRpfjuS3F
 MIDvDfBtbBubn5WWgLHbxNJXvwkbmQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/14/19 6:17 AM, Jiunn Chang wrote:
> This table will allow proper testing of digital tuner control features.
> There are three channels per TSID/ONID/SID combination along with channel
> data for the following digital ARIB broadcast systems:
>   - ARIB-BS
>   - ARIB-T
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-follower/cec-tuner.cpp | 52 ++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 3a71a890..4fd65876 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -9,8 +9,60 @@
>  #include "cec-follower.h"
>  
>  #define NUM_ANALOG_FREQS 3
> +#define NUM_DIGITAL_CHANS 3
>  #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
>  
> +struct service_info {
> +	unsigned tsid;
> +	unsigned onid;
> +	unsigned sid;
> +	unsigned fmt;
> +	unsigned major;
> +	unsigned minor;
> +};
> +
> +/*
> + * This table contains the digital television channels for ARIB (ISDB).  There
> + * are a total of three channels that are identified by digital IDs or by
> + * channel.
> + *
> + * CEC 17 of the 1.4 specification lists the available digital identification
> + * methods, IDs, and channel data.
> + *
> + * Digital channel data for ARIB-BS is from:
> + *
> + * https://sichbopvr.com/frequency-tables/19-20E
> + *
> + * No public data was found for ARIB-BS so data is just copied.
> + *
> + * Digital channel data for ARIB-T is from:
> + *
> + * https://sichbopvr.com/frequency-tables/Brazil/Rio%20de%20Janeiro/Rio%20De%20Janeiro
> + */
> +static const struct service_info digital_arib_data[2][1][NUM_DIGITAL_CHANS] =

Just drop the [1] here and in the next two patches. For all bcast systems you just
have one satellite and one terrestrial system, since we decided not to have two
satellite bcast systems.

So we can just cut out the [1] bit since it doesn't really make sense anymore.

Regards,

	Hans

> +{
> +	// satellite
> +	{
> +		// arib-bs
> +		{
> +			// tsid, onid, sid, fmt, major, minor
> +			{ 1032, 1, 30203, 1, 0, 30203 },
> +			{ 1046, 1, 30505, 1, 0, 30505 },
> +			{ 1060, 1, 30609, 1, 0, 30609 }
> +		}
> +	},
> +	// terrestrial
> +	{
> +		// arib-t
> +		{
> +			// tsid, onid, sid, fmt, major, minor
> +			{ 1519, 1519, 48608, 1, 0, 48608 },
> +			{ 1624, 1624, 51992, 1, 0, 51992 },
> +			{ 1905, 1905, 60960, 1, 0, 60960 }
> +		}
> +	}
> +};
> +
>  /*
>   * This table contains analog television channel frequencies in KHz.  There are
>   * a total of three frequencies per analog broadcast type and broadcast system.
> 

