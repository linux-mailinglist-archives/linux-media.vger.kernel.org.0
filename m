Return-Path: <linux-media+bounces-27675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C294A543B7
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D8218953B7
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 07:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79101DA634;
	Thu,  6 Mar 2025 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DxA1Rxkz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8834817C98;
	Thu,  6 Mar 2025 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741246189; cv=pass; b=nLYUOEnXILfCa/uWZWkGd4fqd+/zt3rr4mnO9rhHEOI1s6Adm+dqVadqxarlPLUv9ElAfou+VilJUpY48BJOZcFsJPwETXOF//73NBscuAa7I7ThFnNFvARHMY0tYUtZ6ikyUj8UbjACFRMrprbjXliIvVEeLcHTcqCwiIuwOx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741246189; c=relaxed/simple;
	bh=DKSi9u2lyYGyG8ovNSxK0hQqYpa87dcz8WBu5vGJlmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6TkOAEj80cqmVOBNAMRrlhlrKxQOyNiNTAj7D+ioFJhTbKOxUpJyGx8FZzFFTyn2UuGp48bDy/v4KX8B7/xCyXwWvSJV/HyUMkROb8afxAcTEg5DaoJnYDkVBg49NWaQqOIBC5ySG0PTrRkrOxGlF8XIQpFWQHhvNLjyPWjI/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=DxA1Rxkz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741246143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c/yQTHOLv4qWM64Fk26TKWzOfJ/16BqZ0lTRGc0kVMHAL3eVYX2PRPkIEELh8j48un+5A5L8xYCoowD5QtBdq9RdPpfKjkH5RWRTbQhRsAKWCdJbkdN4bG6WiBmTsNDoDv5logL2j+frfZn6uc/MpaMmxsoKoUxyiHuRpUELqmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741246143; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q5GzDG7AmYcYGiYR79yXGNLNOCQIbUs0T12AgbvzwoY=; 
	b=HcDfXu3nMO6JF7g2nkP6iyRPct4PDNiLw7GF71RU+Ds0Fdwj+nW6v+RQVm5ddWMEH7ARJttpu/0oUqNAite8Lo8oEQSVvRIaQ8fOyF4D0M5El80cthX5F3uxCe1US2lhujNerjf/sCdmkpfYF6pmld6XWwh+3VoOi8PDPqfh+AQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741246143;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Q5GzDG7AmYcYGiYR79yXGNLNOCQIbUs0T12AgbvzwoY=;
	b=DxA1Rxkz37IjAc9PReY8ChI6Q9UeQv5KlZiJ2YXRCKHzn5/J/hZCEFMz7gRmClZ+
	qYUmJrjwIAlD2wDKiKZeq9Kfdgqt8s3fXJJEDqcdguP32VTzoo76rActamK77RWA8I+
	k2zPgNpLWo5EEbKI8MGjqKqOK/Wuda0caSWKOX64=
Received: by mx.zohomail.com with SMTPS id 1741246140957278.66045443101154;
	Wed, 5 Mar 2025 23:29:00 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v14 0/3] Enable HDMI RX controller on RK3588
Date: Thu,  6 Mar 2025 10:28:39 +0300
Message-ID: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hello Heiko,

This is a follow up to the v13 of HDMI RX patches [1]. Hans queued the
driver into the media tree. Now the DT patches are left to apply, could
you please take care of this series if it's good to you? Thanks

[1] https://lore.kernel.org/linux-media/20250304085819.108067-1-dmitry.osipenko@collabora.com/

Changelog:

v14: - Re-enabled LOAD_DEFAULT_EDID=y option in the defconfig and
       added ack from Hans Verkuil fot that patch.

Sebastian Reichel (2):
  arm64: dts: rockchip: Enable HDMI receiver on rock-5b
  arm64: defconfig: Enable Synopsys HDMI receiver

Shreeya Patel (1):
  arm64: dts: rockchip: Add device tree support for HDMI RX Controller

 .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b.dts      | 18 ++++++
 arch/arm64/configs/defconfig                  |  2 +
 4 files changed, 91 insertions(+)

-- 
2.48.1


