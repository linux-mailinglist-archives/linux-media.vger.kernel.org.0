Return-Path: <linux-media+bounces-913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380A7F62AD
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 16:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF3A1C21216
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 15:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373035F1C;
	Thu, 23 Nov 2023 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGQl0c5O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE4B10EB
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 07:24:11 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32fd7fc9f19so624331f8f.2
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700753050; x=1701357850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEinn40liA1Wq5VZRVw57Dr0obouosWn9g7g0dlK6JY=;
        b=OGQl0c5ODriWH9Idn9Depm4X0hGii8sSYPfyBXkfxNAB9bBNaUX/fXi/tZgZMyfHrH
         adhe1JLHXd1sDjXPwUGyO+kUVcF461SLrRP1343CLrFOBmDv0u54uL6ODquq0jdasBGT
         dA9E/7YwJboDhNgccLH1Gnss9jbIPpX5jmxCfsoFrCPoU/cJ+pF5YNCpbXEQ9cnqIKSq
         tdbdoOAOFxG0eLk1gBVux+2AAkS3zFzK5d3bggRj+tDl3GLZcUHpZfyuHwCluqjqCHTM
         UdazQm06dBHVHdKwoYI6udf6x0ByLIwAR365jLn65gsoHhvX5nGR5o92S6jCoIBSRNx0
         zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700753050; x=1701357850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEinn40liA1Wq5VZRVw57Dr0obouosWn9g7g0dlK6JY=;
        b=UW5yWnUoF14tj84gGg1+FO+02UuxiMOPJa8RmiOJz83EcUdOBfiHNhKx0OFltLbR49
         CCeRUAcW1o2oEyGZ0ggSTSztcBeG6GQjUqyOFy5s1WMavSiEpQaRFDOnmHouPWyInatm
         RmM/CzGjvtRfYNP9z293KNsW/aCL5GFq3qbSYOLzovncDjUFouex4+ca42+dpm8FkliR
         igcWErjS2pJZ7FdG7HMcUf2OIgfHOit1l2ORikrUpNm4SrpKKzFDkaXBbCArq6S5SGZA
         LbP7LXdh3aKFD9m3+CtuWCwdBb4wbImid5CeanlDx4q4mW6S+GMzf8z+7jahbIqslzUv
         WSRA==
X-Gm-Message-State: AOJu0YxDDoGipr5c26XZ4KsoogTBR6pxl6bvvsvohgMydlo26BKr/VgC
	8ZULAAV6TKi2pp1b6PwiT7arXA==
X-Google-Smtp-Source: AGHT+IH7pTy4FnZhd4fKfF3loD/98TfZSI67b0QPFriXigNT+iLnOj7QEw2V/Yr34spAxJ4w73j4Og==
X-Received: by 2002:a05:6000:4028:b0:332:c593:16c with SMTP id cp40-20020a056000402800b00332c593016cmr3974822wrb.45.1700753049772;
        Thu, 23 Nov 2023 07:24:09 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n7-20020adff087000000b003316d1a3b05sm1880623wro.78.2023.11.23.07.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 07:24:09 -0800 (PST)
Message-ID: <754f279b-dbe4-46fa-95c9-2cae0481584c@linaro.org>
Date: Thu, 23 Nov 2023 15:24:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-4-55eb0f35a30a@linaro.org>
 <84a97960-dfef-4d2f-8462-d3acb6f5a125@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <84a97960-dfef-4d2f-8462-d3acb6f5a125@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2023 12:04, Konrad Dybcio wrote:
>> +    const struct camss_resources *res = camss->res;
>>       int i;
>> +    int vfepd_num;
>>       int ret;
> Reverse-Christmas-tree, please

yes but ret last

