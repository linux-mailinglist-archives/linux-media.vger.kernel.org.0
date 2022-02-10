Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCA44B0E04
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 14:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbiBJNA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 08:00:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241893AbiBJNAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 08:00:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50627116D
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 05:00:27 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79F7193;
        Thu, 10 Feb 2022 14:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644498025;
        bh=2eaT70901tZbyvBS5skGBouyHJNVGifFg7UJM69dFhI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RR7K7GtKSx62lK0yORDEX+Y59NA7a3bRm8jvnj59BgH5kz2T5dkldCzhmrfUdF0v7
         Ea0zPwTtGhbXB3ITTwSFiZ1ebupvJd/+cv8CU40ZD00R/nbjfR0bIjhb86bXBI0w3b
         xDEqyBzXOaqYxJmNdyKsf90B/hdwzCTo/fXkXllI=
Message-ID: <5db6f493-ca45-311a-1f44-9138e01722a1@ideasonboard.com>
Date:   Thu, 10 Feb 2022 15:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20220210110458.152494-1-jacopo@jmondi.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2022 13:04, Jacopo Mondi wrote:
> v1:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249

You could rather point to lore.kernel.org, so that the intro letter and 
the discussions are also visible.

> A branch for testing based on the most recent media-master is available at
> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v2
> 
> If anyone with a DVP setup could verify I have not broken their use case
> I would very much appreciate that :)
> 
> v1 -> v2:
> - rework the modes definition to process the full pixel array
> - rework get_selection to report the correct BOUND and DEFAULT targets
> - implement init_cfg
> - minor style changes as suggested by Laurent
> - test with 1 data lane

Very nice! I tested this on TI's DRA76 EVM (CSI-2). UYVY and RGB565, 
with the following resolutions: 160 120, 176 144, 320 240, 640 480, 720 
480, 720 576, 1024 768, 1280 720, 1920 1080.

All work. The only issue I saw was that with 1024x768 and 1280x720 
there's a thin vertical purple column on the right edge.

  Tomi
