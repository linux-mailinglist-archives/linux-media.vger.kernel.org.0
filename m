Return-Path: <linux-media+bounces-11057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7998BE805
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 17:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11825283170
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8CC16E866;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TCru0/+z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF316DEBA
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097335; cv=none; b=hD04+5wHmEagl74fsTMsYOz4y6bPM76z2AsA2HVk4ZkL1HmX6noecjVQg64+kuHffto9UyHcP05EW9ZntDU7TLy4U8th1SnH9zzwqzc/Flsmi4/u9Ur6dZCfttKjLf5zrX2DIk5caDuGiWUo4yNzN6pX5PzuTkV+kkIY80OINhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097335; c=relaxed/simple;
	bh=xEcmnpU369b9UbodcK91onG3cerNjrz47wYsAWXpcjY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j2FUIrolTXlK5Bc0YEizzlh/51AvFt/FOiShVXjZrGCoN1gbaKFG+M4o+3P+kahhGrpyEUqwRv3ygw7Net3i//r0pUbD+gSDAhJiTV/TwnKQI9Mc1IwYMNWBP6EwAWMZ2q9F31FMJhbyspkTe4kk+uIKjPNkQ34u3mb871SHhrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TCru0/+z; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-346c08df987so1911734f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715097331; x=1715702131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXS5VajCSTK3v9W31Qq62RjCeYKSVh+QNoTBnWyhQpY=;
        b=TCru0/+zfMSwxfaRLWWqqR0tBPyg8Bmbp/xShKtsNC+/V162ZANaPl4FiCTGKMwP/l
         HXojihqTJRRFVnn1FODroSWJ5D820PblbnWbU1TftvArRauNb5JwJjhuzYhZijZUS/Ld
         oq70M9btdblBMTPVY3Zal2V8U/IX+GNW55HEylbtgALbapEXTo6xROdY2cp7MJZP/YSd
         H0jrhUY/ven0B5C6R4iyVUryTvNBEUVx56Q6sn/+w1kqO1lcX01fgq7AOnTv/sObT3nb
         Wb+l0HhRtHzToNety7yjabu5hwshv4BC2zg+dFitCKMhJk2oNOO7/sr7N93z0uwlzXgT
         t/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097331; x=1715702131;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yXS5VajCSTK3v9W31Qq62RjCeYKSVh+QNoTBnWyhQpY=;
        b=Zg76PYIjGfamw+lJKGBK/H2NKXQZZgKA0bCOD1+FynScCcM+mvYhgYaevFIa1UoJjQ
         RX8G19G3Ad86YaVOeeh38b5uFnpJX3SAzvoYEbDDyyz/IFGjfTZGLgWeHKwUq7Q8m26j
         u6kwLklUjyZ7Jf3NVOYfxigISGnyUnu0lJ8Mm9FzU+bYP3O8vVjdwPBJwAUXMc5e6C8I
         icPGpt6wC7jGZcXshrDYD55G6FdcPE2h9iW+dBetAbOQRVfFiq0gF18WLLlMNavC7tgJ
         /mDEUgj1gyjT/bfYMUQKXidnT4u744Uc37JQMCG4k/7Eja0RGIdPWW3K2/NMTqN9A7jl
         DCBg==
X-Forwarded-Encrypted: i=1; AJvYcCV+EdWHV18mQYd30Y0gInG9CQ+F0lawYaHlgb4Pz9CBwdVKqxhBNotmpbmptqNvc16ycC2Sc+M7bzd3xW2BDPWJivU+ZnIBiQ/sHEo=
X-Gm-Message-State: AOJu0Yx09xZ/bOUGv9bHIz+4cshGkatb5845BKJ6UKg0SwZ2mDGnw7E1
	8Mu+yu60jbmqvp7KoMwG3eollZLlSGU+E6CCTj/JN+sdMCTSxrXAO5f2x6HdQC84XFUuXql8IAJ
	tPQy+qUqqnQ==
X-Google-Smtp-Source: AGHT+IEOC3rOHQV8YVJAKI1i9P3AoSJkILWdGHZJdDgg4sdQ1vQUA5cL0b88ZoFM3DAb5X37SFDTdxDsbHrrgA==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6000:912:b0:34d:71ca:82fb with SMTP
 id ffacd0b85a97d-34f81747f25mr7345f8f.2.1715097331600; Tue, 07 May 2024
 08:55:31 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:13 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-11-panikiel@google.com>
Subject: [PATCH v3 10/10] ARM: dts: chameleonv3: Add video device nodes
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add device nodes for the video system present on the Chameleon v3.
It consists of six video interfaces and two Intel DisplayPort receivers.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../socfpga/socfpga_arria10_chameleonv3.dts   | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dt=
s b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
index 422d00cd4c74..daafcc14e8cc 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
@@ -10,6 +10,200 @@ / {
 	compatible =3D "google,chameleon-v3", "enclustra,mercury-aa1",
 		     "altr,socfpga-arria10", "altr,socfpga";
=20
+	soc {
+		video0: video@c0060500 {
+			compatible =3D "google,chv3-video-it-1.0";
+			reg =3D <0xc0060500 0x100>,
+			      <0xc0060f20 0x10>;
+			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		video_mst0: video@c0060600 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060600 0x100>,
+			      <0xc0060f30 0x10>;
+			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst0_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_0>;
+				};
+			};
+		};
+
+		video_mst1: video@c0060700 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060700 0x100>,
+			      <0xc0060f40 0x10>;
+			interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst1_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_1>;
+				};
+			};
+		};
+
+		video_mst2: video@c0060800 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060800 0x100>,
+			      <0xc0060f50 0x10>;
+			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst2_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_2>;
+				};
+			};
+		};
+
+		video_mst3: video@c0060900 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060900 0x100>,
+			      <0xc0060f60 0x10>;
+			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_mst3_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_3>;
+				};
+			};
+		};
+
+		video_sst: video@c0060a00 {
+			compatible =3D "google,chv3-video-dp-1.0";
+			reg =3D <0xc0060a00 0x100>,
+			      <0xc0060f70 0x10>;
+			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				video_sst_0: endpoint {
+					remote-endpoint =3D <&dprx_sst_0>;
+				};
+			};
+		};
+
+		dprx_mst_irq: intc@c0060f80 {
+			compatible =3D "altr,pio-1.0";
+			reg =3D <0xc0060f80 0x10>;
+			interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			altr,interrupt-type =3D <IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells =3D <2>;
+			interrupt-controller;
+		};
+
+		dprx_sst_irq: intc@c0060fe0 {
+			compatible =3D "altr,pio-1.0";
+			reg =3D <0xc0060fe0 0x10>;
+			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			altr,interrupt-type =3D <IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells =3D <2>;
+			interrupt-controller;
+		};
+
+		dprx_mst: dp-receiver@c0062000 {
+			compatible =3D "intel,dprx-20.0.1";
+			reg =3D <0xc0062000 0x800>;
+			interrupt-parent =3D <&dprx_mst_irq>;
+			interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dprx_mst_in: endpoint {
+						remote-endpoint =3D <&dp_input_mst_0>;
+						data-lanes =3D <0 1 2 3>;
+						link-frequencies =3D /bits/ 64 <1620000000 2700000000
+									      5400000000 8100000000>;
+						multi-stream-support;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dprx_mst_0: endpoint {
+						remote-endpoint =3D <&video_mst0_0>;
+					};
+				};
+
+				port@2 {
+					reg =3D <2>;
+					dprx_mst_1: endpoint {
+						remote-endpoint =3D <&video_mst1_0>;
+					};
+				};
+
+				port@3 {
+					reg =3D <3>;
+					dprx_mst_2: endpoint {
+						remote-endpoint =3D <&video_mst2_0>;
+					};
+				};
+
+				port@4 {
+					reg =3D <4>;
+					dprx_mst_3: endpoint {
+						remote-endpoint =3D <&video_mst3_0>;
+					};
+				};
+			};
+		};
+
+		dprx_sst: dp-receiver@c0064000 {
+			compatible =3D "intel,dprx-20.0.1";
+			reg =3D <0xc0064000 0x800>;
+			interrupt-parent =3D <&dprx_sst_irq>;
+			interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dprx_sst_in: endpoint {
+						remote-endpoint =3D <&dp_input_sst_0>;
+						data-lanes =3D <0 1 2 3>;
+						link-frequencies =3D /bits/ 64 <1620000000 2700000000
+									      5400000000 8100000000>;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dprx_sst_0: endpoint {
+						remote-endpoint =3D <&video_sst_0>;
+					};
+				};
+			};
+		};
+	};
+
+	dp-input-mst {
+		compatible =3D "dp-connector";
+		type =3D "full-size";
+
+		port {
+			dp_input_mst_0: endpoint {
+				remote-endpoint =3D <&dprx_mst_in>;
+			};
+		};
+	};
+
+	dp-input-sst {
+		compatible =3D "dp-connector";
+		type =3D "full-size";
+
+		port {
+			dp_input_sst_0: endpoint {
+				remote-endpoint =3D <&dprx_sst_in>;
+			};
+		};
+	};
+
 	aliases {
 		serial0 =3D &uart0;
 		i2c0 =3D &i2c0;
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog


