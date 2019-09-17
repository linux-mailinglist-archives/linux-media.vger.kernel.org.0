Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67406B52C7
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 18:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfIQQRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 12:17:06 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54722 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfIQQRG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 12:17:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HGH5m5051925;
        Tue, 17 Sep 2019 11:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568737025;
        bh=WbAHk/bYtnH2mwW0/tGEvTI0+nk2woFFg905dMFbxXE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=QLYvEZO4gYfDUfS0YykpBlhIjQ/Je2AHOxa/eS+/XRlWAkedI59uvgKHg/LiNNNaC
         iaNr/3ibbEIz1/hlyhPeytd515EANhhfBVeRlOvZvbWO29ztciQsROGJzJ7cSZp9uU
         7ADruy6SkYPp3719J9qh9xedG2mlX9PVUzaYZbjw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HGH5G8068621;
        Tue, 17 Sep 2019 11:17:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 17
 Sep 2019 11:17:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 17 Sep 2019 11:17:02 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HGH4Sq084606;
        Tue, 17 Sep 2019 11:17:04 -0500
Date:   Tue, 17 Sep 2019 11:19:11 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 07/13] media: am437x-vpfe: Use a per instance format
 array instead of a static one
Message-ID: <20190917161911.tldspiynarmxd4ky@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-8-bparrot@ti.com>
 <d6aebae8-570a-284a-d336-f3a9670daa0b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6aebae8-570a-284a-d336-f3a9670daa0b@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:07:29 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > +/*
> > + * This value needs to be at least as large as the number of entry in
> > + * formats[].
> > + * When formats[] is modified make sure to adjust this value also.
> > + */
> > +#define VPFE_MAX_ACTIVE_FMT	10
> 
> I recommend adding something like:
> 
> #if ARRAY_SIZE(formats) > VPFE_MAX_ACTIVE_FMT
> 	#error must update VPFE_MAX_ACTIVE_FMT
> #endif
> 
> to am437x-vpfe.c.
> 
> Or something along those lines. Don't rely on just the comment :-)

I remeber doing this a while back for another driver.
Not sure if you ever treid this or not but "#if ARRAY_SIZE()" construct
does not work because the ARRAY_SIZE() macro which needs to evaluate
sizeof() generates the following compiler error:

In file included from ../include/linux/delay.h:22,
                 from ../drivers/media/platform/am437x/am437x-vpfe.c:23:
../include/linux/kernel.h:47:26: warning: "sizeof" is not defined,
evaluates to 0 [-Wundef]
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
                          __must_be_array(arr))

So no luck there. But I remembered also how I previously fixed it.
In this case if instead of leaving the formats[] definition with empty
brackets you actually used the same defined value like
formats[VPFE_MAX_ACTIVE_FMT] then if you inadvertantly add more enties in
the table then the value of VPFE_MAX_ACTIVE_FMT then you'll get series of
compile time warnings like this:

drivers/media/platform/am437x/am437x-vpfe.c:108:5: warning: excess elements
in array initializer
  }, {
     ^
drivers/media/platform/am437x/am437x-vpfe.c:108:5: note: (near initialization
for ‘formats’)
drivers/media/platform/am437x/am437x-vpfe.c:115:5: warning: excess elements
in array initializer
  }, {

etc...

So this is how I will address this.

Benoit

> 
> Regards,
> 
> 	Hans
> 
