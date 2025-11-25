Return-Path: <linux-media+bounces-47689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0726C84A06
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 12:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42E434E93A8
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 11:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6088D315D3D;
	Tue, 25 Nov 2025 11:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="WIAIgwXL"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9AB314D2A;
	Tue, 25 Nov 2025 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068680; cv=none; b=qPKEvU+PcfA3XNcOJ5IPYTgVFMGLb1+sC7Prqg21L2J4FektFFqHo02Wb1Ji7NFYTfLFb2IziyYEtIAn/X3z7ORLhh78PDWFrVYW8S/Hci7z3rJlID7Rs+pWD+pp4Yrv25N0mbgNTq0lHixtN5pPXhw9LlCgpy0xtcXwN2tu0+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068680; c=relaxed/simple;
	bh=488+vFy2Y8tH7g9SRS5LWxtO5heIR7rfJTYTg6W5L1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=ZdaHwrCk9HmNNEA1WGiBEuZnoo09bHIzgRyCkyNBFQDvkwuUWwEt0clJkDXTQX4WPvrSlxYhU4UY8aalMLE1maZcASk5iXqF4rEyqe3F/3mrAXXND1jDyDPsAABZsP8mnHEQuMcPX3r6kPMGFCQUN3WbPYfoiAMjGGtYaqsZn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=WIAIgwXL; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Date: Tue, 25 Nov 2025 10:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764068673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNJj/nIupmc2+udqdLaCJttRVrZJNDSAJL/mmo1q1hc=;
	b=WIAIgwXLNHuSBZuph5uAOA9s4/KfgVAjq0+QflDWNZbLAvE6zp5i7yDTM+sck00AP+2+TR
	9L6enTVl5og3OlvZ6mIi7ynYRzTQtomlcobFXWEXafsS2i8fUIpi7NDFdNHfafcGgk+aez
	wk2oox0VGklRm1qDJ/Ze9hWfvBcCHRufycHRpicJkQeu3PGJmk4MkQx5E3QG0wkYAblJjg
	YmqdvyjHM9xIN4zYg/1xWJhmioNsoXdl9q2CamD5p7S5XhrMYsjkGqz7kxuVqQk3OH/B5D
	hftlet/kuiw8+0dkov7H1jWfzHQXo2DJfnWmfo/yNJFZiaRIlI2FVYyjaX9Pow==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH RFC v2 0/3] Add Amlogic stateless H.264 video decoder for S4
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
Message-ID: <t6a43h.17cuodq0mx1pi@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT


Hello, quick drive-by comments:

On Mon, 24 Nov 2025 03:32, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>Introduce initial driver support for Amlogic's new video acceleration
>hardware architecture, designed for video stream decoding.
>
>Compared to the current Amlogic video decoder hardware architecture,
>this new implementation eliminates the Esparser hardware component,
>enabling direct vb2 buffer input. The driver is designed to support
>the V4L2 M2M stateless decoder API. The initial phase includes support
>for H.264 decoding on Amlogic S805X2 platform.
>
>The driver is capable of:
>- Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).

nit: 1920x1080?

>- Supporting I/P/B frame handling.
>- Supporting vb2 mmap and dma-buf modes.
>- Supporting frame-based decode mode. (Note that some H.264 bitstreams require
>  DPB reordering to generate reference lists, the stateless decoder driver
>  cannot access reordered reference lists in this mode, requiring the driver
>  to perform reference list reordering itself)
>- Supporting NV12/NV21 output.
>- Supporting Annex B start codes.

Best regards,
Ferass

