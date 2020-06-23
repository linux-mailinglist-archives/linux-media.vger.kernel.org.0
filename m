Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7040204F26
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732245AbgFWKhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:37:03 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:43629 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732172AbgFWKhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:37:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ngIUjeuIavh6gngIXj1Jh7; Tue, 23 Jun 2020 12:37:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592908621; bh=hNAtAbL18HMN3lk+lJWngxf/IxlRPafkhTKbaPYr8jE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fd4cRkxmEJ0aGCrk8W5xnPvBz6KD736T1pnFY+lMEmcrDUTM2v2nyoJHfNWz5gU4o
         E14WL15Mig15R5ml+R47GIFdt2ydja+k6HlzsHFePxNNE4ujgBcUu1JB3/J4cHso3d
         QqB+o2rFBPh4cmfQ3Jcw1gwbNm40I7RGIZxQI5Lzgx+clP0DlOuHp9OkMJa7BwNK6W
         kDbz6ZT0wUdDy8M/rvwOJ+Q57JjtwKzRXGdPEOBbnOfBpuaWt6cjX7THX1vWCFdONo
         mJWZsdKV32h18292d/N1rrtUr9d1j4I0UIJwyPwuLxncihhQTTpKZVcTgbhg8h/0u1
         ZKYv3oD38iYBA==
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e08d5c45-cf34-e945-e5be-7e43eeaf35f5@xs4all.nl>
Date:   Tue, 23 Jun 2020 12:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGKaTaRCkJ24VSR5j16j5cuDY2Bwar6m+tfZjZdXNWUXBCEJLx2kc/NDLpBSPDHUY+ni3DMaNPmAA4QAq5lJqO5V20BD6zHYAEjJlxyX4i3ulgxX1mZh
 H9DLXyM4QLe2nehLK5E9NXpCOEsYnGrNslTY0ymRYfNA5qQrYtU4jNMC40hQwHVPlPCalMS6Keu06nPVYyEQS04m7sWmQGZl4L+MXULoYE13jiS9F9aCjAAN
 0NXZIvEUNel17zf6Jx4A3XXaKIQxelFVaEQvgWdLOlLMup/+Q4WKkmuiujMuPedV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 26/05/2020 12:09, Hans Verkuil wrote:
> From: Tomasz Figa <tfiga@chromium.org>
> 
> Due to complexity of the video encoding process, the V4L2 drivers of
> stateful encoder hardware require specific sequences of V4L2 API calls
> to be followed. These include capability enumeration, initialization,
> encoding, encode parameters change, drain and reset.
> 
> Specifics of the above have been discussed during Media Workshops at
> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
> originated at those events was later implemented by the drivers we already
> have merged in mainline, such as s5p-mfc or coda.
> 
> The only thing missing was the real specification included as a part of
> Linux Media documentation. Fix it now and document the encoder part of
> the Codec API.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>  5 files changed, 767 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> new file mode 100644
> index 000000000000..aace7b812a9c
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> @@ -0,0 +1,728 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +

New rst docs should be dual licensed:

SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-or-later-no-invariants

It is OK to make this change? No need to repost, if you agree with this
I or Mauro will make the change.

If you agree, just reply with your Signed-off-by line.

Regards,

	Hans
