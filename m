Return-Path: <linux-media+bounces-9818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30F8ABDA6
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 01:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C16081C209CA
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 23:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DCA4CE05;
	Sat, 20 Apr 2024 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yr5uPDGS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1C482D1
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654033; cv=none; b=kdZsH5Zo6rmUlyYbkr8ql2wUetsaP4xqv12C4QYEelTJpKbm3Kfp+vFBVeVICvYZGWnxTVR5nVdafpt1QnknwDpY2BYve0uTeqD99uikInnGPB9i0H00qDHZGU/Qy6kSoBc7dCQilBlhd5KZA011qVejn5cs67Y3/pwgGY7bHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654033; c=relaxed/simple;
	bh=4W4kNBK/xrEcrUApwzCM7sLtC45HuF/KUzFjcCmXLt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHinww1amDT+ddUdrk7elNVhMX5heti7e7AqDB+G6Dgos2z2gP1xuHJlhxA+0ar4S5lNXDwqDzAhsVCeB4JhZs9iqv9rekri4ftwcqk2n0Tc+HQnGqvycwl8fa12IDSpCBrZmf+JjtCLFRqiu41VO8uhE97eW+ZPNm7pUX27A+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yr5uPDGS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-571d8daff86so1609640a12.0
        for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654030; x=1714258830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=yr5uPDGSisSRWg2BdtLz4v/8WoQaybLA7Pyun9XdF+c2IjnCoJEE+28J0xFgKDDFUA
         jLy+1Ozibv+WHlOotmMQIzz7Z9UDCUBXKnvHmD+40IFh6LhkgWnkb1sUyD07WI/dK5eI
         74ZZo9DP3bxK1rUBP+g3y+19ehWxbKCnYUZQnB/EwNq5QPEXaiRutWzZOdPjzStM7pvA
         +x15lAWyTKucfjzbirdYgmDwy4ZLQ9i8De9vBC77mdCD3xJYXzOGrj4JhacqcTQJOBPB
         uXsFxQ8ML2FJwIgERF7kFGec4d6/ZxJHi/FPJa0cwiwotn1wXqNSdkVOuJKN1Q5ZonZJ
         9GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654030; x=1714258830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=xSIPak5CXlNg5X7ztPZKn62NrPaIurXcrHLmrfOOxbv3Y+7lHOZ69897DnmGPVaJTN
         CVkN6KqcvWkFCx7H+fLf9VfLtnxdx3o2xfQ+EZ/6wn28JNTnRWSwIZ6o6d32dPwkjWHF
         JBvoVOqzfDGhm14/NkNrTLSoB6rjLKRnRMJ22hlsDMb7DXM22GCBUsTgrZkd1vOQtM0U
         6bTa3NlM51IHNX7TNrv2QZdWwRd95ad++DBXt2S0BktUmeLqZksLvHjYBkPEyp0uMwoF
         WEAn9NG7NW5aJ+BUYUK7LVEnZYG2jhA/c7RIlTXcJWQQEM3eOwi3pq8GOx5Oig9v3xos
         w+Mg==
X-Gm-Message-State: AOJu0YwzrPOKtETuxMmtywFZi7evf46peWeYM+7VbJq5A9cEls2nDFx+
	CRvpPPI7VF/7FUEQWbgZp7q+rt+rN6oqQzUZTo/L3G82BZNwvi44jz00MkYdVz4=
X-Google-Smtp-Source: AGHT+IH4lwqPioLpoIzW6dLhOLlXPP3zMShUOxH0TJXNnW3DIij9PpcqOmEnmKfQrSavTUI2UaMo9Q==
X-Received: by 2002:a50:9ece:0:b0:570:cd6:8ef with SMTP id a72-20020a509ece000000b005700cd608efmr4297896edf.29.1713654029517;
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b00571ef2c1308sm913940edb.12.2024.04.20.16.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Message-ID: <9f44c386-4be9-4904-bf67-f0e664773baa@linaro.org>
Date: Sun, 21 Apr 2024 00:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/26] media: pci: mgb4: Refactor struct resources
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> The struct resource end field is inclusive not exclusive, this is, the
> size is (end - start) +1.

", this is," doesn't parse on my end

"i.e" => that is, would be more appropriate I think.

"The struct resource end field is inclusive not exclusive of the size" 
which I still think is a confusing statement.

Perhaps something much easier to understand is called for

"The struct resource end field signifies the end address not the 
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size 
from the offset as is currently given."

Other than that, I think its reasonable to assume the mapping != 0 - 
0x100 inclusive.

Please consider updating your commit log and if you do add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

