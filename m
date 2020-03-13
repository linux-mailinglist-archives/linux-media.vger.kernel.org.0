Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4279A1845B9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCMLPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:15:43 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45646 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgCMLPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:15:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBFZvQ028353;
        Fri, 13 Mar 2020 06:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584098135;
        bh=7tkZfvNOHZxe71ShBvxWyV8f/kaONotNf9K/ix8Md60=;
        h=To:From:Subject:Date;
        b=Hh2MW16ihS8lG7CdpXc2309/anqWT+any5IYaL0s/UzCXP6Tg3ZaxO9SYl/IkLrte
         1KmhyNiKGihYGQjt6HQlgCR5XJx1/KYPhBp9/sf0CVm8QeSzfBj3glwmsDzfVJdmpG
         I6+BkQc0SHaCgGu1IBX5b0JNNL3AAGMspM7MxUHo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBFZWe039729
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:15:35 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:15:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:15:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBFXd7116374;
        Fri, 13 Mar 2020 06:15:33 -0500
To:     Benoit Parrot <bparrot@ti.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <linux-media@vger.kernel.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: OV5640 CSI2 problems
Message-ID: <d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com>
Date:   Fri, 13 Mar 2020 13:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I've been testing and debugging OV5640 with TI's DRA76 and AM65 platforms, which have the CAL IP for 
MIPI CSI2 RX.

The most clear problem is that 1280x720@30 doesn't work at all, but with all resolutions I can see 
occasional PHY errors reported when starting the streaming.

The OV5640 spec lists the video timings, but I haven't been able to figure out what exactly they 
mean, as e.g. the vsync time doesn't seem to match the other times according to my calculations.

In any case, I was poking here and there, and noticed that if I use the htot value from the spec 
(2844), instead of the current value (1896 for most resolutions), 1280x720 works, and the PHY errors 
are gone.

Testing more, I found out that the smaller the htot, the more unreliable the RX becomes, and going 
down from 2844, somewhere around 2400 I start to see errors.

I'm not that much familiar with CSI-2, and very little with OV5640. Does anyone have a clue about 
what I'm observing here? Does 1280x720@30 work on other platforms with CSI2? Where do the current 
OV5640 video timings come from?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
