Return-Path: <linux-media+bounces-12716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580219000AD
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37F341C2204C
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 10:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D04A15D5C2;
	Fri,  7 Jun 2024 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNoAQOZZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D4F156F5A
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755747; cv=none; b=B4kyCWaBwd+OIl2DJq7sTkoUbRTiHPQEyBuNBWc4BJHFUU8qj9KQ1uzm9NdttSoHx+Z30DkCh8zBzSS4EDuEYpvnN1WBUJqElJ1J/YSLMQjweevutKlnCECxpuQM0GPOwYXBw5kwAAjFcU4rTGdRrWp/UxMfP8qmmLnQ7ScBqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755747; c=relaxed/simple;
	bh=E5a8JUqw2N0hu4wfsPwoSSZDyCfON7mvBB+h9/6ocMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfdiz1AnK5S0z41PkaOdoUgLKXW+BgzrLbSfCkR2AXyQCxvWmkktPv+qBS3LnSkzs7AxB8/KZ1i92FQoIpvcf0wvqmMGXRaN5aOvtcONw936Jk7tM4xngiB5jOsl+IVyIARQl+gsvsG6bVUx07haurvfikE1l/2STyLeYFtgUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WNoAQOZZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717755744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJVnADXrO6bWPgEbeB24YGs9MChqka2QoUiw3f4S0b8=;
	b=WNoAQOZZHoxYm4SfZ/NFwWnGh4omXmPuJZUynhw7kgPfO2Vop3/RIs4XkK/Dcdwk6uQHVo
	drOMhfV55HQjaJvgOWPidFPyvGrz1IxT338fq7ATgx82D3RqqIfBrerOaE5pmPH2ntcu6G
	moRC9lumPKE/If+UX5kycsIliMdBPL4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-Ez7vzu3_Mz-DS5dlaqo_wA-1; Fri, 07 Jun 2024 06:22:22 -0400
X-MC-Unique: Ez7vzu3_Mz-DS5dlaqo_wA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57a2fb28a23so1538565a12.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 03:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717755741; x=1718360541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJVnADXrO6bWPgEbeB24YGs9MChqka2QoUiw3f4S0b8=;
        b=EUPCHdndiY1Opr9xuwLpaPfvBWl78/BQepP39PFGILDxMhSoiOAiXqSINq65bDcv3C
         XnRe4YkLgICzvLYNGiCjFqFYLs60zwDHhUCfaMPLRLpotLGkYehtZMOWoi3b+k0rSH3x
         cIa9TkY7PJVxP+YelUZ4GX81kTznMKuWlwDBrSw0IdBRpjo/wG52K9eiaMLD4GdFhNTK
         NB/kOgvrBiWl1nTn9/L6zV6oIEKxw0m7amIYNBum1ZnGJoaLV+gNwzqQW3m32fCOlHpA
         x3/n8qP4Xm797cJmGmITIk7kuB5wt4XMocSft1ljPX+zeGu8qx2r76Qt52VujZHsQvrR
         98Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWeWEPj4HyNYL+yK8wLkgtLY+nY7CknN4PajP6pAzqlLpzL0quWMxTgdsAqZObUAhbpdQsgEGXSeBSSbkzy2vIgWKMDfyCm5lzdZRc=
X-Gm-Message-State: AOJu0YxdPWz2+3ybJ6C4wk9b2RriTAKCckcEggrX1vF1bGVutrY7Ml50
	H/l+uN0m9UO2P9P8kfvBA3FdL+agdB4zJyl9IlUU8CUOWCMjfR31MMkXbcmAF/y6Ml9PDGfHkdU
	Vq3rraMFMJk5zacOqr2DWcLSZnJaAYSratF7knSfbJWzWqibdaQN9j4H/R+Qg
X-Received: by 2002:a50:9fa5:0:b0:57a:73cd:abac with SMTP id 4fb4d7f45d1cf-57c50890727mr1214428a12.4.1717755741537;
        Fri, 07 Jun 2024 03:22:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA97Dxl/qMWzh5eAPEO6ZdHAbQ5vkY4UwvSy7moo8NKVscr5W2VllHhaiGUt1GpW/cURenTQ==
X-Received: by 2002:a50:9fa5:0:b0:57a:73cd:abac with SMTP id 4fb4d7f45d1cf-57c50890727mr1214400a12.4.1717755740763;
        Fri, 07 Jun 2024 03:22:20 -0700 (PDT)
Received: from redhat.com ([2a02:14f:176:d5af:1ef7:424d:1c87:7d25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae232981sm2516239a12.83.2024.06.07.03.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:22:20 -0700 (PDT)
Date: Fri, 7 Jun 2024 06:22:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-dev@lists.linux.dev, Matti.Moell@opensynergy.com,
	cohuck@redhat.com, acourbot@chromium.org,
	daniel.almeida@collabora.com, Alexander.Gordeev@opensynergy.com,
	changyeon@google.com, alex.bennee@linaro.org,
	gurchetansingh@google.com, ribalda@google.com,
	nicolas.dufresne@collabora.com, eballetb@redhat.com,
	linux-media@vger.kernel.org, virtio-comment@lists.oasis-open.org
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
Message-ID: <20240607062139-mutt-send-email-mst@kernel.org>
References: <20240607080045.1337046-1-aesteve@redhat.com>
 <20240607053839-mutt-send-email-mst@kernel.org>
 <CADSE00KP+dsN5W0DHzML8f4wjiH-NQEifQ5zxLusw65mEUb+wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADSE00KP+dsN5W0DHzML8f4wjiH-NQEifQ5zxLusw65mEUb+wA@mail.gmail.com>

On Fri, Jun 07, 2024 at 11:48:36AM +0200, Albert Esteve wrote:
> 
> 
> On Fri, Jun 7, 2024 at 11:41 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Fri, Jun 07, 2024 at 10:00:44AM +0200, Albert Esteve wrote:
>     > Hi,
>     >
>     > This a formal attempt of including virtio-media
>     > device specification.
> 
>     This was sent to a wrong mailing list.
>     Please repost to the correct list.
> 
>     Albert, when you subscribed to virtio-dev you should
>     have received a message that read, in part:
> 
>     When to use this list:
>     - questions and change proposals for Virtio drivers and devices
>       implementing the specification.
> 
>     When not to use this list:
>     - questions and change proposals for the Virtio specification,
>       including the specification of basic functionality, transports and
>       devices (please use the virtio-comment mailing list
>       [mailto:virtio-comment@lists.linux.dev] for this).
> 
>     To do:
>     - send email preferably in text format (best for archiving)
> 
>     Not to do:
>     - copy both virtio-dev and virtio-comment mailing lists (instead, pick
>       one)
>     - send full copies of the virtio spec (in any format)
> 
> 
> 
>     So what made you send a specification change proposal to
>     virtio-dev, and also copy the defunct, non-functional
>     list at virtio-dev@lists.oasis-open.org ?
> 
> 
>     Was the message unclear? If yes I'd like to improve it.
> 
> 
> My bad.
> The instructions were clear, and I set up the mail to be sent to the
> correct virtio-dev mailing list address.


Hmm no, it's actually virtio-comment@lists.linux.dev for change
proposals for the Virtio specification which is what you have here.


> But I had the configuration
> of the project set to automatically add both of the old addresses to the
> patch. I only noticed after sending, so the damage was already
> made. 
> 
> I will fix it for the next drop.
>  
> 
> 
> 
>     --
>     MST
> 
> 


