Return-Path: <linux-media+bounces-35799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FEAE6B17
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 17:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 539A07AEB88
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CE52E2F1C;
	Tue, 24 Jun 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSfGRXfM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9092D877C;
	Tue, 24 Jun 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778408; cv=none; b=YLkP8jiME8HvaSz26ry5B1zt1q1LaFe29yVnVazo9e3ACwDxcAYIsErim4gxz1LXqxqkBqWg7nzxger8dOm1eHU0Am/Vb3HMF/jbajBDTSzqspzXn7HedHgQ6TeggI1eK0J9sTbHpOOhBBoAy38hZHBPy839KBKH8VLIdXAA4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778408; c=relaxed/simple;
	bh=9WOZ2U16bU4qdb2Fyo3eqQ8m2kp6QdcIvW61S3g6rps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElqGipHq/qSoJAs+5vjQ+sARPef0RpK8RCeIhe3Z+1LiyRbIcqD5w6Mn1Ypt2099SbKVbbEpjXinByw88dLL4ZsOW8ZED/i8rnFhxubkJFHPury05c5lhPdGX29gIKQuTTYpPGMbCEbwaDSjb+B2pLRESCk2BTDc67diA1LZqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSfGRXfM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-237311f5a54so54551795ad.2;
        Tue, 24 Jun 2025 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778407; x=1751383207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Gn79PJLQC7ePGyYkvVQEXF99s8ix0dYxp4JZA4p7J4=;
        b=KSfGRXfMK2CYLZrhVn3IbefZcvy/xwRisMZdBOh5SEjRjy0BiiUcEaGybD8UFLlB3k
         6dNrk7FINxGxqby9MVFk6+qTIAxCDIRl69ibIPmd8bQqYqruYzIJG+RJnGL7bF23/z50
         HhaU0w+YdBpz+RkL3pMZUG7yNvHnSwmbpk/K1ffT20ekj0PqLGJsyI8izcpnOM0x1j7K
         EQVQD4gBDVvWz4SZd8z1ZepUSSe+rTqyRIglKXsP6BElyhAJjIp1Zl2V2nz//6PsmMiS
         Ven1OYU14gtWXMmq807Qnees7CxYS/mh+2CFEDqZwffgCFGKgjb3rjK97YWvPk/R5YVa
         ZzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778407; x=1751383207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Gn79PJLQC7ePGyYkvVQEXF99s8ix0dYxp4JZA4p7J4=;
        b=sUtc1n+MNGwCnstU+rtl+WajnPFxtsn9j8l/9YVfSjZqVR7yl4pB9X3tACfd5lelZb
         jglt8v2YY4PTjb28kRat05lmE4yOt7e1FOL9tiK/SJTluKvFu2NLVRbTL2OuEzIR/XK2
         MZJWYLVHf5lfkLp1h8nnjjJO0W53tSd9CHx1Bd3u8C2anu36AYPrkM7+Bv/xNjFp59h4
         cqQkTQvnbuXaUjLU9nadkyWkDQOX2tRWK326oJJFPpabXiTfmZSjZEsYKxulkioRlPA6
         DqBck39mDrIwWvSfvq8is3kfBxH5zsjM2+SSF7lx0BD2096SiG6YzCJli8r/yF0S02Dw
         nj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6t40YHp516pU/AV7ejKu3QeUNu/vSv+bstDrea+9kbzKn22Se66RD5hLaOCduqig0cxx2+6YA+k1Bkjc=@vger.kernel.org, AJvYcCXl1bJWxdmlmq2sM6h7ia7hBpT3MlF3nJ0AlWamNbERtpp3hrOzt1qs+QzOuGndgXC45WkHMzdFmYJiX64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuZBjyrmVgnZK2oZwYp4p96bSrTfwYPVoyEOwkBdrM/aHphl2S
	yaCxMd/zGXYptLh6zvOWXzRR8BTSx9/ky6hi5qHwTG93HP9lG5UWMjDr
X-Gm-Gg: ASbGnctIU8qzfuDlkpmfSx5Zajk84OWHHxKSUCvVVCRJ9cyWkud988w/eHdsA46MeLj
	Z3EjwoZISS3SRoVNwO4J8YYS1lgKDUGTcRO5BsI+lJcnEAlm6wWgVHdFa94x4R3vx7mywJXgMIp
	PL3Dy6MfmjF0KrrIBf/8rwHZPjuH9YnzdLuCs0hullWe7hXwcwLM/kB9jmrDOGMxXowiKx4DVzh
	sFTZ0jgzwKBb7mHERFqxuTW2FXF7IJKjmMTF1YfB9mBKJS5WQkO4HSFkKAvHQlPMTFs4A43o50h
	glrIEQ81DIMRorheBWl/RZUaM/U3GizNmjd6FVByQ5Q7wCj5mt7RX5tc6GhHJ56O2ucT1Auafd3
	+uXr8UzBPCqv5HCxL2bpyNZjBJfhlgsNZNl0FnbH1HsW7l+Mu/g==
X-Google-Smtp-Source: AGHT+IH1Csh1hHtPrY2L0DzN9wun8J1kFW3ajVUEsxPwcR2fKElwEotatpGo0o+Bff9Z9QctMzExug==
X-Received: by 2002:a17:902:da8c:b0:236:6e4f:d439 with SMTP id d9443c01a7336-237d9965716mr267845215ad.23.1750778406609;
        Tue, 24 Jun 2025 08:20:06 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8672498sm111979465ad.166.2025.06.24.08.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:20:06 -0700 (PDT)
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
Date: Tue, 24 Jun 2025 23:19:58 +0800
Message-ID: <20250624152000.489-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
References: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
In-Reply-To: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>

Dear Andy,

Thank you for your suggestion.

You're right — the driver is quite large and contains many similar issues.  
To keep the patches manageable and easier to review, I plan to split the cleanup into multiple smaller patches.  
I'll start by submitting a series of patches, each focusing on a specific file or type of issue.

Since I’m contributing in my free time outside of work, I may need to spread the cleanup over several days.  
I’ll do my best to keep the patches consistent and focused.

Thanks again for your guidance.

Best regards,  
LiangCheng Wang

