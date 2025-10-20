Return-Path: <linux-media+bounces-45083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A4BF3576
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7029B40704F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F75B2DCBF7;
	Mon, 20 Oct 2025 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="KBsTxJ7w"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B232517B9
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991119; cv=pass; b=tS/CevExTYeTuCVbiapwjY2IVg5HXvI1j6yI8zhRSM0k3neA3lilb6O9j8aL+t5hEHM7Zib63ar4yG6iNDSBDRpQLhVVxDL3bwnOmbPbGnA+bIVcTd3DRBRqz7VxhY5NeJaawaC4mRFAq4n0QwyDP+5tH4D5m96QZLFYcqTi1DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991119; c=relaxed/simple;
	bh=xMDtqSaSDLla3MfAViRIl2ZDMh5eZ5tWA7/1g+hpjjw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U19ZWt/08ixFsWYnhfH1HiTjkbdSaF9Ygs0BgTpGWeVxWvgd/mjZfjOyYENzjSIhuAGKmfoQ4unPT40k9CgFmVoSm5NqNMO95+rxdQDpDYlko0//jGtckDq5meTHC5kWPtrlctmZqg0X+b+ypkvnPUeqX4znckPn7wCpKw3gkGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=KBsTxJ7w; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cr65k6htMzySS
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 23:11:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1760991115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=dUfb3z8teup+VFkJqmMn1ZRWP00XhCfjdbtgaFAwa2w=;
	b=KBsTxJ7wx8u5XMf4s49N4p7bxjecX+sDWENjLAceIC6qr9ETJfZnmN4QYRTvFk4DGoQe8a
	0qMWi/7VLJ1JVyTohQPdW2GCEbrhc7dqwaZ3TFLu9iJaF1PXM0mHnFLedNOj7+bfLXcpI2
	uxxU0Spvqjj+Q0e8A0UHV8+CXaOa5wk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1760991115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=dUfb3z8teup+VFkJqmMn1ZRWP00XhCfjdbtgaFAwa2w=;
	b=JLYusK/wNxHubPlZtB8OrAyXO1ScI6yTNVfHkfFOGhG63YcRbR9t7YELzC7aUEnr4w52YE
	8/cvzkUqc7Y/bw0SG2ekZ3qYw6QERCtjkjfL+Sy21wKoXcyWAeoC1O6TyVvAWP7JJJDORB
	JI+OnXJa8TLxomvGRNXsxnbZqxTG+cY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1760991115; a=rsa-sha256; cv=none;
	b=Kzqidm0mJT1myjKPd7C3xB/zDmcmhHYOMnVE/LGYoLP74dGVaeM1w2yMqZjupJjUYzecfh
	XG1hijlqTRhvr12ftSPZMNz2edvsvXDXpZ9q8HsD2ZTmhZqJ1R7TiSSZYaKCyTkeQMbv/h
	5dNgzLX28BmQqYMtY31Ho0KEWRkKFpY=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A495E634C50
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 23:11:54 +0300 (EEST)
Date: Mon, 20 Oct 2025 23:11:54 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.18] Privacy LED rename
Message-ID: <aPaXilzj5mwlgkog@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

This renames "privacy-led" LED as "privacy", which is aligned with
<URL:https://lore.kernel.org/all/20250910-leds-v5-0-bb90a0f897d5@vinarskis.com/>
(already merged for v6.18-rc1).

Please pull.


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.18-1.1-signed

for you to fetch changes up to bfd7d2327918898f4259a0efaa3d0b9c13dd1fd5:

  media: v4l2-subdev / pdx86: int3472: Use "privacy" as con_id for the privacy LED (2025-10-20 11:59:43 +0300)

----------------------------------------------------------------
Rename "privacy-led" LED as "privacy" in V4L2 as well as in int3472.

----------------------------------------------------------------
Hans de Goede (1):
      media: v4l2-subdev / pdx86: int3472: Use "privacy" as con_id for the privacy LED

 drivers/media/v4l2-core/v4l2-subdev.c    | 2 +-
 drivers/platform/x86/intel/int3472/led.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Kind regards,

Sakari Ailus

