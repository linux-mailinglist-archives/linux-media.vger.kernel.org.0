Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2E240C362
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 12:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhIOKMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 06:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbhIOKMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 06:12:18 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1678CC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 03:10:59 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QRsXmN8LBcSrkQRsYmyiQv; Wed, 15 Sep 2021 12:10:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631700658; bh=EXtb436XOJ7nTfVVB8U2F3dmgxs+U5FgUHZNhUwgX9M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iTIZ8FEZ0nGzqDSUiuQFH/tKOVTEz4EtyQPU8Yeggg+Lpm4S2oe2DpbconYCrHaz9
         vC49Tt9BNj5as6pWpM3iu1EieSSx8AXOP04BrPxTORHRElz7yLdUbF0WWyOfknjwOw
         0tNLZp/UFIhSfcPXP0zRtkvDZZFDFQVq3XGOSn4gBhbYA3P+yHymfC9j1Y+XoJ2wLq
         DrL/iOp/rsicb0zwiI8iRRZH1uV0JuMaOrNLKb2bdJPYPYwF0Kvx8LSByZYFlOdWKn
         qt66nW04fABGatnw3I68sh0djVEgR9pWFuF2SywUNnC2mHyjoUG69mHCnvq7TBGIOc
         G6gV9NB4+BE4Q==
Subject: Re: [PATCH 07/11] edid-decode: always linefeed after hex_block
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-8-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2025be72-7f3e-b63d-51c4-33a9720f65fe@xs4all.nl>
Date:   Wed, 15 Sep 2021 12:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914121129.51451-8-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPtk8m6TyLh+mNOc8G9K8HjzLvldWWS/ilrh8yoSK9f1QskGcwSbwvlI0YkJTmmjpRowqLnakYSaM9PV1bi3zH3eZulabi1BScsT7P2wJ27OQGyNLtmw
 LdzJe0PvUm4WRUKW5KZwwNBpOnVKSwxG32VikHpIwG4jW4dSME3dzfv/GX531UdXfPCA9PtHy6GncznanNAQaM7iUGUWcp0b85v8ze48OYYD4EV4D3yNWn2w
 NOnJ4LNq18bV/qBsJd/oKCFzyUApoejj8zQB7Aeo0cc5j/tuzwpuYfJrZzqD+zcY0VIsUwEIvqvu2H3wTDHNhg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2021 14:11, joevt wrote:
> hex_block should not return without printing a newline (which occurs when the length is zero). This causes a missing newline after "Application Version: 1" with cta_hdr10plus for an EDID I have.
> Any place that calls hex_block will have the same problem if it's possible for the length to be zero.
> 
> In other words, a hex_block needs to have a linefeed even if it has zero length, because the caller assumes it will go to the next line as it does when the hex block is not zero length.
> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  edid-decode.cpp | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/edid-decode.cpp b/edid-decode.cpp
> index 2316abc..6aa93fb 100644
> --- a/edid-decode.cpp
> +++ b/edid-decode.cpp
> @@ -698,8 +698,10 @@ void hex_block(const char *prefix, const unsigned char *x,
>  {
>  	unsigned i, j;
>  
> -	if (!length)
> +	if (!length) {
> +		printf("\n");
>  		return;
> +	}

Hmm, with this change I get this:

edid-decode -c Digital/Acer/ACR0282/B12D637C1F12 with the linuxhw database:

  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
    Source physical address: 2.0.0.0
  Unknown CTA-861 tag 0x00, length 0

  Unknown CTA-861 tag 0x00, length 0

  Unknown CTA-861 tag 0x00, length 0

  Unknown CTA-861 tag 0x00, length 0

  Unknown CTA-861 tag 0x00, length 0

  Unknown CTA-861 tag 0x00, length 0

  Unknown CTA-861 tag 0x00, length 0

That looks pretty ugly.

Regards,

	Hans

>  
>  	for (i = 0; i < length; i += step) {
>  		unsigned len = min(step, length - i);
> 

