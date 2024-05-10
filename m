Return-Path: <linux-media+bounces-11273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A71658C1A3B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 02:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F95A1F243D3
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0A41FA4;
	Fri, 10 May 2024 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMwUfgml"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAC635
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 00:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299589; cv=none; b=fVOOQR39v3r2YMef+2/MGmwBQZTkxI1fNdmLBDBR4lxu4ic29mtmPmXXF2nr7ainz6m18zhyeDc1X7LuYffgAUctLirvqKaqxq0b/ukHuY18/pkLtYfJAb5CL4AIA9VQsCBjiEVcAftlMfnsL3M7zAt+zbFgAtHv/ynIuHCDYpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299589; c=relaxed/simple;
	bh=GLOG80HgKLQomRdNUGeLi4tSJE/YjuubP50efidlOaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfG7IwpkplH0gyS1/LZYRS0ZBasIm8to3ek4VbjY5aeAL5q3F+nM5adYUanXb5ju/UAf6Yqbc5lhgKC6dF8E2FeXwbVIZywNpy0NdEDd7TTn3YWEK9biM025JtfAqsXRQ1tT3w16DTorn45PHIUb5vkkGNYIrVYTLMV8hFHx7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMwUfgml; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41b782405d5so14875545e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 17:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715299586; x=1715904386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9bM9WgcUeLqnHcG3u0KhZ5y00qqpThdPur7Fomuotk=;
        b=oMwUfgml4KO6zohBzwROs1yRS9tJhUGd0u0TwdRy+PTo4fF93C3tdnngMsNbwj5/OT
         y9Pqjzt3QTsqLvsFKVZdFvrG8I6QMkDr20Vq64FWVNR3sdd1we8Tl9/+ldmmvUTmhcit
         A6buEBJSJ/Z+z0/iCQA1GuP89oGL090pVy1rmu2lL/p9Y/SMg0PfxBmmjqsGCFBhS73c
         sVcdGFjB+8yxVZ3IbW2YuXkhlCL7TiIl1v7oLycMjB3dE4o07A6/S10Tp3/r+a7IoYfJ
         oq8d5sX3FoIEL7UPT7niXLQbuA/IFOeOjQxC3VQO45GhJpEGJZPtHAElrAARqUPFPOZY
         ACyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299586; x=1715904386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9bM9WgcUeLqnHcG3u0KhZ5y00qqpThdPur7Fomuotk=;
        b=dXdJZUEKGdN1mAV7U+MNiip6umYcGEkwa8zzrbkJPZYzUoF7LysjSIMME2Y/Vf7FOO
         hmXjKQA8uXVn02p+L2Hvwfv8RqrY6zOPBbgx/Q3VEVV7+f60wZpG6fYvb5u8lfyVP7Ie
         G4t+JuWrCz2rVVumR3CpR1ma/13B8A8FRrOku38BjZ0fP2izsh2gBsjLtS4oJyk3ezMM
         xZ+paGDHalsQf4j+0GRfK3MpsuluH5RPCug9kiyjnBINT1Mues7+biVrDSs3xYdHVxFC
         R5SM7vKWvoC+RXXXUlgIJ3O8AXLyPM9xfzbxeqsa1wuuOctuAwRCzIlVD9PUKTTRqtPG
         wuYg==
X-Gm-Message-State: AOJu0Yw0tC0ljHm+hajh5wL47fjDywb3J8vs5h9cycYWBg1mhsMydWXj
	ZVZlXS1MspWnLeZEy0uTy8k9EyV8OccrUw+JnO0zGCrUPn+ze6QWBIuKzxRuEas=
X-Google-Smtp-Source: AGHT+IGmrKpJP+pGW+74voCnBlphBkplUtmn1tBmjBnekPxUzsEhla98/zmE5Y3eodeDMb+5+jCYMg==
X-Received: by 2002:a05:600c:3b86:b0:41c:2313:da8d with SMTP id 5b1f17b1804b1-41fea539615mr11429115e9.0.1715299585791;
        Thu, 09 May 2024 17:06:25 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9318sm41856005e9.30.2024.05.09.17.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 17:06:25 -0700 (PDT)
Message-ID: <8ac97153-0e27-47c8-ad86-d1840ac17c3a@linaro.org>
Date: Fri, 10 May 2024 01:06:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/18] media: venus: Refactor
 hfi_session_fill_buffer_pkt
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-17-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-17-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> -	u32 data[1];
> +	u32 extradata_size;

A correct functional change but again please keep the name to `data` not 
`extradata_size`

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

