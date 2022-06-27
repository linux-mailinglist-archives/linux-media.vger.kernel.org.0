Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436C955D0A8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbiF0NCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 09:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbiF0NCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 09:02:24 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196DB101F6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 06:01:16 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 673B583C70;
        Mon, 27 Jun 2022 15:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656334875;
        bh=fvsZdqOHcEHLRk+gSlC5dE2r+9LJ3zFrX01feX2Y0/k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=nZDGZbgTtVIBvlnkupAv0AJrRcJABnmt2HpTmD2KMGUIuUXYabCr8VMNS++nMogEU
         dIQ1VRl9/XPG3TWCFzRO6M5NcMVzXcHwKz08ddyVRGHIHGUmF6G7MQ7Uoo/fv5I9HZ
         DLXhjW5vGNHtNKdzOR3qwqEjAOGgdHcdR2lTqTiC9tr+z6Mti+q0cOuRMcRiJrlRvD
         gswIZGfEDWZJb8RxU4n+8m22ke2RIz7FFQpEpCGwbE+EX8xK+a5Hr2SqCKMnIpvAVo
         fJuf6YCnpPxGvfraL3po50bTmaTZB+DBilHSi73r0AsBnnjB2ne86U6Vdn8CvaqYgJ
         9IVAemzDSa3ZA==
Message-ID: <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
Date:   Mon, 27 Jun 2022 15:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
 <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
 <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/27/22 14:53, Hugues FRUCHET wrote:
> Hi Marek,

Hi,

> Thanks for explanation, I understand now.
> 
> Please note that dcmi is not atmel-isi.c has same code structure, hence 
> same problem:
> 
> static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
>      struct v4l2_subdev_state pad_state = {
>          .pads = &pad_cfg
>          };
> [...]
>      ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt,
> 
> 
> Moreover, searching for __v4l2_subdev_state_alloc() I see those "FIXME":
> 
> drivers/media/platform/renesas/vsp1/vsp1_entity.c
>      /*
>       * FIXME: Drop this call, drivers are not supposed to use
>       * __v4l2_subdev_state_alloc().
>       */
>      entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
>                             "vsp1:config->lock", &key);
> 
> 
> drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>      /*
>       * FIXME: Drop this call, drivers are not supposed to use
>       * __v4l2_subdev_state_alloc().
>       */
>      sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
> 
> 
> So I wonder about introducing this new change in dcmi while it is marked 
> as "FIXME" in other camera interface drivers ?

This is probably something Tomi/Laurent can answer better. It should be 
OK for this driver as far as I understand the discussion in this thread.
