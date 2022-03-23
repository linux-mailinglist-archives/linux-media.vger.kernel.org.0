Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692704E4EB2
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 09:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238928AbiCWIwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233417AbiCWIwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 04:52:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D359C73066
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 01:51:10 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C6529DE;
        Wed, 23 Mar 2022 09:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648025468;
        bh=3a1w2mJvbK0vZMbmSBLrw8uLaOrAsrPn1W53TgmYudQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=t7lYKjWhFmQrwhgtPd7+NaiwbynAdYB2fj3s31IPk3DONhHjhaSdMqNaJGJCMfl2R
         UrLsu4jIHMVgqweIKpPG42ErsVDAgw8ymAg01RJZ5a8qC1BkDd/hhSzzSI53kq8Ns6
         nYSJVFfSb7GxfnEFKT4flmZwEIEaXRS4P7zt/F+g=
Message-ID: <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
Date:   Wed, 23 Mar 2022 10:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree programming
 for MIPI
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20220224094313.233347-1-jacopo@jmondi.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220224094313.233347-1-jacopo@jmondi.org>
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

Hi Jacopo,

On 24/02/2022 11:42, Jacopo Mondi wrote:
> v1:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> v2:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> v3:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> v4:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> 
> A branch for testing based on the most recent media-master is available at
> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5

I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It 
doesn't work. I think there are two problems:

- CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16. 
OV5640 used to support 2X8, but now it doesn't.

- OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for 
CSI-2 where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.

I'd like to just change CAL and drop the 2X8 support and instead use 
1X16, but then any sensor that uses 2X8 would work. So I guess I need to 
change the code to support both.

Anyway, both of those issues might also surface on other platforms, as 
ov5640 behavior has changed.

  Tomi
