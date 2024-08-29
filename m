Return-Path: <linux-media+bounces-17155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8E964BBE
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13DDE1F226B2
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C80D1B4C3B;
	Thu, 29 Aug 2024 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyCocemH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F11B531B
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724949176; cv=none; b=B9alg1jv6h3Lu1ShXCxX53kXxfDyDavyMNJOizSbWyJNefwjQeqtGg9DBysmLpFlXDrVjChW3ROd7N+UXgrJW5mDcMpnuq1s6lNuNHvb1ZGSn0tWc50R43pn26fzhKLJMP/jzDYkebce4CNEonIT1pfg05wmppm27OppPTB7dAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724949176; c=relaxed/simple;
	bh=dSCVXHR7sWY9fk6J1VD91oXDGZNIJaSS48/kCsYYWOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iqg8QvvHI7T2b6eWpmYpQSqYVKyB6XnvGP7lt06pg2gdhUvkeOL0in1vHYj7QroPXKW+vUkiejNEwYlUus9kqkwDRABzf2dzwl7+Z/B/T4SWxdAwDWudYKZjDYBWKUSFZS8BYHr+fj99v9hQhZzEQ8HeuWGtbwA9nC+AwrDKUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyCocemH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20230059241so7701845ad.3
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949174; x=1725553974; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8fIpsfUdbdQiHUxC2So30sBEv2aDKWQGl8PmSlCrlic=;
        b=DyCocemHxEpL6VIfIVWv2IO0PCFffg+dnq3Ej4zdGbIUmapQBVuYW2vtm7bB9RTPIz
         FCHfXn4hRrdmWx86dlEbVA/TFZvWVZ1eQZVcyKXFgeidIA8yxdQZSF1ThcgAYxKbf2B+
         8OJFv1k4Osm7wXDFbN1mZs0dPTB9pDsLdB21YWgOllrcOoVuoVlg3vSLI4z0ioL7eYkw
         wFCLSBSwRm9C/cWsHfzmXzUNjMaYSsE/dn4zjJ/SpEQDmNA3W1ZbtkGhNtobdUXe+QTs
         sa6Qjs87dQHbUdHnan2bzOB9V3GdVxQMATOE9WX0Sf2o3EqneObSgpNLa64MZJ9IBzIc
         soSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949174; x=1725553974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fIpsfUdbdQiHUxC2So30sBEv2aDKWQGl8PmSlCrlic=;
        b=q7s0dUfjgfSyhGudFQ8jzLviidYsDkuVvElrpYAdXB3cYQLgcpc0e0Dx9q9AsXgC91
         jIqgZ12R05qYqvb5c2b3GuPYsIjskGHb51VkWIqupBR2HU6lGY+z0z/Rd3NQ/uZGBqhh
         7uu7jT6oxpEDa9Ol2BmLevAT0Zc0h0pG+5aFA+OaPEoZt5sSgPTo4xewxD5ZfIOIiY77
         Hk1E+9F0aqcL3bBeVGHsmGfM81B0n+KrZvZT6+QMfe+Us8RU3f+vOY20+FfedTFAWxcQ
         1AgdI3WVLAJY4Y8Iv2qq1sgy+u3VP4/en6xf14lY1S3ZthR7Q97HG44pgISiQEtTvZJS
         sgDg==
X-Forwarded-Encrypted: i=1; AJvYcCXYC0JN1RN70uMLWhXh/7rTNjUGTcK8PXH8ev/r+EtnzLU3JZ535JrO49cZbJk+PW9RCSKNLuQbbFaL6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeAjwwr8G7HomhNW5dJrPiUu7a7ZNiKqVbJ7BRpY+31FdW1M76
	FtScr8a6wvbPaAXgrurrKpHKVISFEYnAB4/rCjuU4z73S+yW8PnbWThztqsTYAW0f1VjCct6D9E
	=
X-Google-Smtp-Source: AGHT+IG4pUefMfrP1y11CX72d+jAGCG1Of09iG3YZnUIDbcwjHHsEI1EZxY3jij+99xXcQ9Y2yPPuA==
X-Received: by 2002:a17:902:e845:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-2050c429e62mr39987445ad.33.1724949174394;
        Thu, 29 Aug 2024 09:32:54 -0700 (PDT)
Received: from thinkpad ([117.213.99.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542376sm13380525ad.204.2024.08.29.09.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:53 -0700 (PDT)
Date: Thu, 29 Aug 2024 22:02:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Bara <bbara93@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <20240829163247.ovsst5ipecthtc6u@thinkpad>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
 <20240829131909.GD12951@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829131909.GD12951@pendragon.ideasonboard.com>

On Thu, Aug 29, 2024 at 04:19:09PM +0300, Laurent Pinchart wrote:

Hi Laurent,

[...]

> > +		dev_err(dev, "Sensor is not in standby mode\n");
> > +		ret = -ENODEV;
> > +		goto err_pm;
> > +	}
> > +
> 
> My last concern is about accessing hardware at probe time. There are
> known cases where this is problematic. They can be split in two
> categories, systems that exhibit unwanted side effects when powering the
> sensor up, and systems where the sensor can't be accessed at probe time.
> 
> The two issues I can think of in the first category is devices that have
> a camera privacy light that could cause worries among users if it
> flashes at boot time, and devices that agressively optimize boot time.
> 
> In the second category, I know that some people use camera serdes
> (FPD-Link, GMSL, ...) that are controlled by userspace. As they should
> instead use kernel drivers for those components, upstream may not care
> too much about this use case. Another issue I was told about was a
> device booting in temperatures that were too low for the camera to
> operate, which then needed half an hour to heat the device enclosure
> before the sensor and serdes could be accessed. That's a bit extreme,
> but it sounds like a valid use case to me.
> 
> What do we do with those cases ? Detecting devices at probe time does
> have value, so I think it should be a policy decision. We may want to
> convey some of that information through DT properties (I'm not sure what
> would be acceptable there though). In any case, that's quite a bit of
> yak shaving, so I'm inclined to accept this series (or rather its next
> version), given that quite a few other camera sensor drivers detect the
> device at probe time. I would however like feedback on the problem to
> try and find a good solution.
> 

Most of the issues you mentioned applies to other hardware peripherals also IMO.
And it is common for the drivers to read registers and make sure the device is
detected on the bus during probe(). If an usecase doesn't want to read the
registers during probe time, then they _should_not_ build the driver as built-in
rather make it as a loadable module and load it whenever necessary. This applies
to boot time optimization as well.

A DT property wouldn't be feasible as DT is supposed to describe the hardware,
not the usecase.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

