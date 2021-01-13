Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EFB2F504D
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 17:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbhAMQpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 11:45:45 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53537 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727533AbhAMQpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 11:45:44 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zjGVkKKlBAiIczjGYkeIiH; Wed, 13 Jan 2021 17:45:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610556302; bh=OGsVjFozKqnOMVXft0rDgO45msjbJ73GWAviZyXZlbA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KJbxeHXUAbY0kec1Ai+ooACscx2Izhyti4/Xk0WUExd5Opjj3UgfYFLffZ4IJtQR5
         5VnUz9pJHHDCtKhnZxE2FzkqhNX10Bxcc1uvMpKVpAPsbwOTmJH4cXCyrudePXHuhX
         pPe//GpSONFHcPeiUIB7ugUXlFmYDtzRhdA7e/DExVJpfynX/Gk9OCVoN8xGsG6Jly
         XbVvjFGBSGqc4AYprodsPaZVpvaHwXbAbYBvxX+dan6TTcvbdfzU5C/cPUZdEpRUvF
         phn+y2gGD8yi1iiYahSivGncRx3JX3jz1yvAyFngMf41U62my8g4qcY+vdZenK4GZ0
         YvwfQSo1V4YXw==
Subject: Re: [PATCH v4 0/2] Add base layer priority id control
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ef05e9fe-355d-43d5-7b14-9ea89cfef907@xs4all.nl>
Date:   Wed, 13 Jan 2021 17:44:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGTHDsmIdoz91f7BiWTfdovwEmXJNMyRw6fE2w6PfzFdkyFbYSsUT2bc0W8vQigim8mZQbOS3ZD+85fvNbIGK4uVGFaxrYYaG8FU6b+/xnbbtOn+0e+I
 3woEV5DguH/+Ka16szyqqiBoLEGVHflPr+2YtrDS4/b/XpaQ9KewEENQ+fB3O8nmuIE/vYPcOy+E8f9HCrJ69N8LHWSYgs+MQ7nWYv8I6ZEHBTfYdjpfuWr+
 9oqYtK4QRFirh/2Ff08Ru9vF3ah2tbdp/SrkGIfmC7WupkoNPK/Ttxt/vCvglF9I8jERETwFpufwvaCkrNddxsoYMDNdlAWmDfO5DaJ++6U2FvdGV0tZQ/KM
 Z0KRGBA7l+7HIjO7N/XyhDOYS7pWD+ZgZ3SIrkGkz+opCEI5Ct0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita,

On 04/01/2021 06:41, Dikshita Agarwal wrote:
> This series adds base layer priority id control for encoder
> and support for the same in venus driver.

Posted a pull request for this series and the "Add new controls for QP and
layer bitrate" series.

Note that because the "Add encoder ctrls for long term reference" is not
merged, the control ID for V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID changed
and that you need to rebase the "Add encoder ctrls for long term reference"
series accordingly.

Regards,

	Hans

> 
> Changes since v3:
> - Rebased the changes on latest media tree.
> - Addressed the comments.
> - Added driver side implementation for new control.
> 
> Dikshita Agarwal (2):
>   media: v4l2-ctrl: Add base layer priority id control.
>   venus: venc : Add support for priority ID control.
> 
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 9 +++++++++
>  drivers/media/platform/qcom/venus/core.h                  | 2 ++
>  drivers/media/platform/qcom/venus/venc_ctrls.c            | 9 ++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  5 files changed, 21 insertions(+), 1 deletion(-)
> 

