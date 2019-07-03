Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C14D5DB19
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 03:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfGCBoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 21:44:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbfGCBoG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 21:44:06 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA07C20673;
        Wed,  3 Jul 2019 01:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562118246;
        bh=Tqs55O9Io8S4h3e1Skm7TpKyi39XPiXZPkjmOkOnoho=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IxEtwOx69if/WR9khsvz9C5DQJ/p+fjwHvbR3YK8x8rCzuugriw2P/WZx+sDjzCbk
         3lf5Fpk1eDmjqDZ/StAjI2fcDorO35eD4wOvV9dWkL8ubyxQYFgQJyb751XD7eQUww
         Ovc7KKHy3jPpQgc8Nfah3Tz77m7xEoqP5tadTeXY=
Subject: Re: Linux 5.2 - vimc streaming fails with format error
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        shuah <shuah@kernel.org>
References: <9ceba30b-dea6-a337-da3a-20d90398cab5@kernel.org>
From:   shuah <shuah@kernel.org>
Message-ID: <92cc3020-9017-ec85-281a-583cae5d00e8@kernel.org>
Date:   Tue, 2 Jul 2019 19:44:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9ceba30b-dea6-a337-da3a-20d90398cab5@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/23/19 9:07 AM, shuah wrote:
> Hi Hans and Helen,
> 
> vimc streaming fails on Linux 5.2-rc1
> 
> vimc: format doesn't match in link Scaler->RGB/YUV Capture
> 
> You can reproduce this easily with v4l2-ctl
> 
> Streaming works fine on Linux 5.1
> 
> I narrowed it to the following commit.
> commit b6c61a6c37317efd7327199bfe24770af3d7e799
> Author: Helen Fornazier <helen.koike@collabora.com>
> Date:   Wed Mar 13 14:29:37 2019 -0400
> 
>      media: vimc: propagate pixel format in the stream
> 
> 
> Please take a look.
> 
> thanks,
> -- Shuah
> 

Hi Hans and Helen,

Is there trick to being able to run v4l2-ctl --stream-mmap on vimc

I am seeing

VIDIOC_STREAMON returned -1 (Broken pipe)

since 5.2 and narrowed it to the above commit.

I am working on vimc life-time problem and unable test my patches
because of this commit on 5.2

thanks,
-- Shuah
