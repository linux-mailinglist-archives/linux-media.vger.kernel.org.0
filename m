Return-Path: <linux-media+bounces-54310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI3CLXK7pmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:44:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E641ECE30
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809A330C5974
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E7A39D6CE;
	Tue,  3 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HopRlnmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29148175A70
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534340; cv=none; b=FDk/UKOzLfKyQcuLJ0uStKK0mSZyoGRa4MTg/CX5EiO/LnfprRe37Mal9IjzAnzaxt76OX+apBp5cJJJoUNsD/livEU2MCSveEFkHjaH2+dO4RwVz9BWZm50BdlcgBImIJ3tgrkhhlkhzCjnlmmZL40iRltPYnonQvmqOdM/DvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534340; c=relaxed/simple;
	bh=Xhw0Xz/0Ox1gpbJ4gKGz6yQieQDrmSq8KYg90eBej54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggkphYgR4I5fWfxisY723rbyWkwNpMMKpxVApWpd1mnuinUoxUsBzpv5BG+lt5puB1xt4I2e6qaHRr7NjuaF0e3Rw6tMRS9M3dLzOdUYIDfHCn2USAgcvLM3Qjd3PzMRLLWfro1O0GZZg+tUdlghpzx3Ckx0250q3Al22dvfzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HopRlnmb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so2594929f8f.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 02:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772534337; x=1773139137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRVTrcbnLIBcUyVxVUPeNd0Av7sj7G10io20/2X0Zv4=;
        b=HopRlnmb6nM0zXzz5Bt3pWK3UFzkM1wto0nwlKqt+xig6Rid8pIU8X2NglC+Vv8TXu
         EIdxanUwHGC4VQTY7cLd1M+iKSthIzKBKjkVfKZj1isABxAd2uowp4cz4Y1At2wT3RWw
         rFNCYWkw/Vj/jJ5HY8JCfYyynbK5/6CRGgqJRwexeVYPHrnMMAgj6/sLb8l5ndvsXiAR
         vEfY3Y48Nzms7JRRhmTZWQc6I42ZFLlUc8gprgMGaHV4l3v29MpcTY2tSvCT0ATR8isk
         m0XphBSbgSsw4a1CFxGIEYaOFjH46EGe8myTvS9I6WlCo+OduSgtQ8OYPlqUOzrCMrWF
         XvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534337; x=1773139137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVTrcbnLIBcUyVxVUPeNd0Av7sj7G10io20/2X0Zv4=;
        b=NTx2AMODLekNYjWfVDoqFsGfOlHIM8LYPdRQWiZ5bOj7SYrrCCTzoEJ/BQBpr6dV5n
         pwiQnRk9HWmeZyUsOkrlfmLmHydZJZ1jddR10x5Uh5sHFtQrXiV+p8h/yDvLbtNsZ4z8
         BMSKw4/3jjUFk5G7xEc+vXcmMQufJz0D2ZFKlbI0HYlL9nZNdhFKTi3hF3VXBhPOIbq/
         30Ui6Ygr0LwAopaFK6IDHuE0JxAthotFaldOe4OlyW+0gnlSRz9GOj2uoWdqVULXnzS2
         2RhQVcUxj27ViEgaSmvKzLy7GRSleQyj7Q5j4o7YThsYBTaFsWauy4is/BHRra42EZ36
         FKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEVNop2CYC0a0JgrVRVMkZe6JZ7IUhbzbc5km0Si9RGREJkJQc38TcrL+MqyLz69U8d16gJYls9HoWGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdlF4TYpoU7P02eEkLsquQ450Efs8RY4Mwd0eEkZD42XkG7GgZ
	KVM0v4O5WbXMaujCdK+1YzuRCHZtxr4BDlhJ16tnF8yuyqORVzoc5vFQj9c4+/9RFjk=
X-Gm-Gg: ATEYQzzteewTHUX/UPCBG7HqWZQRdaV2qLJNM/zGpOvvtNahm8kv/n1dQ0jVmP8nVSO
	CpTvOpPzXKqWW2zpdZnMVAUMR57RdTtRQVCIPIXC4fFPfKPsHo82LBkROqrAVxA6rO7OCmIxf8U
	fmikD9Hpl/l6CQuhbUo0sFbIfoL3/mmgKiZPu0z39ot9dFp2vq/L54A2391z6RedBzVBXOePQnY
	PCny55OonXNYdOsprXkUHnWkyae6bJ+WZtGZupRjCyTihQS7lRtrKFmjOaztlzFmsDE0eP0rAiq
	qFD78DfnGaxeW3+K4Vw+WS1UXQk4xy0x/8qmJHG9uabRNciJYeWq1o+k/5wvg1qPP5pIlzYM76n
	mnh9lLENp8rbzt63hvY3tyk4qAZNvYxQORAzlky+K3dZ3VwF/CbK0cN/Y5odDdUAAhN6ctoAxtq
	qeDDhFb7AshKaoK4d3VOKu8ZyyYjYHrAJLAMTIuSrfi2y7PzoT8e4s8MgFQSh6JeaW
X-Received: by 2002:a05:6000:25c1:b0:439:905e:1236 with SMTP id ffacd0b85a97d-4399de0b748mr28113369f8f.2.1772534337547;
        Tue, 03 Mar 2026 02:38:57 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm17020410f8f.12.2026.03.03.02.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:38:57 -0800 (PST)
Message-ID: <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Date: Tue, 3 Mar 2026 10:39:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
 <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 23E641ECE30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54310-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 03/03/2026 10:22, Konrad Dybcio wrote:
>>> Squash down and Co-developed-by
> Suggested-by, perhaps
> 
> Co-developed-by usually reflects pair programming and requires a s-o-b,
> and that carries legal meaning.

Hmm yes but this is his change so he owns his own Co-developed-by and 
his on S-o-b ;)

---
bod

