Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22EE402184
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 01:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbhIFXwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 19:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhIFXwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 19:52:51 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC89C061575;
        Mon,  6 Sep 2021 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=fKEBYU/1ZJq9qU1yfzo6ELrm6MOqSHmyiSEEjShfriw=; b=l87hNPQsCv8nyeuirNKOQ6oWHD
        W9d0jm8OV522UIln8Qw7xz8LXkUUfmxFaboTd1vCjmFD9eiaDNA4i3sl4NdvHOBHzePF4Dmh73YZX
        FHb+5Y6grO0gtubsb4rx6B1nwyJWd5wIei3dYUPkpSJi1NWEFhbLxw/oh2g1L3CEamBYJJsBfSkb5
        ccOFpUH4M4LpU5idfpkfEB8YsM+I7FwVOBi/IDpiU/qJYkC6XPQmRaiI8s6jeTJLM44r4rpxHemtc
        HARvBSd5sSe5ONu2VVspisAORX0ov3Z1STTewIId60qH/Q00jXtYyPlxsVmOEIZFRKn/IMVOxOwfH
        qgIp1WGg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNOOs-0025yv-Rt; Mon, 06 Sep 2021 23:51:42 +0000
Subject: Re: [PATCH] media: s5p-jpeg: change "RST" to "RSET" to fix build
 warnings
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-media@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org
References: <20210905235715.12154-1-rdunlap@infradead.org>
 <20210906085153.58edc116@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9f9f7b51-6916-5842-06c3-b7eb9026908b@infradead.org>
Date:   Mon, 6 Sep 2021 16:51:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210906085153.58edc116@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/5/21 11:51 PM, Mauro Carvalho Chehab wrote:
> Em Sun,  5 Sep 2021 16:57:15 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> The use of a macro named 'RST' conflicts with one of the same name
>> in arch/mips/include/asm/mach-rc32434/rb.h. This causes build
>> warnings on some MIPS builds.
>>
>> Change the use of RST to the name RSET.
>>
>> Fixes these build warnings:
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:14:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>>        |
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-s5p.c:13:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c:12:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   drivers/media/platform/s5p-jpeg/jpeg-core.c |    2 +-
>>   drivers/media/platform/s5p-jpeg/jpeg-core.h |    2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> --- linux-next-20210903.orig/drivers/media/platform/s5p-jpeg/jpeg-core.c
>> +++ linux-next-20210903/drivers/media/platform/s5p-jpeg/jpeg-core.c
>> @@ -1203,7 +1203,7 @@ static bool s5p_jpeg_parse_hdr(struct s5
>>   			break;
>>   
>>   		/* skip payload-less markers */
>> -		case RST ... RST + 7:
>> +		case RSET ... RSET + 7:
>>   		case SOI:
>>   		case EOI:
>>   		case TEM:
>> --- linux-next-20210903.orig/drivers/media/platform/s5p-jpeg/jpeg-core.h
>> +++ linux-next-20210903/drivers/media/platform/s5p-jpeg/jpeg-core.h
>> @@ -40,7 +40,7 @@
>>   #define TEM				0x01
>>   #define SOF0				0xc0
>>   #define DHT				0xc4
>> -#define RST				0xd0
>> +#define RSET				0xd0
>>   #define SOI				0xd8
>>   #define EOI				0xd9
>>   #define	SOS				0xda
> 
> I don't like this change, for a couple reasons:
> 
> 1. the JPEG marker is "RST" (actually, "RST0") instead of "RSET"
>     (see pag. 36 https://www.w3.org/Graphics/JPEG/itu-t81.pdf). The
>     close it sticks with the JPEG standard, the better;

It looks like RST0 would work fine here.
[builds] Yes, it does.

> 2. better to add a namespace here, as other JPEG markers like SOS,
>     SOI and EOI seems to have a high chance of happening somewhere
>     else on other kernel headers in the future.

Makes sense.

> So, IMO, the best would be to rename all those markers as a hole, with
> something similar to:
> 
> 	$ for i in TEM SOF0 DHT RST SOI EOI SOS DQT DHP; do sed "s,\b$i\b,JPEG_MARKER_$i,g" -i drivers/media/platform/s5p-jpeg/*.[ch]; done
> 
> and manually adjust the patch, as at least this hunk could be
> improved:
> 
> 	@@ -187,11 +187,11 @@ struct s5p_jpeg_marker {
> 	  * @fmt:       driver-specific format of this queue
> 	  * @w:         image width
> 	  * @h:         image height
> 	- * @sos:       SOS marker's position relative to the buffer beginning
> 	- * @dht:       DHT markers' positions relative to the buffer beginning
> 	- * @dqt:       DQT markers' positions relative to the buffer beginning
> 	- * @sof:       SOF0 marker's position relative to the buffer beginning
> 	- * @sof_len:   SOF0 marker's payload length (without length field itself)
> 	+ * @sos:       JPEG_MARKER_SOS marker's position relative to the buffer beginning
> 	+ * @dht:       JPEG_MARKER_DHT markers' positions relative to the buffer beginning
> 	+ * @dqt:       JPEG_MARKER_DQT markers' positions relative to the buffer beginning
> 	+ * @sof:       JPEG_MARKER_SOF0 marker's position relative to the buffer beginning
> 	+ * @sof_len:   JPEG_MARKER_SOF0 marker's payload length (without length field itself)
> 	  * @size:      image buffer size in bytes
> 	  */
> 
> to avoid repeating the word marker.

OK, I can do that.

thanks.

-- 
~Randy

