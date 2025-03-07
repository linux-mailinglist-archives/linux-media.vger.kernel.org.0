Return-Path: <linux-media+bounces-27800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33FA5638D
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F9B189646C
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6973120C002;
	Fri,  7 Mar 2025 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Fp5PVAF4"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1E202F7C;
	Fri,  7 Mar 2025 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339206; cv=pass; b=AVQAjAYWwei499WQ9TF4wuTbJci+2zSeuhT/1NDvvUtnqQkiAeK50XcVrwlPLmEGjO6L33dAlnq0abS3GviKfvV4GE8Ce6aSvgFGDq4LcwXwKv3WG75PLjQ/gXjCvDE4txMvaFvvdN4V3tN+g3g8AaZ48bzB1HZPrWfkPeVyv80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339206; c=relaxed/simple;
	bh=jUrvhgipRSKsV9fspYUX9sawmyPcGMvKxyVdOnY6q1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPWTs5QjdMgXRKXO8MYDt3bhavNZnjBaHjDOm86CEPDwxWmWrRvwjMMDLIiXlQJO8VcA+D02Ce7h5/gZF0hoixEBHXqQT9DVMQm9/8rF1G/vQIiLr+I0Hcmk9xjlqgUYJJa70ujjKNM8L7dOKaGK4I2vZfp4SIuZCZCPFdZUAWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Fp5PVAF4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741339167; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YzLv5mfAH80vIklSoxtki1XE1xukzSoJx+DZFYGrUjlaVCrBfVlbW1LSzEePYdft/6fBZd4kqZFM3uQXzdoTfv3O576rVIOPFW32z73WmtC2lBrPR+USd3UiE+UEAKDoMDb/T2G02K0Xciee43/frfADLlm43F0hB0li32TlNQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741339167; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LUZNNrGCHEYUgjWOR9Ax5bht229rw4nWFBraJsxlaPE=; 
	b=TGFwdRkdJonr6CPSFc/ZpIsek5gia7OVcotq8HEyp9Pz+4GX0Lfip3f/dju2tapNV8dXY26tu28YapNmgnxYU6Oa7A9qPZyjQSrqgma14h9xW+eJVGpNrS5oGzP+/c/BtFuC+byOhl1nKv+cyljb5R2RSfe27ecAGiIO5B5TZ9U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741339167;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LUZNNrGCHEYUgjWOR9Ax5bht229rw4nWFBraJsxlaPE=;
	b=Fp5PVAF4+1rEg26jqDlcAEt3Zg3RdUBbx44X+2gxEMzPzLggtHooz69rmZG0ijcB
	s5F1de6IYaLzTPvSlQn325Kwm4osUuB0Y5IW5RbpjH+U7Gq3b3XdlFEsl5IVelH6JD+
	jQrqXxgElspsPxrR1aVKzc0ePRCRzigtqqNalJo4=
Received: by mx.zohomail.com with SMTPS id 1741339164930302.9248701537149;
	Fri, 7 Mar 2025 01:19:24 -0800 (PST)
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
	Tim Surber <me@timsurber.de>
Subject: [PATCH v15 0/2] Enable HDMI RX controller on RK3588
Date: Fri,  7 Mar 2025 12:18:55 +0300
Message-ID: <20250307091857.646581-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Heiko,

This patchset adds HDMIRX controller node to RK3588 DTSI and enables
it on Rock 5b board.

Changelog:

v15: - Removed duplicated HDMIRX pinctrl definitions

     - Removed default M1 HDMIRX pinctrl assignment from the DTSI as
       technically HDMIRX can use M0 depending on a board configuration.

     - Changed ordering of the status DT property

v14: - Re-enabled LOAD_DEFAULT_EDID=y option in the defconfig and
       added ack from Hans Verkuil fot that patch.

Sebastian Reichel (1):
  arm64: dts: rockchip: Enable HDMI receiver on rock-5b

Shreeya Patel (1):
  arm64: dts: rockchip: Add device tree support for HDMI RX Controller

 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 55 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b.dts      | 17 ++++++
 2 files changed, 72 insertions(+)

-- 
2.48.1


