Return-Path: <linux-media+bounces-35796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0065AE6909
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491C64E36C0
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630392D8DA9;
	Tue, 24 Jun 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Au4wojRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABAB2D877C;
	Tue, 24 Jun 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775559; cv=none; b=TQ0PI4gj4OyeCSGSl/1i8mynIkcrY2i66Ds6D3QJMmuEYST4zlHwpUGLPCxqBMMpSwKVXv96woW+joD1Rusnt10a81qTfCVggUtx8AxKQJAhv4003kJNIYTuaoNa3lguAt51RKcFVr4fPhQjDn5wHHtqOjHbAyaiNPI3Av25nnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775559; c=relaxed/simple;
	bh=OIig1hvOgr3Yfn3X9EzxrKMc25cjBmewUAcFdr2bDIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKY8R3PHM3ibywoSchClBv2c2ESvyw1r4WhmEzJ100BqPyl/Tx7fD71zltI8n3v9r1w8PucLqhg9vDCJAp8rrtkAVvIIojIYZZW+WIix0YieZ9nbf7Kshb1+1NHHw8TPDfVSVFD3+jUvQrPYPQQGqhyope8ITZkupXGCFQwla+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Au4wojRo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ef62066eso8171525ad.3;
        Tue, 24 Jun 2025 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750775556; x=1751380356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0T79Pfy96T4ZzYQAUwEM5a3O5d3tQvoc+ot0z1/UEs=;
        b=Au4wojRoKX61TEiZ7+NjNonmGCBOkF8W/3z4KsTyDSFv/kh9By2A7Kb2/6ToKC0Ha4
         zLq64txPk3LEwSRcaMJAZPaRGyrAYop4WYMYVQlF1lD4OO+cKIRfP7vA1ryl2cJi5eZk
         OCpgp1B+Vow3g2IBPnMvRBhNSzrFp+cd8PaXORzue1ct6xl5hIP49iJ1JkZin3FhMlaq
         UZd/fE5Knbr3vDk5oqvZ+if0fORddSCsPOJo3OK4jvMF2XpRUvq/zTrH0dhOqgh7iWNX
         EQ58iDP8kAYN1qbDdbjsDfMUABq2QGUsWUnfOtMsWbxp2rFjYpaJa+1A6tTRs3sPrgox
         Ntjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775556; x=1751380356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0T79Pfy96T4ZzYQAUwEM5a3O5d3tQvoc+ot0z1/UEs=;
        b=aUmr37Ns6MjjqQ8PP1TLEEPc6GSpqDTh2dAhxiBiT+tOhWR4Fk1vOCyELHNT8ZVC+F
         H5sG1lz20kEMPEbn3i20Pc2F1YAZr6Kp9PqVkXKDqR6GwaNEUntzUI7U7X0Eaoxz5Brs
         1OTyeqYtbw2N/2+Nvf+c7ajtn0TplCc1kKdx7UUntoWVJYy4A+eYg6fqIYANNtQfEbl0
         4UD1KJDHSai5NXtWkjvGm42cfka2dBNF2t/4BOidwMEL0D8xEkeqFer3V25le3i7W5s2
         zFgiw02MXeDh3VNVTgtvnmQ0Da0uDXPVRfI6YW7IV8SGdkY8FM43QaSRLt9FjxDxleSX
         glkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlafefsr11DLpmIkC1SK7/kCy935O1AXIgZZjVCzF5mLD/MfyToWr/DZKvIck6xdkQ7GNYbh3jDoLJYzY=@vger.kernel.org, AJvYcCWj/U/PSugQeJwEJvdxyEJCddcPQLys6/Xbazubq9kHzGcN/Ev5AUCPoXnoyBnI/PbUTxwBePJKEXJja0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0MDCpffIjtRxdPY86rfQrY7c/GjX8h+Eye8AUl6enM3oVW2b
	SeFjVSuPEiX9n7rrnRcS8waZBhsz6DM4JwngLd/2VfF1q2A5icWnGFNK
X-Gm-Gg: ASbGncuJWbQsCf2DeEWMXTPPxJdMJDCZigOVPxQvfzTdhNTyGmKwNHwahW0U9RLJLBm
	J8KQgKab1mCp3Rsqx577dJ+uvNpT8Q363QyesEnm/Opa8/pwhg1jYJ8B9LQ8PjaqTezmYUzlNPD
	1valJ4lI53hMUjdJM+x2sEpK8eqVDz+NPw9cZIxkQ98bxKFe6ibxlUArrDdTv5rJlyG0KzHcJWf
	xYyursGlMD5BLX911pKTtpL9lx5f5NZqpJgT70AjtwaNTrifbsjpuHtNaHyJPOSYMB3pXSPuW7t
	5NfGTQa17wyucn1W4i95iE0oCbVj0SUIxrqchxJbU3hQ/eCK/52le9h9tybP7fie1LWDiwEFAmy
	wt66V3XYBGjIJO95RHshNN0mC/bhpsJWBrOkDsJMN7wHFPbYi0Q==
X-Google-Smtp-Source: AGHT+IFB0OcxXR+rMYUxcMWdJSDTc1Bi+l9EeflhyXF89wkDLaiWhCxHbPwziAX0Lw61qZukehfAMw==
X-Received: by 2002:a17:903:2311:b0:235:866:9fac with SMTP id d9443c01a7336-237d96b63bfmr280113405ad.2.1750775556394;
        Tue, 24 Jun 2025 07:32:36 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d0bedsm108923595ad.67.2025.06.24.07.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:35 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: andy@kernel.org
Cc: zaq14760@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
Date: Tue, 24 Jun 2025 22:32:21 +0800
Message-ID: <20250624143221.2371-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
References: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
In-Reply-To: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>

Dear Andy,

Thank you for your feedback.

I will review the entire AtomISP driver for similar style issues.
If I find more, I will send an updated v5 patch accordingly.

Best regards,  
LiangCheng Wang

