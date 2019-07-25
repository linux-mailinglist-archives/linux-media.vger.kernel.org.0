Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4930874776
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 08:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbfGYGrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 02:47:02 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58201 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725808AbfGYGrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 02:47:02 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qXWchBe9YLqASqXWfhRkfQ; Thu, 25 Jul 2019 08:47:00 +0200
Subject: Re: [PATCH 11/12] staging: media: cedrus: Fix misuse of GENMASK macro
To:     Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1562734889.git.joe@perches.com>
 <cd543a5f26b031a0bbd3baa55e1f15813f59f107.1562734889.git.joe@perches.com>
 <be536d37a3b58557cdacd33943915d397bcb5037.camel@perches.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <14f2eda2-9f39-0b7c-fabc-bd860efae23a@xs4all.nl>
Date:   Thu, 25 Jul 2019 08:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <be536d37a3b58557cdacd33943915d397bcb5037.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBXVwhl7PyoGh7Hlw1FjrXvvJ1p514+omG88Y0Ob0C09kM/d1f/mQGakj+OLgifwvX9PflPPcNJWHsoNYwl6JxwVW6J1UV/ys10YpJcPHIckkKGi6yhP
 83U5TMAFLTRrRJe6Z2qGSUdmtYfkQQylHN2QlFKssXAaOwDEis2rZFcC6cQWYrk1ToI4dbUKjkdav7CTywVts7Z6so1iDdjnk1EONG992bLeEooJCjEvTweD
 78k+5+lM1XZc8fNHkf4DBeOlZ9s1HrA8hsI3voVAROqqS/FPCqKWyD3JCCHQG381m5a1uA2uMRI/XVnmN+qO8Wz0QAELKHeFbnTXuJK6PlaXNHmPOziJ4WQL
 nHXevkefPT8O9A4yEjCR/b17LIr87mztD5PwMaK8SmnVWn6vzCNDRusl4y9xnbxp2Lr6BR+H7/TQzvNH13J2eBfiOdJ6CBidXzKBN6noOCuHaILCovDaB0qX
 0XRyTfThgl3XjTG6iqj3arhOshgqkwYHkVgNFKXvDQOzoHmEz8SOujjpj/umUQyX/X2uioog8uoVQxJC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/24/19 7:09 PM, Joe Perches wrote:
> On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
>> Arguments are supposed to be ordered high then low.
>>
>> Signed-off-by: Joe Perches <joe@perches.com>
>> ---
>>  drivers/staging/media/sunxi/cedrus/cedrus_regs.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>> index 3e9931416e45..ddd29788d685 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>> @@ -110,7 +110,7 @@
>>  #define VE_DEC_MPEG_MBADDR			(VE_ENGINE_DEC_MPEG + 0x10)
>>  
>>  #define VE_DEC_MPEG_MBADDR_X(w)			(((w) << 8) & GENMASK(15, 8))
>> -#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(0, 7))
>> +#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(7, 0))
>>  
>>  #define VE_DEC_MPEG_CTRL			(VE_ENGINE_DEC_MPEG + 0x14)
> 
> Greg?  ping?
>  
> 

It's actually me and I'm about to pick this one up and make a PR for Mauro.

Regards,

	Hans
