Return-Path: <linux-media+bounces-26076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84FA32D12
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 18:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906363A7CC4
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DAC2586D0;
	Wed, 12 Feb 2025 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+XqIQhC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680FD221D8B;
	Wed, 12 Feb 2025 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380162; cv=none; b=bIUyxFBVTIU5ZE+lBjoiDoXMdIDq+uy41EosENVy4mSbgmualtu85K9aZOdBQGbWOPWFtEjzsRCh8veX6NYX0S7L4Xl62xZ6pc94lg5gWWobV44Uaj1uvgExwkND0EZv5u/z7vKhZ3IdRYwe5G1T+ILdi3sRj+U7rUUpXtebqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380162; c=relaxed/simple;
	bh=Lh55yAkn/jwAg8s+MFsDmpPz7xByDWEIZkZnARkgLDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uJK97T6JXfQUfMfzh8EkvxwM202wjaGhgu7FApLqpERTj7KlMJ6bPcku5ndjJ9sdTbMSLtlza2UkGKW4/gpXmq3/NRQX5zITRHqK4qggBr7+OdSR2f9sNy2yk0Dwc1y3+DjQtVavgAhK/Xdr++xHVaDaA6uyjPG9GLfZeJr/MO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+XqIQhC; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c05aa6d3beso39405685a.0;
        Wed, 12 Feb 2025 09:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380160; x=1739984960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jyKbsmNHdxaThJU2NsEz7xz1EsWrp4w0F6ozYi/oa4=;
        b=c+XqIQhCqV5hfso1lL5gOBbGD1NL1yzeRbnd5lzlEpT7/V8tdxUZvZ8zQadBja8xWT
         hXK48TmXfNzs5okMih807+XXNsHzRU+N2MI4H7oVNGfVE4qxtXeeNNu6VP7jYLmhFh5v
         e1byu/wn5YfaMYL4jJzSUxGFXZ0svVNNmF9QcUHC7DID9zNah27uGAUsnNdSWWr83bDL
         ESlp/nPiOLYalJSSl79gmgG0/8IfWoxLEgOGBGk3BCnsJsyG9LyElTB2Kb1FU+7zOhEn
         gnfCS0XbX8N0KyDqhy+uDnd+9Yj3Hv5Savd+Jd/XsNO5aEWeHLJ4Xjv6uOv63KAvaDl8
         1C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380160; x=1739984960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jyKbsmNHdxaThJU2NsEz7xz1EsWrp4w0F6ozYi/oa4=;
        b=Z0H7RleSLxLjJbS+z9nc8X4AzYqb/5VosRm4mO/AS7RxwruPG+FRsHBLXOBd5U4+ni
         36sH5WKcxI4vCXHJs+Ret6pnCh9daZq+Dln9NL8N0/U6sbMSDbREPcILT7xnMVYJImOb
         0Ljnpu0riIq3QU4cC8DFLs84XPQl5lzG+fKTfm2QSrfjEShVp2rfbesNTDsDu0AK4ihE
         vP3gthIEkaG+CcVaYTKU2HKBoGS+QmiUTQOTYg/9rpkFwUmTv3YCdRUsnm8N9lkFoDXs
         mXrxXGp7/Rwq2tfUILSj8w8pMPGYBlkQ6fDrDTwL2sxxHlQC462pYYBp9paSmvf10wOL
         gp5g==
X-Forwarded-Encrypted: i=1; AJvYcCUHTUFuWbTCG5DbU5kEq/wjAKHWYM19I1lrWHdxL/8gf42FcmNVN0Y8iMc0GtqTXLhkGsqUeRox7NxFVWQ=@vger.kernel.org, AJvYcCWEqTp+XfRxrcGZ5usO+DGC/9L6z/pt6ENcLdG0r95KyOD5N+RTMn+fjCNF/PhZ/tAr7WAueMAsIdy+1oU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOpwGnXUFWFjcYzK20X/Wez1PoU9boH3LKvbT2CeNZfuM0Hb+
	SCpxrH9wDTGcQarL2OTon6wDzzzRXPQXIJxjqW19WCJZWszElWbo
X-Gm-Gg: ASbGncsAO/gnVpbHZulWtUD5K3Si14dawe1lCFR/4HasuMRhZYGhIOpqp1H/CahExX0
	+KHpl4UABYBU16eJg+Q/Yp9JGXMlziAIFS/2m1C0O+xEq9zKJGXxxAp5v9FiXXx6kITVqOIKrYd
	oHXD422iGN0/VdKguxI2DgNcx/KUt+QM0DFtm5obrk5WpBvfvwEPrEzNSrtOIlbziwn3+9CmvbA
	Xv6pf3WG6aWy04JFNC/iR6oLshAvhNap5sJCsoeuHzu+WBlrFz++F0HhIj2PFOtuR7ZdBs6cK2A
	v8vTmkdmQIvXFIHC6QLwGAlNwsfBSbdYZfX9eloSKwMb53gQCkgGjN+L
X-Google-Smtp-Source: AGHT+IFLqOvawynQDFjk6qHZV4hFnVvTcQB5/VW+Wp7M42vEsaUw9Cj/Yl8s7alh1TINeLoDtgqwdw==
X-Received: by 2002:a05:6214:c65:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e46edb4baamr22705426d6.8.1739380160099;
        Wed, 12 Feb 2025 09:09:20 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:94a2:c438:570:6155:5ffc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e52798f66asm12079546d6.37.2025.02.12.09.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:09:19 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Uwe Kleine-Konig" <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH 0/2] media: m2m-deinterlace: add device-tree support
Date: Wed, 12 Feb 2025 12:08:59 -0500
Message-Id: <20250212170901.3881838-1-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all, this patch series adds device-tree support for the generic
m2m-deinterlace driver.

A specific dma controller channel can now be provided to the driver
via the dt, but the driver still supports the original dma query if an
of_node is not present. This should preserve backwards compatibility
with platform drivers that directly instantiate the device.

Probing the m2m-deinterlace device via device-tree was tested on the
BeagleBone Black with an m2m-appropriate edma channel.

Best,

Matthew Majewski

Matthew Majewski (2):
  media: dt-bindings: Add dt bindings for m2m-deinterlace device
  media: m2m-deinterlace: add device-tree support

 .../bindings/media/m2m-deinterlace.yaml       | 41 +++++++++++++++++++
 drivers/media/platform/m2m-deinterlace.c      | 25 ++++++++---
 2 files changed, 60 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/m2m-deinterlace.yaml

-- 
2.25.1


