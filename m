Return-Path: <linux-media+bounces-36842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CAEAF94AF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FDED5C074D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D694307AE6;
	Fri,  4 Jul 2025 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cfLsj6No"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10141307AE0
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637069; cv=none; b=BF/x8wBGbB7APxfJdtXRATPvEemWUzDAmsJUZ9iUQXhKk7geSar2xnuzfWUA6D7eTJdy5QveRXtB8owdpr08VyUaejkqFtFIwoEGcLohKOhLRr/GjiI7jxE7wSaafYApFXl8OpJpONXBuSXO0/kZMmXSkjzo8PuxRUzEOuNcBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637069; c=relaxed/simple;
	bh=+UyVNx3d2xsOsv3hlWbLcO0faItygFtG1VFebtg95qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5gyX93ztPXu+x04ayiaQKZOImTgOxi8cNnNNxaKoWDiqnDplvVIYImgv8odLTS+wulaZEFcuTnLLSOILhYz7tf6OSOofgjN9N9Au4UTk/hj+qoVuLrlwEqn7etz7o6zISYE5PkV2CjqeNEX0l1wnoMd4CO60omraGKvWKiq/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cfLsj6No; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d5dedad887so54719585a.0
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751637067; x=1752241867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=cfLsj6NoyhBIdaTL8glE5jE7X5IquV8u7ZkxhSFgovpE1s6lfhOrV60Ysc7Xm4knQT
         9lUFcJ6K5EOS8Yf50AKEMCbGl0IUqMdvrtNuWB9qhjplZ1mRqcCrpzpXjJ/E8ifc1bvc
         mOAfhsI+lP1aFb0Dsp9JOgsAjKZQaLkS/GqYo/70nhSQBzyvkluCFQ7rz8GOML99P0M0
         e4Ry9bOlcJ/a+bcWDfFOVSAL/zMY54g2+a5AWlPppcgDPXFOkV5bYvJUB7fkcFvg5uXc
         ZeJUakWfV+rLNoBxmUhJydw7xkwl7rDbdmFhVZHAG1pstiw35CyriCe73S36UqK8PD22
         CRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637067; x=1752241867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=CMWMVKdhWm9ECD9xsjtDtsn1YYmdUT0yuxPlA5OkooeAkTnoTHShmwu2UqygoyGmY2
         hR8EcusdxCXXBCj/AcWFEuG56/GnqSBak9endsD4bAR/9TUejqNQXEdWfMqH+QqYXnxD
         PX0k55r+n6fRPzbAHMpgEGfq+mzxGdFMTRaIjoNE1Cdii0b5BJlqsIosnONbVdo+/Dy2
         3JkaG4PCjdZ/LVw/iVTnmkfpIRUexHYAQ/dkCeRN/K76T7WQ06yGwHa9+td/+09+bkYY
         4ikOnutOXvHb2PUvr67p2VomQ6w0D/31+G4x/uCPhlK24POesJzmzQtn3POKZC+wOjHG
         okmA==
X-Forwarded-Encrypted: i=1; AJvYcCW0rD5CT7386njfdSUlq9Nbx2yo66mEqYe8C4ZMmZ0FcaE8o3tW8kC5DRraiFMeptkSgaE4DuJAygtP7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5ifm+Jyx7A/oWBz9ydMHfGbsnmwCzziLKhMpsvdxMSSHNHn8
	6rzX+XQLvPkZ0TtVNEyfzEUzGut0UslHaQZVIPhDKl7drfcKzCP+No/9saaT7vg1jw==
X-Gm-Gg: ASbGncvF/aTM/hnviZhtIlVSMuKybfR8VjQzHoXHAeeRBYDs/Og/WiCRrNE8L32dqDJ
	61ZCVBCHgJ/PVW6yCUGMgpSVtnOzinEpBU6+hgAOCdGeL78qOswyVLc18jUA+9ZFgQQjoWRsOnL
	m70EwR91+VCGn1Xeo5pFGPz/4xKy060RbxY/e9KyljxpHNxTRw4lcifQYM9fVOfKF+s3msB0iJx
	XylSA5dyrBVMr09uCMJoHXpZ9Zvt7+7nHGRyBIXldinu9zB6Hv5AqVUw6dunEgAqsc95JHgDEKK
	gW0Hc7pnTe9jnLHCWifwFAWJMtZjrsL6TaP+pgrJ4GDXIot/ObUIyxkIkoAHQVQ=
X-Google-Smtp-Source: AGHT+IGPrA4k9Zr2z8tw+Z35KFW9UzX5+1J5nLqm7+nyYdjjQoYkcLFbaNyTIqAXeMIcMfmr1ExyVw==
X-Received: by 2002:a05:620a:198f:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d5ddb7ada5mr262663285a.29.1751637066601;
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ac60sm12583176d6.97.2025.07.04.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:51:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <afb549d1-a7d8-47ee-83af-76faedbb55a0@rowland.harvard.edu>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <20250704095751.73765-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704095751.73765-2-xu.yang_2@nxp.com>

On Fri, Jul 04, 2025 at 05:57:49PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

