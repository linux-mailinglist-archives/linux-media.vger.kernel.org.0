Return-Path: <linux-media+bounces-5422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82C85A495
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 14:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D631C21E2F
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9254936134;
	Mon, 19 Feb 2024 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvImEqgC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0A2D05E
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349128; cv=none; b=fMPuYugr1KSt8uvysPg5DLuWuinCMmdmd5AFu2q1lRQlIPYiBES+853cz5hAAqvNK0UwcTyBBFVHw7EpZuauT1zGt+4MP5+BhBdazRoklBQ1LUsUE8iISriB4gfYfanDO07eHX303ay8BGIwfkTH4Utc2iK83vyatBEynroUpmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349128; c=relaxed/simple;
	bh=wQQHRJeKpVKzs+apITwcq3Prwh1LftubXvBNxsGEQGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goY5AJ3rj3H3/yetWyEBlMe8gA0FfQkJEfr358PDBOQBdCsw0KUcIC1rS6G0yS+jyqOooqOAZLZ8/HFWowoySOVE2HHgzazl/2iBmbUgnj2k/mBAR0AeIN3TFLMqko21Rb5+ciSY1C9HJ2WwMgwbbYFcflPx/VQhnHYQL9Op1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvImEqgC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708349125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hu3xg1wT7TlGBQtTXkDZYbSMcdag5IKlNBNDFMaZQ7g=;
	b=TvImEqgC+FEoglPxBK8UidL+03E6fqPZvtpYSVV6crXLfmZmRC05zk9GbTkKh9siO4iL0K
	78CEKffw/HJzVNs6KCVqWYUFgA9zMij4V2tkiIwW/WenNm9auR87Lo+Gnfv30bs3bP3Dni
	GlCqMrfuvo28epNWasZpJDklri/9Ulc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-6cDLfGn6NXeVALea1hrhTg-1; Mon, 19 Feb 2024 08:25:23 -0500
X-MC-Unique: 6cDLfGn6NXeVALea1hrhTg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2cb0d70d6cso303065266b.2
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 05:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349122; x=1708953922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu3xg1wT7TlGBQtTXkDZYbSMcdag5IKlNBNDFMaZQ7g=;
        b=HYuqcUSinCFSlLOYISOxRdVrk2r3zxpiypbf9T+65RZS2XjFPS3Ye5UImrch60uCRh
         3PIYZFvTtOZFA4ddN3rux2GK211IqhChVcS3XUuljfg+RalxzayYeyKO7xEmqqll2KNb
         TE9o4ToIF/eCN5LDckOtyU2by3aIHcFjU4jplkrRO91U/6O+1f+laO260E3qnv3r7i7T
         5dVOapGxgQ8JOTeJMktDyGBzQG3AN6iWzb/gLCNDniLDT34hqkKbNQluV63SB/bbINQk
         lWQWWNEVytyih8hq2XShjvUiEaUImlDqcNg+SEtCtpZa4YeouaFMcEbqRCeyR43QIro5
         2oPA==
X-Forwarded-Encrypted: i=1; AJvYcCVDSpEIhWuUK+wTnokSSOCPGOnF7dG5zXyPcekdMNYShZC6d5wQMqmMFm/7bh9gvu1Tr3jrYm2tJitooLE9yLLWQ+JrVT4grjGDCL4=
X-Gm-Message-State: AOJu0YzIOd7Fi1pnnd0WveO3rWdV5HpH0M5BKYcchxorxYAxExJk2BLi
	ldoSiqInQhw28tKvkHkH6/+DKWgAuKG/pQahPWlV79aPrdGxRi02rflf9aLDz5J4+YgFeibDMEY
	oDMEtWCtkZJShp1HlibdexD9itqE8rY8AD+PqJsrDvHG9rtnzv7E3S2w4GFMu
X-Received: by 2002:a17:906:694a:b0:a3e:d1f7:1ef1 with SMTP id c10-20020a170906694a00b00a3ed1f71ef1mr717708ejs.15.1708349122737;
        Mon, 19 Feb 2024 05:25:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXZocZ+dsIAfBExkVnOHypvoBtji04mLw4dWIvc+dqYN6YalklxGYYTkxB78uMhPvsRRq5wA==
X-Received: by 2002:a17:906:694a:b0:a3e:d1f7:1ef1 with SMTP id c10-20020a170906694a00b00a3ed1f71ef1mr717681ejs.15.1708349122436;
        Mon, 19 Feb 2024 05:25:22 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b00a3d5efc65e0sm1625445ejb.91.2024.02.19.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 05:25:22 -0800 (PST)
Message-ID: <627cbec9-0c0c-4eaa-8765-ee45c045a6fc@redhat.com>
Date: Mon, 19 Feb 2024 14:25:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] media: atomisp: Drop is_valid_device() function
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20231231103057.35837-1-hdegoede@redhat.com>
 <20231231103057.35837-6-hdegoede@redhat.com>
 <CAHp75VdRny9rUSb9Y9rgeiAFkhHR=9LO45BsQbZk0X4U7CEhfA@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdRny9rUSb9Y9rgeiAFkhHR=9LO45BsQbZk0X4U7CEhfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/2/24 01:19, Andy Shevchenko wrote:
> On Sun, Dec 31, 2023 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Now that a single build supports both the ISP 2400 and the ISP 2401
>> this function is no longer necessary. The main probe() already
>> contains a similar switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK)
>> checking for a known device_id.
>>
>> Move the revision check into the main probe() and drop
>> the is_valid_device() function.
> 
> ...
> 
>> +       if (pdev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
>> +               dev_err(&pdev->dev, "revision %d is not unsupported\n", pdev->revision);
> 
> While at it, can you fix the logic error in the message ("is not un"
> -- double negation)?

Good point, I've added a patch for this to my upcoming
atomisp pull-req for 6.9

Regards,

Hans


