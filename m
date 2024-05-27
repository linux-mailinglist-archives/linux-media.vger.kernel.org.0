Return-Path: <linux-media+bounces-11929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447248CFE71
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002552847CC
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5994713BAC4;
	Mon, 27 May 2024 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GaK60i8s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED23113B780
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716807406; cv=none; b=g/w3i6gwp/PwxYXR0n7FuolQp3IggaDcwedEJx+Mp8+7ib+ip8oLP5c2vLDZ9HQDOqfn6XqVDbmPbkH0k5zHgsLwLWwIFQ6WIR1xI021ojCvK7k7a7Qib82DXi8XsqwwqvJjzEMFDfxqRFnzKtsBIYR8C8sCZaqa5IuCs96lVFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716807406; c=relaxed/simple;
	bh=8FcTJEfEFVUIbW55vocP4P8VwEQGgQ+oOa1antZ4c84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBBdeygJFVHR6ZZqMwU3DMwvUwQx/kpSCzBlYARLVv8iXEtoEbL8/XTQ3oePc59I9uhzeRcxfgYsxxuwpH4RyJIwjj6dHxvEacrMagyClOmF5A7WnoKT3WmJPXgSwnMsDWMBUPfMKSqja/am//NsAcAZUQDNEfAWoFDibVZ/vhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GaK60i8s; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-529646df247so3040231e87.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716807403; x=1717412203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wW/MiaR3jXnWDxwdJLVW2Xxy28mrsxrl9BhKZPGbXu8=;
        b=GaK60i8sAFlfni+zt44TRqRJx252/Sl2X+YiAimQM5lQBlPUnCw58HUQVVWyu13cTW
         STJHcAiCrEUwDRXoscf980VGwAuUlL1yiv5HWR6tMSMtMgXeX7ToTIK6wHKTLsqYsGyc
         SYjMIOIppELBRliAxAVWoE1aEJIkj5S/7ORMEdUQzdiC55KAeE442TVyLdyWj86nvOff
         OvHEMP5Onm4CsfMJUkNig2+4n4wKs9dAQEBIfbTsul3lrz1Di8TVEzwZQ4YMxgs2g7N/
         ljY+l/DyfsuNiJQgASHIxae4DDj4Y1WC+rn60HmEsuoXZeRbMNWoPhLqgNNOJpbmBeKU
         VMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716807403; x=1717412203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW/MiaR3jXnWDxwdJLVW2Xxy28mrsxrl9BhKZPGbXu8=;
        b=NonKR1juN9liQaguuS+eBWdDZjZEJujmTOHv/+fbtg5P+EakxuyuGF8wDIrgvwR9pI
         SMwUzmAkKSGZ8HAmm9DkDagASSsnSJws3XTSYaakhnIpRimHnq0+4snMyUFP3gx1U3aD
         aMHRpybdB3CUxd6odeM/cIGFHuYBH9FlLKWvO2rqRv01p19fdRykLRWftZ7rQQhCqlYb
         EkMUXRGjH+iSb9uLrJqTQPM+MMKy0wGwuPHj5BiYRkYODF5Apjyk4cHGnhIQRGk1jp//
         g/BhvNnpApwjLUnD3JyjQLkqG7yDR0aa9ck+gc+Llu8aiibvHRMUFn2WA41cBkW1Gm/s
         RCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhiKHV4FlH2dv/t8YucrcPumt2NZv7jxfTP++lbyAuJol/Oh96SlB28MHbOrgdjSes9Yc+x7fHzLQ2PZSTZwV3R3HKgu+cHylnExw=
X-Gm-Message-State: AOJu0Yzm+DEiUWLq1VxhSn9Pse41m45HBhgCWab3Aw0tKxzvKqASfnA3
	zdg4jBhfFgihHhb1Y/w0w09nzeGT94B7lU/NasT8kD7YpmSsHN+7vQBX1WIs2UrK2VDB+DPZF09
	a
X-Google-Smtp-Source: AGHT+IGhlRFmKb8e+f7202iubQ4ZPny36zKmjYZE2IFqt8j3jeuCvi+hIR6RsizWKfaz4/UcoY4ufQ==
X-Received: by 2002:a05:6512:2018:b0:51f:5d0a:d71a with SMTP id 2adb3069b0e04-5296410a440mr5424708e87.10.1716807402949;
        Mon, 27 May 2024 03:56:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93b678sm477442166b.82.2024.05.27.03.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:56:42 -0700 (PDT)
Date: Mon, 27 May 2024 13:56:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yongsuyoo0215@gmail.com
Cc: mchehab@kernel.org, v4bel@theori.io, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into
 CA_RESET
Message-ID: <e5e1b2cc-6e21-41d5-bfb7-f0f7cf8c6ed4@moroto.mountain>
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308121338.1983-1-yongsuyoo0215@gmail.com>

On Fri, Mar 08, 2024 at 12:13:38PM +0000, yongsuyoo0215@gmail.com wrote:
> From: Yongsu yoo <yongsuyoo0215@gmail.com>
> 
> Signed-off-by:Yongsu Yoo <yongsuyoo0215@gmail.com>

You've sent several patches that have not recieved any feedback.  Resend
them all as a patchset.

The Signed-off should go at the bottom.  Run your patches through
scripts/checkpatch.pl.

> 
> In source/drivers/media/dvb-core/dvb_ca_en50221.c, if the CA_RESET ioctl
> is called, in a normal case, the state of the thread of the
> dvb_ca_en50221_thread_state_machine will transit like below order.
> DVB_CA_SLOTSTATE_NONE -> DVB_CA_SLOTSTATE_UNINITIALISED ->
> DVB_CA_SLOTSTATE_WAITREADY -> DVB_CA_SLOTSTATE_VALIDATE ->
> DVB_CA_SLOTSTATE_WAITFR -> DVB_CA_SLOTSTATE_LINKINIT ->
> DVB_CA_SLOTSTATE_RUNNING
> But in some problem cases, the state will become DVB_CA_SLOTSTATE_INVALID.
> Among the above mentioned states, the DVB_CA_SLOTSTATE_NONE and
> the DVB_CA_SLOTSTATE_INVALID are "already stablized" states,
> whereas other states are "transiting" states.
> The "already stablized" states mean no matter how long time we wait,
> the state will not be changed.
> The "transiting" states mean the states whose final state is not yet
> determined. The state keeps to be changed. Only after some time passes,
> we get to know whether the final state will be DVB_CA_SLOTSTATE_RUNNING
> or DVB_CA_SLOTSTATE_INVALID.
> During the "transiting" states, we do not yet know whether the
> CA_RESET operation, which triggered the "transiting" states, will
> succeed or fail. For this reason, during the "transiting" states, if
> another CA_RESET ioctl is called and if this new CA_RESET ioctl
> operation begins again, it will be meaningless and waste time.
> For preventing this problem from happening, we make CA_RESET ioctl do
> nothing and only return EBUSY if the ioctl is called during the
> "transiting" states.

A lot of the commit messages are confusing.  It seems from looking at
the patches that you have been testing CA_RESET and fixing the bugs.
Please talk more about how you are finding these bugs?

In this case the bug is that if you call CA_RESET twice before the
first reset has completed then it is a waste of time?  How serious is
this bug for normal users?  How much time are we talking about?

regards,
dan carpenter



