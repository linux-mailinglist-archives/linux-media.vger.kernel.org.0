Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA25625C2F8
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgICOlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57963 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729404AbgICOlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 10:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599144092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dlXSpmpAiY7YS5kYtaeWA3wo80DV7Gum6Jwj3vtpgjg=;
        b=cBApgdMzStCbFy4yZlSuQ487GEoDmC6On8ildZrUvdJp42vSnvTeOY0ewFtTRJgZmhQ0R9
        M6g3nyLK/m+FANLEGQjtfzWZMNdFNmDdW8cRs3BJ2lpVznxOftk9913Rqiy8ttIuWyMqnp
        nBfE+5qiZWkiMrYvVAoU0NL5azYCyl4=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-CqVY6QY9MySDu5SCnQVyCg-1; Thu, 03 Sep 2020 10:41:31 -0400
X-MC-Unique: CqVY6QY9MySDu5SCnQVyCg-1
Received: by mail-il1-f198.google.com with SMTP id m80so2442982ilb.12
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2020 07:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dlXSpmpAiY7YS5kYtaeWA3wo80DV7Gum6Jwj3vtpgjg=;
        b=UPkDYcPf0JZrKnpthCU31HmzeUlTCL36aRF0LcAQAnx5x02Mbc8sdRFsk0cmI8wh2o
         2bZK+BAS5spBUQ/kBlgiuQ1jlvxXSRzLaXXd20pNOEgyW9IjUi2+XobKKsJpWrbTsR9+
         TfLI33q8fJxWsW9c7Wz7vrO9qe6egwyOt8Jiimc/vua3aTfNmHSZ0CKGA04yAn/Hxu50
         azyBqmHa4Mvva4l57KjKYRXrfM+uPHB1W2PCPy5GNG0GZltkLRNG7sBfXefjvnFEBP36
         +huut4MP7zOqKtZ37URHDTPEORzAYD8YNbKY7Jlevm1Ru0zlzE5KAF005DnodPPT91nM
         GfXw==
X-Gm-Message-State: AOAM5327ffnZxBWmmlIYiMoYRDCdfXbTrfIkyl5/S7XdvGL4OMkKFYgT
        HKkZFGJrQgI/4rXe9VE5JdV4DGeSpszHmvwRapGFiypTV4DO3FgB/EBCsvWunylU4WiK1M4SZ3P
        sz/hF70JNXE53PUZcoNrDZfo=
X-Received: by 2002:a92:c78e:: with SMTP id c14mr3385271ilk.3.1599144090426;
        Thu, 03 Sep 2020 07:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCAl5Mf+O6dLNF91Wu0iMCa8KPqD4EBuQd+O1BKyeEB3KAYW3jsrXGYwXNu2cuFkUA/BFcLw==
X-Received: by 2002:a92:c78e:: with SMTP id c14mr3385251ilk.3.1599144090118;
        Thu, 03 Sep 2020 07:41:30 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s16sm1403323iow.47.2020.09.03.07.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 07:41:29 -0700 (PDT)
Subject: Re: [PATCH] media: dvb-frontends/cxd2099: report errors
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     jasmin@anw.at, o.endriss@gmx.de, rjkm@metzlerbros.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200722134126.31191-1-trix@redhat.com>
 <20200903161328.62378992@coco.lan>
From:   Tom Rix <trix@redhat.com>
Message-ID: <b274b6b1-e2ac-2b68-9fb8-502255ca6982@redhat.com>
Date:   Thu, 3 Sep 2020 07:41:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200903161328.62378992@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/3/20 7:13 AM, Mauro Carvalho Chehab wrote:
> Em Wed, 22 Jul 2020 06:41:26 -0700
> trix@redhat.com escreveu:
>
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this error
>>
>> drivers/media/dvb-frontends/cxd2099.c:420:2: warning: Undefined
>>   or garbage value returned to caller
>>         return val;
>>         ^~~~~~~~~~
>>
>> In read_cam_control, the call to read_io can fail.
>> When it fails val is not set.
>>
>> The failure status should be returned to the caller,
>> not the unset val.
>>
>> Similar problem with read_attribute_mem
>>
>> Fixes: 0f0b270f905b ("[media] ngene: CXD2099AR Common Interface driver")
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/media/dvb-frontends/cxd2099.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
>> index f88b5355493e..9dfaf18fc4b4 100644
>> --- a/drivers/media/dvb-frontends/cxd2099.c
>> +++ b/drivers/media/dvb-frontends/cxd2099.c
>> @@ -387,12 +387,15 @@ static int read_attribute_mem(struct dvb_ca_en50221 *ca,
>>  {
>>  	struct cxd *ci = ca->data;
>>  	u8 val;
>> +	int ret;
>>  
>>  	mutex_lock(&ci->lock);
>>  	set_mode(ci, 1);
>> -	read_pccard(ci, address, &val, 1);
>> +	ret = read_pccard(ci, address, &val, 1);
>> +	if (!ret)
>> +		ret = val;
>>  	mutex_unlock(&ci->lock);
>> -	return val;
>> +	return ret;
>>  }
>>  
>>  static int write_attribute_mem(struct dvb_ca_en50221 *ca, int slot,
>> @@ -412,12 +415,15 @@ static int read_cam_control(struct dvb_ca_en50221 *ca,
>>  {
>>  	struct cxd *ci = ca->data;
>>  	unsigned int val;
>> +	int ret;
>>  
>>  	mutex_lock(&ci->lock);
>>  	set_mode(ci, 0);
>> -	read_io(ci, address, &val);
>> +	ret = read_io(ci, address, &val);
>> +	if (!ret)
>> +		ret = val;
>>  	mutex_unlock(&ci->lock);
>> -	return val;
>> +	return ret;
>>  }
>>  
>>  static int write_cam_control(struct dvb_ca_en50221 *ca, int slot,
> Hmm... Had you test this one on a real hardware? It is not
> uncommon to have some DVB devices that would fail reading
> when the firmware is on cold state.
>
> Without testing a patch like that at a real hardware, there's
> no way to know if this is intentional or if the original
> developer forgot to add a check for the error.

No, I do not have hw.  I understand your concerns, it is ok if you want to drop this patch, else i'll beef up the warnings.

Tom

>
> So, at most, it could print some warning message for
> non-zero return codes.
>
>
> Thanks,
> Mauro
>

