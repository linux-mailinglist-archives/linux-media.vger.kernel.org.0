Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905801E1F97
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 12:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbgEZK0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 06:26:19 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33949 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726944AbgEZK0S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 06:26:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dWmjjUHD0DazBdWmmjeSew; Tue, 26 May 2020 12:26:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590488776; bh=Lb1EWycd+e81Ho85rGu8tUZtVF2nD7CDHjGHm4mPTCc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IdV4/4W8LuCQchlm16NBcpezXaXLkAnVNT0fZIk11/ggFtn6v2R1Kqyyqh/1gsODZ
         PEry8z4YxtjSmBQyK+i+3IVjzzE8TrUo6StJoMG2GNyyYHVSI3k3ZiHCvAcuOCkR6A
         +upDeBrA4/5APav/2kbbyxjfw9ATBiSJsje3evhQYkDlYUcjCmy74aUMLpUkBnCsdc
         KffqXCQLY3LyL26sDMWELZE6gXZAjN/XTwojkRJv1a2fS5P1ueo+YPthbNMsntRvaK
         uo8RCz2VTUc7rFG3dnFGAuLTKhkLn5vIUFKmY8EoG8dZ/Zgbct2jLM7oQ3moMvs4zz
         0M/eohDZkfTag==
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
Date:   Tue, 26 May 2020 12:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDr/cZt7s0VGIioXzlyhqC2JuFlBk8MziJ7wMeBeGANBHz5mggNxj70qjrbk4xUvbSydUCrC513KgA98fdEpgwkSEPl6EuItTFwlxQT4XcI/v6PG5hgJ
 V6KjMs6dnnXtqJUZ4w7BhKKT1Sf3mA3MjS1NI8vDDeEei2p7nE63fe+dXDfcMoaM6IahiAJHjWPW1IUKANdCWEzxru5M/J2cZCGz6yZa0K7DX0Hc9I/PcAR+
 hUUkS0EZp08VGh0yKKbx21jqbH4W3knx7JiRk6+eyDWm1MdQuftt09UwE5CRdXwPW2+k+1iV6refo3hgHoPveA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/04/2020 13:38, Stanimir Varbanov wrote:
> Here we add two more reasons for dynamic-resolution-change state
> (I think the name is misleading espesially "resolution" word, maybe

espesially -> especially

> dynamic-bitstream-change is better to describe).
> 
> The first one which could change in the middle of the stream is the
> bit-depth. For worst example the stream is 8bit at the begging but
> later in the bitstream it changes to 10bit. That change should be
> propagated to the client so that it can take appropriate  action. In
> this case most probably it has to stop the streaming on the capture
> queue and re-negotiate the pixel format and start the streaming
> again.
> 
> The second new reason is colorspace change. I'm not sure what action
> client should take but at least it should be notified for such change.
> One possible action is to notify the display entity that the colorspace
> and its parameters (y'cbcr encoding and so on) has been changed.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index 606b54947e10..bf10eda6125c 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -906,7 +906,11 @@ reflected by corresponding queries):
>  
>  * visible resolution (selection rectangles),
>  
> -* the minimum number of buffers needed for decoding.
> +* the minimum number of buffers needed for decoding,
> +
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace (and its properties) has been changed.

For this I want to have a new source change flag:

V4L2_EVENT_SRC_CH_COLORIMETRY

Changing colorimetry without changing resolution/bit depth does not
require buffers to be re-allocated, it just changes how the pixel
data is interpreted w.r.t. color. And that is important to know.

Regards,

	Hans

>  
>  Whenever that happens, the decoder must proceed as follows:
>  
> 

