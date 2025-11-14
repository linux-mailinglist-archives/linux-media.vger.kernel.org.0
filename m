Return-Path: <linux-media+bounces-47076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590CC5CE1B
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D84E44F1C01
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72651314D1A;
	Fri, 14 Nov 2025 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OD0hh+EX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF023101A2
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119711; cv=none; b=o3zCBxb0q7Mm2Czdul1H2AuiIbM98sWzzkSOCiWq6qm5YgIQ8UCVzQ65Z5cN88Ol9nHUIWystjo+zdm0ZLkmaIYfF2OxRhsJKpsuzATQZJnuE+WlwhDvO5/+DkB+JcKgBVHu3GDlRF556Y1IhjfPoyT5ex9WMAmcAifZaFUQIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119711; c=relaxed/simple;
	bh=gZ6RM7I7LMS7N4TaJM+UaMiCicFfzV9gRmHs9P09fTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCHrTm4yacD014g0MdCnriS/k/2MjnL2YV3xo5lrfbZGtyCFFHhhGVYPi+ZaWq41c4LwoBp2h+UI+We9be/AXNx3HjBFyTK2PL9YnLFO5inKuzTfO9BRLU6i9Ym6zAjuo2CdzYAzz0QMP29eY+nhZgtXIE+JFmwLyB4F64jzdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OD0hh+EX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so3149951a12.0
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763119706; x=1763724506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjA+zGK3njJ07I3nrFPXk0n/9BP2IviPUEM86/ETfVM=;
        b=OD0hh+EXidwnLRO7SpoAO6xk5R2HH1pVZw6Mi93eroWEZqol109MeehehNr8iM648+
         z1kKb59upQj+KM0W22xEld95TYC7UzjxVyr1vYpVmY83BhXvMgwlG75LTiDd/1q4eJC3
         3aToTV5Szj/6IuZaAsbQbHg47qmG4mFOuFpIUnxNOaBIoOZUh0BYb6Z0sKGFlcwfvVUO
         5dBfz7gLGJCB/juvcLor6yKs8qIqKPMjRvPyTvAnalj7JR13co+tEDPGuQnFfBti1ycP
         EmND/cP1rnwaal/HOO+OKDtekbpIbdiPebDtqImslUUR2uf6UeOEFFOEHNDCOYmU7T7C
         nfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119706; x=1763724506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kjA+zGK3njJ07I3nrFPXk0n/9BP2IviPUEM86/ETfVM=;
        b=ZHVu+IGx5WLx+chTvDgMVJB0ZLuapmf6LFAZ4QmMBfiqjLf2vWOPM0jLTh2nH1Ar5W
         r5Fjfy8KJOD0hu/INVpIQTYdMvLSlgSXDZjp8NCK5QKCThlLCBudcmx3xywbs6xeuxU9
         6gdg+1MRWO3nTtLtDN2dku1GF/ZzQ54sAadyoKvaIwk5Fycs8f7ejMbTp5lfaviWF+ZV
         b97s93tYiH1wzOZIU1SIYzSnyx7JQQCv+IySqo+Nsn6spvrUfVVFP1dsSdFuw/IPdCRR
         SyXS02H+Rw54BvcjJ8JXE5Svy++nXjVoD37Zx5uBdwPEji+KxcepUspmUQ9uHC9wtCNS
         CycQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmxt1xsOv9RKsR5AbqWmVF/8mYB0hItNVYfpzB9MW/X0KWqfTCH7TQoEhmPOZOA1NvTnuvKFkipOhqDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzheLNwO2a1OPpjxYM4JkCD8uy8A3Z10FrDVM+Femiblpa/8PPk
	ToDABPj+bMabxcmDMce2UZu0Ta4CkKkG7x6oGSL56t1V7SOiMY1sa3tBgU+oQcDm51uBieUGuk9
	d4EK8oME=
X-Gm-Gg: ASbGncs/IuKnyYA68hyxJUJZqfjhBACx1oP4EHuF5Tlq0Y8diIBk7fiy/PZ7wZutT00
	Ecj2JDUCOfyIbWz0SuGim294cZnXsYdMxzOqGzwgF8doYwh/y13JTxhqEPgt5Wpy22eMS27cp4H
	1xjfXQLjsf5gab3IBjOC+FvwQu99j+uHzb01SrDpH03qOdq91o/yLFohE6t1FAT+Dfuoi32IEH5
	VN6xcIrrsvSOmP7gk27Vda1h3Vr3hhqIlf5sNdo0Z1wnG9znlNC6yv6LOpUdufTw9HLoUKTg+yq
	83SKyUqDQXvhO9M1kBy9TBSGubcMwYrSBPltpIqbW5fbalP7f/BA7Gd+xjJATeGyjfvWirJEGul
	1p/xWHFt/etH3aRLomKzcrMpUw4NGPWPNKh4HXNdjthsIxTmFNm2+GkmI1MIgUoqki5BNlGZfqW
	nWnuWujytojUigihMzThGfEbVNLYR1NblnXjtF/3tfcAkWmVXpID8foT4E7gTAvfEI1hKkUlADv
	khkKvre/rf9wdEsXnlxVJo=
X-Google-Smtp-Source: AGHT+IFAKlWMb3D3ZUV4tTQA9UXvEtfsJp3xdbkYpjQ1GLhzUIfvNUnXrlkgc4Z8h2E7YGgvrqTLPg==
X-Received: by 2002:a17:907:3fa0:b0:b70:b13c:3634 with SMTP id a640c23a62f3a-b73678dd5c0mr275794266b.25.1763119706428;
        Fri, 14 Nov 2025 03:28:26 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm366887766b.70.2025.11.14.03.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:28:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 12:15:25 +0100
Subject: [PATCH v2 2/3] media: qcom: camss: Add SM6350 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
In-Reply-To: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763119703; l=15891;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gZ6RM7I7LMS7N4TaJM+UaMiCicFfzV9gRmHs9P09fTM=;
 b=qIBI/b3jUToxQZ1nwi3vgj/W4tukRyQoHQPFSabXkfD5mJowFjnjsiXAdoQnn7JbfR3wXzXA6
 s+X0nMio/5ZCSiZAM5pyR0cuZH6nhLq0InKqRVTW/4X5OJBFdJ9ahOk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the necessary support for CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 249 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 377 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a229ba04b158..3e44b0c8298d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -398,6 +398,126 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.2.3 2PH */
+static const struct
+csiphy_lane_regs lane_regs_sm6350[] = {
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0910, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0900, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0908, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x005C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C80, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C88, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x025C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0260, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x045C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x065C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0660, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+};
+
 /* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_qcm2290[] = {
@@ -908,6 +1028,7 @@ static bool csiphy_is_gen2(u32 version)
 
 	switch (version) {
 	case CAMSS_2290:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -999,6 +1120,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
 		break;
+	case CAMSS_6350:
+		regs->lane_regs = &lane_regs_sm6350[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index dff8d0a1e8c2..336838b1340b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -339,6 +339,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
+	case CAMSS_6350:
 	case CAMSS_660:
 	case CAMSS_2290:
 	case CAMSS_7280:
@@ -1989,6 +1990,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..270f5a1341c6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1318,6 +1318,241 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_6350[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_6350[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite" },
+		.interrupt = { "csid_lite" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_6350[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe0", "vfe0_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe1", "vfe1_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe2", "vfe2_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm6350[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -4398,6 +4633,19 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
+static const struct camss_resources sm6350_resources = {
+	.version = CAMSS_6350,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_6350,
+	.csid_res = csid_res_6350,
+	.vfe_res = vfe_res_6350,
+	.icc_res = icc_res_sm6350,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm6350),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_6350),
+	.csid_num = ARRAY_SIZE(csid_res_6350),
+	.vfe_num = ARRAY_SIZE(vfe_res_6350),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -4478,6 +4726,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..ae456ff4e612 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum pm_domain {
 };
 
 enum camss_version {
+	CAMSS_6350,
 	CAMSS_660,
 	CAMSS_2290,
 	CAMSS_7280,

-- 
2.51.2


