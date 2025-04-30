Return-Path: <linux-media+bounces-31383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78524AA4578
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA3E4E38FB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CF620F06A;
	Wed, 30 Apr 2025 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQsh4Ibr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28785221572
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001813; cv=none; b=rxNI6q990qgVE9HVxlLz0iAC18+UkVl6nm5CpeUi0AXttVxRqZEWWQQ9dKslAJEVWzC/G6KL+PhwaqKGxbDR+BAiQw+WZbaLQFsHyoFqOFC81IEDiYidooMS5o/o23MWfEsVN5xsiRG28AANJ/BH0crGnzDyIYYkM5w1axY9+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001813; c=relaxed/simple;
	bh=WwNEX0SJd4sKCdCIpe+GFVpttomXVtec+QbXcof6w0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMm+gzaH0+untdJEh1TTPdFRrpDjbjPxbKrJ9LQR4QLH3AX2I7t01esCri+xzeUMVxTf1gjLFq2f1CNignSbUcyr4CMjv9gy4H1JzvrOpJYnz4WCdwx9ag8/V+rn+JK0lUbpihnb7hwlcksNu77em5tAipj1ANdCo5vR8GkchaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQsh4Ibr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c14016868so7369974f8f.1
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001808; x=1746606608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQgBSGX6UzW41PwoF6qQQTtlNAihQ+2ygYEYwpcMDEI=;
        b=SQsh4Ibrs72fjakucYL6OXHZ79Hbf1Z3FbfrLR0cpq7ovAIHmBLn7wXAM700tKMgPQ
         +AFsRoJrn4RBMOcPeAVCmE+P4qTjtlTAoUfOa+mHGdXxX7+Pz4XftmT8NGYrTWX+Uv8t
         X/X8/lsPKkWvNFPnKM9Vt23jIFXDKAA9fRmJihalhdGl4xQX65qgfgWiC5oKeRjv82oQ
         jotWZEomIkKxB8a1Hy5PfXv4IelE8HnFles2xTzOvkfVxGSREJzvM51VMHO5bzZ8lWFh
         OoNM6U5/bwI+hlhvFsrZZer68L/WlrshPBGlVH3QieXPgHJi/FoIluBrXd56myBvkd6I
         UBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001808; x=1746606608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQgBSGX6UzW41PwoF6qQQTtlNAihQ+2ygYEYwpcMDEI=;
        b=g75RO2w+xHYyAd6lbZwAyzpkPvmLr7xY4q/tRftYbflosag3XGSu9a+UFaq5Q0iiw2
         xUwkb9pvnz1YGTxhBj3HJgsArunUpdLlGjItg6LbpQAQ7EN5bs/G+zw5e/V4BLp514BJ
         7mmZ/4dHPOqrCK3TnWqeudB4CIPhZGN06Zx9QHATWIGl4ysnrEDbPLo86XoAl8/GSJoA
         lV26qkMYT8qWViUxvrZbD/lxtmRxAitLC4B+sKIgN+EQ15P6JctEotw/vY9z5PdqdpYS
         y0TkbHrH8PJMn4PwhLinnjNDDMD3s9wbttAoAeOjmnZexHS6EqyaJv0h9EYea50iPgfv
         lrWw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1ZH/6LTC38WekbvZri6n1XlVIBIaRQiZHn1XaPFH89EqORoKMlS0N/S4Y2GjSrq/ncjROAfamO8flQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG8o2QG615k+91WxCe+fl7y7YtBxglCN42417azEaIhyOEgicR
	0Oqn/9D5hl0ZLiCoMl7Ia/bB6T+KOLa7BCc5H932aMzHFhJHV5G79lY9eALLYOPR22OzyDW9Tbk
	zNPg=
X-Gm-Gg: ASbGncuEgS0saxshCdZUDoel3nc18rMNZ+Q9cQsnA5/OIKbr5frs+jaTyo+4p3SV8cf
	qumSk26NWZwbfYlBoQA9wD5p9AZOeHUPEiZrZJzfNUGsvB5x/6u2zRjyz85q2ZBeLKXXlyyM2LS
	EZswQARM3rqfNqjfCG/nYU2pZyENop4sMtFrqWqWOFC9s3BZ+kfklHvA9lR8hK6IGbzTpbvVnIy
	PmhcBcpfFJ5gTjGUr7qAD+5oHi9NOddYM3R73pd4Wh6zk/4v50tlC7RCcdk/49HQ5ro5SVDBpTi
	rg/RFMIgvZ1/llj6zOaVW2iM0DWpgQ3jc4eDZQmLgfvgPGgo0WMzdVvHDHcG3yb4hcBuq6fThQd
	0Ue8trA==
X-Google-Smtp-Source: AGHT+IEMbr/1aWW2sRvMW/gmZB7eZZbSIxh1N3RpCw5sEtrnwewfQ3Bx8136TYBSoJ9ZuMZ6YQF1uA==
X-Received: by 2002:a05:6000:178d:b0:3a0:7b07:af9 with SMTP id ffacd0b85a97d-3a08f7bb221mr1880126f8f.56.1746001808467;
        Wed, 30 Apr 2025 01:30:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e4698csm16399086f8f.62.2025.04.30.01.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:30:08 -0700 (PDT)
Message-ID: <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
Date: Wed, 30 Apr 2025 09:30:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
> If anyone wants to know it and cannot deduce from compatible, then add
> debugfs interface.

dev_dbg(); isn't too offensive really IMO but if it really bothers you 
switching to debugfs would be fine.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/e62825fc2ed737ab88085567f0947306a2a0da9b

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/ff0d7d980ec8192b459b5926b85a105917746d91

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/3580ffcbe507036c35e8f21e293f018fbb62d8bf

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/cd88d924eb55f5dfeb2283e6e0eef37d5bd4c1c4

---
bod

