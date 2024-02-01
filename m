Return-Path: <linux-media+bounces-4552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4F845670
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 12:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1D5F1C25D08
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 11:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CE515D5CC;
	Thu,  1 Feb 2024 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YkA/c1zB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492A15B99C
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706787986; cv=none; b=YCHGv1WmwifCfh025R5RqO/xllv11TKC/cdy/+j1bswXiBRKwos/RLn+aJe6V5A4Er76eMjbRtsLUocQ6e/WPPXhtHlt2tSQ46iXGRxlSE9nCKZbvEo3sNnUt9WnX0MbsynMcnqVmmD+BZ3jVqluvmOf2xBbtHp4TljIv1MdVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706787986; c=relaxed/simple;
	bh=PCTmoEAhGIAkU+ecxkdI+xMvpRrv4KNH7XyY7zkq034=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiGBi7CIuxKQ67/128iiD6Ku3tsCHYWL7k6Z9wVT5bsmgUHr2Lw7NH0u6QimmOyEy+mDZee8QjrbYboSW6+DzlfCSHjntKbxzPoNt2xq4z2K5zoxHj9Zy2FPGoUHlPI8z4MQkAVeIWIGPhFmwdlwYbXvWiWECR1x1aBqHE44d1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YkA/c1zB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706787983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwOlj23TKDj1OrvM/NgWJ02jMF+82Qtc5dAQXM+VFns=;
	b=YkA/c1zBu0aIn7rC/m+D4aL223geKarfg1vcO+LDdWaGCVMUJaogJDnbjF35D0V7GJm4nF
	svBhl39w2BRTeEwA7y2odh64e+BQiFsjfXnlzT9CWJNZ0JuK4wERbHwXq7e/TiWoDYD5hW
	Xzf83CKHJsjDIgG5nouOsadjbRMlQYE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-B892Q2pLP7ilwBfC2kH5lw-1; Thu, 01 Feb 2024 06:46:22 -0500
X-MC-Unique: B892Q2pLP7ilwBfC2kH5lw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-55fc309f67bso304799a12.3
        for <linux-media@vger.kernel.org>; Thu, 01 Feb 2024 03:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706787981; x=1707392781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwOlj23TKDj1OrvM/NgWJ02jMF+82Qtc5dAQXM+VFns=;
        b=Xmy92sJkCqR89i5ilN91u7BlTW99y+coi3cW31YrvKQut3Sf7irFkYK1aLZJuLn91l
         Up6u9TUke99lqgY4dUc49/dMOs3n3yiYOkQ3sPZnyFjScTIEv4lSnBDlbIBL72I+NCU5
         UNd2XLSxZAAzWVRX6XnkUnj8mlF0DNdr3WRB/zOHW6ZmCqVVKqqdqbgCTFmElyhvIqcy
         guErvrq9PJ33sG4rPV7kr+PhTmaY6AcoaPOBMDKqGnh8G0Mxy/gwHz8IRXhxo/5ADxKq
         Pf7vKeQq245CJgnOMQ0JoxZIDdYE55zLImQTAftlWKoCUM5GpN8BSYtVvkqHvmBrGLsx
         xJ7A==
X-Gm-Message-State: AOJu0Yy2ndtqO16N11a1slrZ7SNcQY5+ojT3Cv9+a1w/jdZHr7z1m0LU
	ccMWTQQU8P5Irjv3a45V6xjojgf7SM32XVRoijmlvf5B+Gtr7/M8F9oH3oBMHAhyxOLCfUXYBs8
	7pLZlkLFR+u34wVlpthAVKwzKBNCaS8TwCCvOOEQ3xeWzh9O+kqwmFhObbRJt
X-Received: by 2002:aa7:ccd1:0:b0:55f:19a4:e5f with SMTP id y17-20020aa7ccd1000000b0055f19a40e5fmr3222179edt.20.1706787981080;
        Thu, 01 Feb 2024 03:46:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhJ06oTbCchnR54pZMhsR0JruoLiaqLjfSvNaJhFXlxqbTi4bkyV6YBej+Y0FFFw6tR8clFg==
X-Received: by 2002:aa7:ccd1:0:b0:55f:19a4:e5f with SMTP id y17-20020aa7ccd1000000b0055f19a40e5fmr3222173edt.20.1706787980746;
        Thu, 01 Feb 2024 03:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUR69AyZLEr3bA7qaLg2KcgYHYwXq1VBRHBo/AjiqKNWxnq514zqzoZc4jotY85YP9CjldVjHcf2D2V74V7e2FnVfhsDDlFWv7thyk7WYGhdhxyksAnZyGxCo2/MzWmF0eVW2EQcJHOrsRyry/D3tLs/BOoOg/MpdfqryQwksAvWSzcge2FEcDW8HcXTpghqnC0MF2EvG+xfPHH3obEzg==
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bo12-20020a0564020b2c00b0055f63ed667esm1675362edb.57.2024.02.01.03.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 03:46:20 -0800 (PST)
Message-ID: <508f2b4d-5fbd-4389-b98f-31b9525dd7cd@redhat.com>
Date: Thu, 1 Feb 2024 12:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.8-1
Content-Language: en-US, nl
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
References: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
 <20240201071017.6032bba8@coco.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240201071017.6032bba8@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/1/24 07:10, Mauro Carvalho Chehab wrote:
> Em Sun, 31 Dec 2023 11:39:18 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi Mauro,
>>
>> Here are the atomisp changes for 6.8.
>>
>> My patches in this set been posted on the list, but only a couple of
>> minutes ago, leaving pretty much zero time for review. Sorry about that,
>> with the holidays the timing did not work out very well.
>>
>> If you don't want to take this pull-request because of this it
>> would be good if you can at least take the patches up to
>> the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
>> change. There are only 2 unreviewed patches from me in that
>> set, which fix the atomisp driver not working at all with
>> the latest media_stage/master code. And the rest of the patches
>> in that set are from others and have been reviewed by me.
> 
> We typically close the media merge window at -rc6. As I was also
> in vacations during those weeks, this PR was merged today for 6.9.

No problem, I know I was late with submitting this PR.

> Indeed the first two patches seem to be needed to fix an issue on 6.8. 
> Could you please send them to stable after their arrival at linux-next?

I'm not sure what you mean with send them to stable ?

6.8 is not released yet, so these need to be send to Linus this
cycle. What is the process for media bugfixes for the current
kernel cycle ?

Regards,

Hans



