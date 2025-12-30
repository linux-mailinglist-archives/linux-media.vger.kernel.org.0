Return-Path: <linux-media+bounces-49657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B5CE88E2
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 03:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFBCF301A182
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 02:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF89022A1E1;
	Tue, 30 Dec 2025 02:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyT4/7PM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FC2DFA4A
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 02:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061675; cv=none; b=LLm265r5akHKRmgRUtf6HcQSrJAsyaHROoRS1N1vs5sJRduj+BR+bCFfAeRZqEnUlOPcPWWVD1pvtSFjqa6FpaV5b2KEXB4Esv50QzFlr6PQSAXX/MO1/+cGtF8NFlZPhk4875FlWfTfL9i++OZ5O2RgXrRbb4TidET/fTux91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061675; c=relaxed/simple;
	bh=YXBgI2t4nm5UpuqqNmGHihV6HKfXCaa+N896d+z+ohU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+R7SGOAAKOoEv8a1bJ20PXaFwGCt9+ebSsliNFd3BghheifkqcIoV78A//qxqAGtlSqvGgI5oDwhvu/rQ0IUDaNQ01MwDqN3k6UFWMo9r+77+QGsA5pHpEfWVlHvKL5zsZgab2SV+wSx45sF26K59ZsB6vgwwvYYMl8nOQek7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyT4/7PM; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c07bc2ad13so548586085a.2
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 18:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061672; x=1767666472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4QJCK/skvANbjkRsXgUdZIkupHxpiCQr/nT7P58kB0=;
        b=IyT4/7PM6lMWvpRDDUg5loC/kUbt/Qw74xr1TbI6iC4DfA0cJ5ENEjCxX67vthMUT7
         FGn6auibb9xPtxHq1YqmPqyi21y4K58QZ47C7LryuvjaSXchpCBAqNFeQ0jYmMumjEBF
         ISYNVm8/EwY+x1pfusNPvVjFhMJdqZ3P2sgtYHkQJK3RUzI02IwCyoOwUH4iF7a2+Ti7
         Fpnec8ygF/jpmg4R5mBsdgppw5CvzNqbcaEonMksQ8YKb94NAoEpa34CFNf5gP85BKEL
         26M22+RMNGxvpRUFkPvypOrVUi39lI6sIOS/6t2ndYQSfO4b/jyt7Ndf4D0CN+qrubkd
         TYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061672; x=1767666472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4QJCK/skvANbjkRsXgUdZIkupHxpiCQr/nT7P58kB0=;
        b=MRRvZWaxRrr98IDh0gIbNr0pLtcM0VPOAdEt+w/aTyMSyTiCgDDyYtIst9zZYlEDHU
         WFIb06xFDcPEt/WC0qKOLbqEcYoxU7eT+yGFbKqcrtxELHPjIQHvFVPpyx6wcdDrqFyW
         GbuE8EDvn2L28P5XUJFT4ERhPmOhB7uV4i1VIEHqN3ULQ8rgqe1wsthGTvrdLe2yY2Jv
         VLND8f14UD196EtYZEQJ/abHZ4B5epywjLisfiVJUZI55xP0MlrkhfBypD8VBKmdDZqW
         NkzM9D+yZruDZzElDAylq+FdlltJpAHRBSy+6Ksvia0PXtyuCh0tiHyVcfzz+wmcdWmE
         G8mg==
X-Forwarded-Encrypted: i=1; AJvYcCXOQMfLQUlzRvLlr5gpRCYyM4us+Bv4Lkwja2WiNJu7d5fB2Mhggt/T95n4IAwBdfwF4OhAJ9iin4r6ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9B2NrxphP64l4Y/zJQ/7EyqNk2t8xL0NHQ4YozTwMBNaiW5K
	6Kf42thE9oB18/VlKGeXc3I6KoWrOIFiOrjv88tlHRv2NcOgA7XCert3
X-Gm-Gg: AY/fxX7vTWZsQD9GmFfbHZCbF6ChhOmH1Vwr1zY4hrAe4bBnPEqbkd6UE6WBBQmSap3
	95QxnAGC+PYJL5lY6zqR4UiZt6Z/AGrgRyEJfnjc7DNP8LgzntK5BaarUyGd0z7I8SYcdJ1tY02
	n+h5KiWpSCzCzZAIDyLMIBvv9QNdcOCtLXilNT/YiRFPOncdqVhz0zIgZsGpSmuGuVf1ypjyoJg
	EkaPFOcRAsO61xOWQi1oddrIrTE04dqJnV38YD6yynZcRAE9KbD7Zi8URu1EEm+qoL3n50goBJq
	MzNn21ZMC+RfuqLdNTjhB4/B3lYddztW0zvde4uDoq/DYa1QBqjS9DYdpERVW8nQvjydhB2eCyW
	9DtpAlIwUWks8lDstQDIerWlkNYoR7xo0Z7ooam6MWtdmAfE5auQQy58MILHZlMTT0oxnVwWi/e
	xhu82OqnSnSDp1GQ==
X-Google-Smtp-Source: AGHT+IEb6nr4IZ3YGQgwtcnUvg8/DdbRWx23EsYtaydxO2BY9fuHxypdM3574iM6M1YYvhnVCYsVrA==
X-Received: by 2002:a05:620a:40d1:b0:850:b7ad:c978 with SMTP id af79cd13be357-8c08fd27767mr4846575785a.49.1767061672372;
        Mon, 29 Dec 2025 18:27:52 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fd14sm234903746d6.8.2025.12.29.18.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:27:51 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: camss: sdm670: Make endpoint properties optional
Date: Mon, 29 Dec 2025 21:27:57 -0500
Message-ID: <20251230022759.9449-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints may be pre-defined with no connection to another endpoint. The
other properties can be omitted in this case, so make them optional to
support this.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/media/qcom,sdm670-camss.yaml | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..e4f09f8681fe 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -123,10 +123,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-            required:
-              - clock-lanes
-              - data-lanes
-
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
@@ -146,10 +142,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-            required:
-              - clock-lanes
-              - data-lanes
-
       port@2:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
@@ -169,10 +161,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-            required:
-              - clock-lanes
-              - data-lanes
-
 required:
   - compatible
   - reg
-- 
2.52.0


