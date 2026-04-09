Return-Path: <linux-media+bounces-58311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCluEG5Z12lqMwgAu9opvQ
	(envelope-from <linux-media+bounces-58311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:46:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC103C7385
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F19030597B0
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B9D37A498;
	Thu,  9 Apr 2026 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="kgDlSdY1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CAE37F735
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720664; cv=none; b=T2DCTMp63GgnAFtBBdiSftnkDzCwP6krk+TAbxa3tGiGVl9Ov5/hGg0iuMS39SUZXa7V0VGkKymgmlaygtXPBQ9lAGiZ8JfR6Qb3lkKDG776SXAcr6fH2lAOxUrKEYNx4qnw3/SrS3Y05hkTd3rFkMrk53CaQFOV6MgKP0bHbSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720664; c=relaxed/simple;
	bh=UceDUxbj39VIyLOljIKZQz5Zivv141yWASgZkCD7G34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZilVD85pi29LUAJ1mo2bVxBFJTRZQ3XqjcYSjWDQ2eNqmt3dWQHCRU9BIGnDZQHgr6XQx+4v8jMDczsTa2dzIVh/9pACMNCWqGOsy6unCeM/lsBbBBJqguJhFhO1ifadEqMAJ7QkL2aqN/XMXxxkRhJuPoAjVdU9EQfNwuCd4Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=kgDlSdY1; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so395724eec.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775720661; x=1776325461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELuTqBhnkDSZI0fi8C1chvAelXix4ySX6h2QqrIkrPo=;
        b=kgDlSdY1mP/R6rTkfzLmgwiEvFM+nSFzxJTm3w7tU2Av2wrfQQWJCw1GjvDHCyxu1y
         YjivBdB5bpEjE2FvEnw1qJUskbaaK3Q8NtbLTP856wXYMNbPgfiJdyg376jEU1avwyIF
         6Z+9mdPUq3Aye4eFMuwCzZ6ttT/KbTRj0ar24Jug5CNF9v8ccSQ63HGvekSJ5g5r1BwS
         bMNTUBibBhgQuCMFCaELHcUyW+3Szsc6LW2qMtMGdeLZB6Z6O9ARrNamd5Wv9gIgfGPM
         PV1Y3YbA1Yw5SMRVdqhANvxe91c6or0m9wqVXnvLbOyxcYU3Ml7E+5CoHntHdw+NEwQA
         IBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720661; x=1776325461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELuTqBhnkDSZI0fi8C1chvAelXix4ySX6h2QqrIkrPo=;
        b=m4k1Q5RpsDqcNFvCMvprmgXpJxCzHfjUZ7PYQU3Qp19HJtAb33iFTqaxWtOLYzPZNO
         ZERSONy7EiDegqkX11/ADeeTsVP8WU6FAD8KJR5x1fytGxGWoIgrbLa7mHzDvJeihoY5
         wqkmpVxKqddOnp7WgcIHgBRiDXwJoFZWcNlKGPW9DK6fP3HR3GMUBHtyaHSVyp43nAv5
         Gv6xcSMO1fzy4sK6ANP2fbMEcPYj3cBSkzDY38nmIRcxSqjeQYSWAXXJlB0v6vP8d8OL
         kp/OzXvvmJRkbjqWowjcgN4aGpiQ7Qyhe56eO/Lm6vIAQd1Q0ULJ8q0NTwjkhep1pfYt
         zz5g==
X-Gm-Message-State: AOJu0YzmSXkiUxM0Yz8tZocRntqW6bJete3aZZARkMOft+47HtbFKIze
	4hsWnR8Tdpf4QyfwsZGMT9YEXLyhKTbK84f3WmQNcDSaVD8b5FGBzdrVLBu3vqFl5Q==
X-Gm-Gg: AeBDieuGWfzzFv3ZJL7MA/tQPvFL+Q8QIbnHujF1FhNLAl4bwRjuI5xdW5b4e48Y5yd
	NhD+8bhEvDXiOey7VIJ/KoraQjgJk50IaXlfWRDD89plxWEPf02TtoKKIMFh23dmFyMCao0MQa0
	nJurKWjbQLSybgw0THDQ7j1DR/wshObF34oDGa0nVCTXR3p+hHrOwsCFpjITTU9V41wBswU9/ru
	3mobR6aD2EaGXQN9wKJmUOn21V2gzFxSqslMZQVITKe9SI2TpUk9hupePdhrcbGPmmcI1jVTRN/
	rXCiF3lKs0G+T/N3YDJYaCtz02hA7XXffeIVXyjt1BBXF/zQ7yghn0Zt37lMPcV6HNI8lKSeaMj
	7i813iXNy4az+eQF7/HXVExcgP+NUwtbI+TvWnjy/CMvM74fvM73kAe24iD0cDf4JN2iOU7u/ee
	sloEpgpCWSEr9cc7yweTPXbVjHCpnMruAKY81DAQ==
X-Received: by 2002:a05:7022:4585:b0:128:ce44:be90 with SMTP id a92af1059eb24-12bfb75c3c4mr11867062c88.28.1775720660987;
        Thu, 09 Apr 2026 00:44:20 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bf90973b6sm25154047c88.9.2026.04.09.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:44:20 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v6 0/2] media: uvcvideo: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Thu,  9 Apr 2026 00:42:40 -0700
Message-ID: <20260409074242.2115657-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331003806.212565-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58311-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:mid]
X-Rspamd-Queue-Id: DBC103C7385
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
well-documented failure mode that cascades into complete xHCI host
controller death, disconnecting every USB device on the bus -- including
keyboards and mice, requiring a hard reboot.

The device has two crash triggers:

  1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
     reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
     stalled endpoint triggers an xHCI stop-endpoint timeout, and the
     kernel declares the host controller dead.

  2. Rapid control transfers: sustained rapid UVC control operations
     (hundreds over several seconds) overwhelm the firmware. The error-code
     query (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
     failure by sending a second transfer to the already-stalling device,
     pushing it into a full lockup and xHCI controller death.

Patch 1 of the original 3-patch series (USB_QUIRK_NO_LPM for 1532:0e05)
has been merged by Greg Kroah-Hartman and backported to stable kernels
6.1, 6.6, 6.12, 6.18, and 6.19.

This v6 series covers the remaining two UVC patches:

Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  all USB control transfers (50ms minimum interval) in __uvc_query_ctrl()
  and skip the error-code query after EPIPE errors on affected devices.

Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME.

Changes since v5:
  - Moved throttle from uvc_query_ctrl() to __uvc_query_ctrl() so
    all callers are covered, including uvc_set_video_ctrl() which
    bypasses the higher-level function (Ricardo Ribalda)
  - Throttle now applies to all query types, not just SET_CUR -- the
    firmware doesn't distinguish between query directions under load
    (Ricardo Ribalda)
  - Added lsusb -v Device Descriptor to patch 2/2 commit message
    (Ricardo Ribalda)
  - Bug reproduced on two separate Kiyo Pro units, confirming not
    unit-specific

Changes since v4:
  - Dropped stable CC (new quirks, not regression fixes)
  - Updated cover letter with 6.17 test results

Changes since v3:
  - Regenerated patches against media-committers next branch to fix
    context mismatch (v3 was based on Ubuntu 6.8 source)

Tested on:
  - Kernel: 6.17.0-20-generic (Ubuntu 24.04 HWE) and 6.8.0-106-generic
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Two Razer Kiyo Pro units (1532:0e05), firmware 1.5.0.1

Stress test, crash evidence, and debug logs:
  https://github.com/jphein/kiyo-xhci-fix

JP Hein (2):
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
  media: uvcvideo: add Razer Kiyo Pro to device info table

 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 30 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 3 files changed, 49 insertions(+)

-- 
2.43.0


