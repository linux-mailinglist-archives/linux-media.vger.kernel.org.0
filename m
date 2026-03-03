Return-Path: <linux-media+bounces-54409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJbJH/1up2ndhQAAu9opvQ
	(envelope-from <linux-media+bounces-54409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:30:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D924B1F85FD
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C5A31AFBC6
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 23:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CCB351C12;
	Tue,  3 Mar 2026 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n74hPDPB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864D33B6D9;
	Tue,  3 Mar 2026 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580399; cv=none; b=eD3xIb64viEQ2qrUMFwhA/oIhkm+F645eYpLbCNhuk/kgt4zHHcfaauUJg8vlN8o919q5Ia8Hh5FrW2xHM+ThrWOKdk1TyI+OUCvxFXKfFPTQkJrueZ7TWl7PzlGzeMgWEFeC/hf2kbgps/m68kom6KSqZcztTxb30571jizBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580399; c=relaxed/simple;
	bh=nFeGYlARoMmzZtAGsU/X82xVpzi4kLYOlHaX8giYd9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPvE0aI6alHYDEQtjXO8sBU18SLamVpIP8Vzbx5zAt02AC4XATeMUZ9Wf1xFl28ZyTdrhcPMQjM6UTREsWDOtmsE16rNM5KczeXxFIENKu1q0pBCHHXb2BypaNs3DGHOlidZ+qrMt+xuLViSdlI4HqX9fyfeyqbn+GNpcM0Rn0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n74hPDPB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3BAC19422;
	Tue,  3 Mar 2026 23:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772580399;
	bh=nFeGYlARoMmzZtAGsU/X82xVpzi4kLYOlHaX8giYd9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n74hPDPBnyDxll6kkWMhhUWFfbWcwH/8WRXLFMaUYgecR4gZlQ+dQw2VHF2ZhjNAa
	 E9jLyiAa+ZjrDsvfh6sWHr4wyIfhVeKZ1zGPDiHa2FpJ4svToAB2X/fWKPhxgR3Nhq
	 Uedh+3NceAhz4ZZrYetl8IyG86Utio2s2PVc74N1TE/hqLkj53OKVz6hQF2BJn2ZeF
	 49JvQOQCig0vJCeroodg9zmBnAc+rJVHCWFcoRWH1nO44vwImg5Pjh+dlWx8/HdJsP
	 q0iKLAyAPld7Rl2zhZCYRGyOJkZd/oI3sdZXGePQub3DM9MpLJWtL0YgFWMuzxnsI7
	 GtsdiH/Gt5BsA==
Message-ID: <dde5f82a-9ff5-4f7c-9ef9-470aad17c9d0@kernel.org>
Date: Tue, 3 Mar 2026 23:26:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
 <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
 <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
 <4fea7117-ebd3-4279-9973-3ac4f2a78835@linaro.org>
 <bfTUflirC2qzMSllq_4qHGr3GL6TJ088yNF4lCBtjCoc1sXqz0KcfYyWuQv6TeRtP6GdpqllNp4ipl4Qax4xwQ==@protonmail.internalid>
 <f031acf1-9a03-42f9-b61f-b6fa6bf9100b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <f031acf1-9a03-42f9-b61f-b6fa6bf9100b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D924B1F85FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54409-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 03/03/2026 23:17, Vijay Kumar Tumati wrote:
> Sorry, I do not know about videocc.

I think Iris does those itself see:

                 iris: video-codec@aa00000 {
                         compatible = "qcom,x1e80100-iris", 
"qcom,sm8550-iris";

                         reg = <0 0x0aa00000 0 0xf0000>;
                         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;

                         power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
                                         <&videocc VIDEO_CC_MVS0_GDSC>,
                                         <&rpmhpd RPMHPD_MXC>,
                                         <&rpmhpd RPMHPD_MMCX>;
                         power-domain-names = "venus",
                                              "vcodec0",
                                              "mxc",
                                              "mmcx";

Still not getting an especially clear picture on what _levels_ you are 
proposing here for MXA - here are the three opps we have for the PHY.

Sorry I don't get how turbo is coming into this ..

+    csiphy_opp_table: opp-table-csiphy {
+        compatible = "operating-points-v2";
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+            required-opps = <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>;
+        };
+    };

---
bod

