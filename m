Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF88D4D82AD
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 13:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235339AbiCNMGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 08:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240458AbiCNMFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 08:05:33 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C60848393
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 05:02:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x15so23485466wru.13
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=jDz8t7PaEGPUjjVOQ4gUEEM7v7vA+Dg6XZWWjl+KJbY=;
        b=jWXhjb6nJF21m2w1Shqk5p4oR/vCPOaAQqjMEIZfL9uKOWBu/WVVs48fbY6YB7yCPY
         7gDzKyPmpmYUWLXSVCpp52mqs1aJ5HY+f+P67zeGzu3c/9ZOadqaOAXeDwMqZjLHlwJx
         h/XQqz8eB4o2XCHeZHcN/hsqfzOTcnH1Sl7dOw5KCChcImmMhhRATfe8ejyexdHdg/FD
         MZHP+iGzPkFFq/G4rXOLVsrfjxdOMODqZLeE6zKPnZ2ygRany06icHetHfiOm0+1OUk9
         mE4Tgjpr0XEmDS0q+OVjr7SpGmZWJOlAjmV0A7QeaTE5Mg57uf2XAyoqVpNowZAlNc/z
         U2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=jDz8t7PaEGPUjjVOQ4gUEEM7v7vA+Dg6XZWWjl+KJbY=;
        b=16i51UFzft3eGWwPIBMpnRi+9000BsGrGbo7tl3soeLBdSeWiSPXM0nepuqM5VBQC8
         OpnKW8EAeLiQJ0HfqNqQEfDA5uH0AwMDJ0ytRlAqeSVlIZGxH6bT+Xyf3Y/o8qUlafVy
         g5W5S0p35r4mzeKK9dl72ZOiYYMxuY/BPKgFZ7sAcGqyRYDrDJchuKx8Duo8y4/RQ0Y1
         aXIVUvpIIjBC4cy/5D7bUxQY2mQmm91cMRsiZOzKLQimePYw0MqbOrM+xg4XpM62FV36
         PS26AwjUobgxddSugXol3gjktG+u3wnfkI0vTCf1iFxv3XGKS6BhEooeSMd4Joqbyeb4
         IL7A==
X-Gm-Message-State: AOAM5334yBnL13rk4SdyD71NGSG8FQgJH3Ds0PFATS4sp8KwyrGCwq5C
        yWiz/NzYIkSP6E7AbIPFXOrtBL/K8nA=
X-Google-Smtp-Source: ABdhPJzVsiuDOzeWwIGeZ1UMEwNumANsjY4PLnXe1RaLX+xWNx1VqUIXkTxpPHwEHGo3BrxIk2LMXQ==
X-Received: by 2002:a5d:410c:0:b0:1ef:766b:ef5b with SMTP id l12-20020a5d410c000000b001ef766bef5bmr16090403wrp.183.1647259353987;
        Mon, 14 Mar 2022 05:02:33 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b00389e93b173dsm11039203wms.44.2022.03.14.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 05:02:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 14 Mar 2022 12:02:31 +0000
Message-Id: <CIJKPFD0TD25.GPT0DVQDQ633@arch-thunder>
Cc:     <kernel@pengutronix.de>, <linux-imx@nxp.com>,
        "Paul Elder" <paul.elder@ideasonboard.com>,
        "Sakari Ailus" <sakari.ailus@iki.fi>
Subject: Re: [PATCH 0/5] media: imx: imx-mipi-csis: Additional cleanups
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Jacopo Mondi" <jacopo@jmondi.org>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20220314103941.46021-1-jacopo@jmondi.org>
In-Reply-To: <20220314103941.46021-1-jacopo@jmondi.org>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,
Many thanks for the series on top of Laurent simplification,

On Mon Mar 14, 2022 at 10:39 AM WET, Jacopo Mondi wrote:

> As a followup of the two patches I sent in respose to Laurent's
> [PATCH 0/4] media: imx: imx-mipi-csis: Simplify PM support
> I have piled a few more cleanups for the CSIS.
>
> Jacopo Mondi (5):
>   media: imx: imx-mipi-csis: Simplify mipi_csis_s_stream()
>   media: imx: imx-mipi-csis: Drop powered flag
>   media: imx: imx-mipi-csis: Remove lock from s_stream
>   media: imx: imx-mipi-csis: Remove duplicated check
>   media: imx: imx-mipi-csis: Protect mipi_csis_dump_regs()

all look good to me:

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui
>
>  drivers/media/platform/imx/imx-mipi-csis.c | 64 ++++++++++------------
>  1 file changed, 28 insertions(+), 36 deletions(-)
>
> --
> 2.35.1



