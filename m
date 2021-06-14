Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C163A67F1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 15:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhFNNfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 09:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhFNNfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 09:35:32 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD82C061766
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 06:33:29 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id z4so8503265qts.4
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cAUqeEpvWCkYWomZHT8Du/PXR9Hb0hXmraoq1aYdJeI=;
        b=pjAEL3RklamT2ea9ks/JNUzw0Kpgv4zYuHuOL6SFc5mRQeVO99/7YT5gy5JVYZ4/Iw
         3AYgtTRyl1fymKmlRu4eQBHOfx488ruY60Wjj4kvx4pVsdk6sY5WecqGPr+DTh2SniM1
         7wtYNmPY26n5X7qrbIqj2ytr9thPyiS/f36pPdntQFodAYSKtWoB3OsjFCwaCLB6unXf
         jarKxmU45MHI5BRKbhBJKhXptH3nOlPGMx+ADeCmvHsLBAinbdSxfGZVG0ECRWHa6jMa
         Rbr8b9hb8uza+KYOedL9UhIQ9fBroWOPasYZ51WQgu5yp56+bnfeXN31/s6v9QMdZpoW
         zTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cAUqeEpvWCkYWomZHT8Du/PXR9Hb0hXmraoq1aYdJeI=;
        b=W+FRlL9DX0HGmZNteCgNaJ6sUPKVqGjdpGgzRc4a+TsyyFWA6ivrv4RWiYbDRlaoeb
         R4GGRkX+xAFlJj9EtkzKlPEqiFyliZZKvfp/qEWVTVGN5KiuZzTZWIHgN+EAehWldHkX
         R4RRufNEEMTCiTT4rF197631u1/tLUPVdT2z4VgNUCEJ6k633i9M0Y4RKq2rMHDw2JYS
         apzawkXRM+6v1kbVZqSvBaV9oCD/2N5xpCSln201mlPZzd+FfbhbNAM4WydPHm4lSACI
         3ICdjFXdqMmheT7rCBv/75MZdxGXbkM65fciuTh8bXFy8z0+7hQ4VZbmxUtZ2YHAgPKv
         qXdA==
X-Gm-Message-State: AOAM530hss5+gBXmNkKyPMgdC+Nvod9d2pxtMBEbgel2AeOMSGGRqWZ4
        2yzUwKQYbySQN6kh1MGV1UXspQ==
X-Google-Smtp-Source: ABdhPJyYC+nZRV+fy4AzCGkEGO6Ybe9Z+87K1jGmsTNrB9WnRW+68Auv6i4mlFxbSA9N1CDorD5IXg==
X-Received: by 2002:a05:622a:d1:: with SMTP id p17mr9570218qtw.141.1623677607558;
        Mon, 14 Jun 2021 06:33:27 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id l6sm10217007qkk.117.2021.06.14.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 06:33:26 -0700 (PDT)
Message-ID: <d18bfce0b7cbd18594faa6b1013e27e6719f0a71.camel@ndufresne.ca>
Subject: Re: [PATCH v2 7/8] media: hevc: Add scaling matrix control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 14 Jun 2021 09:33:25 -0400
In-Reply-To: <96e63be705b04b40a943307c81ed71e8c573ef96.camel@collabora.com>
References: <20210610154442.806107-1-benjamin.gaignard@collabora.com>
         <20210610154442.806107-8-benjamin.gaignard@collabora.com>
         <87a1e585-688e-7c4d-b9a9-24f42772a1a8@xs4all.nl>
         <d5b010c8-c0c5-8800-b2c3-9371923ca10c@collabora.com>
         <96e63be705b04b40a943307c81ed71e8c573ef96.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 14 juin 2021 à 09:50 -0300, Ezequiel Garcia a écrit :
> On Mon, 2021-06-14 at 09:43 +0200, Benjamin Gaignard wrote:
> > 
> > Le 14/06/2021 à 09:27, Hans Verkuil a écrit :
> > > On 10/06/2021 17:44, Benjamin Gaignard wrote:
> > > > HEVC scaling lists are used for the scaling process for transform
> > > > coefficients.
> > > > V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED has to set when they are
> > > > encoded in the bitstream.
> > > Comparing H264 with HEVC I noticed that the corresponding flag for H264 is
> > > called V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT.
> > > 
> > > Should those names be aligned? Also, it is part of PPS for H264 and SPS in HEVC,
> > > is that difference correct?
> > 
> > In ITU specifications ("7.4.3.2.1 General sequence parameter set RBSP semantics") this flag is define like that:
> > scaling_list_enabled_flag equal to 1 specifies that a scaling list is used for the scaling process for transform coefficients.
> > scaling_list_enabled_flag equal to 0 specifies that scaling list is not used for the scaling process for transform coefficients.
> > 
> > So for me the naming is correct.
> > 
> 
> The bitstream is really parsed in userspace (gstreamer, ffmpeg, chromium).
> Not all bitstream parameters need to be passed as-is, because the kernel
> is actually a sort of low-level layer in the decoder stack.
> 
> I think it's probably most appropriate to follow our H.264 interface
> semantics, see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54889c51b833d236228f983be16212fbe806bb89.
> 
> The H.264 story goes like this:
> 
> * Default scaling list is used for decoding, but can be modified
>   by a bitstream-provided scaling list.
>    
> * The scaling list modification can be in SPS or in PPS.
> 
> * For each frame, the SPS and PPS headers will tell if
>   a modified scaling list must be used for decoding,
>   and if it's provided in the SPS header or the PPS header.
> 
> The userspace parser must take care of this, and pass
> a scaling matrix to the kernel via V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> setting PPS_FLAG_SCALING_MATRIX_PRESENT.
> 
> This flag is at the PPS control, so the scaling modification
> can be applied on each frame.
> 
> In other words, the kernel interface is simpler, it just
> receives a scaling matrix and a flag telling if it must be used or not. 
> 
> We should probably clarify the documentation, so this process is more clear.
> 
> From the HEVC spec, it seems the process should be similar.
> The only difference is the SPS "scaling_list_enabled_flag" parameter,
> which doesn't exist in H.264.
> 
> Nicolas: what do you think?

I believe its a fine "driver convenience". In the sense that the flag might not
have been strictly needed, but may make the driver code simpler. Whenever
possible, and within the spec, I'd agree to keep things as consistant as
possible.

From the doc, there seems to be a "default" or "flat" version of the scaling
matrix in H264. I think if I had notice this before, I would have pushed forward
the same semantic as the MPEG2 quantisation. In MPEG2, the quantisation control
is set to it's default value in the control framework. What I like of this
approach is that the control becomes always valid. Perhaps there is some
differences here and there I'm not noticing though.

Semantically, it would also be totally different if there is a HW fast path to
the "flat" scaling matrix, in which case you need that flag to enable it. I
think the fact one prepend SPS/PPS is simply to help locate the relevant part of
the specification.

> 
> Thanks,
> Ezequiel
> 


