Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA72D419045
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 09:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhI0H5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 03:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233248AbhI0H5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 03:57:23 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F37C061570
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 00:55:45 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UlUAmvxwyMWY7UlUEmljH9; Mon, 27 Sep 2021 09:55:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632729342; bh=6t3jMwFzS626yQskgLmmT6/0WAM0vpJMKAiRCCvoN3o=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MZzzK6aPr9Jt5ZvnspoaeEAuzOrRz9ORfaHCG11GbPKH+lEiGUR2x9AC+3ptjkn8I
         v8mthWU3C2wV/015epiOZ9+7Q7x93u/lx3AYdyBv7h87LnIQJav5TcZ6icQQubxIcu
         lwrwZnxmsI6M3ty8z4ZXD5jvp4N907BJ7n89MGmV1iCeAPRnEJF5kT9KVNtGN8x5GU
         gTnfWC/PhvH+URVeETqGoYNRcaiDc2/i8EO9Eb+tObjRIRhy1EHBeowuyigg4+Em/M
         tHoPmUhWhWOtB9k3zsXUxzAil+ZObXHw9tYX4p2Gat+0K2lJXobCC7YfVDkqZiao0E
         jLe1yusAZ8Grw==
Subject: Re: [PATCH v2 05/29] edid-decode: Capitalize fail sentence
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210926083330.5206-1-joevt@shaw.ca>
 <20210926083330.5206-6-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <05de5435-bd9b-c366-81dd-2bdf0f3cb1ca@xs4all.nl>
Date:   Mon, 27 Sep 2021 09:55:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210926083330.5206-6-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNZ8QIYbdQtRJGxPyg1oFjdwviV81juE6uf5KQPugeFtyliIVyHDPduU7QYiiW2emEQUPKt9q9e4tyKY0ACbLJlfWpmL/uQaZgSDOqkYiKWD1HaSbZ5a
 5TXAI2SW/rhijDZ+kho4P3jMi91XiWrDLKqGK6t43LhH5EiUpyZ0TbyoA4oaq/XIznMhBqmtHXp0L9A8CXoA6EauI9EzFNW7VnC04eQpvOmNmMkVbcjTeuLZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/09/2021 10:33, joevt wrote:
> - Most fail messages are a sentence that starts with a capital letter and ends with a period.
> - Remove unnessary break from last switch case.

I dropped this change. It is good coding practice to always include a break for the last switch case.
If someone adds a new case later, then this avoids an accidental fall-through scenario.

No need to repost, I'll take care of this.

Regards,

	Hans

> - Remove extra line.
> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  parse-cta-block.cpp | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
> index 6607426..042b933 100644
> --- a/parse-cta-block.cpp
> +++ b/parse-cta-block.cpp
> @@ -2091,13 +2091,11 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
>  	case 0x79:
>  		if (duplicate)
>  			fail("Only one instance of this Data Block is allowed.\n");
> -		break;
>  	}
>  
> -
>  	// See Table 52 of CTA-861-G for a description of Byte 3
>  	if (audio_block && !(cta.byte3 & 0x40))
> -		fail("audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
> +		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
>  
>  	if (data_block.length())
>  		printf("  %s:\n", data_block.c_str());
> 

