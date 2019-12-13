Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C75D11E5A1
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 15:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbfLMOeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 09:34:05 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35837 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727666AbfLMOeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 09:34:04 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fm13iiGDeGyJwfm14i1TgE; Fri, 13 Dec 2019 15:34:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576247642; bh=tuRHckFTwBtFNiyeBIBxFQ1d43oCP0tOai1GTv3J18U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VqGYdwVsUFC7PhEsyCu8RL/F7XlwR0FYOoU7WryX4/1KQy2jZ5ivby1IPM9roAoLR
         Z3FW2ABx8EJ5td2jZLjJq3bMLfpEd9rb8jW2wKo117y2ZSUNpgroQq6y95luNffOu9
         d0N0wAe0ibZ42SJyF4oEl1ozGLUeI5wiyknW/Qzkv2cURw1rJT5UXJe2hg5eu4mCDf
         Zal4FQ2dMQzSYc1FcTEx85DlC2WjzseX+EdY7a9V3Gin1x77+KK5kgH0Z7VhC9MJJJ
         fkBq9KWHkI+wJxGi9MmRQxCQFZfCuBZBU1M0dnpE1Qwp/KiKSazJS+xjY+vG0z7cCT
         VvFbGKL5zFOnA==
Subject: Re: [PATCH] qvidcap: Add stride option to command line
To:     bwinther@cisco.com, linux-media@vger.kernel.org
References: <20191206102629.18196-1-bwinther@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7d24d9ac-6df0-44b2-b861-800038c63072@xs4all.nl>
Date:   Fri, 13 Dec 2019 15:34:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191206102629.18196-1-bwinther@cisco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOKkdle2zRlwFU1kUmJeJXBHgYc1X3XIRbFdTmNQ0UOLHT0SunYaVkkO6CUqtuvLu32lGhPx4ikYSoFrMorBFqGpk1QuQ1flBUC43j8Gpj/VBDKtSuEl
 aLTraWXuWFJq198NQlBou0urtBXiURkIqHjsPn0A4pXnadCSuGhxkM51fc94/hGJYcpH0ap6H+ghoXVxLVBx/eIM/VbM5CvISm9gJteSQFztS7HcO2wo9/dv
 99AIT96//hXCOorlJUZlm7XHk4IVDzAsM8jR4KY23ilLNi67jQoAMHdMqNUaV0NR130cK1N76xlcUv2v4wlF/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bård,

Can you document the new option in qvidcap.1.in as well?

I also have one comment:

On 12/6/19 11:26 AM, bwinther@cisco.com wrote:
> From: Bård Eirik Winther <bwinther@cisco.com>
> 
> Add new hotkeys Shift+Left and Shift+Right to decrase or increase stride.
> 
> Signed-off-by: Bård Eirik Winther <bwinther@cisco.com>
> ---
>  utils/qvidcap/capture.cpp | 38 ++++++++++++++++++++++++++++++++++----
>  utils/qvidcap/capture.h   |  2 ++
>  utils/qvidcap/qvidcap.cpp |  6 ++++++
>  3 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
> index a76dd2b6..e2903fb5 100644
> --- a/utils/qvidcap/capture.cpp
> +++ b/utils/qvidcap/capture.cpp
> @@ -571,6 +571,7 @@ void CaptureWin::keyPressEvent(QKeyEvent *event)
>  {
>  	unsigned w = m_v4l_fmt.g_width();
>  	unsigned h = m_v4l_fmt.g_frame_height();
> +	unsigned p = m_overrideHorPadding;
>  	bool hasShift = event->modifiers() & Qt::ShiftModifier;
>  	bool hasCtrl = event->modifiers() & Qt::ControlModifier;
>  	bool scalingEnabled = m_canOverrideResolution &&
> @@ -587,12 +588,22 @@ void CaptureWin::keyPressEvent(QKeyEvent *event)
>  		if (!m_scrollArea->isFullScreen())
>  			return;
>  	case Qt::Key_Left:
> -		if (scalingEnabled && w > 16)
> -			w -= 2;
> +		if (hasShift) {
> +			if (scalingEnabled && p >= 2)
> +				p -= 2;
> +		} else {
> +			if (scalingEnabled && w > 16)
> +				w -= 2;
> +		}
>  		break;
>  	case Qt::Key_Right:
> -		if (scalingEnabled && w < 10240)
> -			w += 2;
> +		if (hasShift) {
> +			if (scalingEnabled && p < 10240)
> +				p += 2;
> +		} else {
> +			if (scalingEnabled && w < 10240)
> +				w += 2;
> +		}
>  		break;
>  	case Qt::Key_Up:
>  		if (scalingEnabled && h > 16)
> @@ -675,6 +686,12 @@ void CaptureWin::keyPressEvent(QKeyEvent *event)
>  			m_scrollArea->resize(w, h);
>  		else
>  			resize(w, h);
> +
> +		if (p != m_v4l_fmt.g_bytesperline()) {
> +			printf("New horizontal resolution: %u + %u (%u)\n", w, p, w + p);

I think this message should only be shown if the padding changed. Otherwise I keep
seeing two messages when I just resize the image:

New horizontal resolution: 640 + 0 (640)
New resolution: 642x480
New horizontal resolution: 642 + 0 (642)
New resolution: 644x480
New horizontal resolution: 644 + 0 (644)
New resolution: 646x480
New horizontal resolution: 646 + 0 (646)
New resolution: 644x480
New horizontal resolution: 644 + 0 (644)

It's a bit too noisy.

Otherwise this looks great!

Regards,

	Hans
