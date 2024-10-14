Return-Path: <linux-media+bounces-19556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8499C534
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1E5CB29B8D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB4B156879;
	Mon, 14 Oct 2024 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzXQPnsd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36721154C0C
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896630; cv=none; b=ZiIoZKt33nhkfmfqQGo5ltlveVnilR0QSyuLE6L8QEt4wEENMRP+ihEXswi9ldwLxctQ1lffT5deVtQ8/YggGqaoS+wuVH3so76iUvTySj/9ZyFvsgTYCHEzPPCppg9eUhC36sHNYQJjMFzcWK9kJXw4yKLZPWMLNtRCuP45k1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896630; c=relaxed/simple;
	bh=sHpyCuwQq/I2DTs7dmBgkBNOQIwrlp6onpFJ3nE1MTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iljtzMVPqWDaKEbXfKepYha455NHUwNPQg1Y+1p9IMoHf+GexjG1l1yJgd/VJ+8vO+ZTlA5tPZdXkuEFr8Vwdi7QvMvNQ5X8aqv9aUId2j+vY/pIZg1WpSS0SUx60odw7ei7rzx1WTdSjBVK3fDPkoxW2wU/wayCCXqn75mYXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzXQPnsd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c949d60d84so3344130a12.1
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728896626; x=1729501426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ej1J1uipGZreJY91YHwmy1fCwa14PATNAE1OP3F9fzI=;
        b=MzXQPnsdwRqdUbshlqq4ff1PkRaHKB1wf2sQERPPuhjvGbl1IpEqKc71TrJdpnAfBU
         EpOiCsvE51PRbPhwCUMCFU2750h49EEEorYk963O7k4bo5INrlVOLB9Ft5RmRbwfvdiU
         DYT51rB0gLOmh5pK0rHYCzhQTz2dCGADnWjdcdTQFmCBlP333qxGv/8xRLf07WmNQL+6
         SGTCDCcj86jMZm4W1N1X+2RRvE6RS5MIjC5fZ8J9fPmDbhbF5QsxRMZH1BeB8x28f/12
         kC8D7Azbore9JiZ3Uwbv97Jcea7CX4GABfdixqiuq2u0Kg+XIWmQlyIUrrf1lIB9NlQS
         cX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896626; x=1729501426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ej1J1uipGZreJY91YHwmy1fCwa14PATNAE1OP3F9fzI=;
        b=s56w387MG9TmaZiOwUwBQDJN5cGhv1Jh/jDe3VYcXO1unMzqM2eKmeZmYaqM7bjZMq
         qO+QV789eqNxcEaRXdI0SnQ309t/jcIcGTxY8pNqRAi6KCSe1WT3QpjJpZiMoLq9al4f
         LF7wwJsOLSnXIAthmCw/NZBJgFI5pLtQFJB80WILDW3C6QR6DFinUPu7eTyWr+LFtJK6
         YlCAAtdIBUftn7yUnylsOhlCP691Bwl8p3c6U//VXx9UCmPscu1IY/WFrOaFua7QdgvW
         Nh2ISPBDhpaDjIbpDQkfQMSZr5UYRHdQf663jpM0ZbsL7qW2J/OzH13Yrg4Ycq5Bkh0Z
         Px5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCWyQb1owBFSBquoyupSlYELRJjbMrcdfyC0i1/r9kPhHSKIVPbEx+YXF9Rr13EWps9SqoPLplWT4Caw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDvnD3j34VAa20sYTJ0kkLxXsXKjClkljoPgL98nza7oXOnaC7
	nmBc/nL5HpTAvx2te8cmOT4V69MXp3pqajYvacZmcn7j7A+bvQDECD6npHKYxzI=
X-Google-Smtp-Source: AGHT+IGb7GDEfrG1cF+8kZu+KeiDnhyofexGNBASYbiwubzKma7DssNASeS3npGWfvqJswAeHNJYow==
X-Received: by 2002:a05:6402:278e:b0:5c9:5a96:2869 with SMTP id 4fb4d7f45d1cf-5c95a962ce0mr7082905a12.10.1728896626352;
        Mon, 14 Oct 2024 02:03:46 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711bb78sm4924587a12.33.2024.10.14.02.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 02:03:45 -0700 (PDT)
Message-ID: <2afe4f3c-e2ce-4cc0-88ac-348e6f3f7e26@linaro.org>
Date: Mon, 14 Oct 2024 10:03:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
 <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
 <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 09:47, Krzysztof Kozlowski wrote:
> If a common binding for a group of devices encourages you to list its
> subset, then it is not that common.
> 
> Solution is to fix that, e.g. split it per classes of devices.

It might be possible to have

          $ref: /schemas/media/video-interfaces-endpoint-defaults.yaml#

which declares the typical list ->

$ref: /schemas/media/video-interfaces.yaml#
additonalProperties:false

properties:
     data-lanes: true
     link-frequencies: true
     remote-endpoints: true

required:
     data-lanes
     link-frequencies
     remote-endpoints

and then if you need say clock-noncontinuous you'd just include

$ref: /schemas/media/video-interfaces.yaml#
unevaluatedProperties: false

and then list whatever you need

> Or don't care and use unevaluatedProps because it makes people's life
> easier and is still correct. If it is not correct, then this should be
> used as an argument.

I'll wait to see what people think before progressing this patch further.

---
bod

