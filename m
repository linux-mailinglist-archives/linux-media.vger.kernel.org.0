Return-Path: <linux-media+bounces-12629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F248FE14C
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 10:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2411C249A1
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB7B13CA97;
	Thu,  6 Jun 2024 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BV2vGp8+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA47C13C839
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663314; cv=none; b=jOPqqBHQT82nd5/2bYxnv8sGAnWj20p23lPIPFTUQe9MZEJV8qlPRfOA47QlrhTkro4BlUHI5tV5cCPmoBh36h7Nrduu4YVhAuHiq+srHd9MYf86ob4/7yYo6wGwJ9f3u0T69Rmi1OCu/RxBVWWkv61FdNSJzobfwbqF2flC6Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663314; c=relaxed/simple;
	bh=Tnid5tfB5kBNwDescW1YCizAMVKFdBOYhN6ibNA8jrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xjfi+QgM5c0SVVeZCwcEKc04PMAZ6S1WER3IHCxkG2khPv6NVRS9ULuZEp5UkrfmZx+1wpIqTDvv5UAXlxozdaQVwPFd+QWabWdADAPJVp71B13Zx6rjYPfFg+PKc4b6u2T5/y/02wR66uq2YLm0hQYr1IyFrFflHXnOVeDNZ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BV2vGp8+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e724bc466fso8446061fa.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663311; x=1718268111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lboqGDLkSlZiXGaj/uzeRuz104hFq0ngZ+Ud/fj/+Ag=;
        b=BV2vGp8+YXaLnNH1waaAKaquOhikkhb2BWhRfWW9k7Va0KXcavSwNjREuP+jVgWRLC
         kQjGxdFGcqbd3zvl+gqz8Fcghyrx9Aqpzn8lyrBSJ9rmmgboMhMwFpY+R6FTTemamxUb
         PbXk39YVIv3VUg2MAlbkHP7QqLUdeLPq3vtviteGDSYQHqH7bQgBr/VAbAWwIIMLzhuN
         YcGS76bZiWWFKOLnJYMQphXg0yszLXxR6NDzfzXgAL9h+t0MVo3CJYxGmVpc/W2KPPTn
         muuE/nh3uL5T+aX4GON7WzoiUjwUSH5rMSA8ZdSKRljIlkkcqCFN2kwr3VKScvrdNGRX
         OKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663311; x=1718268111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lboqGDLkSlZiXGaj/uzeRuz104hFq0ngZ+Ud/fj/+Ag=;
        b=UV/VJ7gw76pnc6QgZll6fBOVaXK2/TexvJCqymxOuIBlHF98x76jLJwO38Wqblkg4D
         AbtEvMJM6wmUP8ZjDwgLfppDfPeeb3U1N47rOb4RSlr91W/2QNDvYeMTGtC7iSKkhJUV
         L0Zb65RvVV0QFTdobUjDcH2QEQPvorIfplrGs0GE8mGOKsd/3SNX7/+MG9jHlBQhum28
         zvdDBXNOiqMYeRJAZt49n7zej9MvBfG2i7oON/L+yR0LGuLj69UVRVhHWVNF6NCq67Hy
         XgEIpwY85UAhiqCip6QhEFQ82SjYQcwzcfQby2gCTFTNutZ3kt9CX+KOHXJfLKxmSoV8
         tdhg==
X-Forwarded-Encrypted: i=1; AJvYcCXPUcu1vFBnSmjIFOyCR69hdXydHkx/IHaamZF8VhTlucIToK1oquC+DESwvkLhebkIXj17TkcKL2Su0t0zTThvTZL5auveOcuOyKw=
X-Gm-Message-State: AOJu0Yxd28S0M/SZXM6BPudYAQN+vrFAs4WJIwCIo5KOa895QSl4E18u
	PlrgIH2DFhmEDW6nhA41E2foq/NEaKRI2uXxevuWuPm13EOlrB3AWnFvt1PQths=
X-Google-Smtp-Source: AGHT+IEzdn9+piYZ1x5EsTOIWqi/J/85mLEB4Nr/4e4HHjN18eVZC+5BHKwFvsEHZndySpOVd4em4g==
X-Received: by 2002:a2e:8550:0:b0:2e6:d1fb:4470 with SMTP id 38308e7fff4ca-2eac7a832dbmr34173771fa.42.1717663310478;
        Thu, 06 Jun 2024 01:41:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9d8ddsm715207a12.1.2024.06.06.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:41:50 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:41:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
Message-ID: <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-8-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-8-joychakr@google.com>

On Wed, Jun 05, 2024 at 05:59:51PM +0000, Joy Chakraborty wrote:
> @@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(sernum);
>  
> -static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
> +static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  {
>  	struct at25_data *at25 = priv;
>  	size_t maxsz = spi_max_transfer_size(at25->spi);
> +	size_t bytes_written = count;
>  	const char *buf = val;
>  	int			status = 0;
>  	unsigned		buf_size;
> @@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  	mutex_unlock(&at25->lock);
>  
>  	kfree(bounce);
> -	return status;
> +	return status < 0 ? status : bytes_written;
>  }

So the original bug was that rmem_read() is returning positive values
on success instead of zero[1].  That started a discussion about partial
reads which resulted in changing the API to support partial reads[2].
That patchset broke the build.  This patchset is trying to fix the
build breakage.

[1] https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/
[2] https://lore.kernel.org/all/20240510082929.3792559-2-joychakr@google.com/

The bug in rmem_read() is still not fixed.  That needs to be fixed as
a stand alone patch.  We can discuss re-writing the API separately.

These functions are used internally and exported to the user through
sysfs via bin_attr_nvmem_read/write().  For internal users partial reads
should be treated as failure.  What are we supposed to do with a partial
read?  I don't think anyone has asked for partial reads to be supported
from sysfs either except Greg was wondering about it while reading the
code.

Currently, a lot of drivers return -EINVAL for partial read/writes but
some return success.  It is a bit messy.  But this patchset doesn't
really improve anything.  In at24_read() we check if it's going to be a
partial read and return -EINVAL.  Below we report a partial read as a
full read.  It's just a more complicated way of doing exactly what we
were doing before.

drivers/misc/eeprom/at25.c
   198  static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
   199  {
   200          struct at25_data *at25 = priv;
   201          size_t maxsz = spi_max_transfer_size(at25->spi);
New:            size_t bytes_written = count;
                       ^^^^^^^^^^^^^^^^^^^^^
This is not the number of bytes written.

   202          const char *buf = val;
   203          int                     status = 0;
   204          unsigned                buf_size;
   205          u8                      *bounce;
   206  
   207          if (unlikely(off >= at25->chip.byte_len))
   208                  return -EFBIG;
   209          if ((off + count) > at25->chip.byte_len)
   210                  count = at25->chip.byte_len - off;
                        ^^^^^
This is.

   211          if (unlikely(!count))
   212                  return -EINVAL;
   213  
   214          /* Temp buffer starts with command and address */
   215          buf_size = at25->chip.page_size;
   216          if (buf_size > io_limit)
   217                  buf_size = io_limit;
   218          bounce = kmalloc(buf_size + at25->addrlen + 1, GFP_KERNEL);
   219          if (!bounce)
   220                  return -ENOMEM;
   221  

regards,
dan carpenter

