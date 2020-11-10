Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199A62AE470
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 00:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbgKJXyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 18:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731558AbgKJXyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 18:54:38 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81219C0613D1;
        Tue, 10 Nov 2020 15:54:38 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s8so375407wrw.10;
        Tue, 10 Nov 2020 15:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AZu6XPMSl4sNdMFeam8YLAmi7IJLk3RLAZr9T6pEy+0=;
        b=fUSzbPNd0tO2Gzm4vcTZ8zt25ZmGES+U0kOlXwbx/9kA1KVO/LjWnENIz/ypmwx3Pl
         prJI63oEHo4t9W6CoudckPSLmn/3+IyQthZQmRsdgT69fB9TEc1yNCn1SJuNMmvb8YHD
         v/o5cBKfcBOYy+2mqNdvpAOEEzilnHqNcwwJGiRGVRXEpe7QCb25u2wDMCrG96gCmc+D
         jeD+LANz5mnVAFnaAaAzzdWVDsg00Q/KQIyxhNxGXNKpZD8f7+QWHJiDe8aB9iYaqjg2
         xI15m1dfVgjGlMnk0LNH3f3gKhGwFBkelDLUxWrSjmF9VaeobkcHMvYBcvkChccOUWd5
         7LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AZu6XPMSl4sNdMFeam8YLAmi7IJLk3RLAZr9T6pEy+0=;
        b=Eeyf0hLnpIfLwfjisVH7kMYlGXg2xUAyZ+D50sjlDNSAGT+YjkLBy+BIPzqhs1Lxej
         VkbiVSJ0Q0VRf3eZRGFQlxTKQpN63FvEX3rOtqbnoDhUgOJzKIGp/GUcUh8IDUTFDUxE
         /5L6W0aqFtx6MNpjYWp8A0kjbST8vlMUH8gOy5QKupoBOxkKhZ/ZkPPZ/cB0LTiOldH3
         2In8HHh67yWUDMTDA6EM4sUkM/kJvaghk5L4wqvblWF768BwpY2pI5klbznKGTcW2Zeo
         hD4NKgJiX29w2sjPxGMkioSJsjV9EILUhvT/hSl+uFlghSmJRuktiRLgG2CgTVaqegM8
         X62Q==
X-Gm-Message-State: AOAM531XY8aRjbAsz/Qto+tpvAtYXarOi3pUT2Lih358PitorcC/L0qh
        /qAlOO9WORWAFmqZYcNIj77db7Wi/R9Wd4vA6JI=
X-Google-Smtp-Source: ABdhPJzP9e5pjH5sCd486bVfOquouBS2v0wH/GmC2ZsacUkp/PcNOrTUbD6snndk/K3H9t7uWbLLbIQPc0ik2RzapKM=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr26295254wrn.362.1605052477294;
 Tue, 10 Nov 2020 15:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org> <20201110193112.988999-17-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-17-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 18:54:25 -0500
Message-ID: <CADnq5_NACtb19H26ruPKOJ2ZBv3WT+o5LQnMtreWp1qsx-w3Fw@mail.gmail.com>
Subject: Re: [PATCH 16/30] drm/radeon/r100: Fix some kernel-doc formatting,
 misnaming and missing issues
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 2:31 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/r100.c:163: warning: Function parameter or member=
 'async' not described in 'r100_page_flip'
>  drivers/gpu/drm/radeon/r100.c:848: warning: Function parameter or member=
 'rdev' not described in 'r100_ring_hdp_flush'
>  drivers/gpu/drm/radeon/r100.c:848: warning: Function parameter or member=
 'ring' not described in 'r100_ring_hdp_flush'
>  drivers/gpu/drm/radeon/r100.c:1425: warning: Function parameter or membe=
r 'p' not described in 'r100_cs_packet_parse_vline'
>  drivers/gpu/drm/radeon/r100.c:1425: warning: Excess function parameter '=
parser' description in 'r100_cs_packet_parse_vline'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied with minor fixup. Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/r100.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index 24c8db673931a..92075dedf2cb2 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -153,6 +153,7 @@ void r100_wait_for_vblank(struct radeon_device *rdev,=
 int crtc)
>   * @rdev: radeon_device pointer
>   * @crtc_id: crtc to cleanup pageflip on
>   * @crtc_base: new address of the crtc (GPU MC address)
> + * @async: unused
>   *
>   * Does the actual pageflip (r1xx-r4xx).
>   * During vblank we take the crtc lock and wait for the update_pending
> @@ -841,8 +842,8 @@ u32 r100_get_vblank_counter(struct radeon_device *rde=
v, int crtc)
>
>  /**
>   * r100_ring_hdp_flush - flush Host Data Path via the ring buffer
> - * rdev: radeon device structure
> - * ring: ring buffer struct for emitting packets
> + * @rdev: radeon device structure
> + * @ring: ring buffer struct for emitting packets
>   */
>  static void r100_ring_hdp_flush(struct radeon_device *rdev, struct radeo=
n_ring *ring)
>  {
> @@ -1409,7 +1410,7 @@ int r100_cs_parse_packet0(struct radeon_cs_parser *=
p,
>
>  /**
>   * r100_cs_packet_next_vline() - parse userspace VLINE packet
> - * @parser:            parser structure holding parsing context.
> + * @p:         parser structure holding parsing context.
>   *
>   * Userspace sends a special sequence for VLINE waits.
>   * PACKET0 - VLINE_START_END + value
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
