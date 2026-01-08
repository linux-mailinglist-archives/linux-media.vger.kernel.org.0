Return-Path: <linux-media+bounces-50184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6ED00F5A
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 05:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58A27301D610
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 04:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4449F286D4E;
	Thu,  8 Jan 2026 04:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjObOs85"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4BD285072
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 04:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767845688; cv=none; b=LzLlVUoyS1APphD4QRpF1axZYhElFJglb01j6CVBhi5HwsqYa06Q2FJb0J74eHdqXRTgLw/Dd1oxj3MXafrmwQ9VahRxMrJ8vX66+wqjJvTkLLXABODzRYk+rlvBs8mG6mGwh0LDCKInOAiPsVuq7gzhsUf/BUQ4BN7rHVnaiUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767845688; c=relaxed/simple;
	bh=5v+QV2skJk4921XwaaCIdZfyxCtahUKTYMsazQJoUKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC9tzXqbz5dr6nS/+xzQzyQVnf3kUd1lL1tFiWpF3Z8ZbCsW+jvVbPIlc5Xo/CPbBOQvy1GNY3Rm6lswUuf6He9tw1RVuR16eK+SMhQTw1pMC+H0HMHq7ymkf2JBbbTm4cqmGthT3a/msLvqDtYlFMnYkXcBbciwNaIc1NanhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjObOs85; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8bb6a27d407so250850785a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 20:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767845686; x=1768450486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yAjFIwjl4VMJZ1+V1C6pz96OIbw8JbCPoa9P5fH03s=;
        b=QjObOs85/sJzp7tOXRyN7XC9v6hjIbf3RFCh4drQXSL23apYWZLl7XKZrp10+OPmM0
         nYwlwkXUnEQ0kkmegsFl1PV0FQd5D6hZbWihISb4vUnf+u/TW9GgR7PMcrXLecbMU8s0
         2dt5NH0wNNON148WOnic3bj7J6SFGWblXysL6wicEI18dhkmveIurjEOHLTZt5HtgPgH
         E1JhnSBe+yAOHCDhD+I6oq8IKJ3pkuYPai49DpZeD+tTfPj6sTXzsfaIwVUTDCoL/cOA
         PdzLJpbLt1/nVS62HWi+B1XLkKdf9sUmzuC5+Yy/K1IuKdzywlxPpS59Nht9WdyAELG/
         XmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767845686; x=1768450486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yAjFIwjl4VMJZ1+V1C6pz96OIbw8JbCPoa9P5fH03s=;
        b=GvNg2KVj5s+uIJPJIyIasgX09vME/s9aTGfZLQBoIJhCQEX+Ut+5DCY7bQQ7e6oMR5
         RwiSPVhPgLw9q3M3UBnw6vEP7WDplWieYbipC92QSwXe5panCJeVe4gZ3/zxwybiMo74
         m2fUVvChoyVfLhMKXpKT8rRg01FlgooezcYzJjv+sJZhoD2ezIjlV5EhZW7kQM+K2E2f
         eY5tq63o/yGtSSNd12nQkpaDP6WackOn38cxTEnSile4OMMVguk8PkGds6OdZJEB5Je6
         AsBBJ181sKKaMlgx1VWWwBTWtMUxln+Zmt/9dLlOy/AKxZYR3qOfaFlN41V8aH5JyaHw
         d4ew==
X-Forwarded-Encrypted: i=1; AJvYcCXEfFbahuk88KJrk6MeM5kVo7We3Gm0IwT3hoMmCCnZCrt1IXESK9ZVqP2ARSaHR8nkGU/tZ8X2SNMJNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzASUwfca/p9xiDZIIn3fxihJOmaE2/MsiglmkcTWmkqUrn4tLP
	4t37jSRAsbw1s2g+o5AxlW6FVAvM73qn6u05si0ziVO5CTOdH5pcphWq
X-Gm-Gg: AY/fxX7sjUe2BSe3uhj+Le61YDd8s9dt2sZerDMaRl+YqWaUDR45QqHNQF2bLr4Cne1
	pnXPrnxxyOrQzKXHUczPiXcywT6C0Gb6NjYnUdJYTrYuFMdcY/AvAgxjUdbGVaIHClCwCtRpdFQ
	68hF9ZEBm5z7JbTO0YgRtC/mtkPhCwI51AHd0ZHXweA88HSWwmbvyTPEyKQHIbyBjNs14VqAT5f
	Hr+YcwCEry9tvEwk7qQsdHZ/Xq24QGYBNZXSax5AkXbU3RQWcSypc3po4QOZqbCM8gf3/wCUa2r
	wKJ20dGm323ccrBB70p7BQ5ebwnyOPcW7doA5PYx2WtKvOX6NvVDrIGz3HttFHL+G/Ryr5/8VJS
	q1psPOM0bO00gZi9i2It0NfvDyLw9zoqsPiSxJWbp3V0Es+B8N7FO3k1erHr3nhP0OHd7b6a9wR
	aCR4oCU+PPEaf/nQ==
X-Google-Smtp-Source: AGHT+IF3KLEAoIR6iLJwpBg2iAqPNGhRNw28m2GAujrjVEQ/ioKoivK+pFkCUvt4wmrDlxfnphqTjA==
X-Received: by 2002:a05:620a:1a01:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c389384396mr587730185a.26.1767845685882;
        Wed, 07 Jan 2026 20:14:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a7962sm499071885a.11.2026.01.07.20.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 20:14:45 -0800 (PST)
Date: Wed, 7 Jan 2026 23:15:06 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aV8vSuCDhqCcuwuL@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
 <aV6qnjyXV-yTLqVl@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV6qnjyXV-yTLqVl@kekkonen.localdomain>

On Wed, Jan 07, 2026 at 08:49:02PM +0200, Sakari Ailus wrote:
> Hi Richard,
> On Tue, Jan 06, 2026 at 11:30:41PM -0500, Richard Acayan wrote:
> > A device tree compatible makes it possible for this driver to be used on
> > Open Firmware devices. Initialization of power-managed resources such as
> > the reset GPIO and voltage regulators can be specified in the device
> > tree and handled by the driver. Add support for this so the Pixel 3a can
> > use the driver.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Uh-oh.
(snip)
> > +static int imx355_power_on(struct device *dev)
> > +{
> > +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct imx355 *imx355 = to_imx355(sd);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(imx355->clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
> > +				    imx355->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> > +		goto error_disable_clocks;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> > +	usleep_range(5000, 5100);
> > +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> > +	usleep_range(8000, 8100);
> 
> Where do these values come from? Apparently 1 ms is required (after lifting
> xshutdown) before reading identification register and 10 ms is required
> (from the same point of time) before streaming can be enabled.

I don't have the hardware specification. The sequence seemed to last
12-13 ms. Dividing the delays are a guess and the camera can usually
open at least a few times.

The final 8 ms wait can be extended to 10 ms (assuming xshutdown is the
same as the reset line). Is there a minimum time for asserting the reset
(currently 5 ms), or can it be reduced to 1 ms?

New sequence (maybe, if the docs support it):

	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
	usleep_range(1000, 2000);
	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
	usleep_range(10000, 11000);

