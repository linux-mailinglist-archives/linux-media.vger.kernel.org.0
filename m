Return-Path: <linux-media+bounces-38497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA758B129A2
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 09:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9793A3BB7
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 07:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F8C21B1BC;
	Sat, 26 Jul 2025 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnhZWB4i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984B21A454;
	Sat, 26 Jul 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516403; cv=none; b=WRkk93Repl/vidyEPpiVhIDE6Q8E9M+y28aIjbChbOOukTOje5bWUbg0f02LnajYKTG6+ohQDqAHGMMvG8imz2pZEpGXWyqSiUfAixH+xiFNdjFpsj6qfuuJTE8u6FyjhgAWGr1qFb5l8H6fueqC4/ohckQkvN9GitfbpkTFsYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516403; c=relaxed/simple;
	bh=3Qjdm6PtWrFNTZBStfguZeGDAbUBJUIMNAuc5t1bQCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b47P/0XY6cDHQmatXCZavzLBvzv09EeamfVnYUe/9cSX7HWqWYjUNhA7rMi83p/NJWZ88MAx6T/I4cC9tYityp7nAajRanlZaGQdiS66Jp9sTut0bKHU1iMztRaowiBCYkHevfZ+ymWRvmgL8BQ0RzvBv8ozkGA52Gj/agF/r0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnhZWB4i; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so3188401a91.2;
        Sat, 26 Jul 2025 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516401; x=1754121201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCdGgGFrudYoJJ6O9JjbvqrUoaz8feQegg9lFN6eSkQ=;
        b=XnhZWB4iJtYhlLzVXYgBr+cXygeHOKOB/nCyFabqoxpouLdo3Vbk7gKp060nvzm/MG
         7UebDceS6wI6h1S0Z6VkmLxbjd0Gl2YZg6TceTptd0EZrhcpPQxdVHmHmROLhgAHrgCE
         ruwoiSvfOxqdf3JtthsBSSRleYtox4hldnai0EXDzqLREa8rGgSmC7FxIHHLF0RETkzQ
         wu4w4QHZgrHhzLnfwWh753s13aLevYpfQIORbZWlvxF/sSzPUT2SxGxrDYZoFtlywdrg
         0HFNxFdnPusHq57BaLg3Y6a1yATlSBVPgpLwSYgZJZhrIBbhwK3bVpy+M+ztD2hXKHha
         iUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516401; x=1754121201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCdGgGFrudYoJJ6O9JjbvqrUoaz8feQegg9lFN6eSkQ=;
        b=dIdABbA1ae0QC8T6Ueeo5vKbMuG9W8nqboh2+hCCZBgUTcB9PXRx+2RFCiQ3twgYOb
         ZY/hyj9i7hXpktd73cAJsO1qmHrWPon50aCeFfuErvAGfUIKfxXYtTTDlXhQgn8Mu2ih
         24SgLbC0c9i5QNzZytlZq2/Kn8fI+iF0mh9mEVfdMRllRrUJ/Uk/UXLo984414U17ca1
         5Kxb2fsZ/84RQZkfq6J5MVFhtyynSzgO3EJYMK5siUQipSjNzPI8QT8ofQKVyu0Oc9M1
         GXDLaehc8r7MR6VcY7aTNDKZOBzwIlSEwkZP0AUzkBLEfXmWGMGGfrZ9IuVq0Eev3p6+
         /ckw==
X-Forwarded-Encrypted: i=1; AJvYcCUHIiH0D2m76XISoydK1/K+DlmHqMWhK09grRp8QLY7X41dHzV6QU2RZ9vYWrJWGRCIvOgqVqP5jkLFbW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHmifsqkrVm+zdsqQJeo6OD9yIRg4pax83j/e+9Qw/qhchPTu
	J+7PwcrMy+pf7OWXFJLVsIGM39NlQXqNDIEI4xrOOyhkgmHZJcJOQa1o
X-Gm-Gg: ASbGncvZFN6dX2b8pnumQzviO2Ptx7YiUwkSN47zuy2Hgn82TBSJqwWqEPCGRe4vRKA
	BhVEDKpYWNGrcGW0zRO7+63SpFscG5dwLpLyxD1MCzof1F8raWnyHp8ZqmoWkQd07T2rILAjoKf
	0tTa0bzXZS17PqkooCKNQrY/W0DCuL8qUlhyRUke4S5U2jNCU2rFn0p6D9OwqBHyLt+7hVr1hTZ
	HdqfclyxwLfuVLFXOQyCF4HwX2gWhT5OMI44UbgJ0JMt3MNo0OKdAj4Mw87MWOKfWbtM1QZoy4t
	hoxY5BXNJDaCZFDZYB5rK8x+x5bSBDVKiiZV2f3kg2WRtZl37L6zjGeLCuLtayMQ4TL+LjpKG/c
	n+H4mCV66YZzIYsljb8eGb+sWKmQZTgYZSIhmLsYEm2BU0cEWXED4xgCsvnSidjiFqmn2hz+e6v
	AdNGcs2pOUBA==
X-Google-Smtp-Source: AGHT+IHor8mK9tBLBooGw5x/C/AHysHucS5DWnFL7pQyxEsxLj5rNCjCX0gnoVkVb6bAF5sJv5UoAw==
X-Received: by 2002:a17:90b:1e4a:b0:31e:3f8b:216 with SMTP id 98e67ed59e1d1-31e77a2f7d9mr7919333a91.11.1753516401189;
        Sat, 26 Jul 2025 00:53:21 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:20 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:11 +0800
Subject: [PATCH v11 1/4] staging: media: atomisp: improve kernel-doc for
 ia_css_aa_config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-1-46eba1953fba@gmail.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=1268;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=3Qjdm6PtWrFNTZBStfguZeGDAbUBJUIMNAuc5t1bQCI=;
 b=FanCKmuJq56Xx1ro272HoaBJuA1Auoo/7X2DjFhi86bQArOiPdoZoHRqqat7LBgLpd+52nTwU
 kftGY9+lNYrD++mWUHQ6dB3MieqeP1gPMB7Ah2m4/MuhkLAM+XtR9Qr
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Move kernel-doc comment for strength field in
ia_css_aa_config from inline to structure-level comment
for better readability and tooling compatibility.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..f825f537a5366f6b97170dd44827436fd800d105 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -28,11 +28,13 @@
  *     ISP block: BAA2
  *     ISP1: BAA2 is used.
  *     ISP2: BAA2 is used.
+ *
+ * @strength: Strength of the filter, in u0.13 fixed-point format.
+ *            Valid range: [0, 8191]. A value of 0 means the filter is
+ *            ineffective (default).
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
-					u0.13, [0,8191],
-					default/ineffective 0 */
+	u16 strength;
 };
 
 #endif /* __IA_CSS_AA2_TYPES_H */

-- 
2.43.0


