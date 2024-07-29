Return-Path: <linux-media+bounces-15461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2E93F719
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53BB1C2160E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF3314EC60;
	Mon, 29 Jul 2024 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GA0Y1Nun"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57714A0B7
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261352; cv=none; b=CA3JKxcncGkCC1NeN0bDzUrkbkR850ChCmTogt7JmFIDWgxk0vg5ZGRtzYY0mfRsb7XWCNGX1qGhNd9QtBquG9WrjM+8NWOKtU9sxTwjuvGq2QhlY/pHonfQquLRG+xKBuZIRMZumaj+LQqp+nArZf9lvR6eMA5Y8q6NIOt6zR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261352; c=relaxed/simple;
	bh=xRN7p866e/FW0c9l1fzBedo6L/GycW/csRzIacsrPCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtLOcLd3oaKzgPXsE5WVrAG+atSBIEB1KTx/7n2Vw4GACoqi/5fQleVjN43qroD02ebRaIFDfjx8q+jGaaKxfL6XJ4Bc5XZqDF8Rd3NzH9ZxYUyF4rGKFWDyogXfzV3WJGGaWg2BbdzVc6FuulHyL/AZcoChSnM7m7I6tcB05h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GA0Y1Nun; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so694707166b.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722261349; x=1722866149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mpXmig8x1YnvMrEYL0t3QW8oM3Z2Fatn9cQt1eyT8A=;
        b=GA0Y1NunWda4DvTitfEs1ZoTzxDSiNW0e54mGmkDYDWprgceSXssVdmNdsveNu9afE
         rh6JXprGz/YIa/EotzuYaGNTHvTWexfnh6f/oMkvMi1GwydDj1XSK+AYqmVbJLrlQ5de
         cgDYK4TzdSi1AOC98jpyGEEoYKdm4sADEf7ndwo8gMPTw1P8rGvhlvewJeetBOLzwkVd
         N6WQe05tw297pxpk3Rxw5etnHxC4uSr5HV5ITEdna+M+BK69Y81J5GXChcSK26T0FfN9
         HS8kIJHy9+rPOnQJlFvOYGnjKgX7MkSQzls9xCCoU7/jjGad95wiRQ6IgoFOkGNwGxWT
         aTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261349; x=1722866149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mpXmig8x1YnvMrEYL0t3QW8oM3Z2Fatn9cQt1eyT8A=;
        b=sZoIIGtI9iPDb0+THHgNQ+NGmM6AlpUgb23vT/5Gv72sEBIyw8QHGXAWX2dCmvWAeb
         UOg+iKRefXJkKh5HX1EThjxPrOwtfwXtzPVEBjKkM5uZ/qK8dQQG1x1AXqHxNTe/iomR
         n2LO4fzktjPfCKGxFfwGxTgd2XTeyOPubBphJWwIpEaqjYxk7ZkuEYzO9NqeJKMv7aLb
         k1TNN6v6Ra3r5kCeMEmAWgeyt0R2dVwg5buPjMncoVFj5sRKui5BU58GrrCqF4MtrfEM
         3KgCHV16rcm+Qw0Q4cTY5q38k6YgT10Ev2QtUnuK23MNulypxOL15exely4dl5TCwaGy
         SmPw==
X-Forwarded-Encrypted: i=1; AJvYcCW/tHn/xjBbcUgZBFU4eLc2YmL0JmBJdkURM7Tza62znf//Mm/9mI1xftOTvDY3NFvl3EjRJpLu/jgHDelb34zv7puXTO3U5aQ8Q9E=
X-Gm-Message-State: AOJu0YykSebYVBXDQ767/YX/zpCWumTnAc2HXVmVVxiDSe5HvoWR/HYd
	3qYyGBtslbPjGm4uwtDYWC6xP5b/mT2sZI9ISo2a3JfcJCa724hEIv0C7SZOyKY=
X-Google-Smtp-Source: AGHT+IGTsXdujZz5GNzDzWH3IU9qzq8qvO5PsIKkKuziVXaXk734eHlSB+WhBMB0/pbrOGSPdnMB0g==
X-Received: by 2002:a17:906:6a21:b0:a7a:a557:454e with SMTP id a640c23a62f3a-a7d3f81dc2emr838778366b.2.1722261348752;
        Mon, 29 Jul 2024 06:55:48 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4de12sm508921366b.51.2024.07.29.06.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 06:55:48 -0700 (PDT)
Message-ID: <49c45c19-a95d-467f-9cd1-cbcea3aa1fbe@linaro.org>
Date: Mon, 29 Jul 2024 14:55:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: venus: Enable h.264 hierarchical coding
To: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com
References: <20240726213811.562200-1-frkoenig@chromium.org>
 <20240726213811.562200-3-frkoenig@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240726213811.562200-3-frkoenig@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2024 22:38, Fritz Koenig wrote:
> HFI already supports, V4L2 already has the control,
> put them together!
> ---

This looks like something you've tested or should have in ChromeOS ?

Please make a v2

- Fixing the commit logs
- With a cover letter explaining what the purpose of the series is
   and how you've gone about testing it and/or where you need
   community input to test/verify instead/aswell.

---
bod


