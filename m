Return-Path: <linux-media+bounces-55634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFNzKqnds2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:49:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23B280C6F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4322314DF25
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA9A336EE9;
	Fri, 13 Mar 2026 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xP/U7Msf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D202F8BEE
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395182; cv=none; b=djTEzbAHK+1qzRwNicUTUnB8JEKEEj/EuoUJzE1OSDXWgHVPgBfvv9WUabK2g+hElNX6T6b92v4UyEEAL5UeGp6h5TvI8AVS6fr5G3EeBTvKghIxRi+tvdRZs51nq51p0wkZJkHJ16q7BjQ9Ic8pg69VjUXrTzTv0DJy6BWn0iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395182; c=relaxed/simple;
	bh=soLnDKoEbEBzJ/46UuD6ujTKl9ZMRtSiLKjg0+glaPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax8N8uf7kDtvSfY8uZRzADVls2PpdoqS/ewykM2X+LjejLSzK1dx0K6WICBHZGeN3XBgCXGa/P8Jbq2zqQFU8WVF9YCXtWdOowor5hiSm6K9D4NObhG4GwWiKr+yTbRDkteA/+oEjo+M1iitQkMslPcr25YtUCJZLqp2zweTgRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xP/U7Msf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b78b638eso2115881f8f.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395180; x=1773999980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DODGloFIP1eZNq44RxnWC9Eej94b0U2AuyYB0RlreSY=;
        b=xP/U7Msft9Yu93D88XJT5JC30JgEC2QErZxsKTL3HQiSx43LsD+VeRLVffxwjgP0rF
         OT2W0k6MI5hzwJJ1ZmwcdWvttx5SEKjudAaXlxJGOfzLFTbdgEFKbCvfUTMaxGJP445R
         OJToSLB6K4x+xsYe1HU0V47Mnho9Bpeop5jNGdvFrs00uFXOv+c/PWJzBinDDFMoCdyE
         WDEcqQZVc8upzJCCzpwP7sp4lj4AEjGXHgy11tffyIlMfWfMAK+NWsqiTsAqqwm6zxV3
         z5x7odWLJzdqaq+1VW6QbVnbTes8nFnaiepF75g4C1RAF5nfUeF7YlW5hHSirkDYr15F
         T0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395180; x=1773999980;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DODGloFIP1eZNq44RxnWC9Eej94b0U2AuyYB0RlreSY=;
        b=sMrZvqxKuzoLeBE7e1voqJV1gHQ03ZheSY41kAL7V49Hm75X5WOXAquZcgfVfjUFb/
         tIeEWwqmwFG8gvW63QHf7WnV+v0aIji7QzkP3vxbW74f5mgxkz4knqNQDhicZ7AB2wTv
         5AyuX7xxB4lXcEkibj2RZQeCXL9dwPn0O9oEelSbI3QJ6Rqpu9m4lFuud/QKnP1hfGbu
         uR6FtWzb+kN+HhZ1pwNbVACBZPQGntmnGNttmAiidYWrwQAjlKYlmrkH2zy4Sei1TedA
         eePYQM4mNrCLKsnnXEd7eiHBWS/tSMPxMxGv5mSy6Rd56SaWFGzq6dyHGodjCaanbM1M
         xkBw==
X-Gm-Message-State: AOJu0Yy/RxzzSXrH1wUG5vzwbApQAOFlTiu42lZQ0YtbGZrhjLN0ZXxT
	7Fg9K6sAFdQH/QLh6KSkYa8/ui+I7JguN8Zz4tsfPNXkB0pwO9gN0iVzJXLoevU/axk=
X-Gm-Gg: ATEYQzxXBn8GnWGcjbxk/suxlf5tP6E/xxfZiqjabjagH8BGnn3oURouiH18FwzI6g7
	veoGSEPDQsYlixBSxCBVsx2kqrZQ1Jvpc4q3XFS38sm0CgtH07X/nmygiFNgSO/X8xA2rNERWsM
	OKs8gpLUBX2xe+4hnSv9zQ9KAmX8uANE+d4+VUvntBG7KnszGerjQq31AqxZRrn2RAXWttz+sxQ
	kD95HfXih72QA6RPTBIcbfXpD99RZrgLNc1lfGcLnHbtaJzXGJxzdIdCld7/7vsV1J/+evSbewm
	yyb6IdnDKDKkfHce1ZTZZs4nSX6gbUixyycgpuuTRY+Ke0gb1gounB/qyk8BZOnhTuj6BTTdoWz
	O/j+EPNxwmVyFct0Z5xxowqtf64tY05IP71qCudT3g1vpMVGXbzCcZjMB8g8ONosSVeC/U1q4LJ
	spRyAPWdyQ+4n0k6UWSHMauQnqzGsQ1a9dj4lr57S6PoxS8DY=
X-Received: by 2002:a05:6000:310f:b0:439:b1c3:84bc with SMTP id ffacd0b85a97d-43a04d79dedmr5493120f8f.7.1773395179640;
        Fri, 13 Mar 2026 02:46:19 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm14037146f8f.13.2026.03.13.02.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:46:18 -0700 (PDT)
Message-ID: <3499e8ad-ee87-410b-9db1-215d6c20e195@linaro.org>
Date: Fri, 13 Mar 2026 09:46:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: Fix csid clock configuration and
 IRQ offset for 8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
 <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55634-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: EA23B280C6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 09:42, Wenmeng Liu wrote:
> Fix two issues in csid driver for 8775p platform:
> 
> 1. Simplify clock configuration for csid lite by removing unused clocks
>     and correcting clock rates. Only vfe_lite_csid and vfe_lite_cphy_rx
>     clocks are actually needed.

This should be its own patch and should that patch have a Fixes: ?

Simplification != fixing a bug.

> 2. Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
>     sa8775p platform. The offset should be 0 for csid lite on sa8775p,
> 
> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Yeah this should be standalone then.

My general rule here is if your patch requires line items to explain 
various things being done, then those line-items deserve their own patch.

---
bod

