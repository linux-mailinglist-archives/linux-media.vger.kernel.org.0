Return-Path: <linux-media+bounces-23940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1999F94BA
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 405FB7A52D5
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCCE21885B;
	Fri, 20 Dec 2024 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FMwMkJSe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6E21884A
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705840; cv=none; b=Gx4zuXdb2VGJJK31Byfl4evUGJwyGjpriJfujkxHreRwK704fZzMD+nzHlEnf+ENecNC+NKDExrP4p5Jyz4CiWpyIRUHRT/gLHfI33/ckS3RSNMDVWsllX3mWB03/xmxC8OJ1vhMmmR49FRsQWHiT9RtEJ97X2Htghf06Z2T4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705840; c=relaxed/simple;
	bh=cyeiuigSfEtr85twCfAVu+ZkxpmvMG5zD3gjKS6rBo0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LcfeOoqE/K+SC4Aag7aemovthh8ZTS8CkbMwuiPnYDdfgkzGqjIXy0jAGlsNyYPbDHTNEypds6Mq9QYSOEpxAeTs+349YxlOqOuWLwjFngv46p0SkwMK0FT3Y+yw7if5qEFdn01mK+I/rKpSsEhjtjOnzdZXvy+9j5+bnR8HgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FMwMkJSe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBvMAMKvwwMwHO5vTlrtYVcAPO9kTrHGZXhs4MWsOug=;
	b=FMwMkJSe6m65ToXlwzXdlOOGKL/nPMPT9ez5Vd1NObgR8si93/Au/EhoTysnyo+uvmM0dV
	BuweNtgZGcdfEOo8YXKO1VJmRlskEMc0tgg27jFciLboEgKrjr5HXLskXOGL6I2xYPP7s6
	h6f8GZWwi8mXnu+ZGNrwULAcjr07iOc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-V3O4Y7HYML-5BfSuBhvGLw-1; Fri, 20 Dec 2024 09:43:55 -0500
X-MC-Unique: V3O4Y7HYML-5BfSuBhvGLw-1
X-Mimecast-MFC-AGG-ID: V3O4Y7HYML-5BfSuBhvGLw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa6869e15ebso39602966b.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705832; x=1735310632;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBvMAMKvwwMwHO5vTlrtYVcAPO9kTrHGZXhs4MWsOug=;
        b=PRbEZpHTuwNGxnojxlyVbBmWxZQbBqB+jfKX/j3biFb5ISHCqbW5XYqG+ZKwOT2Apv
         Rq7BLx1LCjQWZJHoWSvgjRahbO7kmkalobGN0n3yqjbG9S//Osu/X28gHoGLaAi4ATIi
         eRtqk7VP/PRang48x3qpenETWS/qZ+Ugo01fhvD6to+U/uw9l/s3CoWnJLzwCjOEdcvL
         PUNqjQ7XLl3dkNjKQaSUnN3nkM5gPdjafXNYMPltwjgo+vCcUKm7E6bc+VDIszGAWoNu
         vZB3QAYzkErHMIGBP8TZ9tyL1a68AgOTSO8GuRhyb2l1w3g+QtjXdkvCJhPHbF9dmTmP
         48Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXZF6dvmf13Djq9UUcEx7baRrFHvfnEDifqX1mPE+KP6UOsyCPDen2aco9iLTTEFcFDP2Q3q4xfyEErvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyERRxC4DgpiqkL+7M8o8uh/8BF2Xwi1Vq3nBdnOG3hGkL7bkDt
	x5culWY26N9RFR52z7FE85iPPdE7LqDsoEEaGNR71kxjU5Sj0UIUwACg6c+nNOANaqoAUy6sxSk
	1bBirUmir8O+TIiMSDqO7Rnvu2ZMkdCPkBTfxlE3zdmnJudn+BH17+1prC5KH
X-Gm-Gg: ASbGncuGSW5MlofriC3SRDlFyJAVP3ldNix+oMP6LlLTROfPFBJTK89AlvKZBjdViq9
	OMvpXhjdDink/vzz7ipPOYI+I5pky9b6VUzGhXLR9tqEEsOzu3RJkTDIp+MBIhkKGomr6kWGwWQ
	QrSfnArPQjhrBY6udoO4r32WPDvq/pYVovzSaocEuTaEWLzJEuVTsRRnjClncZDtdBIScJYO3Ex
	25VjFxq4/kNAqc3eNqx1hgNvwhpvjl4/6zYt2Ve+o6vdYE9NXkUqdNSf4nhowuvmkOUu0ovCMFE
	DQNNyQJ/udrLodZDE/jxvBaOJqOPBOvLS9Wa73ORBkNeyd8kgfDmt3NTzqyFwzoxCYH5xm77v14
	YxFHA8QxuVm7yemK2pAh/GLexiozk3Ms=
X-Received: by 2002:a17:907:7ea6:b0:aa5:1d68:1f43 with SMTP id a640c23a62f3a-aac335064fcmr276304266b.11.1734705832052;
        Fri, 20 Dec 2024 06:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtKmgE0OkBVJIyPDMjDpqcnywXJoOnYMnUdHHmScRZe1UZUjXMwvykKZcUeqA7Fkj8RAtDQQ==
X-Received: by 2002:a17:907:7ea6:b0:aa5:1d68:1f43 with SMTP id a640c23a62f3a-aac335064fcmr276301766b.11.1734705831621;
        Fri, 20 Dec 2024 06:43:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f011f87sm183026966b.142.2024.12.20.06.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:43:51 -0800 (PST)
Message-ID: <bef4ccdd-3416-4a7f-81f5-49fee15a0ef6@redhat.com>
Date: Fri, 20 Dec 2024 15:43:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor
 Lake doesn't work
From: Hans de Goede <hdegoede@redhat.com>
To: "duanek@chorus.net" <duanek@chorus.net>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media
 <linux-media@vger.kernel.org>,
 libcamera-devel <libcamera-devel@lists.libcamera.org>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net>
 <361614030.100297606.1734530611240.JavaMail.zimbra@chorus.net>
 <vb66ls2rs5fnr2yj2b5wktccevmrcwq4gztlh4vtezc6hej4vm@dtduyfphcezx>
 <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net>
 <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s>
 <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>
 <a1dde87b-8b1d-4d6c-bd78-ec4e5bd78c97@redhat.com>
 <1405988041.103575290.1734655626318.JavaMail.zimbra@chorus.net>
 <9aa3ac1f-606a-4071-9321-f027a39661a3@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <9aa3ac1f-606a-4071-9321-f027a39661a3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Dec-24 3:04 PM, Hans de Goede wrote:
> Hi,
> 
> On 20-Dec-24 1:47 AM, duanek@chorus.net wrote:
>> Dear Hans,
>>
>> I appreciate your determination, and uploaded a dmesg file with "intel_skl_int3472_discrete.dyndbg" passed as a kernel parameter (I hope I did it right) to RH Bugzilla
> 
> Thanks I have posted a long comment on bugzilla, which I think can
> mostly be ignored for now, because after that comment I learned of
> a bug in my earlier attempt at fixing the ov08x40 driver thanks to
> testing of my patches on an ARM device, quoting from my last comment
> in bugzilla:
> 
> "Ugh, I just learned that my previous attempt to fix this on a "HP Spectre x360 14-eu0xxx" has a bug in one of my patches adding support to the driver to set the GPIO and clks on ACPI platforms, see:
> 
> https://lore.kernel.org/linux-media/e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com/
> 
> That might very well explain why things do not work.
> 
> So poking GPIOs manually and running i2cdetect is probably not really necessary.
> 
> Instead what is likely necessary is building a kernel with the patches from this series added:
> https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/
> 
> with the bug in that series which I linked to above fixed.

Here is a new fixed version of this patch series:

https://lore.kernel.org/linux-media/20241220144130.66765-1-hdegoede@redhat.com/

Note this patch still needs to be added on top! :
https://github.com/jwrdegoede/linux-sunxi/commit/c7803b1a32dab79f8a516e8aa9c08fb4ba74354d

Regards,

Hans




