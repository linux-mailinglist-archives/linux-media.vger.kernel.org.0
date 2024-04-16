Return-Path: <linux-media+bounces-9492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA88A6719
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 11:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD2A1C20E27
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A99A8528F;
	Tue, 16 Apr 2024 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ld8anvlL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBD8526C
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713259529; cv=none; b=sgxCFzPIzMq3W18BLcF/p6UTc6C1DXE0pF3y3xQpdoNxv33k6ZYx2/yxfwbnm8NdJBxk+WEFwqYzIfZWMiWHi09THLdihvbVXUtg7LlcKkrdm8pGRZYVU7cOA35pznSquEblFcQmvUf4nhRKDI9ZXQxHB236V2KbMeezpYYUhn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713259529; c=relaxed/simple;
	bh=VepDZcY2eTQP+WtI7Tu5jIbh15nahrwfxbgZSV0hGY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtgcS6mE/HyXNXaJLpVnws5wvGxh0PNJjfYOl88+iIJpbFommXRbW3aFLqqtnoxrwt+pSEVpt39Iz3hdu0BZ3sDV3updglAGPseQW3/cj3o5DDS0S9/bA1qQgqUK7YSgeHkqLpNVTpAwC1+TcGYZzW2ELzSygczvCpn8GL/EWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ld8anvlL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713259525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRE7xnN3DPvJ0uPhLpdtosRFGMPJeqCTZUsQYW1ove4=;
	b=Ld8anvlLpsiT/lV7Untdv8fy86w0wDI1FDTPMLF4M2/B9ij7YiEgj/kPwjl6G20QODSUFI
	HVPbXgjPoAz/HKn6s23IW9UfhJgrCTl5Jd1Mdma1z2Ez5Y/DFVUQ/DSCODNiGneUUfq10b
	3CPmvPpO+xoJWcdgYutwXSJRfroaH08=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-QjpmvOwSMuGFcDVRsgENVw-1; Tue, 16 Apr 2024 05:25:23 -0400
X-MC-Unique: QjpmvOwSMuGFcDVRsgENVw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a46852c2239so326436166b.1
        for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 02:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713259521; x=1713864321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRE7xnN3DPvJ0uPhLpdtosRFGMPJeqCTZUsQYW1ove4=;
        b=dFZ8AU2H334Tqrhjk2X3auCE907FXu//szQirvkHZiNEOpvaBbd/qePC4REgbVMreV
         lbdAJtWsCwCZsbn6FhglKT803D94OB4IG3p1y1Vdit+pCffCF+6C1pDfGD316EcQeZCI
         FVE+0j9wtjkgXNXeXgJu2S96CFx1RE+eyQa2EY1vova8vfoG8r5dSuNeVI9bKiXfgaJh
         4ZB2qIBJgRG2qqRkNz+Xxj51VpYn6BC0EUEoM2j3wpFsVFFb9yHzKQpPypAWQfDM5Bof
         r8ytDuwRNj6lHyLqrDPPG37A0bHLEnYYpVbJFLJc1WEKp41kM7T55OTZ4wWT9JigYg+D
         /sTw==
X-Forwarded-Encrypted: i=1; AJvYcCVRzwZHesjlrP7CxdW1OOz49/trbXITyPE2uCnQ5G4nxXD6e9CgVRzJ/H+uj3xjEXlQgD3cylGieniU9BvV2CPzMQVuG5yvs3dF2Cs=
X-Gm-Message-State: AOJu0YzVs2H2eiYTl1K2NJriXKz9VTnNgFkziLkO+mTRwzSsyxiZuM9j
	6P0NYng9esivCgFYS4XMlz5V8iCrNxs1z/louEM4PIAMCqjy0OdSza7mIH3hIpIiQcUyYHmmkbZ
	gY/HDWn9QvdsHWtcHYMv0+z6SdJj/tpTc/Us4TruLBa2En4ZBnSNWTRHa9vCGmi3/TMGY
X-Received: by 2002:a17:906:2932:b0:a51:b3cb:cdca with SMTP id v18-20020a170906293200b00a51b3cbcdcamr10724470ejd.26.1713259521379;
        Tue, 16 Apr 2024 02:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmtUMeOk0F7211QUFXI0CbDNFq2sZ7MSVeKORfLoc2Cpjr5pGkDak4go1DMOeWzc3J/5PWTg==
X-Received: by 2002:a17:906:2932:b0:a51:b3cb:cdca with SMTP id v18-20020a170906293200b00a51b3cbcdcamr10724456ejd.26.1713259520996;
        Tue, 16 Apr 2024 02:25:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a52222f2b21sm6441401ejb.66.2024.04.16.02.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 02:25:20 -0700 (PDT)
Message-ID: <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
Date: Tue, 16 Apr 2024 11:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG)
 support
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-12-hdegoede@redhat.com>
 <Zh08SP60QytSz3aQ@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh08SP60QytSz3aQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for all the reviews!

On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:
>> The TPG support registers a v4l2-subdev for this, but this is not part of
>> the media-controller graph in any way. After manually selecting the TPG
>> as input using the s_input ioctl it does not work.
>>
>> Several supported sensors have their own working TPG and using the sensor's
>> TPG means that the same data-flow is used as with actual sensors rather
>> then the quite different data-flow from the ISP's builtin TPG.
>>
>> Remove the broken TPG support, when a test-pattern is needed for testing
>> a sensor's TPG can be used. Using a sensor's TPG is actually better for
>> testing since then the actual normal data-flow is being tested.
> 
> ...
> 
>> +	if (mipi_info)
>> +		fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(mipi_info->input_format);
>>  
>> +	if (!fc)
>> +		fc = atomisp_find_in_fmt_conv(
>> +			 atomisp_subdev_get_ffmt(&asd->subdev,
>> +						 NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
>> +						 ATOMISP_SUBDEV_PAD_SINK)->code);
> 
> While it was in the original code, this is ugly. Can we split this to two
> assignments?

Ack, fixed.

> 
>> +	if (!fc)
>> +		return -EINVAL;
>> +	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
> 
>> +	    raw_output_format_match_input(fc->atomisp_in_fmt,
>> +					  pix->pixelformat))
> 
> Now a single line?

Ack, fixed.

> 
>> +		return -EINVAL;
> 
> ...
> 
>>  		unsigned int hblank_cycles = 100,
>>  		vblank_lines = 6,
>>  		width,
> 
> Urgh... These comma operators probably is subject to replace with separate
> definitions or being grouped on a single line (as it suppose to be in this
> case).

That indeed is ugly, but fixing this is out of scope for this patch,
so I've added an extra patch to the set to address this:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=48d93af9d9b0fd40a21a656cb8cd8e25700bfed5

Regards,

Hans



