Return-Path: <linux-media+bounces-39623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C3B2391B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B08ED3A74BD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 19:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90BB2FE588;
	Tue, 12 Aug 2025 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="A+8neLnf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742CB2FE57A
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755027452; cv=none; b=STxxOWl/mPaIT9PkErxYK2NB2/qJ/H711w/2VuT4OWgdq3+i+DJmkjnna+Fy3U49OErt+40XLFl7d4d1qoduooP5V8TGH1x8TdHpWkbi4IBukt3ETi+tHXaQhry4DSXT08ipgfSaaLnlEPZ1ekTGYde+/iUn9aoHy3doKwDYuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755027452; c=relaxed/simple;
	bh=lpjEYtls75Mz8HuyMAQeOkeLsxER9FsyOhrBS6beBRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0HIrSh/fFe/jmAbx5pHZgvDIrQbN/p/MpAAoNRXRuyTpGT1JCzTxvknRmNX1DuZQPrFtKMnLYDAbZSweok29n5IVGKY8bnjzG+MYe2xrAM7v5nMPDRwufzBBNBhVivckLqo7oCADT4rtnsysIIqBnhKRv4iIwF9L/AODGMwJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=A+8neLnf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b783d851e6so4936238f8f.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1755027449; x=1755632249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpjEYtls75Mz8HuyMAQeOkeLsxER9FsyOhrBS6beBRQ=;
        b=A+8neLnfqxc2SW+xxy/vZ9x6VjD2FJKImHtM6OdzZQk+HC7leAs5gSP5JzYRlU46Cc
         8ITcBz90z7g5GP8uA0WwnMyvKLIhavRoXTc4vabAnb57+eckZPUwFev3hw8c4tJ+SGjW
         rI7Pv/KfvcHRefUN4gaHBmMX0vWKYeoExFiLBFiec38GPH9Syj0YLK8DHgTc/TF9eAR1
         oYqRNiKaavm2FOwNJijtcpsezCdjU3OBF2NfUvvQ9TgYfxznrCYN6jNrbPO0hQg5cyM0
         N2tnwGOiIYz5bNWWkqM2WxXfBA3sbCTbI20MDR+agGidSNqwndbASw/s4XpjWn+QMWik
         gQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755027449; x=1755632249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpjEYtls75Mz8HuyMAQeOkeLsxER9FsyOhrBS6beBRQ=;
        b=ZbmxQ18I0c03IH/4lNXykkKD1k61HTTwa9j23Fo1sp4A2lbs5FvWgBCUK+9l/ppgO6
         D/cNBREdvfajm9kRQ/uHc7FoMI1CYnXqdOJnswL8AIfY8d0hmXXBl79TtrVgTwLlAaGr
         9hVJrSCwX0k/znEQXI57PfCMawKHCkMxqwibkpW/wQAKuJrTkm1xynBLhZIOGhT28x18
         3xUoJh6lCaxmVIG2+A6Ex45CHRoCpU8Tdjtzt3TFGum4pEk7MEVd5wm8s7zTZb1woyNe
         MLdfLiDmVxRHNqtXfG8PEqWfz2jm5qcy0EDQwRsv/cTC7i7Hefq8eynYPe1f5PEDo5Th
         9Psw==
X-Forwarded-Encrypted: i=1; AJvYcCV36pwhuH4CgaXQeRN0kc3j5Y6Vde9fANpkoBLGRMrz99gSUgIp/0Rg8c+77O99LhPTKjXvVjQuSRFizQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygC/x9se9m5YKMa6Ok3yNhf/Fn10oFyXODnPt019ugp3zUZVsG
	og2g8Z37eP9rmM091dnTz3ikC4RS6v13fzrKeHWlqow5nidp5ChHfG1NdPCgaAtEGTYHmtC5CgX
	xdGBPn3Pv/A==
X-Gm-Gg: ASbGnct3w581H5uTq93dEaCq6hPUGPxmc/lquAeTEIg3icggwXIhePTpVDDMgtjOguL
	p6g5Lu6wvcv+f61yu7+I9Uq3PQ56ewL9qfeJsMQtr0uqp70GiGvTr7NKp4uYoScnYoEGKoL6aBf
	aMMqaZCsCYO9ORxMP+zxQAgQDycVZlZ6ej4xP/aMHtQGzWUWvQJ4+m5qEo7Wytz5Frq19zx/ejM
	KeypAzDLyFddqHcMQx6TnUWbFVM+zvTbaS2DyByJLn65WDl/YMY3upCkhhb7UqsY00FFrBuhmGx
	2Uez+tYdK1gQXkULpmDyUOAI+CoKa0jmjACFa4zoXV4XX37YWfPPtfct1N5vCWLcgJHL0weVFtQ
	7K77NeAgz74SQkCR1IDLuQ2+wdJYky6UD3n1QVuI7
X-Google-Smtp-Source: AGHT+IEFG4AR8hyeoi9xGW3i9Kv3cfWS8J1y9CmyOAAwiS9HcKFO53BgEJ6PRTHA6JWAs5T67T1MdQ==
X-Received: by 2002:a05:6000:2307:b0:3b8:d893:5234 with SMTP id ffacd0b85a97d-3b917f17216mr147809f8f.47.1755027448584;
        Tue, 12 Aug 2025 12:37:28 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:631a:d481:b3a0:fb92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac51asm46249991f8f.1.2025.08.12.12.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 12:37:28 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	support@pinefeat.co.uk
Subject: [PATCH v2 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Tue, 12 Aug 2025 20:37:22 +0100
Message-Id: <20250812193722.10193-1-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84262447-0877-4c52-8c80-65f1288e5944@kernel.org>
References: <84262447-0877-4c52-8c80-65f1288e5944@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 12 Aug 2025 09:13:22 +0200, Krzysztof Kozlowski wrote:
> Property says VCC, description says VDD, datasheet says 5V (not 3.3V).
>
> I guess this should be for the 5V case, no?

Thank you following up.

The 5V line is used exclusively to power the lens motor (through the
power switch). This 5V supply can come from the Raspberry Pi GPIO
header, a battery, or other sources. Importantly, this power source
is independent of the board’s MCU and its kernel driver.

Additionally, the board does not include any voltage regulators.
The MCU operates at 3.3V, which is supplied either via the CSI connector
or the serial connector directly from the Raspberry Pi GPIO 3.3V rail.
Therefore, the driver does not manage any regulator, which is why the
“vcc-supply” property was absent in the binding.

Would you like me to remove the “vcc-supply” property as it was
originally?

