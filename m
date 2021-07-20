Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E793CF1E0
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242519AbhGTB1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:27:16 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.2]:24560 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238926AbhGTBVt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:21:49 -0400
X-Greylist: delayed 1934 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Jul 2021 21:21:48 EDT
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id AEFA8400E1049
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 19:34:29 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 5diPmJvARMGeE5diPmjU0n; Mon, 19 Jul 2021 19:34:29 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nW0eV1Ts9Idn1vqEBQVZi/l1xO20XSwEQFJm3xKZUSk=; b=OWST1RtCmqW2E+qNpLEcXgKHPn
        2nQ3Jj6ZkOiJ0pnImB633q+ECV+aJGoEnYPUpIPP3z9U4AvLwEvMparH+Ei2blHjythXiK3hLcXHj
        8u+QA5EkvY/K7rRDCZL3sDzVkvXQUS4S03TjBe3sJwZqVi2DzFl1ATHvJh2l/RCaJKjYcTHIPqqMv
        Lkz2Au0fNxfWLOlotGgbnBSzSGk3NoOieRquLnaU3W6aEUSykoEmmPR0Ye9V/VmHi2dd+1KlYGgfI
        k4QNOl1X16vHYwPyNMjODjAw+9A8JrS/BLv8o/IlTAgMI7b5sY7Xoj7b9L6MzQj090kKMbKJlaUru
        BQdFllBA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:50338 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1m5diM-0017RG-68; Mon, 19 Jul 2021 19:34:26 -0500
Subject: Re: [PATCH] media: ngene: Fix out-of-bounds bug in
 ngene_command_config_free_buf()
To:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ralph Metzler <rjkm@metzlerbros.de>,
        Matthias Benesch <twoof7@freenet.de>,
        Oliver Endriss <o.endriss@gmx.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210420001631.GA45456@embeddedor>
 <202104211039.31E9785@keescook>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <70836714-f419-8d85-a490-190bc91ba5ae@embeddedor.com>
Date:   Mon, 19 Jul 2021 19:36:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202104211039.31E9785@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1m5diM-0017RG-68
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:50338
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I'm taking this in my tree[1] for 5.14-rc3.

Thanks
--
Gustavo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/array-bounds

On 4/21/21 12:40, Kees Cook wrote:
> On Mon, Apr 19, 2021 at 07:16:31PM -0500, Gustavo A. R. Silva wrote:
>> Fix an 11-year old bug in ngene_command_config_free_buf() while
>> addressing the following warnings caught with -Warray-bounds:
>>
>> arch/alpha/include/asm/string.h:22:16: warning: '__builtin_memcpy' offset [12, 16] from the object at 'com' is out of the bounds of referenced subobject 'config' with type 'unsigned char' at offset 10 [-Warray-bounds]
>> arch/x86/include/asm/string_32.h:182:25: warning: '__builtin_memcpy' offset [12, 16] from the object at 'com' is out of the bounds of referenced subobject 'config' with type 'unsigned char' at offset 10 [-Warray-bounds]
>>
>> The problem is that the original code is trying to copy 6 bytes of
>> data into a one-byte size member _config_ of the wrong structue
>> FW_CONFIGURE_BUFFERS, in a single call to memcpy(). This causes a
>> legitimate compiler warning because memcpy() overruns the length
>> of &com.cmd.ConfigureBuffers.config. It seems that the right
>> structure is FW_CONFIGURE_FREE_BUFFERS, instead, because it contains
>> 6 more members apart from the header _hdr_. Also, the name of
>> the function ngene_command_config_free_buf() suggests that the actual
>> intention is to ConfigureFreeBuffers, instead of ConfigureBuffers
>> (which configuration takes place in the function ngene_command_config_buf(),
>> above).
>>
>> Fix this by enclosing those 6 members of struct FW_CONFIGURE_FREE_BUFFERS
>> into new struct config, and use &com.cmd.ConfigureFreeBuffers.config as
>> the destination address, instead of &com.cmd.ConfigureBuffers.config,
>> when calling memcpy().
>>
>> This also helps with the ongoing efforts to globally enable
>> -Warray-bounds and get us closer to being able to tighten the
>> FORTIFY_SOURCE routines on memcpy().
>>
>> Link: https://github.com/KSPP/linux/issues/109
>> Fixes: dae52d009fc9 ("V4L/DVB: ngene: Initial check-in")
>> Cc: stable@vger.kernel.org
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Nice find! Yeah, this looks like a copy/paste bug but it went unnoticed
> because it's occupying the same memory via the union. Heh.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> -Kees
> 
>> ---
>>  drivers/media/pci/ngene/ngene-core.c |  2 +-
>>  drivers/media/pci/ngene/ngene.h      | 14 ++++++++------
>>  2 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
>> index 07f342db6701..7481f553f959 100644
>> --- a/drivers/media/pci/ngene/ngene-core.c
>> +++ b/drivers/media/pci/ngene/ngene-core.c
>> @@ -385,7 +385,7 @@ static int ngene_command_config_free_buf(struct ngene *dev, u8 *config)
>>  
>>  	com.cmd.hdr.Opcode = CMD_CONFIGURE_FREE_BUFFER;
>>  	com.cmd.hdr.Length = 6;
>> -	memcpy(&com.cmd.ConfigureBuffers.config, config, 6);
>> +	memcpy(&com.cmd.ConfigureFreeBuffers.config, config, 6);
>>  	com.in_len = 6;
>>  	com.out_len = 0;
>>  
>> diff --git a/drivers/media/pci/ngene/ngene.h b/drivers/media/pci/ngene/ngene.h
>> index 84f04e0e0cb9..3d296f1998a1 100644
>> --- a/drivers/media/pci/ngene/ngene.h
>> +++ b/drivers/media/pci/ngene/ngene.h
>> @@ -407,12 +407,14 @@ enum _BUFFER_CONFIGS {
>>  
>>  struct FW_CONFIGURE_FREE_BUFFERS {
>>  	struct FW_HEADER hdr;
>> -	u8   UVI1_BufferLength;
>> -	u8   UVI2_BufferLength;
>> -	u8   TVO_BufferLength;
>> -	u8   AUD1_BufferLength;
>> -	u8   AUD2_BufferLength;
>> -	u8   TVA_BufferLength;
>> +	struct {
>> +		u8   UVI1_BufferLength;
>> +		u8   UVI2_BufferLength;
>> +		u8   TVO_BufferLength;
>> +		u8   AUD1_BufferLength;
>> +		u8   AUD2_BufferLength;
>> +		u8   TVA_BufferLength;
>> +	} __packed config;
>>  } __attribute__ ((__packed__));
>>  
>>  struct FW_CONFIGURE_UART {
>> -- 
>> 2.27.0
>>
> 
