Return-Path: <linux-media+bounces-42408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76372B54799
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4BC460025
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 09:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5E5296BC5;
	Fri, 12 Sep 2025 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7dEpU53"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A128CF41
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669255; cv=none; b=fycHGtJRfYIpwXgqrSP+/Up2VmdBc5ax2nIvAkpB4D9HF5YNgHxO3YvajO+CG6VhXQhY9x3zH/BOs3y4HW4kjRmZxgNvGHJANWXCgECKWihvvw1aS/E5DVZ6EWPf8fBgNUpT0XOl8dGSLcBk/57y9unD3JY6o0T0p1hEbYe1o4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669255; c=relaxed/simple;
	bh=gfb3JWg2h2wLQhK4UM6/FHhhzCI5uALXsimWBNV6NQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UT7lx/7TEi+GBaXLPwYl9xTGpLrC9JDWoKa8EmHRtkmKqd45D7srAn122mMsP095RR9mXEw85F0lz3L5XBNpqS5U0qlLw9K+njM5ZL22pFzeveaJhMTj0Aaq2M7rVfuRxvnrDGW/rAM6ogKx0eYqSRImYuizLRkI9gedd02Vujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7dEpU53; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e77e917eefso278747f8f.0
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669252; x=1758274052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXTEITSzQJNG4FjEV+hS6a+GXTf9khmRm1tSXLrtGVY=;
        b=m7dEpU539YkuMk+HjGAlAb2g9NHmyecjpnoR1tGRljWMsSvfcURCKp6bS6eEvh16jf
         IEo0JpqDwLhKNlY1KrZO2yyu/3GbPKKrwioFjogbcnrgWa32jbswKy2llxEnaHpbLsXC
         3ctMFzst0L+btHshvkQ19p0L9aRU5F46X/MaTZ39AmRHl8Ow8p5edj/XFNCqzql5yOUY
         4OS6xCfAeg53yoil07rl5yk15vdoX/c1kO7Ri8JCmzfb0S+ZUeDcYZ5OiJlx1nggZEx0
         EhLaj4yNq3xO2YRrws2isUwKxUXw0Hu06BiejtC5OHp0uknlggiCZkywg0hNb0/CUPkF
         0AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669252; x=1758274052;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXTEITSzQJNG4FjEV+hS6a+GXTf9khmRm1tSXLrtGVY=;
        b=MfW0GQpFOI7rR+AJnDReNO3vd7r9Opib5zruJ9fYUU0u2TlNXZTK2aejB4wNcpDTrG
         cmBi8d47WVliypPLccrug7xNMeAPcd62EWuKClACepPsaU9C7z2tiT8kr/Y3OpIjGuZU
         LHvfXrDNJHzV5ZAobEZOUZi4p1cpr7ivsHEgVqmSAmOQx6tYDxTa4QiCvbbWmzcpBBdP
         16TqS/CeOHW0if6cZQ6chxtuMMW9NJo4BeDSm+Ns3BMggsoTyvs/GvDMVHvi0s2roF0r
         EMA3ZLkPFiqF4EQrHjz8tELXQbWXLake0oEJMzwhz6t2N4vsiGx/cI671SdvKC7h/uBS
         xbVg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkHMcrsb3D+YzPHaqK0cOW2xgQtU3qfL/IpWyHHNGb9DMKhbg+j3DiDcBkzUZvIPqqBgSDoOVY11pAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPkGLIWRtq85R+9i/+5Ww7PLp3Dlwkm7IM+r/8zmqhv0+K6fE
	vVNz5q5+RXfqYqg2fNjUWaawE7FvwFMojEIfCU1FM86bP+flksUMS+fu4G2zu125UOg=
X-Gm-Gg: ASbGncvv57oM2+c8F/q0+Fs9+p85/7fakDg6YQOFwdd9QSZRCgWNBVO3Wjdl00OpdGO
	fmFl7vv0CdmS7Icfly/ChI4WjhKVMBfXMgxeXsylU7JLN+9aP0u7vnyz3fDln4w276FEEodrynz
	hXLyi4Qx5XcCyNZLcJLTf27EgnbrjXvWGjEDVkWFzKTYqnszt25EtkTqoHpX5IXvq3K3v/6OPSw
	KRDbvGdmfV0tjSkR4br3AYeaHq7aQcbXk1CtWcZZc0Q0RmcZl22mv1W/3nwamFcWIOydoYbHN6u
	fAzTbeDv9V6b7jBgBQ9hLHVHKZyXh8cjgA7Dqr/EcaS8F1UMERBl/4Sk6Sd0ptu8mkGBZGZyut6
	NaaEMQ3LiUg4tnDIdb/MDhjwvotg5LXiV2fHjnLLECNyK8X6gBA2XbWuoZN8/YJvOXqtUf6e45A
	vxDF/w2/E75gLSDh0skAq9br5JtNoe+Q==
X-Google-Smtp-Source: AGHT+IHRwP5h9u64faaN9sgkAgvq6Wk5wiLsJZGVMHzOBMSe2Z0sqeUItiFW4+Kj3CxqqJN1+tBQMQ==
X-Received: by 2002:a05:6000:1846:b0:3da:37de:a3c2 with SMTP id ffacd0b85a97d-3e765796575mr2314314f8f.24.1757669251882;
        Fri, 12 Sep 2025 02:27:31 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760775868sm5886336f8f.1.2025.09.12.02.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:27:31 -0700 (PDT)
Message-ID: <2a96dfd9-a5d3-479a-a60d-698e0c235d2a@linaro.org>
Date: Fri, 12 Sep 2025 10:27:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
 <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
 <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
 <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2025 03:23, Wenmeng Liu wrote:
> 
> Would lemans-evk-camera-csi1-imx577.dtso be a more appropriate name?
> It more precisely describes the content of the dtso.

I think that's a good idea.

For example if you added another sensor to the mezzanine board on csi4 
an ov9282 say

lemans-evk-camera-csi4-ov9282.dtso

The only problem with that is you can only enable the camera in one dtso

But that feels like a problem to be solved only when someone upstreams 
more than one sensor for this mezzanine.

---
bod


