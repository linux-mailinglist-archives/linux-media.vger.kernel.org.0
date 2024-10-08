Return-Path: <linux-media+bounces-19202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B999404D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 007281F22456
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5851F9434;
	Tue,  8 Oct 2024 07:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BaGPzpUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7699157E9F
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371179; cv=none; b=XYhC7417CuF2dsARKjnjjfGDhXtxd7Xh3so5rPZmfTcPxZBo2dxwrOckMRjBswsZswW29yCaGUD31l2vBA6eSH5KIsJ9z3L6db0NfnwPDJsi7Apx2Z6ge3QcAcv0JQtJ6E2FuFc+p0uz1wz43WZPa4Iv9wSCQxlH1Vd47D0flGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371179; c=relaxed/simple;
	bh=H+geuf57kVocWSPbWf92D4pkiMUajwoEqTqIsmSA53c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RjhdWRrMs5mw9Md8/ukrs1KWMr6UIj4S4QHKH1SxheX0MsY1eetU3+YsyMY8iaCFfp8SQOJ0ETb+y5EQcLDGdrPlBXJ5culo1fKoVE/s7nwitVv7gK1DkoeAUsAm6ioozgtYA77v1czmaOHKi34llVM8JOTzBQ8lRgUcajQIKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BaGPzpUi; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4581e7f31eeso46436521cf.0
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728371177; x=1728975977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TsZBFSwMT7x1FLd0qN3fP1nAhawS9beuZBZhTUuWxl0=;
        b=BaGPzpUi/oIMI4+Qs213dlM0XfqbzPknBBk6MFB97qvb064Y8RM8p7oe2bnjcgiJg9
         kdjPRTkXGYavnfTdy3f/Ok8KsbQtv5ZP+3m8pk5q0BrMXjns6stRitjvSNhq7+aSk/Sy
         cJIE8RwXsOJNxaBwJbQTbt/4PAEiWRnroPLZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728371177; x=1728975977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsZBFSwMT7x1FLd0qN3fP1nAhawS9beuZBZhTUuWxl0=;
        b=QNBD7ZlAc/Xrf5CbFTBFyK4/H1cQ7c3sjxV6ZDrXRYjfxrrOCbIupv5W/FeDtFpwFx
         EZXKIobRhx30Ob6ncxWTgEdPBdYO/o9NQP7BQRsqxikeIK+CL4qp8UbWNBZZCUp0wdbC
         xKxcgjZF6aTLD+kkSx0h4peiqiqu5zIf7sbHO/tyYpnNVRzOwhvVfAXARGTU+O0PFTqw
         09Eyd/F9KGpJObZVgjxdp14wscR9AwmCm9DtoK+ekjGug5o8d0+/uLV7MWpLcHvEOeX9
         eY1zpKOeLBKYg8pMD2Cj/pILEDwu3Z+Cr+VVVq4+wnO381EliGV/BZfroYVhcNrx2nKN
         RceA==
X-Gm-Message-State: AOJu0YyZBHZAwBsyhCKRDawDSg++/x+6+gBBr6YueXK1mQ7TiZvf/kwM
	L4RO7ZJwGWTogqI25olmL2FWUd52lu25LwPL826IjYqjJgdDmBcV8CxDQiLPZw==
X-Google-Smtp-Source: AGHT+IHx9p9tIVNfNz7+zbY6K/yGm0H8IQgkQooFDPYNa5377HZYiurQcINypBPsFkW86cXRYwoTvg==
X-Received: by 2002:a05:622a:124e:b0:458:3cb6:13cb with SMTP id d75a77b69052e-45d9bb47d37mr245733751cf.56.1728371176699;
        Tue, 08 Oct 2024 00:06:16 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da764043esm33801921cf.88.2024.10.08.00.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:06:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Support partial control reads and
 minor changes
Date: Tue, 08 Oct 2024 07:06:13 +0000
Message-Id: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOXZBGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwML3dKyZN2i1MSUnNTiYl0j4zTLJIvkxBSDJGMloJaCotS0zAqwcdG
 xtbUA3vPO/l4AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Some cameras do not return all the bytes requested from a control
if it can fit in less bytes. Eg: returning 0xab instead of 0x00ab.
Support these devices.

Also, now that we are at it, improve uvc_query_ctrl().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Support partial control reads
      media: uvcvideo: Refactor uvc_query_ctrl
      media: uvcvideo: Add more logging to uvc_query_ctrl_error()

 drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241008-uvc-readless-23f9b8cad0b3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


