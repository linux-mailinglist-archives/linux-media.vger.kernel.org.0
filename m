Return-Path: <linux-media+bounces-51147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBiAHJThb2n8RwAAu9opvQ
	(envelope-from <linux-media+bounces-51147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 21:12:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1554B144
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 21:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0E6078CC936
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 19:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316BE47CC9C;
	Tue, 20 Jan 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HEkB8hj9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50354466B46;
	Tue, 20 Jan 2026 19:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937726; cv=none; b=FpFKNxYyPRFu4iTShv6i+nTSU5vXNCxR+g/eN7zYMjfSr1UobkV5s6TuCHlsd+vZ5KhG4bvYCCQV0OOJ1CC+5rFiTJFvGeeNNwuf7vMSHkiACHTNpHYySShx982CApMN7h8/WDCLCf5Ym+NBO+q2GsAH+44rHNwlGy2h2J25q7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937726; c=relaxed/simple;
	bh=/A4LHTEaDLHlh1euWJRWHRa4K1G1d6F3Yldk56r6Vwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLbyIRzbwYyN6M0PVW5sr0qzOSP+aLDiwiSTKnANadLll9iDCz85goxvmtM23t2RTIQpS8zDH0251w+8gXcfrwUrfcZ0Bb8d9ayuKwVRLn3fABSWFndjsWiiK1gzEojT/2VwfhbQiJbsQQzHa54cV8Ayejn0L9bz1fweZ5GpJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HEkB8hj9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768937718;
	bh=/A4LHTEaDLHlh1euWJRWHRa4K1G1d6F3Yldk56r6Vwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HEkB8hj9p8LUeEVWO84jAA1w6imq8/lvcrblLSPIsSdVFuaWpCQFeyddLMEHKlbHd
	 egJd9Dj+j0cp3z6GZ5iTIo2xsxPkXvsbNtrrTr4VxtSDty3h+qxFllrmSYUXemBKRH
	 SdM1+l/XaBTa0a/6JWOcSuTmrsHDbFJBpogFOLbNw0DHNntMl/BKh325pTHNQqE0CT
	 J7VIGf1cE80Xck61pu20DlmoemnH7EvVMGDpV0s2gGAka8NRnBApD8E4I6oKW82YjE
	 DNHOFWvze6eVrxkEFl3jHua9Y4e8PTuh1cgMRaOEC7S/wYFJOg85CsZ1CG5NH9R4/1
	 Wcog+W21XTcMg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAA5817E0FDB;
	Tue, 20 Jan 2026 20:35:17 +0100 (CET)
Message-ID: <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
Date: Tue, 20 Jan 2026 20:35:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: fixup! media: synopsys: add driver for the designware mipi csi-2
 receiver
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
 <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51147-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 1B1554B144
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make smatch happy by adding braces around the initialization in switch
cases.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
@Sakari could you try the following patch? I think this should solve the
issues with smatch/sparse you mentioned off-list.

 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 29119a1a8d38..dc82223e312a 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -236,7 +236,7 @@ static int dw_mipi_csi2rx_start(struct
dw_mipi_csi2rx_device *csi2)
                return link_freq;

        switch (csi2->bus_type) {
-       case V4L2_MBUS_CSI2_DPHY:
+       case V4L2_MBUS_CSI2_DPHY: {
                struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;

                ret =
phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
@@ -254,7 +254,7 @@ static int dw_mipi_csi2rx_start(struct
dw_mipi_csi2rx_device *csi2)

                control |= SW_CPHY_EN(0);
                break;
-
+       }
        case V4L2_MBUS_CSI2_CPHY:
                /* TODO: implement CPHY configuration */
                return -EOPNOTSUPP;
@@ -293,7 +293,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
        struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);

        switch (code->pad) {
-       case DW_MIPI_CSI2RX_PAD_SRC:
+       case DW_MIPI_CSI2RX_PAD_SRC: {
                const struct v4l2_mbus_framefmt *sink_fmt;

                if (code->index)
@@ -304,6 +304,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
                code->code = sink_fmt->code;

                return 0;
+       }
        case DW_MIPI_CSI2RX_PAD_SINK:
                if (code->index > csi2->formats_num)
                        return -EINVAL;

-- 
2.39.5


