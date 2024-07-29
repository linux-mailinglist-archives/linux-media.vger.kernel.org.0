Return-Path: <linux-media+bounces-15459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B293F70C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5991C21E00
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086D0150981;
	Mon, 29 Jul 2024 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgSkzf1i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AE14B06A
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261178; cv=none; b=ChATSKtLwV54isG6dqYhw0J23j2cKTOLePDoA42XneqoopjnSywtU4eXP8W6zkQZcmHG1D0t+RIQ2J+T92hHxn+LMG5Q4+RZYBNiXx2C3gOKqgNZetQTBktNwqV/A6tyoYP9EyRl2dHSmyHrTVJZm0cwue90SNvrMkSK1TA6F+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261178; c=relaxed/simple;
	bh=p3GRKvslg1zSNGZjAytdert5afi6przH/3H8n9G62d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7fuozuAKoBWOeJtNFIB+2cgN6oNEcV9i1/Z9JwQfgHBAzQowN9eB8dTlt8eSDsfZympEPik+6qcFn4mNI0wXiTlhboPlYxEjjtF3WN2TEoZb4Jb9CK/shQVSXU13w2VXaTqnSkCpETxZOwaEMe0YxD87AfOeDD8i6z+WBKtsnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgSkzf1i; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f01993090so5420375e87.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722261175; x=1722865975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3GRKvslg1zSNGZjAytdert5afi6przH/3H8n9G62d4=;
        b=KgSkzf1ixf41bM5BWKSdmMl1qskvDaMF8xT5XfevyZL2X8RdMeuGDQ19uBNdU9uIFs
         3Cz/RlCAaMw9+v/X1vWNqHF9nkl+KJYcrutY7nuUiPeMk/ZzNjnPbM8mK+3fk8VgfZ84
         Y0jB4S+IlC8dZ2fBHWKBiGGfVaCMP1Cg2een6WpnaSAtMfU+PljlPOcxViqPpSSQ7DHA
         2lk8bf6mz9gsnb3BVt/0fT084sOi8wKvGpuO3h/EC/JnXEpceJEErLGvPy/WV3TGzw58
         LXwpmeL211+VdF1ELJf9d1F2pgUePURCMDOrj/oJ7b8lwNCYKmNZHoyovER1+qd6qin1
         6Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261175; x=1722865975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3GRKvslg1zSNGZjAytdert5afi6przH/3H8n9G62d4=;
        b=CiF1mDTR4Yd5hwPd0SxWzsQBUMFFSHxuD5bbM5xNx0QVN80oo/zFJnmH1O9atZIDGQ
         h9PTY7WOJDsMUSHkUPNw/S5ao9u7uSQLGNRWiAzPgg3/qHTiD4LyPJJ4gASWgSMACOJ1
         zJ5r0WVIyaEoXTaYIvw8/3ekvd7oyijRoSV38qEhusvrBptZY7nefC7Mn49P9keIbuqp
         BjS7KeoMSW7pXEWg3JibNNnHXbJqjgdfbLiojWOZKWFIBOwdtFmPNyJVcKVsxbKQGMf5
         qkKOOcAwqUPFS0AujIUOzU8Y3/z5E1QiDD13eZnyScqO1YOAdTqWpSQixgc6cHcdPU54
         D+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5nWHAn+nI6ufkNLm80kMKFxT0MUU4pGbL9A5vrd9CFSZAQKBmx8HsNGLCrsp9xT77DKqekkvlVGLmW3sPS9iKJd3XTjhE/W7ZwmI=
X-Gm-Message-State: AOJu0YwOig3dVh7u0fK+z9ekI+JDzEy/459U4Sf/635LDZclij6Vh654
	QnD5Qv2LVmWJcFAxJ6XoeFmyGAgrnvSBrPCUSZGV2pxMsU5R6tIugw+z98bhd0I=
X-Google-Smtp-Source: AGHT+IGpkhekfF4tOkpVyvjE9qow+7b1WL/x0/Ng448Y7935eBRlN3POnkZUq8PVZtXiYtKf5QVDgQ==
X-Received: by 2002:ac2:4242:0:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-5309b2c5be9mr4113334e87.57.1722261174494;
        Mon, 29 Jul 2024 06:52:54 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1344sm1516251e87.104.2024.07.29.06.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 06:52:53 -0700 (PDT)
Message-ID: <5ea34b82-e753-4035-a58e-f3b03b6b827c@linaro.org>
Date: Mon, 29 Jul 2024 14:52:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Reorder encoder property setting
To: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com
References: <20240726213811.562200-1-frkoenig@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240726213811.562200-1-frkoenig@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2024 22:38, Fritz Koenig wrote:
> Configure the generic controls before the codec specific ones.
> Some codec specific controls can override the generic ones.

Is this tested in some way ?

Could we get a cover letter ?

---
bod


