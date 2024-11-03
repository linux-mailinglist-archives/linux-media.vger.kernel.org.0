Return-Path: <linux-media+bounces-20727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2F9BA4DF
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 10:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0316B219B7
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 09:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBB11632EA;
	Sun,  3 Nov 2024 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VzJ11Z8E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254F44C6F;
	Sun,  3 Nov 2024 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730625286; cv=none; b=NgZTxZm0bXFibxvKM5/lvheTBL/anFzU2nkbWLwJRT7IyFLZTNH0jaBpN3+8gWRLVUJpvXyPbVnbn+gl/SzFoEC5PKGGVlGoywyUBMPaIoRQPJNIA+WBMIRUCFCc+OGMazpGxeOCaKcjAeLtb2NbU1tZaniKDW5PMs8c06RfIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730625286; c=relaxed/simple;
	bh=Z3YgnPEAERGAdHkzc8j/4jBp8ik+UqhN/LWk43KGe8I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JFz7faSagGpurnmXUv9t9xMMjfLsQP9EYtMHGx0qvaw+SamxeNdPOAzTtgnVPRZ2hPCUNkDvr+FKTqCIPzoEpmFVVvz2TlsfTGLlk6QNM5Q4SOHxFqzVJopvb9KM3iIn6I6M+tNJuwDgDVKMtgResXWM/xRNQ8Y4sGGG6eEJHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VzJ11Z8E; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id B985BE45BA;
	Sun,  3 Nov 2024 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730625281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMkEqJ6w2Zkn0eeuNU8cmK18lh1mkaMAulThx8pFgfo=;
	b=VzJ11Z8EBWnqvN1vtSDFxxwGOEAE15Oj6gG1rD2bxRjBbSF5Ucn45BaKcLOuia8ZdbLB4x
	TbQEKH5/BfVyKswpk4S7PJlkfP8/VeSy3DEMcuJu0g3ZpoRUzRKxAYJeqavv3yiACll3hT
	EYOWXAvV7d2Io8+d4Tf2G0wO/VdUC8BFISUKLSKYyAfoYyIqxV8ZdpG8tkllAbS1u2spLB
	z0q/KuMN1Z42Nhv17Bu6td3DFyvgoy3nznABybpUUwNr02C6yIWL2CRDHP6YzskNZiyJtT
	31LB4guifXdHwfIF1pegJGLW9hDn6oR7FzRCBzOH7U+5LKmh4VjM5kLGb+KPnw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 10:14:41 +0100
From: barnabas.czeman@mainlining.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss
In-Reply-To: <5fc19470-dc8c-4c12-b3f5-822bac97f38c@kernel.org>
References: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
 <20241102-camss-msm8953-v3-2-7041c9fa7a58@mainlining.org>
 <5fc19470-dc8c-4c12-b3f5-822bac97f38c@kernel.org>
Message-ID: <1e62bb64769d1cc071ed5745a0d231d2@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-03 09:03, Krzysztof Kozlowski wrote:
> On 02/11/2024 23:39, Barnabás Czémán wrote:
>> Add bindings for qcom,msm8953-camss in order to support the camera
>> subsystem for MSM8953.
>> 
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> 
> Subject did not improve much. Why do you need to say twice that this is
Because i misunderstood your previous comment, sorry for that i am going 
to fix it.
> a media subsystem? See DT submitting patches document:
> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
> 
> Best regards,
> Krzysztof

