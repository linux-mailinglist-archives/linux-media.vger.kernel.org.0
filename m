Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C45AE102669
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 15:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbfKSOSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 09:18:23 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57841 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728157AbfKSOSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 09:18:23 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X4KhiEFrTcs92X4Kiizsmh; Tue, 19 Nov 2019 15:18:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574173101; bh=4PrRmF0h/rtSJB8fgLw+SQ0mJio6GnAcxV/KLoXmgfE=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iDV5k33ZGeGe7d+bBR3kfxUDgmzjw7POSdtVx1aE65gHOGlNhUd74u/b8THx8tfBa
         vjBXsZ0kDvxp9kGzajFlpEvn1guHMfUTu73ZS3lxKkf48pRfh3uC7P52n1X2ngs580
         VB76pI6WxqK2WkB53KX+JWaIqnAl04vhr59w40ef3JwIJQtlB2Iqi4g7nCBjou6MV2
         HDUq7THptjy1GXjdoBoJg3r9mmFaPizLRPlIeIlwTqaZfYC1agrsIyIwPlHtqVWt7z
         Xowm7/29Jn5Hh2m1YrYx8uN2N96n9oifNZKYL6yVmJ8d6fyoLJGS19rmw0VfqbIiuv
         Seeg2gvEzdBhA==
Subject: Re: [ANN] Report of Media Summit: Codecs
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jan Schmidt <jan@centricular.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Matthew Waters <matthew@centricular.com>
References: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
Message-ID: <b0ddcd59-cd54-67b8-af63-e7749403f868@xs4all.nl>
Date:   Tue, 19 Nov 2019 15:18:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE9AGvB6ee1iWHuAtJnPLmLu5lNM1bytSshO8o8XTsyH6yV02mK4+fMa77sMuaWuHLInkMU9MkUVxZrH5RdNKXO7ko+1nbUbi7gJ5Bom7zT6T2w2SItJ
 xUm5YRkMsu1Pal+Rv2JZAwXu2x7RxGQLmDWpWtASq4A19NjJWpstLtgiJTI1fPEH1OyH6MLProLBc4jRpWuZcxZdrlKtvnSoNGhUdQrS1VuK+l9x9PI6d/Yu
 Chirr5nd2iFQ2VbtYTanW43XObcnS3HRFCs+Ck0KN6elIYkf/btZMD6mwo3YMc72kUpAe/JoCno+jmUHKj4krteVPi8aXH6uQUBpR3K5c7hTz3Nqi1USIDvg
 87GxqGB1Mmjn7sFYc+7xVesG7yYEiPXGK60xRI+LkUgIIklOncDuhFXq7Hl5rq079bWI9iCVPhDxGhxy0OzjwjmJmwGm/ZA+q7udCIYTT/zY+MNUTZvIzFpS
 jiheBC7pAyBlhr/rsojcI4qhof3rRqWXhjgUoOsGMR8Q0bqgT6PrHTak3IQwGyXUF5QNdhUuoVIZrsv5KzGAKSWBvJ/KqrGMSTfBAgNOvhivL1svRShhqMSH
 AGINVCgtFO3aiM2m0T+gfXnjZwzJEzH8u2PLSygLSv3KtZKXb9GekoV1pUSo0qor6xv6nHbA8P9Ewvr31aTKyaquef+bWjKMddGC/fDKTm2TNys4hNQVyo5u
 LY4FgIQU2UmXYUaRzjBVClhI88+X7dOPxHpRhTkctvlSZbW4L3vTr8z5wuIfxQOctW2HzKe+a1sfKnZZtleC7lkDmSHR0QZ+WvMCifiivQ+My68jBv/zww==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/2/19 1:50 PM, Hans Verkuil wrote:

<snip>

> Action Items
> ------------
> 
> Hans Verkuil:
> 
> - Ask Cisco colleagues which bitrate-related parameters have to be per-frame for
>   an encoder
> - make stateful encoder infrastructure + documentation for the missing bits
> - investigate using different sizes for metadata controls in the control framework:
>   is this possible?

The problem is with compound arrays. struct v4l2_ext_control just provides a size field
for the total size and so for an array there is no way to discover the actual element
size.

That said, to my knowledge there are currently no compound arrays defined in the mainline
kernel. So one option is to take the last reserved __u32 field and split it in a
__u16 elem_size and a __u16 reserved2 field, or just use the full __u32 for the elem size
and drop the reserved2 field.

Alternatively, we prohibit compound arrays for now and postpone making any changes to
struct v4l2_ext_control until we actually need this.

As long as it is not an array, then we can safely extend these compound control structs
later. It requires some work in the control framework, but it isn't too bad.

I'm in favor of implementing this, and for now prohibiting the use of compound arrays.

It is really helpful making these codec state controls at least somewhat future-proof.

Comments?

	Hans

> 
> Michael Tretter:
> 
> - Support the new encoder stateful controls in the driver
> 
> Tomasz Figa:
> 
> - look up AMD encoder support
> 
> Boris Brezillon:
> 
> - send v3 of hantro g1 fixes
> 
> Nicolas Dufresne:
> 
> - look into multiview and sublayers support
> 
> Paul Kocialkowski:
> 
> - check metadata controls against the standards and update the docs if needed
> 
> Ezequiel Garcia and Boris Brezillon:
> 
> - add VP9 support
> 

