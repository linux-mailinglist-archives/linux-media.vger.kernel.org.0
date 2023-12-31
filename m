Return-Path: <linux-media+bounces-3112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D75820AF1
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8C811C20358
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC5520F2;
	Sun, 31 Dec 2023 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TksvD0iP"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF19444
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Da+yW9tsLNRX0fe852cCx0S/ufcZKfL0Exuh0Ub1R/A=;
	b=TksvD0iPyIlFtfpi0q1J7QZM8NPGLl1RExaIyAMw5l6q3DKuOxXiXkY5lcZipb1f2inth8
	P169FAHmw+cZw3OX/GPAOPV+t3gSDjt4lF7Dk/SubaRI81vuPsFJn31B2l+60FSYGruk6g
	q7dtnWg7ly/HmQvGdwR6+78Mdka7fqQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-XP5va6BsMzeE90Te_5p2oQ-1; Sun, 31 Dec 2023 04:53:01 -0500
X-MC-Unique: XP5va6BsMzeE90Te_5p2oQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5555a856794so1398902a12.0
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016380; x=1704621180;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Da+yW9tsLNRX0fe852cCx0S/ufcZKfL0Exuh0Ub1R/A=;
        b=bm9JA+ouRQ+91LXF3rvWDoyI9o2tx/n47g1IrO6zU6uHUmqou0DowLFHFEMMBRQeNM
         2d4HmC84EwOwMNYTiYpc8g7uXl4sMdI8y/Yu+5JH1/mHUVCCale9IWaRXg+LMSfGk4Nd
         CL6q/DgD0DRE7a9bc2CGjzJfGJkPm9rKp/XE1PkyYykPUxS4JJt4/R5l0UM4Vfi7MdNY
         /D/JkwxMNJsmtyRzuVRHUlBB71ufMawje745mxcm7swQedebEb6C3wJycXUK7CHZnFXB
         UUjA3LypH1aj10l1Sdy12jptQFAeax806dxkq3oe3cSaml5qvpzKwEc6eRep21V2tpeY
         LFPQ==
X-Gm-Message-State: AOJu0YzMNv1gi12GJ7UUhFfXkWQhS57uNdeSIwEmXSQROhdckurnZr9t
	4btbFIQobYl2sXftMBHs0WI1PNHL3PWuyypLnXuy4/NmMilW++7Zpi6YaN+QAPnxml8IW3Axh4y
	Oy4eung9h7Hx43VHPooXuRqFkZrmPBpk=
X-Received: by 2002:a05:6402:655:b0:556:3386:2058 with SMTP id u21-20020a056402065500b0055633862058mr335371edx.54.1704016380302;
        Sun, 31 Dec 2023 01:53:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpGSroymvOY5lC16QdbX3lv8rQt4ufgfykzr3kiLaU5qGXVxY0WPZnSOhkR34C7xJ6w3mI6Q==
X-Received: by 2002:a05:6402:655:b0:556:3386:2058 with SMTP id u21-20020a056402065500b0055633862058mr335367edx.54.1704016380043;
        Sun, 31 Dec 2023 01:53:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d5-20020a50fe85000000b0054cb88a353dsm13243222edt.14.2023.12.31.01.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:52:59 -0800 (PST)
Message-ID: <aca303b6-d3f1-4604-a372-7c5ba5252077@redhat.com>
Date: Sun, 31 Dec 2023 10:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Coding Style fixes regarding bracets location
Content-Language: en-US, nl
To: ariel silver <silverariel08@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org
References: <CAFWxF=AOmaLhUaRu-meNGx4W9vdO86JxwDc4wS-k5VJXm0Pbjw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAFWxF=AOmaLhUaRu-meNGx4W9vdO86JxwDc4wS-k5VJXm0Pbjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ariel,

On 12/26/23 08:15, ariel silver wrote:

Your patch is missing a Signed-off-by line in the commit-message. I can only
accept patches with a Signed-off-by line in the commit-message like this:

Signed-off-by: Your Real Name <email@your.domain>

By adding this line you indicate that you are the author of the code and
are submitting it under the existing license for the file which you are
modifying (typically GPL-2.0) or that you have permission from the author
to submit it under this license. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Please resend your patch with a valid Signed-off-by added.

Also next time please try sending the patch as the body of your email
instead of as an attachment. The best way to do this is to use
git send-email to send the patch.

Regards,

Hans



