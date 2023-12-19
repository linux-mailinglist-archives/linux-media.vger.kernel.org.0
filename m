Return-Path: <linux-media+bounces-2646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8F81871A
	for <lists+linux-media@lfdr.de>; Tue, 19 Dec 2023 13:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B32C1C23469
	for <lists+linux-media@lfdr.de>; Tue, 19 Dec 2023 12:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1A2171CA;
	Tue, 19 Dec 2023 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9xweFFZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956C168C0
	for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so48974455e9.3
        for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702987859; x=1703592659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhDKhnFRhX62KT56W/f1f4kBUI7xMaH12X5JnpsUR/o=;
        b=P9xweFFZ6U377+2c/gr1H1oikQ6XPS8J/BAtj6bpReJLCDtgV0zKe0yq1d4HcwXlZb
         yHnzWEjIVmE7pBmElKHj3WkgkQJjZKEFE19tNO7KkccpIqqb3rJ61naxWmv5qUsy9xJU
         6rwD3Ex5JJXoEX/NLgnMtRzeaWD0nf49eJ+g13WfpcNxYHY2xWBKHKvImXHOHKxajOBI
         n6aTvgdRo//fbE0g7FjE7wtRs1nS3xNzzsnBeoBErOSqPKjH3uJTy32jdqiCLIMwQGs7
         qxnQpsevJu3Uq5Db75NXzBl/eGyVioQQyfJ/+OTwTw4JdHHTBxXoSndjdc1aEV7qjKVs
         6LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987859; x=1703592659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhDKhnFRhX62KT56W/f1f4kBUI7xMaH12X5JnpsUR/o=;
        b=wui0o+xW6j6t+r2+bp8tRxJWQ2wDwJhO6yZ5GEyXKTZuEbwuX7nZv4BLEBvyKHOjSD
         LWtucGQFcTZDHmSouRc61d7HNxe/6SFMLs2EKhz7T/UZBvWKxeOX/0D/VYunJUuvy1Eo
         dqymH7tB9FbgzicPCBYkMPHrDTzZ3eTp3V0oMt7Yhoid6P1lmtSvJVR4sRl2lMsZv2Ph
         +l1AVllSYNGxvYo+iMND1xAKI1K5rA8JLjTkI7eDTY/eA2+QUmKkfP8XbayKVGhAJnYS
         H79rIV0GC1iQpju0m7X3wxLz6FwTBHgChSv0atH9i7E8H4iD5Wg1r/4JMKIh7JQgCkUB
         6fdA==
X-Gm-Message-State: AOJu0YwhTWh/Y7HlhpWANcaB77vxNEQVNmAPVngD8M5USuF4uqPdLshs
	QiGEKQR6XQnc91dHRRnPBg0+OQ==
X-Google-Smtp-Source: AGHT+IGnJJlN6vxrV2VPiXvkBYeZ/k2kli8H+SAI8GUaR+Dw7LaOITWIPfTrmXNqqB+TXDqBfl1sQA==
X-Received: by 2002:a05:600c:4e50:b0:40d:2376:73cd with SMTP id e16-20020a05600c4e5000b0040d237673cdmr599148wmq.94.1702987859240;
        Tue, 19 Dec 2023 04:10:59 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id w15-20020adfec4f000000b003366cc543casm3724499wrn.102.2023.12.19.04.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 04:10:58 -0800 (PST)
Message-ID: <50eb1dd6-f7b8-478a-8ddb-1c7d9bdbe413@linaro.org>
Date: Tue, 19 Dec 2023 12:10:57 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/34] Qualcomm video encoder and decoder driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org, bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <a033dfc5-dcf1-4969-ad4d-1836ff9ff0a3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a033dfc5-dcf1-4969-ad4d-1836ff9ff0a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2023 18:38, Dmitry Baryshkov wrote:
> On 18/12/2023 13:31, Dikshita Agarwal wrote:
>> This patch series introduces support for Qualcomm new video acceleration
>> hardware architecture, used for video stream decoding/encoding. This 
>> driver
>> is based on new communication protocol between video hardware and 
>> application
>> processor.
> 
> This doesn't answer one important point, you have been asked for v1. 
> What is the actual change point between Venus and Iris? What has been 
> changed so much that it demands a separate driver. This is the main 
> question for the cover letter, which has not been answered so far.
> 
>  From what I see from you bindings, the hardware is pretty close to what 
> we see in the latest venus generations. I asssme that there was a change 
> in the vcodec inteface to the firmware and other similar changes. Could 
> you please point out, which parts of Venus driver do no longer work or 
> are not applicable for sm8550?

I'd like to hear this detail too.

Grazing on some of the patches here I saw were we adding vb2 buffer ops, 
which is already supported by venus.

Similar question on booting cores and doing a busy/wait instead of a 
rendezvous based on an IRQ.

I feel there's a version of this series that can probably unify the 
codebases but, am open to being told how that is incorrect.

---
bod


