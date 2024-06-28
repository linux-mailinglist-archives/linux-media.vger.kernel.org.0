Return-Path: <linux-media+bounces-14316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D955291BB92
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932AB283E4E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570C6152798;
	Fri, 28 Jun 2024 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmT/r7cY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A91CD32
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567367; cv=none; b=gfAjm1IlhX97RECmDwNke9OMekg2EBARPHgRpOV/n0i7AFHAgKcXXhjiuPO9UIaLOmnUEaIaCW1edwS45I/iMNK1QXMSifGCnSDqWj1zg3DRUS8ZEh9fb8IH5Vu+J+tpa0nSaqOlnFBKunceadJvT9XSOxkNX0Aniy4g2c3Coh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567367; c=relaxed/simple;
	bh=AlDZc7MHCm9KsZo7c+JrvwHGid9fjWj4LxgDl/VbHM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4OnQu0IENUctVv9JDs8iLt63lg/D6HDQ7gXhkmhiKhhmNbnGEVJV+HcYdvDnyc1dtyYBaOOYRw5p+V8j8ihdU08a4jJeU1WPnd9HFfJmMvkjp9deSMXDjIz5wm8Fmswx5OSqbJU3qt+o4Jkl+0AwOTsak9ST4TQSHCA5woPexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmT/r7cY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cd8897c73so436682e87.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719567364; x=1720172164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=roCfOUFPgd7o8rvCcHuBauf+iCE7lcvQDUkhj9NhyhU=;
        b=VmT/r7cYiVodpQ49hPsQd+HN8qtAYTgzrnJyyHZrniFb0J3zMEy9gf6axezHhKlKw9
         +5VmMOw6g/PwdWBv/Fsn5dq3fVk0g6tuBGOzacRW3mpZ0p6vq2WG5PiXxVToKIIY0eFr
         U8FUMEJ8h8WEU0HtGDHtj/2cFMwPtmFO0NH8OaEipkTSPLk7bMBv5JyNbJhNHnN0ciwd
         qg6f/V38lBeqYQfPyLXKuetUCqd3yyolrj5X+ELM/PnEFSHdwiUJDzKNQe8oCUpvx5j9
         rs9LKqYxw2wucmsBdgfNH6xOhIK+dVs+Hw5YVy6Tha+9OAFloEJMtidkXSV22WaMOeSG
         wDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567364; x=1720172164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roCfOUFPgd7o8rvCcHuBauf+iCE7lcvQDUkhj9NhyhU=;
        b=iTLAcQwi63m0mKZ8tG2Axw1NLLfPfNMtrjidTl+peAVrYZ793j0ld0fayJgKTUDRGw
         +HRd0G0hmkbq3VYWb1x7qd/vXtFle/KDw37b0UlE9i31LHaOxx/my03i9cUIXU0Yp88X
         JxXcwyWAoATIBCy+AY/uHifAXMhApm6TEAUyXO1nxHmEUUaWPoQDRxO2HO2lzsp3uuh0
         ZjfaUrP+3Yn+wKreAHDd26zKygqY//RftJ3mi8b+frLELYwq/gC09eVg9O1D9KSFXw8k
         sH+w/+ZJ9dAGYkyWE1vMEtRSD5PTFWRGe9JeT0Q6C0rCqkUfkuJgCPl6paqq7fn+PQWl
         V5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVwySpiqfiK+Tfe6e7+kC+HJkfIjT7V7Z3dwLFnVngYk0ELdJL4YL5BC3o036c+ApZ/C2Vq6sFtgtToCl/VpaMmW5OfeDOjNOmOYco=
X-Gm-Message-State: AOJu0YwCnK9a3AAEUiYCkx3+DS2gSqNf+al23QSjh/sGKluxkNmBmgps
	3EUmef2XKJMCkHrzjNeRPzltSUz2mS+k7o+kjwNi+58nVA5m9fkXuV4JMD4MdHM=
X-Google-Smtp-Source: AGHT+IEx9Ij4oq/SEa5jBf0GqmIEP8hci1UFX3Yd+9R86rL1pCaF2nta5RS2eTTlg/nD0A7XkPBWzQ==
X-Received: by 2002:a05:6512:1115:b0:52c:eeb0:8208 with SMTP id 2adb3069b0e04-52ceeb083admr9010834e87.66.1719567364109;
        Fri, 28 Jun 2024 02:36:04 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c18cfsm26547465e9.45.2024.06.28.02.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 02:36:03 -0700 (PDT)
Message-ID: <0585d2f1-dd91-4ba2-8e6b-f53a8ffc4850@linaro.org>
Date: Fri, 28 Jun 2024 10:36:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR v6.11] Various fixes and enhancements
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Nils Rothaug <nils.rothaug@gmx.de>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
References: <d89c5556-57f8-44a9-92d9-0e06b372a895@xs4all.nl>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d89c5556-57f8-44a9-92d9-0e06b372a895@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 08:45, Hans Verkuil wrote:
> If there are no objections, then I plan to merge this during the weekend.
> 
> Regards,
> 
> 	Hans

No objection, thanks for picking up Gjorgii's series.

I notice you aren't on the cc list for this series -> 
https://lore.kernel.org/linux-media/8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr/

That's ready for merge too.

---
bod

