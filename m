Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04301225BB8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 11:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgGTJd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 05:33:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58191 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727940AbgGTJd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 05:33:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xSBEjXfufNPeYxSBFjmpBm; Mon, 20 Jul 2020 11:33:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595237635; bh=Oc0K8sxEqzjVn3DRenx9PPLPz8qOmAYt7tiqTMtQV/8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZOrgMAHK6VX7sSLWKh2lJ6Kpr6+aGjXNBtiBxze4tRsjcBhWimaw+Tl4tu3Pk8mCT
         XXHNzLoeoFdZr0Ik3KWfSSMcNYkzHLTnw6dK5ISvvbXIdQijNTweujUTHhLv9Twy+u
         5CKQAxiom4mt4Qv9ZDUQEVSySOGUeIfCAJauNn5ojzCrMUevQ0mXpeke+EVSCy1R8F
         L424HpuRDsVe2c6K++fi+ZGZYMOuP5Yeoiwq1U2d2hXgT2BqT0cRz+i/K4kJrV+YRF
         P4xFMEz2yhau0kiC8aY3ZfZHUaGFDQz2VU45Q1prGtn/JBucSII1xcBa4RWwMpZWs1
         d3sot+j6T49PA==
Subject: Re: [PATCH 4/4] media: docs: Depricate mfc frame skip control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
 <20200705121128.5250-5-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <58ba8d2e-58a4-86bd-3eb1-668f9d743e6c@xs4all.nl>
Date:   Mon, 20 Jul 2020 11:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200705121128.5250-5-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLMczbqR7cwh/AUTIzSsEONhK6t0ca5X3CCS9RZt3DLrosrG+W2asUcuud2padTPmwP13Xbvdc06srwZ3WaqfK5sQHolUhq330f8vF4ulbkZzod3dcy0
 Ic3UQ8jcJHP6aRl2+P991m9vYKdZuz4lm5FYaI2oW4l+2j4YRorw2lTvkUs+QM7DvMb9BewXHAL9UUSvKpuZMNIcv+um36sdHWJiYxv0Yjc2TsLoXXVMy5lp
 H1zFW/IxTK//auY3zEJvUEYwNEPA1YE0tVcdqpLZHQbnpW017F+OMsrgutQtDAMg3bQlyKcc3acAYX2VBrrv/b3evDCSNRcgZN8JJohMdQKxc+jCjd0V+qhq
 bA2sGaJ7xfJ68npWwXD0E8Ei7nf4mA0003WLfD3XW+w4Up7dKh3ds+Z5JGxctTI9jXkJ9673VRMqnDAnJ//X+/6qgqDhf6n8Q52DTJqFHe8gWFeRoU0dxJe/
 4sBeVp5Y2MwuXPRqlVBkAYO5yjo1vqypaRzONeSNl5NwQzDwdLo89jX1wl2P+ByNyOm8VAjsPTv8OuB0AKJqboklN1XVoLPAP5ZROpeebs3dDDOqgrE8Y537
 vgaNSKjb4SZp1z2z/hdzGNj5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/07/2020 14:11, Stanimir Varbanov wrote:
> Depricate mfc private frame skip mode control for new

Depricate -> Deprecate (same in the patch below).

> clients and use the standard one instead.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index a8b4c0b40747..c0760bfc54d4 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2805,6 +2805,11 @@ MFC 5.1 Control IDs
>  ``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
>      (enum)
>  
> +    .. note::
> +
> +       This control is depricated. Use the standard one

s/one//

> +       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` instead.

s/instead/control instead/

> +
>  enum v4l2_mpeg_mfc51_video_frame_skip_mode -
>      Indicates in what conditions the encoder should skip frames. If
>      encoding a frame would cause the encoded stream to be larger then a
> 

