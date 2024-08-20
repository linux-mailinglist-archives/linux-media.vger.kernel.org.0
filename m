Return-Path: <linux-media+bounces-16503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17ED957B70
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 04:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03B78B225FD
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 02:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABA73AC36;
	Tue, 20 Aug 2024 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wvjQr1zw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A261B813
	for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724121070; cv=none; b=aTtwXJPODWO8Q38MlCBqHd1A0j4shlCjHlCpbDqjpKozhPTnhREni30Mz6/URQWmb5Qxsi8W0zdVtQ4HBgMKZvSZnjf/iSfxPorlTsVTaArnHUSacrOWHiWtwIfxmedG9YV3/HjiQAB/LCoo88uVNwjxvzqJIMhY5wLmwhFYIe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724121070; c=relaxed/simple;
	bh=X4pUZjFHh+atbmSEesDAN7m6L9U3ll3z6YtLoWj3i6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp69RVCf1qrA/lUMsNuE4shuFfp5l5K19CRE7HRmWWpAJkgy+p5M3hz3XgBXRgFSSm4oDSt1GmQUjaK0JClrc4Hc/6JwZt6/0B5fgdYZUvptNbgayrH3ISjCnPRCVbqGYpK2SX+C1WYcXbGyxVomXb8eukr/diOqNVnmwhsxaHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wvjQr1zw; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-49299323d71so1843247137.1
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 19:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724121067; x=1724725867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mqpoKCWyifK+ET7fuTv1wH7YXi6lhsgH+FAT7wqmTY=;
        b=wvjQr1zwia54+m0+SqYPptO2s/VZkTgAG6o3VQ4AHp+aiIaZRgTH+bzd+wvlSXvb5I
         htRzk9X/Z4+fZpAGMurIOXcA/ho5uDUQ1l1UhPENZA+LL2m0g85kqYoajkkJEfBclgCQ
         DCXitIBTgI36WY6HyGHehWjrYevHzdAFFFAoVVMFEa+qMtLFY7bI+/GjyK21CIuevR1G
         O+CNpPS0KzuIfw8HItl2gT6BJo5VGKEJHO9xKvsREaI4rW5Gq4RkO1dOk4OYOz89OSXk
         qxdJdvqZ7vZBAu9ax7PHg0enfib9an0909skJopyfoJWzZEPmjU6dqi911PFujOYGb5t
         TKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724121067; x=1724725867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mqpoKCWyifK+ET7fuTv1wH7YXi6lhsgH+FAT7wqmTY=;
        b=MpZp/8UJrGgTpUgrrVX0KNBdCwmXDffEcdMwYn8f+HZGj5diMhl8p/qzrm9HesheKX
         inDg4G9CdIhOkkLztiHiD9OQQwjt84SLe5pqNA/xMbABkwpMadHp0FEQSa1t/mRGY15n
         A+XTIjWhYhCVljfhflhZIiVd547B6DBCrEMUFJQASX7jfeUicXf0ilB0wnGqys+Ia3HN
         RgoNsvPywBycp9ppU5ggscaoCRXazhYMPkp6yQ4YoJiCznU6LDrsa+Z5qpRd8VJet5Yi
         u96zlp6/Hys2WwSVOf1W4juE8MbtoKtCZm8l4z4+RP3lU3toEoZlyIF/OaWOA/WuvZ4l
         IBeg==
X-Forwarded-Encrypted: i=1; AJvYcCV7XxN1ysQRL/1j2ZOOIijrpHix+IKDbvoDoXCr9+T/PQSe//vFQFe2v9DFiH8CZkL5CHhUZGUyuUZHugrXakmBFPrJEEtXGh9HsTI=
X-Gm-Message-State: AOJu0Yz1WFYl5xebxTn7RVyIZvXRp6E0/aZG85Y6PDSgtkwAIp8guTAX
	sRUjDeKelOj82AYtNJXGudt2mnXkFszVYGqCjGtW3yx+36FMwvzCKNEtI6e+Ug==
X-Google-Smtp-Source: AGHT+IHWDxY8GbMwAR0OBZxPuRx2s09i/lQO0qS4xVPZvJ4y+H/lOztCfraZkvCHnXfID2a66CDHFg==
X-Received: by 2002:a05:6102:6ce:b0:497:6bb5:3991 with SMTP id ada2fe7eead31-4977964b14bmr16623986137.0.1724121067302;
        Mon, 19 Aug 2024 19:31:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ed1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fec5ea7sm48342336d6.88.2024.08.19.19.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 19:31:06 -0700 (PDT)
Date: Mon, 19 Aug 2024 22:31:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <9ff214a6-10be-414b-bf86-3757dd819243@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
 <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
 <2024081909-afar-trolling-2a67@gregkh>
 <20240819101358.77aea582@foz.lan>
 <54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
 <20240819182456.5e13315a@foz.lan>
 <044260d2-4aa3-4937-9f5b-91e039a1df41@rowland.harvard.edu>
 <20240820011033.79312cb5@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820011033.79312cb5@foz.lan>

On Tue, Aug 20, 2024 at 01:10:33AM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 19 Aug 2024 13:14:19 -0400
> Alan Stern <stern@rowland.harvard.edu> escreveu:
> > Currently the driver exports only bulk endpoints, even though it doesn't 
> > check the endpoint type.  You can tell because the only routine in it 
> > that calls usb_submit_urb() is smsusb_submit_urb(), and that routine 
> > calls usb_fill_bulk_urb() before doing the submission.
> > 
> > Given this, I suggest merging the earlier patch submission from Nikita 
> > Zhandarovich as-is.  If the driver ever evolves to include support for 
> > isochronous endpoints, the probe function can be modified then.
> 
> I'll see if I can try his patch and see if device keeps working. The
> logic indeed use endpoints in bulk mode, but I'm not sure if, for all the
> BIOS files at drivers/media/common/siano/smscoreapi.[ch], the endpoints
> are properly reported as bulk.
> 
> What happens if an endpoint is reported as ISOC, but the URB submit
> is called without URB_ISO_ASAP? On a quick check, the code at usb_submit_urb()
> seems to not complain about that.

It _does_ complain if a driver submits a bulk URB to an isochronous 
endpoint.  See the usb_pipe_type_check() function and the dev_WARN() on 
line 503 of drivers/usb/core/urb.c.  (In any case, the URB_ISO_ASAP flag 
is optional, so of course there is no complaint if the flag is missing.)

Furthermore, if an endpoint really is isochronous but the driver uses 
usb_fill_bulk_urb(), the transfer won't work at all.  URBs for those two 
endpoint types use completely different ways of specifying their data 
buffers and transfer lengths.  See the paragraph starting with 
"Isochronous URBs have a different data transfer model" in the kerneldoc 
for the definition of struct urb in include/linux/usb.h.

> I would be a lot more comfortable if the patch were using just
> 
> 	if (usb_endpoint_dir_in(desc))
> 	...
> 	if (usb_endpoint_dir_out(desc))
> 	...
> 
> or something like this (to accept both isoc and bulk):
> 
> 	if (!usb_endpoint_xfer_int(epd)) {
> 		if (usb_endpoint_dir_in(desc))
> 		...
> 		if (usb_endpoint_dir_out(desc))
> 		...
> 	}
> 
> 
> instead of calling usb_endpoint_xfer_bulk(desc) to check if type
> is bulk.
> 
> I'll try to do some tests, but not sure when, as I'm traveling abroad
> this week.

Instead of going to the trouble of running a test, you could simply run 
"lsusb -v" and check whether or not all the endpoints are bulk.

Alan Stern

