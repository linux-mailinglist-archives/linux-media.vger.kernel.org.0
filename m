Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D31E5BB772
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 17:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfIWPEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 11:04:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfIWPEB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 11:04:01 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A08753B;
        Mon, 23 Sep 2019 17:03:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569251038;
        bh=D4AUVbb1yqfiIz0Sl4xICpv9sU5RBSaOWpFO0LdVlis=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=iL7ddDxEJu5DBsnWb+IJPVnRan6WM2r57qTRGtafWQLd1RnVIzt1NX76bZfHz9lNv
         vj/IFdzU5cC9I40YIcREsbWHTokLhmup+9UEXgm+WFpcyMwsQOKdR0nunxIcyGzV9h
         yvD6lxX0RrzlfF6tg3q2Ry6KgRReyU9jwRaC3y3I=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
Organization: Ideas on Board
Message-ID: <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com>
Date:   Mon, 23 Sep 2019 16:03:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas, Hans,

On 23/09/2019 15:47, Nicolas Dufresne wrote:
> Le lundi 23 septembre 2019 à 16:21 +0200, Hans Verkuil a écrit :
>> Hi all,
>>
>> Since we have three separate half-day sessions for different topics I decided
>> to split the announcement for this in three emails as well, so these things
>> can be discussed in separate threads.
>>
>> All sessions are in room Terreaux VIP Lounge - Level 0.
>> There is a maximum of 15 people.
>>
>> The second session deals with libcamera and is on Wednesday morning
>> from 9:00 to 13:00.
>>
>> Attendees for this session:
>>
>> Kieran Bingham <kieran.bingham@ideasonboard.com>

Unfortunately I can no longer attend ELCE.

(My second baby will be a bit too new for an extended stay away from home)

>> Boris Brezillon <boris.brezillon@collabora.com>
>> Alexandre Courbot <acourbot@chromium.org>
>> Tomasz Figa <tfiga@chromium.org>
>> Ezequiel Garcia <ezequiel@collabora.com>
>> Daniel Gomez <daniel@qtec.com>
>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Eugen Hristev <Eugen.Hristev@microchip.com>
>> Shuah Khan <skhan@linuxfoundation.org>
>> Helen Koike <helen.koike@collabora.com>
>> Jacopo Mondi <jacopo@jmondi.org>
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Niklas Söderlund <niklas.soderlund@ragnatech.se>
>> Hans Verkuil <hverkuil@xs4all.nl>
>>
>> If I missed someone, or you are on the list but won't attend after all, then
>> please let me know.
> 
> I would like to join this one to, as after ELCE I should have some time
> to spend on this. I understand thought hat this would make use reach
> the limit, let me know if there is any issues, I can spare my seat if
> needed.

You now have my seat, and I've just made you a required attendee to go
in my place :-D

> Nicolas Dufresne <nicolas.dufresne@collabora.com>

-- 
Regards
--
Kieran
