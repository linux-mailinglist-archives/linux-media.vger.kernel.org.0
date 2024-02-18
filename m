Return-Path: <linux-media+bounces-5372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E104A85969C
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 12:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A163B1C20C86
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611CB55787;
	Sun, 18 Feb 2024 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TzL/3CN0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6040254747
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708254917; cv=none; b=pyzrLmrFHKUQla/g1KnW5MAGy9JNL7f5SZqOzSzWN31sNZ5wT44CDs4CLsIiMCMGznPTBHp5WIOxzpGaoa+U1CGb1tDlvkn6S4fPP38ufAPqszXsmaU925k0CtkBtdYW2+koZG7Hhvzdxq3GznpkCMV5PqqOvaxN1aSnUDqcENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708254917; c=relaxed/simple;
	bh=LezEEuf9Dqbqusp5kzLqGVinUXDiWpJ/TGvQJbWlJCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYCjfDG0wKHrf84975OwcwE9IggMmhrivT72ZYF82QNai5/HOJjWIGp6VxGUDTmkOJgytHh9fLY/qIMXuntCVz2PkDGvLnMoBXOKDh+iXya4k3WiVFCO1EKfrhhVbf3zf4+rkDsgR8fxJxZPj5QxRwtRDYLBW8thNFwCbhaasSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TzL/3CN0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708254915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MlRkd94bblQtjuzRhqQduRcrNd91pWMW0e9zUhSziY=;
	b=TzL/3CN0Mo1c22j9hzhIfveXsas8Wa2bUcY3QHZSwKfC9yiWQ/Lo808kzMrKqfX3AKkxSD
	Bjwlyxut0fNGZ/snltjpmkZos2IuAi5HpaHU+yUs9sNQ7qTWZYw9G/0N0Y5Xj9Vj/aLyPX
	FaPlVadnaYiM0+mNhUxT5iTuhE/gTwg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-ncYpWzBaMt6C9ftprSuHuw-1; Sun, 18 Feb 2024 06:15:13 -0500
X-MC-Unique: ncYpWzBaMt6C9ftprSuHuw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5640681bc11so887172a12.2
        for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 03:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254912; x=1708859712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MlRkd94bblQtjuzRhqQduRcrNd91pWMW0e9zUhSziY=;
        b=Zvup+uQBBzle0Hr128sOelTq1l+AjEU6/Xvq7TKecaAIacMt+VV6k2SaI8TaJ/ULUC
         7YWzIOjJ52IneIhMksJ/9erpRFbkyEDkx1ywqjOCsyp2K+SuRG6LC6+RdZSIPYrPhpGc
         5jSolemEUtqqTNglu3Q9sTC3NEmx5cMJpPZEcsNo8dVWV0oAXbUJPZZeLdb84Qf74KOW
         kNs4uFP/5jC8KMH2XyEMti3rOUs5ecVT4QbOgfcbD2h8cw4ATKm0R8pDG6CgHBYdfLzs
         TUcBoaaDCIF+lpDpRx+4IHhc+yY57MfSqMddK9lR4WEFy+TpyJqCDWqXkGHCypaeMbqR
         mWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjdCtxdaSMh6ORXSYN6HsIAOoEdYB6HFxA+6tyumiQaz6RizI/VMnPtZV0qF95foL7XSdqXZY2TDeuo0S3xTO0JtDeZYWk/+ZJL/c=
X-Gm-Message-State: AOJu0YwPHrRmhVFrHn9hvbQZnsucMZE5BXH470HzoagIZrtpb6lj5yAk
	wVbGugZvs9yzP3HL2093nrpGebET1d/1ilNpcvfDyNjD3RA8yicOaffH4JhneD9SgcqWxo3s3Tx
	dqXdx6kP4C6wWk9r+GsDZO+GBrj4GzaRcvBf9kdl3fy13giegKIPDLCs320Jf
X-Received: by 2002:a17:906:298c:b0:a3c:11a0:8d10 with SMTP id x12-20020a170906298c00b00a3c11a08d10mr7812591eje.3.1708254912631;
        Sun, 18 Feb 2024 03:15:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxa8G0JUtcjZ7ruZlVlf/Fk4NROCJWWXS8D8l+M5FiK9xwxYTGWqJRCX8P/7NZu7JJSd+EQA==
X-Received: by 2002:a17:906:298c:b0:a3c:11a0:8d10 with SMTP id x12-20020a170906298c00b00a3c11a08d10mr7812576eje.3.1708254912371;
        Sun, 18 Feb 2024 03:15:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rg14-20020a1709076b8e00b00a3d004237ebsm1835149ejc.212.2024.02.18.03.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 03:15:11 -0800 (PST)
Message-ID: <a31bb438-95b2-4874-8e57-07a72d61ce82@redhat.com>
Date: Sun, 18 Feb 2024 12:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: atomisp: Changes for libcamera support
Content-Language: en-US, nl
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240217112438.15240-1-hdegoede@redhat.com>
 <CAHp75Vf0Jm4CXig9GOu=WvqyRFj5W4U6gQsNHy48dFJrD3zb2w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf0Jm4CXig9GOu=WvqyRFj5W4U6gQsNHy48dFJrD3zb2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 2/17/24 19:53, Andy Shevchenko wrote:
> On Sat, Feb 17, 2024 at 1:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is a series of cleanups (prep work) + some small(ish)
>> changes to make the atomisp driver work with libcamera.
>>
>> This has been tested with libcamera's simple pipelinehandler
>> together with an ov2680 sensor.
> 
> With some minor comments,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you for all the reviews.

Regards,

Hans



