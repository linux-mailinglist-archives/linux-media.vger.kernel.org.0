Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4865234960F
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 16:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhCYPu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 11:50:28 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:50871 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhCYPuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 11:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1616687408; x=1648223408;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PJSaq6SBrfJT7eP4m6kYKHp8nCSUZQCywIVVXvt1GnU=;
  b=kaz+yUL4HCb9HbT/tg7cnCEiyIe2qU8kqMdNTgfKZzeQ7hHTbqZK4kHw
   pzcdbZJ4Mh+ofVPR/7UxnP7eNykqjeJqU8O7ZUpgjOy3e9moQlkHo+0NV
   gSDp6FHWDet4JkY7TjTzUpYu7ZLTniOr55iv6HnvQgdmG1AyThXWeq5ER
   Mr+hgKDatW1Py5nOG6t5FDQazOA8cOJYcd+CEesm54mnf3m1IJlw+an9u
   eMYq4hDSAGCZ7t5+nL/j/VEcYRxo+98nVwQJElg85iJu8Esf+3Z/fJer9
   9+QVsIEEpgzzmX3gWYd5Cv3ZyHqGHLaT/kzwmroFRTt5AiM3Na5VKVGRa
   Q==;
IronPort-SDR: 52+3TdEhxR2RSpXIIiHEIbA+hoS0c4fM8zLxrxWURhsmEezLX2De/V2Y2e1duYCxarDcbyJZea
 N5xpF0Z5rVGQrDzWdWAj1i8mFNEtqMWyx1DlSbim5uxFsk7VtHMlHITJwW6f5dl47H7xGSiiDQ
 8AyDhqGGNaZr9H/pcaWjjzQSao6Whtenv+haOYj+J4GgRU05hT5HernK2IH37565bh++TBQnNj
 EYOiaGrOSFAQ6DhO8tBo/QBYrMTK1XZVhJy9vPKOoWwbglAdJsW5FuvKP1Eczn8olqyzX0aViw
 ECE=
X-IronPort-AV: E=Sophos;i="5.81,277,1610434800"; 
   d="scan'208";a="114640813"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Mar 2021 08:50:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 25 Mar 2021 08:50:07 -0700
Received: from [10.171.246.120] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 25 Mar 2021 08:50:05 -0700
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Emil Velikov <emil.l.velikov@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>,
        linux-rockchip <linux-rockchip@lists.infradead.org>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
 <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
 <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com>
 <YFxObibxqK23WTMf@piout.net>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <6567d6e3-060e-1d94-ef53-60e524bae815@microchip.com>
Date:   Thu, 25 Mar 2021 16:50:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFxObibxqK23WTMf@piout.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/03/2021 at 09:48, Alexandre Belloni wrote:
> On 24/03/2021 14:44:14+0100, Nicolas Ferre wrote:
>> Now, when we have the tag from Rob, how to coordinate these different
>> pieces? Will it go through the media git tree? Will we benefit from a stable
>> branch to share or will we just have to wait for the driver to hit Mainline
>> before adding the defconfig and DT patches?
>>
> 
> I think the defconfig and dt patches can go through at91 as soon as we
> get Rob's ack. There is no build dependency so it can be taken at any
> time. Worst case, we end up with a selected config option that doesn't
> exist.

Agreed, and it simplify things.

My only concern is with triggering some of the bots while checking for 
DT compatible string definition.

Regards,
   Nicolas



-- 
Nicolas Ferre
