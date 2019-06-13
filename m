Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E504470C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfFMQ4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:56:45 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:55343 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729959AbfFMBX5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 21:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DABaQWMET7hLlW30alnuWEBb6Ywn8E2RV62Kj43JMGA=; b=vH1RYhhL40KJ+2XdpfZymHILxY
        TsX8GAU/tesR41F8XoP6TbChE/zZLqZiyjnRlNQ/Lu1yfJdUPjoxahHtIutycoc4xIVsMiswHqKi0
        Jq8s0sc5jb8FHutVu5kkG1O1uD9MUJzFZBkc2/nbVRoZrlb/creZU/zXrrKDRdcO/4vPdwjmv4cSQ
        J84UR3+Jno4Lr1yMKqoGiZUaQh/HWCbht+hS8m1jiHhpNgQ76H6qvaqiZr0TKsGkBfQqF1CHM6Xik
        FXhSWNd2wGRZqgU4KIyvnuJgtPwFXlL28zlY2S5BDI0sZL2M5mFnHem/hDOCImfnhfmg3wWUuV+Y7
        kx+qPhVg==;
Received: from mobile-access-bceedc-73.dhcp.inet.fi ([188.238.220.73] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hbET4-0000Hz-Kx; Thu, 13 Jun 2019 04:23:54 +0300
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     JP <jp@jpvw.nl>, Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        linux-media@vger.kernel.org
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <5D015B88.14600.5E1D99A@Frantisek.Rysanek.post.cz>
 <38d8a697-3e3d-68e5-f3c6-e82588515f8b@iki.fi>
 <d60a351b-9bed-fbf7-b164-70337ec73a66@jpvw.nl>
 <38250cff-c758-cac8-64bf-dce679e7c826@jpvw.nl>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <ca1eada3-82bd-f03a-9441-4e494899ec04@iki.fi>
Date:   Thu, 13 Jun 2019 04:23:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <38250cff-c758-cac8-64bf-dce679e7c826@jpvw.nl>
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

On 6/13/19 4:15 AM, JP wrote:
>>> And according to old usb sniffs from pctv 292e [Si2168B] default 
>>> manual ts clock is set to 7.2MHz, which means 57.6Mbit/s datarate, it 
>>> should be quite optimal for DVB-T2 max. In theory it could be a 
>>> little higher only when 10MHz channel bandwidth and most less error 
>>> correction FEC in use. And currently driver is using some config that 
>>> uses dynamic ts clock which clocks only when there is data to feed. 
>>> For some reason, usb-ts-bridge does not understand that and manual 
>>> configuration is needed (ts valid or ts-sync connection?). If 
>>> possible use 7.2MHz, if not: set to 10MHz.
>>>
>> That's perfectly alright with me. I'm now testing that 7.2Mhz value. 
>> Hold on.
> The driver crashes with the 7.2Mhz value! That was totally not what I 
> ever expected.
> Recompiled the whole kernel: crashes again. Then tried on debian kernel 
> 4.19: same thing.
> Food for thought?

It should sure never crash the kernel. Changing a ts bitrate no, no, no, 
you trapped a hidden bug. Found where it is :]

regards
Antti

-- 
http://palosaari.fi/
