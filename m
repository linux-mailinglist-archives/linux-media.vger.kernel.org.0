Return-Path: <linux-media+bounces-43368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2438BAAC75
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 02:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD891C2A57
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 00:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBC9140E5F;
	Tue, 30 Sep 2025 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKQPGwXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7914C6D
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 00:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759191444; cv=none; b=ehHB9akSpndqLR4ws5CKhuzbG/4XnPJX1Usruf59RFqNHyO4UfnfsVfv9eAiAp0x+HVB9SNKpem8UpV0sX23aCJf5kqdS+bzlMGNz/Nt97PY6le5VMbzos2etAbkemCTlOr/TJeo5cZQ6/CVTPCrYmh7yhBMGElgTXhfSrz8R6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759191444; c=relaxed/simple;
	bh=R0YLBiUyp3YW7yv7x28H3CgeEQEOZJr3Y+k/HoiLimQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhtg5gzSvTS/Ehi/4/nSzB7++U+EJuEJ1U2vSOvF1DUvEgXe2UjTuwm4pSwRmMwE8EL+b/5tbB3PQFYfS41uDbc7MVoknoFQq78FTbtpLy4xhHCFCDryPyrrSTypdss7FuRWmRJ1gpfEH8Bjr/KaiegnODw6w6BvdxZDVO9KLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JKQPGwXO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e29d65728so35878535e9.3
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 17:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759191440; x=1759796240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdEC/q6le7nfUpMwS8QD1mrWIXjjaEQSmDLATI0QjFQ=;
        b=JKQPGwXOroor2ZNT7QUdLk108fEYgFF8zdT+6rZBkktVM9+8+ZZkpiD4YWjZayfNWd
         dL134bFsUU1pdnJBeWlHHb3tu2pP4kYYrZhR5Ln65B/coBrEQkTeG8HdzKqOheDMjNHs
         s27ushuoRlb+r1Zt7OkzP1i2SLRuT11ux53i6pJx5WTIM2jBR76PKOaKRO3JgvQRw6MM
         Vy5CTcSBd0nbz8oObMXCfeHZHBNBVIaeGNj2cgD4B7m4XS+B/Mshte6yxn7l0pVsXSSL
         6EthYEs4+cGUPF++NT/8LZDhWvRask1jLmtuuKCZ2anDhkN6rKGeViJGcXs9oPLcd5Yt
         8gFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759191440; x=1759796240;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XdEC/q6le7nfUpMwS8QD1mrWIXjjaEQSmDLATI0QjFQ=;
        b=ZAgqoisNoDAth3NFNzycQt1TVmgfhI54EdmgdStHzYcRLbMoRZmS1sn2VuXF9Jifuu
         EGLGX5w2zrhhxCzNppGRYQrkp0c8EqsOlVhPVQG2YCd8P9liGQgEFeR4X6fznDmQ7UNm
         cGEBFO9CBIRznUQSL454g/CnV4qbFd+si/Qh9W5zTRbwgBzHX2vhBlgmQkAkWo7Nckzy
         D/3YXkkn+goweFZ+JoMHIXcYxMUhIAC1WhR7ygCNFzHQVh75/4vxaOvrbzbbeAiJX5l9
         antmYmMMaQZ+blEoN2UFsw+v7qtV19QE7RV1RgqUAWf+C5bMsfPvEpCLbwDABZ/RA1p6
         8oIA==
X-Gm-Message-State: AOJu0YzrG9GxSvVko0p4ZesRJEqa/6V2k9DO22RsQkj/BMS1gJ2i+8+p
	8e8n/V9d+L+Aq8QeYOSig4iLbD1lDwwj0VRVtMO4YLpnk8FU0GZrHGYZ0zS4e7vDQko=
X-Gm-Gg: ASbGncui0LXxMgXjmLcssdyVcNpGWbsBrqHB8EVDj6DWqMO/2Fds/Fa6roFS2lBr+mM
	uRGateQ+Mg34PQ4LpmBHmTspMKFoTk8CAbsxY1TgCndHkyiJxJlYQ8H1Z7w1vKM2e+qJmhIvgQ2
	lMFGQQAGZLYCKqpqfV0kyExyA7mTZTL2tBTf+wWfEOcTdnL2mq2kibvNo76Uh/MLHjgsnDurLp5
	oKnE2PVF+ROLL6drW3TKJZNizTOFgx4MStB+IMsBa5hM5qEfclozIVaMhG5fhV2D6P8TomgYug8
	KWHkuFsdySLzY4DkG5vUAhdn3DXv9kel04/CMpHTEdSqvBr+FLqUtnz0jifaeUHbqUO8qg3Edc/
	daoGiWFfiXESUWS7TuTZ29zVd23xbSsMwmJ+7RTfzTWkAyd1CmZT2J/A6hv0nm1ue3d3ahL8sWl
	K/whqZo8Cns4W2iDVGkKh2VKES/eEN3Gk=
X-Google-Smtp-Source: AGHT+IF1NvJ6A8YUVxkdRJkfeGyVldxLeh1qdvb50sqvC4KYOgmP95PhemeRL1E+WA4Xb6qkHy3wsw==
X-Received: by 2002:a05:600c:1d06:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-46e329a0d0amr156323085e9.6.1759191439753;
        Mon, 29 Sep 2025 17:17:19 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996e2fsm266744585e9.2.2025.09.29.17.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 17:17:19 -0700 (PDT)
Message-ID: <3594bbc8-b063-4472-a294-117582f063dd@linaro.org>
Date: Tue, 30 Sep 2025 01:17:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/17] media: dt-bindings: add rockchip px30 vip
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-3-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-3-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> +                enum: [5, 6]

Not required but nice to have is a comment like:

enum:
   - 5 # MEDIA_BUS_TYPE_PARALLEL
   - 6 # MEDIA_BUS_TYPE_BT656

Just for the sake of a reviewer.

Either way

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

