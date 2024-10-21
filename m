Return-Path: <linux-media+bounces-19977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A79A5E65
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C17BB21DF1
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F051E1059;
	Mon, 21 Oct 2024 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRFHdyHC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5531A60;
	Mon, 21 Oct 2024 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498581; cv=none; b=QsxouMYuaKF7cDa9u3LoSbfpISO45F3Gdn1zGb5gev9FDrWQ1ItNtwFHst3gbn7Tq69v33pAyrz/bHeTZ7mhQFliWdADZezPICu1PPnT714UrsbjJvxNZQBk4Kig4xZCy6AqA6NnDJN/cnDqHvxi4qawcv4VzgNrfpHpZ3ubiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498581; c=relaxed/simple;
	bh=c3Q7LGQVuIITg5UaABd1a43cuAt+QmdW85NdxlKpNVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJKXnDOYvc3xG3DGA2GNfWBGYRXGnspJXYBqmenYjtLhJQUuVUHC0WMK8FckkjOKQOK6LzEcSon0IOAxQPDCVgpLQYNUpQ17QoLlI1JhWERL2G9NBc0w33jhI+kLslUiLL+p0cJUyTpY+knz8+8HbKE5IzDqsOFqgvMLGDv7cF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRFHdyHC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so564814166b.0;
        Mon, 21 Oct 2024 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729498578; x=1730103378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hikONoUm9dyOaIh70TuwxhRECZdjoHLLuaQITExzXGI=;
        b=IRFHdyHCRRKm2YheoNSTK7YqX4YMASIar9++LQrsMWQdtIkCtTaJds4L/AgSU+TBAg
         YZAp4qIcdX4OWQ0qbK672ixoA5PXckwRAK2yMCcNaH1KhFCS2b5A+JumpzRrHlfUbxOa
         QnWtncOPgk1fRjaRhj1k8sZR2VbkH0Pjv+FCzjFoUwvOR8VJSWauUk+Dr0duPkVDxZSS
         3v61j5Ixf9dSRpxkQ7yAS738hGCrXIHecpXLYhCVa/em/sMBAiq5i/aGIDzYIAf6euJQ
         i+XOz0rmUTS5h6yf4Ck1jNK4EQA7BJh9QKZsEhVK21f4U8cuJxE7MsKFkjnfKsrPOh/G
         eFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498578; x=1730103378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hikONoUm9dyOaIh70TuwxhRECZdjoHLLuaQITExzXGI=;
        b=nP/e5ysQoI+RzvteJkOu03V+j0CU5hXmejR4ljJKjxhMohuUYLN+KP5S4kg/PBSZ1t
         gzaOZn1yBez/xLlRkcBHOrK2JJIM7zKqqQqJHcfdE903da+YHPM4zvDTJHcLhd1ujRXI
         O8QeqfTMg3vUPXv4Ng5MsJqWA7LNvNClnXGVnn3eC75PzXKY5Xss/D0xhF3BTCVygQn4
         hSp5Shk3jdD190ndFCvvSuhFOGtPcJY/DEiQ7+3/FCEAdtqSzVxESAg8U49spwyQesHY
         6+e5UZCqTXkIDFQYmcM/7NndNf2ytiY7PRzzPuQRptR44Jc9i3mZD/Jyr4JTx7LYc6cQ
         uHMw==
X-Forwarded-Encrypted: i=1; AJvYcCVvtpup3INwQzx526FLRYYOzvLE+w2ydlIva86q6iAdb3M3rdid/9XX+furrcYF6n7VYPjvaahIBb5Otts=@vger.kernel.org, AJvYcCXHw4Vy7dCuj8WG7IeYJnMQxH/QKe4j2xNQXPMHJx7zm9GvFguFOvOcI0Kpvg90WhDKS/fZEaKqbhcLMzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTu7W1ovkS0ZlB15OmCLf8Z4lVn2PRyImIwXNraqBdrOzDywJ
	+/tXgMN6FZ/z6/zSbFhT84CWJlHEZopd+m+ab/ZiImaCjmND1qu/
X-Google-Smtp-Source: AGHT+IFEyf5L7n2B3B3XBAQKurb3beIhgnv6Bq2BmEGpujTZe6w/vLlHAocBgUPXhyZmaAU7th6WAw==
X-Received: by 2002:a17:907:a089:b0:a9a:12c9:41d1 with SMTP id a640c23a62f3a-a9a69ba59acmr1175756866b.28.1729498577534;
        Mon, 21 Oct 2024 01:16:17 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91571e3asm174577566b.147.2024.10.21.01.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:16:17 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:16:15 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <ZxYNzxH0UGy/jsEG@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
 <ZxYCMWryQl6lZxf9@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxYCMWryQl6lZxf9@kekkonen.localdomain>

Hi Sakari,

On Mon, Oct 21, 2024 at 07:26:41AM +0000, Sakari Ailus wrote:
> Hi Laurent, Tommaso,
> 
> On Sun, Oct 20, 2024 at 07:43:54PM +0300, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > userspace has to be able to subscribe to control events so that it is
> > > notified when the control changes value.
> > > If a control handler is set for the subdev then set the HAS_EVENTS
> > > flag automatically into v4l2_subdev_init_finalize() and use
> > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > as default if subdev don't have .(un)subscribe control operations.
> > 
> > I would add here
> > 
> > This simplifies subdev drivers by avoiding the need to set the
> > V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
> > consistency of the API exposed to userspace.
> > 
> > And you can also add
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> I've picked this to my tree.
> 
> Please try to properly wrap the commit message the next time, most editors
> can do that automatically.

Mmm..
In theory I have this cfg for my vim:

filetype plugin indent on
syntax on
set title
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set number
set hidden

Thanks & Regards,
Tommaso

> 
> -- 
> Sakari Ailus

