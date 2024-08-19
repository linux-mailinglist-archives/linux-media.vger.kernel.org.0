Return-Path: <linux-media+bounces-16479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4335956D57
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 16:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D79581C237E8
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B7917277F;
	Mon, 19 Aug 2024 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="g4bK5SNr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF01EB3E
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724077931; cv=none; b=NkFEZRowmBvH9aIOYtZwNpZjcJ2Kzz4pktrCe1h6xQM9lXDUZY4E8mOFrotZlNm8QDkQJg/ZgPMwwXvh10UXrxgxe5b2hKEukb/ZoJ0lC1yJU1M+0poK3hwH9WsAT6S6olrnJsfnTEZuBsdI2Gxvh8tRhbRAxghxEpGPd6KM2NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724077931; c=relaxed/simple;
	bh=XVH5jU2JLFWFsBkWbQQD4HLUEFNRlujZ/eipfxqLqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK8FSlO+9JsrU+yhxVFsd8wMmIAYaRQglYh7SXrwyDxa8ZsNRlWQ8ims8eel+FdvyF7kvKQMtOETT7EYdd4b3af4x6VoDDGzQP/aiDkdYQ426m87gMJDSNPyad0EWyRD4SUA1wtE84ludmoltRiggcVhU74TEWRmlh9WsqU0MD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=g4bK5SNr; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6bf90d52e79so11157386d6.3
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724077928; x=1724682728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P29ihJqTzcg1VcBqLYD00iJSDzkB+ZTqybpsW0drryo=;
        b=g4bK5SNrUc2Nft6m88SNatPxDTkv4VIZOAUiZK8CvsU0IUUfO0Gggyhf8SndCL1oF2
         nyNGddL29383Zzgi3a2rLpzcawGNF8yaGFByMo8j8GXrCRH4fUahN+Y602mI/giGx+h5
         yVJ8z7qI+SqZIr2v+f3rOiM24EVGTZPpAR8dd+LJqyEqHm3EyS5o8Fi9t8LpranVa0ht
         VS9Xv2S8xuMEEKaneZyjjGe6HA1gdnfMkFTUs6MoH5MRiStXkLNrEnWN3t/8kDEYtYZM
         pWvDdAL6VFtuA0BpNy39RTFRQIEQFVQPG5BUThVn4uS5wSkveNGZb45NRk/2p3OB7kr7
         adUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724077928; x=1724682728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P29ihJqTzcg1VcBqLYD00iJSDzkB+ZTqybpsW0drryo=;
        b=Shv+1es4hi97dXq6KSU1Tq/EBUOL9P1SZTbQmle/dptpAmVLh6Tl11BhTaE6IAD80O
         +GxjqCh2XNC5UaNNYTBt7LC+7dGPACFmedyvv1Bdj2MWn0oT221teV8pHCD8SRwZGspB
         4igJQZiDiaCYG3g+SKLk5ECJINgueFm3+M/iil+Q669kz33MlmY/rKEjIGHj6Z1xD1yc
         LC7lkrCmIScQUUlF1DTn4x/LC7PBs9ZVqpIzFHbfZbjbABO+aazUQpP264KmTsxibnbG
         /0u+S4MOPj91IwEIcYjvTEsvjRH8/1B8N/9NywcyoKpqqTlna41krxD9P4Tl0OYf5OwZ
         /Q+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwmhdM/siLHh31vDOnXSBKN8BU4GFjHe7jlosoZROL4EsnIfHehHsyvx50HoswfGqIBX9YbtQJ899nLlSWb6Sd6qyaQJvCFHZZuEg=
X-Gm-Message-State: AOJu0Yz3W4ZVWdo37h/H0oVGHeyx+hWHy0TfeuhIElA686NSz0Su9RlU
	GnOPGnNoqB5N6SUNzQNvwYVu7BDHpWOX24CVdnbes6cbrc/rv8oPZilE3aSfmg==
X-Google-Smtp-Source: AGHT+IFhYuRdrRjzEK8XWMD1A9Yu/HU+giu8JNAcZOV9OVvN1YApwfL/cnHC0CWCLrfCuEbMz6EOVg==
X-Received: by 2002:a05:6214:5c05:b0:6b7:b236:6944 with SMTP id 6a1803df08f44-6bf7cdca43emr174311846d6.8.1724077928186;
        Mon, 19 Aug 2024 07:32:08 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe432d1sm42984536d6.74.2024.08.19.07.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 07:32:07 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:32:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
 <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
 <2024081909-afar-trolling-2a67@gregkh>
 <20240819101358.77aea582@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819101358.77aea582@foz.lan>

On Mon, Aug 19, 2024 at 10:15:11AM +0200, Mauro Carvalho Chehab wrote:
> This patch is duplicated of this one:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20240409143634.33230-1-n.zhandarovich@fintech.ru/
> 
> The part I didn't like with such approach is that it checks only for
> bulk endpoints. Most media devices have also isoc. Now, I'm not sure
> about Siano devices. There are 3 different major chipsets supported
> by this driver (sm1000, sm11xx, sm2xxx). Among them, sm1000 has one
> USB ID for cold boot, and, once firmware is loaded, it gains another
> USB ID for a a warm boot.

Are you sure about all this?  The one source file in 
drivers/media/usb/siano refers only to bulk endpoints, and the files in 
drivers/media/common/siano don't refer to endpoints or URBs at all.  
Nothing in either directory refers to isochronous endpoints.  Is there 
some other place I should be looking?

Also, while there are many constants in those files whose names start 
with SMS1, there aren't any whose names start with SMS2 or SM2 (or their 
lowercase equivalents).  And the Kconfig help text mentions only Siano 
SMS1xxx.

> Your patch and the previously submitted one are not only checking
> for the direction, but it is also discarding isoc endpoints.
> Applying a change like that without testing with real hardware of
> those three types just to make fuzz testing happy, sounded a little 
> bit risky to my taste.
> 
> I would be more willing to pick it if the check would either be
> tested on real hardware or if the logic would be changed to
> accept either bulk or isoc endpoints, just like the current code.

If the driver did apply to devices that used isochronous transfers, the 
ideal approach would be to check the endpoint type against the device 
type.  However, as it stands this doesn't seem to be necessary.

Alan Stern

