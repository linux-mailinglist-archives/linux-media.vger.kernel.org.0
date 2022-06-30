Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10AFE561B82
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 15:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbiF3NmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 09:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiF3NmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 09:42:23 -0400
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E1020F55;
        Thu, 30 Jun 2022 06:42:20 -0700 (PDT)
Received: from [10.36.2.165] (unknown [178.232.223.95])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 40BEA26029F;
        Thu, 30 Jun 2022 15:42:18 +0200 (CEST)
Message-ID: <a3d44193-68f1-81a6-6baa-19e8403c5cd6@selasky.org>
Date:   Thu, 30 Jun 2022 15:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: dvb_ringbuffer : Fix a bug in dvb_ringbuffer.c
Content-Language: en-US
To:     =?UTF-8?B?7Jyg7Jqp7IiY?= <yongsuyoo0215@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20220623103543.4138-1-yongsuyoo0215@gmail.com>
 <CANXPkT49g7_YaL3rABY5Uhohz=EPgPqOL2tb6K4SHsWmshtysw@mail.gmail.com>
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <CANXPkT49g7_YaL3rABY5Uhohz=EPgPqOL2tb6K4SHsWmshtysw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/26/22 23:11, 유용수 wrote:
> Hi ~
> 
> How is this patch going ?
> Can you share current status ?
> 
> Thank you
> 

Hi Yongsu,

Linux guys can sometimes take a long time to include patches speaking 
weeks and months. For now I've added your patch to multimedia/webcamd 
(v5.17.1.1) which runs under FreeBSD 13.1 (not Linux).

https://github.com/hselasky/webcamd/commit/0e4d4959a2aea2e6a88d316eb943592fe0b23d09

--HPS
