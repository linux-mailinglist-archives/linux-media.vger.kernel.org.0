Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552B02A3D6F
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 08:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgKCHT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 02:19:27 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55896 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbgKCHT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 02:19:26 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A37JKkv107668;
        Tue, 3 Nov 2020 01:19:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604387960;
        bh=RvTemcxFwb6ANKYNaJS+yVUIm/PEImPL07rYHwkWp7g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dm8LxJ91br/Qbedh2aaV12gCxPeoQkGFd8W28CGuDFaZLd5XMQZqTTmSvRMyVJP8/
         aH+4+NKehzfbUEkRgoQvcmT7/Eh6J6I6hKUkCPWUpINLLtn/OWjzRVuR6DX0UhWHgh
         LdWkIC7XJfuGmR3rgdunybCoS6SWxSNL+mezadq0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A37JK95033565
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Nov 2020 01:19:20 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 01:19:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 01:19:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A37JIIh009223;
        Tue, 3 Nov 2020 01:19:18 -0600
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, <hugues.fruchet@st.com>,
        <sam@elite-embedded.com>
CC:     <slongerbeam@gmail.com>, <linux-media@vger.kernel.org>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1bc29f6f-20b1-245e-c346-9c57058b9a24@ti.com>
Date:   Tue, 3 Nov 2020 09:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 29/10/2020 00:57, Jacopo Mondi wrote:
> Hi Hugues Tomi and Sam
> 
>    this small series collects Tomi's patch on adjusting htot which has been
> floating around for some time with a rework of the clock tree based on
> Hugues' and Sam's work on setting pclk_period. It also address the need to
> suppport LINK_FREQUENCY control as pointed out by Hugues.
> 
> I'm sort of happy with the result as I've removed quite some chrun and the clock
> tree calculation is more linear. All modes work except full-resolution which a
> bit annoys me, as I can't select it through s_fmt (to be honest I have not
> investigated that in detail, that's why an RFC).
> 
> Framerate is better than before, but still off for some combinations:
> 640x480@30 gives me ~40 FPS, 1920x1080@15 gives me ~7.
> The other combinations I've tested looks good.
> 
> Can I have your opinion on these changes and if they help you with your
> platforms?
> 
> I've only been able to test YUYV, support for formats with != bpp will need
> some work most probably, but that was like this before (although iirc Hugues
> has captured JPEG, right ?)
> 
> There's a bit more cleanup on top to be done (I've left TODOs around) and
> probably the HBLANK calculation should be checked to see if it works with the
> new htot values.

Unfortunately the second patch seems to break capture on AM6 EVM + OV5640. The effect is pretty odd.
The picture is very dark, with odd vertical lines, but it's still capturing something as I can see a
correctly shaped shadow of my hand if I wave my hand over the sensor.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
