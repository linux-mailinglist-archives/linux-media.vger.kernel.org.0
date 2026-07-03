Return-Path: <linux-media+bounces-66522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d5bsIer9R2q/igAAu9opvQ
	(envelope-from <linux-media+bounces-66522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 20:22:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3C704E28
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 20:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T+PZACzA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66522-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66522-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADE0D3030493
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 18:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE28314D34;
	Fri,  3 Jul 2026 18:22:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D5B30E0CC
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 18:22:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102948; cv=none; b=L9c1rjFRvfn2C1fKX1FdEfp5/3bsl/jJgwJmgayAV3g4/2afg/VFzjjHj/WxwfdSF5lkyiQfHwZDkAjsC76UHgH9Y1j2EWmZ7rkJ2exXUiqYrQGl3BWien5nGT0LhEpQT6QHdDReaOMlefa1pL3WfOn5x3AYL9+VmLgBwiNtZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102948; c=relaxed/simple;
	bh=hxBGVg1I3Scx5arwHErmUZuqdQcchgsL/BnGaHD6KXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9Vds3MPb9jH/EJHnEcoTes/51lKrlSUwTaMYw8FxQUi+RlaCswvnWNa1N1WQPGHsvo+/tnmfrRnNB84cPq0BbnW5/4b/FX/iOhE5JocGVRIN2Gp5IYwm8V4dUJEhwL2zk44YHMMvnDSi0FZ8ssMNxj8E6ZMGRlwkwEUNTqNsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+PZACzA; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so519202f8f.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102945; x=1783707745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bxI7BvM12Nerj4aOhcbX/lZ/mvSXXX9U7cR4vYDN6E4=;
        b=T+PZACzAU3Z+o6UqtQlXQggO6fAQenhdbZMxi4AHXwdW4wP7yYBuVqsmHXh54c5uEq
         ArKcmDza1O2+4/ZocIVCHNEvkLTWqJhecZinubXA+GugaudOlnSYDUM2PFp23nsqOxJs
         9nzT6UYTZAu3pnz4C5lKP/kZgZ2QU97nhOi3qxrZFNeFKAViTmbBgvrnd/tn23xOwTPb
         1fD1PB9j0gtTAineiFdGDtKJWrDcDm64L/lhKVO2muZDPQYAVzQjwjtEA1dQ2EFU6ezV
         ZlFwzUB0Tv+cwt0Utg1EEgDJQJ9FsogxRUEl3JO+1HUQTwsN3VwbbhiNVMibcJmcAXxO
         rEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102945; x=1783707745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxI7BvM12Nerj4aOhcbX/lZ/mvSXXX9U7cR4vYDN6E4=;
        b=oIxc1cIvRIGWDZnirGAuHWZ0F4ejaadfEhOMANvRgoWpFkN6jvBASzDDD+bsSAxP+S
         pTvi8/hofflZGQKSwo8Gq1yDPKAcTWPnWX55vC71K8+aB0itsGLfbJG7bxbwEllx3EGQ
         nqGt5Vxrb0fVCjaXuGWjqa0ll56UeC//2kJn5j6Qm/jO9xGuPb8+7rCljaeUtg3CZ9Nu
         xgbR6jSGQb3Q/fJh7y4SrFWNQ6k8ByyF4ChrrMM9hIysCS8cRd1MXFkxVyFYye0AseDs
         QNhgre/RmxgKcc9xyIboXfgN9X7PHinHQ2mpiKMwGkCFG9jpI9fuh8UY3pB2Bisgf1bT
         vflQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEYBfkozhT8HjMEDRaVkEjDEmxjNWiCGSaj4s3F1+Gs0VfLaJjMGjiBMoUUtwGQmStVRFT83DMSp4OIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEBT83rHSR8z/MtduUtNQ0Hc+03Aokcoh9YGo6vK1i4KiXLCY
	EwmmotFuIA3wldmmmeX2oyPytl1Cj6QMYpm1w7jilV4e891zz2Ar2km+
X-Gm-Gg: AfdE7clD9imbt7AvTuZY+GhGdm1OVSEAn0qHsoijw2h2xq3Vz1nEoaKFUV/ES3dsNue
	CVqQ8dqufzagt4Cxx2OzpkTpILd7S73py7zn8HpWIyzWhkuhBlcR/43ckbWyI1Zot3Gh+fkEPQn
	uAVxdPla729EzwEfMkF7QZsvwDLWyCTBhHU4kTywU/wcqiKq1Iq+KyP+UfzRX5ouEef4CgVlnP/
	zdPXjtTlsR8vst4zAP/iS71D7iigmhDnx85zOZPzJfYVbYqbmJ32FhE3H3crCr0j+30pUoIUq3h
	7nUduH+PeDctsFvxEXUq03244Wolv1RLYmYY0aXQCbtkskJlz560unGCEjkO9WQ3GrZGr6RJddT
	AlB6fCIzSUc+ogzLdkKCotFPMwwMJYTqeyFfD4N3aQEZXu92wu8rI8mVdHek+exwAYoWMv+NVVt
	aFhYnGN9BQELr9x2NkNnlFBBLnxwMIXBs12z6qx1RM8VOrmkvv7evVjdkHR48DAXMzFLwPbpKCu
	DXFnz3M
X-Received: by 2002:a05:6000:26d0:b0:470:258b:b20a with SMTP id ffacd0b85a97d-47aa96997eamr636555f8f.10.1783102944899;
        Fri, 03 Jul 2026 11:22:24 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm1388530f8f.0.2026.07.03.11.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:22:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8c2f0ddd-5722-43b2-baf1-4653de8025ee@gmail.com>
Date: Fri, 3 Jul 2026 19:22:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: add os02g10 image sensor driver
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com, vladimir.zapolskiy@linaro.org,
 laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Walter Werner Schneider <contact@schnwalter.eu>, Kate Hsuan
 <hpa@redhat.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
 <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66522-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:xiaolei.wang@windriver.com,m:himanshu.bhavani@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:y-abhilashchandra@ti.com,m:clamor95@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,windriver.com,schnwalter.eu,redhat.com,ti.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CB3C704E28

Hi Elgin,

On 7/2/26 08:24, Elgin Perumbilly wrote:
> +config VIDEO_OS02G10
> +        tristate "OmniVision OS02G10 sensor support"
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for Omnivision
> +          OS02G10 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +          module will be called os02g10.
> +

The whitespace of your kconfig entry could use some care.
The usual style for this file is to indent by 1 tab, and then for the
text in the 'help', 1 tab + 2 spaces.

- Julian Braha

