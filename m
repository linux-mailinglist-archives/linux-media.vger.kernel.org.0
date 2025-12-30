Return-Path: <linux-media+bounces-49656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70987CE88CD
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 03:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1378430133E4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 02:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FAE2E06EF;
	Tue, 30 Dec 2025 02:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR/LmQic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55252DEA74
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061663; cv=none; b=l1ifTTzqP98cNH/kFXK7y5wDBw5eX5AYausTBeEfZEK9FpE6i4T1GCdPpr//cOzFv3HwasiYg67DZItwmg9dMxDW+0s5g0re/HpffIsgUvu/2hCFxTvZNvzOqSqHunQCaDf2FA6d4e/O8mpCrFLFTAxMGjRQjdbCya0ZYRzfRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061663; c=relaxed/simple;
	bh=JvXBFBmoewzypaOA7gaaUWUOvKih92w8JV88pUevGHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJK8ofwbO/vqcv4H4TFEbgDdo67mvLOI8d1fdW5wFbWg1Tuu0qquxLwzDefjUF3y5KtAzrNPYXyrugDjJDjVGKM5rp2okeaoDylXH6JFPiSDcoBp53nc65swNe/yugWALdx3WCnO1lYvPTvWA4SSYnIjwzcQiQo7nl/DHzREC7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR/LmQic; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ba3ffd54dbso1361842585a.1
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 18:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061661; x=1767666461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=js/ehHU4D0Kf9VZJJ3nWUpx1Ps8Ec/Y5UmWDwv2QY1Y=;
        b=fR/LmQicooLGUyAwxdi1Bq3X1r6yAQm8/+treyrUtxVUc1V57N61secogi0+enC5Uk
         c36kKQQrX5TflyUddaydySsISlOjbdqMd71QS5wiXR87Eft7BhvHvJWeKuuBbQbozrnR
         DmOCBq18XSz5cDnDw6dhNyURObJesWgwoebKa7Tzc52vtbuYwzaHaLZwi2ifKLOCu92L
         X11fNdAoOVgc82hjSuwezW/j1keev/FaS3xcOiUKTIcfyvXl3pBdpFf+mJBHoKJ5Dg5Y
         GVyuNuZOH5d+BPtNBslWc/OnV0d31w5D4PZ8zc8hEtsMQSTmEE6S9cuyKlHhnrX5zfw6
         aXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061661; x=1767666461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js/ehHU4D0Kf9VZJJ3nWUpx1Ps8Ec/Y5UmWDwv2QY1Y=;
        b=AqOlnImeA+3XuAaxU6emZPkSzuL/8GIV/+Y0bW1XhEvEsIqSx8CGwwP8RDnDggMHRh
         Q3RKqKu9G+q00pERKP4pKcYIBTL96w4+rlZx8DRyVwD10GGaekp79hKzp3dpSp4TIHV/
         2tzqJvbD68ac29m7p2hrzN1tUqhCrDU2Umf4LqqGFfsyAw40V578KObrvQzrHLfIqobK
         xw1LBrukeelvGf7kTtfz0Ye8xdwWIKy5uA7Cz74FY0sKhsmlVQEim8rq1/FRnEbzbQj7
         PNLg1IzsXFnP626fXjV4AGCPeRfEOyKyoRuviykm0fpWKFxwd1ahowmnKSgzjAe/w1NF
         gkUA==
X-Forwarded-Encrypted: i=1; AJvYcCWKTQpmldqxulFk1QiHfQ5sIOHNQMNfxfV4u1HwkaVpKFDw9o581xf91r6KfZvqUXMJm68nRajFipUyfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVO8jmx0jtJLBpksWe4sTPoW6O0LaiNDVJxBx0Fi77PL8gU4N
	LdNl/phLC5AblAg8KTpK0JmJyoOTBnpKoBNeNHOR6M0qBkdXcBXpufYf
X-Gm-Gg: AY/fxX4T8lFuMBhOEqnITITKbMtBYaqn/iYrrfmjYFrXu/QWAdNGokoPMg/wE6vQbhP
	tVnlQfw4aO5Mot5ik+4VA5F0UC+ejCKvEzxnII8baw4kTWyvHd6Od3Hh3383jPJtdQf/uAtyw45
	bRZ9tg2dOqm9cMREu2mCWYuavyhaEHSgZCVJz8sT6MHR3GpRmT2bkiwua2C1+3CmO3HIetu48Ca
	GjYdGQG57jISK72k6FxOIgrYn3n3HADOJ8vaq7ztynuIIhnEI/WLZBRpfCUR9UR/A3elFRu6B2u
	EHUNRg68zVckl99B2CZquYw19+pCH/NY+oIsRnK6Y0L7ICRsELyGKBh7xK4TIg0Oo+mScYYz/5j
	kE/dEc1ZutKijwlprxybooZ0gaRwaoFB9slfSxDVOw5k4V92/sd/p/MuwiicUwDmjtcQC95OH+B
	vUDd6z8b2AgjmcSg==
X-Google-Smtp-Source: AGHT+IE0AZ0PEltmcT/SoQGprCdCdVVYI3Af9vEYwBo5pDPoyjkZuyTvni/G9CwJBfy7DmisDJGu4g==
X-Received: by 2002:a05:620a:4113:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c08fbbbf99mr4387462585a.73.1767061660744;
        Mon, 29 Dec 2025 18:27:40 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689246asm2500281685a.20.2025.12.29.18.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:27:40 -0800 (PST)
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
Subject: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint nodes
Date: Mon, 29 Dec 2025 21:27:56 -0500
Message-ID: <20251230022759.9449-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for empty endpoint nodes. It is currently RFC
because it continues an ongoing discussion on how to selectively connect
some CAMSS ports to cameras and leave others disconnected.

The SDM670 patches are for a full example. If agreed on, this should
expand to SoCs that have CAMSS.

Example SoC dtsi:

	camss: isp@00000000 {
		...

		status = "disabled";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				camss_endpoint0: endpoint {
				};
			};

			port@1 {
				reg = <1>;

				camss_endpoint1: endpoint {
				};
			};

			port@2 {
				reg = <2>;

				camss_endpoint2: endpoint {
				};
			};
		};
	};

Example device dts:

	&camss {
		status = "okay";
	};

	&camss_endpoint1 {
		clock-lanes = <7>;
		data-lanes = <0 1 2 3>;
		remote-endpoint = <&cam_front_endpoint>;
	};

	&cci_i2c1 {
		camera@1a {
			...

			port {
				cam_front_endpoint: endpoint {
					data-lanes = <1 2 3 4>;
					link-frequencies = /bits/ 64 <360000000>;
					remote-endpoint = <&camss_endpoint1>;
				};
			};
		};
	};

Richard Acayan (3):
  dt-bindings: media: camss: sdm670: Make endpoint properties optional
  media: qcom: camss: allow endpoints with no remote
  arm64: dts: qcom: sdm670: remove status properties of camss endpoints

 .../devicetree/bindings/media/qcom,sdm670-camss.yaml | 12 ------------
 arch/arm64/boot/dts/qcom/sdm670.dtsi                 |  3 ---
 drivers/media/platform/qcom/camss/camss.c            |  5 ++---
 3 files changed, 2 insertions(+), 18 deletions(-)

-- 
2.52.0


