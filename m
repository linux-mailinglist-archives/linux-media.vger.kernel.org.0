Return-Path: <linux-media+bounces-2944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51F81D384
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 11:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820061F20EDF
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 10:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC688947D;
	Sat, 23 Dec 2023 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QWTrN4ZA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB7CA6A
	for <linux-media@vger.kernel.org>; Sat, 23 Dec 2023 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703327153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoKXir54x/dEEkfvtrxnT2ENR9sxqwMkgds0ZkJeGss=;
	b=QWTrN4ZAtkjYJ/mdD9uWzvfCfrpBjo6nS1y5pcsjemDXx+jY+j6HKX4FwrzL76A+PBWDp5
	Cc+ZhkHjy7AkEeHM6HQiSYylS4iT2RM63pM/LUNkCepJ+pHyVHSg5g4Mu79mOMaERKmA/T
	bepCFLsbdxRnvat9q1FqoQoxVwGGK2w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-vqzpFJF-OkukEtQdI0CRQA-1; Sat, 23 Dec 2023 05:25:48 -0500
X-MC-Unique: vqzpFJF-OkukEtQdI0CRQA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a233627e8a5so124707066b.1
        for <linux-media@vger.kernel.org>; Sat, 23 Dec 2023 02:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703327147; x=1703931947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoKXir54x/dEEkfvtrxnT2ENR9sxqwMkgds0ZkJeGss=;
        b=nZPVeyzRaujwrQyMUIJUKNZEG1KyXpIwUCoa5++fmwdNynZ5bUFlTBFOHEY1gt2Tse
         z5TtAfsqn7wvA+wXGrG79xWLfpHCTFNDYTk5x+ZjKhyapjy9UZ9WWtLRqw1zI7XJyjRt
         wqf9rCjqqHXiPK7yv/8im4PNHmX1m6AcJgX2IOG440so1jPJNP+/gAPLUD7CkEHyFekY
         eNshqEG95nuqO5Z+DL2IZKEkyU5J3RYK9SQUeewn/knoReOmVlhgz6bOvyVzdVjwnZVI
         auJJ0a8SeSEnj5XyVzhgHpZsliBY4O7B5ClALYTU0OElVkhO6/k0ZDnFDaZwPLc1uJF6
         3UQA==
X-Gm-Message-State: AOJu0YwKw7rAsmHZ6/emixRygKtheFMZ8Do8sdL3meDJs7BqakfHW8Ic
	1fujpX0OdNBBJS1tVzqQtbICGUAEfvaVMoDcKmAXk4LjEFOaR2QPo/bq82Y/8q5Mvh0hqrRbAgc
	2B76dI4dd0wyjhYNix7a1h1xblUbQpyU=
X-Received: by 2002:a17:906:48:b0:a26:9734:d074 with SMTP id 8-20020a170906004800b00a269734d074mr1256580ejg.21.1703327147454;
        Sat, 23 Dec 2023 02:25:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfYBntxU/LEH18ZD4tGgJi1jr2AFoUSUHqm44HH3HbItCx3zDGERqgnKjQD0P1rx5/Ye1TzA==
X-Received: by 2002:a17:906:48:b0:a26:9734:d074 with SMTP id 8-20020a170906004800b00a269734d074mr1256569ejg.21.1703327146994;
        Sat, 23 Dec 2023 02:25:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ex17-20020a170907955100b00a269fa0d305sm2923466ejc.8.2023.12.23.02.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Dec 2023 02:25:46 -0800 (PST)
Message-ID: <e7a46035-9c5e-495d-8f20-73dca4fec068@redhat.com>
Date: Sat, 23 Dec 2023 11:25:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Fix spelling mistake in
 ia_css_acc_types.h
To: Randy Dunlap <rdunlap@infradead.org>,
 Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223051108.74711-1-kdipendra88@gmail.com>
 <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 06:18, Randy Dunlap wrote:
> Hi Dipendra,
> 
> On 12/22/23 21:11, Dipendra Khadka wrote:
>> codespell reported spelling mistakes in
>> ia_css_acc_types.h as below:
>>
>> '''
>> ia_css_acc_types.h:87: cummulative ==> cumulative
>> ia_css_acc_types.h:411: descibes ==> describes
>> '''
>>
>> This patch fixes these spelling mistakes.
>>
>> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> 
> This patch is an improvement so it could be merged as is IMO.
> But...
> 
>> ---
>> v2:
>>  - Previously only corrected spelling  mistake reported by checkpatch.pl.
>>  - All spelling mistakes reported by codespell are fixed.
>> v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
>>
>>  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
>> index d6e52b4971d6..1dc2085ecd61 100644
>> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
>> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
>> @@ -84,7 +84,7 @@ struct ia_css_blob_info {
>>  		memory_offsets;  /** offset wrt hdr in bytes */
>>  	u32 prog_name_offset;  /** offset wrt hdr in bytes */
>>  	u32 size;			/** Size of blob */
>> -	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
>> +	u32 padding_size;	/** total cumulative of bytes added due to section alignment */
> 
> I apologize for not looking at your v1 patch carefully.
> The comment above would be much better as
> 
> 				/** total accumulation of bytes added due to section alignment */

I agree that that is better. Dipendra can you please send a v3
using the new text suggested by Randy ?

Regards,

Hans



>>  	u32 icache_source;	/** Position of icache in blob */
>>  	u32 icache_size;	/** Size of icache section */
>>  	u32 icache_padding;/** bytes added due to icache section alignment */
>> @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
>>  };
>>  
>>  /* Acceleration firmware descriptor.
>> -  * This descriptor descibes either SP code (stand-alone), or
>> +  * This descriptor describes either SP code (stand-alone), or
>>    * ISP code (a separate pipeline stage).
>>    */
>>  struct ia_css_acc_fw_hdr {
> 


