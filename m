Return-Path: <linux-media+bounces-11863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D786F8CED1A
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 02:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F3C71C212B3
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 00:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE05A7E8;
	Sat, 25 May 2024 00:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HW4R+HEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8317C;
	Sat, 25 May 2024 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595364; cv=none; b=rJMUpvlVu/p050uy6nogGvD71kYchgkDTZOndEQYgb0AXnI0OEgFTIMceXpbjrUsvvpLU3QjUu/SLzJQdc/k8hmoh+korE3KZkUeA7gsNQYOikH5g2NUs6xj+wIB/6L5ZWUtG7u0qLH4WqrmxaCNpUUX+QGUZ45rXsgt1DRVjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595364; c=relaxed/simple;
	bh=GcrTiyByH5+18n1vWCtmSt7AQ016svnrLFan+IzQNBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9ccXz/IxrjRDpkcX42Ne0VNoIRw8x3NCBVjMgAEymfDvMq/zBOviPF0HmcATnLJYHU1ypgcIpo8+NoXGJ0VGrxF9Mibiem+EmDqRwuBxObLy0MTnqLlIwWKkOhF8nLkPdtP178NsRO8iCbLSQTjgO9mgPw1Cx09KXy6Q8Kh2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HW4R+HEZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=/aGYvkafH4x8wVA6tudv82TT2LfFSiKxcL7mUJ16X7k=; b=HW4R+HEZJ3Duk2wz
	NaZRvzTo1ijphCTPDHwKqwB4MX8ECD8K4giUsbxKbjJu1RhbAnPPPIlP+YXZ5h90sU2rikwClzPmu
	K4zUuWTuTbGI3QLEjNdp7f4+URdThRWOR2vELcEB26pAV6iMukOE0eQP5bxZ2ATpd5T3F3G2RvblG
	veYoquPIMS1uAi44pqvHT6mT1b+N+zpfWF4FYxaCd+yndrIwf9ybSWr7F8Jtgvk/HTx5XRfobUTfs
	i0AFdlPddHCYVYp3BLyn4gB2cHaU9iw8o3Awc7cdFjk9hLv4hsrT1KCayCBtJ0ptroiksqNKM8pSL
	+CjXWiFmSLgQprWTiw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAerk-002TKv-10;
	Sat, 25 May 2024 00:02:28 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] Dead structs in media/platform
Date: Sat, 25 May 2024 01:01:43 +0100
Message-ID: <20240525000146.282500-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Clean out a bunch of dead structs in media/platform.
Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Dr. David Alan Gilbert (3):
  meida: amphion: remove unused struct 'vpu_malone_frame_buffer'
  media: m2m-deinterlace: remove unused struct 'vb2_dc_conf'
  media: tegra-vde: remove unused struct 'tegra_vde_h264_frame'

 drivers/media/platform/amphion/vpu_malone.c    | 5 -----
 drivers/media/platform/m2m-deinterlace.c       | 4 ----
 drivers/media/platform/nvidia/tegra-vde/h264.c | 5 -----
 3 files changed, 14 deletions(-)

-- 
2.45.1


