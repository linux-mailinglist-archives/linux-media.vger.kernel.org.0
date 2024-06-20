Return-Path: <linux-media+bounces-13884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9C9119B3
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 06:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987081F24145
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 04:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5184912CD89;
	Fri, 21 Jun 2024 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eNGDy+SY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F11D52C
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718945208; cv=none; b=Mo3vP1qHrY5fPp7yyT7gkM1YtJKm1aEeIjrLWNETG/ux9MCex7kv22fd6Q0NDp6jRB3nAqAC/AIJKdOcshd5Mp38ald/ZCs0/4z9GlOlzkglybaMijutIv+BuZpnJ0lzDGckKsXSPMLaTjE48/mid1Q4PBF1NsFBhg+OekvP5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718945208; c=relaxed/simple;
	bh=JJC/I3O5GRXPoKzRW7Nu/QuO8UBu1K3iC2+TCvjJz8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ca52v3UV9/lQEDh20QouNuU7QAu3QBN1Z9gZLL+OZHcSTbPzSzZRo65jM6a91JMCQQAW8H/l52S9DAYymuvXMM7BLeCRF1RsxgL+uNoDXC2cyZg/kPUi5grC6jCZvxEHRJm+VY1wVMwA98jSf7IfNIpk8kE4OR5TmwPH233Z/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eNGDy+SY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b45d6abso13203355ad.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718945207; x=1719550007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVr9D+4ZKCK2Oqgxnc0hRFyswNHBf7kcjS5sJf1/BeQ=;
        b=eNGDy+SYGc9vHZJZWUXH9bxmcKAm9yThYyDBS8YCBnGUtXsV6cQ3pciWIwP9QmYCnq
         VgujbUlrEWqCLmG80WebATRcS5cDWCvbhTC9cVbPrHEDVCCDFCGvBVgcLHHAXwPHdC+r
         R2WK7AEJS7C7u38Nq8ddoWl2NhTnc6OCR/OPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718945207; x=1719550007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVr9D+4ZKCK2Oqgxnc0hRFyswNHBf7kcjS5sJf1/BeQ=;
        b=SK/lgEJ+Vy9o/N3HjkXJBHcJNkdpPO1L4UkkhNDvOiaLhGHccf3CFJ4dL+i09xvvUW
         pCwDEMhUeKRwONXjhYdZ3liEF6xppywY0b5lczoG+u0ZRDb5FKuwFkjNuKYAeC0dkp6F
         FUHXEPJSqjXdV0kncGCk/E2mEiFXPq7xSonV7E7fLF04yiW6VC/3KxFf2yz0cvPbBNBx
         Rq9YA+IgeJPQSinU8rFpvw1OQleEM93RIpASLj/vUtVZdT3obbOQDOMs0RA7tAM3hjCV
         rT1CdtomjOqLMGh+GTzRbMljyOzec8C0yhJ2dAFIIOnMVm5SAp1aMP2UpMFVYe3mC+r6
         vKsg==
X-Forwarded-Encrypted: i=1; AJvYcCUTb/paMIqMru3a4MpW//ALtkndE0QoHhKAgDAw6caPmYE915I8rHS1VxWRNm+a91jC9dzpPUcarKDgXlDuq3TM1S+V4heJ661kBf4=
X-Gm-Message-State: AOJu0YzuyvNkSxo7zL7IDKCQov9u2mceuBpnxUSUQ0CI4JH6kHFpeZOj
	ex3c9aTttp+6FlLl4PKIn7qdIWb8+cfYlZK4PkveZ6lryw2eDbQ8euVRSOr9bg==
X-Google-Smtp-Source: AGHT+IFs/CgRUv0OLU87fXdJupgE65QELm3r/SYFBgPsk4QhHbCW0ldgmGnj5XaE3T27hhupEXL4bw==
X-Received: by 2002:a17:903:11ce:b0:1f4:b859:cb60 with SMTP id d9443c01a7336-1f9aa396f5amr80206435ad.10.1718945206711;
        Thu, 20 Jun 2024 21:46:46 -0700 (PDT)
Received: from mstaudt.tok.corp.google.com ([2401:fa00:8f:203:3c9:e095:f93c:9c3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb5aa5sm4780755ad.271.2024.06.20.21.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 21:46:46 -0700 (PDT)
From: Max Staudt <mstaudt@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Max Staudt <mstaudt@chromium.org>
Subject: Fixing IPU3 IMGU warnings due to extraneous calls to s_stream()
Date: Thu, 20 Jun 2024 23:45:40 +0900
Message-ID: <20240620145820.3910239-1-mstaudt@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear IPU3 driver maintainers,

The Intel IPU3 IMGU driver no longer shuts down cleanly since v6.7,
because vb2 now complains if s_stream() is called multiple times on
the same object:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=009905ec50433259c05f474251000b040098564e

This series attempts to fix this, but needs a review from someone more
intimate with IPU3 and its driver. Could you please have a look at this?


Thanks for your feedback,

Max


 [PATCH v1 1/3] staging: media: ipu3: Drop superfluous check in
 [PATCH v1 2/3] staging: media: ipu3: Return buffers outside of
 [PATCH v1 3/3] staging: media: ipu3: Stop streaming in inverse order

