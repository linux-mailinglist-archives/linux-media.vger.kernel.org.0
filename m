Return-Path: <linux-media+bounces-54297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHtYGL+zpmk8TAAAu9opvQ
	(envelope-from <linux-media+bounces-54297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:11:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7021EC6F7
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 486FC3009F39
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0017D3988F1;
	Tue,  3 Mar 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNso/GQv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FFB396B67
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532657; cv=none; b=kgqItb5CVV8PnG7p9T15yhuo5Z3UdhtLKACGLlY1va0rtjSrhMLU5HXKe+vKZXdE67clgL05qmWKjMgxqh/yL3oK9YqS4VKD4GPv0UKxxyt0XlMH7uNdi4xPI42TNw0Z+DWa6ArQYcmYIlrtIFpH1eZ13g6KN377sH+fwmih3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532657; c=relaxed/simple;
	bh=aWHfGub3SJAxwp4p/JOo82XFq9ePDdQb1rlP4WEeGSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4hC4ZYObPQr4ILEfaPR6eAu5C5CDacqcaO/ImA4M/bvTwifR+Qe0SgHHuAQaOacVuq5LIgymYPSdYHcR98K41YWAi72nQN3YOevzmxu/I1eeDTlrdNfIpliUmH8hzQBVaULJcH/eBBN9lA4Fzw//kCkGWvDYOGRmD2U8YK7RjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNso/GQv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so45487055e9.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532654; x=1773137454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWHfGub3SJAxwp4p/JOo82XFq9ePDdQb1rlP4WEeGSM=;
        b=vNso/GQvbw1Qc3YrZADsKVb+ICxctDPnipZpH66rx+o3xn34w16kxIaWh/6DZbjpVO
         zVGVPTiVMFw/5iswaZpdeTq8vKWZbZI+bnGs5cYkb3G+MPVlUcND5+JVmetLtiiothST
         9k8++4ax0N2IuUc4FrQaC060jmDM3HIw0MRx1T8OcdxcRToQk41dNUK9C068rugXjb1S
         g75m8S1QLzvFOTptuj1d6WMDAte22dBSN4nc35ms2Hbe2yazrG81E6UnFM6PPEmNhvnc
         kX0NJoJ1UDE9ukFMa1i22ER3TaTDkvbEWUjtvSgkrzF3yBifbcDnTJblfNm2p1XSRjN+
         AH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532654; x=1773137454;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWHfGub3SJAxwp4p/JOo82XFq9ePDdQb1rlP4WEeGSM=;
        b=dyz/nAPzBynUBIirh0hrnKYV02RdajJJHnrwUDrsEJUwSq+yBul+4V8JaNRY1beNHO
         8aAf0286PbT4Q11HUrj4+Dh5oHitE6Ldnju4elkZGVifqkMzQmLVBykVp5G/JJEFUoAk
         QGfbJQ73QvpSEV7aAgQxSRaTFuoiztOIhP+lTL6w36x3imtxGxyLOaDChccuP9UdIQRV
         PjN4oEsgEMYEgKLPC8AT6DBrgJ6CAhXuxAKwVB9QeMNXqPjaFyzScRSn/ji5j88FEWrI
         P1NlWjGDOoLyAA/2Lem1WFY7IRP4vxxPZJQDGMp+QJoNmx46+9Kh/ZRaCuRQjbARH0re
         /T/A==
X-Forwarded-Encrypted: i=1; AJvYcCXA32A3utBrYPeYyfS8uXYLhORVIHAPt1mqDEf0lFuufA8PzmOzB90GxLeGWLzRVdwEG3h7H2P56gsTHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztNWVz+wPlSvmMKBq5/HBcf0yl4A1NBc3bVtwfUdFOQU3U33kq
	mZR/Qnud8jeO0jCsiSDI/zUVmJYnJkdBMIwoLBxRYymPfdWQJ7RWLGu9RId6xB/EDYw=
X-Gm-Gg: ATEYQzwvgsof7t4SjlwyngrbX2DuEHq3HrOczigPMPtXWCcotTqVAOu4dYaWAtxKNmw
	k4C2y84GYLQ0w1r0c+A8qZVhVWW+F8xfKa/8qM6A54Ntwg5D7VZz/UC9n1PNYGpDkfR96pYM5se
	ZeparnIQ4Vjdv3gIKS7uDCoAYnePQAxr10UeYz8CKJMfGfaIbkBbL/ylQIJQyxvY4WVRRFsy+hn
	7C8wWNRblDIrW+jAV43Wb1SE+EJhyejozftlUMqa3wAovj+GgZGmZzWIGJenXQHsLioK0XLwPno
	ixrpwhhCSxNbXgagtMLec0cqZWQGtAURhJm7hrJjyaqFTPihF+EhcyK6f0ZWM29CHCkzCykoI1J
	AfdgV3LdCJhEl3FnRnnF37pDsQvTrKp4TCjKI1joNS7BVVsXxBCmV4mb8keIPA1pkFJ9kMlBZNX
	aXr4ZTIyBkH5wNsKXdn46FwhwkvN/HKevVxFz22oc3A6rR1CmzZpXaTn8YGmluqZl0
X-Received: by 2002:a05:600c:674f:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-483c9bde826mr257845395e9.18.1772532654385;
        Tue, 03 Mar 2026 02:10:54 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3471asm357860255e9.3.2026.03.03.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:10:53 -0800 (PST)
Message-ID: <fcc67018-0320-48d8-b492-53245fdf6968@linaro.org>
Date: Tue, 3 Mar 2026 10:10:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
 <200485c3-6f6b-4c92-a631-b5fcf3dfe1b8@linaro.org>
 <c6e77d44-f6ab-4207-b6bd-16f646a44f35@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c6e77d44-f6ab-4207-b6bd-16f646a44f35@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6B7021EC6F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54297-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 03/03/2026 10:06, David Heidelberg wrote:
> "Move the lane initialization to csiphy_lanes_enable which is
> entered at later stage where the configuration structures are available."

I'm being pedantic sorry.

"Move the lane initialization to csiphy_lanes_enable which is
called when the configuration structures are available."

Actually I think config is called when/if the sensor gets probed.

---
bod

