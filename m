Return-Path: <linux-media+bounces-60931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOWGApIM/mm2mQAAu9opvQ
	(envelope-from <linux-media+bounces-60931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:17:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BC4F94F9
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6847300809D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 16:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FD037DEAF;
	Fri,  8 May 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PflXPhw4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A7351C09
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257033; cv=none; b=bKKWWppg6anOdsFvX86/7OKi1MSZ6Yr+qODwNnyg6oqEWyexKZDOuAv4q0uiJAe+nhOXp9pf5RXQy3ji8pMLFTZKhYJz76GSNWRq7jbykQiL6Kazr9LTLUJDQmp78kKaJBhgoa/aQ+eXVnGcEmZ+9E8G3vo20ZGxdXttzRtoxV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257033; c=relaxed/simple;
	bh=a2/iVMjW+vZHe02Y/Zy/BS8miYOFJ/XZDHc3xm5Anzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f2UTP/yXlj6o08pk+D6YTwWEYBeTCH4NjC0lY/3FxZ7Z8im4HjafD/zyvc4LqSR8++WyGmvy20SL5hMDmCipF6PNPmeTDB2w8sGmk3+R8QN9Z3ae+O2oQQxNCY0iXo0MRJ+iSZ2jbl1nBqPcoin3Tvp3d98PgIhPcQjmkuV0IyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PflXPhw4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1770854f8f.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257031; x=1778861831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=;
        b=PflXPhw43aGBOH29hl+Va7RmIhgHKlkA7rigvJ9c91JIgKBHugrR/aQr2mDcICgP5L
         lDudeuxj7J20yZovRUrFfomOG4Bp+5FNvMq/aWKuZ3U+3X2jG1q/ClzZwukuQ1eylPYA
         vU+sXK/MNn+RzHRqglpX1hzzycgBRhMuRt8eaVGyQhygLYOAohhMwJxyJo4AOZqH8YVl
         lfHkSTjvKxbEcWoeDhqsQLWBHEGV/kjJoUgvQ0VWaEqgYZBu5HxuD3nkT09ewkHFeCNf
         7vK4KE2eV2PXKi78c1mXPTwxvlwbuaBfH93S9+oOrV+fe4YVAns8AT3hHK1o45rbmKBA
         VkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257031; x=1778861831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=;
        b=DkGnKETGoeWQ6NoJlpuV/5r4M2OiMjx65uHZHvMMxDF3Qo812Vb0ObFgx3LTf4s/hL
         P2GaCUmt0Sax89adqUc9d7MtOvRy+QuUTr4gQqGJ1ozSrhef8qflxebw6L1jIIMG+OtX
         p0ZfHZ4yfg2x1r7HOw41eUAIiTXVqW9Yvvz4OhavwCIGoUBGPq51MAEETv7/I4DhWIA4
         3RPQlGtFgUdeATfekjal68YGRIxZM/vWv7+E6CJW/kNc8tFbB8LMvrQYvP9ne9P654fT
         jFnp9QJnch+PRqBD5aOovZnWDM3MpS74m+6bYw3A4/UytXwnkRi5/n404L68mhq+NdtS
         74YQ==
X-Gm-Message-State: AOJu0Yyn+EgDaIxFWCXfefFazzEPJMf0GU0XBFslKb6i3rc243T6KXh4
	QGiSPu3qPayMfsLEKxbT9buFdIupigHLV/UWb9SQf0U18DppwRf9LhzB
X-Gm-Gg: Acq92OGHXtxqO/7fBPRRyivzUQU5kO1QaBhos0xVfeVTSh14wvddvLtgx4MAZSbSpwV
	PdO3ZONOGRNqR/3bbQEuRD+7IgITKxRygLHWBH0BfEo3x0Jbx7VS1gKlQ5eQ6Wjf2j9SUuQnCdR
	IvGqgZ9/JWZMlCR3nrWyZH1pJGtrPh8EA7aPb6mAAm7W2pYtao9QPlGMMN0VP7QMaD3i4E0eV3u
	G4IECfbZsVffozhVc9pTOUFiO2RUVlvHczjuMZ/C3p6sVZDn8HT/KX0ClvXovFNj269899lUsba
	SRwHMB6pmkIlZhUwg03d6C/1ixiExOUumX9MiA/aHfoP8Mku8iZb0TTVqEwrOQP2q4arBfWeCyR
	4GFNEBKYXYtb8DwHA3rB+DM/JW8VP6KSj6BgkjA824j+2jIMNBzkmBvBJdw8Pn3VOJTr2DyaqSG
	MXoeOLv9XUt5rNcx7J0AHtGwpZTijydus1D5relhP5rRz+GUshRBy2KVQd0225yIMwXjSu90tCD
	+e+MspNF96z5RPuYxE3
X-Received: by 2002:a05:6000:4210:b0:43d:73de:abd2 with SMTP id ffacd0b85a97d-4515ce1c4demr20464240f8f.26.1778257028011;
        Fri, 08 May 2026 09:17:08 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491e94c0fsm5500124f8f.32.2026.05.08.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:07 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Fri,  8 May 2026 19:47:18 +0330
Message-Id: <20260508161721.94285-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 003BC4F94F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60931-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

The final patch adds MC-centric format enumeration support by filtering
pixel formats based on the provided mbus code and advertises
V4L2_CAP_IO_MC to reflect the intended usage within a media graph.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768


Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  88 ++++++++--
 3 files changed, 143 insertions(+), 108 deletions(-)

-- 
2.34.1


