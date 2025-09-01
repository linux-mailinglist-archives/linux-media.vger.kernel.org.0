Return-Path: <linux-media+bounces-41407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFCDB3DDB2
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014BB1887C95
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906EA305062;
	Mon,  1 Sep 2025 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s5KnLJy0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AF6304BC1
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717858; cv=none; b=Q4CALxFLUCYudhmmDVQvZLRg1ZpURknV7iVRymwxCfbvVcVLgJhLJhFumBim//N3lpPX+1Nn8EdBzkeiGB2jgEXX1v6bbQJhTQ9SyzFgMMcYAy4U0cnKL25FncbOY2ZTxqJXFdKUTqoRvipZLIXx4zN1KxNbhJEaLR4YHZwOrqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717858; c=relaxed/simple;
	bh=ACP8MZnAlAb5InMjYQgm922aUo2YjOy4WzsnXNakYg4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cJbX7g/F2EpQR79WE6umNx1U7KrUkbTTpBe357NHB9RM4nkyLmAsnGp7XWRPZ8/mfO/lqQsagIBexDPhwDPdN5MNs+geXkq9Ma3nvBbC2qEdY6UOBGzk/mYe46Iqudx5pLyCCdDRywpIkkbiiwDA8L9RnKjd/ReUarnshzihFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s5KnLJy0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b8f4c2f7fso2961645e9.1
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756717856; x=1757322656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hDxtfYjlB+z7OHUF4dwiWALUYeYYqi6hQFXH7mpSg+o=;
        b=s5KnLJy04UCvVhswMejLhz5X0YNPTIf4bzPp0kXXppzQ6/bf9B0t1zvDW8h+w4bS8g
         kepkVuRfX8VD2TclCx1hQmrpjUVHf/gUnQGQB03a/TOOxNR2yG+2bdrxNNTzdMPcfTLj
         TAE8VNde+DirPI6O4eNJdTljSXu0uZvb6l+0DG/eNYXLDr06Ax3sQole2e7I+xRx19Kk
         eOaj7tSv9AKTYZw7MpIxB0Kvcky6RzQPyOaWgMMaN39SlbrKsTA3KyOnw7uXXzKCGbdd
         aWYoFA00Xz/zmfW6agWw0PDAaqc7bv3geT20iDWQA/meHUDmw6hfi9uiO65d9AjTvTIQ
         69iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717856; x=1757322656;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDxtfYjlB+z7OHUF4dwiWALUYeYYqi6hQFXH7mpSg+o=;
        b=oOfEBSI0YzrVfayI4+EkAjvxJ7mTyHL/TjYLcnCYVPTI6E5SbAMm+wHTD7GdfBaa+H
         iqYJDxBuNtgHOGqRmGL5Wi4w//+JFV4XZ6ww3ckiv90PkBdp/i6I80fCMkByGeNoqH5b
         gp6PJIAdGzyF3aXoCW/mMDCSdxthu+L8Of1gLe0NCLvfs54qg8rOCz3HFrOqdMJFxfQZ
         hgAVYEHfoMhKUjIPhDGxY8048rxfGTdlQxMXPVjwi1DhM6753+CxmoPuVXX57/eNA4NL
         zebl7ulc9J4iN3uhsJuT7GKJikBn5GucxLnIMPcoRarXdslNU72elBgfUlgJDAmi1o9i
         dQMA==
X-Forwarded-Encrypted: i=1; AJvYcCUERTwNuHQ1rRA7ryYA5r1mzQ/wM5kIvDmVa5ia5K7HebZHd8woS/Dxm6S5QbFoThkcs8ltZC+CqMyqQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJtKMTgF/MQzzCRnt1DHm8Ww/qyorO7f0nfq8WQIVmdBqOo2T
	7sWH+tMR/i9agU00xDg7XIR135gc6J9bCUeCo9hIzYlT5FD9xPssOfIbpE1xe03i4y1uKV3zqW4
	Pna9CH/jKkA==
X-Google-Smtp-Source: AGHT+IGOfALiy9m2ZadFM7Lqo/znox4/GCfzOHB+U0RHpZwPYSarW0J3a2cBE64h5xyOJH4bR9NboaXjLbqI
X-Received: from wmbez7.prod.google.com ([2002:a05:600c:83c7:b0:459:10dd:2e55])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b9a:b0:45b:629b:dc1e
 with SMTP id 5b1f17b1804b1-45b88525cf2mr46556505e9.1.1756717855565; Mon, 01
 Sep 2025 02:10:55 -0700 (PDT)
Date: Mon,  1 Sep 2025 09:10:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250901091050.1935505-1-abarnas@google.com>
Subject: [PATCH 0/2] staging: media: atomisp: Style fixes for vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Style fixes for pci/hive/isp/css/common/host/vmem.c. First patch
triggers check issues in checkpatch.pl that are fixed in the second one.

Adrian Barna=C5=9B (2):
  staging: media: atomisp: Remove typedefs for basic types in vmem.c
  staging:media: atomisp: Whitespaces cleanup in vmem.c

 .../pci/hive_isp_css_common/host/vmem.c       | 111 ++++++------------
 1 file changed, 36 insertions(+), 75 deletions(-)

--=20
2.51.0.318.gd7df087d1a-goog


