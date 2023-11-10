Return-Path: <linux-media+bounces-33-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F77E7EF7
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B4CCB2153E
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2343C099;
	Fri, 10 Nov 2023 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMMAjOQF"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0453B781
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC3D39CF6
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699627952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69bK8ICNlQqDn7y6QJPQpitjK4ofoQn/7TVJxrBJwyY=;
	b=CMMAjOQFGswz35GaaU1tyLLEGkVl2vlVUu5k4ZSUUxT+fvFhC1r9dCF1ej/XHpGMx64f+L
	59PC863XxqNamnlMB5yN68+KQ50yzgqIr0NRcGnQtZmz+DKm//yJnedZ4hNw3HKZBtQ55L
	MBLcXP8m6veI8TCDkWHe8OAbptdpgNU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-6GYY8t45P_OpUaPhJUgS1A-1; Fri, 10 Nov 2023 09:52:31 -0500
X-MC-Unique: 6GYY8t45P_OpUaPhJUgS1A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9e644d94d85so75889866b.0
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 06:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699627950; x=1700232750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69bK8ICNlQqDn7y6QJPQpitjK4ofoQn/7TVJxrBJwyY=;
        b=pY8GoPUkFcS7KPqMS8KULl8mYjo+Hz+HMDcujvcbCA3y4kj8LA99H3Z3AN+o7VGvW1
         F6sKiNgl6e4yTjwWue35sE9JlmmhkkQlGlYSwUEio1CYyTU7em6NAK4j+rQv9H4kyX1l
         NDSghfS98CVWLhL1HN6OeZY6DMPqgLrVrDraDFve70T73LG6vDCuG4UcHwzjpLzq2VnH
         zhmueKaa9JejwlvaaY0KvrpCIMEVKNQs19ZXBLepVWheJTF9QfFVnlbXUI1WJcmE7sTS
         pLZiqz48YRwtUhSAMlw53CUerANSbNjE/6zQEvW/fKx9XvCQ5E4hv5kp/6WfW0/Bx0TE
         2I2Q==
X-Gm-Message-State: AOJu0Yxlne6+qs5wLcSlcrh345wSVQ4OijqFUW1RJCURSdNY5GJlm0s6
	ZjsiKUX5U4pYoC1B7YqPJ1C9v1LwH6XkxLn3D1qNFJ4oSx+8eoYWxF38fYwBIRRWtv/mKeyyHFE
	trU6TpYD5UacaiSaoXiaEKwQymZCHKYA=
X-Received: by 2002:a17:907:9809:b0:9dd:b919:79bf with SMTP id ji9-20020a170907980900b009ddb91979bfmr3002929ejc.36.1699627950059;
        Fri, 10 Nov 2023 06:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCubCi4MqoXJhavAw7qmhMP83mZyTdV0TzuvZj099cMtEgSRNcB4NfnsMZ1ZDvAGnq1Npycw==
X-Received: by 2002:a17:907:9809:b0:9dd:b919:79bf with SMTP id ji9-20020a170907980900b009ddb91979bfmr3002915ejc.36.1699627949794;
        Fri, 10 Nov 2023 06:52:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gf23-20020a170906e21700b009920a690cd9sm4026043ejb.59.2023.11.10.06.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 06:52:29 -0800 (PST)
Message-ID: <17ef8a66-4463-44e4-9f2c-6313f91421dd@redhat.com>
Date: Fri, 10 Nov 2023 15:52:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: v4l: cci: Add macros to obtain register width
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
 <553265e2-a57a-4f70-9254-f140348ed1e8@redhat.com>
 <ZU4RWhxbJyG-2lR2@kekkonen.localdomain>
 <20231110144445.GC21167@pendragon.ideasonboard.com>
 <20231110144924.GE21167@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231110144924.GE21167@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/10/23 15:49, Laurent Pinchart wrote:
> On Fri, Nov 10, 2023 at 04:44:46PM +0200, Laurent Pinchart wrote:
>> On Fri, Nov 10, 2023 at 11:17:46AM +0000, Sakari Ailus wrote:
>>> On Fri, Nov 10, 2023 at 12:14:10PM +0100, Hans de Goede wrote:
>>>> On 11/10/23 10:47, Sakari Ailus wrote:
>>>>> Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
>>>>> CCI_REG_WIDTH_BYTES() to obtain it in bytes.
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> ---
>>>>>  include/media/v4l2-cci.h | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
>>>>> index b4ce0a46092c..80eaa7fdc606 100644
>>>>> --- a/include/media/v4l2-cci.h
>>>>> +++ b/include/media/v4l2-cci.h
>>>>> @@ -40,6 +40,9 @@ struct cci_reg_sequence {
>>>>>  #define CCI_REG_FLAG_PRIVATE_END	31U
>>>>>  #define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
>>>>>  
>>>>> +#define CCI_REG_WIDTH_BYTES(x)		(((x) & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT)
>>>>
>>>> Please use FIELD_GET like v4l2-cci.c does:
>>>>
>>>> #define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, (x))
>>>>
>>>> With that fixed:
>>>>
>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> As for the patch 4 - 6, those are interesting patches but
>>>> I'm afraid I don't have time to review them.
>>>
>>> No worries, I mainly included them to have a user for the newly added
>>> features.
>>>
>>> I'll send v2 with FIELD_GET().
>>
>> With FIELD_GET(),
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Actually, how about using the new macro in v4l2-cci.c ?

I considered this too, but atm there are 2 FIELD_GET calls directly
after one another, e.g. :

        len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
        reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);

Using the macro would make this look like this:

        len = CCI_REG_WIDTH_BYTES(reg);
        reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);

Which IMHO just make this harder to read. Now if we also add a CCI_REG_ADDR macro
and use both, then using the macros would be fine ...

Regards,

Hans




