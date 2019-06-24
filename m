Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D1751EEF
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 01:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfFXXJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 19:09:34 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:58179 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbfFXXJd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 19:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ybCFAimgKnGfD644+HUiORlUw4LHMAcslZVJ5ERYh6w=; b=HgD8sJKur7Bf6JCWF2A1MLOIEB
        +7FiX5fRFNfXbV3bVNfAwbAc7Wyof+smcyWAG2cmaZtYlis/SV+nPoIJIZ9pLF09qGDAWh6BrCBKd
        8bm8eOz5EDsXBtYO3/XTA+PMRc3kLj0zecHsKg3FqoB3LNzRdMeax9M1Fdg/KV/yM4nCB4Bfo5Lob
        W+un7tV42fIDaIi5RhN59zfTy/4e691XXV6IptYWkSZodbqYZHRhDeUpbeANMau8LHFaugoLHGFIP
        b6+KO+Votb4+conFYSxQrb6vGU23IbJgcy/efEQDa1inMR6bhiyC9TNicalXwwOlzMa0YA/PzHcsx
        4/g+sCbg==;
Received: from mobile-access-bceedd-68.dhcp.inet.fi ([188.238.221.68] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hfY5c-00080v-0D; Tue, 25 Jun 2019 02:09:32 +0300
Subject: Re: si2168 gapped clock
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Olli Salonen <olli.salonen@iki.fi>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cdffeaf7-86cf-32d5-88c1-a6d7b07127b3@free.fr>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <8b54e64c-8a56-c917-a712-1e708f48f4b6@iki.fi>
Date:   Tue, 25 Jun 2019 02:09:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cdffeaf7-86cf-32d5-88c1-a6d7b07127b3@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 188.238.221.68
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 6/18/19 7:47 PM, Marc Gonzalez wrote:
> Hello,
> 
> In the qcom SoC, the TS interface has two modes of operation.
> 
> - with 3 signals (clk, valid, data)
> - with 4 signals (clk, valid, data, sync)
> 
> In the si2168 short datasheet, I can see a diagram with these
> 4 signals.
> 
> My question is: how do we configure the si2168 demod to be
> in the first mode or the second mode?
> 
> Is it the ts_clock_gapped parameter?
> 
> ts_clock_gapped=0 means no sync
> ts_clock_gapped=1 means with sync ???
> 
> Regards.
> 

In general for mpeg ts you will need:
data + clock + valid : when clock is running continuously
or
data + clock : when clock is running only when there is data


Valid is used to tell there is new data when clock is running 
continuously - when valid signal is not set there is no data even clock 
is running.

When only data and clock lines are used, clock is ran only when there is 
data.

Sync signal is set for beginning of every TS packet (and it is not 
hardly needed if you parse ts data by software for example).

Thus ts_clock_gapped means demod will flip clock only when there is data 
to feed ==> no need for valid signal.

Configuring demod to first *or* second mode should be just 
ts_clock_gapped=false.

regards
Antti

-- 
http://palosaari.fi/
