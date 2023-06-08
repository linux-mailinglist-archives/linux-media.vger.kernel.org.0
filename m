Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D14728271
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 16:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbjFHOO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 10:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjFHOO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 10:14:27 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E812728
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 07:14:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-97458c97333so117132566b.2
        for <linux-media@vger.kernel.org>; Thu, 08 Jun 2023 07:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686233664; x=1688825664;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ure4WURoJgD/KuV6clLqTw69c+qcE5MSg2WPSkGpjiw=;
        b=gbtjBhn/7WHMPDZM3fUd3Vyh4JKoRD8yvCN+VeKKvBQByNUt+i/IYZxrQdWxKx7VnA
         Zyb26MS9Z0GKwNo5jA5mm4LhuBuJ4i7xyRwjW3UfsHl0QB49yuKOK0Be+TQ9POTvRxcJ
         ZMwU+thCMW8ycYOL6iEISy5dGdAbbUh98A0O0Hy7uDflUhPdUpN50H4ZUCDj47aKweRC
         iXMC6oxXBoRj2s0/1f5V1+DgyVnIhLZO8BKf9NjotCUWn0j4lkIPXmfVo3gwyMVRpi+x
         LwF6ENtiArT6Ans9UOTK1yZ6lTvgXyPdfe1iJ9GyGDC9m86yXxggIxP68tfScO+qmie2
         k2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686233664; x=1688825664;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ure4WURoJgD/KuV6clLqTw69c+qcE5MSg2WPSkGpjiw=;
        b=J8OQstcD2v437kIDgXWL0kV2UV3E/akEqVyEWIFlCBhGAW/cU/MEiqwTOk6buhF6eb
         qHZ4KBuF9zaU4pzst/Ama5LZmmNU8pf97P/zGGgs7CkJXxi0NdBH6eEN2DgdTKq2yhcW
         rRC9QhNho/8Gsm4mzUcjMLzYX2yp8aPkz4lGdU427sSFm7Bb3IFjsBQjxJ+8rgwuigS+
         F9mBSCOV5C0II8IiPQH1Cy4liZ4kfp56p+jazjy7kI+6nO+KCM9FmSeT+kiVH0Lsyy0+
         fzZONo3sk0AKHWKcq6V1leOcNFg7EEAL5noQ2CFOa2JVW/iu897llIisIJID0GEPXOrp
         kA5w==
X-Gm-Message-State: AC+VfDzORvoW+IWEiRpuQPv8LEU7Dg/TE94o/j6VTBTyU3YMOhd3czpB
        2bnHZD3/Qypo4S+7cWB/axVadA8a/H7U/g==
X-Google-Smtp-Source: ACHHUZ4mJDu1yQzUfCnkaJiOrMGlikc0aS2iEtV4/vvPZ2133qW+nRCBCoLhPOXLXwspcjTCxFnxGg==
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id gn26-20020a1709070d1a00b00974419d7847mr9622597ejc.71.1686233664413;
        Thu, 08 Jun 2023 07:14:24 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-50-121.cust.vodafonedsl.it. [188.217.50.121])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906594800b00977cc3d37a2sm743665ejr.133.2023.06.08.07.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 07:14:23 -0700 (PDT)
Date:   Thu, 8 Jun 2023 16:14:22 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: drivers/media/i2c/imx290.c
Message-ID: <ZIHiPhyQ7jxLuih1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hello Manivannan/Laurent,

Theme is: drivers/media/i2c/imx290.c


Taking this driver as reference for some part of the Alvium
driver I found some doubts:

1)----------------


Into imx290_set_stream

Lock is taken using:

state = v4l2_subdev_lock_and_get_active_state(sd);

but v4l2_subdev_unlock_state is never called except
that something fail during the stream_on.
This not cause a deadlock in your side?
I'm missing something?


2)----------------

imx290_ctrl_update has format param that is never used,
or I'm wrong?

-----------------

Thanks in advance for clarify this! :)

Regards,
Tommaso
