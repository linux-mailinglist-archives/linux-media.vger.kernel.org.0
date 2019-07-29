Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2830792C4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 20:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbfG2SEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 14:04:50 -0400
Received: from merlin.infradead.org ([205.233.59.134]:49150 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbfG2SEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 14:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PPCoIvY0ptmHG65RLTTxoEUAS5Vd8DJmfHn79ns6Cz4=; b=mPD3EbJ9/PI5/IXrlCmYsVUCWK
        bj5u/rA41R+qK+5Suwzd4RJ6UfnmFTusHcHCKWuYVVutPzWtfDfV3BsMTqNYm3pvTCglimRAUC02p
        RMQPcQXEbO7fkg5kSGtkoTRCKReg5YT4bgsEiSeF42EYOZjFIuNMOP1SPcproSo2/z/kqeLFEECow
        2YERNW2E7TzQ6EgBcC/8rqUB0q1XWm/Nsrsqwf+7vvY/2o4JL437v9Ve7a1C66g7VpxVUlKRqv1KS
        v6XcKM5E5lsxQP9+sWZl4as8BZ+6hSnfB5bYb2TnDWZy4oKaPODWarVYGSaI2gwPgV0rTgbkSzWlz
        hMZrymrQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=[192.168.1.17])
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hsA0p-0004oP-I7; Mon, 29 Jul 2019 18:04:44 +0000
Subject: Re: linux-next: Tree for Jul 26 (media/usb/dvb-usb/pctv452e.c)
To:     Dominik Kuhlen <dkuhlen@gmx.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Andre Weidemann <Andre.Weidemann@web.de>,
        "Michael H. Schimek" <mschimek@gmx.at>
References: <20190726152342.2dd8b728@canb.auug.org.au>
 <782d7306-497f-7bd8-daaa-abac4fca0bdc@infradead.org>
 <201907291952.54035.dkuhlen@gmx.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7995d469-34a8-2574-5137-18a509187d23@infradead.org>
Date:   Mon, 29 Jul 2019 11:04:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <201907291952.54035.dkuhlen@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/29/19 10:52 AM, Dominik Kuhlen wrote:
> Hi Randy,
> 
> On Friday 26 July 2019 16:57:50 Randy Dunlap wrote:
>> On 7/25/19 10:23 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20190725:
>>>
>>
>> on x86_64:
>>
>> In file included from ../drivers/media/usb/dvb-usb/pctv452e.c:16:0:
>> ../drivers/media/usb/dvb-usb/pctv452e.c: In function ‘pctv452e_frontend_attach’:
>> ../drivers/media/dvb-frontends/stb0899_drv.h:139:36: error: weak declaration of ‘stb0899_attach’ being applied to a already existing, static definition
>>  static inline struct dvb_frontend *stb0899_attach(struct stb0899_config *config,
>>                                     ^~~~~~~~~~~~~~
> 
>  cat config-r6623 | grep -i pctv45
> CONFIG_DVB_USB_PCTV452E=y
> 
>  cat config-r6623 | grep -i stb0899
> # CONFIG_DVB_STB0899 is not set
> 
> -> mismatching configuration:
> The pctv452e needs the stb0899 frontend driver to work.
> And the CONFIG_DVB_STB6100 must also be set.

This build error is from a randconfig.  The Kconfig rules for this (any)
driver should not allow build errors to be generated.

For DVB_USB_PCTV452E (and probably most of drivers/media/), there is an
attempt to handle this by the use of MEDIA_SUBDRV_AUTOSELECT (which is
not set/enabled in this particular randconfig).  So I am reporting that
the Kconfig entry for DVB_USB_PCTV452E is not sufficient.
(although I expect that some people won't care)


thanks.
-- 
~Randy
