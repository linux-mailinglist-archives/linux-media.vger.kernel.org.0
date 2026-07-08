Return-Path: <linux-media+bounces-66936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q6ILOKKYTWq72gEAu9opvQ
	(envelope-from <linux-media+bounces-66936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:24:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FF7209EE
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:24:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SopceH2I;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66936-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66936-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5AD303C418
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33D51E98EF;
	Wed,  8 Jul 2026 00:23:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE6420868
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:23:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470235; cv=none; b=fnB+CteZ/sqEhmxyMrw/odCz/s0cPn5MEY/wK5ESQz56homF9taHkrCJemlV7zIPjqac4ZU7LyGPWoPPxfTnjuqqHNHK7pzOGsiCnOollrvYYGatpEWwsXZo1/PpHw0lP+94jERsFFtr/Z4E7z1cszGK9of1sl3I6FpEkG8AdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470235; c=relaxed/simple;
	bh=eoRfq98RkwRH2TM6d1bMbq7idwXJO7+aKjiF76yNSLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgMs2DTXzZjINmvIhlP0QpDLypn058JYu08N31ARSIislOf/yoebinSLnYPx8nB9Ru7Ll3ZMCEF5aze1WAoACMp/njk6wiPXaK/7NhffUdr94bP1SZK2tUbKZwn/3ll3sWWg4GASgoej+yUVRk/6adRSBpgIuz/e2KpntVIdSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SopceH2I; arc=none smtp.client-ip=209.85.167.175
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-495ee8e807aso61202b6e.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783470233; x=1784075033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WsxiDn97gBxscvqAOQAhFMZN0dETLaVMcrmfLu6KLYQ=;
        b=SopceH2IXCPu9pD/UugOJ/WXyTWvr21cnAWqosXVzyssr8us85uHW2x7fX0fTZp5gP
         uP3TKkRMN+xHX1oKlSmThO7uJif+wb+w6llJ3/8uczL2ayrBFgXyS+3DANPiwiZRxKuM
         uWliFJ/T/Rxpm59z6oGoDX80/5CNP2zwrw18drU8YH+hWITRjEeUd/MinheuVboRXKlj
         po7+RG8FQ58S0yAxTTnJX9a1Fv1IncELxdMsNn+aiTA6/wYAgXB6wi+XPoAdD9+sTJD+
         Dxsd22ukdL8LQV1kwkEz9x6UDYDoMMSkiKo4VuKKc0fM8U3Rnare/51BXiO1rTvXBxIv
         XP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783470233; x=1784075033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsxiDn97gBxscvqAOQAhFMZN0dETLaVMcrmfLu6KLYQ=;
        b=grggp3LHyonQNSHCMYl1DL4qHUfOFyBoMQLxiasQrAc43xyq9urpkPPtxSk7/+bAfI
         tJJ/1IaKYTgTGSoI3CYIlkBDqnthfN0BhbO68noLPnOu2N4xrHGnUNUzBnvqe9+egxYz
         GLR3F9D7RCPMiCVrOsMHIe8iPKpgEpLeJyPhsQ5OOe2eJscZE5sb8OmsUZvucnttQkT7
         5rplGJ65Nf4VjTqx2ak3MRAqHakt8e5PhmS89pwO9LNewA0oCR9Sd8n69ljJMBy1Eow3
         GaovyCrdfo3+jiX8eGIKSztWTaVpMe5oKMVdQCQJOWfD8DWfO/RULBPKEttkPB6h0LKC
         yBeg==
X-Forwarded-Encrypted: i=1; AFNElJ9SfmrhJI4LjZykWBeioEEzan1Lmr4uuO4Bu0WIZjQreGPKnnkksnjW3XNsc0jJ/kSbnt3YBbDJDkBHpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/4ifZt2Qsgtoad94SFs/pec/46EPVXWcnGCRQmaA6EeFYZNq
	GrtCeauHr/qz6u5PQ0s6SyUhgmVhaAuJpVRRSozkk/aFCBy6NcjDkLff
X-Gm-Gg: AfdE7ck6sxw+WVwv8yavrLhVX0NeCjsaB6sSweiwLpsJbMPDrWwDIYPkCdq/hXAjV+D
	BU8A1297W2db+ZUbGeVjNukipwlcXv1UmHSp2Z5EbIwkgPQXTNYY/MtFezptf/zVTv7nbfzh19x
	K4/Rfv/wAZ07+Oe4000JjZAUC5vIhBIaCZMhTKemuPxWzhTacycr/7arVvMXbjfpT24UuddX+k4
	s+hPj+D/Ie11Ddh85If98JLCFwujLbgTeRYiwzzVkfUlrouiwVZeVPPZ4mcJL3qar4vYQj4Fd/k
	x/Joz5TsAoSlpL3R1VYHNH39Nu3rcwRnExL62UMZrS5gdMvBEG7HXcObtCQLCiyARszN2ykc1JI
	WLoXZSjwVfqY3i+QZTSPN/U3upZn6weBQoBsxsImusITFTwGefVAF/gl7/bJ6S8v7ug57gl1Cre
	SIY9es8kFaE+QsfYJeTZs0YUtec5cwv1Uw66dHCcVjLx2dFd2L6uRHHhySD+FXDA==
X-Received: by 2002:a05:6808:2206:b0:495:d1e6:8386 with SMTP id 5614622812f47-4a2046e9f5fmr106516b6e.21.1783470232991;
        Tue, 07 Jul 2026 17:23:52 -0700 (PDT)
Received: from andrew-victusbyhpgaminglaptop15fb2xxx ([2600:382:df05:f1ae:9ada:10e4:2561:28b3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b02e5abbsm604666b6e.15.2026.07.07.17.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:23:52 -0700 (PDT)
From: Andrew Morris <2026andrewsodyssey@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Andrew Morris <2026andrewsodyssey@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove dead code in v4l2_fmt_to_sh_fmt()
Date: Tue,  7 Jul 2026 20:23:18 -0400
Message-ID: <20260708002318.110094-1-2026andrewsodyssey@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66936-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:2026andrewsodyssey@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[2026andrewsodyssey@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2026andrewsodyssey@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 323FF7209EE

Remove a #if 0 / #endif block in v4l2_fmt_to_sh_fmt() that has been
disabled since it was added. checkpatch.pl flags #if 0 blocks and
recommends removing the enclosed dead code instead of leaving it
disabled indefinitely.

The two format cases inside the block (V4L2_PIX_FMT_JPEG and
V4L2_PIX_FMT_CUSTOM_M10MO_RAW) simply fall through to -EINVAL via
the default case now, which is the same behavior the disabled code
would have had if left unreachable. V4L2_PIX_FMT_CUSTOM_M10MO_RAW is
still handled elsewhere in this file outside of this switch, so this
does not remove any live functionality.

Signed-off-by: Andrew Morris <2026andrewsodyssey@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..9cb1e1d0d237 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1024,11 +1024,6 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
 		return IA_CSS_FRAME_FORMAT_RGBA888;
 	case V4L2_PIX_FMT_RGB565:
 		return IA_CSS_FRAME_FORMAT_RGB565;
-#if 0
-	case V4L2_PIX_FMT_JPEG:
-	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
-		return IA_CSS_FRAME_FORMAT_BINARY_8;
-#endif
 	case V4L2_PIX_FMT_SBGGR16:
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
-- 
2.53.0


