Return-Path: <linux-media+bounces-31710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9FAA93DD
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 15:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68B43A4A4C
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 13:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12352AEF1;
	Mon,  5 May 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz22lsdy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129A116F8E5
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450071; cv=none; b=MhxV2pbtShoR1fn+hhQ7jhJqlWxa/UPhMDurJFzyvhqUpNIdbAKprBwbqaXrG2VoPSDBK/zUxn2NXMNPwP4fsSiDLb3dzNesZ0buz3CTPZJSFTAh+cbnfKKL6CVXk6FtS92g3DGr9x24bxM9/zyyVOezxvy+eSAip/M99AHTypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450071; c=relaxed/simple;
	bh=wLIChB5MjS58N3KVXfcfBC3Q4h4S+eGs8MftxDJsyj0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TwoP0HCycKgb2ClOomUTaxNbbUEYz28umH+f9IMzMt1zHkze7/5ufZyYmiK1mOL15pCxrlZGkNoK+h/CtHZ4+A55ZHw9KXpegyx/zvdXcoyIIh/hqbatL2ZVS0+C2iF7XF9dYnAz6UHHlnTrmT5j3/G6UCzPXpjs7sZTkeG8S3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz22lsdy; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5085f7861so2969034a12.3
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746450063; x=1747054863; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wLIChB5MjS58N3KVXfcfBC3Q4h4S+eGs8MftxDJsyj0=;
        b=bz22lsdyaNaV5t4/qbnivKzcZF++Xupzu1Ab/CedwZoteqE1L3mMncwachG0HZvSny
         m1xKEZg7+gOCm8BTsWToyyrt5j6OGQ1TIFGaEonDzEogFIbdewC5TO0u0llTm2KqPInK
         cob8BX6YgreJozgO8nmZBckGwNKzzolxVeNkEVmUVv7H3nrZUUQKJobhJg3dIS79uxim
         bUqC0riBzS7EaZPA67TBdvB0/Us6QChuadS/F9Tw2MojgSCgCURP8UMdzxoPI0mWZOZX
         2h08ZSC6FfkkbxfbfXRXqiEKSrRRX9f1Kobf8yPMgyP0KgXZ/+qy5xjZTZRTOjRN0LsJ
         TVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450063; x=1747054863;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLIChB5MjS58N3KVXfcfBC3Q4h4S+eGs8MftxDJsyj0=;
        b=U/PzRZ7TjLUFyptnDcaZEie4Vi//E/GvNGjCu9F2cVlMBOS7CZLGdwsCiaxEwGVt6Z
         ERhzEChvPD1uLfMY3k/4HUVd89hRLeJogaHv654BgQxNZC/RxsY8cMKUkCSwlecIMBAq
         MEUgm+oSTjp1N6mY5D/hc68iTRx4asKRef9AcFNOEIUDPIGBNk1jKoeSH9g8K6f4DLX3
         ZMr8tUZn8Is9EXkT6N5Ucwrhmvw6SVX8a4D7iAFyqn8kxjTcuqcjRX+XtIIhNy8nOQNI
         dnBkt3C7KGmo8926lHFgHk7x3eVS8/mipWwOSV2bpSNYhcQAGVi8EqSRCSgicLTG2Kaf
         f1cQ==
X-Gm-Message-State: AOJu0YyH/d7x4JqVht3h6ksChruzxboKzM5WGaFWRhov1HGaPApRHk49
	BGQKRJpZuZfOSj7GuK7xTdxDcabRS4eYhafHIOV2MnQAK2afxS0FMNgaxhXDfQziA7RO2Fud9Jz
	kCcl+hT0frAOnJ8vJt/WRy35WAQHop37O
X-Gm-Gg: ASbGncuhMaC5kZfv9XsZiWg74EC7j3n8W05WbJ9nbtd6VII/79qu7kBeC63dI/LBlcX
	onjL+px4EUI1ADkC81zAgKXXTRXPAuY0meOdE4v/cnioNCnCkfosOpebiYitaxmrOj5ldBQC2o/
	JFH96K40ss9s2VAhNCd0ZQMl8iu+k+91R5
X-Google-Smtp-Source: AGHT+IH3nE++gcgSJAn+HZ7+g/f8yhQRIcE7fGXoBDHm9D7bhwCkVSoIvmIKbSRdIQMFaddnQQXU19sQovteWBT0k2g=
X-Received: by 2002:a17:90b:4d0a:b0:305:2d27:7cb0 with SMTP id
 98e67ed59e1d1-30a619a9c12mr9708199a91.21.1746450062865; Mon, 05 May 2025
 06:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stephen More <stephen.more@gmail.com>
Date: Mon, 5 May 2025 09:00:51 -0400
X-Gm-Features: ATxdqUGpAeQRpcm6ww2BgHzUBALJNbw6E22hk0Nb4qV0vO0PwB3_L_U5d_o2Sj0
Message-ID: <CAL2vA_N9rKm0H-yHzjbOiW9USFDHCSxUiDSf3w3-Ep1GDnEucA@mail.gmail.com>
Subject: [PATCH] libdvbv5: dvbv5-scan add example for North America
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dvbv5-scan is missing a real world example how to actually run a scan.
This example has been tested to work in my region.

Signed-off-by: Stephen More <stephen.more@gmail.com>
---
diff --git a/utils/dvb/dvbv5-scan.1.in b/utils/dvb/dvbv5-scan.1.in
index af6f25f8..0dae9046 100644
--- a/utils/dvb/dvbv5-scan.1.in
+++ b/utils/dvb/dvbv5-scan.1.in
@@ -152,12 +152,17 @@ the frontend detected.
 .RE
 .SH EXIT STATUS
 On success, it returns 0.
-.SH EXAMPLE
+.SH EXAMPLES
+.TP
+.BI $\ dvbv5-scan\ \-C \ US \
/usr/share/dvb/atsc/us-ATSC-center-frequencies-8VSB
+North America - Scans broadcast digital television transmission over
terrestrial airwaves (i.e. OTA signals received with a normal TV
antenna)
+.TP
+.BI $\ \fBdvbv5-scan \ /usr/share/dvbv5/dvb-c/the-brownfox\fR
+.PP
+.SH OUTPUT
 .PP
 .nf
 .schar \[u2026] ...
-$ \fBdvbv5-scan /usr/share/dvbv5/dvb-c/the-brownfox\fR
-
 Scanning frequency #1 573000000

