Return-Path: <linux-media+bounces-65246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cud/CkPTNGp2hwYAu9opvQ
	(envelope-from <linux-media+bounces-65246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:27:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A793A6A3F0D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=uSLul4gE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65246-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65246-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BA0C302D758
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A493246EB;
	Fri, 19 Jun 2026 05:27:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD733B6F9;
	Fri, 19 Jun 2026 05:27:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846829; cv=none; b=qPAfirQ/UaK8zbczVXNdNaifWC6X0zE8VXzUGcrW8OKd8PI0FYvTbZJmpgO4uBc+OlrZMXSAFXHbMs1BoUDaigkvd+vbxykLez/nv+vVyVQPT5/K5JGHuMOk2bhM9fii7zetYgBCtyQ/BCZEJm7mHTla/g/i4padJvz3XDWaSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846829; c=relaxed/simple;
	bh=VmrlQL2ewOl0Oaj0OE/GsXfoUeFL3zFnMoITGcH5zcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOfLlTEKLzplfKHtk4fDjUWiGcrzYfbmK3GXcddVspzdeNA0ZxLa7DmZGn9f4Z7WPnMhxW6Le0TrRdp/9lQcGpPf2xP+wzmwnG4ZYolJzzc8po+vNtx3u1wf6spC5YT3PxpBO1w9Lih2qnp07YIFS1wrcXuwnF5ddqv3tufSQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uSLul4gE; arc=none smtp.client-ip=213.167.242.64
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4F881E79;
	Fri, 19 Jun 2026 07:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846791;
	bh=VmrlQL2ewOl0Oaj0OE/GsXfoUeFL3zFnMoITGcH5zcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSLul4gEJ4GyrFBDapIUFwMMAiQLdQ9mbh7jW2hfjwD+Ad8uvT7S2jcaHdW1wadan
	 38cppBeEDl6VS5KaljCtKm4Pwp+EUO++7Ock4M29zsPlv16app8cpUo/Sxq8MXHURw
	 px9HmOJtv88s0FVf8V82YbfD8EqTo8SRzhtcqgYo=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 2/6] arm64: dts: rockchip: rk3588s-base: Connect vicap and isps
Date: Fri, 19 Jun 2026 14:26:29 +0900
Message-ID: <20260619052637.1110672-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:heiko@sntech.de,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65246-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A793A6A3F0D

Add a connection between VICAP and the two ISPs.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 55c5c603c1e3..f36267720910 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1493,10 +1493,16 @@ vicap_mipi5: port@6 {
 
 			vicap_toisp0: port@10 {
 				reg = <16>;
+				vicap_toisp0_ep: endpoint {
+					remote-endpoint = <&isp0_tovicap>;
+				};
 			};
 
 			vicap_toisp1: port@11 {
 				reg = <17>;
+				vicap_toisp1_ep: endpoint {
+					remote-endpoint = <&isp1_tovicap>;
+				};
 			};
 		};
 	};
@@ -3551,6 +3557,18 @@ isp0: isp@fdcb0000 {
 		power-domains = <&power RK3588_PD_VI>;
 		iommus = <&isp0_mmu>;
 		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				isp0_tovicap: endpoint {
+					remote-endpoint = <&vicap_toisp0_ep>;
+				};
+			};
+		};
 	};
 
 	isp0_mmu: iommu@fdcb7f00 {
@@ -3580,6 +3598,18 @@ isp1: isp@fdcc0000 {
 		power-domains = <&power RK3588_PD_ISP1>;
 		iommus = <&isp1_mmu>;
 		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				isp1_tovicap: endpoint {
+					remote-endpoint = <&vicap_toisp1_ep>;
+				};
+			};
+		};
 	};
 
 	isp1_mmu: iommu@fdcc7f00 {
-- 
2.47.2


