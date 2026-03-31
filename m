Return-Path: <linux-media+bounces-57820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GaaE40+zGm+RgYAu9opvQ
	(envelope-from <linux-media+bounces-57820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:37:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 568CC371FAC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BB2F30C0C6D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E54657D0;
	Tue, 31 Mar 2026 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOZ5jX/e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599545BD67
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992158; cv=none; b=WyUtbj7QOK+Lw2PRmw9RUF/Wmj4CskM2Xg4hZTNOY+vntJIYIriRZ+Q0BWUAW/DamgOgBOEhMmZyHFHhXQsn36/wd72QFCahR9fPMMlBUF5QX/iNqjLlh+eVxy8DO3J2gB5DrnnKsSRDu+BoQCnTPK+nQnWWgRqEA2vBy3+3Hyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992158; c=relaxed/simple;
	bh=uwkdlpWgq7m+FJ52JwOjJT59fNwjkGLpbAiJPGbrgqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJhevmjzp21bOqgYdTrcle90vfp5xfJu29FRZDbOTUqDesS68GuKpXGsGfqQ7aJNgF8C0grdfL0TV1t6bDWDeVB37e2+C2Modia5ODRFAq8SPgsa6pKPo+ouCSIDAkrL5Pk9JONaaKipOH68lTkZDT3M+fAmNLyqMP6LICUeD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOZ5jX/e; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2b081e87eso534050e87.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774992155; x=1775596955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCku2Tmc/ePL7URZnl/UTImZqNe4IEEZFyzUDR6AaVo=;
        b=iOZ5jX/eGS7OqEJxFM1ZLRaWKd5DQIs+9WPUWes7zr4p77h72A3a6SXNz3IK4KDmQz
         0NKSgEDedjHc7PVKwIshWChJVCzrV5Z73iLwL2uF3o0rOfY86ZDTyfskLPDRYzyj4KrQ
         kton6KzsiDPXMr7XEnUQ7wlKJ9q3OcUNX8D7qqCj9iB1tB8tlYWMqQ/dag9vWkEpZho0
         Tv8yDWhDb0DqfNOA0SVV8jIF1befvdxRuRwWUEduYCpdFmGSUWH6WAFZeYWNcKeF2cKo
         m/Z1zTdSBjVZPruNZYcsX7p1NyYSu+uzhhnQiVW21/x9Mxg+GHrx+r578/POiAerM9e5
         q2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774992155; x=1775596955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCku2Tmc/ePL7URZnl/UTImZqNe4IEEZFyzUDR6AaVo=;
        b=oPpRGAJdT+XcZaY9PJf9Epk/JfCOFTKcY9wxJBuNkq9TdziH2AI9XDN8eFj5cfnKB2
         x8f0gVpc9sSzBfeWZDBQCYu9CqFSOYGZpNzyu2UDrCqrk+/F0Jgad7i9pFLoT+/Ijl+r
         vJXZLmSRORMyPIi8qc/dhL6ASEN8Rk+6C6x92LEtR6YLLVq/J4pNLSmf0tr4kpUZ9ueg
         U6/vS7xt+FNDx8oi2esfD6vCLyGsg+EfcFtHRMWRILSPr4V1RyTGSwiocv772JP/fTp/
         8iz/kRl4HsGqynls1NiiD7QaU/SVPYjMoaIr04ULJhNDBkok2/Xvws76b6kQpb0kCM40
         IQCw==
X-Forwarded-Encrypted: i=1; AJvYcCXCkIcSbvGpVNOBSLgtkXaX6lpcy/Z7YRUzxHxxQP9eYpDbdLJBanOQDLbi8Q1AQlwEu3rm9sLGZ5zHdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSySx0zX8L3/0AGTN6qr3uqol0+cBFHQf7j7VZ/v5g7yMwL7uC
	ZLYSROwBFT+Sk4jlRi8ir3kwG0RxKv24ep0Z9GjPF/15XgxzG4HNsYUxvTkeLYuJP5U=
X-Gm-Gg: ATEYQzyGEG64yBHj+Nv5USIdz/VowfKI0LVAukNor2d8V9bbUme3PmJAdn8KP1BEdaZ
	CIs8moKyuHXl6M1Fmd5VWuxDSh+ca+JAKyL97pIkf0cuvzFzT/8TZDBEXqfLGm/2UH0z3Evvlyd
	olyXpdeLi33j0QkVzWIdwW5YXLIZV+xAYx3Nl9/lQbsIViXVFP7uSytSuNTRB9rXOFKLIU8f4/e
	1+VRFZGP3e022ZNwhc7HTS+OcMFdoqR/5ZHfWoiB6BwAZqyJimV9iirzwcuT3I31hk3iZtrRiH0
	KShRSD2XfBkZPpg0YMmqZWiTUOedEB7hpICFIkoBxJCaZFx8ukLqhwGM7mn3fkUsM14JMS1FHbn
	vEfxvof4FaHxvA+MUyVK8nKNoi0TWf6ho+nLcUc13dxv6F+Uc7v54BiORE8PY0Inyah2P+fb/rX
	j72Ix1fUhMTzbLsZ78L7ibDZNz7ejVuzoR8GDHCGyiRUzELZN+kjudgo+c71vK93mpwbn00W7+4
	HKsR7hq5oWG5Z6p
X-Received: by 2002:a05:6512:39c7:b0:5a1:38c4:424e with SMTP id 2adb3069b0e04-5a2c1f4cfd4mr185134e87.7.1774992155413;
        Tue, 31 Mar 2026 14:22:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cb6sm2725447e87.27.2026.03.31.14.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:22:35 -0700 (PDT)
Message-ID: <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
Date: Wed, 1 Apr 2026 00:22:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260217002738.133534-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57820-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 568CC371FAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/17/26 02:27, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> clock-lane property"). Since boards with new camss support can omit the
> property, remove it from the required lists.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

If you send another v10 of the series, please remove 'clock-lanes'
property from the example as well. Anyway, feel free to add my

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

