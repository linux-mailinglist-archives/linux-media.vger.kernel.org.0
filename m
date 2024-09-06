Return-Path: <linux-media+bounces-17812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ADF96FA02
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F11F1F230E7
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868CA1D5886;
	Fri,  6 Sep 2024 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1MLBGe6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC44779F;
	Fri,  6 Sep 2024 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725644428; cv=none; b=m0TXH5CCaQ/2Kf6PzUgEnXrbnX72/oouq0ngY6UEpQelWROi9HgU9oq53GM1bfqJQ9bpreYLfccqIlO6ILU2OKIFWsBAjdPWB2JRd2hSL7eIUUZM8TUd18ZbPjNGe1sCO+TiDLZeHfBQJsLx3BW3kYu5Z2VGlIS8Ng9QZuwSs9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725644428; c=relaxed/simple;
	bh=IiTAB6xfx9bsXjbOUsk3gbKBwIaGEnan7AXMOnUgGkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cRktpvhGrkk4n8p0v7AyDEaoP3RcOyTgbfM8F5T3beSNWWQSnpT02NU/trzhLEwWIMyyLxvETWGm/twhLdWhUqoAb+nEHxRRgLzxYSqdcEIVmT2t0BSYhPH/pjRVPsPj67h5yRT0F0n/RDFc/R3TsBnldrIF8Agk+3x3x1j+Fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1MLBGe6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f753375394so9545661fa.0;
        Fri, 06 Sep 2024 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644424; x=1726249224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULcvTtaSNp0+zPsPH7VRabOqaJAJHQ9QsmMxPt222tI=;
        b=E1MLBGe6UE2GlbxpY2KeBsPveQExc0Wy+ss7jWx7LZKghLqFNuP5sIPip8qxmsSo1S
         ZnsmWwP2oXhkvEGUlR6KayoUHiEemLeqGBHsHKLKVPlk2ZXjXyzSRAlmTnY8ipXkHtGY
         o4/WqCmeP0MY0HUKTjkuze/90L0LrnwvnbrlaZzu7Seqe34ycolo8B8xdITD1mRuHjiC
         hAiUBtzwVkrg9Sl99ILi7Fxz0DLoZD1mdIeYlvrxAx7J8SV13rSpY9llhbVF2fbEi8Vm
         B+vDKrdLO4Wh8DgCS/aJbf7TbSX238PVgSu6fEzJeSjm1kdNE8Pqkf+2btge4zf/XG+5
         VtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644424; x=1726249224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULcvTtaSNp0+zPsPH7VRabOqaJAJHQ9QsmMxPt222tI=;
        b=RkJ5P9xNhK9V2HbG1HfUNvqlKLQJXM1b7LOun1QM52AueTn/t5o/HdDcj2dIiIZWZ+
         g/3Q6XayyQTDtY9yXSzD8evdGkh/vbi23RRspqb1NqlRqsLzl4X7TIcNe5LXgpyLu5YL
         9bYcvtAY3VfxajhGYjnA1fdYUMPhfDvzA5aHR8X4dojdDVv5a7fiA9nRbD8GP0kI6Hfi
         /v1yqbqVPZXlt+iLN7+Jx9VZcAJ010HgzNylUtjyBTtjv5QBiClbgm2WuNDG0bGy8KZ3
         k4q8HRwMV5zs1cGPODX3zOcJ87tDPsXx9TlayGLFCTRSikwhThVBcAyQZWFgOV9N+keF
         51YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW45p0ZCsDiKadv546fGGmrbwKKw6f9JZiEreRx3UgW0FU/dAxRcwSlCW1PV9Z3h+B5EdRWApEUmuuNbRIXevW5p8=@vger.kernel.org, AJvYcCWdoj0VvGu1XFLfRD5Q+lX5OwFxW1oUUwaQDd/25A2oy4roWzibOk73nZahVLDaYKkl+x48NgzJ9moTpu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoEuc7fkntYWIKO5VtF35WoO662MWSO2VOa4Q7Dgc4B3Vb4t+0
	WeSewHkV+eKowSZgpy76dQbenB7z5w69EOcWzo3eXsQ/Qu4Lzy1OQeuJZJOEb2Q=
X-Google-Smtp-Source: AGHT+IFLnIwO/NoQWmmzN5/ZOkoTLmJLZGTETdR/8T/XsO9mOmF5pDE6LLkynMgQ8OmBVj6cMfQ5kg==
X-Received: by 2002:a2e:868d:0:b0:2f7:4df2:6a13 with SMTP id 38308e7fff4ca-2f751f33229mr20310471fa.25.1725644423932;
        Fri, 06 Sep 2024 10:40:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697fedsm2623557a12.64.2024.09.06.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:40:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] media: platform: rzg2l-cru: CSI-2 and CRU enhancements 
Date: Fri,  6 Sep 2024 18:39:44 +0100
Message-Id: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add the below:
- Retrieve virtual channel from remote subdev
- Support to capture 8bit Bayer formats.

Cheers,
Prabhakar

Lad Prabhakar (3):
  media: platform: rzg2l-cru: rzg2l-csi2: Implement .get_frame_desc()
  media: platform: rzg2l-cru: rzg2l-video: Retrieve virtual channel
    information
  media: platform: rzg2l-cru: Add support to capture 8bit raw sRGB

 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 19 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  9 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 80 +++++++++++++++++--
 4 files changed, 102 insertions(+), 11 deletions(-)

-- 
2.34.1


