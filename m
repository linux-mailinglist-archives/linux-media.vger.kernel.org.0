Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19216154E70
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 22:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbgBFV5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 16:57:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49304 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727502AbgBFV5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 16:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581026267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=10sxOSYhRMsVf98oXqVUEQI4+OBsS58gSL9iiVuqLjE=;
        b=FGZ/e3iN8XwtLsTMLyUmFaR1Yab+RnDGkVH9q2c777Xda8ALepSoXKvhyvejMMY7BUBaXa
        DhtutlXhc9icsbXcPtz2ksaJuEejp74rW+FENdaKGe61Iun9Iu6tFWkYlV+lnv0wFVyrkW
        +LNLoasvYiR+7XRLlGbJZOovfBsm0uY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-4WbJXrF1Nf2AU8fjojvISg-1; Thu, 06 Feb 2020 16:57:45 -0500
X-MC-Unique: 4WbJXrF1Nf2AU8fjojvISg-1
Received: by mail-wr1-f71.google.com with SMTP id x15so118320wrl.15
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 13:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10sxOSYhRMsVf98oXqVUEQI4+OBsS58gSL9iiVuqLjE=;
        b=c0tDGzrkxXSMjDgmvdOvASfcg4ocmh44QXdPRvHXI9y2aMIBB02fjnAHrf2cIbPnT/
         qyT8PYJbaPKkQvV0GER/50J1Top+iCN4n2dKe7xdQWbdHyFiumzkSW7xxwiLmqeZEDGB
         /jr72cmwF41RdZIDCBKjV/HjKdrDL5uZI0hyg0xYWkRcsBArlXe1F+R72k3Fa8uG1Z1x
         oqIoHLBsSgdXFbHunSPIcVuhYAyjaEIekXfkeeJomQoHjC2bEEmoV/TvqQMrzUXY4gif
         7YIhN7qxOLI2/VQBwVH9XLTWqMiLv7u4GtnnKBuzHpRr2R0YudnPCiVumG0aT2mLWZ6B
         gnTw==
X-Gm-Message-State: APjAAAWUMpPWysNuFrOe1rhoTr/QSt2jVpV0vZleq625ClKgB0URdv5P
        bsr0+XJBDQxy51xH4xfQ+fOULewB1DR7Uij/HGKm91WGUu6Dx+f2qjIuwJxyyTvzRtFoSwr9TpD
        DEsuJpYF4vSdzyrA5LqtoYcA=
X-Received: by 2002:adf:f44a:: with SMTP id f10mr112378wrp.16.1581026263797;
        Thu, 06 Feb 2020 13:57:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkLFknJmswfLS3WjKUC9icqucrhzXHz50poy/wudiPuIytWlnrCqIq9yCj0/e3FcMbZ4huIQ==
X-Received: by 2002:adf:f44a:: with SMTP id f10mr112362wrp.16.1581026263425;
        Thu, 06 Feb 2020 13:57:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56? ([2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56])
        by smtp.gmail.com with ESMTPSA id e16sm733749wrs.73.2020.02.06.13.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 13:57:42 -0800 (PST)
Subject: Re: [PATCH v2 21/27] docs: kvm: Convert locking.txt to ReST format
To:     Cornelia Huck <cohuck@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <cover.1581000481.git.mchehab+huawei@kernel.org>
 <1464d69fe780940cec6ecec4ac2505b9701a1e01.1581000481.git.mchehab+huawei@kernel.org>
 <20200206171132.4f51f17a.cohuck@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a17d6a27-0d3f-2020-7fc2-87ec20a6225f@redhat.com>
Date:   Thu, 6 Feb 2020 22:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200206171132.4f51f17a.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/02/20 17:11, Cornelia Huck wrote:
> On Thu,  6 Feb 2020 15:50:18 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
>> - Use document title and chapter markups;
>> - Add markups for literal blocks;
>> - use :field: for field descriptions;
>> - Add blank lines and adjust indentation.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> ---
>>  Documentation/virt/kvm/index.rst              |   1 +
>>  .../virt/kvm/{locking.txt => locking.rst}     | 111 ++++++++++--------
>>  2 files changed, 63 insertions(+), 49 deletions(-)
>>  rename Documentation/virt/kvm/{locking.txt => locking.rst} (78%)
> 
> (...)
> 
>> @@ -48,19 +52,23 @@ restore the saved R/X bits if VMX_EPT_TRACK_ACCESS mask is set, or both. This
>>  is safe because whenever changing these bits can be detected by cmpxchg.
>>  
>>  But we need carefully check these cases:
>> -1): The mapping from gfn to pfn
>> +
>> +1) The mapping from gfn to pfn
>> +
>>  The mapping from gfn to pfn may be changed since we can only ensure the pfn
>>  is not changed during cmpxchg. This is a ABA problem, for example, below case
>>  will happen:
>>  
>> -At the beginning:
>> -gpte = gfn1
>> -gfn1 is mapped to pfn1 on host
>> -spte is the shadow page table entry corresponding with gpte and
>> -spte = pfn1
>> +At the beginning::
>>  
>> -   VCPU 0                           VCPU0
>> -on fast page fault path:
>> +	gpte = gfn1
>> +	gfn1 is mapped to pfn1 on host
>> +	spte is the shadow page table entry corresponding with gpte and
>> +	spte = pfn1
>> +
>> +	   VCPU 0                           VCPU0
>> +
>> +on fast page fault path::
>>  
>>     old_spte = *spte;
>>                                   pfn1 is swapped out:
> 
> I'm wondering if that should rather be converted to a proper table.

Would be nicer but this is acceptable too I think.  Especially, the
monospaced font allows breaking the table and keeping the parts aligned.

But the two headers should be "CPU 0" and "CPU 1", and it's worth
changing that while we're at it.  Same for the table below.

Paolo


> 
>> @@ -99,12 +109,14 @@ Accessed bit and Dirty bit can not be lost.
>>  But it is not true after fast page fault since the spte can be marked
>>  writable between reading spte and updating spte. Like below case:
>>  
>> -At the beginning:
>> -spte.W = 0
>> -spte.Accessed = 1
>> +At the beginning::
>>  
>> -   VCPU 0                                       VCPU0
>> -In mmu_spte_clear_track_bits():
>> +	spte.W = 0
>> +	spte.Accessed = 1
>> +
>> +	   VCPU 0                                       VCPU0
>> +
>> +In mmu_spte_clear_track_bits()::
>>  
>>     old_spte = *spte;
>>  
> 
> This one as well.



