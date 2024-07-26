Return-Path: <linux-media+bounces-15356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1793D017
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 11:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D4F1C21705
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D757178392;
	Fri, 26 Jul 2024 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVNMFbeb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F0B6116;
	Fri, 26 Jul 2024 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721984828; cv=none; b=IVxKO0oZ2g+9Gh1aY3o3K8BGBRus3R6lUEmV/G5HqV16muYzQteJv5xMlHowLGq/XSfOK0zZko45ksQR/bsL0ElKu1opybOCDpAGudRSvAqXd93gO0LxAJHj+aXgVx1KO91SNyY+F9eYNVVKAIxSlm2SObx/j7IAGTrmQ9nuonc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721984828; c=relaxed/simple;
	bh=3yIvDPf4c4n64KaHraqTeElhOaLSm//2zcmGLJWmaBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRafrhpmm8dLsy34zryczc6GnNeR3QjBDDs2/6ED6P6AQ0YPflIVbhoJg3hz5ZeWau9rhkrSWdxkJ/YDnSJQfdh2dWPgq87uNRG7QmD1RJgbzyJRh+cOvqcXq0qvPpHVoWnNnK9m55eCMDvxRyhONEIkT0bOkajP2gYsbR6MPwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVNMFbeb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso157365266b.0;
        Fri, 26 Jul 2024 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721984825; x=1722589625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bw4/r9lMITSTEkd5cCo5TIRQmnIQ1OcJpAvLpq+BYEA=;
        b=OVNMFbebszgFPeXsvX8BY4/7/C45CV8KbTq4kMgePiU3igIsaeJvT4sP05DdH8HyEu
         ypLwka5uT+vyqr0JY5ZqW8bSdiiTuTcby3lGJrv+y/3kz522TukUupO4gHlfwbHq4WYb
         G7MgYYeRj28F/2rPZZNPb2ymlcC5cAlGs4NWlNTOB6Oc/tpJEPWMpY6flK0aQImG7RF2
         mdfgjkOYCub6i/HIK9zi++KeFyFKha+jtOU8Arp6rmi5wEDqOzozQqLhbneG77Wl7rKh
         0vZVSWU1AI04JBEq/LRzl51Iwhwhjf3W5HDahn+wVsS7vNnFucOowwrBf46Hk6tnz4IU
         nExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721984825; x=1722589625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw4/r9lMITSTEkd5cCo5TIRQmnIQ1OcJpAvLpq+BYEA=;
        b=IyVbzbYkCbOvgrxJo8o2XC9iuzpoRlstPJQhx0NcWeC8RfPf6zpgPI9LjaxcM0b4E4
         61dZ8CWuFMOQzES4ZshRQwiXrE22jhWUXlzMt9OPdcEZeevGxDr9IOsNT0V5i8vomFYW
         QC8SnuUOFt1uoyBMjUEBvkRtJBLMoExeRqOMNIHYJh78CzfKdwd+d40oUbsJgQGAIwtw
         bn+VQETfDnF/4Hh5d7fbedfbJ7KOLJQtBmN/GI/CU45zHASH4V5Z1fhwr8lUJCduF5zV
         9Ki/WcA+jmcbMDmsAkQYmXrFoh9PmnHF2s2u/yefCIjti83ZVV7HXT7VFex/wereXSWS
         UU2g==
X-Forwarded-Encrypted: i=1; AJvYcCXHDcHsY/baViV7EHB2soRheHwKlVn/eYKyyG8/lN5lzagVYVDQYOiLafvkNLf1pWlfN25NXI6DbBYRSkyY7n7Noq5G5OFJFRqJT889SWfFJhH6powRlyQ/u5FnHBh5tdqHYBvmObU+gS3GoqH3jBy9EODqFC8tkJJbP+sj3tXKpGx4oLP8QA==
X-Gm-Message-State: AOJu0YzehBVZMK8zU/d+nIoR34CmMf+X18lOI0KwQfBM0T7jvVwIP9KU
	E94nXLFF1wOtqcbrxOW77TWyPDXc//wfzsPx/BcQOcimmB3ISB2jsbUeb233
X-Google-Smtp-Source: AGHT+IEoQEUmgZstEOUR1vOkfuzEkJVmKeDZecSqcjIA/p+1ZM4shsAPY8qdln85IyZ6agB6BRD0ow==
X-Received: by 2002:a17:907:940d:b0:a7a:b977:4c9b with SMTP id a640c23a62f3a-a7acb4d1951mr323675366b.27.1721984825149;
        Fri, 26 Jul 2024 02:07:05 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4ddb4sm152965066b.69.2024.07.26.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 02:07:04 -0700 (PDT)
Message-ID: <1819d604-a879-40a1-8127-5c9265eb8af9@gmail.com>
Date: Fri, 26 Jul 2024 11:07:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com
References: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
 <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/07/2024 10:13, Charles Keepax wrote:
> On Thu, Jul 25, 2024 at 12:31:40PM +0200, Javier Carrasco wrote:
>> The instances of the `snd_soc_component_driver` struct are not modified
>> after their declaration, and they are only passed to
>> `devm_snd_soc_register_component()`, which expects a constant
>> `snd_soc_component_driver`.
>>
>> Move all instances of `snd_soc_component_driver` to read-only sections
>> by declaring them const.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  sound/soc/codecs/cs43130.c           | 2 +-
> 
>> -static struct snd_soc_component_driver soc_component_dev_cs43130 = {
>> +static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
>>  	.probe			= cs43130_probe,
>>  	.controls		= cs43130_snd_controls,
>>  	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),
> 
> This won't work for cs43130, whilst what the driver does is
> clearly slightly sketch it directly modifies this struct before
> registering it with ASoC. That would need fixed first before this
> change can be made.
> 
> Thanks,
> Charles

Hi Charles,

thanks a lot for pointing this out, somehow I failed to compile cs43130
and sti-sas, which are the only two cases in the kernel that do modify
snd_soc_component_driver after the declaration. The rest don't do that
and I just double checked that they compile cleanly.

Those two cases where modifications are required rely on values that are
not known until they are probed. I think it makes then sense that they
are left as they are, so I will drop both drivers for v2.

Best regards,
Javier Carrasco

