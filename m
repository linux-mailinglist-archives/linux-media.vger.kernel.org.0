Return-Path: <linux-media+bounces-44721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8307BE31B5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF8E488479
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68E93126C6;
	Thu, 16 Oct 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hjElTdis"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6642731A541
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614542; cv=none; b=LGIHLtVMzEN9Dqb95jGUwibaS8zLyHfLb4v+7cHFR8EY4XxHjPdTb+4Fh+kJ8Iy4qvQrRAGqhGQe2Y0N7M6jEmvI2zCLgJbh9YewKDT3gzMO79iXDYZrtvGfBv45LJZ1B/4gQGSErIP8bE3AeLxcD4LfRE05l6NRbR2sqM/bUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614542; c=relaxed/simple;
	bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLgTseKodyv8kIh2z4imgd/agxOGX+Xz48P0nPXCcTrox/SJk8WMdLkuSoTdDL3QGJrbYpNOUlIacKUtZ2BnSqeycMeY1EWR824ZS79vW7HL+ncyVhRyPI4e1o4G/Q/pwuNbIVkMRfuq/FsGh2JVef9NxrJZyYKj3Xv8bCWfFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hjElTdis; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so118253a12.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760614538; x=1761219338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=hjElTdishWAVozrMa4Qqu1zkvA4d8d6JAzOE4N9xkkCh51RjH7Nlm/7eSXmWQ4dKvb
         e2sb5AIAI7vUiJpIy5AYtAXlGvJDHNeFVXf7wWa8axF///63+qy4Bif6aHAJcG2lutRT
         qvfaSYq+BzFxHvCIc1QOHBqNDGdLt/No7mUyU2aG4b73CFfriopDIZlvhBEJ7BmQFgb9
         4XipoIdZbrCWFEY+y+FZKNzJ7ymorTA5TBdV9zjvIAAPY1dV6LyfZq+K6ejdI+sk7HGG
         CJWMojUAsgcsmKmjCU+BbRywbRz3/5dge9ByALS08Slyf7A5OzuX2mALmIFXtTTf20AE
         473w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614538; x=1761219338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=FjzraDTCfJJxQfSGygbUd2C2TamrCWfXpM8sRzDtjcPFzRWdbSDDyVQTVvvVlcR0kb
         eHnMsVwuBsm/5P1/uJDcHrNaj3dqFpyedsuD+zvVZCJnKV1k7prygVwO3XbHjeR3fpTm
         /bfrFkUqZ4c2+1gW4GsqZDvYkPfLQOwUFNNYmm75R21QdmTKLL35H04GUVCfTDore2a/
         wUy4CD8cHM4YJyXmquOcBzU32+T0Xt/+p5kKiZUzUUv9um+VsO6v5caaxNYJ4lXBiYPb
         cp3LvhclOBGecWfB9pn1E/UIIJ/zapTk8Jp3T8WlkBh506qX2+or+kVaGoTKAIRKrbFN
         KZKg==
X-Gm-Message-State: AOJu0YzoMDSZmaSTfeiliUXzVp31R5iHsT0cl5IrnCU70B9hmOFAXHwK
	ccvgbO6Gl6BFGs0JyPjrqTjJMM4Scm/hfIFBPPOMU47MM2uXMYbaweycHW6iSU+ipsF5nE+KVrF
	m532P
X-Gm-Gg: ASbGncvpxGkQrqxlUbupqILHEAtA+I7Awscul5fWYg6oqWxy29LOeOULg2vBnO9ZLGs
	Ukij1ugIlejLIgTN6Hofodh9YmZfcrDqhpHtT10/lPs8caUJOj/k//gc5jf55oVG8a2Zd3fTBYI
	xny6nBNdF4ztKids6PQyu9w0BmjvrjHvbF2tLMVxrzJehyzQ79tyT4ynregy/ywOgMz4CUVakCQ
	AS7CKbT9qxhb/PbdykvXqPjf2vtAMziKjnmX94NzAB60h+p9YLiwXxUy1Ii0fBgu7MnCz1CWNM0
	vXjDp8gNS1OBkGZBD8F/YUVWFQ/WRJwWW2c00HXCBx3LjhI7gh4YtVTcKL2IEWLfV5eN5BkVSmD
	ULmpVXEQLO9CN6iKRvlRJypC2dozRL2QvDUPdH8MknwbImprDV5+qmbnAoN9UiL9AVQIxA3Ez/c
	ON0KzOBxbjGi17ZwsSZQqZsIMZ/lcL463Um2k5/ebl69cjIo6JPcxL4SlxOQ==
X-Google-Smtp-Source: AGHT+IHJ/BAd/YZqX1JBpTnZFq0JCBUuUuBHCuxb8Ss+zVnUBV31V1Tin8ZI1NwrXSvqwfYqO72CDA==
X-Received: by 2002:a05:6402:358e:b0:63b:ee76:3f5c with SMTP id 4fb4d7f45d1cf-63bee764a26mr6128995a12.15.1760614538176;
        Thu, 16 Oct 2025 04:35:38 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1e89csm15849397a12.19.2025.10.16.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 04:35:37 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 16 Oct 2025 13:35:22 +0200
Subject: [PATCH v3 1/4] dt-bindings: media: i2c: dw9719: Document DW9800K
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-dw9800-driver-v3-1-d7058f72ead4@fairphone.com>
References: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
In-Reply-To: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760614534; l=839;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
 b=f8/xkxRl7QiZRrstdSBVPFUpP2voe/77bGBdMjvQ37AZ7h39ZjJyHUPpa8Lipcvz1EMHgxG+w
 0Fu9lE4y61/DGbzympht0OaCB5KU4AmiRMFG6PeCNgDvyFcywXnCcZF
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Dongwoon Anatech DW9800K.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 38db0764c0f70ad49295dcddc182b7e100a68b29..8e8d62436e0d0c4f9af9e52262b23881abd37cec 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,6 +21,7 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
+      - dongwoon,dw9800k
 
   reg:
     maxItems: 1

-- 
2.43.0


