Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83BC0448C0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbfFMRLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:11:03 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:57829 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729189AbfFLWbU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 18:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yA9nNLv+ggo0U/wi7jTiJuN9v+3HFhI7EmVIPKSugzE=; b=1vwctjQivCOr6z3xBCkzy2cR3S
        cDGyKxczZxHasX97cvwWMc1QWdEaWdoUFmnT2Nbfv3lilmYcnVqV8DPr9rkMzqzl7chSztqYIIcSV
        I7o3k3Q8+JmAjxHiqsd9lib6nOUh4PHAIZYeedsaG8XA1sVtLLJ6+GR0VzYiSNYqWWzVFdY0wjelz
        dqmH+Q+RqOULWfqcNrAeA1f6K5HBZXJlvGGGFEEmPitMDfCCdqj7EnmUCKb6XxM4B5lwpQqhzkj6+
        eyCG64TPncsNG61hZstzU+GfPMlC8voBnS9RqN4OWTIwQ2X9zujcRbgDf3soVImMRHPSrn/Jzk8Ff
        D+wyftJQ==;
Received: from mobile-access-bceedc-73.dhcp.inet.fi ([188.238.220.73] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hbBm1-0002j4-0T; Thu, 13 Jun 2019 01:31:17 +0300
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        linux-media@vger.kernel.org
Cc:     JP <jp@jpvw.nl>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <5D015B88.14600.5E1D99A@Frantisek.Rysanek.post.cz>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <38d8a697-3e3d-68e5-f3c6-e82588515f8b@iki.fi>
Date:   Thu, 13 Jun 2019 01:31:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D015B88.14600.5E1D99A@Frantisek.Rysanek.post.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 188.238.220.73
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/12/19 11:07 PM, Frantisek Rysanek wrote:
> On 12 Jun 2019 at 1:28, Antti Palosaari wrote:
> [...]
>>
>> What is that T230C2 stick?
> JP has already explained the details, how that name was arrived at.
> As previously suggested, I can call it T230C v2 in the descriptive
> texts. I'd suggest keeping T230C2 in the USB ID macro (or suggest
> a more appropriate name for the macro).
> 
> Here in CZ, a company called Abacus imports and distributes consumer
> electronics gadgets under a private brand "EvolveO" - and this is how
> the "rebadged OEM Mygica" has reached me.
>    http://m.evolveo.com/cz/sigma-t2
> This particular T2 dongle is "allover the place" around here, no
> other dongle is this broadly available. (Well on our modest market.
> We're a nation of 10M people.)
> 
>> Naming sounds like a DVB-C2 capable, but I
>> found only T230C model from MyGica site.
>>
> The local brand's site only mentions DVB-T2.
> The 2-page "brief datasheet" of the si2168 that's publically
> available only mentions DVB-C, apart from T/T2.
> 
>> And also patch should be split to two logical parts, first add manual ts
>> frequency support to si2168 and then other patch which adds device itself.
>>
> I'll try to find some time and massage that approach into the code.
> I have read all the past attempts (example patches) and the
> maintainer's polite objections.
> 
>> And which are tuner and demod versions/revisions used for that device?
>>
> That's reported in dmesg if memory serves... I'll try to find the
> answer.
> 
> Frank Rysanek
> 

Yeah, all-in-all:
1) name it T230C v2
2) use manual ts clock speed

And according to old usb sniffs from pctv 292e [Si2168B] default manual 
ts clock is set to 7.2MHz, which means 57.6Mbit/s datarate, it should be 
quite optimal for DVB-T2 max. In theory it could be a little higher only 
when 10MHz channel bandwidth and most less error correction FEC in use. 
And currently driver is using some config that uses dynamic ts clock 
which clocks only when there is data to feed. For some reason, 
usb-ts-bridge does not understand that and manual configuration is 
needed (ts valid or ts-sync connection?). If possible use 7.2MHz, if 
not: set to 10MHz.

regards
Antti
-- 
http://palosaari.fi/
