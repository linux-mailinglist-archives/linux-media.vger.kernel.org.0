Return-Path: <linux-media+bounces-22259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E05209DBD1A
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 414D6B21A2E
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287381C4604;
	Thu, 28 Nov 2024 20:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K3jI/5hp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131391C3041
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732827261; cv=none; b=mkFkkRRpGhhHd/0YrL24tT5w+A/AiIGaMlxXHBUeXFB5GNUqhMZpmiIMPLDxBsIQJb1Zb5lfrV//nnCwBnz/s2LQAjTCgF/dTkoDZi1cmoVyz+y9I4eWMF1RDWln+6AVrcgKSR73jQQx2sZjTp3IF632BPGqn+t9LEbqLKsafSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732827261; c=relaxed/simple;
	bh=FHu7xsPNIFx5yEIyoPkkng/BvphDpd2Y2mvhSZv97MM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ytfl84YyDeRR1WPbs+nH66vxgWNscaAnn+Z4J5L0j8uzUwxI+1AsrtGUwXE6e9gQotszQxbXwvsn0A8qVAyEGiaksKiU8jTNLGOzN9OXy9CTKZVgtCLlMWPzAB+BfRFw9ObzijdVpA/baCjSKzoI/w8zzF7o45VzKAjE2+qdLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K3jI/5hp; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4668d7d40f2so9428371cf.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732827257; x=1733432057; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1xCF7LNbFLYTpKldHQ+hspxekaIZZtHO9TlcY3bVcA=;
        b=K3jI/5hpU0eBHytKNPRLKOIQEYQDHAkJXq8JoWQrRuYhc0ou3265l50EveClD8Rkuu
         9uQnvu8TY3qEArqzn/BzHOEa404vJQG0JpTGIY0byHghb+DfUqnqexydybySPls5MTpX
         eJP+bm6j5l7GRyiOt2wqzveArGeUvkPHaIExc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732827257; x=1733432057;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1xCF7LNbFLYTpKldHQ+hspxekaIZZtHO9TlcY3bVcA=;
        b=m33E3cxC9FE6M2fYRC7KIu/MMAbVyEchGxj/YPDRKKJLAMU45UPXdJh/HC4qQ74X+o
         TSDnYoNA+/frMxHCntu4UZcf3ZKun07haP/IV03kaUCEg/Wf5VJPOXT06a4T4gLK59dI
         pbX9v08jRfMCjnZzbLA3cFBZmofQuk3ROU05wDZFOjz5EntON60KtGj2EqH636fWS3C1
         1TF+tL6YrMY0hNFWM9T0KWx7xrnFD94b2oWt565g5TynVbZnUUpFqtPqxiKH9UoPgxL9
         qhxXZI/4vM/89ufCq81Prfq3P5NIn/z+gkw7HRvSYZjRqiASBfWPimPbzOnx6Q8WVOFw
         Z72g==
X-Gm-Message-State: AOJu0YxOzldNia2vxlsqv9+m3Y4VD4Om3BaYJDEDSFYsvTqf8VQGOOpv
	wND6XaAhFVu39rEkcQxfXx0BeUVVYON0yyWssWPSXLI9WRDQ7ffejJ+F2/Vi+A==
X-Gm-Gg: ASbGncsy3Rddl5D8iq3cSDnoA1MFZ8f+TymwWyoItW4qzZCRyeqFsmYMGqVeix+lzxC
	WZ8VmR3+RaGVJ1o6hFKMV+IXGpCkqGoJDZVco+R+P11mJhd8SDYOww8HJzD7Ah7Mkj08FywBed1
	AZGUzuGI5CMkq1LN7okM/0+o9CCxtfZ2vmknsj3g2R1iwTMTAL2H4uu/GL01NMuX0rzhjBkJlHl
	CnBxldUaKXbFza/Vve0sXEsZtERWxhMzuEiR08IlW0/OMGzwY5oQUI3w1Zh9YsiYjAFYPrmHXau
	7LKXtPPNuLrfGtVb3MU+w5mI
X-Google-Smtp-Source: AGHT+IHRpN6NATAmbciIyy05yWURRecQ9xopikH3OnMGV1553UEz0YTGxwbOrQhhCSSQmgCEPnswmQ==
X-Received: by 2002:a05:622a:180e:b0:466:a308:292c with SMTP id d75a77b69052e-466b359e2cbmr127726571cf.32.1732827257019;
        Thu, 28 Nov 2024 12:54:17 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466c407e6acsm9923421cf.52.2024.11.28.12.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 12:54:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/2] media: uvcvideo: Support partial control reads and
 minor changes
Date: Thu, 28 Nov 2024 20:53:40 +0000
Message-Id: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTYSGcC/33NQQrCMBCF4atI1kYmyVRbV95DXKSZqQ2olUSDI
 r27aTdKqS7fwPfPS0QOnqPYLl4icPLRd5c8iuVCuNZejiw95S00aFQApbwnJwNbOnGMUpumqkt
 nCWojMrkGbvxjzO0Pebc+3rrwHOtJDdcfoaQkSEBtHRalahB3rg3d2d/Pqy4cxdBK+p/Xo6eKC
 mWZi/WMNx+v1NSb7KnaOGUNlEgw4/HLa5h4zB7XG001N4Zw+r/v+zfYVY0OawEAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Some cameras do not return all the bytes requested from a control
if it can fit in less bytes. Eg: returning 0xab instead of 0x00ab.
Support these devices.

Also, now that we are at it, improve uvc_query_ctrl() logging.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5:
- Improve comment.
- Link to v4: https://lore.kernel.org/r/20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org

Changes in v4:
- Improve comment.
- Keep old likely(ret == size)
- Link to v3: https://lore.kernel.org/r/20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org

Changes in v3:
- Improve documentation.
- Do not change return sequence.
- Use dev_ratelimit and dev_warn_once
- Link to v2: https://lore.kernel.org/r/20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org

Changes in v2:
- Rewrite error handling (Thanks Sakari)
- Discard 2/3. It is not needed after rewriting the error handling.
- Link to v1: https://lore.kernel.org/r/20241008-uvc-readless-v1-0-042ac4581f44@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Support partial control reads
      media: uvcvideo: Add more logging to uvc_query_ctrl()

 drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241008-uvc-readless-23f9b8cad0b3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


