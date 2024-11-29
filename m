Return-Path: <linux-media+bounces-22376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D419DED15
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 23:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEF1BB21A33
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334D81A4F0C;
	Fri, 29 Nov 2024 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkwwLXSU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E13165F18
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918110; cv=none; b=Ekn/bwh5Seqc7pAcfDRlSRWlc+vruQ6M9McwlQlA4tadkj8sr2dFLidL4F07o9E+jDw5A0TszI8CAlRlkPgJ3I93wpuPRxCXs3NAnu3tZ3eqQAOPv/07xhEeNDcPQ4dwy0T9JeuCjPQfWr1TIasU0Gys4RELAMRQe7Tve32bu3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918110; c=relaxed/simple;
	bh=/WQcakJntjnKDdENquAqv1u573OYRHhGtVyLY82xHb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrnhnfwmgUv3dDwf4t2/c9b2KvMsiEL7LUQTqhoMhizqp0me0gxqXJBxhdCQxCrJNu2lTUodQHrWqpLunJ0WmG3kz9Z/PTqEcEbeE3mKiW15P1AuY5RydOeMvie1cQprWKzt41Z9Csaj3rumywG7zYaBym3OAO0BmgquLfibOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkwwLXSU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e0e224cbso502409f8f.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732918106; x=1733522906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bv+RDL5VtDpiSASI6Cfg2FBEfPwyElLYZP3W3W3ijq0=;
        b=XkwwLXSUDFFRrCzf/W6DXZmOTFEHJwqzSQI4iy7tCDyfXLKguG5O228NVSHjiQwSls
         V/ViTHKWFdY8VpMJYg2ntb4GPxLaWkBWuee4429P6PUMNfI7ukq2WFrim0Efjb3W+1P8
         jR27GdS5fEIFnPYpvqNFVRKMZ86z7bxoja6yvxc+G/zRI/RnW9FF5Avftaeo22oFltmL
         SLadVizSDcdjmRKEr1fTh+B/0OoxpbKDUy+L2llWQXiKLWQ/CSoxDKqZVC0LuXDLKa6a
         tbyTTgXfMqEYa893GFwdI0D9jiAf3Ut0y4T88+dgbUNCXWCHXrpZfTadnoG8XXpgjYoh
         Wwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732918106; x=1733522906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv+RDL5VtDpiSASI6Cfg2FBEfPwyElLYZP3W3W3ijq0=;
        b=krJ17SjPDe+M3hbxaWlUZaey25IIM7Wz9q0rI7LJXlj0aj3uzYpU0jaY/iCp+LH0xd
         FrdcbyGS7gKNK8pgQEr77PUB5Iv+zZisNU2qms4oBgr2o9RPUPhvi/QlOXqX+28ipEFv
         rwiw19oRt8x/iBWXROCjWduOFxJfoXTqYnT8Kefsaq3ucxCqlhY34H5XGw3nD0zOAEPV
         3UhrINjeZ4byI6Dp+UXXzSH46afvqIrv2UO1GVNNikj3otwJ8WbeCFyQzZHaBSW6ZdoY
         dBcMMLbJl7QUw7PNmAzJ/9wKdp+e8VXGcDen9VAlPma2G7vGIahOhcHGtFL4aBm24Ver
         0Dxg==
X-Forwarded-Encrypted: i=1; AJvYcCUVc+KjnwE2JqU+qRhLMBUmJ4YxJ19CFsZ8tnjGXrKsNN81fJ5Bjdbn+nMCfVU7E7g7KiU4Hdd/hqrRFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/dZWfXExJ3lyKKDoYlwSdB9AVsdIbSZnDEZv5h60Zr6f1Ara
	Ky8mtBPDo8AJjeEM0HAlCsur0XLWAbYjUH6mFo62oIKvVEeaaz8/Pk+FNa3/zS4=
X-Gm-Gg: ASbGncthDAfT6+wszKZ7kG4XK9QQLvZTN50LGnNjKTuUNyKsvecxqjZSdIR45qnJ6z8
	pWkkipBwOfuAtEpQhAz63islIIa6FtP9M7cHGXzwcjC1IKw7SHtOBVPA6Bd2CixS/OSRYkQxChi
	/Bbajfiy7BsvUhFBq22VNeciRFy6/nfa1YdLYoGAPkpGbpyNK2jeg6iBGX0VQyNxLRYAQs1soyf
	GnZofbt7Zde1/PGO1d5emm7PbeNrOBMytO3VMoMYMO3kG9yLAMCmoKLvhq9OQ8=
X-Google-Smtp-Source: AGHT+IEHWl/sgWlQ+JvJOImjM3Psic1w8cd3Fdn/taMUlSNKIrgzN2K8BkjTVqK7etuq74l/9gSjCw==
X-Received: by 2002:a05:6000:21c1:b0:382:5010:c8c3 with SMTP id ffacd0b85a97d-385c6eba982mr8609141f8f.28.1732918106207;
        Fri, 29 Nov 2024 14:08:26 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2daffsm5492759f8f.13.2024.11.29.14.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 14:08:25 -0800 (PST)
Message-ID: <f4e47953-5a68-4ec5-860b-820b8eff2a2a@linaro.org>
Date: Fri, 29 Nov 2024 22:08:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: barnabas.czeman@mainlining.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
 <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
 <ac765a062e94d549f4c34cf4c8b2c199@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ac765a062e94d549f4c34cf4c8b2c199@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>> The change does not describe how to reproduce the problem, which commit
>>>> base is tested, which platform is testes, there is no enough 
>>>> information,
>>>> unfortunately.
>>> I can reproduce the problem with megapixels-sensorprofile on msm8953 and
>>> it can be reproduced with megapixels on msm8996.
>>> The base is the last commit on next.
>>
>> Can you verify if vfe_domain_on has run and if so whether or not 
>> genpd_link is NULL when that function exists.
>>
> I have added some debug logs it seems pm_domain_on and pm_domain_off is 
> called twice on the same object.
> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
> 42973800
> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 link 
> 4e413800
> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
> 42973800
> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 link 
> 4e413800
> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 
> 42973800
> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 0
>> That's the question.
>>
>> ---
>> bod

Could you provide this output ?

index 80a62ba112950..b25b8f6b00be1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
   */
  void vfe_pm_domain_off(struct vfe_device *vfe)
  {
+dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
+        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
+
         if (!vfe->genpd)
                 return;

@@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
  int vfe_pm_domain_on(struct vfe_device *vfe)
  {
         struct camss *camss = vfe->camss;
-
+dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
+        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
         if (!vfe->genpd)
                 return 0;

---
bod

