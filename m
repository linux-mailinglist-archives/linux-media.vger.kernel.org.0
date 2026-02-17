Return-Path: <linux-media+bounces-52950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFpTK5ANlGn4/QEAu9opvQ
	(envelope-from <linux-media+bounces-52950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:41:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4C149099
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BB9F3004070
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 06:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316B92BDC3F;
	Tue, 17 Feb 2026 06:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADOIFtIP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B823A98E
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310472; cv=none; b=cTfdaEq4tnBncFzpjcVHdlzkAnX5cg+nfZFnHpKR8vyYCMG+G7gVdNibzPWYWWefAUyFcc6aiI+X1gQMqQLt3dX3xAUz0LUC3Q4C2z5P6TIh4BWJ8DsMMEAWoksypxReMQnn3b6XSBnQh4DgkE0h5KQKv5MuanNVacH5l/83z0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310472; c=relaxed/simple;
	bh=+NcFpiiW0wzV8DHCMGsp2NSC6RD3WjX56RkaBkhfEgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JcL44xQEHBxfUj5iy8ak7Uqs0gA7vnF+iUhqK+HTtgJlgVJup2vCDaI7SNEh66aaN0y0SeKz+mY3xAi0XGhCS30LAlbabZcfUSzMso1JdPRweFp/HWDbo9/7W4lhII9CL2ogD2bYsZ6Hj6XJlTtOYi3DGANqBA7QBdLz1XDkw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADOIFtIP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48336a6e932so22870635e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 22:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310470; x=1771915270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FepBOuU1DcO7xNko/hlN7H/0LgDQ38swQHDFFclf8T0=;
        b=ADOIFtIPqqM2ZurZTk6XOw1aq2Kl/x7OAZaW9qppaP2t3aPLSnooU/MliGlgc6ChZP
         pYYcQYVZ/Ex3I20XveU3Pg8CcA9SR3h7ZJLK51gBCffc5Hu1zfchZSCXFaQc3sK+63wW
         73Pw4iSlYmZC3svyza3ngHw4qjGKvlHxQTWH80XVYXyWMWX692kL5Zz72elOoDUkG26d
         lTTo7XYTTHXmFO7yTQvjdVOuTwEdanxRXi0MV7LbXw7AWa3thk8iH0Lr1wKlunJvFnVE
         sMPdHHwDym8ajfhAQjzk4+WfEF/0YFW740pnJw1I5u2SKiFnecpbkJV87vuwt6CHpQzL
         x8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310470; x=1771915270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FepBOuU1DcO7xNko/hlN7H/0LgDQ38swQHDFFclf8T0=;
        b=wUya/JfDNMZQwfQpV2nOVxS4GdF29mpHZJVX6d35P3R8qhfctVJ6o+PYHiDtvbtuqF
         sFlpyjO+eiCnErgKfS4HOuCXV8utJ9d6Z439WlrdmFqu+47o6SKPMxxvP1e6+d/u9nxJ
         T8ZlRk+qCefHLcZjw1a79BQ9x/rJC0HGolEOsLK0pgiaHyafU8lFJ2eb9586bqeH6/iR
         ftBCy9qjFfwmapEZTDHPXUDEwJvuKYGMq3D8omQtSltuF1FzM2f8M9q5S4dhZeGdASue
         qDenhX/Y8AXnWASDEU+lFHdcmKYAJU4XNYTEc5g2RJduhXupySLfjpUzF3JO55bTRVFg
         35Ew==
X-Gm-Message-State: AOJu0YwHdsUsu4CMq2egWggldqvO3RULwsWbC/JonBn+ytxWIHoVKuTT
	/4veh+6SgVWsyocE4eQVSCqC0R1wYI6azKPidmyVDiMveX4VsrDygRxm
X-Gm-Gg: AZuq6aLd1yHlKUG0uBOGLKVGZ8zHapEMQvhg+I0CwBlprdn5SiBhyKytTfYWy8ZjEXF
	1qli/n+bexZCYsxLuZt8zC8uW02dbfyKN8s7KOosKwOMBe6P6T5Q/ZAyXsXR1cCWa+BhgZBjEfU
	N08NrsTqyyezyiv14i2vIRP4uzsGZS7TgpTgj4ICWbbxnJlqDEFitGj6yXiMKeQxwCQSjx5cAtn
	ylLrO76ogasfLvjFuxp6eQfhlw7gXJcWKMeZEuHZ6ijdMmkcn0gdyJO3evWGLJysItTOSF3j/fm
	sxWrTwp7MhrWux0Zn6+tWeQnbbDu1PeaiQ38f96FFSQ1r6ExHM9yaYQqWfKFdmaD57wc4Qds2pz
	stKh4wg/p0vicAdaeUBuGZwWP3UAleoCc539T+aaQpOsvj7QyN3dZocD1Ne51DXpJwWmft7kMbo
	5kjlRCFWtPuSvNwQLufOmC6XvrWK8NPjgFBC16S6rYBy4MjhaiYszRcX0G6uDF5uf6KtCam/GRZ
	o3PEwmV6g==
X-Received: by 2002:a05:600c:6814:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-48379c14894mr176131575e9.33.1771310469549;
        Mon, 16 Feb 2026 22:41:09 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm33081811f8f.38.2026.02.16.22.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:09 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Tue, 17 Feb 2026 10:10:47 +0330
Message-Id: <20260217064050.18388-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52950-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6A4C149099
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


Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  87 ++++++++--
 3 files changed, 142 insertions(+), 108 deletions(-)

-- 
2.34.1


