Return-Path: <linux-media+bounces-31646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7FAAA7B03
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 22:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD37D983976
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 20:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6993120296A;
	Fri,  2 May 2025 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qFOHYF9x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009DFBA50
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218512; cv=none; b=ejB8LL7OazEcfBNxuyxlktxUzD2yE3M8EDhs+mRF7togE5y/wpXuKL0VQ782PoHJoF1DwJq7OiZpcS65Zif8qvK4cJ5sVh9jciaYHIbJOJs983gCEYmlD3ZMYHAYYJ6xdxS/oSXa65RcDJ3zJf8XFVw6a3e/nww9XrffxvPC8GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218512; c=relaxed/simple;
	bh=VWpwqkeczEymfLebrEKS0c1EtjqnwsZNCWo5lpDI+AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZVHhUOycmZK0JOYekyNFsxOc/YkLLjtkqD7J78X0ZWlf1/DMnHQqHfAxDiNQmyaccvE4EddgDuzwUXiRAgov8AAt5QAjca7AUEQIF/oyg9xdDjVoWoXZitcYyEyPDLIMHfHVndKtTlvwY2i4URTuEeWMLojMiU1+kEpISS8RD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qFOHYF9x; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5498cd09cbfso325493e87.2
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218509; x=1746823309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z246kD9WO9fBM3v1g3qf4yYqZCkg30GwzHdViEkdnro=;
        b=qFOHYF9xa9p+oFhQadK6xqiqnabhE33hPjqfGjXPvXXtMHo8Pf+FTLxoFffpaQ0fS3
         BgYa6zUn7XdpUd+35GcY8mZPajalZ6wo81P5YG+NLpklASo8+E7K65GcTfdYgAuuhbJP
         9XuQywW4H3HnQzI1rEMsvSI6+QGRYdWDEMCpnIQOLL8q1bIvYrE5gH1o8qvS2NvxlNcd
         MxOtnc/+rN55a2Eqwf3v86Qh4r4DBC5HmuDbGX2Nro8mKb5yRWKWPCW4Hnt5xpCKRPz8
         6Y4CKztOFExUjsN1k71TiqfnSSNBtkucZXxlZ42MbBtn979jbGgSmelEEPzhEl7QQ+PX
         TTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218509; x=1746823309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z246kD9WO9fBM3v1g3qf4yYqZCkg30GwzHdViEkdnro=;
        b=oftQy+OgJSjARP0cHcoMU/BCbDA1Xb4xaTOAvGCIsensPl7L45zqa6xxmYDC/XHofT
         y3nST7rSwjG3lP5AIDCyKAWytOdpV7tGSJvyMUMW47d/XuHkl8MrM30suBDrG5nJTGIY
         v7GLVv0EG6wMurImKoB3WF/JRbTheYiZGRCbpD+nEEF/VSQzk/gOY706fZYAB4wuSn0c
         GfWEXfugsBC6ZOZVTwP5eKxsw+7O5JffF+WfPzDNCMYALtqmgfLZJyG21joOD1WNa/04
         86JN0kpv1sXKTJJkr7w1Jx2WMpiyIGyOSY+TIJY4gMoEYquwrzBwimBc9TOm+t5NN9dM
         Fiiw==
X-Forwarded-Encrypted: i=1; AJvYcCXxEaAPQGySQJZAKDlDIsG/kOQB0HUiZKL+PsM8JT/G5JuYuQFvH5g1tVSjwKG4AByLjVjfPGb/guYL2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeX5Uj8eHtWmTIQoyIIgLCMfDqJq0Bvo5TX+yyh+h+/0tGompr
	bdvy6vF3CX8rqb4rOFa7fC6bXox24oNEdRXmNyZ8lQpMSCNXOsCapQL11EfkfuU=
X-Gm-Gg: ASbGncvOx4EDlYozahJh4/PuyyMYUODvjv7drF9xoohAn5P3klSEojqgupgI0EBHxAW
	RRPa1uplZp4XX+NCSP1IEuPh6DZcU26pQ4vZjHyNHz0bq7EBNhYtX1BVPra39Kyh4/DSF/HIvoG
	L8vqjHRr1GgDAG6WoqC0jTDEBqkBQWyf/ziKnCOMsAmUQTMfFcWVJjgE22zvoJ29lw5feoWJmc0
	eEJYkY0oAeKT0s6hZpSr8ZUBW1Kp1r6yhSrEGShOTzGTJVdn+GAAZF2ainPvk+LYbl7eLkxU9IF
	GtEB4VKyB6Y2HD23lN6ZFOx2jX1oP0Kd/do5pargicm7Wk9c20SpZK3ndqF4PyhB3AqSvC1JVzB
	PXoabiMwPrYEmzVqd1RYGLw9C+vPvhQ==
X-Google-Smtp-Source: AGHT+IFNiq628qOi+XtRBGVyUOhgnTb3NWzl5Ifvz1ocQ2BkI1t/QCLD+7WvfFj6wyod8jbCsH18kg==
X-Received: by 2002:a05:651c:222b:b0:30d:913c:4416 with SMTP id 38308e7fff4ca-320c63b8dbbmr4457511fa.10.1746218509109;
        Fri, 02 May 2025 13:41:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:48 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: media: qcom,x1e80100-camss: Some minor fixes
Date: Fri,  2 May 2025 23:41:39 +0300
Message-ID: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The changeset provides a few minor fixes to Qualcomm X1E80100 CAMSS
device tree binding documentation, which are in time before adding
the actual device tree node into the correspondent platform dtsi file.

Vladimir Zapolskiy (3):
  dt-bindings: media: qcom,x1e80100-camss: Tighten the property regex pattern
  dt-bindings: media: qcom,x1e80100-camss: Add optional bus-type property
  dt-bindings: media: qcom,x1e80100-camss: Remove clock-lanes port property

 .../bindings/media/qcom,x1e80100-camss.yaml          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.45.2


