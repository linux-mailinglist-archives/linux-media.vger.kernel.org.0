Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDC445DC65
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 15:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355473AbhKYOg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 09:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354059AbhKYOeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 09:34:25 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFAEC061746;
        Thu, 25 Nov 2021 06:31:13 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qFmBm7ibv1HGJqFmEm3TVx; Thu, 25 Nov 2021 15:31:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637850670; bh=5ffXjwSsgloEyYJYtbhQ1bly4l8zPhxtOR5nkQkghBU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QrnlUbg/aM0ItYUu7Y4/3AMOfF/2S2cXvqp/Qr0pQeXbZ5okGhAUxAe4xzeJXTOLb
         1RzzV7pIm5UZX52LNehKHv0ZUllCD3F5x1sJ9OlRfJf+PXIf3l5dkWDMulj45ugCay
         8EVnKoCsWG9OUG2jUjzuCPAzhUlpQ+VCt+ZLZZDN0v59qpiC0cvXhUbHl1e67Lt/+T
         X1u1cDG9bJo3BJ3WdaNrN8KxcUh5hb2PKAVWbcvB4/R1OIzfhPiEh71/R3Jzx3mzm5
         f5sUocwDrC5pK5yxoCYeX05FDYhnVMVQk1Td3lroT46Mw3G6Q4Le933pSvt5vI6KTe
         EmCQcfzb7zk/g==
Subject: Re: [PATCH v5 00/10] add aspeed-jpeg support for aspeed-video
To:     Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
        mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5ab806d1-e407-1fa4-83ec-93ebe8df7db4@xs4all.nl>
Date:   Thu, 25 Nov 2021 15:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118074030.685-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBbn5NtcItpB76d/vKbIDQQTS7WrC5ft3pABh57+v3X2vWF6jiE3Jzv4a9USchcpi7T9YBLVD9QH4Q82hsMO6zSRIDTcW+y+5+ymXjLKqknQdQ5TJUZw
 OrBN1ft8D4sbCwzUu6UhRgkvG6r6ROEJjN8APAvkVY9SaG1WgUKSAXv3JRjyr9UPU4OjTyYq/yqwNBvIovMOx0QKoyqFCZnAXRphz3H4M+wLAb6AfAeAAtKj
 gP+Evel4EdVullN9V6d3yiLYLkTqi1QhAvAUYvhgJtcqNeZW9UzwZlwaHOut4tH5xMdNnqXc5VfGjRAn+4OU4El2FwjsnulrsJvvgmSMjBFfr2+/SkUOPkWV
 Nl9V/xERC84hOmfLQ40UT3SPxTAYxpIOqD+71F3y7iX44T5mYGHnAdYSYkk77dBKYNCQElH6wGM4Si7q+zi5t5nhoiEjNHEdTTXs+YWEsBIgdlvFSeTS0oAZ
 hW0GPsHJI7NP/P/JaZISRIJuISaBUJC37NxlnkSNF+dDzORem6lw7GgoRnfXXwSjPjsNQKK0bcB8BAc38TN4mWHVkNmWqlpvuI9V2SEV/4ofkC9cPuEfDsI7
 oENNm+wxNwIWUhkYpiyDMAGg5LhZUhbxStnMrC81U4ZkJAD128K/cKfJf29/4fB7t++GmNMCSbglgoi59oja8rWO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jammy,

I suggest posting a v3 that moves the patches that deal with the
Aspeed JPEG format to the end of the series. That way I can easily
merge the patches up to that point, and the Aspeed JPEG support can
be handled separately.

I'm not sure if it can be merged without that format being documented,
either in pixfmt-reserved.rst, by implementing support for it in
libv4lconvert from v4l-utils, or by providing a URL to some other
publicly available source code. We really don't like adding pixel
formats that cannot be interpreted by someone without access to the
datasheets.

Regards,

	Hans

On 18/11/2021 08:40, Jammy Huang wrote:
> The aim of this series is to add aspeed-jpeg support for aspeed-video
> driver.
> 
> To achieve this major goal some refactors are included.
> 
> In the last, debugfs information is also updated per this change.
> 
> Changes in v5:
>  - Use model data to tell different soc
> 
> Changes in v4:
>  - Add definition for the Aspeed JPEG format
>  - Reserve controls for ASPEED
>  - Use s_fmt to update format rather than new control
>  - Update aspeed hq quality range, 1 ~ 12
> 
> 
> Jammy Huang (10):
>   media: aspeed: move err-handling together to the bottom
>   media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
>   media: aspeed: add more debug log messages
>   media: aspeed: refactor to gather format/compress settings
>   media: v4l: Add definition for the Aspeed JPEG format
>   media: v4l2-ctrls: Reserve controls for ASPEED
>   media: aspeed: use model-data
>   media: aspeed: Support aspeed mode to reduce compressed data
>   media: aspeed: add comments and macro
>   media: aspeed: Extend debug message
> 
>  .../media/uapi/v4l/pixfmt-reserved.rst        |  12 +
>  drivers/media/platform/aspeed-video.c         | 534 ++++++++++++++----
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/uapi/linux/aspeed-video.h             |  15 +
>  include/uapi/linux/v4l2-controls.h            |   5 +
>  include/uapi/linux/videodev2.h                |   1 +
>  6 files changed, 467 insertions(+), 101 deletions(-)
>  create mode 100644 include/uapi/linux/aspeed-video.h
> 

