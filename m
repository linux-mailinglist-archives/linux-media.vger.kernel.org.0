Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10F66870B8
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjBAVvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjBAVvr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:51:47 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D1FCA34
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:51:44 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so3702748pjq.0
        for <linux-media@vger.kernel.org>; Wed, 01 Feb 2023 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iELTTpHrNUb+JricGSJn8kLDfAAkqtXCLUID0VLM/z0=;
        b=hir3ygrnBt+Y+ubvGSva2AKa7JGAd/wGBIy+EKw5ITCYTkpbhk5IwPF4k6j9nqCivQ
         Q9zOYJlIhrjyYStRPdoNSypyA2KYPtHjbqxTe9/ZvYGrH3/sG9XYejOk32UEmCPoKRHJ
         nBop2Ixz8F6veytyrWBNNmLduDxDCepbLogWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iELTTpHrNUb+JricGSJn8kLDfAAkqtXCLUID0VLM/z0=;
        b=cTcHz9/upC7IDU7OCatxQHuT3E51k2H04U+f8wLbiC0TPCOyd6xlXDGGscdCwNHkdG
         BUmu5fAdNxBGwrT8CCvca8C3QH4rK6ytCygWADLWp77BTZ1PC8OtbvzMKAtevfLjkvI+
         pcsXWr9InX2yzMT3PM4GChbuxnXjeGNKbVf6ejM5gEUDHmMtwb2j8NqYRhL2UdbtIZaf
         TkGBtY/1c5zbA+yukPF6xjani5mhErSHZwo1wYzk0vVLzzbaGOYISdGS0rO/4FfPaIWU
         OLA2ftFVHTritOZ33x5LS7+YmBlE+qhs6Hn1Pgq8tLGMPo4C49uIIQiT+9HHwc3BPM3/
         XVKQ==
X-Gm-Message-State: AO0yUKXIXDkvcBVuB4LRVPoszamkhhjW6+fWyplHGlCOo3j4+U+XKwjl
        2N41XdPaBDDSHP96RfM2NtHHrA==
X-Google-Smtp-Source: AK7set8OjfnQJtTKin2tn2nShRLgRmyo2QeVEfQgVAkU5nppSH4MCrMVE6+QJq/2zZnKGjT8edMNVg==
X-Received: by 2002:a17:903:24f:b0:196:25b1:a032 with SMTP id j15-20020a170903024f00b0019625b1a032mr4779123plh.59.1675288304375;
        Wed, 01 Feb 2023 13:51:44 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d7d8:a2cc:9aa8:1806])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902768800b00194d2f14ef0sm12260176pll.23.2023.02.01.13.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 13:51:43 -0800 (PST)
Date:   Wed, 1 Feb 2023 13:51:41 -0800
From:   Brian Norris <briannorris@chromium.org>
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v4] media: Add AV1 uAPI
Message-ID: <Y9re7dRqzjEeNsxj@google.com>
References: <20230103154832.6982-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103154832.6982-1-daniel.almeida@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

A single drive-by note:

On Tue, Jan 03, 2023 at 12:48:32PM -0300, Daniel Almeida wrote:
> This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
> 
> This design is based on currently available AV1 API implementations and
> aims to support the development of AV1 stateless video codecs
> on Linux.

...

> Changes from v2:
...
> - Rename v4l2_ctrl_av1_frame_header to v4l2_ctrl_av1_frame
...
> +#define V4L2_AV1_FRAME_FLAG_SHOW_FRAME			 0x00000001
> +#define V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME		 0x00000002
> +#define V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE	 0x00000004
> +#define V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE		 0x00000008
> +#define V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS	 0x00000010
> +#define V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV		 0x00000020
> +#define V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC		 0x00000040
> +#define V4L2_AV1_FRAME_FLAG_USE_SUPERRES		 0x00000080
> +#define V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV	 0x00000100
> +#define V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE	 0x00000200
> +#define V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS		 0x00000400
> +#define V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF 0x00000800
> +#define V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING	 0x00001000
> +#define V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION		 0x00002000
> +#define V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT		 0x00004000
> +#define V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET		 0x00008000
> +#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED		 0x00010000
> +#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT		 0x00020000
> +#define V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE		 0x00040000
> +#define V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT	 0x00080000
> +#define V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING	 0x00100000
> +
> +#define V4L2_CID_STATELESS_AV1_FRAME (V4L2_CID_CODEC_STATELESS_BASE + 502)
> +/**
> + * struct v4l2_ctrl_av1_frame - Represents an AV1 Frame Header OBU.
...
> + * @flags: see V4L2_AV1_FRAME_HEADER_FLAG_{}
 
V4L2_AV1_FRAME_HEADER_FLAG_{} no longer exist after the rename. I think
you're looking for V4L2_AV1_FRAME_FLAG_{}.

Brian
