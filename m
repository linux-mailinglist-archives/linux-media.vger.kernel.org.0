Return-Path: <linux-media+bounces-34786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE193AD92F1
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 18:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64681E30D5
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BBE1F237D;
	Fri, 13 Jun 2025 16:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrXvI2eT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F91F5430
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832732; cv=none; b=uBv0cifHxzhjj0UV0GTGADHZW7OnKvO/pwJp4TGsT04DCUcEw+ursiWPAxYDdheDKrAuamBCPZZevyYohEU8rxnzPIQ/SrFfZazKnlU6aaaNDaOmhGp8ubaZENmbIc2wik+qC5C7mMsm2jagpfQ7BkN3xxBrVjebJLb4pommbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832732; c=relaxed/simple;
	bh=z+N8jqjN/nASPdQ0iP1STfKAC3rAtGf71WFeCKFFe4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4MkTHxx3ZLajzY0e4di3GSV/j6up5NQUENRdkbs7Dpi5mSu56RiWizJ/zJW18wn5Spq6HOIqyA8Ezk6lc/GDUxDOpXAg8JrxEfC2Y/vWqlqfg3Avx++/cq5GuV7vFyFwQs/JtY0iufHIzMi1oxxYM/enHy0gsPcH8IVVpasezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrXvI2eT; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55325956c93so275304e87.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749832728; x=1750437528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYUtT+6UfKx7Gs9aWpbJRe4xmbx/ClKSljdS1pnK8R4=;
        b=UrXvI2eTdCBGACPLTStoFa8xEcUAVUfn08PBuPpbkf1o2OudeK+zyn4d7/uwR1kpr7
         xY05abDosFePjvXdkjq3Z1G9R7cDDO1/abE1MGoIVo2Kynbdwyx9/pzTsXu+6ooDg4Mr
         Yg+OCI+kQyTIK40or6RBfD73KsUYzD8O1Ly5AOG1WDienuUVAS1IrHjr5HztulybFshF
         pSlyU7aFEnuL9ijCTk+5A5sbZ2FCCT1AT3/2XPa1tfqSse98akdr1To7MHDu2qMWjGuu
         WmB/2TxoU74ABPrDg2gMovvypgfejojxyhoY8tHiKbrueSL9dinJMD1dFZMSNF2N0r/e
         cTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832728; x=1750437528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYUtT+6UfKx7Gs9aWpbJRe4xmbx/ClKSljdS1pnK8R4=;
        b=rSwuBeHK7oJoHi7QWouuW9HWHzy6Yw/cNpPU7laxbH4iDmLu5Vj3Ih/2xAb3a44fOp
         pu0jJnRgg4+hJbZty/5Wz0LDKLJS01EyOgN5/s9fcvBDeF6RuhXmOh4C7D8nwLKxyMqz
         U87toHH/6p0vdMSV5044hSKvm18OyZL74nSEdiQjRL4BtGqsnppq8DyFAAhHS2x/Nqqg
         dC7lFhDKWEU8iR/zIqztgSs/VKQ7TrASTZosoySKT3oEv1T7FIA8DNLsmKv60PVT8UmY
         IyJYUAfo+kh1jnjNByXZ31+9NEQIFMDwenc8OW8G+9/7klyDnjosL3PaTrWJhvSWpi4W
         fupA==
X-Forwarded-Encrypted: i=1; AJvYcCV/3uPz/y4+TloU6FnW5j06YV1VBPdLbnVpetKvFSlJUX3VI5BdwBvpz0qjd+ZgvGrFDcx21BD1TKZrkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybVJqVSemG17BB5OO00zCpfk6Nmwut28a++GKlQA1JK5UhzByD
	hIo11WJRDqFJ8cvDg2pPjHOyhppjldE9BcIeo5d0k+n9JcVSNMs6nzPngidyDqmOu2Y=
X-Gm-Gg: ASbGnctP6F3OJvs69eEsLYXjVnnY13VheBiLO7kiRGtwZ1N0WNiB+H9zY2L5MK+rELC
	T5BRSFPR7Sqzsc8669XCbBUIkA2gh1xBOuxSsB+L2+KpeXh4APXbigBrqCC66Ny1HXtZt8l5Fi9
	kP8qjua3CBndGl4KwMn4kwI5p2DIazTo7dElfhJVu3x0XMs15CmqPyzjslK879zHQ7UMrcXa5fZ
	n0BtFueq8pw87kYbe1PQ2QJBLboSLA2ooBkdA+Sf34r0KFkjmSwG+TuWlXPHrR334LRaONaXTTg
	uHecW0ZfSsQ7dafCUlDvVhA2B+IeEjOGXAGjK1tFdOk5qqDGpppOpl+Ae24rcViHwjxTCs3kcc8
	8UljmZiD1mkfuYPSct0hGLYQLFLbA23LDB8GG+fxId/+g0d2uENk=
X-Google-Smtp-Source: AGHT+IHj662g3SbQNpP4iPqUmNkvYX9U4szpKPW9FX5yhoIuara4ioYwpzJZkOyb7Ebp5gFoz9go2g==
X-Received: by 2002:a05:6512:acf:b0:553:2421:f5e5 with SMTP id 2adb3069b0e04-553af991409mr356267e87.9.1749832728513;
        Fri, 13 Jun 2025 09:38:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fd7aesm494781e87.258.2025.06.13.09.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:38:48 -0700 (PDT)
Message-ID: <0b94f65a-ec4c-44a1-8021-cbafe6beab31@linaro.org>
Date: Fri, 13 Jun 2025 19:38:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 12:33, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

