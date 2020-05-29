Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849F61E79EE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 11:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2J5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 05:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2J5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 05:57:30 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9607C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 02:57:29 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j10so2792756wrw.8
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=leUPoCPE2pjh4Af0cvRmis79J+8beEZ2LsUfEw3ljKY=;
        b=JCu4Nb3HQ/Ajw0CH2f+O5r8bCqGc76YqvrpwG07uHN/B530zomxExJxFKgN0bCRFSl
         5fEzqj1Yo/T9boPcs3eHwYvV+z5BAb5LRHoFslisixlhfZyTW5r5Qgx/8blJup8WWQm2
         bgDlka2Zqh4syARDhlPXCId/7xuGwydVamH8Std06HU/vHAqmWr6qIGKI+U5R2gM+1RW
         52cnMAHjcnpTerLNrJfKoou6iXzC9/5sp0QdtAGEV5t6kIFQbv7J7XdIv5O6ihM6X75t
         ocVgscR/m4PFLQ5d5RMCqOYb1dsFWOFbo+8DpEwfqr4p0KYg5vW+ijT3oFwtotA5upyl
         ZaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=leUPoCPE2pjh4Af0cvRmis79J+8beEZ2LsUfEw3ljKY=;
        b=Oskgv/itJS4REMrGyh0GxmimrqDOYKiQYp57Igk+LNJkVs0PXKzE/ALO6L9443pWU2
         02A2RUwSWyREYcdxJkSAXfzaKCR+QiDlFi6lPdPkUTo1NErW0ZtNcC6BVUBhmVEQDXLC
         pomY78IM/snaOsqYw2VJDUeHiRJKWlSpZzf+dIYu8au7hHXhe4t2saRClW+ujy4Eo2Qp
         5Qln2sdrAHCmplyzJG2yqPVCihyd41OlAS4Wr7rpS/PBPQDIg/7jusKJLzHt1KnyXYi6
         Q6UV9N02/PqWxL5m2qpR48XOiqX/bfyeRtSYeaBQ9xemCPOUa2/55OY8zzv42mrM+a4M
         rJyA==
X-Gm-Message-State: AOAM532tSKW7I9VFOvyDUzNmCkWximsaWZF0AyfIcn323CAkIVPwc/Cx
        WPpgXqIGaZCwwbE+JZuGCMOqrQ==
X-Google-Smtp-Source: ABdhPJx1P3jpqmCaqy2wHuyySqMcc+Rx9Y0LZdtrcX6GtadWU8RtwX00Tbm5XdrX9WEFs2e8QbBeXg==
X-Received: by 2002:adf:b60b:: with SMTP id f11mr7897786wre.7.1590746248429;
        Fri, 29 May 2020 02:57:28 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-42.ip.btc-net.bg. [212.5.158.42])
        by smtp.googlemail.com with ESMTPSA id z132sm11765277wmc.29.2020.05.29.02.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 02:57:27 -0700 (PDT)
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <15e979fa-f782-a8af-5bf3-d39e6c245b36@linaro.org>
Date:   Fri, 29 May 2020 12:57:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/26/20 1:09 PM, Hans Verkuil wrote:
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

<cut>

> +
> +Reset
> +=====
> +
> +The client may want to request the encoder to reinitialize the encoding, so
> +that the following stream data becomes independent from the stream data
> +generated before. Depending on the coded format, that may imply that:
> +
> +* encoded frames produced after the restart must not reference any frames
> +  produced before the stop, e.g. no long term references for H.264/HEVC,
> +
> +* any headers that must be included in a standalone stream must be produced
> +  again, e.g. SPS and PPS for H.264/HEVC.
> +
> +This can be achieved by performing the reset sequence.
> +
> +1. Perform the `Drain` sequence to ensure all the in-flight encoding finishes
> +   and respective buffers are dequeued.
> +
> +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMOFF`. This
> +   will return all currently queued ``CAPTURE`` buffers to the client, without
> +   valid frame data.
> +
> +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMON` and
> +   continue with regular encoding sequence. The encoded frames produced into
> +   ``CAPTURE`` buffers from now on will contain a standalone stream that can be
> +   decoded without the need for frames encoded before the reset sequence,
> +   starting at the first ``OUTPUT`` buffer queued after issuing the
> +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
> +
> +This sequence may be also used to change encoding parameters for encoders
> +without the ability to change the parameters on the fly.

How the v4l2 client knows which parameters could be changed on the fly
and which cannot? Controls should return -EBUSY?

Also could that Reset be used to change the pixel format and probably
colorspace?

-- 
regards,
Stan
