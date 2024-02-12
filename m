Return-Path: <linux-media+bounces-4971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F668510D3
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 11:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D577C281231
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A848118041;
	Mon, 12 Feb 2024 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMsce6ji"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9317BCA
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733718; cv=none; b=ivDCT1OeIBhGr2AAEtXI4TrwNxCVihVHQAX9fPdpfAlTUSXhJ5mYyFzv1xFOs+GD1EzebqK8CVEoo7SjExtqFk2K2uX3jG2mLe1ZNh3ZBBzSVZYYETfL+hRVgqMZL9lgl+EsIYAQCy5n1D9CJywy89eqIxBA7ESIjf0ObAHLQvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733718; c=relaxed/simple;
	bh=XvOdhPw1IXjl2R8sAKhbKDOaaBAejkPqK8wOjH96vfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVSFCYqEZMNxYKbX23Z+cTFAe/sT92Cr6n/srzHFl84GMqQQwkqtrtJNeswLrmsb+wnlZkDSAt2dVY94cc76x5FJdaJOQSuXOPrgJoemH9jqBNFgaq9oEd6yyMeBRNw6fjN4yEezWkqIMYWKNxM9gqZD0uDPDmmTibkEM+XfyH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMsce6ji; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707733715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRq7w2nWl421ZLhvXkb14MsUc/K4z59yCfnfTGfzk+Y=;
	b=CMsce6jir0k0WSWQMRKzcA9Wn5MDzx9uDAJULyTmDgHDzvH++5G+FIcrV/wqwLWNKNnZyu
	PpXSo7FintyTGVtGbxMjCVrA3cXJWhW7xmMwcbQS88tsyqmr+E9aMhgq3BxBoXtBaMLt+N
	EOe2G5dDmf+S7QFJwqKBtOOsTT3nw9g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-5UvaVppBN1GEn3tXV1Hx6g-1; Mon, 12 Feb 2024 05:28:33 -0500
X-MC-Unique: 5UvaVppBN1GEn3tXV1Hx6g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-560a5f882c5so4243002a12.1
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 02:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733712; x=1708338512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRq7w2nWl421ZLhvXkb14MsUc/K4z59yCfnfTGfzk+Y=;
        b=ZvD6QZGvY+43WwEbsRh5c83R7v66s3JzgtAnV59EQj+erhjUUTK2+w18PXpnunM0vT
         fQ1K0MjlX7B+5Td/7M19MVzQjSmaqUlDTtY64uBouRs3um8jjg4lvY6TUXCdXyB3jlDy
         MqE4LVuWCNVh8kvCXhgtnrUwKbnXL/oL8gyXhEHaq4qu21qtBCrnAKoQkTCLOnIL5cOX
         4TABPucBouBtDKz79LApD8xyeZXiTm7gfLup/CsLy9mLpT3O+Ycsc+JlmhPMBtEiiDEc
         kmqlUe7JCBTT2wRZys+z/V9NHYBhunhhJ207BguKDaKQk7DxeaL2OdWjgwsqF7XG8igB
         c28g==
X-Forwarded-Encrypted: i=1; AJvYcCWe8IgcONosjg9Qy5DFB+bWFuETiBrTPrUSWp6yRZYL7wdalrUaEKzLecAQbVInRJ4FR92Z1eAsFOLdTS5ZLo6ptmK2p6qBMyQx8lM=
X-Gm-Message-State: AOJu0YyM5GEdbdLwJXbRz+YcoUYXK90DpgOwQEB586YQBz6zGwbNbICp
	xWbWFaTfQVzoAn72klgQ3mTiBiUgJxe6BVVYyfaktw32LquFYzg8/dBL5xbI8ViaBtXqKGIMaNz
	i1negx0LkELw0ZjtHCjNzasddn5mSfmi48GWUMtjuAfGNX9UDhgKHyBixr34o
X-Received: by 2002:a05:6402:370b:b0:55c:8d17:1bea with SMTP id ek11-20020a056402370b00b0055c8d171beamr7730300edb.17.1707733712281;
        Mon, 12 Feb 2024 02:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjJ3pLFJ9UMElJKEj4kTyXiIlJ0+t8jjfCUARlThdIWwWH30/zIubOQ/jHsslg1KizQqS4BA==
X-Received: by 2002:a05:6402:370b:b0:55c:8d17:1bea with SMTP id ek11-20020a056402370b00b0055c8d171beamr7730293edb.17.1707733711972;
        Mon, 12 Feb 2024 02:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViyE5DIzGky+3JDRARACaQ9RLrWrrZeXaG+jqeUwP10sflZ1ev//7e5+xJAs7s0oweYR3A3tcK1UZMXPHWTYKaYFcgFJhtHvFrxcWYMTHiFh9ZUsbOGwyblW4OXv3GEQoo
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id el3-20020a056402360300b005614ea3e54esm2604337edb.61.2024.02.12.02.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 02:28:31 -0800 (PST)
Message-ID: <9b8b2fb8-ddca-48d5-bbf8-75ad13371037@redhat.com>
Date: Mon, 12 Feb 2024 11:28:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ipu-bridge: Poll for IVSC CSI device
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20240212091917.342715-1-sakari.ailus@linux.intel.com>
 <20240212091917.342715-3-sakari.ailus@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240212091917.342715-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 2/12/24 10:19, Sakari Ailus wrote:
> The MEI CSI device is created as MEI boots up. This often takes place
> after the IPU6 driver probes, in which case the IPU6 driver returned
> -EPROBE_DEFER. The MEI CSI driver also returns -EPROBE_DEFER if the
> firmware nodes created by the IPU bridge (via IPU6 driver) aren't in
> place.
> 
> If no other drivers are being probed after this point, neither IPU6 nor
> MEI CSI drivers will be re-probed. Address this (hopefully temporarily) by
> polling MEI CSI device in the IPU bridge initialisation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index b2cf80d62ba2..45c39bd93d74 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -4,6 +4,7 @@
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/i2c.h>
> +#include <linux/iopoll.h>
>  #include <linux/mei_cl_bus.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -138,17 +139,21 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
>  	/* IVSC device on platform bus */
>  	dev = bus_find_device(&platform_bus_type, NULL, adev,
>  			      ipu_bridge_match_ivsc_dev);
> -	if (dev) {
> -		snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev), &uuid);
> +	if (!dev)
> +		return NULL;
>  
> -		csi_dev = device_find_child_by_name(dev, name);
> +	snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev), &uuid);
>  
> -		put_device(dev);
> +	/*
> +	 * FIXME: instantiate MEI CSI software nodes outside the IPU bridge (or
> +	 * call IPU bridge from MEI CSI). Wait up to 60 seconds here.
> +	 */
> +	read_poll_timeout(device_find_child_by_name, csi_dev, csi_dev,
> +			  20000, 60000000, false, dev, name);
>  
> -		return csi_dev;
> -	}
> +	put_device(dev);
>  
> -	return NULL;
> +	return csi_dev;
>  }
>  
>  static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,


Hmm, ok so the issue here is that the MEI CSI device's creation does
not trigger a running of the work to re-probe deferred devices
because the probe() for the MEI CSI device's driver does not succeed.

And at this point nothing else is getting probed, so the IPU6
driver's probe() will never get called again, causing things
to not work.

So 3 options:

1. Instantiate MEI CSI software nodes outside the IPU bridge
this seems undesirable since the nodes point to each other
so doing this will be tricky I think.

2. Call ipu_bridge_init from the MEI CSI driver, this seems
like the best option to me. The MEI CSI driver can lookup
the PCI device for the bridge and call ipu_bridge_init()
on it.

ipu_bridge_init() is intended to get called only once
even if the driver is unbound + rebound. So this should
be ok, but we would need to:

a) Add a staitc mutex in ipu_bridge.c which is locked for
the duration of ipu_bridge_init()

b) Move the checks which ensure that ipu_bridge_init()
gets called only once to inside ipu_bridge_init(), this
part may be tricky when also taking chromebooks which don't
need ipu_bridge_init() at all into account. Although that
would only be a problem if those chromebooks also have
an ivsc chip.

3. In the -EPROBE_DEFER path of the MEI CSI driver force
deferred probing to run, this would require:

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 85152537dbf1..3836ac02332d 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -194,6 +194,7 @@ void driver_deferred_probe_trigger(void)
 	 */
 	queue_work(system_unbound_wq, &deferred_probe_work);
 }
+EXPORT_SYMBOL_GPL(driver_deferred_probe_trigger);
 
 /**
  * device_block_probing() - Block/defer device's probes

And a matching .h change and then we can just call
driver_deferred_probe_trigger() in the -EPROBE_DEFER
path of the MEI CSI driver.

This option would be my preferred solution.

I think we can sell exporting this to Greg KH,
otherwise we can also call:

platform_create_bundle() to create + successfully
probe() a fake platform device and then immediately
afterwards unregister the plat-dev + plat-drv again.

But it would be much better if we can just call
driver_deferred_probe_trigger().

Note if you decide to add:

EXPORT_SYMBOL_GPL(driver_deferred_probe_trigger);

it is important that the commit message properly
explains the problem (with a step by step what
happens in time which leads to the case where
no deferred-probes are running while one should
run for our purpose).

I would be happy to review the commit message before
you submit such a patch to Greg.

Regards,

Hans


