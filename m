Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED02563736
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 15:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfGINqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 09:46:15 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35421 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbfGINqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jul 2019 09:46:15 -0400
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea] ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kqRbhm0bA0SBqkqRch39E3; Tue, 09 Jul 2019 15:46:12 +0200
Subject: Re: [PATCH 0/5]Add support for mt2701 JPEG ENC support
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
References: <20190709032103.10291-1-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <79316488-30fd-7ff3-7598-d29f85f663ab@xs4all.nl>
Date:   Tue, 9 Jul 2019 15:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190709032103.10291-1-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJOEIUcU2sXWd9bC50a4eYZ5LTEqfEC1JRULW/bkWFrKdVBQ/lekp5KR2UKQdl9uV4VWVClgZWcLqUO4U/SIIm7ISiTjndpkJheBiYNaEAFvQfVeC1hE
 qDSQfIJmk/pjXs8utQp3DTtOqUIptglNMx5+x4W/J5vYwRdieV76rYwt1uzqXQP6js809vDQcbILwA5sHqYWI/2J/6a9b45DeDh3orTZ/MxP8kPO9df14mwJ
 S1MxCRveuwBZtb6R/KFayiMT4RsCwFGoULDHt6TnGD9ginkNVzqp/JANQXm3ffjpGyQ1B89xPCMKOXpqGVRCjFN5k+PEhwSEztmjFZeK0NzNE2i/wB5ClqDe
 RDVeE6Da5JzSxbV288V5nLRHHD6Iiw12bgt4gA4/tVRdbP21dSIhdfhVjemZJW0GaP9t/FwrwVa8YWaW5MKuFSuJDMJGTiu3OKl1FSShYw12gq2WUYai9KS5
 Uve2BsE7IGAhi4w20a4KGIzBzy/c++Y+EoLyagdfByRhV2fiHdnmHVYINifeHHB/H/FnuteLO9LZyev32Lf9q+ICby6ut90xUSvvun/Rww+WE7yrbYjgWhRf
 fU5md9AtQ7NlMAtoIsmAr3MWw3oCPUzteY4AB6RKmjSJLgbw/RSmV51M+EYKlibLPDQZJFw/AKh1dPHyyk0cHGJ4novIdqenBjG0Au0Zqz+D5aduPGNIgDoH
 1Zb5Qe7V6I8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/9/19 5:20 AM, Xia Jiang wrote:
> This patchset add support for mt2701 JPEG ENC support.
> 
> This is the compliance test result for jpeg dec and enc.
> 
> The JPEG dec log:
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video0
> v4l2-compliance SHA: 08fed4d0edb1492b91d9d1054c36fed95c372eaa, 32 bits

Hmm, the SHA indicates that you are using an old v4l2-compliance version.
Please get the latest code from the v4l-utils git repo.

<snip>

> Buffer ioctls:
>                 fail: v4l2-test-buffers.cpp(713): q.create_bufs(node, 1, &fmt) != EINVAL

This should be fixed: this test tries to create a buffer of half the minimum
size, and the driver doesn't check that it is too small.

Ditto for the encoder.

Regards,

	Hans
