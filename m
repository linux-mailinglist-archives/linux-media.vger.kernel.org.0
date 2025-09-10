Return-Path: <linux-media+bounces-42176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F349B51425
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277E14E4644
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADCE26A0DB;
	Wed, 10 Sep 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G01axFDA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C2264A9C
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500807; cv=none; b=aT7ZPZPHuI/aV3ukuE4i8TvZWdjGkZH92dWIkYLzsiDjzAt4Q+tNXe0b8XGkRjcbL/0FJjhTVi4CwlMR/MyNdK6OQ3u+lCJIbk6xm1Q3Oyr7+2oT5QDDeI3NiDwr5n3yI7J9n5Uy0TrdDUB/EHFd5HkBEctlQrQcYinuagmgeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500807; c=relaxed/simple;
	bh=AM6ecDY/BzU7IOAgo4VXDQb2b+R5WsrUrlNM+iL/fRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qD3U9h9f5gMbTlNEePvv2fFPgCnq96/tNkXQ9303MyCGtT2C+R+R2BUckm8vtlnYReg+5iSf/x+5IBOf9XePx3RMXDFS+4KpO8l4faYKvIS++nr9hmA6Da0ow8JPTU3PvHOv9ANC3zv9lMMp2vbF0TFtkPNWuVRbyY3pcNAaNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G01axFDA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757500804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5q2KaQ9FCADNV9sW9FGs+sLguK/FYS6euUVzkN5AZt0=;
	b=G01axFDAyOWF9mrzqx+DoEpWSB9sju8eccBlkvWl+MumZKMjATyO8CeI35VZOXvlAmQ1X2
	5foS2bMEjL0GpetoIpIJF05G0njn6t+wleJBem/ZKlBxPnl0J8ItpnU6DN3L1d44xf2Dj0
	49MakUuugcN/IuLoR7lENIA4bIBISQQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-O9Nksk53NT2rFSQMia6dvg-1; Wed, 10 Sep 2025 06:40:03 -0400
X-MC-Unique: O9Nksk53NT2rFSQMia6dvg-1
X-Mimecast-MFC-AGG-ID: O9Nksk53NT2rFSQMia6dvg_1757500802
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b96c2f4ccso39497295e9.0
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 03:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757500802; x=1758105602;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q2KaQ9FCADNV9sW9FGs+sLguK/FYS6euUVzkN5AZt0=;
        b=OwOiIibifobdqD0OdK2zVgCQxB3He9+aJ9m81W4QBV6iohkkXR0+CcvoaFAXTs+8gZ
         06AXBjRxfZ+R+OGY1X2NotNsZWA+Sv4UcF5NipU2kLm8Un5r06ny/7e5dMCsIe6hyc/1
         aFoIjBlI/WpZqrklv6mLvFFQGAkAQspmnd+SAgABrvijaXgayBbkyzsrcII6DCdLNdUh
         uaPocNUEUC5h3WATH1W9iU80UWJJP6eRK1y4CheVBOv2o8Goq+nBxJ+hFnWepYlX5JLA
         WOrpE5LbM82KqUAS7fXi3RPIndXHr1O5TIHzcer5WlgUq4taTCSHAasupGxv92bxKA21
         2ZWw==
X-Gm-Message-State: AOJu0YwHqhBbYVD/xsM2JXlInFTQ70b3j1WYfCvluYaLSiULX5K4bD1V
	cBH1z5uKKKO1U/b1RynwZARVFB8pYP9y/gLVgcUCLPalHOm3OMXRyawJG8RXm00Yfmv+fTHXet1
	JCN/W4DIvdDsSqkYQf7N04jsDJouCwXGudQmTpCwjWbu3cnlfF/n4hSUEwBVDp3QS
X-Gm-Gg: ASbGncs7nJ4zkTj/ouFHm0OZtwM9QXvfhLtmKU1EQSbl2PnNnM8/Hjgg0pwbMImHl6L
	4LXULuBSk8+z56SkoNMIk62yxE+roicR953gDduWCVdHpvJfBObcR2c0HQ74afWXgZdDmMG0/f/
	I6Fa53tM/syMtnWQ9W8axHfq1TRGyb0v6n3O/dz9ITOSJP0P8JnVKdG7RFmcGEUT3e9U6c5XR7A
	KBcH5UsF/iJkiDaQXouRvWO4mIqXpplzaBs8An3FVOaZPZWWQQ2nPVWknuzDkcpk6l4kfrC6ix/
	kanyAhpQ8pEBq7Ietr6FGZkyrZsaBmDU46oGgfcEdPeiWoU2PWlLGGEZVSfNWa39K/08wyUDyW3
	ZWMjyGQ==
X-Received: by 2002:a05:600c:6289:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45dddef8a6fmr113948225e9.34.1757500801734;
        Wed, 10 Sep 2025 03:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkP/KZy9nbL6YhJUBYb5sjiMWerny+t/R2LERpPYPfyKPsoK6p7IPiqWd4LgFNuhH/RJzCLA==
X-Received: by 2002:a05:600c:6289:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45dddef8a6fmr113947965e9.34.1757500801306;
        Wed, 10 Sep 2025 03:40:01 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-113-183.pools.arcor-ip.net. [47.64.113.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df82236c5sm23142485e9.17.2025.09.10.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:40:00 -0700 (PDT)
Message-ID: <40d4325c-4589-4ecd-9a39-5fe24c220490@redhat.com>
Date: Wed, 10 Sep 2025 12:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: mxl5005s: Replace GPLv2 boilerplate text with SPDX
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, patchwork@media-ci.org
References: <20250820125516.494408-1-thuth@redhat.com>
 <68a5ea9e.050a0220.2a8c29.7282@mx.google.com>
 <680c0aa0-fb89-480a-bd28-f33b9f3b6343@redhat.com>
 <CANiDSCsmsVaLScHdGZR8QyV7+g8RAWVyTrO=3L5yfZZqMy8wcg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CANiDSCsmsVaLScHdGZR8QyV7+g8RAWVyTrO=3L5yfZZqMy8wcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 21.59, Ricardo Ribalda wrote:
> Hi Thomas
> 
> I can restart the process, but bare in mind that its results will not
> be updated in patchwork, just in gitlab.

OK, does that mean I have to resend the patch to get it going? (I don't have 
a patchwork account...)

  Thomas

> On Tue, 9 Sept 2025 at 15:14, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 20/08/2025 17.32, Patchwork Integration wrote:
>>> Dear Thomas Huth:
>>>
>>> Thanks for your patches! Unfortunately the Media CI robot detected some
>>> issues:
>>>
>>> Please fix your series, and upload a new version. If you have a patchwork
>>> account, do not forget to mark the current series as Superseded.
>>>
>>> For more details, check the full report at:
>>> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/82873240/artifacts/report.htm .
>>>
>>> Best regards, and Happy Hacking!
>>> Media CI robot on behalf of the linux-media community.
>>>
>>> ---
>>> Check the latest rules for contributing your patches at:
>>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>>>
>>> If you believe that the CI is wrong, kindly open an issue at
>>> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
>>> to this message.
>>
>> The failure looks like a networking problem in the CI job to me... Could
>> somebody please restart that job?
>>
>>    Thanks,
>>     Thomas
>>
> 
> 
> --
> Ricardo Ribalda
> 


