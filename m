Return-Path: <linux-media+bounces-7172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C7087D9B5
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 10:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016E11C20C14
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 09:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAAC179AE;
	Sat, 16 Mar 2024 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FG9utNCz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E1171AD
	for <linux-media@vger.kernel.org>; Sat, 16 Mar 2024 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582870; cv=none; b=pX60jWh2GUX0pPzBvPINfl1L497tM9m0J3Fty6AXZTqAdOtbyAOi9Ql3XXkb7BGEcohL5+l/12V/CgIG5SxP04uzEgxJk9gSaov4VyWU9FDD9djC/DQBKLeFgc9SeJnwg7TaWFMISHqBz9bgxd2eogSDgdB989V8s7hFHFhXsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582870; c=relaxed/simple;
	bh=ZURjWQ0z8J9iMpWDCfj5S35OKiVed4IPSTV8z6Rtc5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGp2hGZtLwTvg+mZw5h7Ipg3yozdacUEdTeVz9nDoaDzAYulSN0MYqtPKgNIia7eptRBCOPihwuHN2BMWTtU6i0ZCxRpanNcD/os2UxIH1w8ejk2ZxX8xd4iAcTh1SJPQWs40goxP5mw2zBr9zJXQTkJ5jgu7YoWHyzuIo1TrTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FG9utNCz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41408d1b2b4so1311515e9.3
        for <linux-media@vger.kernel.org>; Sat, 16 Mar 2024 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710582867; x=1711187667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+aJq4TCHjLEP2v4oV3Vg7UsskFCSSGQIhDc4NnpdzE0=;
        b=FG9utNCz5G7CBRNg8Fu9tJ1Px74CnTlKpHrltmsrA5STo6OW60i8Nxe7RehNio2YUp
         iVQ4XH2SKJ8vtFVfjz1zR30VDSBU4tlb8vwj+AbSZPjXSxlys1wcuPYLrJ26VxEoJexY
         FIrFPxyvRg4ICZtXAp2oMvMI60la8vrw9BYxY89TfwXgim8P6jeXwMUSD95RNSZDM97H
         0UXeH5fSk7VEVwB73VoJdpZD0M74orCnDUD2Clg/PyEahyKDQUOWyGW1bQyZEDAi0cDo
         LgoTV/85WcwDJKF3NHIug1LBvR7teL6TZN9pxtztrzWoAnDQpoe1MYop7T/kwxLYNX8y
         KvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582867; x=1711187667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aJq4TCHjLEP2v4oV3Vg7UsskFCSSGQIhDc4NnpdzE0=;
        b=J10fntfkXV2FiiMjbBGs8bqrQXhsFDID/hAwfI9NOLeCTMhK19FaDa/6zqRC39twq2
         0NkDcNbGod23BTctzvIZvv/1u8ra8gQ6omWmILha4cSG6MBYtJsXtDzs0DOUzepVfTPb
         xamHxUyrH1LLNwqIfOXqv6Xtz9G5JgkXI2kMm7BMVA6+pQvTE5dBoUo2EQOiw/eoSFrK
         wkBAzgXCJ4ze+TCQHqy8leigRSjV3m0II/e8tp1eiixBQRGum2lIUDsU27aAWj5TGkPc
         pXhwOdzx2z7qXmsMpfc4QtqGtt4E4UDIBc7HK3UMYRJPBz/GXobVHqLrCGrYUo+O3ogD
         kM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6Uj65yOHjCytIRiOq+8C96C4J7O6di20S9AW31Q8IOUUQOEv6WKu/DlFfX5nA+HGiZOhhtFepT9lXqp7J5lOLiBXm7DeYIAIgZjs=
X-Gm-Message-State: AOJu0YzyPEoxOKcwsj2Vzjqh+GczA93opqnFfTfsQAOJgByeYxYfT2kU
	NIHwOh0y9Pd12X56cHJURHSMaRz4UrGw4MnDqYs14wFULKJajTyyuVjPaGG0Xjc=
X-Google-Smtp-Source: AGHT+IEPiRTwG9Zahgo1DOeVbxJuq3wrVgz47+wBmNuBuA7+F4ZZIz2UOlrryPABayLeQQjGX9zgfA==
X-Received: by 2002:a05:600c:4f50:b0:413:1622:4d04 with SMTP id m16-20020a05600c4f5000b0041316224d04mr5547199wmq.12.1710582867348;
        Sat, 16 Mar 2024 02:54:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b0041404f017easm2595283wmq.0.2024.03.16.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:54:27 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:54:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Use common error handling code in
 rcsi2_parse_dt()
Message-ID: <0b77e146-df2f-4fe1-a4e8-206a62a5ac59@moroto.mountain>
References: <8b4203dc-bc0a-4c00-8862-e2d0ed6e346b@web.de>
 <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>
 <260d82b6-e7fc-40c3-b414-50a883709fd7@moroto.mountain>
 <ZeWnD9YrXLWJYmhT@kekkonen.localdomain>
 <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>
 <20240316094652.GC2092253@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240316094652.GC2092253@ragnatech.se>

On Sat, Mar 16, 2024 at 10:46:52AM +0100, Niklas S�derlund wrote:
> Hi Dan,
> 
> On 2024-03-04 14:16:56 +0300, Dan Carpenter wrote:
> > On Mon, Mar 04, 2024 at 10:48:47AM +0000, Sakari Ailus wrote:
> > > Hi Dan,
> > > 
> > > On Fri, Mar 01, 2024 at 04:42:01PM +0300, Dan Carpenter wrote:
> > > > Sakari Ailus pointed out in another thread that we could use __free()
> > > > instead.  Something like this:
> > > > 
> > > 
> > > Looks good to me.
> > 
> > Thanks for checking!  I've never used these before.
> > 
> > > 
> > > We could merge this with your SoB (pending Niklas's review). :-) The driver
> > > has been since moved under drivers/media/platform/renesas/rcar-vin/ .
> > 
> > Alright.  I can resend this as a proper patch.
> 
> Please do.
> 
> I do find the idea of scoped operations and the syntax
> 
>     struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
> 
> a bit foreign in a C context. But I think the intention is clear and it 
> allows us to avoid having the remember to free the fwnode in error paths 
> which is a nice thing.
> 

I said I would send a couple of these but then Markus went ahead and
sent the patches that I was going to write...  And then it was like,
"Oh, these have some questionable style issues" so it wasn't clear what
was happening and I lost track.

regards,
dan carpenter


