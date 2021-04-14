Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FEA35EF01
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 10:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349867AbhDNICt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 04:02:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56155 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349857AbhDNICo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 04:02:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id WaTYlzhQ4nzKoWaTblZqxd; Wed, 14 Apr 2021 10:02:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618387340; bh=eLYWvFJsLRWSZnDgFC4HWwA6Ar/qN3NYs7CsRsakJ4A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JneEJWiXKH+P9ZzWyyxbtrHQc7c7FRECZhXacg2tiJ8c37MC+o3y7NmDVvxN1vmfv
         kZNuLUZq7smq4FxM5yCjgUXlJiX/4vBCIukm6+G7zLcJFoF8r7A3tEEyiNXFe0QaJB
         8QT4ngpkQk+1OT45vYbbYqkYLV3Zb5/wFBfnZBIe+ZiaOPir4t4Hkip7kBnLG+uo2D
         pD9Bb6P5vtAPFD4tRRXOA369m8OSODK6XeSTLM4CcnXCB7nuqdlI27C2uGOMgSxIVy
         TfrMR9mBI7Eh6nk9eICYMVkAjdNxtoCC8YaXOXIsDzg/u/MeK6UfNhuRoWYSmNRM/6
         Lj+2G2PaaCKDg==
Subject: Re: [PATCH] staging: media: omap4iss: Remove unused macro functions
To:     ascordeiro <alinesantanacordeiro@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20210412134253.GA19402@focaruja>
 <03549d0e-04d9-6d37-93e3-c09b29ce53aa@xs4all.nl>
 <4e2f52124b29b3ed6c3f7f645f067c503c7cf4cf.camel@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ba6a1424-a624-f808-bc9e-477e75348844@xs4all.nl>
Date:   Wed, 14 Apr 2021 10:02:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <4e2f52124b29b3ed6c3f7f645f067c503c7cf4cf.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPEoSb3gkMUCu+Uq81wGwtZ/9iDWgot0m+ucFtrCGFCLCRdXzORvsQtiqQu/qnGppW25ZArUKwbFCd+uHaj+RObUzQPh93z75uMYjXNJ2CjPLZXOE6my
 zcGb0PG0MwEw6iH60BNGNQSwG5aLTkv1chA199lHguSNM2ew46xyoZWg9mG0TSmHryy64x/vAYMZaR6fL/JTqqu23ZcW3bm4eYGe1kvLdoD4XVtuf3nxgyyK
 sbOXs8al7ebDZ94BO1ihAn5ZGlBjl01LK8vopdSRBBRUN0hYZ6wmsK5n50PNzMPWZQMIzYF+9SD0dmKTn+bbTkPNOYhxibDiPXeTF8CxNp2ktjoiD+3LM6a/
 Oa0WaK6Mx3g4TnvjqzzAQlNBp6+bE7QDtZHZDHJDmuGOcKaosWIo6iNaOxyKz9nijE+GOGu8AtaWvDCIE2hM/kyIrj4eD6/UcDR0/xXrgpU0JF3fXoMxt6eT
 n323txK4PzWYQqYsAShUq7M5CEky9FnLiR26xA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2021 20:21, ascordeiro wrote:
> Em ter, 2021-04-13 às 17:06 +0200, Hans Verkuil escreveu:
>> On 12/04/2021 15:42, Aline Santana Cordeiro wrote:
>>> Remove unused macro functions "to_iss_device()", "to_device()",
>>> and "v4l2_dev_to_iss_device(dev)".
>>
>> 'git grep to_iss_device drivers/staging/omap4iss' gives me lots of
>> hits!
>> Same for to_device. Only v4l2_dev_to_iss_device appears to be unused.
>>
>> Regards,
>>
>>         Hans
>>
> This command is really helpful, I didin't know. 
> Thank you for the tip.
> 
> May I send a v2 removing just v4l2_dev_to_iss_device?

Sure, that's fine.

Regards,

	Hans

> 
> Thank you in advance,
> Aline
> 
>>>
>>> Signed-off-by: Aline Santana Cordeiro <
>>> alinesantanacordeiro@gmail.com>
>>> ---
>>>  drivers/staging/media/omap4iss/iss.h | 8 --------
>>>  1 file changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/omap4iss/iss.h
>>> b/drivers/staging/media/omap4iss/iss.h
>>> index b88f952..a354d5f 100644
>>> --- a/drivers/staging/media/omap4iss/iss.h
>>> +++ b/drivers/staging/media/omap4iss/iss.h
>>> @@ -29,11 +29,6 @@
>>>  
>>>  struct regmap;
>>>  
>>> -#define to_iss_device(ptr_module)                              \
>>> -       container_of(ptr_module, struct iss_device, ptr_module)
>>> -#define
>>> to_device(ptr_module)                                          \
>>> -       (to_iss_device(ptr_module)->dev)
>>> -
>>>  enum iss_mem_resources {
>>>         OMAP4_ISS_MEM_TOP,
>>>         OMAP4_ISS_MEM_CSI2_A_REGS1,
>>> @@ -119,9 +114,6 @@ struct iss_device {
>>>         unsigned int isp_subclk_resources;
>>>  };
>>>  
>>> -#define v4l2_dev_to_iss_device(dev) \
>>> -       container_of(dev, struct iss_device, v4l2_dev)
>>> -
>>>  int omap4iss_get_external_info(struct iss_pipeline *pipe,
>>>                                struct media_link *link);
>>>  
>>>
>>
> 
> 

