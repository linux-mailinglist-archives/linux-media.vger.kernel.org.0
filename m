Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41F92AE378
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbgKJWmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKJWmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:42:09 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F65C0613D1;
        Tue, 10 Nov 2020 14:42:08 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id k2so105284wrx.2;
        Tue, 10 Nov 2020 14:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hn1gX8PspkDOj8Q527Btx4yJgJJQpfPQNotleBd9s78=;
        b=RNbImXQqxewVikynVYlsIc5eJiPiI52a7pExrDU21je2KF48bwcH63mSvvUs302Sgb
         Z/kCa79a/J+G54zd4Ar7skX+R5U6eB+LJ/JImPH+NtKz0e60LTFVZhwZulB5BDGIt+Yk
         +EnKirDwthqU7BWQpqd2knWu3F31wrB1kNQ6DpITjm5QGJaUw7Wfj1x8YCslrVyDgWfW
         akZsyQUEMz9O+6/Lu67v+gpy9y1zPV7aV2Gvj8vugD2xxdq7t8OuFdqsj2BSR0GLlNvi
         1dGdu5vL1SIWczA7+0sg0IJtSPCylkL6OY3IvGXBx6SwtUAWB+LLhTueT73DEdotRN6x
         lM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hn1gX8PspkDOj8Q527Btx4yJgJJQpfPQNotleBd9s78=;
        b=Wk1VDtscNT6Hu9gTFshACc9ohA7JYhkQTeCrsT+yeZ8j1LGffCvkrQlXzRjP72y1J3
         Ac5Ec0nGqVq1K7+AnUO8GWTpjXS1KXeirRoZXilhCEaVSF/cVS33iAlrkHAGRtWm9BKC
         AuIPMDUTbx7hN9NLGOnoVwnSm3maZvvHpr9DCLaM4EdMVSsclVh4QHtv0rzpMYDBFwhp
         X7I0Flt2f4ZcqEEolSeCZsz4Z0RzOkWmVPdItfaLHKqNejoMKk+bdQKO1plbBW+YABR3
         crSaUwIEuuXZNqcfLs8aYoFQEPT1oTUsvwDYy6lJqnJGPFfKoKzM1ypP7FZjPAyW0BU6
         oUpA==
X-Gm-Message-State: AOAM531lY5Mu1kO++2sI8oTSUsFd/s5wCo9AMwykiRmRfrOdWnB+Ldie
        W2JpDdYGsa3HkKH+rvY2kKvWO1m8hcqMa891z3Y=
X-Google-Smtp-Source: ABdhPJzpeprw0TRKEK/mcA0vV7/Yvkxpg9VGgvNrS9j5WDhVBOU+5lem10Hfpdjv+l80DR3N6054qdXwIeCfk1LsAs4=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr26053226wrn.362.1605048127616;
 Tue, 10 Nov 2020 14:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-13-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-13-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:41:55 -0500
Message-ID: <CADnq5_O7nnvqxXGc4pyZZhMem4+-_mYmLNMU6UyT=6WtPfVSEg@mail.gmail.com>
Subject: Re: [PATCH 12/20] drm/radeon/radeon_cs: Fix a bunch of doc-rot issues
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_cs.c:416: warning: Function parameter or m=
ember 'backoff' not described in 'radeon_cs_parser_fini'
>  drivers/gpu/drm/radeon/radeon_cs.c:735: warning: Function parameter or m=
ember 'p' not described in 'radeon_cs_packet_parse'
>  drivers/gpu/drm/radeon/radeon_cs.c:735: warning: Function parameter or m=
ember 'idx' not described in 'radeon_cs_packet_parse'
>  drivers/gpu/drm/radeon/radeon_cs.c:735: warning: Excess function paramet=
er 'parser' description in 'radeon_cs_packet_parse'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Function parameter or m=
ember 'p' not described in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Function parameter or m=
ember 'cs_reloc' not described in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Function parameter or m=
ember 'nomm' not described in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function paramet=
er 'parser' description in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function paramet=
er 'data' description in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function paramet=
er 'offset_start' description in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function paramet=
er 'offset_mask' description in 'radeon_cs_packet_next_reloc'
>  drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function paramet=
er 'reloc' description in 'radeon_cs_packet_next_reloc'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied with some minor fixups.

Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_cs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/=
radeon_cs.c
> index 21ce2f9502c09..729939df29cc5 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -408,6 +408,7 @@ static int cmp_size_smaller_first(void *priv, struct =
list_head *a,
>   * cs_parser_fini() - clean parser states
>   * @parser:    parser structure holding parsing context.
>   * @error:     error number
> + * @backoff:   indicator to backoff the reservation
>   *
>   * If error is set than unvalidate buffer, otherwise just free memory
>   * used by parsing context.
> @@ -723,8 +724,9 @@ int radeon_cs_ioctl(struct drm_device *dev, void *dat=
a, struct drm_file *filp)
>
>  /**
>   * radeon_cs_packet_parse() - parse cp packet and point ib index to next=
 packet
> - * @parser:    parser structure holding parsing context.
> + * @p:         parser structure holding parsing context.
>   * @pkt:       where to store packet information
> + * @idx:       packet index
>   *
>   * Assume that chunk_ib_index is properly set. Will return -EINVAL
>   * if packet is bigger than remaining ib size. or if packets is unknown.
> @@ -829,11 +831,9 @@ void radeon_cs_dump_packet(struct radeon_cs_parser *=
p,
>
>  /**
>   * radeon_cs_packet_next_reloc() - parse next (should be reloc) packet
> - * @parser:            parser structure holding parsing context.
> - * @data:              pointer to relocation data
> - * @offset_start:      starting offset
> - * @offset_mask:       offset mask (to align start offset on)
> - * @reloc:             reloc informations
> + * @p:                 parser structure holding parsing context.
> + * @cs_reloc:          reloc informations
> + * @nomm:              never actually used
>   *
>   * Check if next packet is relocation packet3, do bo validation and comp=
ute
>   * GPU offset using the provided start.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
