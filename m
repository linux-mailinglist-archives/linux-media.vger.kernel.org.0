Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A02483480
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbiACQD3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiACQD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:03:29 -0500
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C842C061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 08:03:29 -0800 (PST)
Received: from [10.36.2.165] (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id F21D126038C;
        Mon,  3 Jan 2022 17:03:25 +0100 (CET)
Message-ID: <56853d3b-d17f-ae5e-84a1-a6c3065aeac7@selasky.org>
Date:   Mon, 3 Jan 2022 17:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] Make sure we parse really received data.
Content-Language: en-US
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <06c00e24-cdad-8776-9fc1-2c0f3db5af9a@selasky.org>
 <CANiDSCtB=mu6wtZxkck3E0GnJT7OOVXKDe+yzEFK+ygsDwoxKg@mail.gmail.com>
 <d0090976-6d4d-ab15-dcdf-9352ed12fea7@selasky.org>
 <CANiDSCspxoJGMfaVL0eE0ob4NVuWyiMPmLV1osnLoTBOAMk7dg@mail.gmail.com>
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <CANiDSCspxoJGMfaVL0eE0ob4NVuWyiMPmLV1osnLoTBOAMk7dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/3/22 16:18, Ricardo Ribalda wrote:
>> Can you point in the code where this check is?
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/uvc/uvc_video.c#L281
> and
> https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/uvc/uvc_video.c#L291

Hi Ricardo,

After looking more closely at the code, I believe the issue I found is a 
false positive of valgrind, that doesn't see the kernel move data into 
the given location after the USB control request.

This patch can be dropped, unless you think zeroing this buffer is good 
practice, in case of future UVC descriptor parsing updates.

RET=26, SIZE=26

Thanks for looking into it.

--HPS
