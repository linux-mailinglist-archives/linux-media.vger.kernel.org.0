Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13D040C350
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 12:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbhIOKJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 06:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237307AbhIOKI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 06:08:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BB5C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 03:07:36 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QRpFmN6z3cSrkQRpHmyhpG; Wed, 15 Sep 2021 12:07:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631700455; bh=IDxdxpiO0camlOai2pLQ339IjuNb7m1n1gZWpiNrBvE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=b4iYBQ49kaQGmLt5fFCcR+VoESDEjbOywrnSWS4DnGk5qIgD8oaH0bxCruCGGKfe0
         +Owv9I5gM1T66jru3i3W9O/QUMELHoCfQP//qsQ5NlzDSKkSlzwnOCWSDSxdumjcwS
         bUWoq14sBNi0gX7kS3ROwxF9hdisDXjXUhN9zkfR4wOWRmb+bJgWRbLisx/Py4ygS1
         uhIuiadGTJwcpeVy1Ako9DoX6BGGO9kdCZ0NyUTEyAMu7lpXpzb6Z9dQBxJMaiF0ie
         Ny2c7+BMqe4ZbrXbAtemWQqO9Tdzvpp0yILo7RW4/QZ6w1hQM2a4A26oaOwFMdyeRY
         jLPy6CdnT8bDA==
Subject: Re: [PATCH 04/11] edid-decode: add bounds checking
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-5-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a9d1ac98-cbfb-0541-a726-ca66b666434b@xs4all.nl>
Date:   Wed, 15 Sep 2021 12:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914121129.51451-5-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBiJ0ePeuQd0dFGQ/MVk9uPkmBQE7dmukpDSWrbIWGYk1bNpd7r0rPLy2AzBmfNdgTZMfawc5OkGhuBjwIEH0qz+FVlrT4C9iMTHNPa/U1t3s0nWdddO
 su0c7kjWAO+R/UiWzojelLTxXs6UuTuSa0Cy+wLlSV+cWvwDtRF5I1CqCu4sAmhcE3Y8RfUYEZEmqyUQNs3mNPwJ2mju52zd1Sp/FOoGdholzxM3Jo/uLxkp
 /bI0as5M/PdbP8PHrsSzSy9+JC34JYzn3pG3Nsp0dCFLP42TGYnR645U3V7XcbbGXni1VFDM5/117/tZWXzuCw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2021 14:11, joevt wrote:

Please always add a commit log here, even if it is just a copy of the subject.

No need to do anything, I'll take care of it this time.

Regards,

	Hans

> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  parse-vtb-ext-block.cpp | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/parse-vtb-ext-block.cpp b/parse-vtb-ext-block.cpp
> index 05d54f4..edfe887 100644
> --- a/parse-vtb-ext-block.cpp
> +++ b/parse-vtb-ext-block.cpp
> @@ -17,16 +17,21 @@ void edid_state::parse_vtb_ext_block(const unsigned char *x)
>  	unsigned num_cvt = x[3];
>  	unsigned num_st = x[4];
>  
> +	const unsigned char *y = x + 0x7f;
>  	x += 5;
>  	if (num_dtd) {
>  		printf("  Detailed Timing Descriptors:\n");
> -		for (unsigned i = 0; i < num_dtd; i++, x += 18)
> +		for (unsigned i = 0; i < num_dtd; i++, x += 18) {
> +			if (x + 18 > y) { fail("Not enough bytes remain for more DTBs in the VTB-EXT\n"); return; }
>  			detailed_timings("    ", x, false);
> +		}
>  	}
>  	if (num_cvt) {
>  		printf("  Coordinated Video Timings:\n");
> -		for (unsigned i = 0; i < num_cvt; i++, x += 3)
> +		for (unsigned i = 0; i < num_cvt; i++, x += 3) {
> +			if (x + 3 > y) { fail("Not enough bytes remain for more CVTs in the VTB-EXT\n"); return; }
>  			detailed_cvt_descriptor("    ", x, false);
> +		}
>  	}
>  	if (num_st) {
>  		// Note: the VTB-EXT standard has a mistake in the example EDID
> @@ -36,7 +41,9 @@ void edid_state::parse_vtb_ext_block(const unsigned char *x)
>  		//
>  		// The documentation itself is correct, though.
>  		printf("  Standard Timings:\n");
> -		for (unsigned i = 0; i < num_st; i++, x += 2)
> +		for (unsigned i = 0; i < num_st; i++, x += 2) {
> +			if (x + 2 > y) { fail("Not enough bytes remain for more STs in the VTB-EXT\n"); return; }
>  			print_standard_timing("    ", x[0], x[1], true);
> +		}
>  	}
>  }
> 

