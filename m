Return-Path: <linux-media+bounces-29665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B062A815CF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16AA880D6C
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 19:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E802505A7;
	Tue,  8 Apr 2025 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCAjdMpR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B67124501C;
	Tue,  8 Apr 2025 19:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744140738; cv=none; b=t+sJrKnTwUObBZvwOEhGxPIMJqiAeZHgoR/25MfUmlRlxd+cTS/viKwQv+qWQ8VDXrb0OzhjWQynnL0oDkz2HQ2cGq+iksc/UeRXOEYuz3lLhUDQrhS5MBaCS2AgmKexJhIy1C6XjMB7DDQougRXCQy1B/FguW3YPRoZHjt2ELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744140738; c=relaxed/simple;
	bh=/g5m4elKq5diPwjXu3QJwc7cOXThinhGSJN3hT85NhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q00NJlegG9/BXaorQx8kdmnhSB2DPmpJinXK3IycTyxVXtGV+1Hk2yJ5geBk68fdXvT7l7HcqaGeN3y1NN5xKkM0pLm6aCn4k+Au2KOQ4f9BQKlO9E0JXubAE2lQf97kI+TcBwAvHldfHHraKj7KXL1CIKbhQaN6noHKEBgQlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCAjdMpR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso31055445e9.3;
        Tue, 08 Apr 2025 12:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744140735; x=1744745535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIgqXH9EYtYBlKfhIB28wi5x+Stg0Aqe9nHItTMya/c=;
        b=eCAjdMpR4ZaWzYUI59ywDF9h3ri0VaUqXKjPoIb+u3aou4WKF/zdMjU+v6CZxrzhSu
         uucJ5OA8uH63rJXmXEGFi817PV9G9ox7+V/zLL+1VCs0IuY/fuRBOfnqiWZhOTQZpGah
         f/O7tabz+Og96R6aLruwp21jRrJYRZ4wG6E658f+2P82i8jUDfrFKhNHBV3e/kpf6qAa
         BiHG2qpJ9dzhRCxJirdWkJI5EHZClJdPZJ3FqiLHzr4ZsEReQg1r1dFOltEvdH0/R+Ev
         2DWcgd/Kb8de6SHbm/9V8B5Ld15KvDvlsbba3ySToSMQiMTG7B0K1k+R7RDrWOHWhsVy
         idmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744140735; x=1744745535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIgqXH9EYtYBlKfhIB28wi5x+Stg0Aqe9nHItTMya/c=;
        b=Alk2lATmyG3Gsmd2SH+uzAmf7vWp/FiZABujoHlm8VMpyQsq/odiSb1V+spPUQLU6f
         c5vULI/OQZp0KU3jtSrwKu9xibeWiLQqWlTqhVaOX4hJxSikRtCvB70e+RnJlqtKvmJ3
         hROsmrtrNBjygippvEO/BknKPaJl04R+S6eWpx6CH8LkIIcYmbMBBBLDaGTc1PXd9zSb
         nHJQ7R9CSTVIjjZLvjVlIJW92YUPb7/0P/4c9Pt0ZW3N8euJUPDTQfRQ6bgMLm5uppxh
         R/07SqgnmLZzq8smblO49XTbSJPsMBpvoynqcD8byC7mvPhh+ti+fPYsXTcsna69+y5Z
         NdIg==
X-Forwarded-Encrypted: i=1; AJvYcCVHCkYuG5TA2nRQS0VyZimF6J0XMLW3OViP45GVTDRpXS2wsFIDgNpdCq8tG8H24GlsPN3q0JkjMn6lOlC+@vger.kernel.org, AJvYcCWL6PVfsJAc0fMz8PYxO/RJuuLkNcoFPIHqpI4IV2uH+S4sbBWD3J3aYl2Ow6gy3ItiYyva2qXXkL0MVy0=@vger.kernel.org, AJvYcCXwWiO+9a0WGgZ6V7rb823b59tV9I0cMELO5kivQC5u6gDtc0lCuuH9LhPfHnwI+3nh0ZfPXPOeOtAu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/F6MeGSWGS5TqzR9P0i3N4eGv7iEE6mUwlJYnmSIsKrduvRp2
	TQRQZkJnI66AcVMdbzpLyOzCnXsU4t0mJW6Zox5u3jwz3yTxInnt
X-Gm-Gg: ASbGncvfke1HIPAmbg13riEeUMDQR8wybnjoyq/JtiTgBGzbYRB4BXDsyLr03/erU+8
	6sW4R9B+QJEarkgqb4T+leUTAmu3yWelL3/Qkk6CLJqh7Fd58qHhdtAsy+l/1n3rd3xDBNVGJAk
	d8ALnqqPDZvW/LpOWOVuwy1fNECOiB8tQtPUf2qNa6iLNfSN50lR+NT1GYSTof5LpbOkRB4dT3X
	eFTmDlnUfwr53xBScbD4iMUR7FJHruuBiFssDIgPpsftXqS2aPAmtPF+TUTBbEUKmX4I8FmmTOC
	ffAvt6BOqbYpROAyl0RGDyX/7kv3y/YfhGs2kygFshukcvawQVa9aAdNLShXRFx1B+vK13GIX6U
	RHqE=
X-Google-Smtp-Source: AGHT+IGJ7TavDmi5cnvixHdygBLphuogQnSr41VmoPm0hPhwRRo9xCnj/ZnigqpcM9JunaCcx1yX+g==
X-Received: by 2002:a05:600c:1f0c:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-43f1ecabff4mr3658045e9.12.1744140734495;
        Tue, 08 Apr 2025 12:32:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm170209395e9.27.2025.04.08.12.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:32:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 20:31:58 +0100
Message-ID: <20250408193158.80936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The FCPVD block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index f94dacd96278..5ed9427fb757 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
 
   reg:
@@ -66,6 +67,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g057-fcpvd
     then:
       properties:
         clocks:
-- 
2.49.0


