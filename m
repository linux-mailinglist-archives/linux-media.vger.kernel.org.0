Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 576C942B99
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440419AbfFLQAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 12:00:07 -0400
Received: from jp.dhs.org ([62.251.46.73]:45924 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440381AbfFLQAG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 12:00:06 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hb5fO-00016J-47; Wed, 12 Jun 2019 18:00:02 +0200
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
From:   JP <jp@jpvw.nl>
To:     Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Cc:     Jan Pieter <raslal@live.com>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <19441adb-1061-80f4-4ab1-1b12591425a7@jpvw.nl>
 <7722d8c1-90eb-2067-d711-4faf4c4851c3@iki.fi>
 <c8a135b1-a107-bd58-c1c0-4fce93a43b1e@jpvw.nl>
Message-ID: <2147cc85-393a-c6cf-b275-3d3a59f4d842@jpvw.nl>
Date:   Wed, 12 Jun 2019 18:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c8a135b1-a107-bd58-c1c0-4fce93a43b1e@jpvw.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> It is the default in all the si2168 drivers, but the signal is lost 
> somehow in this hw version of the t230c v2. The clock is 0 (null) Mhz! 
> So, no data *at all* without setting it manually. IMy best guess is 
> that it was a design flaw.
>

I meant it is the default value for the SI2168D. I'll get a frequency 
counter and measure it on the TC_clock pin of the chip.

Until then,

JP
