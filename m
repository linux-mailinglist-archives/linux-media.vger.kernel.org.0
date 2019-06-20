Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E274C9BC
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 10:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfFTIty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 04:49:54 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42387 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725966AbfFTIty (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 04:49:54 -0400
Received: from [IPv6:2001:983:e9a7:1:bdf4:9145:f694:e7a2] ([IPv6:2001:983:e9a7:1:bdf4:9145:f694:e7a2])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dslPhWOCzSfvXdslRhtY28; Thu, 20 Jun 2019 10:49:52 +0200
Subject: Re: [PATCH v2 0/3] Add support of RGB565, YUV and JPEG to MIPID02
 bridge
To:     Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
References: <1560779038-26012-1-git-send-email-hugues.fruchet@st.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <56ef5a64-5935-aa51-529f-262cca9ec74d@xs4all.nl>
Date:   Thu, 20 Jun 2019 10:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560779038-26012-1-git-send-email-hugues.fruchet@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE2b1i2YAixRRYXB6rVbGo40kNkfrHlyv3JVShV/F6bNjimfsoBG6fudKtrQjvHfh2jndwuCyRD85nrUT/wGdXLMgMfJC0lqFFKkgO/xgnMLmCGhTu0u
 owCOhcKpH0d6jFZEIbVsrxcVsthyu/tlayCGHQv3u3Bc2JzNuzRuUq8sc5boZkmRnpzg3DLpkKapMbhH5viD9A+jkx/yyxx5IkLGh5okfHE3gjnVQspRVuY6
 twAaKqdj3OBrYmBBynmn8zcxvnINiFBYs/d4LO5WBrOMFPNQyRkQRy7xN8D8hmxpTK5wC9BqE9NaVwJJpGXfT8yz9j0d5g5OMg946ydI2wPgdY8zsqicH9q4
 ldMy1j7/tPKo4oKSeZq58ByhpPJIBRRAc1YOGiSmo0VaK/FpnTUIZLG0sJdpRC+TvnbSKNQcqGf7nemWg0sGixW814u+NTO9lCPBmHQ8d6FR6aJZszTVzU3V
 6NDcyCi2Uo2qiocVIJTy5gEyCxP6iIsyv3ozUw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/17/19 3:43 PM, Hugues Fruchet wrote:
> Add support of RGB565, YUV and JPEG to MIPID02 bridge.
> 
> ===========
> = history =
> ===========
> version 2:
>   - Link frequency could not be computed from pixel rate for JPEG,
>     remove JPEG case in bpp_from_code().
> 
> version 1:
>   - Initial submission
> 
> Hugues Fruchet (3):
>   media: st-mipid02: add support of RGB565
>   media: st-mipid02: add support of YUYV8 and UYVY8
>   media: st-mipid02: add support of JPEG
> 
>  drivers/media/i2c/st-mipid02.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 


For this series:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
