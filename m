Return-Path: <linux-media+bounces-10234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 824608B3D90
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 19:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA091C24281
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 17:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F2215ECDB;
	Fri, 26 Apr 2024 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCQj8daO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B74915AAD2
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714151059; cv=none; b=dwLHsLP1RFbQQ7SzNucS8hS+VRKoADu9yn9qTJWcOAsFOB+S/+DhHl02C7djftLgHorV46LxEXm/q3N+9UEpljTsmnqKodTERv2qkeQhlbfPN3ViN2jHawwdVzz52Lmtui/3V1IWUJQJn3ptKPWAaEqkhRxLjQSqQCBdfuDrw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714151059; c=relaxed/simple;
	bh=JURdutCF+END7fzD44sY8qmEZBj/T2NxwhqAOG0f0Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AShpwCzHiQ4iuvMVPab4h3u5grE08QFXPJWCTpnmDx+ez08THJN5l57BY223/OhH75rrHiqpnrltfU76ROVayHdTp7APj+H10d4s9pHBwAZDWJsbU7GsvUh9sjtiRC8hxjp3/QTt1EejWOJws4hdloACk9qmRciRuStJgX/WHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCQj8daO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714151055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YR4Gv35+BwT8FfgrQlC3UZaYFeN55BL8jPB96NcMVq4=;
	b=CCQj8daOixayRsvt4R7zLticn4ww+S2kJgCixJJPQBqSPN86haZ5slDPmVyiLM644iIJmP
	WfLUMSoinLMfdG7oXa4byJLScS0PbObS3z7N9SoUw85TO4xD5U0uVRcSdxPhdhD7ToAGHr
	wDVPrlDcVpURLQIgtW8nDfISrrYTzJs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-v8dJtCnOMd-taQ5ykEXcdQ-1; Fri, 26 Apr 2024 13:04:13 -0400
X-MC-Unique: v8dJtCnOMd-taQ5ykEXcdQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a55709e5254so126303566b.3
        for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 10:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714151052; x=1714755852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YR4Gv35+BwT8FfgrQlC3UZaYFeN55BL8jPB96NcMVq4=;
        b=fPt4gTlGptCAXh2lAyPPxVsFIVKOc9dJLThFrGORWEIa5RB+Ggv0SeE58JcvX7P1qi
         1IPIKAtKc71+8NFfr+IJ+5ZWEY1NEXg8r3ITqPEyja60ksmZ8Wm+kZglDWKclY48VLHV
         /Z1Qb1hiyp5NgV0Id2KUOmhSIU41aV4LZNdCV+xw0UCwrCGhJOcmhNF7Cz5Y0jaGY+T4
         i8X+ic7CwZk+cKLVHAmvuiOE4zX85cZkxYJQYkGidySZ82rIZHCtDHvyRRF6gMz5xRFL
         8bb6Hi9Z1iFxGpeqCuVX4jSt9fyeH6ynZLtuZob0Tu0S5xce2ae50Vy9dhC85kvzTuSp
         ZrKw==
X-Gm-Message-State: AOJu0Yxji68ikfdWeb74c9se7FDqQSaho1AcUvSBiEuYJuBi3msewYOX
	EFhLmCJ//26a+IzpS5eGI67uTMz5H4ZiPeZpAW3rhHL28DMoa3h8K7C7/9sGDgEkpGyqwyeVdLu
	7ox2+dD9yxREM3wg1GQkmz1ebO9HQ0dfIdRf0+ksecrjeCYOji7s+j70rfsjP
X-Received: by 2002:a17:906:3710:b0:a55:b175:170 with SMTP id d16-20020a170906371000b00a55b1750170mr2234554ejc.56.1714151052177;
        Fri, 26 Apr 2024 10:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYYA9S6T7xATHGrn15Wxc7mXQiDc6aY9dIZP0Ls5or1cwELEYDh7n2Gml6LJdlfgkBJruXpQ==
X-Received: by 2002:a17:906:3710:b0:a55:b175:170 with SMTP id d16-20020a170906371000b00a55b1750170mr2234535ejc.56.1714151051784;
        Fri, 26 Apr 2024 10:04:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q26-20020a1709066b1a00b00a53c746b499sm10728572ejr.137.2024.04.26.10.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 10:04:11 -0700 (PDT)
Message-ID: <57b7f59a-8549-44d5-95fd-4402951d4bd2@redhat.com>
Date: Fri, 26 Apr 2024 19:04:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.10-2
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <5f89adf7-23e3-4966-ac50-838335b13207@redhat.com>
 <20240426111533.2b717d57@sal.lan>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240426111533.2b717d57@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 4/26/24 12:15 PM, Mauro Carvalho Chehab wrote:
> Hi Hans,
> 
> Em Tue, 16 Apr 2024 11:33:51 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi Mauro, Hans,
>>
>> Here is a second round of atomisp changes for 6.10,
>> this pull-request supersedes / replace my
>> "media: atomisp: Changes for 6.10-1" pull-request.
>>
>> Various cleanup patches from Jonathan Bergh and Andy +
>> a set of patches from me which has been reviewed
>> by Andy and Kieran.
> 
> Atomisp patches applied, thanks!
> 
> I had to do a rebase here first, as it seems some patches were 
> merged already on this series and on the previous one.
> 
> Please double-check if I picked everything, and rebase your
> tree on the top of media-stage before the next PR, to avoid
> potential issues during patch review.

Thank you for merging all the patches.

I have done a rebase of my media-atomisp tree and all patches
there were skipped as "previously applied commit", so everything
looks good.

Regards,

Hans



