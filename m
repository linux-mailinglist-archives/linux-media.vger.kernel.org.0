Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FD864F77E
	for <lists+linux-media@lfdr.de>; Sat, 17 Dec 2022 05:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiLQEMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 23:12:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiLQEMk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 23:12:40 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3192D18B38
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 20:12:39 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so7974821pjr.3
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 20:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH65Lzu8yLs0gJVkepUjZHRstDYH/hcDoJoKZUFbNI0=;
        b=VZZXRW4I9PQi2pbj5Y12OzivoOtSdKGKXyCQxQ5m8NjibG+fHEtUA2GpOjdmFdZa64
         9D61uvDRarEr0gMPekNM40CsY+NrmD7+B17uPqk/8GZSIX1Y2RmlVAoZvYdzkoNVtmel
         WmYMFCrlJ/c2Qtd5viIPTqjrXsTJydcvKWbqI3Y3HUpiZsW4dwLAzdWRuzNryaUkSgqM
         YxxXX6VvD6PAeUuuXFdKuN5wPsuRNmtEpyqaiXskTWr9Jvj5wsvZYaIzDcxnnJf6w7T1
         yuZsRB9wsDNH1/1sttcJAkuO1RoTImQx6aznupM1NL9+lcffPNaM75Q/pmY2sIHsHPvU
         RTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH65Lzu8yLs0gJVkepUjZHRstDYH/hcDoJoKZUFbNI0=;
        b=8QwzS8TwqLIGjg0WNQUHHV+rpSt/qKv1DdMPVilgMeKzdIYUzKPblmEtDqpBjUvPOP
         ByL2HtBGFIeM6HUPbE5XPM4BCtFKXSHtfTVxEZMyN7Q1zImj/b+UykOFgerl5yTygi4M
         eJIVBeQa8Mu0yKMUdkmrEJgfV3E9aEogXYkeseaXrtAhUuOI7MU3vQ687bSdP3RjgLZa
         xHCB+BiaqQ7bR/iG7HYUHyoi9QpNSSoCkoZ90ZsDvEnIKrMNHP7gA8ok1Nt6F4SoY8dT
         srL3pNYVFxBywzaTeoLwMPeMnUDrbEhqJVCqcqQNe+QXOqOmkCKBW0HVdTXpzm0J1ne7
         rfIw==
X-Gm-Message-State: AFqh2krmOi2bUTOUBuGKc/wmfFPo/1gPpnp5f2iCphuos51/swuD3ozy
        68pvHgMgVLhRNbI6n2umQtAHgdw2wkLmCRuO
X-Google-Smtp-Source: AMrXdXtScOu3J4nT9043wO0QBOelq5bzdWwUG+cutNdvKhhdIobOxSwAaEVxgtNIm61fBcfABSBw6g==
X-Received: by 2002:a17:902:a612:b0:18c:cde:fdda with SMTP id u18-20020a170902a61200b0018c0cdefddamr801217plq.37.1671250358215;
        Fri, 16 Dec 2022 20:12:38 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b00189adf6770fsm2383636pli.233.2022.12.16.20.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 20:12:37 -0800 (PST)
Date:   Fri, 16 Dec 2022 20:12:37 -0800 (PST)
X-Google-Original-Date: Fri, 16 Dec 2022 20:12:29 PST (-0800)
Subject:     Re: [PATCH v3 00/12] Allwinner A31/A83T CSI/ISP/MIPI CSI-2 media fixes
In-Reply-To: <20221208142006.425809-1-paul.kocialkowski@bootlin.com>
CC:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev, yong.deng@magewell.com,
        paul.kocialkowski@bootlin.com, mchehab@kernel.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        thomas.petazzoni@bootlin.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, Conor Dooley <conor@kernel.org>,
        nathan@kernel.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     paul.kocialkowski@bootlin.com
Message-ID: <mhng-31391bb7-1a92-42f1-a1bb-8a41a9431ccb@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 08 Dec 2022 06:19:54 PST (-0800), paul.kocialkowski@bootlin.com wrote:
> This series resolves reported smatch warnings against the recently-introduced
> Allwinner A31/A83T CSI, ISP and MIPI CSI-2 drivers.
>
> Smatch was ran again on the updated tree and no longer shows any error or
> warning.

Thanks.  These also fix a handful of warnings I'm seeing when building 
with clang.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

> Changes since v2:
> - Added isp params pending buffer fix;
> - Added fixes tags where needed;
> - Reworded cosmetic commits;
> - Changed sunxi-isp to the proper sun6i-isp.
>
> Changes since v1:
> - Added fixes for static struct declarations;
> - Fixed ISP commit titles by replacing bridge with proc.
>
> Paul
>
> Paul Kocialkowski (12):
>   media: sun6i-csi: bridge: Fix return code handling in stream off path
>   media: sun6i-csi: bridge: Error out on invalid port to fix warning
>   media: sunxi-csi: bridge: Declare subdev ops as static
>   media: sun6i-csi: capture: Remove useless ret initialization
>   media: sun6i-mipi-csi2: Clarify return code handling in stream off
>     path
>   media: sun8i-a83t-mipi-csi2: Clarify return code handling in stream
>     off path
>   media: sun6i-isp: proc: Fix return code handling in stream off path
>   media: sun6i-isp: proc: Error out on invalid port to fix warning
>   media: sun6i-isp: proc: Declare subdev ops as static
>   media: sun6i-isp: capture: Fix uninitialized variable use
>   media: sun6i-isp: params: Fix incorrect indentation
>   media: sun6i-isp: params: Unregister pending buffer on cleanup
>
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c | 8 ++++----
>  .../media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c    | 2 +-
>  .../platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c      | 5 ++---
>  .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c     | 5 ++---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 4 ++--
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 6 ++++--
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 8 ++++----
>  7 files changed, 19 insertions(+), 19 deletions(-)
