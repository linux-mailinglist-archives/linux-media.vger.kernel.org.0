Return-Path: <linux-media+bounces-65176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aanoE5nOM2paGgYAu9opvQ
	(envelope-from <linux-media+bounces-65176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:55:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B069F87A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:55:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=nuFOoZi3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65176-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65176-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B9A8302F7F1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0393B3E7BD9;
	Thu, 18 Jun 2026 10:55:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056853B19C4
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:55:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780111; cv=none; b=qOjAIK5uEQB1qxovKDVmyW1N4kFDgins1tpS2miaEw+AkC625EMVzswe3TQuldcgSR2sDrhQVU5bma6lphPp5MXUDlI0DyxNUQuS7OAUcu/PLyinzsMM7LTJ9kY5Kh7Or8DvDNsDcSV7R7LLsaT6SlfwM8EORHkxxTuFrw0rm9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780111; c=relaxed/simple;
	bh=yPnvErrqXBAM9kN/vmlkz5PWxwisj1jDyO5XCubBbEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebekMb1KuRBjieSzruzFfwJ8L+ttigD++fb4dDZh8ZyGpgx/vNrRLDEn+d7Ow2OoN+L61+f24iYbClfvm/jTuFfp7aNlrUoUt9agp20qEwTPd9ob0YeZ4kTIg1k3tarrP05dLXLA4xOKZkaXZI1AF+Gh4D1OuKh0t1K/gBRmDeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuFOoZi3; arc=none smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68cf8643so42579e87.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781780108; x=1782384908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3751NHdLINpNfdI6QXdsatthsD5ovGh7dPON3Lsflgo=;
        b=nuFOoZi3snYT6nN7D3lhlT7PD96kACj6mmPAzabk6SK2C3/tu0H45/KjR3x0IeuelQ
         N6ex+fhQL+lLp+9G/w8crKJOnnLc2IbvsIv0uz4w0/jowXx8nNb6h0kjKbi6rw9sNNzM
         1kHY0jSpYF89qd8bchpZZNrY/sdAcPBOzVkg138ICBryIs7s9DIdT/qVbNehhf+8SQ/Y
         8hK+t9JsVDc5rP+IQ9PFHasJSdSPMUmx1eBzcRVGYoISKEBWbOQmXkDEhVepBJaw2oKK
         TRGuZsbjMEl6ECnxbAgVYdVPXJ9n6V+A+VEq99cTfd19wrCz8ms03TMqWLlu6NdasnCM
         9Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780108; x=1782384908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3751NHdLINpNfdI6QXdsatthsD5ovGh7dPON3Lsflgo=;
        b=oKzxsjHGuVvik8gBxRF4Lgh0Z8ObUjWQQxUNRfmWed5OGlmoHVF+wvo1Aff+fqscoS
         uEKKqXA8arieNmUAUmTlsmjsQDKREvA3YZyN9mUSPHAAziKzgAugHrGrmSJKbGtA5u/U
         HZR1YmiFqt9cAKNzNzL/tiIgCbt6oQcBrNZCfdXH9T6P+71tXDsGEcnWwTXHOybjK0UM
         2JZjFikGL8uiWDQCFB3dELBi3tgZrpnvDE39pjHpkwrRI5bG3ofg1FYtSmj1zGWDpggv
         c33b28bSLnnU8Ie+cj+vWTZuZu9L8WQtWz7rmXcQEWH4FMYSitlxf1RfqxdHmmxPGuzM
         DPDw==
X-Gm-Message-State: AOJu0YwuFrs/Ue83JK6OPAAsfmaaZ1tblmSRvU9osmJ0h0vNMEJzq+dl
	SM4v42pbiQQz+iuOUHTQjUxu1zJ38ZHYnJ0Z09Z7NDio7RWgwBEg433CJi120nNSjE6XnT9w2hj
	yBOn61Xo=
X-Gm-Gg: AfdE7cmgTaPJhjatV0r7xH1cDpT0ZXAI9/ozHa5CeDj1+LKk3tVhXV/E/KkZj8ZkBdU
	QpfjMephfnOxttkp78OmV+SGO2dOujvVWY8wkW4SuKCMMYWFQOySc2MiJ6kjR3Mq47j5fLf1xMb
	wur3odzU+STuaYQcIf4JpxY+rNhvZV0EwaSsTRFwrgm5GhL2e9G949vi88INYavKcw5zDti6WKA
	PV5vcjprjl2hWyIMN5WGY00Zxyoe4hZq5rFhkN+CVf2B/oQ85OJY8HpHaboj5lIs4ibNQs+aF4d
	5XyhQtJU0IGHukVACxWTwTp3KxDOqD8ohAq4amIa+BiFS/4hXwHbQ75Au/Ur81CBgehqgCX3iAu
	YvJyjmuZrRnUAZp+1FBOWY9hgcLV9omY1xo1j9DTyhbjbEuOGmJ4wASZsNrMwAMqOH66SSGmeDI
	fQNfF2yGj7vQ56nbnY7kA0JgP43xNae7L9NLX5O/pJalzZkV3Gh2L55AmR3MUQgmcSbOE=
X-Received: by 2002:a05:6512:b02:b0:5aa:62df:cd0a with SMTP id 2adb3069b0e04-5ad4dab6cb3mr467889e87.4.1781780108044;
        Thu, 18 Jun 2026 03:55:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a72acsm5344686e87.53.2026.06.18.03.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:55:07 -0700 (PDT)
Message-ID: <239af89d-baec-4a14-844d-639aaba370ff@linaro.org>
Date: Thu, 18 Jun 2026 13:55:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OG0VA1B
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-1-dda71bb83009@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260618-og0va1b-v1-1-dda71bb83009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65176-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C97B069F87A

Hello Wenmeng.

On 6/18/26 13:37, Wenmeng Liu wrote:
> Add devicetree binding for OmniVision OG0VA1B image sensor.
> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
> the 640x480 (VGA) resolution.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../bindings/media/i2c/ovti,og0va1b.yaml           | 104 +++++++++++++++++++++
>   MAINTAINERS                                        |   6 ++
>   2 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..302afc41bb776f75c08b26ac2f04014f8cbea4fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,og0va1b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OG0VA1B Image Sensor
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +description:
> +  The OmniVision OG0VA1B is a 1/10-inch black and white CMOS VGA (640x480)
> +  image sensor. It is controlled over an I2C-compatible SCCB bus and transmits
> +  images on a 1-lane MIPI CSI-2 output interface.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,og0va1b

So far I don't see a difference from the neighbouring ovti,og0ve1b.yaml,
most likely it is just the same device, and even if it is not, it'd make
sense to consider and add OG0VE1B support into the existing dt binding
documentation.

-- 
Best wishes,
Vladimir

