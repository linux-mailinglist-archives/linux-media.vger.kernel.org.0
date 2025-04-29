Return-Path: <linux-media+bounces-31270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F297AA06CA
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA642189ABEA
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34A22BCF50;
	Tue, 29 Apr 2025 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjZfTiv7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976A11F561D;
	Tue, 29 Apr 2025 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918190; cv=none; b=f/k0CqG2WsL29dMlSpYbFTRmoeKobQdLiZJK0PhIj6CM1X/yWpJUwHEBwh67TnnilF5yQT6gszMVtbMIYVXHWjlaE3b1ncTkQDnPI0FQmW8evPFmT5enG879rwyJ100embAQ9Z5hKGbsDX/ZS8T6scdxfPeWvDLxof38KPCeOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918190; c=relaxed/simple;
	bh=PNvnDA+kQv2cAVv4PxwaxmPNt0t1F86SirpTuqe8+ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwMDvzXWC7DT+e1utrZPB/Uj+JzKzhQYwCjTaAXugy9HHFhSggGwfZhltJzGhi0NJWlqEBab8zxFLSWOtmqVeiuzGcBc4yv8nzr1ZN4pG1Wm1A+GisqPMYG1mcQwUzzHDdNqUeBIX3euxEqmZ1OlxWzyFyR1ZQMmVIEcdpWftZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjZfTiv7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so21951585e9.1;
        Tue, 29 Apr 2025 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918187; x=1746522987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LoVmOWvsLCeGU5pFJIa8QzLV7wPhfk5VANXQOKrkKPY=;
        b=CjZfTiv7fKbarx+NQhMlMgWftVAx4Rm1leFRWUU9/2ewU1F2Lge971IqitX0HCISE6
         4wDVA4AnRSoB84HYX+CDdchjR7Jr3NwdCzf8umsnlKSKG8lvzKrjKSZPAPvhuIrIgNKf
         JYtlt+gxCdDafuyOltrk9VR9v1KsPjXM/trBHFY1267ts6mnFMdzoBfV1jldWCeuwTHV
         CgBk2nyxtaPVJ7JVovZ2TvBdfztGmPqy4NNW+GUQeNYECIDqvacRJFxE1QcTkvO1MpXd
         ID+QFWE8xD8ntChNDWmLTSNMyadSOLi/QkTkbdpeghCwCjWwJjX624f2zwvyODLXJvsl
         Ry1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918187; x=1746522987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoVmOWvsLCeGU5pFJIa8QzLV7wPhfk5VANXQOKrkKPY=;
        b=I3w65fwQ7dIGG+tLjwpbOLH/Tk6t9bxWb3vlCvk30BrIA7gb0gqRl8eAjh4pA/h5t/
         C/nJX5RvzldnaDc33ZabK14Ri9yhY5amOMZFdF9SOt5lJOoxs1ot/2OKGEHU9t5LL6Cy
         jmLlLf4vwcLmisVEDhp+jZPx9LK8jZEbHHX/MtzvLq62+FNqUC0ddlz/FFlGt2aW7+vh
         Fsq0G4A55agRhEL0b3jSyQdZYWReGd5RAyPoeAXll8unwu5OYbgcavjLlbIs4UpYyug4
         QMt3yqoqjzTVhOgulMEFdaf1TBX667WNLIQl7L0cQHXxa5h0ONUHgZT7+r5VtVvBBz1E
         7KkA==
X-Forwarded-Encrypted: i=1; AJvYcCUPWzVkU96FaBKsPO9u+00MUf8fuoUNfBKvzRJrE/8Hxsow8C5KeliXvcfz+o0e4GYB68VbJ1PCKxj6b10=@vger.kernel.org, AJvYcCVr/y4nHl5p9VD7LvLmFi22LTeRsQIKAsZaNi0XvxiObQCtUJaIwTOqAzKQKGMEo8x54520zGuNTjvwRpjiW6dsqR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymoA5akPHpNRT39kNH7JiRJkMmrajNKc8YVVSaSIV/rei4N7At
	7R+kt/HaANdCHociVTxW3bCgLubdmYrsu/Ae/2hvyLgGHIrevDFU
X-Gm-Gg: ASbGncsaZtJUtFx7yJONbn141dc9mOCgttchKhxuhWV0fzuhyd7NR2+78gKlsJa5EBg
	muNdBjPjL6Hi2+riPA+CcMHBRbThb/q8d61S16SiOun5VoYJSBOMg6jpJojo0OxKOdek8//DQZZ
	mKkIfyhjRa7S6fJv8JOW0Az6D9AKHyrLEAf58GVju4eievZYexHyVFezUi7hu5Ul30MiClXz/l+
	+ZbnHsyRhGYyLJ5OAWeMLN4cS3ITyumOGq9CGHVU8AyqjrtrRxZLnwkcM3x94nYH2CoMZ23ip+L
	kUanGAzROHgh6ZxCC4GLf3kAz55ziKjnSkcEPxEfnVHxAd+Jz2atjU66i87neSIFHA==
X-Google-Smtp-Source: AGHT+IEpVMLZ0E3pZjyT1QJIihnmh9OB/65OBU7pY3YDPjN6d9SKil9jBL1Fivqb6uND288cg+lO1w==
X-Received: by 2002:a05:600c:b9b:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-440ab782a91mr121234825e9.3.1745918186626;
        Tue, 29 Apr 2025 02:16:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2ea7:2f5b:5fec:29c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1ddsm151103945e9.30.2025.04.29.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:16:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] media: renesas: rzg2l-cru: Fix FIFO empty check and typo
Date: Tue, 29 Apr 2025 10:16:07 +0100
Message-ID: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series addresses two minor issues in the rzg2l-cru driver:
1. Simplifies the FIFO empty check by collapsing the redundant `if`
   statement into a single return statement, improving readability
   without changing behavior.
2. Fixes a typo in the function name `rzg3e_fifo_empty` to `rzg2l_fifo_empty`.

v1->v2:
- The commit message for the first patch has been updated to clarify the
  changes made.
- Patch 2/2 is new

v1:
https://lore.kernel.org/all/20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: renesas: rzg2l-cru: Simplify FIFO empty check
  media: renesas: rzg2l-cru: Fix typo in rzg3e_fifo_empty name

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.49.0


