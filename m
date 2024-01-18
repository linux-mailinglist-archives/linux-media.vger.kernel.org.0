Return-Path: <linux-media+bounces-3839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C88312E1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 07:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E31B23D55
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 06:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAE19447;
	Thu, 18 Jan 2024 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="blnGXbFu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA828F40
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705560970; cv=none; b=mO4FIbB+tT5/XL1I547aGTmlL62uMLG8syj9uLlSFn2LylIoy9kCMH+8avIK24bpRRq15sYY9KeUu2RHuMlpRvyK0z9w+x423FJt5iPTXIutt3qudPYOeFQCovQBzoct6Fnx31BhtS3shDfoRqymepmmIIwLf7Rt6vsBIJdshL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705560970; c=relaxed/simple;
	bh=jTC5Olz7IsyCJRrP76zPKx3b2xOiq865PleDue7ogNM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eNQGZ5gZuUOv48vdq28UN+c5PhnoEfMhvTpIFVVwuEBLnZMnJb+StNVw12qF5YDD7NT0wL/qVlI07Y3SzPpO1M5aDjRhanLXeJeeyaxChGPT/h20HPWh7aUiX1GBN51214IgJXOOeUSF/yelqZeRrO2GvAuRpI8ojGEXf7PQhBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=blnGXbFu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so300254f8f.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705560965; x=1706165765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+cBXqSWjHMhNjAkCmW1hMHJdX7+v0UlHm9R2PCzWLo=;
        b=blnGXbFu1knM8hzXWRuc4FLutway42DdCv6jBi8XdP9jmvOX7tbgp6vV/dbbfz3US1
         ZyWvQVe1h5y5w2qKzeCI670SCg9BMryNCWBz41jjLnEuBb3shiSaGWWGxYmty56Blnqt
         jbvwuNTP4KV3s332aRqsngZKgCQJDa3/rTFRleUHvBATQruLgyDRdU3irmua4uWQMc5o
         iq33gD6seMohhSIaKwuQgJb++XQZcc6eP6L78gOr8+54w9G0UcgLz6uj1cPnx0K8lYpl
         qnwClsG7OAQdCw/7ZUcNj8U2v4vivnHDHYY8snQFzJO5Yf3bubYFF0s8WsuYPuyl2fM7
         nSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705560965; x=1706165765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+cBXqSWjHMhNjAkCmW1hMHJdX7+v0UlHm9R2PCzWLo=;
        b=IXl9tkRlwy24l+f+eNImlC2zMONhDYMDfqtjKnDhtkM8H1WOtqbCG/wRSDseA1zoCK
         c80PEMUfFPWzuhE2iTKkfhp5V8Ysw6DEiFcDFV9esTa73cgkPKQgKB4E9gSYpet5UD4u
         0itF2U62wPBrqNZ339ZaBHm/stMBo9hPWCyCKg8vRKoy4IYSkc1jeIsk46r6yr8l5+Yo
         NUFDEkmrOGWFShoKPKAt4Nt8UemSd8yHFV/ZLZ7whjMkoz9NdJ4AvOVPUO6XngaAIMWN
         DrFU0vMzeuZXx05Bx0/ptOuZu0LnKUd5nhdNaDZJ0VpG4vrjg9ZxtKW6zzXipQhsrK8K
         DCVA==
X-Gm-Message-State: AOJu0Yx9Bn0wUFoIQdT1GnTScRDpzJnSWYbn/660yzF6d32ofXCGhfyR
	qrfVCKpOvghO7IGU0tZSW1nV2CAV4R/jINX7lpSkZ2t49jTblGQPlrVFutWlVfw=
X-Google-Smtp-Source: AGHT+IEpP375TYsoLkpOyQb0a+vaP+sfTRpQ/Y56xxd9qZ0ZdCztSDSohhhBP6mjie01+QP19uuOsg==
X-Received: by 2002:a05:6000:118e:b0:337:c4d4:e32b with SMTP id g14-20020a056000118e00b00337c4d4e32bmr188477wrx.83.1705560965398;
        Wed, 17 Jan 2024 22:56:05 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id s17-20020adfecd1000000b00336471bc7ffsm3251708wro.109.2024.01.17.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:56:05 -0800 (PST)
Date: Thu, 18 Jan 2024 09:56:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tomm.merciai@gmail.com
Cc: linux-media@vger.kernel.org
Subject: Re: [bug report] media: i2c: Add support for alvium camera
Message-ID: <b926fc2b-a29b-472b-b68b-4383eed8b43c@moroto.mountain>
References: <9709fbf7-2769-4b25-ad6a-d59058e9946d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9709fbf7-2769-4b25-ad6a-d59058e9946d@moroto.mountain>

On Thu, Jan 18, 2024 at 09:54:06AM +0300, Dan Carpenter wrote:
> Hello Tommaso Merciai,
> 
> The patch 0a7af872915e: "media: i2c: Add support for alvium camera"
> from Dec 4, 2023 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/media/i2c/alvium-csi2.c:420 alvium_get_fw_version()
> 	error: uninitialized symbol 'spec'.
> 
> drivers/media/i2c/alvium-csi2.c
>     403 static int alvium_get_fw_version(struct alvium_dev *alvium)
>     404 {
>     405         struct device *dev = &alvium->i2c_client->dev;
>     406         u64 spec, maj, min, pat;
>     407         int ret = 0;
>     408 
>     409         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_SPEC_VERSION_R,
>     410                           &spec, &ret);
>     411         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MAJOR_VERSION_R,
>     412                           &maj, &ret);
>     413         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MINOR_VERSION_R,
>     414                           &min, &ret);
>     415         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_PATCH_VERSION_R,
>     416                           &pat, &ret);
>     417         if (ret)
>     418                 return ret;
> 
> Only the last read is checked.

Oops.  Sorry for the noise.  I hadn't seen that it takes &ret as an
argument and so it preserves the first error code.

regards,
dan carpenter



