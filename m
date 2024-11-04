Return-Path: <linux-media+bounces-20800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D69BB513
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67883281E07
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F011B6CEA;
	Mon,  4 Nov 2024 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fuu/AJfv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592071B21B0
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730724709; cv=none; b=icLV1e6LwASinrDsSssCRAGDmy6g4u+eoJohsV2I3xqXuikqrBykuSPUgeTHi8Pi9dj+3GsJhaTOqBApQvc6TFMzHacGZsa3wOEOxGEPA5hZRVHt6zZb0Zi50TQhIU6hq0C5FuHnoH9Pm27BVRGyD+BHLXGC/462d9Au/6X3nqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730724709; c=relaxed/simple;
	bh=lnsqveZ0+ThHsdtgF8Ous643Z9X8+Nqxx3nDvOsyHnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tETFztRrTHlOWYs0lg7sP636cIynAPVp5b8gF9H/RpcC2D672/mVMcYvHSXlLnwzSIQ9VZbmeY0aMfi9S0F+/nzLHeSFZvUSMHhCjSLmcCNyo2+dNZaqq57UeVd/EmOq7TaGrbKr7fZQkX3xNv0if47MiFjDq20MChlnj92mcLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fuu/AJfv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730724707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kay/f3QkJEzZ7UZJfgDuT/JkoWB8O0jH5vqtmG6BCFY=;
	b=fuu/AJfvR8FRcPwF2f64vuZJ7DtHsr6nbzRjtQndwFyJGQ8dYEnnUNWnfG/+fZHYBKNB8E
	8GMjb3hha+RzvVtgEomeNcu1D6PI8DsArRofiU272CI/33qrpL7ljM8MU8BO+jfFmLpLAm
	bLWsy0mRqcbEiQBY83pMFhLYQdt0KB0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-PEzuLNw2NwCds6OAmx5Rjg-1; Mon, 04 Nov 2024 07:51:46 -0500
X-MC-Unique: PEzuLNw2NwCds6OAmx5Rjg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9adb271de7so335957366b.0
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 04:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730724705; x=1731329505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kay/f3QkJEzZ7UZJfgDuT/JkoWB8O0jH5vqtmG6BCFY=;
        b=Kq0kl+LPQHHFwxUewgYH6qbQbd//7FgEMZeaeowcAdCg5ZvHkmFVCd8bZuJHloqDnK
         ZmjD0nG3YBA7Tj0LUh2yQ4RATRvfEBUnhRuLuKRTOyjHmN/xgz8efqMc7R69DGgoQZCy
         /2qjO04fIPY4DxWVcg0sG0w+UIIGSXJYxFVhdgjitBAiNKCHkd6PAdVR8cHX2TGT8dJI
         qcq0dgUWFy49/sKBFs0rWHArGMNo1aJVWwG9Q8OzLWSujXdBJECYCKDlyzhL6eFS1Fwy
         DlxD1bQhlqEWtFD5CdKtolQ9JwCX32KNeQMyERl8wZXC3UvMt6l2qUX0US16JerAng1m
         VwiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVms7fxRONQyZ2YYBaIJeR4qNNHmy6vmzAPF7Su3FdS8bHa6ndFZjhpOSUDBMLbhkQf4V8XgUafFxi8pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdni4lfSBhk6Qo3LgNHMjGER3i6TTcOM8PkanY6nnR68bHuaJ
	Ac5RH8sO8W7NxAGjXWDpdpRwIuz9Bf8rMkw3ihgSQDfSC3y0TZ5Se3KuhKkSX+3m10obwR40rdn
	F/v0wjB+mLaYjBhzT5yEDeN1ulqp1J8BE1yysq/5dbC6+jBhEdY28fZ7Cw4y4
X-Received: by 2002:a17:907:940e:b0:a9a:b70:2a92 with SMTP id a640c23a62f3a-a9de5ecc46bmr3272712266b.16.1730724704656;
        Mon, 04 Nov 2024 04:51:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqeb1LzuRpJ7Mr3jNNDRouhRr6mOiie/34XpsMMVa+S06Kid3Nvi2/6g2auX8Xxu/q/b9OzQ==
X-Received: by 2002:a17:907:940e:b0:a9a:b70:2a92 with SMTP id a640c23a62f3a-a9de5ecc46bmr3272709166b.16.1730724704235;
        Mon, 04 Nov 2024 04:51:44 -0800 (PST)
Received: from [192.168.100.203] ([109.37.147.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56681c1asm547886666b.213.2024.11.04.04.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:51:43 -0800 (PST)
Message-ID: <c2dc7fa6-b455-4964-a1e7-555dd0c01916@redhat.com>
Date: Mon, 4 Nov 2024 13:51:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information
 boilerplate
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Bergh <bergh.jonathan@gmail.com>,
 Roshan Khatri <topofeverest8848@gmail.com>,
 Dipendra Khadka <kdipendra88@gmail.com>,
 Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Kartik Kulkarni <kartik.koolks@gmail.com>,
 Kathara Sasikumar <katharasasikumar007@gmail.com>,
 Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
 <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
 <CAHp75VdscXFTB+mfUgKBnut3_idT88mas20ZsohSd6nrcVOnFA@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdscXFTB+mfUgKBnut3_idT88mas20ZsohSd6nrcVOnFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 4-Nov-24 1:30 PM, Andy Shevchenko wrote:
> On Mon, Nov 4, 2024 at 1:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 23-Sep-24 12:53 PM, Andy Shevchenko wrote:
>>> We have the respective SPDX identifiers that are already being applied
>>> to the files in question. Remove the License information boilerplate.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Thank you for your patch(es).
> 
> Thank you!
> 
> There is one patch (marked rft) left in the queue. Can you, please,
> apply it locally to your branches which you use to test AtomISP with?
> I'm talking about 20240923085652.3457117-1-andriy.shevchenko@linux.intel.com.

Yes I noticed that one myself too. But atm I'm at the co-working and
I wanted to get the pull-req for 6.13 out the door (it already is
a bit late and I hope it will still make it).

I have just added this to my personal repo and I'll try to give it
a test spin soon.

Regards,

Hans




