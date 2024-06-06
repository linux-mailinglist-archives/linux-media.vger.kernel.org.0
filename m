Return-Path: <linux-media+bounces-12637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0EE8FE3DC
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 12:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A508D1C235AF
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 10:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2988918FDCB;
	Thu,  6 Jun 2024 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2q20lej"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE4190069
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717668667; cv=none; b=ZGXmqGBiiNXNOk9qfAAgQ2G7OKF43zpPRaBuXFGDe8OIhgp5tPNAC1DEKA44I7+LH0SQgQtzHuuaqSfGOkUU8ai3x4VPa1rGZ3O7b5s2rG5B7NvgCdVPK4wXAjBRl+gJzA4wHgUgFg3umB8n/MI/MYvn1TiNyYnlgyby+JpYX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717668667; c=relaxed/simple;
	bh=b7Zwm8tYyK4TmWiUeSfOZCpOhR0FISw4INShYVYJW7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfvua+xpJlInGyt3YCVTjA7m3fZSNKo09Sob5+fpJCA/nv83YsYeyt8I+xoMcvJduq8UtWk8L8sNxUy/DglFxRxjC+iBPrqj0wsNjm8bI8rQ+nufpl4UkMEL+KS2WBNTI+x0KGqSMMtTD0LHPRY+iCZvCY47uOCxjeeCWt68DoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2q20lej; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a68c8b90c85so95518266b.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717668664; x=1718273464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSSVkWNzaMpCFwtFKNictH+j9mKED2uTD+OcWRnyLEc=;
        b=D2q20lej//O4Ig5uQBbj9vAnyH0T1qieMUsxo6PmrX64iwhnr0TxxAl1NcBfCT24rZ
         A67yuBK8wJTcqRNkVpbzgegQtcsvhntr3Vqv1dwUskU+8wyp3AqL1kjy3MI80NEu6Aw7
         u4l8F/nNctlaZGkxTPkHOmttdevvYP04dEZ59bOXzjVQoOEuyzucY+gEm0KbVXq7zv0/
         Tc3PQHAFfyK84O7HixMMsImZuzFQ4jgRV3lqsxjxnZ0JeZr2MeEn+1SM2CKAW5FopqAV
         /BqNkrxPLNZAVPt9BmZi4HRB5HIEKXlWm4g6YP0jIDqLSM/cGaczjuZsf+W3PAr2JaQ/
         4EmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668664; x=1718273464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSSVkWNzaMpCFwtFKNictH+j9mKED2uTD+OcWRnyLEc=;
        b=Eb4CTLYFvDYeWVlDlju4U1VJzQZ5aTOzkwknenrICeEOSuKsomikt8qTdqxJLv5cb5
         qB7msQAGx9tlO6O3ER5fJI9v/6KZAvBV49uvVHnvgrJcNIS2sHmsRy2v6uSHBxMBCPFi
         /y2HnEufB4TPvn0/2zZ+qiEX5JH5SzlPYs//jxY5cLJ2kDBV4ClQShXyLmIkdBbLTBaA
         RKQ82S0e19pSAho+HqpYqj0SfCgdNIvHOmp5befAD37fluONbM8/PLtb33JoujI/hNgO
         3sr2th28XXNQFQcsWe6Vmm6ydqdnmiacD4Zk+WpkOGo5fT3Vd2AXT4beK45Sm27EW5sN
         nV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqFGjxk7CMbwjUzoQFCCNa7BbkZtkyJFQrBScoApkDzNeRs4PQa1ztVRbbXYnugtg+4pqhJ4LWTShNdbqDFhCX1aOfq0Sztr/ULsg=
X-Gm-Message-State: AOJu0YwTiJqB8v3QvuH+B27iRNz7STnE61NlN8p9m1AgNyPkdue6w3Rr
	RLMZWXOkurdHMaa8eXtmCYGSabPfvy0k3zZs46FuO/ZmE5iekmhknDTPWeYKDIM=
X-Google-Smtp-Source: AGHT+IHgvRJe1RUkX2wfx8nHAOigl0CQ6MgWP7QQ3TJu55eCj7i7cFlbxalhn3Ifzf+AU3sxSjybWA==
X-Received: by 2002:a17:906:3544:b0:a6c:71d2:3311 with SMTP id a640c23a62f3a-a6c71d23352mr224386166b.65.1717668664006;
        Thu, 06 Jun 2024 03:11:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c84aa8351sm49462166b.142.2024.06.06.03.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:11:03 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:10:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
Message-ID: <2b979aa4-3a63-4010-9670-294ce7624e18@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
 <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>

On Thu, Jun 06, 2024 at 03:12:03PM +0530, Joy Chakraborty wrote:
> > These functions are used internally and exported to the user through
> > sysfs via bin_attr_nvmem_read/write().  For internal users partial reads
> > should be treated as failure.  What are we supposed to do with a partial
> > read?  I don't think anyone has asked for partial reads to be supported
> > from sysfs either except Greg was wondering about it while reading the
> > code.
> >
> > Currently, a lot of drivers return -EINVAL for partial read/writes but
> > some return success.  It is a bit messy.  But this patchset doesn't
> > really improve anything.  In at24_read() we check if it's going to be a
> > partial read and return -EINVAL.  Below we report a partial read as a
> > full read.  It's just a more complicated way of doing exactly what we
> > were doing before.
> 
> Currently what drivers return is up to their interpretation of int
> return type, there are a few drivers which also return the number of
> bytes written/read already like
> drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c .

Returning non-zero is a bug.  It won't break bin_attr_nvmem_read/write()
but it will break other places like nvmem_access_with_keepouts(),
__nvmem_cell_read() and nvmem_cell_prepare_write_buffer() where all
non-zero returns from nvmem_reg_read() are treated as an error.

> The objective of the patch was to handle partial reads and errors at
> the nvmem core and instead of leaving it up to each nvmem provider by
> providing a better return value to nvmem providers.
> 
> Regarding drivers/misc/eeprom/at25.c which you pointed below, that is
> a problem in my code change. I missed that count was modified later on
> and should initialize bytes_written to the new value of count, will
> fix that when I come up with the new patch.
> 
> I agree that it does not improve anything for a lot of nvmem providers
> for example the ones which call into other reg_map_read/write apis
> which do not return the number of bytes read/written but it does help
> us do better error handling at the nvmem core layer for nvmem
> providers who can return the valid number of bytes read/written.

If we're going to support partial writes, then it needs to be done all
the way.  We need to audit functions like at24_read() and remove the
-EINVAL lines.

   440          if (off + count > at24->byte_len)
   441                  return -EINVAL;

It should be:

	if (off + count > at24->byte_len)
		count = at24->byte_len - off;

Some drivers handle writing zero bytes as -EINVAL and some return 0.
Those changes could be done before we change the API.

You updated nvmem_access_with_keepouts() to handle negative returns but
not zero returns so it could lead to a forever loop.

regards,
dan carpenter


