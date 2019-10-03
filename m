Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADDECAE62
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 20:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbfJCSmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 14:42:22 -0400
Received: from jpvw.nl ([80.127.100.2]:44970 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729029AbfJCSmW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 14:42:22 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1iG63P-0001bX-Tx; Thu, 03 Oct 2019 20:42:19 +0200
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Gon Solo <gonsolo@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan>
 <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone>
From:   JP <jp@jpvw.nl>
Message-ID: <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
Date:   Thu, 3 Oct 2019 20:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003183200.GA2631@Limone>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/3/19 8:32 PM, Gon Solo wrote:
>> You could also try to disable the firmware upload at si2168 and see
>> if the si2157 reads will succeed.
> I disabled the upload and while vlc wasn't working anymore I got the
> following messages:
>
> [  168.196656] si2157 2-0063: found a 'Silicon Labs Si2147-A30'
> [  168.223009] si2157 2-0063: firmware version: 3.0.5
>
>
> It really seems that the firmware upload is the culprit.

try other firmware?
http://palosaari.fi/linux/v4l-dvb/firmware/Si2168/
>
> g
>
>

